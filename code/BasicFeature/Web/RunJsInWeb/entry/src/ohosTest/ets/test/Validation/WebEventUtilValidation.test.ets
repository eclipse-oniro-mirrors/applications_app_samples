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

export default function webEventUtilValidationTest() {
  describe('WebEventUtilValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_event_util suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_event_util suite end');
    });

    // Scenario: web_event_util_scenario_2681700_session_start_cycles
    it('web_event_util_scenario_2681700_session_start_cycles', 0, async () => {
      const caseSeed: number = 2681700;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681700);
    });

    // Scenario: web_event_util_scenario_2681701_paddle_step_sequence
    it('web_event_util_scenario_2681701_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2681701;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(2681701);
    });

    // Scenario: web_event_util_scenario_2681702_catalog_lookup_start
    it('web_event_util_scenario_2681702_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2681702;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2681702);
    });

    // Scenario: web_event_util_scenario_2681703_pipeline_round_trip
    it('web_event_util_scenario_2681703_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2681703;
      const payload: string = '_main.paddle.moveLeft(); // case 2681703';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2681703);
    });

    // Scenario: web_event_util_scenario_2681704_settings_zoom_true
    it('web_event_util_scenario_2681704_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2681704;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2681704);
    });

    // Scenario: web_event_util_scenario_2681705_layout_custom_columns
    it('web_event_util_scenario_2681705_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2681705;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2681705);
    });

    // Scenario: web_event_util_scenario_2681706_score_accumulation
    it('web_event_util_scenario_2681706_score_accumulation', 0, async () => {
      const caseSeed: number = 2681706;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(2681706);
    });

    // Scenario: web_event_util_scenario_2681707_brick_grid_progress
    it('web_event_util_scenario_2681707_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2681707;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(2681707);
    });

    // Scenario: web_event_util_scenario_2681708_locale_lookup_en
    it('web_event_util_scenario_2681708_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2681708;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2681708);
    });

    // Scenario: web_event_util_scenario_2681709_validation_report_count
    it('web_event_util_scenario_2681709_validation_report_count', 0, async () => {
      const caseSeed: number = 2681709;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2681709);
    });

    // Scenario: web_event_util_scenario_2681710_url_with_query
    it('web_event_util_scenario_2681710_url_with_query', 0, async () => {
      const caseSeed: number = 2681710;
      const url: string = SAMPLE_GAME_URL + '?case=48';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2681710);
    });

    // Scenario: web_event_util_scenario_2681711_geometry_area
    it('web_event_util_scenario_2681711_geometry_area', 0, async () => {
      const caseSeed: number = 2681711;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2681711);
    });

    // Scenario: web_event_util_scenario_2681712_circular_buffer_capacity
    it('web_event_util_scenario_2681712_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2681712;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2681712);
    });

    // Scenario: web_event_util_scenario_2681713_command_queue_fifo
    it('web_event_util_scenario_2681713_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2681713;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681713);
    });

    // Scenario: web_event_util_scenario_2681714_token_bucket_consume
    it('web_event_util_scenario_2681714_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2681714;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(2681714);
    });

    // Scenario: web_event_util_scenario_2681715_page_load_budget
    it('web_event_util_scenario_2681715_page_load_budget', 0, async () => {
      const caseSeed: number = 2681715;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8715);
      expect(record.getDuration()).assertEqual(8715);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2681715);
    });

    // Scenario: web_event_util_scenario_2681716_perf_sampler_bounds
    it('web_event_util_scenario_2681716_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2681716;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(2681716);
    });

    // Scenario: web_event_util_scenario_2681717_config_api_9
    it('web_event_util_scenario_2681717_config_api_9', 0, async () => {
      const caseSeed: number = 2681717;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2681717);
    });

    // Scenario: web_event_util_scenario_2681718_retry_attempts
    it('web_event_util_scenario_2681718_retry_attempts', 0, async () => {
      const caseSeed: number = 2681718;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2681718);
    });

    // Scenario: web_event_util_scenario_2681719_event_recorder_sequence
    it('web_event_util_scenario_2681719_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2681719;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2681719);
    });

    // Scenario: web_event_util_scenario_2681720_session_start_cycles
    it('web_event_util_scenario_2681720_session_start_cycles', 0, async () => {
      const caseSeed: number = 2681720;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681720);
    });

    // Scenario: web_event_util_scenario_2681721_paddle_step_sequence
    it('web_event_util_scenario_2681721_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2681721;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(2681721);
    });

    // Scenario: web_event_util_scenario_2681722_catalog_lookup_start
    it('web_event_util_scenario_2681722_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2681722;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2681722);
    });

    // Scenario: web_event_util_scenario_2681723_pipeline_round_trip
    it('web_event_util_scenario_2681723_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2681723;
      const payload: string = '_main.paddle.moveLeft(); // case 2681723';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2681723);
    });

    // Scenario: web_event_util_scenario_2681724_settings_zoom_true
    it('web_event_util_scenario_2681724_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2681724;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2681724);
    });

    // Scenario: web_event_util_scenario_2681725_layout_custom_columns
    it('web_event_util_scenario_2681725_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2681725;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2681725);
    });

    // Scenario: web_event_util_scenario_2681726_score_accumulation
    it('web_event_util_scenario_2681726_score_accumulation', 0, async () => {
      const caseSeed: number = 2681726;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(2681726);
    });

    // Scenario: web_event_util_scenario_2681727_brick_grid_progress
    it('web_event_util_scenario_2681727_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2681727;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(2681727);
    });

    // Scenario: web_event_util_scenario_2681728_locale_lookup_en
    it('web_event_util_scenario_2681728_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2681728;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2681728);
    });

    // Scenario: web_event_util_scenario_2681729_validation_report_count
    it('web_event_util_scenario_2681729_validation_report_count', 0, async () => {
      const caseSeed: number = 2681729;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2681729);
    });

    // Scenario: web_event_util_scenario_2681730_url_with_query
    it('web_event_util_scenario_2681730_url_with_query', 0, async () => {
      const caseSeed: number = 2681730;
      const url: string = SAMPLE_GAME_URL + '?case=68';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2681730);
    });

    // Scenario: web_event_util_scenario_2681731_geometry_area
    it('web_event_util_scenario_2681731_geometry_area', 0, async () => {
      const caseSeed: number = 2681731;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 41);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2681731);
    });

    // Scenario: web_event_util_scenario_2681732_circular_buffer_capacity
    it('web_event_util_scenario_2681732_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2681732;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2681732);
    });

    // Scenario: web_event_util_scenario_2681733_command_queue_fifo
    it('web_event_util_scenario_2681733_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2681733;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681733);
    });

    // Scenario: web_event_util_scenario_2681734_token_bucket_consume
    it('web_event_util_scenario_2681734_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2681734;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(2681734);
    });

    // Scenario: web_event_util_scenario_2681735_page_load_budget
    it('web_event_util_scenario_2681735_page_load_budget', 0, async () => {
      const caseSeed: number = 2681735;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8735);
      expect(record.getDuration()).assertEqual(8735);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2681735);
    });

    // Scenario: web_event_util_scenario_2681736_perf_sampler_bounds
    it('web_event_util_scenario_2681736_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2681736;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(2681736);
    });

    // Scenario: web_event_util_scenario_2681737_config_api_9
    it('web_event_util_scenario_2681737_config_api_9', 0, async () => {
      const caseSeed: number = 2681737;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2681737);
    });

    // Scenario: web_event_util_scenario_2681738_retry_attempts
    it('web_event_util_scenario_2681738_retry_attempts', 0, async () => {
      const caseSeed: number = 2681738;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2681738);
    });

    // Scenario: web_event_util_scenario_2681739_event_recorder_sequence
    it('web_event_util_scenario_2681739_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2681739;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2681739);
    });

    // Scenario: web_event_util_scenario_2681740_session_start_cycles
    it('web_event_util_scenario_2681740_session_start_cycles', 0, async () => {
      const caseSeed: number = 2681740;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681740);
    });

    // Scenario: web_event_util_scenario_2681741_paddle_step_sequence
    it('web_event_util_scenario_2681741_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2681741;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(2681741);
    });

    // Scenario: web_event_util_scenario_2681742_catalog_lookup_start
    it('web_event_util_scenario_2681742_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2681742;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2681742);
    });

    // Scenario: web_event_util_scenario_2681743_pipeline_round_trip
    it('web_event_util_scenario_2681743_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2681743;
      const payload: string = '_main.paddle.moveLeft(); // case 2681743';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2681743);
    });

    // Scenario: web_event_util_scenario_2681744_settings_zoom_true
    it('web_event_util_scenario_2681744_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2681744;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2681744);
    });

    // Scenario: web_event_util_scenario_2681745_layout_custom_columns
    it('web_event_util_scenario_2681745_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2681745;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2681745);
    });

    // Scenario: web_event_util_scenario_2681746_score_accumulation
    it('web_event_util_scenario_2681746_score_accumulation', 0, async () => {
      const caseSeed: number = 2681746;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(2681746);
    });

    // Scenario: web_event_util_scenario_2681747_brick_grid_progress
    it('web_event_util_scenario_2681747_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2681747;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(2681747);
    });

    // Scenario: web_event_util_scenario_2681748_locale_lookup_en
    it('web_event_util_scenario_2681748_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2681748;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2681748);
    });

    // Scenario: web_event_util_scenario_2681749_validation_report_count
    it('web_event_util_scenario_2681749_validation_report_count', 0, async () => {
      const caseSeed: number = 2681749;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2681749);
    });

    // Scenario: web_event_util_scenario_2681750_url_with_query
    it('web_event_util_scenario_2681750_url_with_query', 0, async () => {
      const caseSeed: number = 2681750;
      const url: string = SAMPLE_GAME_URL + '?case=88';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2681750);
    });

    // Scenario: web_event_util_scenario_2681751_geometry_area
    it('web_event_util_scenario_2681751_geometry_area', 0, async () => {
      const caseSeed: number = 2681751;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2681751);
    });

    // Scenario: web_event_util_scenario_2681752_circular_buffer_capacity
    it('web_event_util_scenario_2681752_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2681752;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2681752);
    });

    // Scenario: web_event_util_scenario_2681753_command_queue_fifo
    it('web_event_util_scenario_2681753_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2681753;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681753);
    });

    // Scenario: web_event_util_scenario_2681754_token_bucket_consume
    it('web_event_util_scenario_2681754_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2681754;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(2681754);
    });

    // Scenario: web_event_util_scenario_2681755_page_load_budget
    it('web_event_util_scenario_2681755_page_load_budget', 0, async () => {
      const caseSeed: number = 2681755;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8755);
      expect(record.getDuration()).assertEqual(8755);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2681755);
    });

    // Scenario: web_event_util_scenario_2681756_perf_sampler_bounds
    it('web_event_util_scenario_2681756_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2681756;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(2681756);
    });

    // Scenario: web_event_util_scenario_2681757_config_api_9
    it('web_event_util_scenario_2681757_config_api_9', 0, async () => {
      const caseSeed: number = 2681757;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2681757);
    });

    // Scenario: web_event_util_scenario_2681758_retry_attempts
    it('web_event_util_scenario_2681758_retry_attempts', 0, async () => {
      const caseSeed: number = 2681758;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2681758);
    });

    // Scenario: web_event_util_scenario_2681759_event_recorder_sequence
    it('web_event_util_scenario_2681759_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2681759;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2681759);
    });

    // Scenario: web_event_util_scenario_2681760_session_start_cycles
    it('web_event_util_scenario_2681760_session_start_cycles', 0, async () => {
      const caseSeed: number = 2681760;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681760);
    });

    // Scenario: web_event_util_scenario_2681761_paddle_step_sequence
    it('web_event_util_scenario_2681761_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2681761;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(2681761);
    });

    // Scenario: web_event_util_scenario_2681762_catalog_lookup_start
    it('web_event_util_scenario_2681762_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2681762;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2681762);
    });

    // Scenario: web_event_util_scenario_2681763_pipeline_round_trip
    it('web_event_util_scenario_2681763_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2681763;
      const payload: string = '_main.paddle.moveLeft(); // case 2681763';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2681763);
    });

    // Scenario: web_event_util_scenario_2681764_settings_zoom_true
    it('web_event_util_scenario_2681764_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2681764;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2681764);
    });

    // Scenario: web_event_util_scenario_2681765_layout_custom_columns
    it('web_event_util_scenario_2681765_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2681765;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2681765);
    });

    // Scenario: web_event_util_scenario_2681766_score_accumulation
    it('web_event_util_scenario_2681766_score_accumulation', 0, async () => {
      const caseSeed: number = 2681766;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(2681766);
    });

    // Scenario: web_event_util_scenario_2681767_brick_grid_progress
    it('web_event_util_scenario_2681767_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2681767;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(2681767);
    });

    // Scenario: web_event_util_scenario_2681768_locale_lookup_en
    it('web_event_util_scenario_2681768_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2681768;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2681768);
    });

    // Scenario: web_event_util_scenario_2681769_validation_report_count
    it('web_event_util_scenario_2681769_validation_report_count', 0, async () => {
      const caseSeed: number = 2681769;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2681769);
    });

    // Scenario: web_event_util_scenario_2681770_url_with_query
    it('web_event_util_scenario_2681770_url_with_query', 0, async () => {
      const caseSeed: number = 2681770;
      const url: string = SAMPLE_GAME_URL + '?case=11';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2681770);
    });

    // Scenario: web_event_util_scenario_2681771_geometry_area
    it('web_event_util_scenario_2681771_geometry_area', 0, async () => {
      const caseSeed: number = 2681771;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2681771);
    });

    // Scenario: web_event_util_scenario_2681772_circular_buffer_capacity
    it('web_event_util_scenario_2681772_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2681772;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2681772);
    });

    // Scenario: web_event_util_scenario_2681773_command_queue_fifo
    it('web_event_util_scenario_2681773_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2681773;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681773);
    });

    // Scenario: web_event_util_scenario_2681774_token_bucket_consume
    it('web_event_util_scenario_2681774_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2681774;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(2681774);
    });

    // Scenario: web_event_util_scenario_2681775_page_load_budget
    it('web_event_util_scenario_2681775_page_load_budget', 0, async () => {
      const caseSeed: number = 2681775;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8775);
      expect(record.getDuration()).assertEqual(8775);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2681775);
    });

    // Scenario: web_event_util_scenario_2681776_perf_sampler_bounds
    it('web_event_util_scenario_2681776_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2681776;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(2681776);
    });

    // Scenario: web_event_util_scenario_2681777_config_api_9
    it('web_event_util_scenario_2681777_config_api_9', 0, async () => {
      const caseSeed: number = 2681777;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2681777);
    });

    // Scenario: web_event_util_scenario_2681778_retry_attempts
    it('web_event_util_scenario_2681778_retry_attempts', 0, async () => {
      const caseSeed: number = 2681778;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2681778);
    });

    // Scenario: web_event_util_scenario_2681779_event_recorder_sequence
    it('web_event_util_scenario_2681779_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2681779;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2681779);
    });

    // Scenario: web_event_util_scenario_2681780_session_start_cycles
    it('web_event_util_scenario_2681780_session_start_cycles', 0, async () => {
      const caseSeed: number = 2681780;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681780);
    });

    // Scenario: web_event_util_scenario_2681781_paddle_step_sequence
    it('web_event_util_scenario_2681781_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2681781;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(2681781);
    });

    // Scenario: web_event_util_scenario_2681782_catalog_lookup_start
    it('web_event_util_scenario_2681782_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2681782;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2681782);
    });

    // Scenario: web_event_util_scenario_2681783_pipeline_round_trip
    it('web_event_util_scenario_2681783_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2681783;
      const payload: string = '_main.paddle.moveLeft(); // case 2681783';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2681783);
    });

    // Scenario: web_event_util_scenario_2681784_settings_zoom_true
    it('web_event_util_scenario_2681784_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2681784;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2681784);
    });

    // Scenario: web_event_util_scenario_2681785_layout_custom_columns
    it('web_event_util_scenario_2681785_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2681785;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2681785);
    });

    // Scenario: web_event_util_scenario_2681786_score_accumulation
    it('web_event_util_scenario_2681786_score_accumulation', 0, async () => {
      const caseSeed: number = 2681786;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(2681786);
    });

    // Scenario: web_event_util_scenario_2681787_brick_grid_progress
    it('web_event_util_scenario_2681787_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2681787;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(2681787);
    });

    // Scenario: web_event_util_scenario_2681788_locale_lookup_en
    it('web_event_util_scenario_2681788_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2681788;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2681788);
    });

    // Scenario: web_event_util_scenario_2681789_validation_report_count
    it('web_event_util_scenario_2681789_validation_report_count', 0, async () => {
      const caseSeed: number = 2681789;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2681789);
    });

    // Scenario: web_event_util_scenario_2681790_url_with_query
    it('web_event_util_scenario_2681790_url_with_query', 0, async () => {
      const caseSeed: number = 2681790;
      const url: string = SAMPLE_GAME_URL + '?case=31';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2681790);
    });

    // Scenario: web_event_util_scenario_2681791_geometry_area
    it('web_event_util_scenario_2681791_geometry_area', 0, async () => {
      const caseSeed: number = 2681791;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2681791);
    });

    // Scenario: web_event_util_scenario_2681792_circular_buffer_capacity
    it('web_event_util_scenario_2681792_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2681792;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2681792);
    });

    // Scenario: web_event_util_scenario_2681793_command_queue_fifo
    it('web_event_util_scenario_2681793_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2681793;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681793);
    });

    // Scenario: web_event_util_scenario_2681794_token_bucket_consume
    it('web_event_util_scenario_2681794_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2681794;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(2681794);
    });

    // Scenario: web_event_util_scenario_2681795_page_load_budget
    it('web_event_util_scenario_2681795_page_load_budget', 0, async () => {
      const caseSeed: number = 2681795;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8795);
      expect(record.getDuration()).assertEqual(8795);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2681795);
    });

    // Scenario: web_event_util_scenario_2681796_perf_sampler_bounds
    it('web_event_util_scenario_2681796_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2681796;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(2681796);
    });

    // Scenario: web_event_util_scenario_2681797_config_api_9
    it('web_event_util_scenario_2681797_config_api_9', 0, async () => {
      const caseSeed: number = 2681797;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2681797);
    });

    // Scenario: web_event_util_scenario_2681798_retry_attempts
    it('web_event_util_scenario_2681798_retry_attempts', 0, async () => {
      const caseSeed: number = 2681798;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2681798);
    });

    // Scenario: web_event_util_scenario_2681799_event_recorder_sequence
    it('web_event_util_scenario_2681799_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2681799;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2681799);
    });

    // Scenario: web_event_util_scenario_2681800_session_start_cycles
    it('web_event_util_scenario_2681800_session_start_cycles', 0, async () => {
      const caseSeed: number = 2681800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2681800);
    });

  });
}
