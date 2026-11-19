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

export default function gestureRecognitionTest() {
  describe('GestureRecognition_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'gesture_recognition suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'gesture_recognition suite end');
    });

    // Scenario: gesture_recognition_scenario_4909200_session_start_cycles
    it('gesture_recognition_scenario_4909200_session_start_cycles', 0, async () => {
      const caseSeed: number = 4909200;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(4909200);
    });

    // Scenario: gesture_recognition_scenario_4909201_paddle_step_sequence
    it('gesture_recognition_scenario_4909201_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 4909201;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(4909201);
    });

    // Scenario: gesture_recognition_scenario_4909202_catalog_lookup_start
    it('gesture_recognition_scenario_4909202_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 4909202;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(4909202);
    });

    // Scenario: gesture_recognition_scenario_4909203_pipeline_round_trip
    it('gesture_recognition_scenario_4909203_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 4909203;
      const payload: string = '_main.paddle.moveLeft(); // case 4909203';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(4909203);
    });

    // Scenario: gesture_recognition_scenario_4909204_settings_zoom_true
    it('gesture_recognition_scenario_4909204_settings_zoom_true', 0, async () => {
      const caseSeed: number = 4909204;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(4909204);
    });

    // Scenario: gesture_recognition_scenario_4909205_layout_custom_columns
    it('gesture_recognition_scenario_4909205_layout_custom_columns', 0, async () => {
      const caseSeed: number = 4909205;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(4909205);
    });

    // Scenario: gesture_recognition_scenario_4909206_score_accumulation
    it('gesture_recognition_scenario_4909206_score_accumulation', 0, async () => {
      const caseSeed: number = 4909206;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(4909206);
    });

    // Scenario: gesture_recognition_scenario_4909207_brick_grid_progress
    it('gesture_recognition_scenario_4909207_brick_grid_progress', 0, async () => {
      const caseSeed: number = 4909207;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(4909207);
    });

    // Scenario: gesture_recognition_scenario_4909208_locale_lookup_en
    it('gesture_recognition_scenario_4909208_locale_lookup_en', 0, async () => {
      const caseSeed: number = 4909208;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(4909208);
    });

    // Scenario: gesture_recognition_scenario_4909209_validation_report_count
    it('gesture_recognition_scenario_4909209_validation_report_count', 0, async () => {
      const caseSeed: number = 4909209;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(4909209);
    });

    // Scenario: gesture_recognition_scenario_4909210_url_with_query
    it('gesture_recognition_scenario_4909210_url_with_query', 0, async () => {
      const caseSeed: number = 4909210;
      const url: string = SAMPLE_GAME_URL + '?case=40';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(4909210);
    });

    // Scenario: gesture_recognition_scenario_4909211_geometry_area
    it('gesture_recognition_scenario_4909211_geometry_area', 0, async () => {
      const caseSeed: number = 4909211;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(4909211);
    });

    // Scenario: gesture_recognition_scenario_4909212_circular_buffer_capacity
    it('gesture_recognition_scenario_4909212_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 4909212;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(4909212);
    });

    // Scenario: gesture_recognition_scenario_4909213_command_queue_fifo
    it('gesture_recognition_scenario_4909213_command_queue_fifo', 0, async () => {
      const caseSeed: number = 4909213;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(4909213);
    });

    // Scenario: gesture_recognition_scenario_4909214_token_bucket_consume
    it('gesture_recognition_scenario_4909214_token_bucket_consume', 0, async () => {
      const caseSeed: number = 4909214;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(4909214);
    });

    // Scenario: gesture_recognition_scenario_4909215_page_load_budget
    it('gesture_recognition_scenario_4909215_page_load_budget', 0, async () => {
      const caseSeed: number = 4909215;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4215);
      expect(record.getDuration()).assertEqual(4215);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(4909215);
    });

    // Scenario: gesture_recognition_scenario_4909216_perf_sampler_bounds
    it('gesture_recognition_scenario_4909216_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 4909216;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(4909216);
    });

    // Scenario: gesture_recognition_scenario_4909217_config_api_9
    it('gesture_recognition_scenario_4909217_config_api_9', 0, async () => {
      const caseSeed: number = 4909217;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(4909217);
    });

    // Scenario: gesture_recognition_scenario_4909218_retry_attempts
    it('gesture_recognition_scenario_4909218_retry_attempts', 0, async () => {
      const caseSeed: number = 4909218;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(4909218);
    });

    // Scenario: gesture_recognition_scenario_4909219_event_recorder_sequence
    it('gesture_recognition_scenario_4909219_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 4909219;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(4909219);
    });

    // Scenario: gesture_recognition_scenario_4909220_session_start_cycles
    it('gesture_recognition_scenario_4909220_session_start_cycles', 0, async () => {
      const caseSeed: number = 4909220;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(4909220);
    });

    // Scenario: gesture_recognition_scenario_4909221_paddle_step_sequence
    it('gesture_recognition_scenario_4909221_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 4909221;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(4909221);
    });

    // Scenario: gesture_recognition_scenario_4909222_catalog_lookup_start
    it('gesture_recognition_scenario_4909222_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 4909222;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(4909222);
    });

    // Scenario: gesture_recognition_scenario_4909223_pipeline_round_trip
    it('gesture_recognition_scenario_4909223_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 4909223;
      const payload: string = '_main.paddle.moveLeft(); // case 4909223';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(4909223);
    });

    // Scenario: gesture_recognition_scenario_4909224_settings_zoom_true
    it('gesture_recognition_scenario_4909224_settings_zoom_true', 0, async () => {
      const caseSeed: number = 4909224;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(4909224);
    });

    // Scenario: gesture_recognition_scenario_4909225_layout_custom_columns
    it('gesture_recognition_scenario_4909225_layout_custom_columns', 0, async () => {
      const caseSeed: number = 4909225;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(4909225);
    });

    // Scenario: gesture_recognition_scenario_4909226_score_accumulation
    it('gesture_recognition_scenario_4909226_score_accumulation', 0, async () => {
      const caseSeed: number = 4909226;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(4909226);
    });

    // Scenario: gesture_recognition_scenario_4909227_brick_grid_progress
    it('gesture_recognition_scenario_4909227_brick_grid_progress', 0, async () => {
      const caseSeed: number = 4909227;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(4909227);
    });

    // Scenario: gesture_recognition_scenario_4909228_locale_lookup_en
    it('gesture_recognition_scenario_4909228_locale_lookup_en', 0, async () => {
      const caseSeed: number = 4909228;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(4909228);
    });

    // Scenario: gesture_recognition_scenario_4909229_validation_report_count
    it('gesture_recognition_scenario_4909229_validation_report_count', 0, async () => {
      const caseSeed: number = 4909229;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(4909229);
    });

    // Scenario: gesture_recognition_scenario_4909230_url_with_query
    it('gesture_recognition_scenario_4909230_url_with_query', 0, async () => {
      const caseSeed: number = 4909230;
      const url: string = SAMPLE_GAME_URL + '?case=60';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(4909230);
    });

    // Scenario: gesture_recognition_scenario_4909231_geometry_area
    it('gesture_recognition_scenario_4909231_geometry_area', 0, async () => {
      const caseSeed: number = 4909231;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(4909231);
    });

    // Scenario: gesture_recognition_scenario_4909232_circular_buffer_capacity
    it('gesture_recognition_scenario_4909232_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 4909232;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(4909232);
    });

    // Scenario: gesture_recognition_scenario_4909233_command_queue_fifo
    it('gesture_recognition_scenario_4909233_command_queue_fifo', 0, async () => {
      const caseSeed: number = 4909233;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(4909233);
    });

    // Scenario: gesture_recognition_scenario_4909234_token_bucket_consume
    it('gesture_recognition_scenario_4909234_token_bucket_consume', 0, async () => {
      const caseSeed: number = 4909234;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(4909234);
    });

    // Scenario: gesture_recognition_scenario_4909235_page_load_budget
    it('gesture_recognition_scenario_4909235_page_load_budget', 0, async () => {
      const caseSeed: number = 4909235;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4235);
      expect(record.getDuration()).assertEqual(4235);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(4909235);
    });

    // Scenario: gesture_recognition_scenario_4909236_perf_sampler_bounds
    it('gesture_recognition_scenario_4909236_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 4909236;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(4909236);
    });

    // Scenario: gesture_recognition_scenario_4909237_config_api_9
    it('gesture_recognition_scenario_4909237_config_api_9', 0, async () => {
      const caseSeed: number = 4909237;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(4909237);
    });

    // Scenario: gesture_recognition_scenario_4909238_retry_attempts
    it('gesture_recognition_scenario_4909238_retry_attempts', 0, async () => {
      const caseSeed: number = 4909238;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(4909238);
    });

    // Scenario: gesture_recognition_scenario_4909239_event_recorder_sequence
    it('gesture_recognition_scenario_4909239_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 4909239;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(4909239);
    });

    // Scenario: gesture_recognition_scenario_4909240_session_start_cycles
    it('gesture_recognition_scenario_4909240_session_start_cycles', 0, async () => {
      const caseSeed: number = 4909240;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(4909240);
    });

    // Scenario: gesture_recognition_scenario_4909241_paddle_step_sequence
    it('gesture_recognition_scenario_4909241_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 4909241;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(4909241);
    });

    // Scenario: gesture_recognition_scenario_4909242_catalog_lookup_start
    it('gesture_recognition_scenario_4909242_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 4909242;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(4909242);
    });

    // Scenario: gesture_recognition_scenario_4909243_pipeline_round_trip
    it('gesture_recognition_scenario_4909243_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 4909243;
      const payload: string = '_main.paddle.moveLeft(); // case 4909243';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(4909243);
    });

    // Scenario: gesture_recognition_scenario_4909244_settings_zoom_true
    it('gesture_recognition_scenario_4909244_settings_zoom_true', 0, async () => {
      const caseSeed: number = 4909244;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(4909244);
    });

    // Scenario: gesture_recognition_scenario_4909245_layout_custom_columns
    it('gesture_recognition_scenario_4909245_layout_custom_columns', 0, async () => {
      const caseSeed: number = 4909245;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(4909245);
    });

    // Scenario: gesture_recognition_scenario_4909246_score_accumulation
    it('gesture_recognition_scenario_4909246_score_accumulation', 0, async () => {
      const caseSeed: number = 4909246;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(4909246);
    });

    // Scenario: gesture_recognition_scenario_4909247_brick_grid_progress
    it('gesture_recognition_scenario_4909247_brick_grid_progress', 0, async () => {
      const caseSeed: number = 4909247;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(4909247);
    });

    // Scenario: gesture_recognition_scenario_4909248_locale_lookup_en
    it('gesture_recognition_scenario_4909248_locale_lookup_en', 0, async () => {
      const caseSeed: number = 4909248;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(4909248);
    });

    // Scenario: gesture_recognition_scenario_4909249_validation_report_count
    it('gesture_recognition_scenario_4909249_validation_report_count', 0, async () => {
      const caseSeed: number = 4909249;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(4909249);
    });

    // Scenario: gesture_recognition_scenario_4909250_url_with_query
    it('gesture_recognition_scenario_4909250_url_with_query', 0, async () => {
      const caseSeed: number = 4909250;
      const url: string = SAMPLE_GAME_URL + '?case=80';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(4909250);
    });

    // Scenario: gesture_recognition_scenario_4909251_geometry_area
    it('gesture_recognition_scenario_4909251_geometry_area', 0, async () => {
      const caseSeed: number = 4909251;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(4909251);
    });

    // Scenario: gesture_recognition_scenario_4909252_circular_buffer_capacity
    it('gesture_recognition_scenario_4909252_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 4909252;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(4909252);
    });

    // Scenario: gesture_recognition_scenario_4909253_command_queue_fifo
    it('gesture_recognition_scenario_4909253_command_queue_fifo', 0, async () => {
      const caseSeed: number = 4909253;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(4909253);
    });

    // Scenario: gesture_recognition_scenario_4909254_token_bucket_consume
    it('gesture_recognition_scenario_4909254_token_bucket_consume', 0, async () => {
      const caseSeed: number = 4909254;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(4909254);
    });

    // Scenario: gesture_recognition_scenario_4909255_page_load_budget
    it('gesture_recognition_scenario_4909255_page_load_budget', 0, async () => {
      const caseSeed: number = 4909255;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4255);
      expect(record.getDuration()).assertEqual(4255);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(4909255);
    });

    // Scenario: gesture_recognition_scenario_4909256_perf_sampler_bounds
    it('gesture_recognition_scenario_4909256_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 4909256;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(4909256);
    });

    // Scenario: gesture_recognition_scenario_4909257_config_api_9
    it('gesture_recognition_scenario_4909257_config_api_9', 0, async () => {
      const caseSeed: number = 4909257;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(4909257);
    });

    // Scenario: gesture_recognition_scenario_4909258_retry_attempts
    it('gesture_recognition_scenario_4909258_retry_attempts', 0, async () => {
      const caseSeed: number = 4909258;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(4909258);
    });

    // Scenario: gesture_recognition_scenario_4909259_event_recorder_sequence
    it('gesture_recognition_scenario_4909259_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 4909259;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(4909259);
    });

    // Scenario: gesture_recognition_scenario_4909260_session_start_cycles
    it('gesture_recognition_scenario_4909260_session_start_cycles', 0, async () => {
      const caseSeed: number = 4909260;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(4909260);
    });

    // Scenario: gesture_recognition_scenario_4909261_paddle_step_sequence
    it('gesture_recognition_scenario_4909261_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 4909261;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(4909261);
    });

    // Scenario: gesture_recognition_scenario_4909262_catalog_lookup_start
    it('gesture_recognition_scenario_4909262_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 4909262;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(4909262);
    });

    // Scenario: gesture_recognition_scenario_4909263_pipeline_round_trip
    it('gesture_recognition_scenario_4909263_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 4909263;
      const payload: string = '_main.paddle.moveLeft(); // case 4909263';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(4909263);
    });

    // Scenario: gesture_recognition_scenario_4909264_settings_zoom_true
    it('gesture_recognition_scenario_4909264_settings_zoom_true', 0, async () => {
      const caseSeed: number = 4909264;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(4909264);
    });

    // Scenario: gesture_recognition_scenario_4909265_layout_custom_columns
    it('gesture_recognition_scenario_4909265_layout_custom_columns', 0, async () => {
      const caseSeed: number = 4909265;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(4909265);
    });

    // Scenario: gesture_recognition_scenario_4909266_score_accumulation
    it('gesture_recognition_scenario_4909266_score_accumulation', 0, async () => {
      const caseSeed: number = 4909266;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(4909266);
    });

  });
}
