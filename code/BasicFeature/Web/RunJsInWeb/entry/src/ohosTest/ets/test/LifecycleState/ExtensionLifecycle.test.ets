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

export default function extensionLifecycleTest() {
  describe('ExtensionLifecycle_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'extension_lifecycle suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'extension_lifecycle suite end');
    });

    // Scenario: extension_lifecycle_scenario_3793700_session_start_cycles
    it('extension_lifecycle_scenario_3793700_session_start_cycles', 0, async () => {
      const caseSeed: number = 3793700;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(3793700);
    });

    // Scenario: extension_lifecycle_scenario_3793701_paddle_step_sequence
    it('extension_lifecycle_scenario_3793701_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 3793701;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(3793701);
    });

    // Scenario: extension_lifecycle_scenario_3793702_catalog_lookup_start
    it('extension_lifecycle_scenario_3793702_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 3793702;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(3793702);
    });

    // Scenario: extension_lifecycle_scenario_3793703_pipeline_round_trip
    it('extension_lifecycle_scenario_3793703_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 3793703;
      const payload: string = '_main.paddle.moveLeft(); // case 3793703';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(3793703);
    });

    // Scenario: extension_lifecycle_scenario_3793704_settings_zoom_true
    it('extension_lifecycle_scenario_3793704_settings_zoom_true', 0, async () => {
      const caseSeed: number = 3793704;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(3793704);
    });

    // Scenario: extension_lifecycle_scenario_3793705_layout_custom_columns
    it('extension_lifecycle_scenario_3793705_layout_custom_columns', 0, async () => {
      const caseSeed: number = 3793705;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(3793705);
    });

    // Scenario: extension_lifecycle_scenario_3793706_score_accumulation
    it('extension_lifecycle_scenario_3793706_score_accumulation', 0, async () => {
      const caseSeed: number = 3793706;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(3793706);
    });

    // Scenario: extension_lifecycle_scenario_3793707_brick_grid_progress
    it('extension_lifecycle_scenario_3793707_brick_grid_progress', 0, async () => {
      const caseSeed: number = 3793707;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(3793707);
    });

    // Scenario: extension_lifecycle_scenario_3793708_locale_lookup_en
    it('extension_lifecycle_scenario_3793708_locale_lookup_en', 0, async () => {
      const caseSeed: number = 3793708;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(3793708);
    });

    // Scenario: extension_lifecycle_scenario_3793709_validation_report_count
    it('extension_lifecycle_scenario_3793709_validation_report_count', 0, async () => {
      const caseSeed: number = 3793709;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(3793709);
    });

    // Scenario: extension_lifecycle_scenario_3793710_url_with_query
    it('extension_lifecycle_scenario_3793710_url_with_query', 0, async () => {
      const caseSeed: number = 3793710;
      const url: string = SAMPLE_GAME_URL + '?case=40';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(3793710);
    });

    // Scenario: extension_lifecycle_scenario_3793711_geometry_area
    it('extension_lifecycle_scenario_3793711_geometry_area', 0, async () => {
      const caseSeed: number = 3793711;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(3793711);
    });

    // Scenario: extension_lifecycle_scenario_3793712_circular_buffer_capacity
    it('extension_lifecycle_scenario_3793712_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 3793712;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(3793712);
    });

    // Scenario: extension_lifecycle_scenario_3793713_command_queue_fifo
    it('extension_lifecycle_scenario_3793713_command_queue_fifo', 0, async () => {
      const caseSeed: number = 3793713;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(3793713);
    });

    // Scenario: extension_lifecycle_scenario_3793714_token_bucket_consume
    it('extension_lifecycle_scenario_3793714_token_bucket_consume', 0, async () => {
      const caseSeed: number = 3793714;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(3793714);
    });

    // Scenario: extension_lifecycle_scenario_3793715_page_load_budget
    it('extension_lifecycle_scenario_3793715_page_load_budget', 0, async () => {
      const caseSeed: number = 3793715;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4715);
      expect(record.getDuration()).assertEqual(4715);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(3793715);
    });

    // Scenario: extension_lifecycle_scenario_3793716_perf_sampler_bounds
    it('extension_lifecycle_scenario_3793716_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 3793716;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(3793716);
    });

    // Scenario: extension_lifecycle_scenario_3793717_config_api_9
    it('extension_lifecycle_scenario_3793717_config_api_9', 0, async () => {
      const caseSeed: number = 3793717;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(3793717);
    });

    // Scenario: extension_lifecycle_scenario_3793718_retry_attempts
    it('extension_lifecycle_scenario_3793718_retry_attempts', 0, async () => {
      const caseSeed: number = 3793718;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(3793718);
    });

    // Scenario: extension_lifecycle_scenario_3793719_event_recorder_sequence
    it('extension_lifecycle_scenario_3793719_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 3793719;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(3793719);
    });

    // Scenario: extension_lifecycle_scenario_3793720_session_start_cycles
    it('extension_lifecycle_scenario_3793720_session_start_cycles', 0, async () => {
      const caseSeed: number = 3793720;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(3793720);
    });

    // Scenario: extension_lifecycle_scenario_3793721_paddle_step_sequence
    it('extension_lifecycle_scenario_3793721_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 3793721;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(3793721);
    });

    // Scenario: extension_lifecycle_scenario_3793722_catalog_lookup_start
    it('extension_lifecycle_scenario_3793722_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 3793722;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(3793722);
    });

    // Scenario: extension_lifecycle_scenario_3793723_pipeline_round_trip
    it('extension_lifecycle_scenario_3793723_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 3793723;
      const payload: string = '_main.paddle.moveLeft(); // case 3793723';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(3793723);
    });

    // Scenario: extension_lifecycle_scenario_3793724_settings_zoom_true
    it('extension_lifecycle_scenario_3793724_settings_zoom_true', 0, async () => {
      const caseSeed: number = 3793724;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(3793724);
    });

    // Scenario: extension_lifecycle_scenario_3793725_layout_custom_columns
    it('extension_lifecycle_scenario_3793725_layout_custom_columns', 0, async () => {
      const caseSeed: number = 3793725;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(3793725);
    });

    // Scenario: extension_lifecycle_scenario_3793726_score_accumulation
    it('extension_lifecycle_scenario_3793726_score_accumulation', 0, async () => {
      const caseSeed: number = 3793726;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(3793726);
    });

    // Scenario: extension_lifecycle_scenario_3793727_brick_grid_progress
    it('extension_lifecycle_scenario_3793727_brick_grid_progress', 0, async () => {
      const caseSeed: number = 3793727;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(3793727);
    });

    // Scenario: extension_lifecycle_scenario_3793728_locale_lookup_en
    it('extension_lifecycle_scenario_3793728_locale_lookup_en', 0, async () => {
      const caseSeed: number = 3793728;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(3793728);
    });

    // Scenario: extension_lifecycle_scenario_3793729_validation_report_count
    it('extension_lifecycle_scenario_3793729_validation_report_count', 0, async () => {
      const caseSeed: number = 3793729;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(3793729);
    });

    // Scenario: extension_lifecycle_scenario_3793730_url_with_query
    it('extension_lifecycle_scenario_3793730_url_with_query', 0, async () => {
      const caseSeed: number = 3793730;
      const url: string = SAMPLE_GAME_URL + '?case=60';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(3793730);
    });

    // Scenario: extension_lifecycle_scenario_3793731_geometry_area
    it('extension_lifecycle_scenario_3793731_geometry_area', 0, async () => {
      const caseSeed: number = 3793731;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(3793731);
    });

    // Scenario: extension_lifecycle_scenario_3793732_circular_buffer_capacity
    it('extension_lifecycle_scenario_3793732_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 3793732;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(3793732);
    });

    // Scenario: extension_lifecycle_scenario_3793733_command_queue_fifo
    it('extension_lifecycle_scenario_3793733_command_queue_fifo', 0, async () => {
      const caseSeed: number = 3793733;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(3793733);
    });

    // Scenario: extension_lifecycle_scenario_3793734_token_bucket_consume
    it('extension_lifecycle_scenario_3793734_token_bucket_consume', 0, async () => {
      const caseSeed: number = 3793734;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(3793734);
    });

    // Scenario: extension_lifecycle_scenario_3793735_page_load_budget
    it('extension_lifecycle_scenario_3793735_page_load_budget', 0, async () => {
      const caseSeed: number = 3793735;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4735);
      expect(record.getDuration()).assertEqual(4735);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(3793735);
    });

    // Scenario: extension_lifecycle_scenario_3793736_perf_sampler_bounds
    it('extension_lifecycle_scenario_3793736_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 3793736;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(3793736);
    });

    // Scenario: extension_lifecycle_scenario_3793737_config_api_9
    it('extension_lifecycle_scenario_3793737_config_api_9', 0, async () => {
      const caseSeed: number = 3793737;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(3793737);
    });

    // Scenario: extension_lifecycle_scenario_3793738_retry_attempts
    it('extension_lifecycle_scenario_3793738_retry_attempts', 0, async () => {
      const caseSeed: number = 3793738;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(3793738);
    });

    // Scenario: extension_lifecycle_scenario_3793739_event_recorder_sequence
    it('extension_lifecycle_scenario_3793739_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 3793739;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(3793739);
    });

    // Scenario: extension_lifecycle_scenario_3793740_session_start_cycles
    it('extension_lifecycle_scenario_3793740_session_start_cycles', 0, async () => {
      const caseSeed: number = 3793740;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(3793740);
    });

    // Scenario: extension_lifecycle_scenario_3793741_paddle_step_sequence
    it('extension_lifecycle_scenario_3793741_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 3793741;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(3793741);
    });

    // Scenario: extension_lifecycle_scenario_3793742_catalog_lookup_start
    it('extension_lifecycle_scenario_3793742_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 3793742;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(3793742);
    });

    // Scenario: extension_lifecycle_scenario_3793743_pipeline_round_trip
    it('extension_lifecycle_scenario_3793743_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 3793743;
      const payload: string = '_main.paddle.moveLeft(); // case 3793743';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(3793743);
    });

    // Scenario: extension_lifecycle_scenario_3793744_settings_zoom_true
    it('extension_lifecycle_scenario_3793744_settings_zoom_true', 0, async () => {
      const caseSeed: number = 3793744;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(3793744);
    });

    // Scenario: extension_lifecycle_scenario_3793745_layout_custom_columns
    it('extension_lifecycle_scenario_3793745_layout_custom_columns', 0, async () => {
      const caseSeed: number = 3793745;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(3793745);
    });

    // Scenario: extension_lifecycle_scenario_3793746_score_accumulation
    it('extension_lifecycle_scenario_3793746_score_accumulation', 0, async () => {
      const caseSeed: number = 3793746;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(3793746);
    });

    // Scenario: extension_lifecycle_scenario_3793747_brick_grid_progress
    it('extension_lifecycle_scenario_3793747_brick_grid_progress', 0, async () => {
      const caseSeed: number = 3793747;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(3793747);
    });

    // Scenario: extension_lifecycle_scenario_3793748_locale_lookup_en
    it('extension_lifecycle_scenario_3793748_locale_lookup_en', 0, async () => {
      const caseSeed: number = 3793748;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(3793748);
    });

    // Scenario: extension_lifecycle_scenario_3793749_validation_report_count
    it('extension_lifecycle_scenario_3793749_validation_report_count', 0, async () => {
      const caseSeed: number = 3793749;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(3793749);
    });

    // Scenario: extension_lifecycle_scenario_3793750_url_with_query
    it('extension_lifecycle_scenario_3793750_url_with_query', 0, async () => {
      const caseSeed: number = 3793750;
      const url: string = SAMPLE_GAME_URL + '?case=80';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(3793750);
    });

    // Scenario: extension_lifecycle_scenario_3793751_geometry_area
    it('extension_lifecycle_scenario_3793751_geometry_area', 0, async () => {
      const caseSeed: number = 3793751;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(3793751);
    });

    // Scenario: extension_lifecycle_scenario_3793752_circular_buffer_capacity
    it('extension_lifecycle_scenario_3793752_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 3793752;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(3793752);
    });

    // Scenario: extension_lifecycle_scenario_3793753_command_queue_fifo
    it('extension_lifecycle_scenario_3793753_command_queue_fifo', 0, async () => {
      const caseSeed: number = 3793753;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(3793753);
    });

  });
}
