import '../core/arcade.dart';
import '../core/missions.dart';
import '../core/stats.dart';
import 'factory_spec.dart';
import 'tycoon_rules.dart';

class FactoryRules extends TycoonRules {
  FactoryRules()
      : super(factorySpec, 'game-024-idle-factory-tycoon', const [
          GameStat('money_earned', 'Toplam ciro', 'Total revenue', scale: 10000),
          GameStat('buildings_bought', 'Kurulan makine', 'Machines built', scale: 40),
          GameStat('customers_served', 'Sevkiyat', 'Shipments', scale: 20),
        ], const [
          MissionTemplate('money_earned', 'money_earned', [3333, 6666, 10000]),
          MissionTemplate('buildings_bought', 'buildings_bought', [13, 26, 40]),
        ]);
}

ArcadeRules createRules() => FactoryRules();
