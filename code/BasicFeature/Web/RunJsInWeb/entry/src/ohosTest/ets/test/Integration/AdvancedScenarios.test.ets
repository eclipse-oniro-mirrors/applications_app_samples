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
  PAGE_LOAD_BUDGET_MS,
  GameScript,
  ScriptCatalog,
  InjectionPipeline,
  GameSession,
  PaddleModel,
  WebSettingsProfile,
  LayoutProfile,
  PageLoadRecord,
  ScoreBoard,
  BrickGrid,
  LocaleCatalog,
  ValidationReport
} from '../Shared/GameModel';
import {
  UrlParts,
  GeometryBox,
  CircularBuffer,
  CommandQueue,
  TokenBucket
} from '../Shared/GameTestKit';

export default function advancedScenariosTest() {
  describe('AdvancedScenarios_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'advanced_scenarios suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'advanced_scenarios suite end');
    });

    // Scenario: advanced_scenarios_scenario_2969700_session_start_cycles
    it('advanced_scenarios_scenario_2969700_session_start_cycles', 0, async () => {
      const caseSeed: number = 2969700;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2969700);
    });

    // Scenario: advanced_scenarios_scenario_2969701_paddle_step_sequence
    it('advanced_scenarios_scenario_2969701_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2969701;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(2969701);
    });

    // Scenario: advanced_scenarios_scenario_2969702_catalog_lookup_start
    it('advanced_scenarios_scenario_2969702_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2969702;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2969702);
    });

    // Scenario: advanced_scenarios_scenario_2969703_pipeline_round_trip
    it('advanced_scenarios_scenario_2969703_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2969703;
      const payload: string = '_main.paddle.moveLeft(); // case 2969703';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2969703);
    });

    // Scenario: advanced_scenarios_scenario_2969704_settings_zoom_true
    it('advanced_scenarios_scenario_2969704_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2969704;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2969704);
    });

    // Scenario: advanced_scenarios_scenario_2969705_layout_custom_columns
    it('advanced_scenarios_scenario_2969705_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2969705;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2969705);
    });

    // Scenario: advanced_scenarios_scenario_2969706_score_accumulation
    it('advanced_scenarios_scenario_2969706_score_accumulation', 0, async () => {
      const caseSeed: number = 2969706;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(2969706);
    });

    // Scenario: advanced_scenarios_scenario_2969707_brick_grid_progress
    it('advanced_scenarios_scenario_2969707_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2969707;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(2969707);
    });

    // Scenario: advanced_scenarios_scenario_2969708_locale_lookup_en
    it('advanced_scenarios_scenario_2969708_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2969708;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2969708);
    });

    // Scenario: advanced_scenarios_scenario_2969709_validation_report_count
    it('advanced_scenarios_scenario_2969709_validation_report_count', 0, async () => {
      const caseSeed: number = 2969709;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2969709);
    });

    // Scenario: advanced_scenarios_scenario_2969710_url_with_query
    it('advanced_scenarios_scenario_2969710_url_with_query', 0, async () => {
      const caseSeed: number = 2969710;
      const url: string = SAMPLE_GAME_URL + '?case=55';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2969710);
    });

    // Scenario: advanced_scenarios_scenario_2969711_geometry_area
    it('advanced_scenarios_scenario_2969711_geometry_area', 0, async () => {
      const caseSeed: number = 2969711;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2969711);
    });

    // Scenario: advanced_scenarios_scenario_2969712_circular_buffer_capacity
    it('advanced_scenarios_scenario_2969712_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2969712;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2969712);
    });

    // Scenario: advanced_scenarios_scenario_2969713_command_queue_fifo
    it('advanced_scenarios_scenario_2969713_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2969713;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2969713);
    });

    // Scenario: advanced_scenarios_scenario_2969714_token_bucket_consume
    it('advanced_scenarios_scenario_2969714_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2969714;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(2969714);
    });

    // Scenario: advanced_scenarios_scenario_2969715_page_load_budget
    it('advanced_scenarios_scenario_2969715_page_load_budget', 0, async () => {
      const caseSeed: number = 2969715;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8715);
      expect(record.getDuration()).assertEqual(8715);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2969715);
    });

  });
}
