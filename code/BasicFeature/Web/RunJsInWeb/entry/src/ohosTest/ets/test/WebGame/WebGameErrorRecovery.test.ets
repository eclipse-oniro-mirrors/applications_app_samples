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
  LABEL_START,
  LABEL_RESET,
  getDriver,
  serializedDelay,
  isGamePageVisible,
  triggerGamePage,
  pressAndWait,
  clickButtonByLabel
} from '../Shared/SharedDriver';
import {
  SAMPLE_GAME_URL,
  INTERNET_PERMISSION,
  ORIENTATION_LANDSCAPE,
  MAX_INJECTION_ATTEMPTS,
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
  ValidationReport,
  ScriptPayloadBuilder
} from '../Shared/GameModel';
import {
  UrlParts,
  GeometryBox,
  CircularBuffer,
  CommandQueue,
  TokenBucket
} from '../Shared/GameTestKit';
import {
  ErrorClassifier
} from '../Shared/TestHelpers';

export default function webGameErrorRecoveryTest() {
  describe('WebGameErrorRecovery_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_error suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_error suite end');
    });

    // Scenario: game_error_error_classifier_recognizes_timeout
    it('game_error_error_classifier_recognizes_timeout', 0, async () => {
      const category: string = ErrorClassifier.classify('operation timeout');
      expect(category).assertEqual(ErrorClassifier.TIMEOUT);
      expect(ErrorClassifier.code(category)).assertEqual(1002);
    });

    // Scenario: game_error_script_error_is_not_retryable
    it('game_error_script_error_is_not_retryable', 0, async () => {
      expect(ErrorClassifier.isRecoverable(ErrorClassifier.SCRIPT)).assertFalse();
      expect(ErrorClassifier.code(ErrorClassifier.PERMISSION)).assertEqual(1004);
      expect(ErrorClassifier.code('unknown')).assertEqual(1099);
    });

    // Scenario: game_error_invalid_injection_is_reported
    it('game_error_invalid_injection_is_reported', 0, async () => {
      const report: ValidationReport = new ValidationReport();
      const payload: string = ScriptPayloadBuilder.malformedPayload();
      if (!InjectionPipeline.isWellFormed(payload)) {
        report.addError('malformed payload');
      }
      expect(report.isValid()).assertFalse();
      expect(report.contains('malformed payload')).assertTrue();
    });

    // Scenario: game_error_page_recovers_after_failed_action
    it('game_error_page_recovers_after_failed_action', 0, async () => {
      expect(await clickButtonByLabel(driver, LABEL_RESET)).assertTrue();
      expect(await clickButtonByLabel(driver, LABEL_START)).assertTrue();
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // Scenario: game_error_retry_policy_allows_three_attempts
    it('game_error_retry_policy_allows_three_attempts', 0, async () => {
      const policy: RetryPolicy = new RetryPolicy();
      expect(policy.getMaxAttempts()).assertEqual(MAX_INJECTION_ATTEMPTS);
      expect(policy.recordAttempt()).assertTrue();
      expect(policy.recordAttempt()).assertTrue();
      expect(policy.recordAttempt()).assertTrue();
      expect(policy.recordAttempt()).assertFalse();
      expect(policy.getAttempts()).assertEqual(3);
    });

    // Scenario: game_error_retry_delay_grows_exponentially
    it('game_error_retry_delay_grows_exponentially', 0, async () => {
      const policy: RetryPolicy = new RetryPolicy(5, 100);
      expect(policy.nextDelay()).assertEqual(0);
      policy.recordAttempt();
      expect(policy.nextDelay()).assertEqual(100);
      policy.recordAttempt();
      expect(policy.nextDelay()).assertEqual(200);
      policy.recordAttempt();
      expect(policy.nextDelay()).assertEqual(400);
    });

    // Scenario: game_error_retry_policy_reset_restores_capacity
    it('game_error_retry_policy_reset_restores_capacity', 0, async () => {
      const policy: RetryPolicy = new RetryPolicy(2, 50);
      policy.recordAttempt();
      policy.recordAttempt();
      expect(policy.canRetry()).assertFalse();
      policy.reset();
      expect(policy.canRetry()).assertTrue();
      expect(policy.getAttempts()).assertEqual(0);
    });

    // Scenario: game_error_scenario_3876000_session_start_cycles
    it('game_error_scenario_3876000_session_start_cycles', 0, async () => {
      const caseSeed: number = 3876000;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(3876000);
    });

    // Scenario: game_error_scenario_3876001_paddle_step_sequence
    it('game_error_scenario_3876001_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 3876001;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(3876001);
    });

    // Scenario: game_error_scenario_3876002_catalog_lookup_start
    it('game_error_scenario_3876002_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 3876002;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(3876002);
    });

    // Scenario: game_error_scenario_3876003_pipeline_round_trip
    it('game_error_scenario_3876003_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 3876003;
      const payload: string = '_main.paddle.moveLeft(); // case 3876003';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(3876003);
    });

    // Scenario: game_error_scenario_3876004_settings_zoom_true
    it('game_error_scenario_3876004_settings_zoom_true', 0, async () => {
      const caseSeed: number = 3876004;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(3876004);
    });

    // Scenario: game_error_scenario_3876005_layout_custom_columns
    it('game_error_scenario_3876005_layout_custom_columns', 0, async () => {
      const caseSeed: number = 3876005;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(3876005);
    });

    // Scenario: game_error_scenario_3876006_score_accumulation
    it('game_error_scenario_3876006_score_accumulation', 0, async () => {
      const caseSeed: number = 3876006;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(3876006);
    });

    // Scenario: game_error_scenario_3876007_brick_grid_progress
    it('game_error_scenario_3876007_brick_grid_progress', 0, async () => {
      const caseSeed: number = 3876007;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(3876007);
    });

    // Scenario: game_error_scenario_3876008_locale_lookup_en
    it('game_error_scenario_3876008_locale_lookup_en', 0, async () => {
      const caseSeed: number = 3876008;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(3876008);
    });

    // Scenario: game_error_scenario_3876009_validation_report_count
    it('game_error_scenario_3876009_validation_report_count', 0, async () => {
      const caseSeed: number = 3876009;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(3876009);
    });

    // Scenario: game_error_scenario_3876010_url_with_query
    it('game_error_scenario_3876010_url_with_query', 0, async () => {
      const caseSeed: number = 3876010;
      const url: string = SAMPLE_GAME_URL + '?case=84';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(3876010);
    });

    // Scenario: game_error_scenario_3876011_geometry_area
    it('game_error_scenario_3876011_geometry_area', 0, async () => {
      const caseSeed: number = 3876011;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(3876011);
    });

    // Scenario: game_error_scenario_3876012_circular_buffer_capacity
    it('game_error_scenario_3876012_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 3876012;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(3876012);
    });

    // Scenario: game_error_scenario_3876013_command_queue_fifo
    it('game_error_scenario_3876013_command_queue_fifo', 0, async () => {
      const caseSeed: number = 3876013;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(3876013);
    });

    // Scenario: game_error_scenario_3876014_token_bucket_consume
    it('game_error_scenario_3876014_token_bucket_consume', 0, async () => {
      const caseSeed: number = 3876014;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(3876014);
    });

    // Scenario: game_error_scenario_3876015_page_load_budget
    it('game_error_scenario_3876015_page_load_budget', 0, async () => {
      const caseSeed: number = 3876015;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6015);
      expect(record.getDuration()).assertEqual(6015);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(3876015);
    });

    // Scenario: game_error_scenario_3876016_perf_sampler_bounds
    it('game_error_scenario_3876016_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 3876016;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(3876016);
    });

    // Scenario: game_error_scenario_3876017_config_api_9
    it('game_error_scenario_3876017_config_api_9', 0, async () => {
      const caseSeed: number = 3876017;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(3876017);
    });

    // Scenario: game_error_scenario_3876018_retry_attempts
    it('game_error_scenario_3876018_retry_attempts', 0, async () => {
      const caseSeed: number = 3876018;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(3876018);
    });

    // Scenario: game_error_scenario_3876019_event_recorder_sequence
    it('game_error_scenario_3876019_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 3876019;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(3876019);
    });

    // Scenario: game_error_scenario_3876020_session_start_cycles
    it('game_error_scenario_3876020_session_start_cycles', 0, async () => {
      const caseSeed: number = 3876020;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(3876020);
    });

    // Scenario: game_error_scenario_3876021_paddle_step_sequence
    it('game_error_scenario_3876021_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 3876021;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(3876021);
    });

    // Scenario: game_error_scenario_3876022_catalog_lookup_start
    it('game_error_scenario_3876022_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 3876022;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(3876022);
    });

    // Scenario: game_error_scenario_3876023_pipeline_round_trip
    it('game_error_scenario_3876023_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 3876023;
      const payload: string = '_main.paddle.moveLeft(); // case 3876023';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(3876023);
    });

    // Scenario: game_error_scenario_3876024_settings_zoom_true
    it('game_error_scenario_3876024_settings_zoom_true', 0, async () => {
      const caseSeed: number = 3876024;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(3876024);
    });

    // Scenario: game_error_scenario_3876025_layout_custom_columns
    it('game_error_scenario_3876025_layout_custom_columns', 0, async () => {
      const caseSeed: number = 3876025;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(3876025);
    });

    // Scenario: game_error_scenario_3876026_score_accumulation
    it('game_error_scenario_3876026_score_accumulation', 0, async () => {
      const caseSeed: number = 3876026;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(3876026);
    });

    // Scenario: game_error_scenario_3876027_brick_grid_progress
    it('game_error_scenario_3876027_brick_grid_progress', 0, async () => {
      const caseSeed: number = 3876027;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(3876027);
    });

    // Scenario: game_error_scenario_3876028_locale_lookup_en
    it('game_error_scenario_3876028_locale_lookup_en', 0, async () => {
      const caseSeed: number = 3876028;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(3876028);
    });

    // Scenario: game_error_scenario_3876029_validation_report_count
    it('game_error_scenario_3876029_validation_report_count', 0, async () => {
      const caseSeed: number = 3876029;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(3876029);
    });

    // Scenario: game_error_scenario_3876030_url_with_query
    it('game_error_scenario_3876030_url_with_query', 0, async () => {
      const caseSeed: number = 3876030;
      const url: string = SAMPLE_GAME_URL + '?case=7';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(3876030);
    });

    // Scenario: game_error_scenario_3876031_geometry_area
    it('game_error_scenario_3876031_geometry_area', 0, async () => {
      const caseSeed: number = 3876031;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(3876031);
    });

    // Scenario: game_error_scenario_3876032_circular_buffer_capacity
    it('game_error_scenario_3876032_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 3876032;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(3876032);
    });

    // Scenario: game_error_scenario_3876033_command_queue_fifo
    it('game_error_scenario_3876033_command_queue_fifo', 0, async () => {
      const caseSeed: number = 3876033;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(3876033);
    });

    // Scenario: game_error_scenario_3876034_token_bucket_consume
    it('game_error_scenario_3876034_token_bucket_consume', 0, async () => {
      const caseSeed: number = 3876034;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(3876034);
    });

    // Scenario: game_error_scenario_3876035_page_load_budget
    it('game_error_scenario_3876035_page_load_budget', 0, async () => {
      const caseSeed: number = 3876035;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6035);
      expect(record.getDuration()).assertEqual(6035);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(3876035);
    });

  });
}
