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

export default function renderingPowerConsumptionTest() {
  describe('RenderingPowerConsumption_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'rendering_power suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'rendering_power suite end');
    });

    // Scenario: rendering_power_scenario_1127900_session_start_cycles
    it('rendering_power_scenario_1127900_session_start_cycles', 0, async () => {
      const caseSeed: number = 1127900;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1127900);
    });

    // Scenario: rendering_power_scenario_1127901_paddle_step_sequence
    it('rendering_power_scenario_1127901_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1127901;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(1127901);
    });

    // Scenario: rendering_power_scenario_1127902_catalog_lookup_start
    it('rendering_power_scenario_1127902_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1127902;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1127902);
    });

    // Scenario: rendering_power_scenario_1127903_pipeline_round_trip
    it('rendering_power_scenario_1127903_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1127903;
      const payload: string = '_main.paddle.moveLeft(); // case 1127903';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1127903);
    });

    // Scenario: rendering_power_scenario_1127904_settings_zoom_true
    it('rendering_power_scenario_1127904_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1127904;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1127904);
    });

    // Scenario: rendering_power_scenario_1127905_layout_custom_columns
    it('rendering_power_scenario_1127905_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1127905;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1127905);
    });

    // Scenario: rendering_power_scenario_1127906_score_accumulation
    it('rendering_power_scenario_1127906_score_accumulation', 0, async () => {
      const caseSeed: number = 1127906;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(1127906);
    });

    // Scenario: rendering_power_scenario_1127907_brick_grid_progress
    it('rendering_power_scenario_1127907_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1127907;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(1127907);
    });

    // Scenario: rendering_power_scenario_1127908_locale_lookup_en
    it('rendering_power_scenario_1127908_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1127908;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1127908);
    });

    // Scenario: rendering_power_scenario_1127909_validation_report_count
    it('rendering_power_scenario_1127909_validation_report_count', 0, async () => {
      const caseSeed: number = 1127909;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1127909);
    });

    // Scenario: rendering_power_scenario_1127910_url_with_query
    it('rendering_power_scenario_1127910_url_with_query', 0, async () => {
      const caseSeed: number = 1127910;
      const url: string = SAMPLE_GAME_URL + '?case=91';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1127910);
    });

    // Scenario: rendering_power_scenario_1127911_geometry_area
    it('rendering_power_scenario_1127911_geometry_area', 0, async () => {
      const caseSeed: number = 1127911;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 41);
      expect(box.area()).assertEqual(3321);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1127911);
    });

    // Scenario: rendering_power_scenario_1127912_circular_buffer_capacity
    it('rendering_power_scenario_1127912_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1127912;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1127912);
    });

    // Scenario: rendering_power_scenario_1127913_command_queue_fifo
    it('rendering_power_scenario_1127913_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1127913;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1127913);
    });

    // Scenario: rendering_power_scenario_1127914_token_bucket_consume
    it('rendering_power_scenario_1127914_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1127914;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(1127914);
    });

    // Scenario: rendering_power_scenario_1127915_page_load_budget
    it('rendering_power_scenario_1127915_page_load_budget', 0, async () => {
      const caseSeed: number = 1127915;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2915);
      expect(record.getDuration()).assertEqual(2915);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1127915);
    });

    // Scenario: rendering_power_scenario_1127916_perf_sampler_bounds
    it('rendering_power_scenario_1127916_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1127916;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(1127916);
    });

    // Scenario: rendering_power_scenario_1127917_config_api_9
    it('rendering_power_scenario_1127917_config_api_9', 0, async () => {
      const caseSeed: number = 1127917;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1127917);
    });

    // Scenario: rendering_power_scenario_1127918_retry_attempts
    it('rendering_power_scenario_1127918_retry_attempts', 0, async () => {
      const caseSeed: number = 1127918;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1127918);
    });

    // Scenario: rendering_power_scenario_1127919_event_recorder_sequence
    it('rendering_power_scenario_1127919_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1127919;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1127919);
    });

    // Scenario: rendering_power_scenario_1127920_session_start_cycles
    it('rendering_power_scenario_1127920_session_start_cycles', 0, async () => {
      const caseSeed: number = 1127920;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1127920);
    });

    // Scenario: rendering_power_scenario_1127921_paddle_step_sequence
    it('rendering_power_scenario_1127921_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1127921;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(1127921);
    });

    // Scenario: rendering_power_scenario_1127922_catalog_lookup_start
    it('rendering_power_scenario_1127922_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1127922;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1127922);
    });

    // Scenario: rendering_power_scenario_1127923_pipeline_round_trip
    it('rendering_power_scenario_1127923_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1127923;
      const payload: string = '_main.paddle.moveLeft(); // case 1127923';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1127923);
    });

    // Scenario: rendering_power_scenario_1127924_settings_zoom_true
    it('rendering_power_scenario_1127924_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1127924;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1127924);
    });

    // Scenario: rendering_power_scenario_1127925_layout_custom_columns
    it('rendering_power_scenario_1127925_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1127925;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1127925);
    });

    // Scenario: rendering_power_scenario_1127926_score_accumulation
    it('rendering_power_scenario_1127926_score_accumulation', 0, async () => {
      const caseSeed: number = 1127926;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(1127926);
    });

    // Scenario: rendering_power_scenario_1127927_brick_grid_progress
    it('rendering_power_scenario_1127927_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1127927;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(1127927);
    });

    // Scenario: rendering_power_scenario_1127928_locale_lookup_en
    it('rendering_power_scenario_1127928_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1127928;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1127928);
    });

    // Scenario: rendering_power_scenario_1127929_validation_report_count
    it('rendering_power_scenario_1127929_validation_report_count', 0, async () => {
      const caseSeed: number = 1127929;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1127929);
    });

    // Scenario: rendering_power_scenario_1127930_url_with_query
    it('rendering_power_scenario_1127930_url_with_query', 0, async () => {
      const caseSeed: number = 1127930;
      const url: string = SAMPLE_GAME_URL + '?case=14';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1127930);
    });

    // Scenario: rendering_power_scenario_1127931_geometry_area
    it('rendering_power_scenario_1127931_geometry_area', 0, async () => {
      const caseSeed: number = 1127931;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 61);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1127931);
    });

    // Scenario: rendering_power_scenario_1127932_circular_buffer_capacity
    it('rendering_power_scenario_1127932_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1127932;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1127932);
    });

    // Scenario: rendering_power_scenario_1127933_command_queue_fifo
    it('rendering_power_scenario_1127933_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1127933;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1127933);
    });

    // Scenario: rendering_power_scenario_1127934_token_bucket_consume
    it('rendering_power_scenario_1127934_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1127934;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(1127934);
    });

    // Scenario: rendering_power_scenario_1127935_page_load_budget
    it('rendering_power_scenario_1127935_page_load_budget', 0, async () => {
      const caseSeed: number = 1127935;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2935);
      expect(record.getDuration()).assertEqual(2935);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1127935);
    });

    // Scenario: rendering_power_scenario_1127936_perf_sampler_bounds
    it('rendering_power_scenario_1127936_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1127936;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(1127936);
    });

    // Scenario: rendering_power_scenario_1127937_config_api_9
    it('rendering_power_scenario_1127937_config_api_9', 0, async () => {
      const caseSeed: number = 1127937;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1127937);
    });

    // Scenario: rendering_power_scenario_1127938_retry_attempts
    it('rendering_power_scenario_1127938_retry_attempts', 0, async () => {
      const caseSeed: number = 1127938;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1127938);
    });

    // Scenario: rendering_power_scenario_1127939_event_recorder_sequence
    it('rendering_power_scenario_1127939_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1127939;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1127939);
    });

    // Scenario: rendering_power_scenario_1127940_session_start_cycles
    it('rendering_power_scenario_1127940_session_start_cycles', 0, async () => {
      const caseSeed: number = 1127940;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1127940);
    });

    // Scenario: rendering_power_scenario_1127941_paddle_step_sequence
    it('rendering_power_scenario_1127941_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1127941;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(1127941);
    });

    // Scenario: rendering_power_scenario_1127942_catalog_lookup_start
    it('rendering_power_scenario_1127942_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1127942;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1127942);
    });

    // Scenario: rendering_power_scenario_1127943_pipeline_round_trip
    it('rendering_power_scenario_1127943_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1127943;
      const payload: string = '_main.paddle.moveLeft(); // case 1127943';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1127943);
    });

    // Scenario: rendering_power_scenario_1127944_settings_zoom_true
    it('rendering_power_scenario_1127944_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1127944;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1127944);
    });

    // Scenario: rendering_power_scenario_1127945_layout_custom_columns
    it('rendering_power_scenario_1127945_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1127945;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1127945);
    });

    // Scenario: rendering_power_scenario_1127946_score_accumulation
    it('rendering_power_scenario_1127946_score_accumulation', 0, async () => {
      const caseSeed: number = 1127946;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(1127946);
    });

    // Scenario: rendering_power_scenario_1127947_brick_grid_progress
    it('rendering_power_scenario_1127947_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1127947;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(1127947);
    });

    // Scenario: rendering_power_scenario_1127948_locale_lookup_en
    it('rendering_power_scenario_1127948_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1127948;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1127948);
    });

    // Scenario: rendering_power_scenario_1127949_validation_report_count
    it('rendering_power_scenario_1127949_validation_report_count', 0, async () => {
      const caseSeed: number = 1127949;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1127949);
    });

    // Scenario: rendering_power_scenario_1127950_url_with_query
    it('rendering_power_scenario_1127950_url_with_query', 0, async () => {
      const caseSeed: number = 1127950;
      const url: string = SAMPLE_GAME_URL + '?case=34';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1127950);
    });

    // Scenario: rendering_power_scenario_1127951_geometry_area
    it('rendering_power_scenario_1127951_geometry_area', 0, async () => {
      const caseSeed: number = 1127951;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1127951);
    });

    // Scenario: rendering_power_scenario_1127952_circular_buffer_capacity
    it('rendering_power_scenario_1127952_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1127952;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1127952);
    });

    // Scenario: rendering_power_scenario_1127953_command_queue_fifo
    it('rendering_power_scenario_1127953_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1127953;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1127953);
    });

    // Scenario: rendering_power_scenario_1127954_token_bucket_consume
    it('rendering_power_scenario_1127954_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1127954;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(1127954);
    });

    // Scenario: rendering_power_scenario_1127955_page_load_budget
    it('rendering_power_scenario_1127955_page_load_budget', 0, async () => {
      const caseSeed: number = 1127955;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2955);
      expect(record.getDuration()).assertEqual(2955);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1127955);
    });

    // Scenario: rendering_power_scenario_1127956_perf_sampler_bounds
    it('rendering_power_scenario_1127956_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1127956;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(1127956);
    });

    // Scenario: rendering_power_scenario_1127957_config_api_9
    it('rendering_power_scenario_1127957_config_api_9', 0, async () => {
      const caseSeed: number = 1127957;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1127957);
    });

    // Scenario: rendering_power_scenario_1127958_retry_attempts
    it('rendering_power_scenario_1127958_retry_attempts', 0, async () => {
      const caseSeed: number = 1127958;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1127958);
    });

    // Scenario: rendering_power_scenario_1127959_event_recorder_sequence
    it('rendering_power_scenario_1127959_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1127959;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1127959);
    });

    // Scenario: rendering_power_scenario_1127960_session_start_cycles
    it('rendering_power_scenario_1127960_session_start_cycles', 0, async () => {
      const caseSeed: number = 1127960;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1127960);
    });

    // Scenario: rendering_power_scenario_1127961_paddle_step_sequence
    it('rendering_power_scenario_1127961_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1127961;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(1127961);
    });

    // Scenario: rendering_power_scenario_1127962_catalog_lookup_start
    it('rendering_power_scenario_1127962_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1127962;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1127962);
    });

    // Scenario: rendering_power_scenario_1127963_pipeline_round_trip
    it('rendering_power_scenario_1127963_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1127963;
      const payload: string = '_main.paddle.moveLeft(); // case 1127963';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1127963);
    });

    // Scenario: rendering_power_scenario_1127964_settings_zoom_true
    it('rendering_power_scenario_1127964_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1127964;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1127964);
    });

  });
}
