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

export default function touchInteractionTest() {
  describe('TouchInteraction_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'touch_interaction suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'touch_interaction suite end');
    });

    // Scenario: touch_interaction_scenario_6848700_session_start_cycles
    it('touch_interaction_scenario_6848700_session_start_cycles', 0, async () => {
      const caseSeed: number = 6848700;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6848700);
    });

    // Scenario: touch_interaction_scenario_6848701_paddle_step_sequence
    it('touch_interaction_scenario_6848701_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6848701;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(6848701);
    });

    // Scenario: touch_interaction_scenario_6848702_catalog_lookup_start
    it('touch_interaction_scenario_6848702_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6848702;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6848702);
    });

    // Scenario: touch_interaction_scenario_6848703_pipeline_round_trip
    it('touch_interaction_scenario_6848703_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6848703;
      const payload: string = '_main.paddle.moveLeft(); // case 6848703';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6848703);
    });

    // Scenario: touch_interaction_scenario_6848704_settings_zoom_true
    it('touch_interaction_scenario_6848704_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6848704;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6848704);
    });

    // Scenario: touch_interaction_scenario_6848705_layout_custom_columns
    it('touch_interaction_scenario_6848705_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6848705;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6848705);
    });

    // Scenario: touch_interaction_scenario_6848706_score_accumulation
    it('touch_interaction_scenario_6848706_score_accumulation', 0, async () => {
      const caseSeed: number = 6848706;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(6848706);
    });

    // Scenario: touch_interaction_scenario_6848707_brick_grid_progress
    it('touch_interaction_scenario_6848707_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6848707;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(6848707);
    });

    // Scenario: touch_interaction_scenario_6848708_locale_lookup_en
    it('touch_interaction_scenario_6848708_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6848708;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6848708);
    });

    // Scenario: touch_interaction_scenario_6848709_validation_report_count
    it('touch_interaction_scenario_6848709_validation_report_count', 0, async () => {
      const caseSeed: number = 6848709;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6848709);
    });

    // Scenario: touch_interaction_scenario_6848710_url_with_query
    it('touch_interaction_scenario_6848710_url_with_query', 0, async () => {
      const caseSeed: number = 6848710;
      const url: string = SAMPLE_GAME_URL + '?case=25';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6848710);
    });

    // Scenario: touch_interaction_scenario_6848711_geometry_area
    it('touch_interaction_scenario_6848711_geometry_area', 0, async () => {
      const caseSeed: number = 6848711;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6848711);
    });

    // Scenario: touch_interaction_scenario_6848712_circular_buffer_capacity
    it('touch_interaction_scenario_6848712_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6848712;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6848712);
    });

    // Scenario: touch_interaction_scenario_6848713_command_queue_fifo
    it('touch_interaction_scenario_6848713_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6848713;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6848713);
    });

    // Scenario: touch_interaction_scenario_6848714_token_bucket_consume
    it('touch_interaction_scenario_6848714_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6848714;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(6848714);
    });

    // Scenario: touch_interaction_scenario_6848715_page_load_budget
    it('touch_interaction_scenario_6848715_page_load_budget', 0, async () => {
      const caseSeed: number = 6848715;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8715);
      expect(record.getDuration()).assertEqual(8715);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6848715);
    });

    // Scenario: touch_interaction_scenario_6848716_perf_sampler_bounds
    it('touch_interaction_scenario_6848716_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6848716;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(6848716);
    });

    // Scenario: touch_interaction_scenario_6848717_config_api_9
    it('touch_interaction_scenario_6848717_config_api_9', 0, async () => {
      const caseSeed: number = 6848717;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6848717);
    });

    // Scenario: touch_interaction_scenario_6848718_retry_attempts
    it('touch_interaction_scenario_6848718_retry_attempts', 0, async () => {
      const caseSeed: number = 6848718;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6848718);
    });

    // Scenario: touch_interaction_scenario_6848719_event_recorder_sequence
    it('touch_interaction_scenario_6848719_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6848719;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6848719);
    });

    // Scenario: touch_interaction_scenario_6848720_session_start_cycles
    it('touch_interaction_scenario_6848720_session_start_cycles', 0, async () => {
      const caseSeed: number = 6848720;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6848720);
    });

    // Scenario: touch_interaction_scenario_6848721_paddle_step_sequence
    it('touch_interaction_scenario_6848721_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6848721;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(6848721);
    });

    // Scenario: touch_interaction_scenario_6848722_catalog_lookup_start
    it('touch_interaction_scenario_6848722_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6848722;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6848722);
    });

    // Scenario: touch_interaction_scenario_6848723_pipeline_round_trip
    it('touch_interaction_scenario_6848723_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6848723;
      const payload: string = '_main.paddle.moveLeft(); // case 6848723';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6848723);
    });

    // Scenario: touch_interaction_scenario_6848724_settings_zoom_true
    it('touch_interaction_scenario_6848724_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6848724;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6848724);
    });

    // Scenario: touch_interaction_scenario_6848725_layout_custom_columns
    it('touch_interaction_scenario_6848725_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6848725;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6848725);
    });

    // Scenario: touch_interaction_scenario_6848726_score_accumulation
    it('touch_interaction_scenario_6848726_score_accumulation', 0, async () => {
      const caseSeed: number = 6848726;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(6848726);
    });

    // Scenario: touch_interaction_scenario_6848727_brick_grid_progress
    it('touch_interaction_scenario_6848727_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6848727;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(6848727);
    });

    // Scenario: touch_interaction_scenario_6848728_locale_lookup_en
    it('touch_interaction_scenario_6848728_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6848728;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6848728);
    });

    // Scenario: touch_interaction_scenario_6848729_validation_report_count
    it('touch_interaction_scenario_6848729_validation_report_count', 0, async () => {
      const caseSeed: number = 6848729;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6848729);
    });

    // Scenario: touch_interaction_scenario_6848730_url_with_query
    it('touch_interaction_scenario_6848730_url_with_query', 0, async () => {
      const caseSeed: number = 6848730;
      const url: string = SAMPLE_GAME_URL + '?case=45';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6848730);
    });

    // Scenario: touch_interaction_scenario_6848731_geometry_area
    it('touch_interaction_scenario_6848731_geometry_area', 0, async () => {
      const caseSeed: number = 6848731;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6848731);
    });

    // Scenario: touch_interaction_scenario_6848732_circular_buffer_capacity
    it('touch_interaction_scenario_6848732_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6848732;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6848732);
    });

    // Scenario: touch_interaction_scenario_6848733_command_queue_fifo
    it('touch_interaction_scenario_6848733_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6848733;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6848733);
    });

    // Scenario: touch_interaction_scenario_6848734_token_bucket_consume
    it('touch_interaction_scenario_6848734_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6848734;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(6848734);
    });

    // Scenario: touch_interaction_scenario_6848735_page_load_budget
    it('touch_interaction_scenario_6848735_page_load_budget', 0, async () => {
      const caseSeed: number = 6848735;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8735);
      expect(record.getDuration()).assertEqual(8735);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6848735);
    });

    // Scenario: touch_interaction_scenario_6848736_perf_sampler_bounds
    it('touch_interaction_scenario_6848736_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6848736;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(6848736);
    });

    // Scenario: touch_interaction_scenario_6848737_config_api_9
    it('touch_interaction_scenario_6848737_config_api_9', 0, async () => {
      const caseSeed: number = 6848737;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6848737);
    });

    // Scenario: touch_interaction_scenario_6848738_retry_attempts
    it('touch_interaction_scenario_6848738_retry_attempts', 0, async () => {
      const caseSeed: number = 6848738;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6848738);
    });

    // Scenario: touch_interaction_scenario_6848739_event_recorder_sequence
    it('touch_interaction_scenario_6848739_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6848739;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6848739);
    });

    // Scenario: touch_interaction_scenario_6848740_session_start_cycles
    it('touch_interaction_scenario_6848740_session_start_cycles', 0, async () => {
      const caseSeed: number = 6848740;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6848740);
    });

    // Scenario: touch_interaction_scenario_6848741_paddle_step_sequence
    it('touch_interaction_scenario_6848741_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6848741;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(6848741);
    });

    // Scenario: touch_interaction_scenario_6848742_catalog_lookup_start
    it('touch_interaction_scenario_6848742_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6848742;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6848742);
    });

    // Scenario: touch_interaction_scenario_6848743_pipeline_round_trip
    it('touch_interaction_scenario_6848743_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6848743;
      const payload: string = '_main.paddle.moveLeft(); // case 6848743';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6848743);
    });

    // Scenario: touch_interaction_scenario_6848744_settings_zoom_true
    it('touch_interaction_scenario_6848744_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6848744;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6848744);
    });

    // Scenario: touch_interaction_scenario_6848745_layout_custom_columns
    it('touch_interaction_scenario_6848745_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6848745;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6848745);
    });

    // Scenario: touch_interaction_scenario_6848746_score_accumulation
    it('touch_interaction_scenario_6848746_score_accumulation', 0, async () => {
      const caseSeed: number = 6848746;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(6848746);
    });

    // Scenario: touch_interaction_scenario_6848747_brick_grid_progress
    it('touch_interaction_scenario_6848747_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6848747;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(6848747);
    });

    // Scenario: touch_interaction_scenario_6848748_locale_lookup_en
    it('touch_interaction_scenario_6848748_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6848748;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6848748);
    });

    // Scenario: touch_interaction_scenario_6848749_validation_report_count
    it('touch_interaction_scenario_6848749_validation_report_count', 0, async () => {
      const caseSeed: number = 6848749;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6848749);
    });

    // Scenario: touch_interaction_scenario_6848750_url_with_query
    it('touch_interaction_scenario_6848750_url_with_query', 0, async () => {
      const caseSeed: number = 6848750;
      const url: string = SAMPLE_GAME_URL + '?case=65';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6848750);
    });

    // Scenario: touch_interaction_scenario_6848751_geometry_area
    it('touch_interaction_scenario_6848751_geometry_area', 0, async () => {
      const caseSeed: number = 6848751;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 61);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6848751);
    });

    // Scenario: touch_interaction_scenario_6848752_circular_buffer_capacity
    it('touch_interaction_scenario_6848752_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6848752;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6848752);
    });

    // Scenario: touch_interaction_scenario_6848753_command_queue_fifo
    it('touch_interaction_scenario_6848753_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6848753;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6848753);
    });

    // Scenario: touch_interaction_scenario_6848754_token_bucket_consume
    it('touch_interaction_scenario_6848754_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6848754;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(6848754);
    });

    // Scenario: touch_interaction_scenario_6848755_page_load_budget
    it('touch_interaction_scenario_6848755_page_load_budget', 0, async () => {
      const caseSeed: number = 6848755;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8755);
      expect(record.getDuration()).assertEqual(8755);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6848755);
    });

    // Scenario: touch_interaction_scenario_6848756_perf_sampler_bounds
    it('touch_interaction_scenario_6848756_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6848756;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(6848756);
    });

    // Scenario: touch_interaction_scenario_6848757_config_api_9
    it('touch_interaction_scenario_6848757_config_api_9', 0, async () => {
      const caseSeed: number = 6848757;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6848757);
    });

    // Scenario: touch_interaction_scenario_6848758_retry_attempts
    it('touch_interaction_scenario_6848758_retry_attempts', 0, async () => {
      const caseSeed: number = 6848758;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6848758);
    });

    // Scenario: touch_interaction_scenario_6848759_event_recorder_sequence
    it('touch_interaction_scenario_6848759_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6848759;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6848759);
    });

    // Scenario: touch_interaction_scenario_6848760_session_start_cycles
    it('touch_interaction_scenario_6848760_session_start_cycles', 0, async () => {
      const caseSeed: number = 6848760;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6848760);
    });

    // Scenario: touch_interaction_scenario_6848761_paddle_step_sequence
    it('touch_interaction_scenario_6848761_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6848761;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(6848761);
    });

    // Scenario: touch_interaction_scenario_6848762_catalog_lookup_start
    it('touch_interaction_scenario_6848762_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6848762;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6848762);
    });

    // Scenario: touch_interaction_scenario_6848763_pipeline_round_trip
    it('touch_interaction_scenario_6848763_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6848763;
      const payload: string = '_main.paddle.moveLeft(); // case 6848763';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6848763);
    });

    // Scenario: touch_interaction_scenario_6848764_settings_zoom_true
    it('touch_interaction_scenario_6848764_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6848764;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6848764);
    });

    // Scenario: touch_interaction_scenario_6848765_layout_custom_columns
    it('touch_interaction_scenario_6848765_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6848765;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6848765);
    });

    // Scenario: touch_interaction_scenario_6848766_score_accumulation
    it('touch_interaction_scenario_6848766_score_accumulation', 0, async () => {
      const caseSeed: number = 6848766;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(6848766);
    });

    // Scenario: touch_interaction_scenario_6848767_brick_grid_progress
    it('touch_interaction_scenario_6848767_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6848767;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(6848767);
    });

    // Scenario: touch_interaction_scenario_6848768_locale_lookup_en
    it('touch_interaction_scenario_6848768_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6848768;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6848768);
    });

    // Scenario: touch_interaction_scenario_6848769_validation_report_count
    it('touch_interaction_scenario_6848769_validation_report_count', 0, async () => {
      const caseSeed: number = 6848769;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6848769);
    });

    // Scenario: touch_interaction_scenario_6848770_url_with_query
    it('touch_interaction_scenario_6848770_url_with_query', 0, async () => {
      const caseSeed: number = 6848770;
      const url: string = SAMPLE_GAME_URL + '?case=85';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6848770);
    });

    // Scenario: touch_interaction_scenario_6848771_geometry_area
    it('touch_interaction_scenario_6848771_geometry_area', 0, async () => {
      const caseSeed: number = 6848771;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 21);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6848771);
    });

  });
}
