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
  UrlParts
} from '../Shared/GameTestKit';

export default function concurrencyControlTest() {
  describe('ConcurrencyControl_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'concurrency_control suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'concurrency_control suite end');
    });

    // Scenario: concurrency_control_scenario_8574400_session_start_cycles
    it('concurrency_control_scenario_8574400_session_start_cycles', 0, async () => {
      const caseSeed: number = 8574400;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8574400);
    });

    // Scenario: concurrency_control_scenario_8574401_paddle_step_sequence
    it('concurrency_control_scenario_8574401_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8574401;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(8574401);
    });

    // Scenario: concurrency_control_scenario_8574402_catalog_lookup_start
    it('concurrency_control_scenario_8574402_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8574402;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8574402);
    });

    // Scenario: concurrency_control_scenario_8574403_pipeline_round_trip
    it('concurrency_control_scenario_8574403_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8574403;
      const payload: string = '_main.paddle.moveLeft(); // case 8574403';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8574403);
    });

    // Scenario: concurrency_control_scenario_8574404_settings_zoom_true
    it('concurrency_control_scenario_8574404_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8574404;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8574404);
    });

    // Scenario: concurrency_control_scenario_8574405_layout_custom_columns
    it('concurrency_control_scenario_8574405_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8574405;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8574405);
    });

    // Scenario: concurrency_control_scenario_8574406_score_accumulation
    it('concurrency_control_scenario_8574406_score_accumulation', 0, async () => {
      const caseSeed: number = 8574406;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(8574406);
    });

    // Scenario: concurrency_control_scenario_8574407_brick_grid_progress
    it('concurrency_control_scenario_8574407_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8574407;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(8574407);
    });

    // Scenario: concurrency_control_scenario_8574408_locale_lookup_en
    it('concurrency_control_scenario_8574408_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8574408;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8574408);
    });

    // Scenario: concurrency_control_scenario_8574409_validation_report_count
    it('concurrency_control_scenario_8574409_validation_report_count', 0, async () => {
      const caseSeed: number = 8574409;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8574409);
    });

    // Scenario: concurrency_control_scenario_8574410_url_with_query
    it('concurrency_control_scenario_8574410_url_with_query', 0, async () => {
      const caseSeed: number = 8574410;
      const url: string = SAMPLE_GAME_URL + '?case=95';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8574410);
    });

  });
}
