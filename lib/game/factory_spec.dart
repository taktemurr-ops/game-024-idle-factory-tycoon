import 'tycoon_engine.dart';

const factorySpec = TycoonSpec(
  res: [
    Res('cash', 'Nakit', 'Cash', 0xFFFFD60A),
    Res('ore', 'Cevher', 'Ore', 0xFFB08968, sell: 0.4, keep: 30, value: 0.4),
    Res('bar', 'Külçe', 'Bar', 0xFFADB5BD, sell: 2.0, keep: 20, value: 2),
    Res('gear', 'Dişli', 'Gear', 0xFF8ECAE6, sell: 7, keep: 12, value: 7),
    Res('robot', 'Robot', 'Robot', 0xFFEF476F, sell: 70, value: 70),
  ],
  blds: [
    Bld('mine', 'Maden ocağı', 'Ore mine', 15, make: {1: 1.0}, start: 1, shape: 6, color: 0xFFB08968),
    Bld('smelter', 'Ergitme fırını', 'Smelter', 60, make: {2: 0.5}, use: {1: 1.0}, shape: 1, color: 0xFFE76F51),
    Bld('drill', 'Otomatik matkap', 'Auto drill', 140, make: {1: 3.5}, shape: 3, color: 0xFF6C757D),
    Bld('press', 'Pres', 'Gear press', 260, make: {3: 0.5}, use: {2: 1.0}, unlockRes: 2, unlockAt: 25, shape: 1, color: 0xFF457B9D),
    Bld('conveyor', 'Konveyör', 'Conveyor', 200, boost: 0.08, shape: 2, color: 0xFFADB5BD),
    Bld('furnace', 'Yüksek fırın', 'Blast furnace', 600, make: {2: 2.2}, use: {1: 4.4}, unlockRes: 2, unlockAt: 60, shape: 1, color: 0xFFD62828),
    Bld('assembler', 'Montaj hattı', 'Assembly line', 1400, make: {4: 0.15}, use: {3: 1.5}, unlockRes: 3, unlockAt: 30, shape: 1, color: 0xFFEF476F),
    Bld('excavator', 'Ekskavatör', 'Excavator', 900, make: {1: 12}, unlockRes: 2, unlockAt: 100, shape: 6, color: 0xFFFFB703),
    Bld('cnc', 'CNC tezgâhı', 'CNC mill', 2200, make: {3: 2.0}, use: {2: 4.0}, unlockRes: 3, unlockAt: 80, shape: 1, color: 0xFF219EBC),
    Bld('logistics', 'Lojistik merkezi', 'Logistics hub', 2600, boost: 0.25, unlockRes: 3, unlockAt: 120, shape: 5, color: 0xFF2A9D8F),
    Bld('ai', 'Yapay zekâ', 'AI controller', 5000, boost: 0.5, unlockRes: 4, unlockAt: 10, shape: 4, color: 0xFF5E60CE),
  ],
  startMoney: 40,
  clickMoney: 2,
  goal: TGoal.earn,
  goalTr: 'Ciro',
  goalEn: 'Revenue',
);
