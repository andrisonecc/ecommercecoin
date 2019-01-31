#ifndef ECOMMERCECOIN_QT_TEST_WALLETTESTS_H
#define ECOMMERCECOIN_QT_TEST_WALLETTESTS_H

#include <QObject>
#include <QTest>

class WalletTests : public QObject
{
    Q_OBJECT

private Q_SLOTS:
    void walletTests();
};

#endif // ECOMMERCECOIN_QT_TEST_WALLETTESTS_H
