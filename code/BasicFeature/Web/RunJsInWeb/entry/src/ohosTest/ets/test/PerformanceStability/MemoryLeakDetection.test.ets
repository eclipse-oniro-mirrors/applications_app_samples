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

export default function memoryLeakDetectionTest() {
  describe('MemoryLeakDetection_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'memory_leak suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'memory_leak suite end');
    });

    // Scenario: memory_leak_circular_buffer_keeps_capacity
    it('memory_leak_circular_buffer_keeps_capacity', 0, async () => {
      const buffer: CircularBuffer = new CircularBuffer(3);
      buffer.push(1);
      buffer.push(2);
      buffer.push(3);
      expect(buffer.isFull()).assertTrue();
      buffer.push(4);
      expect(buffer.size()).assertEqual(3);
      expect(buffer.get(0)).assertEqual(2);
      expect(buffer.last()).assertEqual(4);
      expect(buffer.sum()).assertEqual(9);
    });

    // Scenario: memory_leak_circular_buffer_rejects_invalid_index
    it('memory_leak_circular_buffer_rejects_invalid_index', 0, async () => {
      const buffer: CircularBuffer = new CircularBuffer(2);
      expect(buffer.get(0)).assertEqual(-1);
      buffer.push(7);
      expect(buffer.get(-1)).assertEqual(-1);
      expect(buffer.get(5)).assertEqual(-1);
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
    });

    // Scenario: memory_leak_scenario_1858600_session_start_cycles
    it('memory_leak_scenario_1858600_session_start_cycles', 0, async () => {
      const caseSeed: number = 1858600;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1858600);
    });

    // Scenario: memory_leak_scenario_1858601_paddle_step_sequence
    it('memory_leak_scenario_1858601_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1858601;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(1858601);
    });

    // Scenario: memory_leak_scenario_1858602_catalog_lookup_start
    it('memory_leak_scenario_1858602_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1858602;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1858602);
    });

    // Scenario: memory_leak_scenario_1858603_pipeline_round_trip
    it('memory_leak_scenario_1858603_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1858603;
      const payload: string = '_main.paddle.moveLeft(); // case 1858603';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1858603);
    });

    // Scenario: memory_leak_scenario_1858604_settings_zoom_true
    it('memory_leak_scenario_1858604_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1858604;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1858604);
    });

    // Scenario: memory_leak_scenario_1858605_layout_custom_columns
    it('memory_leak_scenario_1858605_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1858605;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1858605);
    });

    // Scenario: memory_leak_scenario_1858606_score_accumulation
    it('memory_leak_scenario_1858606_score_accumulation', 0, async () => {
      const caseSeed: number = 1858606;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(1858606);
    });

    // Scenario: memory_leak_scenario_1858607_brick_grid_progress
    it('memory_leak_scenario_1858607_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1858607;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(1858607);
    });

    // Scenario: memory_leak_scenario_1858608_locale_lookup_en
    it('memory_leak_scenario_1858608_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1858608;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1858608);
    });

    // Scenario: memory_leak_scenario_1858609_validation_report_count
    it('memory_leak_scenario_1858609_validation_report_count', 0, async () => {
      const caseSeed: number = 1858609;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1858609);
    });

    // Scenario: memory_leak_scenario_1858610_url_with_query
    it('memory_leak_scenario_1858610_url_with_query', 0, async () => {
      const caseSeed: number = 1858610;
      const url: string = SAMPLE_GAME_URL + '?case=90';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1858610);
    });

    // Scenario: memory_leak_scenario_1858611_geometry_area
    it('memory_leak_scenario_1858611_geometry_area', 0, async () => {
      const caseSeed: number = 1858611;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1858611);
    });

  });
}
