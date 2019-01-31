// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef ECOMMERCECOIN_QT_ECOMMERCECOINADDRESSVALIDATOR_H
#define ECOMMERCECOIN_QT_ECOMMERCECOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class EcommercecoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit EcommercecoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Ecommercecoin address widget validator, checks for a valid ecommercecoin address.
 */
class EcommercecoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit EcommercecoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // ECOMMERCECOIN_QT_ECOMMERCECOINADDRESSVALIDATOR_H
