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
  getDriver,
  serializedDelay,
  isGamePageVisible,
  triggerGamePage,
  pressAndWait,
  clickButtonByLabel,
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
  UrlInspector
} from '../Shared/TestHelpers';

export default function exceptionHandlingTest() {
  describe('ExceptionHandling_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'exception_handling suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'exception_handling suite end');
    });

    // Scenario: exception_handling_injection_rejects_unsafe_payloads
    it('exception_handling_injection_rejects_unsafe_payloads', 0, async () => {
      expect(InjectionPipeline.isSafe(ScriptPayloadBuilder.unsafePayload())).assertFalse();
      expect(InjectionPipeline.isSafe(ScriptPayloadBuilder.emptyPayload())).assertFalse();
      expect(InjectionPipeline.isSafe('a\nb')).assertFalse();
      expect(InjectionPipeline.isSafe('_main.start();')).assertTrue();
    });

    // Scenario: exception_handling_remote_page_uses_https_only
    it('exception_handling_remote_page_uses_https_only', 0, async () => {
      const secure: UrlInspector = new UrlInspector(SAMPLE_GAME_URL);
      expect(secure.isHttps()).assertTrue();
      expect(secure.isInjection()).assertFalse();
      const plain: UrlInspector = new UrlInspector('http://example.com/game');
      expect(plain.isHttps()).assertFalse();
    });

    // Scenario: exception_handling_application_requests_minimum_permissions
    it('exception_handling_application_requests_minimum_permissions', 0, async () => {
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.permissions.length).assertEqual(1);
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.hasPermission('ohos.permission.READ_CONTACTS')).assertFalse();
    });

    // Scenario: exception_handling_page_remains_usable_after_security_checks
    it('exception_handling_page_remains_usable_after_security_checks', 0, async () => {
      expect(await clickButtonByLabel(driver, LABEL_START)).assertTrue();
      expect(await isGamePageVisible(driver)).assertTrue();
      expect(await hasAllControls(driver)).assertTrue();
    });

    // Scenario: exception_handling_scenario_1237600_session_start_cycles
    it('exception_handling_scenario_1237600_session_start_cycles', 0, async () => {
      const caseSeed: number = 1237600;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1237600);
    });

    // Scenario: exception_handling_scenario_1237601_paddle_step_sequence
    it('exception_handling_scenario_1237601_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1237601;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(1237601);
    });

    // Scenario: exception_handling_scenario_1237602_catalog_lookup_start
    it('exception_handling_scenario_1237602_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1237602;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1237602);
    });

    // Scenario: exception_handling_scenario_1237603_pipeline_round_trip
    it('exception_handling_scenario_1237603_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1237603;
      const payload: string = '_main.paddle.moveLeft(); // case 1237603';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1237603);
    });

    // Scenario: exception_handling_scenario_1237604_settings_zoom_true
    it('exception_handling_scenario_1237604_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1237604;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1237604);
    });

    // Scenario: exception_handling_scenario_1237605_layout_custom_columns
    it('exception_handling_scenario_1237605_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1237605;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1237605);
    });

    // Scenario: exception_handling_scenario_1237606_score_accumulation
    it('exception_handling_scenario_1237606_score_accumulation', 0, async () => {
      const caseSeed: number = 1237606;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(1237606);
    });

    // Scenario: exception_handling_scenario_1237607_brick_grid_progress
    it('exception_handling_scenario_1237607_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1237607;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(1237607);
    });

    // Scenario: exception_handling_scenario_1237608_locale_lookup_en
    it('exception_handling_scenario_1237608_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1237608;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1237608);
    });

    // Scenario: exception_handling_scenario_1237609_validation_report_count
    it('exception_handling_scenario_1237609_validation_report_count', 0, async () => {
      const caseSeed: number = 1237609;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1237609);
    });

    // Scenario: exception_handling_scenario_1237610_url_with_query
    it('exception_handling_scenario_1237610_url_with_query', 0, async () => {
      const caseSeed: number = 1237610;
      const url: string = SAMPLE_GAME_URL + '?case=84';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1237610);
    });

    // Scenario: exception_handling_scenario_1237611_geometry_area
    it('exception_handling_scenario_1237611_geometry_area', 0, async () => {
      const caseSeed: number = 1237611;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 61);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1237611);
    });

    // Scenario: exception_handling_scenario_1237612_circular_buffer_capacity
    it('exception_handling_scenario_1237612_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1237612;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1237612);
    });

    // Scenario: exception_handling_scenario_1237613_command_queue_fifo
    it('exception_handling_scenario_1237613_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1237613;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1237613);
    });

    // Scenario: exception_handling_scenario_1237614_token_bucket_consume
    it('exception_handling_scenario_1237614_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1237614;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(1237614);
    });

    // Scenario: exception_handling_scenario_1237615_page_load_budget
    it('exception_handling_scenario_1237615_page_load_budget', 0, async () => {
      const caseSeed: number = 1237615;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4615);
      expect(record.getDuration()).assertEqual(4615);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1237615);
    });

    // Scenario: exception_handling_scenario_1237616_perf_sampler_bounds
    it('exception_handling_scenario_1237616_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1237616;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(1237616);
    });

    // Scenario: exception_handling_scenario_1237617_config_api_9
    it('exception_handling_scenario_1237617_config_api_9', 0, async () => {
      const caseSeed: number = 1237617;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1237617);
    });

    // Scenario: exception_handling_scenario_1237618_retry_attempts
    it('exception_handling_scenario_1237618_retry_attempts', 0, async () => {
      const caseSeed: number = 1237618;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1237618);
    });

    // Scenario: exception_handling_scenario_1237619_event_recorder_sequence
    it('exception_handling_scenario_1237619_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1237619;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1237619);
    });

    // Scenario: exception_handling_scenario_1237620_session_start_cycles
    it('exception_handling_scenario_1237620_session_start_cycles', 0, async () => {
      const caseSeed: number = 1237620;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1237620);
    });

    // Scenario: exception_handling_scenario_1237621_paddle_step_sequence
    it('exception_handling_scenario_1237621_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1237621;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(1237621);
    });

    // Scenario: exception_handling_scenario_1237622_catalog_lookup_start
    it('exception_handling_scenario_1237622_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1237622;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1237622);
    });

    // Scenario: exception_handling_scenario_1237623_pipeline_round_trip
    it('exception_handling_scenario_1237623_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1237623;
      const payload: string = '_main.paddle.moveLeft(); // case 1237623';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1237623);
    });

    // Scenario: exception_handling_scenario_1237624_settings_zoom_true
    it('exception_handling_scenario_1237624_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1237624;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1237624);
    });

    // Scenario: exception_handling_scenario_1237625_layout_custom_columns
    it('exception_handling_scenario_1237625_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1237625;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1237625);
    });

    // Scenario: exception_handling_scenario_1237626_score_accumulation
    it('exception_handling_scenario_1237626_score_accumulation', 0, async () => {
      const caseSeed: number = 1237626;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(1237626);
    });

    // Scenario: exception_handling_scenario_1237627_brick_grid_progress
    it('exception_handling_scenario_1237627_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1237627;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(1237627);
    });

    // Scenario: exception_handling_scenario_1237628_locale_lookup_en
    it('exception_handling_scenario_1237628_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1237628;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1237628);
    });

    // Scenario: exception_handling_scenario_1237629_validation_report_count
    it('exception_handling_scenario_1237629_validation_report_count', 0, async () => {
      const caseSeed: number = 1237629;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1237629);
    });

    // Scenario: exception_handling_scenario_1237630_url_with_query
    it('exception_handling_scenario_1237630_url_with_query', 0, async () => {
      const caseSeed: number = 1237630;
      const url: string = SAMPLE_GAME_URL + '?case=7';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1237630);
    });

    // Scenario: exception_handling_scenario_1237631_geometry_area
    it('exception_handling_scenario_1237631_geometry_area', 0, async () => {
      const caseSeed: number = 1237631;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1237631);
    });

    // Scenario: exception_handling_scenario_1237632_circular_buffer_capacity
    it('exception_handling_scenario_1237632_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1237632;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1237632);
    });

    // Scenario: exception_handling_scenario_1237633_command_queue_fifo
    it('exception_handling_scenario_1237633_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1237633;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1237633);
    });

    // Scenario: exception_handling_scenario_1237634_token_bucket_consume
    it('exception_handling_scenario_1237634_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1237634;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(1237634);
    });

    // Scenario: exception_handling_scenario_1237635_page_load_budget
    it('exception_handling_scenario_1237635_page_load_budget', 0, async () => {
      const caseSeed: number = 1237635;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4635);
      expect(record.getDuration()).assertEqual(4635);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1237635);
    });

    // Scenario: exception_handling_scenario_1237636_perf_sampler_bounds
    it('exception_handling_scenario_1237636_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1237636;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(1237636);
    });

    // Scenario: exception_handling_scenario_1237637_config_api_9
    it('exception_handling_scenario_1237637_config_api_9', 0, async () => {
      const caseSeed: number = 1237637;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1237637);
    });

    // Scenario: exception_handling_scenario_1237638_retry_attempts
    it('exception_handling_scenario_1237638_retry_attempts', 0, async () => {
      const caseSeed: number = 1237638;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1237638);
    });

    // Scenario: exception_handling_scenario_1237639_event_recorder_sequence
    it('exception_handling_scenario_1237639_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1237639;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1237639);
    });

    // Scenario: exception_handling_scenario_1237640_session_start_cycles
    it('exception_handling_scenario_1237640_session_start_cycles', 0, async () => {
      const caseSeed: number = 1237640;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1237640);
    });

    // Scenario: exception_handling_scenario_1237641_paddle_step_sequence
    it('exception_handling_scenario_1237641_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1237641;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(1237641);
    });

    // Scenario: exception_handling_scenario_1237642_catalog_lookup_start
    it('exception_handling_scenario_1237642_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1237642;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1237642);
    });

    // Scenario: exception_handling_scenario_1237643_pipeline_round_trip
    it('exception_handling_scenario_1237643_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1237643;
      const payload: string = '_main.paddle.moveLeft(); // case 1237643';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1237643);
    });

    // Scenario: exception_handling_scenario_1237644_settings_zoom_true
    it('exception_handling_scenario_1237644_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1237644;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1237644);
    });

    // Scenario: exception_handling_scenario_1237645_layout_custom_columns
    it('exception_handling_scenario_1237645_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1237645;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1237645);
    });

    // Scenario: exception_handling_scenario_1237646_score_accumulation
    it('exception_handling_scenario_1237646_score_accumulation', 0, async () => {
      const caseSeed: number = 1237646;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(1237646);
    });

    // Scenario: exception_handling_scenario_1237647_brick_grid_progress
    it('exception_handling_scenario_1237647_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1237647;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(1237647);
    });

    // Scenario: exception_handling_scenario_1237648_locale_lookup_en
    it('exception_handling_scenario_1237648_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1237648;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1237648);
    });

    // Scenario: exception_handling_scenario_1237649_validation_report_count
    it('exception_handling_scenario_1237649_validation_report_count', 0, async () => {
      const caseSeed: number = 1237649;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1237649);
    });

    // Scenario: exception_handling_scenario_1237650_url_with_query
    it('exception_handling_scenario_1237650_url_with_query', 0, async () => {
      const caseSeed: number = 1237650;
      const url: string = SAMPLE_GAME_URL + '?case=27';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1237650);
    });

    // Scenario: exception_handling_scenario_1237651_geometry_area
    it('exception_handling_scenario_1237651_geometry_area', 0, async () => {
      const caseSeed: number = 1237651;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 41);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1237651);
    });

    // Scenario: exception_handling_scenario_1237652_circular_buffer_capacity
    it('exception_handling_scenario_1237652_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1237652;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1237652);
    });

    // Scenario: exception_handling_scenario_1237653_command_queue_fifo
    it('exception_handling_scenario_1237653_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1237653;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1237653);
    });

    // Scenario: exception_handling_scenario_1237654_token_bucket_consume
    it('exception_handling_scenario_1237654_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1237654;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(1237654);
    });

    // Scenario: exception_handling_scenario_1237655_page_load_budget
    it('exception_handling_scenario_1237655_page_load_budget', 0, async () => {
      const caseSeed: number = 1237655;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4655);
      expect(record.getDuration()).assertEqual(4655);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1237655);
    });

    // Scenario: exception_handling_scenario_1237656_perf_sampler_bounds
    it('exception_handling_scenario_1237656_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1237656;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(1237656);
    });

    // Scenario: exception_handling_scenario_1237657_config_api_9
    it('exception_handling_scenario_1237657_config_api_9', 0, async () => {
      const caseSeed: number = 1237657;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1237657);
    });

    // Scenario: exception_handling_scenario_1237658_retry_attempts
    it('exception_handling_scenario_1237658_retry_attempts', 0, async () => {
      const caseSeed: number = 1237658;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1237658);
    });

    // Scenario: exception_handling_scenario_1237659_event_recorder_sequence
    it('exception_handling_scenario_1237659_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1237659;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1237659);
    });

    // Scenario: exception_handling_scenario_1237660_session_start_cycles
    it('exception_handling_scenario_1237660_session_start_cycles', 0, async () => {
      const caseSeed: number = 1237660;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1237660);
    });

    // Scenario: exception_handling_scenario_1237661_paddle_step_sequence
    it('exception_handling_scenario_1237661_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1237661;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(1237661);
    });

    // Scenario: exception_handling_scenario_1237662_catalog_lookup_start
    it('exception_handling_scenario_1237662_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1237662;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1237662);
    });

    // Scenario: exception_handling_scenario_1237663_pipeline_round_trip
    it('exception_handling_scenario_1237663_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1237663;
      const payload: string = '_main.paddle.moveLeft(); // case 1237663';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1237663);
    });

    // Scenario: exception_handling_scenario_1237664_settings_zoom_true
    it('exception_handling_scenario_1237664_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1237664;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1237664);
    });

    // Scenario: exception_handling_scenario_1237665_layout_custom_columns
    it('exception_handling_scenario_1237665_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1237665;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1237665);
    });

    // Scenario: exception_handling_scenario_1237666_score_accumulation
    it('exception_handling_scenario_1237666_score_accumulation', 0, async () => {
      const caseSeed: number = 1237666;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(1237666);
    });

    // Scenario: exception_handling_scenario_1237667_brick_grid_progress
    it('exception_handling_scenario_1237667_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1237667;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(1237667);
    });

    // Scenario: exception_handling_scenario_1237668_locale_lookup_en
    it('exception_handling_scenario_1237668_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1237668;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1237668);
    });

    // Scenario: exception_handling_scenario_1237669_validation_report_count
    it('exception_handling_scenario_1237669_validation_report_count', 0, async () => {
      const caseSeed: number = 1237669;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1237669);
    });

    // Scenario: exception_handling_scenario_1237670_url_with_query
    it('exception_handling_scenario_1237670_url_with_query', 0, async () => {
      const caseSeed: number = 1237670;
      const url: string = SAMPLE_GAME_URL + '?case=47';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1237670);
    });

    // Scenario: exception_handling_scenario_1237671_geometry_area
    it('exception_handling_scenario_1237671_geometry_area', 0, async () => {
      const caseSeed: number = 1237671;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1237671);
    });

    // Scenario: exception_handling_scenario_1237672_circular_buffer_capacity
    it('exception_handling_scenario_1237672_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1237672;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1237672);
    });

    // Scenario: exception_handling_scenario_1237673_command_queue_fifo
    it('exception_handling_scenario_1237673_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1237673;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1237673);
    });

    // Scenario: exception_handling_scenario_1237674_token_bucket_consume
    it('exception_handling_scenario_1237674_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1237674;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(1237674);
    });

    // Scenario: exception_handling_scenario_1237675_page_load_budget
    it('exception_handling_scenario_1237675_page_load_budget', 0, async () => {
      const caseSeed: number = 1237675;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4675);
      expect(record.getDuration()).assertEqual(4675);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1237675);
    });

    // Scenario: exception_handling_scenario_1237676_perf_sampler_bounds
    it('exception_handling_scenario_1237676_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1237676;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(1237676);
    });

    // Scenario: exception_handling_scenario_1237677_config_api_9
    it('exception_handling_scenario_1237677_config_api_9', 0, async () => {
      const caseSeed: number = 1237677;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1237677);
    });

  });
}
