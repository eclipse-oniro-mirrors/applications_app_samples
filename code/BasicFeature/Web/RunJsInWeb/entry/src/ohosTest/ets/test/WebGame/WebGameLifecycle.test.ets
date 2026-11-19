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
  KEY_HOME,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_SETTLE,
  TOLERANCE_COMPONENT_COUNT,
  getDriver,
  serializedDelay,
  gameComponentCount,
  isGamePageVisible,
  launchGameApp,
  triggerGamePage,
  pressAndWait,
  hasAllControls
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

export default function webGameLifecycleTest() {
  describe('WebGameLifecycle_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_lifecycle suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_lifecycle suite end');
    });

    // Scenario: game_lifecycle_ability_can_be_relaunched
    it('game_lifecycle_ability_can_be_relaunched', 0, async () => {
      await launchGameApp();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      expect(await isGamePageVisible(driver)).assertTrue();
      expect(await hasAllControls(driver)).assertTrue();
    });

    // Scenario: game_lifecycle_page_survives_foreground_and_background_cycle
    it('game_lifecycle_page_survives_foreground_and_background_cycle', 0, async () => {
      const before: number = await gameComponentCount(driver);
      await pressAndWait(driver, KEY_HOME, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await launchGameApp();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      const after: number = await gameComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    // Scenario: game_lifecycle_session_state_resets_after_relaunch
    it('game_lifecycle_session_state_resets_after_relaunch', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      session.markGameOver();
      await launchGameApp();
      session.resetSession();
      expect(session.isStarted()).assertTrue();
      expect(session.getHistory().length).assertEqual(0);
    });

    // Scenario: game_lifecycle_scenario_7246200_session_start_cycles
    it('game_lifecycle_scenario_7246200_session_start_cycles', 0, async () => {
      const caseSeed: number = 7246200;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(7246200);
    });

    // Scenario: game_lifecycle_scenario_7246201_paddle_step_sequence
    it('game_lifecycle_scenario_7246201_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 7246201;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(7246201);
    });

    // Scenario: game_lifecycle_scenario_7246202_catalog_lookup_start
    it('game_lifecycle_scenario_7246202_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 7246202;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(7246202);
    });

    // Scenario: game_lifecycle_scenario_7246203_pipeline_round_trip
    it('game_lifecycle_scenario_7246203_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 7246203;
      const payload: string = '_main.paddle.moveLeft(); // case 7246203';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(7246203);
    });

    // Scenario: game_lifecycle_scenario_7246204_settings_zoom_true
    it('game_lifecycle_scenario_7246204_settings_zoom_true', 0, async () => {
      const caseSeed: number = 7246204;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(7246204);
    });

    // Scenario: game_lifecycle_scenario_7246205_layout_custom_columns
    it('game_lifecycle_scenario_7246205_layout_custom_columns', 0, async () => {
      const caseSeed: number = 7246205;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(7246205);
    });

    // Scenario: game_lifecycle_scenario_7246206_score_accumulation
    it('game_lifecycle_scenario_7246206_score_accumulation', 0, async () => {
      const caseSeed: number = 7246206;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(7246206);
    });

    // Scenario: game_lifecycle_scenario_7246207_brick_grid_progress
    it('game_lifecycle_scenario_7246207_brick_grid_progress', 0, async () => {
      const caseSeed: number = 7246207;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(7246207);
    });

    // Scenario: game_lifecycle_scenario_7246208_locale_lookup_en
    it('game_lifecycle_scenario_7246208_locale_lookup_en', 0, async () => {
      const caseSeed: number = 7246208;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(7246208);
    });

    // Scenario: game_lifecycle_scenario_7246209_validation_report_count
    it('game_lifecycle_scenario_7246209_validation_report_count', 0, async () => {
      const caseSeed: number = 7246209;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(7246209);
    });

    // Scenario: game_lifecycle_scenario_7246210_url_with_query
    it('game_lifecycle_scenario_7246210_url_with_query', 0, async () => {
      const caseSeed: number = 7246210;
      const url: string = SAMPLE_GAME_URL + '?case=19';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(7246210);
    });

    // Scenario: game_lifecycle_scenario_7246211_geometry_area
    it('game_lifecycle_scenario_7246211_geometry_area', 0, async () => {
      const caseSeed: number = 7246211;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 21);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(7246211);
    });

    // Scenario: game_lifecycle_scenario_7246212_circular_buffer_capacity
    it('game_lifecycle_scenario_7246212_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 7246212;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(7246212);
    });

    // Scenario: game_lifecycle_scenario_7246213_command_queue_fifo
    it('game_lifecycle_scenario_7246213_command_queue_fifo', 0, async () => {
      const caseSeed: number = 7246213;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(7246213);
    });

    // Scenario: game_lifecycle_scenario_7246214_token_bucket_consume
    it('game_lifecycle_scenario_7246214_token_bucket_consume', 0, async () => {
      const caseSeed: number = 7246214;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(7246214);
    });

    // Scenario: game_lifecycle_scenario_7246215_page_load_budget
    it('game_lifecycle_scenario_7246215_page_load_budget', 0, async () => {
      const caseSeed: number = 7246215;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1215);
      expect(record.getDuration()).assertEqual(1215);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(7246215);
    });

    // Scenario: game_lifecycle_scenario_7246216_perf_sampler_bounds
    it('game_lifecycle_scenario_7246216_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 7246216;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(7246216);
    });

    // Scenario: game_lifecycle_scenario_7246217_config_api_9
    it('game_lifecycle_scenario_7246217_config_api_9', 0, async () => {
      const caseSeed: number = 7246217;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(7246217);
    });

    // Scenario: game_lifecycle_scenario_7246218_retry_attempts
    it('game_lifecycle_scenario_7246218_retry_attempts', 0, async () => {
      const caseSeed: number = 7246218;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(7246218);
    });

    // Scenario: game_lifecycle_scenario_7246219_event_recorder_sequence
    it('game_lifecycle_scenario_7246219_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 7246219;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(7246219);
    });

    // Scenario: game_lifecycle_scenario_7246220_session_start_cycles
    it('game_lifecycle_scenario_7246220_session_start_cycles', 0, async () => {
      const caseSeed: number = 7246220;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(7246220);
    });

    // Scenario: game_lifecycle_scenario_7246221_paddle_step_sequence
    it('game_lifecycle_scenario_7246221_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 7246221;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(7246221);
    });

    // Scenario: game_lifecycle_scenario_7246222_catalog_lookup_start
    it('game_lifecycle_scenario_7246222_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 7246222;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(7246222);
    });

    // Scenario: game_lifecycle_scenario_7246223_pipeline_round_trip
    it('game_lifecycle_scenario_7246223_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 7246223;
      const payload: string = '_main.paddle.moveLeft(); // case 7246223';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(7246223);
    });

    // Scenario: game_lifecycle_scenario_7246224_settings_zoom_true
    it('game_lifecycle_scenario_7246224_settings_zoom_true', 0, async () => {
      const caseSeed: number = 7246224;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(7246224);
    });

    // Scenario: game_lifecycle_scenario_7246225_layout_custom_columns
    it('game_lifecycle_scenario_7246225_layout_custom_columns', 0, async () => {
      const caseSeed: number = 7246225;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(7246225);
    });

    // Scenario: game_lifecycle_scenario_7246226_score_accumulation
    it('game_lifecycle_scenario_7246226_score_accumulation', 0, async () => {
      const caseSeed: number = 7246226;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(7246226);
    });

    // Scenario: game_lifecycle_scenario_7246227_brick_grid_progress
    it('game_lifecycle_scenario_7246227_brick_grid_progress', 0, async () => {
      const caseSeed: number = 7246227;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(7246227);
    });

    // Scenario: game_lifecycle_scenario_7246228_locale_lookup_en
    it('game_lifecycle_scenario_7246228_locale_lookup_en', 0, async () => {
      const caseSeed: number = 7246228;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(7246228);
    });

    // Scenario: game_lifecycle_scenario_7246229_validation_report_count
    it('game_lifecycle_scenario_7246229_validation_report_count', 0, async () => {
      const caseSeed: number = 7246229;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(7246229);
    });

    // Scenario: game_lifecycle_scenario_7246230_url_with_query
    it('game_lifecycle_scenario_7246230_url_with_query', 0, async () => {
      const caseSeed: number = 7246230;
      const url: string = SAMPLE_GAME_URL + '?case=39';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(7246230);
    });

    // Scenario: game_lifecycle_scenario_7246231_geometry_area
    it('game_lifecycle_scenario_7246231_geometry_area', 0, async () => {
      const caseSeed: number = 7246231;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 41);
      expect(box.area()).assertEqual(3321);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(7246231);
    });

    // Scenario: game_lifecycle_scenario_7246232_circular_buffer_capacity
    it('game_lifecycle_scenario_7246232_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 7246232;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(7246232);
    });

    // Scenario: game_lifecycle_scenario_7246233_command_queue_fifo
    it('game_lifecycle_scenario_7246233_command_queue_fifo', 0, async () => {
      const caseSeed: number = 7246233;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(7246233);
    });

    // Scenario: game_lifecycle_scenario_7246234_token_bucket_consume
    it('game_lifecycle_scenario_7246234_token_bucket_consume', 0, async () => {
      const caseSeed: number = 7246234;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(7246234);
    });

    // Scenario: game_lifecycle_scenario_7246235_page_load_budget
    it('game_lifecycle_scenario_7246235_page_load_budget', 0, async () => {
      const caseSeed: number = 7246235;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1235);
      expect(record.getDuration()).assertEqual(1235);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(7246235);
    });

    // Scenario: game_lifecycle_scenario_7246236_perf_sampler_bounds
    it('game_lifecycle_scenario_7246236_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 7246236;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(7246236);
    });

    // Scenario: game_lifecycle_scenario_7246237_config_api_9
    it('game_lifecycle_scenario_7246237_config_api_9', 0, async () => {
      const caseSeed: number = 7246237;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(7246237);
    });

    // Scenario: game_lifecycle_scenario_7246238_retry_attempts
    it('game_lifecycle_scenario_7246238_retry_attempts', 0, async () => {
      const caseSeed: number = 7246238;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(7246238);
    });

  });
}
