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

export default function visualEffectsTest() {
  describe('VisualEffects_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'visual_effects suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'visual_effects suite end');
    });

    // Scenario: visual_effects_sampler_aggregates_latencies
    it('visual_effects_sampler_aggregates_latencies', 0, async () => {
      const sampler: PerformanceSampler = new PerformanceSampler();
      sampler.record(10);
      sampler.record(20);
      sampler.record(30);
      expect(sampler.count()).assertEqual(3);
      expect(sampler.min()).assertEqual(10);
      expect(sampler.max()).assertEqual(30);
      expect(sampler.average()).assertEqual(20);
    });

    // Scenario: visual_effects_sampler_percentile_is_bounded
    it('visual_effects_sampler_percentile_is_bounded', 0, async () => {
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 100; i++) {
        sampler.record(i);
      }
      const p95: number = sampler.percentile(95);
      expect(p95 >= sampler.min()).assertTrue();
      expect(p95 <= sampler.max()).assertTrue();
      expect(p95 >= 90).assertTrue();
    });

    // Scenario: visual_effects_sampler_budget_check_uses_maximum
    it('visual_effects_sampler_budget_check_uses_maximum', 0, async () => {
      const sampler: PerformanceSampler = new PerformanceSampler();
      sampler.record(100);
      sampler.record(450);
      expect(sampler.isWithinBudget(500)).assertTrue();
      sampler.record(501);
      expect(sampler.isWithinBudget(500)).assertFalse();
    });

    // Scenario: visual_effects_empty_sampler_returns_zero
    it('visual_effects_empty_sampler_returns_zero', 0, async () => {
      const sampler: PerformanceSampler = new PerformanceSampler();
      expect(sampler.count()).assertEqual(0);
      expect(sampler.average()).assertEqual(0);
      expect(sampler.max()).assertEqual(0);
      expect(sampler.percentile(50)).assertEqual(0);
      sampler.record(5);
      sampler.reset();
      expect(sampler.count()).assertEqual(0);
    });

    // Scenario: visual_effects_scenario_6456800_session_start_cycles
    it('visual_effects_scenario_6456800_session_start_cycles', 0, async () => {
      const caseSeed: number = 6456800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6456800);
    });

    // Scenario: visual_effects_scenario_6456801_paddle_step_sequence
    it('visual_effects_scenario_6456801_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6456801;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(6456801);
    });

    // Scenario: visual_effects_scenario_6456802_catalog_lookup_start
    it('visual_effects_scenario_6456802_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6456802;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6456802);
    });

    // Scenario: visual_effects_scenario_6456803_pipeline_round_trip
    it('visual_effects_scenario_6456803_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6456803;
      const payload: string = '_main.paddle.moveLeft(); // case 6456803';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6456803);
    });

    // Scenario: visual_effects_scenario_6456804_settings_zoom_true
    it('visual_effects_scenario_6456804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6456804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6456804);
    });

    // Scenario: visual_effects_scenario_6456805_layout_custom_columns
    it('visual_effects_scenario_6456805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6456805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6456805);
    });

    // Scenario: visual_effects_scenario_6456806_score_accumulation
    it('visual_effects_scenario_6456806_score_accumulation', 0, async () => {
      const caseSeed: number = 6456806;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(6456806);
    });

    // Scenario: visual_effects_scenario_6456807_brick_grid_progress
    it('visual_effects_scenario_6456807_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6456807;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(6456807);
    });

    // Scenario: visual_effects_scenario_6456808_locale_lookup_en
    it('visual_effects_scenario_6456808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6456808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6456808);
    });

    // Scenario: visual_effects_scenario_6456809_validation_report_count
    it('visual_effects_scenario_6456809_validation_report_count', 0, async () => {
      const caseSeed: number = 6456809;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6456809);
    });

    // Scenario: visual_effects_scenario_6456810_url_with_query
    it('visual_effects_scenario_6456810_url_with_query', 0, async () => {
      const caseSeed: number = 6456810;
      const url: string = SAMPLE_GAME_URL + '?case=5';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6456810);
    });

    // Scenario: visual_effects_scenario_6456811_geometry_area
    it('visual_effects_scenario_6456811_geometry_area', 0, async () => {
      const caseSeed: number = 6456811;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6456811);
    });

    // Scenario: visual_effects_scenario_6456812_circular_buffer_capacity
    it('visual_effects_scenario_6456812_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6456812;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6456812);
    });

    // Scenario: visual_effects_scenario_6456813_command_queue_fifo
    it('visual_effects_scenario_6456813_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6456813;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6456813);
    });

    // Scenario: visual_effects_scenario_6456814_token_bucket_consume
    it('visual_effects_scenario_6456814_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6456814;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(6456814);
    });

    // Scenario: visual_effects_scenario_6456815_page_load_budget
    it('visual_effects_scenario_6456815_page_load_budget', 0, async () => {
      const caseSeed: number = 6456815;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(3815);
      expect(record.getDuration()).assertEqual(3815);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6456815);
    });

    // Scenario: visual_effects_scenario_6456816_perf_sampler_bounds
    it('visual_effects_scenario_6456816_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6456816;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(6456816);
    });

    // Scenario: visual_effects_scenario_6456817_config_api_9
    it('visual_effects_scenario_6456817_config_api_9', 0, async () => {
      const caseSeed: number = 6456817;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6456817);
    });

    // Scenario: visual_effects_scenario_6456818_retry_attempts
    it('visual_effects_scenario_6456818_retry_attempts', 0, async () => {
      const caseSeed: number = 6456818;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6456818);
    });

    // Scenario: visual_effects_scenario_6456819_event_recorder_sequence
    it('visual_effects_scenario_6456819_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6456819;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6456819);
    });

    // Scenario: visual_effects_scenario_6456820_session_start_cycles
    it('visual_effects_scenario_6456820_session_start_cycles', 0, async () => {
      const caseSeed: number = 6456820;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6456820);
    });

    // Scenario: visual_effects_scenario_6456821_paddle_step_sequence
    it('visual_effects_scenario_6456821_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6456821;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(6456821);
    });

    // Scenario: visual_effects_scenario_6456822_catalog_lookup_start
    it('visual_effects_scenario_6456822_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6456822;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6456822);
    });

    // Scenario: visual_effects_scenario_6456823_pipeline_round_trip
    it('visual_effects_scenario_6456823_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6456823;
      const payload: string = '_main.paddle.moveLeft(); // case 6456823';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6456823);
    });

    // Scenario: visual_effects_scenario_6456824_settings_zoom_true
    it('visual_effects_scenario_6456824_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6456824;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6456824);
    });

    // Scenario: visual_effects_scenario_6456825_layout_custom_columns
    it('visual_effects_scenario_6456825_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6456825;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6456825);
    });

    // Scenario: visual_effects_scenario_6456826_score_accumulation
    it('visual_effects_scenario_6456826_score_accumulation', 0, async () => {
      const caseSeed: number = 6456826;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(6456826);
    });

    // Scenario: visual_effects_scenario_6456827_brick_grid_progress
    it('visual_effects_scenario_6456827_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6456827;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(6456827);
    });

    // Scenario: visual_effects_scenario_6456828_locale_lookup_en
    it('visual_effects_scenario_6456828_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6456828;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6456828);
    });

    // Scenario: visual_effects_scenario_6456829_validation_report_count
    it('visual_effects_scenario_6456829_validation_report_count', 0, async () => {
      const caseSeed: number = 6456829;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6456829);
    });

    // Scenario: visual_effects_scenario_6456830_url_with_query
    it('visual_effects_scenario_6456830_url_with_query', 0, async () => {
      const caseSeed: number = 6456830;
      const url: string = SAMPLE_GAME_URL + '?case=25';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6456830);
    });

    // Scenario: visual_effects_scenario_6456831_geometry_area
    it('visual_effects_scenario_6456831_geometry_area', 0, async () => {
      const caseSeed: number = 6456831;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 61);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6456831);
    });

    // Scenario: visual_effects_scenario_6456832_circular_buffer_capacity
    it('visual_effects_scenario_6456832_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6456832;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6456832);
    });

    // Scenario: visual_effects_scenario_6456833_command_queue_fifo
    it('visual_effects_scenario_6456833_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6456833;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6456833);
    });

    // Scenario: visual_effects_scenario_6456834_token_bucket_consume
    it('visual_effects_scenario_6456834_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6456834;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(6456834);
    });

    // Scenario: visual_effects_scenario_6456835_page_load_budget
    it('visual_effects_scenario_6456835_page_load_budget', 0, async () => {
      const caseSeed: number = 6456835;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(3835);
      expect(record.getDuration()).assertEqual(3835);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6456835);
    });

    // Scenario: visual_effects_scenario_6456836_perf_sampler_bounds
    it('visual_effects_scenario_6456836_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6456836;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(6456836);
    });

    // Scenario: visual_effects_scenario_6456837_config_api_9
    it('visual_effects_scenario_6456837_config_api_9', 0, async () => {
      const caseSeed: number = 6456837;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6456837);
    });

    // Scenario: visual_effects_scenario_6456838_retry_attempts
    it('visual_effects_scenario_6456838_retry_attempts', 0, async () => {
      const caseSeed: number = 6456838;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6456838);
    });

    // Scenario: visual_effects_scenario_6456839_event_recorder_sequence
    it('visual_effects_scenario_6456839_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6456839;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6456839);
    });

    // Scenario: visual_effects_scenario_6456840_session_start_cycles
    it('visual_effects_scenario_6456840_session_start_cycles', 0, async () => {
      const caseSeed: number = 6456840;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6456840);
    });

    // Scenario: visual_effects_scenario_6456841_paddle_step_sequence
    it('visual_effects_scenario_6456841_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6456841;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(6456841);
    });

    // Scenario: visual_effects_scenario_6456842_catalog_lookup_start
    it('visual_effects_scenario_6456842_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6456842;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6456842);
    });

    // Scenario: visual_effects_scenario_6456843_pipeline_round_trip
    it('visual_effects_scenario_6456843_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6456843;
      const payload: string = '_main.paddle.moveLeft(); // case 6456843';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6456843);
    });

    // Scenario: visual_effects_scenario_6456844_settings_zoom_true
    it('visual_effects_scenario_6456844_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6456844;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6456844);
    });

  });
}
