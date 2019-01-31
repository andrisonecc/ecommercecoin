#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

ECOMMERCECOIND=${ECOMMERCECOIND:-$BINDIR/ecommercecoind}
ECOMMERCECOINCLI=${ECOMMERCECOINCLI:-$BINDIR/ecommercecoin-cli}
ECOMMERCECOINTX=${ECOMMERCECOINTX:-$BINDIR/ecommercecoin-tx}
ECOMMERCECOINQT=${ECOMMERCECOINQT:-$BINDIR/qt/ecommercecoin-qt}

[ ! -x $ECOMMERCECOIND ] && echo "$ECOMMERCECOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
ECCVER=($($ECOMMERCECOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for ecommercecoind if --version-string is not set,
# but has different outcomes for ecommercecoin-qt and ecommercecoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$ECOMMERCECOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $ECOMMERCECOIND $ECOMMERCECOINCLI $ECOMMERCECOINTX $ECOMMERCECOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${ECCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${ECCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
