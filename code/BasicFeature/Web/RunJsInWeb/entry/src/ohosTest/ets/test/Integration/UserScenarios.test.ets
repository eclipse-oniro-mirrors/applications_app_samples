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

export default function userScenariosTest() {
  describe('UserScenarios_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'user_scenarios suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'user_scenarios suite end');
    });

    // Scenario: user_scenarios_scenario_1092200_session_start_cycles
    it('user_scenarios_scenario_1092200_session_start_cycles', 0, async () => {
      const caseSeed: number = 1092200;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1092200);
    });

    // Scenario: user_scenarios_scenario_1092201_paddle_step_sequence
    it('user_scenarios_scenario_1092201_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1092201;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(1092201);
    });

    // Scenario: user_scenarios_scenario_1092202_catalog_lookup_start
    it('user_scenarios_scenario_1092202_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1092202;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1092202);
    });

    // Scenario: user_scenarios_scenario_1092203_pipeline_round_trip
    it('user_scenarios_scenario_1092203_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1092203;
      const payload: string = '_main.paddle.moveLeft(); // case 1092203';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1092203);
    });

    // Scenario: user_scenarios_scenario_1092204_settings_zoom_true
    it('user_scenarios_scenario_1092204_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1092204;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1092204);
    });

    // Scenario: user_scenarios_scenario_1092205_layout_custom_columns
    it('user_scenarios_scenario_1092205_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1092205;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1092205);
    });

    // Scenario: user_scenarios_scenario_1092206_score_accumulation
    it('user_scenarios_scenario_1092206_score_accumulation', 0, async () => {
      const caseSeed: number = 1092206;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(1092206);
    });

    // Scenario: user_scenarios_scenario_1092207_brick_grid_progress
    it('user_scenarios_scenario_1092207_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1092207;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(1092207);
    });

    // Scenario: user_scenarios_scenario_1092208_locale_lookup_en
    it('user_scenarios_scenario_1092208_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1092208;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1092208);
    });

    // Scenario: user_scenarios_scenario_1092209_validation_report_count
    it('user_scenarios_scenario_1092209_validation_report_count', 0, async () => {
      const caseSeed: number = 1092209;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1092209);
    });

    // Scenario: user_scenarios_scenario_1092210_url_with_query
    it('user_scenarios_scenario_1092210_url_with_query', 0, async () => {
      const caseSeed: number = 1092210;
      const url: string = SAMPLE_GAME_URL + '?case=87';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1092210);
    });

    // Scenario: user_scenarios_scenario_1092211_geometry_area
    it('user_scenarios_scenario_1092211_geometry_area', 0, async () => {
      const caseSeed: number = 1092211;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 41);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1092211);
    });

    // Scenario: user_scenarios_scenario_1092212_circular_buffer_capacity
    it('user_scenarios_scenario_1092212_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1092212;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1092212);
    });

    // Scenario: user_scenarios_scenario_1092213_command_queue_fifo
    it('user_scenarios_scenario_1092213_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1092213;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1092213);
    });

    // Scenario: user_scenarios_scenario_1092214_token_bucket_consume
    it('user_scenarios_scenario_1092214_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1092214;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(1092214);
    });

    // Scenario: user_scenarios_scenario_1092215_page_load_budget
    it('user_scenarios_scenario_1092215_page_load_budget', 0, async () => {
      const caseSeed: number = 1092215;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(3215);
      expect(record.getDuration()).assertEqual(3215);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1092215);
    });

    // Scenario: user_scenarios_scenario_1092216_perf_sampler_bounds
    it('user_scenarios_scenario_1092216_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1092216;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(1092216);
    });

    // Scenario: user_scenarios_scenario_1092217_config_api_9
    it('user_scenarios_scenario_1092217_config_api_9', 0, async () => {
      const caseSeed: number = 1092217;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1092217);
    });

    // Scenario: user_scenarios_scenario_1092218_retry_attempts
    it('user_scenarios_scenario_1092218_retry_attempts', 0, async () => {
      const caseSeed: number = 1092218;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1092218);
    });

    // Scenario: user_scenarios_scenario_1092219_event_recorder_sequence
    it('user_scenarios_scenario_1092219_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1092219;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1092219);
    });

    // Scenario: user_scenarios_scenario_1092220_session_start_cycles
    it('user_scenarios_scenario_1092220_session_start_cycles', 0, async () => {
      const caseSeed: number = 1092220;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1092220);
    });

    // Scenario: user_scenarios_scenario_1092221_paddle_step_sequence
    it('user_scenarios_scenario_1092221_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1092221;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(1092221);
    });

    // Scenario: user_scenarios_scenario_1092222_catalog_lookup_start
    it('user_scenarios_scenario_1092222_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1092222;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1092222);
    });

    // Scenario: user_scenarios_scenario_1092223_pipeline_round_trip
    it('user_scenarios_scenario_1092223_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1092223;
      const payload: string = '_main.paddle.moveLeft(); // case 1092223';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1092223);
    });

    // Scenario: user_scenarios_scenario_1092224_settings_zoom_true
    it('user_scenarios_scenario_1092224_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1092224;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1092224);
    });

    // Scenario: user_scenarios_scenario_1092225_layout_custom_columns
    it('user_scenarios_scenario_1092225_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1092225;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1092225);
    });

    // Scenario: user_scenarios_scenario_1092226_score_accumulation
    it('user_scenarios_scenario_1092226_score_accumulation', 0, async () => {
      const caseSeed: number = 1092226;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(1092226);
    });

    // Scenario: user_scenarios_scenario_1092227_brick_grid_progress
    it('user_scenarios_scenario_1092227_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1092227;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(1092227);
    });

    // Scenario: user_scenarios_scenario_1092228_locale_lookup_en
    it('user_scenarios_scenario_1092228_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1092228;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1092228);
    });

    // Scenario: user_scenarios_scenario_1092229_validation_report_count
    it('user_scenarios_scenario_1092229_validation_report_count', 0, async () => {
      const caseSeed: number = 1092229;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1092229);
    });

    // Scenario: user_scenarios_scenario_1092230_url_with_query
    it('user_scenarios_scenario_1092230_url_with_query', 0, async () => {
      const caseSeed: number = 1092230;
      const url: string = SAMPLE_GAME_URL + '?case=10';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1092230);
    });

    // Scenario: user_scenarios_scenario_1092231_geometry_area
    it('user_scenarios_scenario_1092231_geometry_area', 0, async () => {
      const caseSeed: number = 1092231;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1092231);
    });

    // Scenario: user_scenarios_scenario_1092232_circular_buffer_capacity
    it('user_scenarios_scenario_1092232_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1092232;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1092232);
    });

    // Scenario: user_scenarios_scenario_1092233_command_queue_fifo
    it('user_scenarios_scenario_1092233_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1092233;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1092233);
    });

    // Scenario: user_scenarios_scenario_1092234_token_bucket_consume
    it('user_scenarios_scenario_1092234_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1092234;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(1092234);
    });

    // Scenario: user_scenarios_scenario_1092235_page_load_budget
    it('user_scenarios_scenario_1092235_page_load_budget', 0, async () => {
      const caseSeed: number = 1092235;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(3235);
      expect(record.getDuration()).assertEqual(3235);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1092235);
    });

    // Scenario: user_scenarios_scenario_1092236_perf_sampler_bounds
    it('user_scenarios_scenario_1092236_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1092236;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(1092236);
    });

    // Scenario: user_scenarios_scenario_1092237_config_api_9
    it('user_scenarios_scenario_1092237_config_api_9', 0, async () => {
      const caseSeed: number = 1092237;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1092237);
    });

    // Scenario: user_scenarios_scenario_1092238_retry_attempts
    it('user_scenarios_scenario_1092238_retry_attempts', 0, async () => {
      const caseSeed: number = 1092238;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1092238);
    });

    // Scenario: user_scenarios_scenario_1092239_event_recorder_sequence
    it('user_scenarios_scenario_1092239_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1092239;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1092239);
    });

    // Scenario: user_scenarios_scenario_1092240_session_start_cycles
    it('user_scenarios_scenario_1092240_session_start_cycles', 0, async () => {
      const caseSeed: number = 1092240;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1092240);
    });

    // Scenario: user_scenarios_scenario_1092241_paddle_step_sequence
    it('user_scenarios_scenario_1092241_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1092241;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(1092241);
    });

    // Scenario: user_scenarios_scenario_1092242_catalog_lookup_start
    it('user_scenarios_scenario_1092242_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1092242;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1092242);
    });

    // Scenario: user_scenarios_scenario_1092243_pipeline_round_trip
    it('user_scenarios_scenario_1092243_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1092243;
      const payload: string = '_main.paddle.moveLeft(); // case 1092243';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1092243);
    });

    // Scenario: user_scenarios_scenario_1092244_settings_zoom_true
    it('user_scenarios_scenario_1092244_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1092244;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1092244);
    });

    // Scenario: user_scenarios_scenario_1092245_layout_custom_columns
    it('user_scenarios_scenario_1092245_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1092245;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1092245);
    });

    // Scenario: user_scenarios_scenario_1092246_score_accumulation
    it('user_scenarios_scenario_1092246_score_accumulation', 0, async () => {
      const caseSeed: number = 1092246;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(1092246);
    });

    // Scenario: user_scenarios_scenario_1092247_brick_grid_progress
    it('user_scenarios_scenario_1092247_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1092247;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(1092247);
    });

    // Scenario: user_scenarios_scenario_1092248_locale_lookup_en
    it('user_scenarios_scenario_1092248_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1092248;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1092248);
    });

    // Scenario: user_scenarios_scenario_1092249_validation_report_count
    it('user_scenarios_scenario_1092249_validation_report_count', 0, async () => {
      const caseSeed: number = 1092249;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1092249);
    });

    // Scenario: user_scenarios_scenario_1092250_url_with_query
    it('user_scenarios_scenario_1092250_url_with_query', 0, async () => {
      const caseSeed: number = 1092250;
      const url: string = SAMPLE_GAME_URL + '?case=30';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1092250);
    });

    // Scenario: user_scenarios_scenario_1092251_geometry_area
    it('user_scenarios_scenario_1092251_geometry_area', 0, async () => {
      const caseSeed: number = 1092251;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1092251);
    });

    // Scenario: user_scenarios_scenario_1092252_circular_buffer_capacity
    it('user_scenarios_scenario_1092252_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1092252;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1092252);
    });

    // Scenario: user_scenarios_scenario_1092253_command_queue_fifo
    it('user_scenarios_scenario_1092253_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1092253;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1092253);
    });

  });
}
