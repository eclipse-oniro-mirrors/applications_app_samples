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

export default function webGameStateManagementTest() {
  describe('WebGameStateManagement_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_state suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_state suite end');
    });

    // Scenario: game_state_scenario_9516700_session_start_cycles
    it('game_state_scenario_9516700_session_start_cycles', 0, async () => {
      const caseSeed: number = 9516700;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9516700);
    });

    // Scenario: game_state_scenario_9516701_paddle_step_sequence
    it('game_state_scenario_9516701_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9516701;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9516701);
    });

    // Scenario: game_state_scenario_9516702_catalog_lookup_start
    it('game_state_scenario_9516702_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9516702;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9516702);
    });

    // Scenario: game_state_scenario_9516703_pipeline_round_trip
    it('game_state_scenario_9516703_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9516703;
      const payload: string = '_main.paddle.moveLeft(); // case 9516703';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9516703);
    });

    // Scenario: game_state_scenario_9516704_settings_zoom_true
    it('game_state_scenario_9516704_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9516704;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9516704);
    });

    // Scenario: game_state_scenario_9516705_layout_custom_columns
    it('game_state_scenario_9516705_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9516705;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9516705);
    });

    // Scenario: game_state_scenario_9516706_score_accumulation
    it('game_state_scenario_9516706_score_accumulation', 0, async () => {
      const caseSeed: number = 9516706;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(9516706);
    });

    // Scenario: game_state_scenario_9516707_brick_grid_progress
    it('game_state_scenario_9516707_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9516707;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(9516707);
    });

    // Scenario: game_state_scenario_9516708_locale_lookup_en
    it('game_state_scenario_9516708_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9516708;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9516708);
    });

    // Scenario: game_state_scenario_9516709_validation_report_count
    it('game_state_scenario_9516709_validation_report_count', 0, async () => {
      const caseSeed: number = 9516709;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9516709);
    });

    // Scenario: game_state_scenario_9516710_url_with_query
    it('game_state_scenario_9516710_url_with_query', 0, async () => {
      const caseSeed: number = 9516710;
      const url: string = SAMPLE_GAME_URL + '?case=40';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9516710);
    });

    // Scenario: game_state_scenario_9516711_geometry_area
    it('game_state_scenario_9516711_geometry_area', 0, async () => {
      const caseSeed: number = 9516711;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9516711);
    });

    // Scenario: game_state_scenario_9516712_circular_buffer_capacity
    it('game_state_scenario_9516712_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9516712;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9516712);
    });

    // Scenario: game_state_scenario_9516713_command_queue_fifo
    it('game_state_scenario_9516713_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9516713;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9516713);
    });

    // Scenario: game_state_scenario_9516714_token_bucket_consume
    it('game_state_scenario_9516714_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9516714;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9516714);
    });

    // Scenario: game_state_scenario_9516715_page_load_budget
    it('game_state_scenario_9516715_page_load_budget', 0, async () => {
      const caseSeed: number = 9516715;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(3715);
      expect(record.getDuration()).assertEqual(3715);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9516715);
    });

    // Scenario: game_state_scenario_9516716_perf_sampler_bounds
    it('game_state_scenario_9516716_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9516716;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(9516716);
    });

    // Scenario: game_state_scenario_9516717_config_api_9
    it('game_state_scenario_9516717_config_api_9', 0, async () => {
      const caseSeed: number = 9516717;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9516717);
    });

    // Scenario: game_state_scenario_9516718_retry_attempts
    it('game_state_scenario_9516718_retry_attempts', 0, async () => {
      const caseSeed: number = 9516718;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9516718);
    });

    // Scenario: game_state_scenario_9516719_event_recorder_sequence
    it('game_state_scenario_9516719_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9516719;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9516719);
    });

    // Scenario: game_state_scenario_9516720_session_start_cycles
    it('game_state_scenario_9516720_session_start_cycles', 0, async () => {
      const caseSeed: number = 9516720;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9516720);
    });

    // Scenario: game_state_scenario_9516721_paddle_step_sequence
    it('game_state_scenario_9516721_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9516721;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9516721);
    });

    // Scenario: game_state_scenario_9516722_catalog_lookup_start
    it('game_state_scenario_9516722_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9516722;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9516722);
    });

    // Scenario: game_state_scenario_9516723_pipeline_round_trip
    it('game_state_scenario_9516723_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9516723;
      const payload: string = '_main.paddle.moveLeft(); // case 9516723';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9516723);
    });

    // Scenario: game_state_scenario_9516724_settings_zoom_true
    it('game_state_scenario_9516724_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9516724;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9516724);
    });

    // Scenario: game_state_scenario_9516725_layout_custom_columns
    it('game_state_scenario_9516725_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9516725;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9516725);
    });

    // Scenario: game_state_scenario_9516726_score_accumulation
    it('game_state_scenario_9516726_score_accumulation', 0, async () => {
      const caseSeed: number = 9516726;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(9516726);
    });

    // Scenario: game_state_scenario_9516727_brick_grid_progress
    it('game_state_scenario_9516727_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9516727;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9516727);
    });

    // Scenario: game_state_scenario_9516728_locale_lookup_en
    it('game_state_scenario_9516728_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9516728;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9516728);
    });

    // Scenario: game_state_scenario_9516729_validation_report_count
    it('game_state_scenario_9516729_validation_report_count', 0, async () => {
      const caseSeed: number = 9516729;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9516729);
    });

    // Scenario: game_state_scenario_9516730_url_with_query
    it('game_state_scenario_9516730_url_with_query', 0, async () => {
      const caseSeed: number = 9516730;
      const url: string = SAMPLE_GAME_URL + '?case=60';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9516730);
    });

    // Scenario: game_state_scenario_9516731_geometry_area
    it('game_state_scenario_9516731_geometry_area', 0, async () => {
      const caseSeed: number = 9516731;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9516731);
    });

    // Scenario: game_state_scenario_9516732_circular_buffer_capacity
    it('game_state_scenario_9516732_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9516732;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9516732);
    });

    // Scenario: game_state_scenario_9516733_command_queue_fifo
    it('game_state_scenario_9516733_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9516733;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9516733);
    });

    // Scenario: game_state_scenario_9516734_token_bucket_consume
    it('game_state_scenario_9516734_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9516734;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9516734);
    });

    // Scenario: game_state_scenario_9516735_page_load_budget
    it('game_state_scenario_9516735_page_load_budget', 0, async () => {
      const caseSeed: number = 9516735;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(3735);
      expect(record.getDuration()).assertEqual(3735);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9516735);
    });

    // Scenario: game_state_scenario_9516736_perf_sampler_bounds
    it('game_state_scenario_9516736_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9516736;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(9516736);
    });

    // Scenario: game_state_scenario_9516737_config_api_9
    it('game_state_scenario_9516737_config_api_9', 0, async () => {
      const caseSeed: number = 9516737;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9516737);
    });

    // Scenario: game_state_scenario_9516738_retry_attempts
    it('game_state_scenario_9516738_retry_attempts', 0, async () => {
      const caseSeed: number = 9516738;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9516738);
    });

    // Scenario: game_state_scenario_9516739_event_recorder_sequence
    it('game_state_scenario_9516739_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9516739;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9516739);
    });

  });
}
