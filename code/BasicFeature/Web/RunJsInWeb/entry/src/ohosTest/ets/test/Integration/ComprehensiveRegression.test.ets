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

export default function comprehensiveRegressionTest() {
  describe('ComprehensiveRegression_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'comprehensive_regression suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'comprehensive_regression suite end');
    });

    // Scenario: comprehensive_regression_scenario_9673300_session_start_cycles
    it('comprehensive_regression_scenario_9673300_session_start_cycles', 0, async () => {
      const caseSeed: number = 9673300;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9673300);
    });

    // Scenario: comprehensive_regression_scenario_9673301_paddle_step_sequence
    it('comprehensive_regression_scenario_9673301_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9673301;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9673301);
    });

    // Scenario: comprehensive_regression_scenario_9673302_catalog_lookup_start
    it('comprehensive_regression_scenario_9673302_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9673302;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9673302);
    });

    // Scenario: comprehensive_regression_scenario_9673303_pipeline_round_trip
    it('comprehensive_regression_scenario_9673303_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9673303;
      const payload: string = '_main.paddle.moveLeft(); // case 9673303';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9673303);
    });

    // Scenario: comprehensive_regression_scenario_9673304_settings_zoom_true
    it('comprehensive_regression_scenario_9673304_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9673304;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9673304);
    });

    // Scenario: comprehensive_regression_scenario_9673305_layout_custom_columns
    it('comprehensive_regression_scenario_9673305_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9673305;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9673305);
    });

    // Scenario: comprehensive_regression_scenario_9673306_score_accumulation
    it('comprehensive_regression_scenario_9673306_score_accumulation', 0, async () => {
      const caseSeed: number = 9673306;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(9673306);
    });

    // Scenario: comprehensive_regression_scenario_9673307_brick_grid_progress
    it('comprehensive_regression_scenario_9673307_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9673307;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(9673307);
    });

    // Scenario: comprehensive_regression_scenario_9673308_locale_lookup_en
    it('comprehensive_regression_scenario_9673308_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9673308;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9673308);
    });

    // Scenario: comprehensive_regression_scenario_9673309_validation_report_count
    it('comprehensive_regression_scenario_9673309_validation_report_count', 0, async () => {
      const caseSeed: number = 9673309;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9673309);
    });

    // Scenario: comprehensive_regression_scenario_9673310_url_with_query
    it('comprehensive_regression_scenario_9673310_url_with_query', 0, async () => {
      const caseSeed: number = 9673310;
      const url: string = SAMPLE_GAME_URL + '?case=82';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9673310);
    });

    // Scenario: comprehensive_regression_scenario_9673311_geometry_area
    it('comprehensive_regression_scenario_9673311_geometry_area', 0, async () => {
      const caseSeed: number = 9673311;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 61);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9673311);
    });

    // Scenario: comprehensive_regression_scenario_9673312_circular_buffer_capacity
    it('comprehensive_regression_scenario_9673312_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9673312;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9673312);
    });

    // Scenario: comprehensive_regression_scenario_9673313_command_queue_fifo
    it('comprehensive_regression_scenario_9673313_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9673313;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9673313);
    });

    // Scenario: comprehensive_regression_scenario_9673314_token_bucket_consume
    it('comprehensive_regression_scenario_9673314_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9673314;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9673314);
    });

    // Scenario: comprehensive_regression_scenario_9673315_page_load_budget
    it('comprehensive_regression_scenario_9673315_page_load_budget', 0, async () => {
      const caseSeed: number = 9673315;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7315);
      expect(record.getDuration()).assertEqual(7315);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9673315);
    });

    // Scenario: comprehensive_regression_scenario_9673316_perf_sampler_bounds
    it('comprehensive_regression_scenario_9673316_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9673316;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(9673316);
    });

    // Scenario: comprehensive_regression_scenario_9673317_config_api_9
    it('comprehensive_regression_scenario_9673317_config_api_9', 0, async () => {
      const caseSeed: number = 9673317;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9673317);
    });

    // Scenario: comprehensive_regression_scenario_9673318_retry_attempts
    it('comprehensive_regression_scenario_9673318_retry_attempts', 0, async () => {
      const caseSeed: number = 9673318;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9673318);
    });

    // Scenario: comprehensive_regression_scenario_9673319_event_recorder_sequence
    it('comprehensive_regression_scenario_9673319_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9673319;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9673319);
    });

    // Scenario: comprehensive_regression_scenario_9673320_session_start_cycles
    it('comprehensive_regression_scenario_9673320_session_start_cycles', 0, async () => {
      const caseSeed: number = 9673320;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9673320);
    });

    // Scenario: comprehensive_regression_scenario_9673321_paddle_step_sequence
    it('comprehensive_regression_scenario_9673321_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9673321;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9673321);
    });

    // Scenario: comprehensive_regression_scenario_9673322_catalog_lookup_start
    it('comprehensive_regression_scenario_9673322_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9673322;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9673322);
    });

    // Scenario: comprehensive_regression_scenario_9673323_pipeline_round_trip
    it('comprehensive_regression_scenario_9673323_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9673323;
      const payload: string = '_main.paddle.moveLeft(); // case 9673323';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9673323);
    });

    // Scenario: comprehensive_regression_scenario_9673324_settings_zoom_true
    it('comprehensive_regression_scenario_9673324_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9673324;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9673324);
    });

    // Scenario: comprehensive_regression_scenario_9673325_layout_custom_columns
    it('comprehensive_regression_scenario_9673325_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9673325;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9673325);
    });

    // Scenario: comprehensive_regression_scenario_9673326_score_accumulation
    it('comprehensive_regression_scenario_9673326_score_accumulation', 0, async () => {
      const caseSeed: number = 9673326;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(9673326);
    });

    // Scenario: comprehensive_regression_scenario_9673327_brick_grid_progress
    it('comprehensive_regression_scenario_9673327_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9673327;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9673327);
    });

    // Scenario: comprehensive_regression_scenario_9673328_locale_lookup_en
    it('comprehensive_regression_scenario_9673328_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9673328;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9673328);
    });

    // Scenario: comprehensive_regression_scenario_9673329_validation_report_count
    it('comprehensive_regression_scenario_9673329_validation_report_count', 0, async () => {
      const caseSeed: number = 9673329;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9673329);
    });

    // Scenario: comprehensive_regression_scenario_9673330_url_with_query
    it('comprehensive_regression_scenario_9673330_url_with_query', 0, async () => {
      const caseSeed: number = 9673330;
      const url: string = SAMPLE_GAME_URL + '?case=5';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9673330);
    });

    // Scenario: comprehensive_regression_scenario_9673331_geometry_area
    it('comprehensive_regression_scenario_9673331_geometry_area', 0, async () => {
      const caseSeed: number = 9673331;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 21);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9673331);
    });

    // Scenario: comprehensive_regression_scenario_9673332_circular_buffer_capacity
    it('comprehensive_regression_scenario_9673332_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9673332;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9673332);
    });

    // Scenario: comprehensive_regression_scenario_9673333_command_queue_fifo
    it('comprehensive_regression_scenario_9673333_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9673333;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9673333);
    });

    // Scenario: comprehensive_regression_scenario_9673334_token_bucket_consume
    it('comprehensive_regression_scenario_9673334_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9673334;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9673334);
    });

    // Scenario: comprehensive_regression_scenario_9673335_page_load_budget
    it('comprehensive_regression_scenario_9673335_page_load_budget', 0, async () => {
      const caseSeed: number = 9673335;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7335);
      expect(record.getDuration()).assertEqual(7335);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9673335);
    });

    // Scenario: comprehensive_regression_scenario_9673336_perf_sampler_bounds
    it('comprehensive_regression_scenario_9673336_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9673336;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(9673336);
    });

  });
}
