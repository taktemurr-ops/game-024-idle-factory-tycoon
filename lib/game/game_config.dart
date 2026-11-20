import 'package:flutter/material.dart';

import '../app/arcade_stage.dart';
import '../app/game_api.dart';
import '../core/game_rules.dart';
import 'tycoon_engine.dart';
import 'rules.dart';
import 'tycoon_view.dart';

const _theme = TycoonTheme(Color(0xFF495057), Color(0xFF343A40), Color(0xFFFFB703));



final gameConfig = GameConfig(
  gameId: 'game-024-idle-factory-tycoon',
  title: const ['Fabrika Patronu', 'Idle Factory Tycoon', 'Idle Factory Tycoon', 'Idle Factory Tycoon', 'Idle Factory Tycoon'],
  tagline: const ['Üretim hatları kur, zengin ol!', 'Build production lines and get rich!', 'Build production lines and get rich!', 'Build production lines and get rich!', 'Build production lines and get rich!'],
  seedColor: const Color(0xFFFFB703),
  icon: Icons.precision_manufacturing,
  rules: FactoryRules(),
  buildPlay: (ctx) => ArcadeStage(
    ctx: ctx,
    create: () => TycoonSim((ctx.generated as GeneratedLevel<TycoonLevel>).puzzle),
    paint: (c, s, p, t) => paintTycoon(c, s, p, t, ctx.lang == 'tr', _theme),
    sound: tycoonSound,
    boosterIcon: Icons.bolt,
    boosterLabel: (l) => l == 'tr' ? 'Çılgın üretim' : 'Production frenzy',
    howTo: const [
      'Üretim zinciri kur, ürünler otomatik satılır; hedef geliri yakala.',
      'Build a production chain, goods sell automatically; hit the revenue goal.',
      'Baue Produktionsketten und erreiche das Umsatzziel.',
      'Construye cadenas de producción y alcanza el objetivo.',
      'Construisez des chaînes et atteignez l\'objectif.',
    ],
  ),
  tutorial: const [
    TutorialStep(Icons.touch_app, [
      'Kartlara dokun: bina al. Sarı fiyat = alınabilir.',
      'Tap cards to buy. Yellow price = affordable.',
      'Karten antippen zum Kaufen.',
      'Toca las cartas para comprar.',
      'Touchez les cartes pour acheter.',
    ]),
    TutorialStep(Icons.pan_tool, [
      'Sahneye dokun: çalış, hasat et veya ilk müşteriye hemen servis yap.',
      'Tap the scene: work, harvest or serve the first customer.',
      'Szene antippen: arbeiten oder ernten.',
      'Toca la escena: trabajar o cosechar.',
      'Touchez la scène : travailler ou récolter.',
    ]),
    TutorialStep(Icons.bolt, [
      'Çılgın üretim güçlendirmesi 20 sn boyunca üretimi ikiye katlar.',
      'Production frenzy doubles output for 20 s.',
      'Produktionsrausch verdoppelt 20 s.',
      'Frenesí duplica la producción 20 s.',
      'Frénésie : production ×2 pendant 20 s.',
    ]),
  ],
);
