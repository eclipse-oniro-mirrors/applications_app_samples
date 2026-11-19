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
  INTERNET_PERMISSION,
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
  PerformanceSampler,
  ConfigSnapshot,
  RetryPolicy,
  EventRecorder,
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

export default function webViewPositioningTest() {
  describe('WebViewPositioning_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_positioning suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_positioning suite end');
    });

    // Scenario: web_positioning_scenario_4181300_session_start_cycles
    it('web_positioning_scenario_4181300_session_start_cycles', 0, async () => {
      const caseSeed: number = 4181300;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(4181300);
    });

    // Scenario: web_positioning_scenario_4181301_paddle_step_sequence
    it('web_positioning_scenario_4181301_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 4181301;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(4181301);
    });

    // Scenario: web_positioning_scenario_4181302_catalog_lookup_start
    it('web_positioning_scenario_4181302_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 4181302;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(4181302);
    });

    // Scenario: web_positioning_scenario_4181303_pipeline_round_trip
    it('web_positioning_scenario_4181303_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 4181303;
      const payload: string = '_main.paddle.moveLeft(); // case 4181303';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(4181303);
    });

    // Scenario: web_positioning_scenario_4181304_settings_zoom_true
    it('web_positioning_scenario_4181304_settings_zoom_true', 0, async () => {
      const caseSeed: number = 4181304;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(4181304);
    });

    // Scenario: web_positioning_scenario_4181305_layout_custom_columns
    it('web_positioning_scenario_4181305_layout_custom_columns', 0, async () => {
      const caseSeed: number = 4181305;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(4181305);
    });

    // Scenario: web_positioning_scenario_4181306_score_accumulation
    it('web_positioning_scenario_4181306_score_accumulation', 0, async () => {
      const caseSeed: number = 4181306;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(4181306);
    });

    // Scenario: web_positioning_scenario_4181307_brick_grid_progress
    it('web_positioning_scenario_4181307_brick_grid_progress', 0, async () => {
      const caseSeed: number = 4181307;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(4181307);
    });

    // Scenario: web_positioning_scenario_4181308_locale_lookup_en
    it('web_positioning_scenario_4181308_locale_lookup_en', 0, async () => {
      const caseSeed: number = 4181308;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(4181308);
    });

    // Scenario: web_positioning_scenario_4181309_validation_report_count
    it('web_positioning_scenario_4181309_validation_report_count', 0, async () => {
      const caseSeed: number = 4181309;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(4181309);
    });

    // Scenario: web_positioning_scenario_4181310_url_with_query
    it('web_positioning_scenario_4181310_url_with_query', 0, async () => {
      const caseSeed: number = 4181310;
      const url: string = SAMPLE_GAME_URL + '?case=28';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(4181310);
    });

    // Scenario: web_positioning_scenario_4181311_geometry_area
    it('web_positioning_scenario_4181311_geometry_area', 0, async () => {
      const caseSeed: number = 4181311;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(4181311);
    });

    // Scenario: web_positioning_scenario_4181312_circular_buffer_capacity
    it('web_positioning_scenario_4181312_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 4181312;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(4181312);
    });

    // Scenario: web_positioning_scenario_4181313_command_queue_fifo
    it('web_positioning_scenario_4181313_command_queue_fifo', 0, async () => {
      const caseSeed: number = 4181313;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(4181313);
    });

    // Scenario: web_positioning_scenario_4181314_token_bucket_consume
    it('web_positioning_scenario_4181314_token_bucket_consume', 0, async () => {
      const caseSeed: number = 4181314;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(4181314);
    });

    // Scenario: web_positioning_scenario_4181315_page_load_budget
    it('web_positioning_scenario_4181315_page_load_budget', 0, async () => {
      const caseSeed: number = 4181315;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5315);
      expect(record.getDuration()).assertEqual(5315);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(4181315);
    });

    // Scenario: web_positioning_scenario_4181316_perf_sampler_bounds
    it('web_positioning_scenario_4181316_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 4181316;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(4181316);
    });

    // Scenario: web_positioning_scenario_4181317_config_api_9
    it('web_positioning_scenario_4181317_config_api_9', 0, async () => {
      const caseSeed: number = 4181317;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(4181317);
    });

    // Scenario: web_positioning_scenario_4181318_retry_attempts
    it('web_positioning_scenario_4181318_retry_attempts', 0, async () => {
      const caseSeed: number = 4181318;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(4181318);
    });

    // Scenario: web_positioning_scenario_4181319_event_recorder_sequence
    it('web_positioning_scenario_4181319_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 4181319;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(4181319);
    });

  });
}
