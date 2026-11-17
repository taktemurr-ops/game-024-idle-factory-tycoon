using System;
using System.Collections.Generic;

namespace GameStudio.IdleFactory
{
    // Pure simulation: no ad, purchase or network dependency in the core loop.
    public sealed class FactoryEconomy
    {
        public long Cash { get; private set; }
        public long Inventory { get; private set; }
        public int Level { get; private set; }
        public long TotalProduced { get; private set; }
        public FactoryEconomy(long startingCash = 100)
        {
            if (startingCash < 0) throw new ArgumentOutOfRangeException(nameof(startingCash));
            Cash = startingCash;
            Level = 1;
        }

        public long UpgradeCost { get { return checked(50L * Level * Level); } }
        public long ProductionPerTick { get { return Level; } }

        public void Tick(int ticks = 1)
        {
            if (ticks < 0 || ticks > 86400) throw new ArgumentOutOfRangeException(nameof(ticks));
            long produced = checked(ProductionPerTick * ticks);
            Inventory = checked(Inventory + produced);
            TotalProduced = checked(TotalProduced + produced);
        }

        public long Sell(long quantity)
        {
            if (quantity <= 0 || quantity > Inventory) throw new ArgumentOutOfRangeException(nameof(quantity));
            long revenue = checked(quantity * 5L);
            Cash = checked(Cash + revenue);
            Inventory -= quantity;
            return revenue;
        }

        public bool TryUpgrade()
        {
            if (Level == 100 || Cash < UpgradeCost) return false;
            Cash -= UpgradeCost;
            Level++;
            return true;
        }

        public FactorySnapshot Save() { return new FactorySnapshot(Cash, Inventory, Level, TotalProduced); }

        public static FactoryEconomy Restore(FactorySnapshot snapshot)
        {
            if (snapshot == null || snapshot.Cash < 0 || snapshot.Inventory < 0 ||
                snapshot.Level < 1 || snapshot.Level > 100 || snapshot.TotalProduced < snapshot.Inventory)
                throw new ArgumentException("Invalid snapshot", nameof(snapshot));
            var result = new FactoryEconomy(snapshot.Cash);
            result.Level = snapshot.Level;
            result.Inventory = snapshot.Inventory;
            result.TotalProduced = snapshot.TotalProduced;
            return result;
        }
    }

    [Serializable]
    public sealed class FactorySnapshot
    {
        public long Cash;
        public long Inventory;
        public int Level;
        public long TotalProduced;
        public FactorySnapshot(long cash, long inventory, int level, long totalProduced)
        { Cash = cash; Inventory = inventory; Level = level; TotalProduced = totalProduced; }
    }
}
