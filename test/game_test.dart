import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hayatta_kalma/oyun_hayatta_kalma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(issizKiyiConfig.title.length, 33);
    expect(issizKiyiConfig.tagline.length, 33);
    for (final s in issizKiyiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(issizKiyiConfig.gameId, issizKiyiId);
    expect(issizKiyiRules.gameId, issizKiyiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(issizKiyiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: issizKiyiId, optionalMechanics: issizKiyiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(issizKiyiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
