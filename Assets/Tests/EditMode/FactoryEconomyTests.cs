using System;
using NUnit.Framework;
using GameStudio.IdleFactory;

namespace GameStudio.IdleFactory.Tests
{
    public class FactoryEconomyTests
    {
        [Test] public void ProductionIsDeterministic()
        {
            var factory = new FactoryEconomy();
            factory.Tick(10);
            Assert.AreEqual(10, factory.Inventory);
            Assert.AreEqual(10, factory.TotalProduced);
        }

        [Test] public void SellingTransfersInventoryToCash()
        {
            var factory = new FactoryEconomy();
            factory.Tick(10);
            Assert.AreEqual(25, factory.Sell(5));
            Assert.AreEqual(125, factory.Cash);
            Assert.AreEqual(5, factory.Inventory);
        }

        [Test] public void UpgradeCostsCashAndIncreasesOutput()
        {
            var factory = new FactoryEconomy();
            Assert.IsTrue(factory.TryUpgrade());
            Assert.AreEqual(50, factory.Cash);
            factory.Tick(3);
            Assert.AreEqual(6, factory.Inventory);
        }

        [Test] public void SaveRestorePreservesEconomy()
        {
            var factory = new FactoryEconomy();
            factory.Tick(8);
            factory.Sell(3);
            var restored = FactoryEconomy.Restore(factory.Save());
            Assert.AreEqual(factory.Cash, restored.Cash);
            Assert.AreEqual(factory.Inventory, restored.Inventory);
            Assert.AreEqual(factory.TotalProduced, restored.TotalProduced);
        }

        [Test] public void InvalidActionsCannotGenerateFreeCash()
        {
            var factory = new FactoryEconomy();
            Assert.Throws<ArgumentOutOfRangeException>(() => factory.Tick(-1));
            Assert.Throws<ArgumentOutOfRangeException>(() => factory.Sell(1));
            Assert.AreEqual(100, factory.Cash);
        }

        [Test] public void InvalidSnapshotIsRejected()
        {
            Assert.Throws<ArgumentException>(() => FactoryEconomy.Restore(new FactorySnapshot(10, 20, 1, 5)));
        }
    }
}
