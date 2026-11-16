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

export default function webAuthSessionTest() {
  describe('WebAuthSession_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_auth_session suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_auth_session suite end');
    });

    // Scenario: web_auth_session_scenario_952700_session_start_cycles
    it('web_auth_session_scenario_952700_session_start_cycles', 0, async () => {
      const caseSeed: number = 952700;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(952700);
    });

    // Scenario: web_auth_session_scenario_952701_paddle_step_sequence
    it('web_auth_session_scenario_952701_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 952701;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(952701);
    });

    // Scenario: web_auth_session_scenario_952702_catalog_lookup_start
    it('web_auth_session_scenario_952702_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 952702;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(952702);
    });

    // Scenario: web_auth_session_scenario_952703_pipeline_round_trip
    it('web_auth_session_scenario_952703_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 952703;
      const payload: string = '_main.paddle.moveLeft(); // case 952703';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(952703);
    });

    // Scenario: web_auth_session_scenario_952704_settings_zoom_true
    it('web_auth_session_scenario_952704_settings_zoom_true', 0, async () => {
      const caseSeed: number = 952704;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(952704);
    });

    // Scenario: web_auth_session_scenario_952705_layout_custom_columns
    it('web_auth_session_scenario_952705_layout_custom_columns', 0, async () => {
      const caseSeed: number = 952705;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(952705);
    });

    // Scenario: web_auth_session_scenario_952706_score_accumulation
    it('web_auth_session_scenario_952706_score_accumulation', 0, async () => {
      const caseSeed: number = 952706;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(952706);
    });

    // Scenario: web_auth_session_scenario_952707_brick_grid_progress
    it('web_auth_session_scenario_952707_brick_grid_progress', 0, async () => {
      const caseSeed: number = 952707;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(952707);
    });

    // Scenario: web_auth_session_scenario_952708_locale_lookup_en
    it('web_auth_session_scenario_952708_locale_lookup_en', 0, async () => {
      const caseSeed: number = 952708;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(952708);
    });

    // Scenario: web_auth_session_scenario_952709_validation_report_count
    it('web_auth_session_scenario_952709_validation_report_count', 0, async () => {
      const caseSeed: number = 952709;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(952709);
    });

    // Scenario: web_auth_session_scenario_952710_url_with_query
    it('web_auth_session_scenario_952710_url_with_query', 0, async () => {
      const caseSeed: number = 952710;
      const url: string = SAMPLE_GAME_URL + '?case=73';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(952710);
    });

    // Scenario: web_auth_session_scenario_952711_geometry_area
    it('web_auth_session_scenario_952711_geometry_area', 0, async () => {
      const caseSeed: number = 952711;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 41);
      expect(box.area()).assertEqual(3321);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(952711);
    });

    // Scenario: web_auth_session_scenario_952712_circular_buffer_capacity
    it('web_auth_session_scenario_952712_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 952712;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(952712);
    });

    // Scenario: web_auth_session_scenario_952713_command_queue_fifo
    it('web_auth_session_scenario_952713_command_queue_fifo', 0, async () => {
      const caseSeed: number = 952713;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(952713);
    });

    // Scenario: web_auth_session_scenario_952714_token_bucket_consume
    it('web_auth_session_scenario_952714_token_bucket_consume', 0, async () => {
      const caseSeed: number = 952714;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(952714);
    });

    // Scenario: web_auth_session_scenario_952715_page_load_budget
    it('web_auth_session_scenario_952715_page_load_budget', 0, async () => {
      const caseSeed: number = 952715;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7715);
      expect(record.getDuration()).assertEqual(7715);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(952715);
    });

    // Scenario: web_auth_session_scenario_952716_perf_sampler_bounds
    it('web_auth_session_scenario_952716_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 952716;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(952716);
    });

    // Scenario: web_auth_session_scenario_952717_config_api_9
    it('web_auth_session_scenario_952717_config_api_9', 0, async () => {
      const caseSeed: number = 952717;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(952717);
    });

    // Scenario: web_auth_session_scenario_952718_retry_attempts
    it('web_auth_session_scenario_952718_retry_attempts', 0, async () => {
      const caseSeed: number = 952718;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(952718);
    });

    // Scenario: web_auth_session_scenario_952719_event_recorder_sequence
    it('web_auth_session_scenario_952719_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 952719;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(952719);
    });

    // Scenario: web_auth_session_scenario_952720_session_start_cycles
    it('web_auth_session_scenario_952720_session_start_cycles', 0, async () => {
      const caseSeed: number = 952720;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(952720);
    });

    // Scenario: web_auth_session_scenario_952721_paddle_step_sequence
    it('web_auth_session_scenario_952721_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 952721;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(952721);
    });

    // Scenario: web_auth_session_scenario_952722_catalog_lookup_start
    it('web_auth_session_scenario_952722_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 952722;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(952722);
    });

    // Scenario: web_auth_session_scenario_952723_pipeline_round_trip
    it('web_auth_session_scenario_952723_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 952723;
      const payload: string = '_main.paddle.moveLeft(); // case 952723';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(952723);
    });

    // Scenario: web_auth_session_scenario_952724_settings_zoom_true
    it('web_auth_session_scenario_952724_settings_zoom_true', 0, async () => {
      const caseSeed: number = 952724;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(952724);
    });

    // Scenario: web_auth_session_scenario_952725_layout_custom_columns
    it('web_auth_session_scenario_952725_layout_custom_columns', 0, async () => {
      const caseSeed: number = 952725;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(952725);
    });

    // Scenario: web_auth_session_scenario_952726_score_accumulation
    it('web_auth_session_scenario_952726_score_accumulation', 0, async () => {
      const caseSeed: number = 952726;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(952726);
    });

    // Scenario: web_auth_session_scenario_952727_brick_grid_progress
    it('web_auth_session_scenario_952727_brick_grid_progress', 0, async () => {
      const caseSeed: number = 952727;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(952727);
    });

    // Scenario: web_auth_session_scenario_952728_locale_lookup_en
    it('web_auth_session_scenario_952728_locale_lookup_en', 0, async () => {
      const caseSeed: number = 952728;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(952728);
    });

    // Scenario: web_auth_session_scenario_952729_validation_report_count
    it('web_auth_session_scenario_952729_validation_report_count', 0, async () => {
      const caseSeed: number = 952729;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(952729);
    });

    // Scenario: web_auth_session_scenario_952730_url_with_query
    it('web_auth_session_scenario_952730_url_with_query', 0, async () => {
      const caseSeed: number = 952730;
      const url: string = SAMPLE_GAME_URL + '?case=93';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(952730);
    });

    // Scenario: web_auth_session_scenario_952731_geometry_area
    it('web_auth_session_scenario_952731_geometry_area', 0, async () => {
      const caseSeed: number = 952731;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 61);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(952731);
    });

    // Scenario: web_auth_session_scenario_952732_circular_buffer_capacity
    it('web_auth_session_scenario_952732_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 952732;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(952732);
    });

    // Scenario: web_auth_session_scenario_952733_command_queue_fifo
    it('web_auth_session_scenario_952733_command_queue_fifo', 0, async () => {
      const caseSeed: number = 952733;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(952733);
    });

    // Scenario: web_auth_session_scenario_952734_token_bucket_consume
    it('web_auth_session_scenario_952734_token_bucket_consume', 0, async () => {
      const caseSeed: number = 952734;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(952734);
    });

    // Scenario: web_auth_session_scenario_952735_page_load_budget
    it('web_auth_session_scenario_952735_page_load_budget', 0, async () => {
      const caseSeed: number = 952735;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7735);
      expect(record.getDuration()).assertEqual(7735);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(952735);
    });

    // Scenario: web_auth_session_scenario_952736_perf_sampler_bounds
    it('web_auth_session_scenario_952736_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 952736;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(952736);
    });

    // Scenario: web_auth_session_scenario_952737_config_api_9
    it('web_auth_session_scenario_952737_config_api_9', 0, async () => {
      const caseSeed: number = 952737;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(952737);
    });

    // Scenario: web_auth_session_scenario_952738_retry_attempts
    it('web_auth_session_scenario_952738_retry_attempts', 0, async () => {
      const caseSeed: number = 952738;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(952738);
    });

    // Scenario: web_auth_session_scenario_952739_event_recorder_sequence
    it('web_auth_session_scenario_952739_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 952739;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(952739);
    });

    // Scenario: web_auth_session_scenario_952740_session_start_cycles
    it('web_auth_session_scenario_952740_session_start_cycles', 0, async () => {
      const caseSeed: number = 952740;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(952740);
    });

    // Scenario: web_auth_session_scenario_952741_paddle_step_sequence
    it('web_auth_session_scenario_952741_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 952741;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(952741);
    });

    // Scenario: web_auth_session_scenario_952742_catalog_lookup_start
    it('web_auth_session_scenario_952742_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 952742;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(952742);
    });

    // Scenario: web_auth_session_scenario_952743_pipeline_round_trip
    it('web_auth_session_scenario_952743_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 952743;
      const payload: string = '_main.paddle.moveLeft(); // case 952743';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(952743);
    });

    // Scenario: web_auth_session_scenario_952744_settings_zoom_true
    it('web_auth_session_scenario_952744_settings_zoom_true', 0, async () => {
      const caseSeed: number = 952744;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(952744);
    });

    // Scenario: web_auth_session_scenario_952745_layout_custom_columns
    it('web_auth_session_scenario_952745_layout_custom_columns', 0, async () => {
      const caseSeed: number = 952745;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(952745);
    });

    // Scenario: web_auth_session_scenario_952746_score_accumulation
    it('web_auth_session_scenario_952746_score_accumulation', 0, async () => {
      const caseSeed: number = 952746;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(952746);
    });

    // Scenario: web_auth_session_scenario_952747_brick_grid_progress
    it('web_auth_session_scenario_952747_brick_grid_progress', 0, async () => {
      const caseSeed: number = 952747;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(952747);
    });

    // Scenario: web_auth_session_scenario_952748_locale_lookup_en
    it('web_auth_session_scenario_952748_locale_lookup_en', 0, async () => {
      const caseSeed: number = 952748;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(952748);
    });

    // Scenario: web_auth_session_scenario_952749_validation_report_count
    it('web_auth_session_scenario_952749_validation_report_count', 0, async () => {
      const caseSeed: number = 952749;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(952749);
    });

    // Scenario: web_auth_session_scenario_952750_url_with_query
    it('web_auth_session_scenario_952750_url_with_query', 0, async () => {
      const caseSeed: number = 952750;
      const url: string = SAMPLE_GAME_URL + '?case=16';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(952750);
    });

    // Scenario: web_auth_session_scenario_952751_geometry_area
    it('web_auth_session_scenario_952751_geometry_area', 0, async () => {
      const caseSeed: number = 952751;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(952751);
    });

    // Scenario: web_auth_session_scenario_952752_circular_buffer_capacity
    it('web_auth_session_scenario_952752_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 952752;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(952752);
    });

    // Scenario: web_auth_session_scenario_952753_command_queue_fifo
    it('web_auth_session_scenario_952753_command_queue_fifo', 0, async () => {
      const caseSeed: number = 952753;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(952753);
    });

    // Scenario: web_auth_session_scenario_952754_token_bucket_consume
    it('web_auth_session_scenario_952754_token_bucket_consume', 0, async () => {
      const caseSeed: number = 952754;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(952754);
    });

    // Scenario: web_auth_session_scenario_952755_page_load_budget
    it('web_auth_session_scenario_952755_page_load_budget', 0, async () => {
      const caseSeed: number = 952755;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7755);
      expect(record.getDuration()).assertEqual(7755);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(952755);
    });

    // Scenario: web_auth_session_scenario_952756_perf_sampler_bounds
    it('web_auth_session_scenario_952756_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 952756;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(952756);
    });

    // Scenario: web_auth_session_scenario_952757_config_api_9
    it('web_auth_session_scenario_952757_config_api_9', 0, async () => {
      const caseSeed: number = 952757;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(952757);
    });

    // Scenario: web_auth_session_scenario_952758_retry_attempts
    it('web_auth_session_scenario_952758_retry_attempts', 0, async () => {
      const caseSeed: number = 952758;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(952758);
    });

    // Scenario: web_auth_session_scenario_952759_event_recorder_sequence
    it('web_auth_session_scenario_952759_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 952759;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(952759);
    });

    // Scenario: web_auth_session_scenario_952760_session_start_cycles
    it('web_auth_session_scenario_952760_session_start_cycles', 0, async () => {
      const caseSeed: number = 952760;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(952760);
    });

    // Scenario: web_auth_session_scenario_952761_paddle_step_sequence
    it('web_auth_session_scenario_952761_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 952761;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(952761);
    });

    // Scenario: web_auth_session_scenario_952762_catalog_lookup_start
    it('web_auth_session_scenario_952762_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 952762;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(952762);
    });

    // Scenario: web_auth_session_scenario_952763_pipeline_round_trip
    it('web_auth_session_scenario_952763_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 952763;
      const payload: string = '_main.paddle.moveLeft(); // case 952763';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(952763);
    });

    // Scenario: web_auth_session_scenario_952764_settings_zoom_true
    it('web_auth_session_scenario_952764_settings_zoom_true', 0, async () => {
      const caseSeed: number = 952764;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(952764);
    });

    // Scenario: web_auth_session_scenario_952765_layout_custom_columns
    it('web_auth_session_scenario_952765_layout_custom_columns', 0, async () => {
      const caseSeed: number = 952765;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(952765);
    });

    // Scenario: web_auth_session_scenario_952766_score_accumulation
    it('web_auth_session_scenario_952766_score_accumulation', 0, async () => {
      const caseSeed: number = 952766;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(952766);
    });

    // Scenario: web_auth_session_scenario_952767_brick_grid_progress
    it('web_auth_session_scenario_952767_brick_grid_progress', 0, async () => {
      const caseSeed: number = 952767;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(952767);
    });

    // Scenario: web_auth_session_scenario_952768_locale_lookup_en
    it('web_auth_session_scenario_952768_locale_lookup_en', 0, async () => {
      const caseSeed: number = 952768;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(952768);
    });

  });
}
