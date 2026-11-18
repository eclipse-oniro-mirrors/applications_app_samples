/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_SETTLE,
  getDriver,
  serializedDelay,
  triggerGamePage,
  pressAndWait
} from '../Shared/SharedDriver';
import {
  SAMPLE_GAME_URL,
  ORIENTATION_LANDSCAPE,
  GameScript,
  ScriptCatalog,
  InjectionPipeline,
  GameSession,
  PaddleModel,
  WebSettingsProfile,
  LayoutProfile,
  ScoreBoard,
  BrickGrid,
  LocaleCatalog,
  ValidationReport
} from '../Shared/GameModel';
import {
  UrlParts,
  GeometryBox,
  CircularBuffer
} from '../Shared/GameTestKit';

export default function longTermStabilityTest() {
  describe('LongTermStability_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'long_term_stability suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'long_term_stability suite end');
    });

    // Scenario: long_term_stability_scenario_9964800_session_start_cycles
    it('long_term_stability_scenario_9964800_session_start_cycles', 0, async () => {
      const caseSeed: number = 9964800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9964800);
    });

    // Scenario: long_term_stability_scenario_9964801_paddle_step_sequence
    it('long_term_stability_scenario_9964801_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9964801;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9964801);
    });

    // Scenario: long_term_stability_scenario_9964802_catalog_lookup_start
    it('long_term_stability_scenario_9964802_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9964802;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9964802);
    });

    // Scenario: long_term_stability_scenario_9964803_pipeline_round_trip
    it('long_term_stability_scenario_9964803_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9964803;
      const payload: string = '_main.paddle.moveLeft(); // case 9964803';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9964803);
    });

    // Scenario: long_term_stability_scenario_9964804_settings_zoom_true
    it('long_term_stability_scenario_9964804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9964804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9964804);
    });

    // Scenario: long_term_stability_scenario_9964805_layout_custom_columns
    it('long_term_stability_scenario_9964805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9964805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9964805);
    });

    // Scenario: long_term_stability_scenario_9964806_score_accumulation
    it('long_term_stability_scenario_9964806_score_accumulation', 0, async () => {
      const caseSeed: number = 9964806;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(9964806);
    });

    // Scenario: long_term_stability_scenario_9964807_brick_grid_progress
    it('long_term_stability_scenario_9964807_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9964807;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9964807);
    });

    // Scenario: long_term_stability_scenario_9964808_locale_lookup_en
    it('long_term_stability_scenario_9964808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9964808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9964808);
    });

    // Scenario: long_term_stability_scenario_9964809_validation_report_count
    it('long_term_stability_scenario_9964809_validation_report_count', 0, async () => {
      const caseSeed: number = 9964809;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9964809);
    });

    // Scenario: long_term_stability_scenario_9964810_url_with_query
    it('long_term_stability_scenario_9964810_url_with_query', 0, async () => {
      const caseSeed: number = 9964810;
      const url: string = SAMPLE_GAME_URL + '?case=0';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9964810);
    });

    // Scenario: long_term_stability_scenario_9964811_geometry_area
    it('long_term_stability_scenario_9964811_geometry_area', 0, async () => {
      const caseSeed: number = 9964811;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9964811);
    });

    // Scenario: long_term_stability_scenario_9964812_circular_buffer_capacity
    it('long_term_stability_scenario_9964812_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9964812;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9964812);
    });

  });
}
