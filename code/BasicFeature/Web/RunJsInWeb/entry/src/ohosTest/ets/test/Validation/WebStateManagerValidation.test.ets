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

export default function webStateManagerValidationTest() {
  describe('WebStateManagerValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_state_manager suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_state_manager suite end');
    });

    // Scenario: web_state_manager_scenario_370900_session_start_cycles
    it('web_state_manager_scenario_370900_session_start_cycles', 0, async () => {
      const caseSeed: number = 370900;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(370900);
    });

    // Scenario: web_state_manager_scenario_370901_paddle_step_sequence
    it('web_state_manager_scenario_370901_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 370901;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(370901);
    });

    // Scenario: web_state_manager_scenario_370902_catalog_lookup_start
    it('web_state_manager_scenario_370902_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 370902;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(370902);
    });

    // Scenario: web_state_manager_scenario_370903_pipeline_round_trip
    it('web_state_manager_scenario_370903_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 370903;
      const payload: string = '_main.paddle.moveLeft(); // case 370903';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(370903);
    });

    // Scenario: web_state_manager_scenario_370904_settings_zoom_true
    it('web_state_manager_scenario_370904_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370904;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370904);
    });

    // Scenario: web_state_manager_scenario_370905_layout_custom_columns
    it('web_state_manager_scenario_370905_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370905;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370905);
    });

    // Scenario: web_state_manager_scenario_370906_score_accumulation
    it('web_state_manager_scenario_370906_score_accumulation', 0, async () => {
      const caseSeed: number = 370906;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(370906);
    });

    // Scenario: web_state_manager_scenario_370907_brick_grid_progress
    it('web_state_manager_scenario_370907_brick_grid_progress', 0, async () => {
      const caseSeed: number = 370907;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(370907);
    });

    // Scenario: web_state_manager_scenario_370908_locale_lookup_en
    it('web_state_manager_scenario_370908_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370908;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370908);
    });

    // Scenario: web_state_manager_scenario_370909_validation_report_count
    it('web_state_manager_scenario_370909_validation_report_count', 0, async () => {
      const caseSeed: number = 370909;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(370909);
    });

    // Scenario: web_state_manager_scenario_370910_url_with_query
    it('web_state_manager_scenario_370910_url_with_query', 0, async () => {
      const caseSeed: number = 370910;
      const url: string = SAMPLE_GAME_URL + '?case=79';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(370910);
    });

    // Scenario: web_state_manager_scenario_370911_geometry_area
    it('web_state_manager_scenario_370911_geometry_area', 0, async () => {
      const caseSeed: number = 370911;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 61);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370911);
    });

    // Scenario: web_state_manager_scenario_370912_circular_buffer_capacity
    it('web_state_manager_scenario_370912_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 370912;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(370912);
    });

    // Scenario: web_state_manager_scenario_370913_command_queue_fifo
    it('web_state_manager_scenario_370913_command_queue_fifo', 0, async () => {
      const caseSeed: number = 370913;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(370913);
    });

    // Scenario: web_state_manager_scenario_370914_token_bucket_consume
    it('web_state_manager_scenario_370914_token_bucket_consume', 0, async () => {
      const caseSeed: number = 370914;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(370914);
    });

    // Scenario: web_state_manager_scenario_370915_page_load_budget
    it('web_state_manager_scenario_370915_page_load_budget', 0, async () => {
      const caseSeed: number = 370915;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1915);
      expect(record.getDuration()).assertEqual(1915);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(370915);
    });

    // Scenario: web_state_manager_scenario_370916_perf_sampler_bounds
    it('web_state_manager_scenario_370916_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 370916;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(370916);
    });

    // Scenario: web_state_manager_scenario_370917_config_api_9
    it('web_state_manager_scenario_370917_config_api_9', 0, async () => {
      const caseSeed: number = 370917;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(370917);
    });

    // Scenario: web_state_manager_scenario_370918_retry_attempts
    it('web_state_manager_scenario_370918_retry_attempts', 0, async () => {
      const caseSeed: number = 370918;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(370918);
    });

    // Scenario: web_state_manager_scenario_370919_event_recorder_sequence
    it('web_state_manager_scenario_370919_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 370919;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(370919);
    });

    // Scenario: web_state_manager_scenario_370920_session_start_cycles
    it('web_state_manager_scenario_370920_session_start_cycles', 0, async () => {
      const caseSeed: number = 370920;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(370920);
    });

    // Scenario: web_state_manager_scenario_370921_paddle_step_sequence
    it('web_state_manager_scenario_370921_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 370921;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(370921);
    });

    // Scenario: web_state_manager_scenario_370922_catalog_lookup_start
    it('web_state_manager_scenario_370922_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 370922;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(370922);
    });

    // Scenario: web_state_manager_scenario_370923_pipeline_round_trip
    it('web_state_manager_scenario_370923_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 370923;
      const payload: string = '_main.paddle.moveLeft(); // case 370923';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(370923);
    });

    // Scenario: web_state_manager_scenario_370924_settings_zoom_true
    it('web_state_manager_scenario_370924_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370924;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370924);
    });

    // Scenario: web_state_manager_scenario_370925_layout_custom_columns
    it('web_state_manager_scenario_370925_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370925;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370925);
    });

    // Scenario: web_state_manager_scenario_370926_score_accumulation
    it('web_state_manager_scenario_370926_score_accumulation', 0, async () => {
      const caseSeed: number = 370926;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(370926);
    });

    // Scenario: web_state_manager_scenario_370927_brick_grid_progress
    it('web_state_manager_scenario_370927_brick_grid_progress', 0, async () => {
      const caseSeed: number = 370927;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(370927);
    });

    // Scenario: web_state_manager_scenario_370928_locale_lookup_en
    it('web_state_manager_scenario_370928_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370928;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370928);
    });

    // Scenario: web_state_manager_scenario_370929_validation_report_count
    it('web_state_manager_scenario_370929_validation_report_count', 0, async () => {
      const caseSeed: number = 370929;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(370929);
    });

    // Scenario: web_state_manager_scenario_370930_url_with_query
    it('web_state_manager_scenario_370930_url_with_query', 0, async () => {
      const caseSeed: number = 370930;
      const url: string = SAMPLE_GAME_URL + '?case=2';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(370930);
    });

    // Scenario: web_state_manager_scenario_370931_geometry_area
    it('web_state_manager_scenario_370931_geometry_area', 0, async () => {
      const caseSeed: number = 370931;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 21);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370931);
    });

    // Scenario: web_state_manager_scenario_370932_circular_buffer_capacity
    it('web_state_manager_scenario_370932_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 370932;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(370932);
    });

    // Scenario: web_state_manager_scenario_370933_command_queue_fifo
    it('web_state_manager_scenario_370933_command_queue_fifo', 0, async () => {
      const caseSeed: number = 370933;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(370933);
    });

    // Scenario: web_state_manager_scenario_370934_token_bucket_consume
    it('web_state_manager_scenario_370934_token_bucket_consume', 0, async () => {
      const caseSeed: number = 370934;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(370934);
    });

    // Scenario: web_state_manager_scenario_370935_page_load_budget
    it('web_state_manager_scenario_370935_page_load_budget', 0, async () => {
      const caseSeed: number = 370935;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1935);
      expect(record.getDuration()).assertEqual(1935);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(370935);
    });

    // Scenario: web_state_manager_scenario_370936_perf_sampler_bounds
    it('web_state_manager_scenario_370936_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 370936;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(370936);
    });

    // Scenario: web_state_manager_scenario_370937_config_api_9
    it('web_state_manager_scenario_370937_config_api_9', 0, async () => {
      const caseSeed: number = 370937;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(370937);
    });

    // Scenario: web_state_manager_scenario_370938_retry_attempts
    it('web_state_manager_scenario_370938_retry_attempts', 0, async () => {
      const caseSeed: number = 370938;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(370938);
    });

    // Scenario: web_state_manager_scenario_370939_event_recorder_sequence
    it('web_state_manager_scenario_370939_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 370939;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(370939);
    });

    // Scenario: web_state_manager_scenario_370940_session_start_cycles
    it('web_state_manager_scenario_370940_session_start_cycles', 0, async () => {
      const caseSeed: number = 370940;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(370940);
    });

    // Scenario: web_state_manager_scenario_370941_paddle_step_sequence
    it('web_state_manager_scenario_370941_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 370941;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(370941);
    });

    // Scenario: web_state_manager_scenario_370942_catalog_lookup_start
    it('web_state_manager_scenario_370942_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 370942;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(370942);
    });

    // Scenario: web_state_manager_scenario_370943_pipeline_round_trip
    it('web_state_manager_scenario_370943_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 370943;
      const payload: string = '_main.paddle.moveLeft(); // case 370943';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(370943);
    });

    // Scenario: web_state_manager_scenario_370944_settings_zoom_true
    it('web_state_manager_scenario_370944_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370944;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370944);
    });

    // Scenario: web_state_manager_scenario_370945_layout_custom_columns
    it('web_state_manager_scenario_370945_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370945;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370945);
    });

    // Scenario: web_state_manager_scenario_370946_score_accumulation
    it('web_state_manager_scenario_370946_score_accumulation', 0, async () => {
      const caseSeed: number = 370946;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(370946);
    });

    // Scenario: web_state_manager_scenario_370947_brick_grid_progress
    it('web_state_manager_scenario_370947_brick_grid_progress', 0, async () => {
      const caseSeed: number = 370947;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(370947);
    });

    // Scenario: web_state_manager_scenario_370948_locale_lookup_en
    it('web_state_manager_scenario_370948_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370948;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370948);
    });

    // Scenario: web_state_manager_scenario_370949_validation_report_count
    it('web_state_manager_scenario_370949_validation_report_count', 0, async () => {
      const caseSeed: number = 370949;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(370949);
    });

    // Scenario: web_state_manager_scenario_370950_url_with_query
    it('web_state_manager_scenario_370950_url_with_query', 0, async () => {
      const caseSeed: number = 370950;
      const url: string = SAMPLE_GAME_URL + '?case=22';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(370950);
    });

    // Scenario: web_state_manager_scenario_370951_geometry_area
    it('web_state_manager_scenario_370951_geometry_area', 0, async () => {
      const caseSeed: number = 370951;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 41);
      expect(box.area()).assertEqual(3321);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370951);
    });

    // Scenario: web_state_manager_scenario_370952_circular_buffer_capacity
    it('web_state_manager_scenario_370952_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 370952;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(370952);
    });

    // Scenario: web_state_manager_scenario_370953_command_queue_fifo
    it('web_state_manager_scenario_370953_command_queue_fifo', 0, async () => {
      const caseSeed: number = 370953;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(370953);
    });

    // Scenario: web_state_manager_scenario_370954_token_bucket_consume
    it('web_state_manager_scenario_370954_token_bucket_consume', 0, async () => {
      const caseSeed: number = 370954;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(370954);
    });

    // Scenario: web_state_manager_scenario_370955_page_load_budget
    it('web_state_manager_scenario_370955_page_load_budget', 0, async () => {
      const caseSeed: number = 370955;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1955);
      expect(record.getDuration()).assertEqual(1955);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(370955);
    });

    // Scenario: web_state_manager_scenario_370956_perf_sampler_bounds
    it('web_state_manager_scenario_370956_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 370956;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(370956);
    });

    // Scenario: web_state_manager_scenario_370957_config_api_9
    it('web_state_manager_scenario_370957_config_api_9', 0, async () => {
      const caseSeed: number = 370957;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(370957);
    });

    // Scenario: web_state_manager_scenario_370958_retry_attempts
    it('web_state_manager_scenario_370958_retry_attempts', 0, async () => {
      const caseSeed: number = 370958;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(370958);
    });

    // Scenario: web_state_manager_scenario_370959_event_recorder_sequence
    it('web_state_manager_scenario_370959_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 370959;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(370959);
    });

    // Scenario: web_state_manager_scenario_370960_session_start_cycles
    it('web_state_manager_scenario_370960_session_start_cycles', 0, async () => {
      const caseSeed: number = 370960;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(370960);
    });

    // Scenario: web_state_manager_scenario_370961_paddle_step_sequence
    it('web_state_manager_scenario_370961_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 370961;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(370961);
    });

    // Scenario: web_state_manager_scenario_370962_catalog_lookup_start
    it('web_state_manager_scenario_370962_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 370962;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(370962);
    });

    // Scenario: web_state_manager_scenario_370963_pipeline_round_trip
    it('web_state_manager_scenario_370963_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 370963;
      const payload: string = '_main.paddle.moveLeft(); // case 370963';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(370963);
    });

    // Scenario: web_state_manager_scenario_370964_settings_zoom_true
    it('web_state_manager_scenario_370964_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370964;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370964);
    });

    // Scenario: web_state_manager_scenario_370965_layout_custom_columns
    it('web_state_manager_scenario_370965_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370965;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370965);
    });

    // Scenario: web_state_manager_scenario_370966_score_accumulation
    it('web_state_manager_scenario_370966_score_accumulation', 0, async () => {
      const caseSeed: number = 370966;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(370966);
    });

    // Scenario: web_state_manager_scenario_370967_brick_grid_progress
    it('web_state_manager_scenario_370967_brick_grid_progress', 0, async () => {
      const caseSeed: number = 370967;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(370967);
    });

    // Scenario: web_state_manager_scenario_370968_locale_lookup_en
    it('web_state_manager_scenario_370968_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370968;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370968);
    });

    // Scenario: web_state_manager_scenario_370969_validation_report_count
    it('web_state_manager_scenario_370969_validation_report_count', 0, async () => {
      const caseSeed: number = 370969;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(370969);
    });

    // Scenario: web_state_manager_scenario_370970_url_with_query
    it('web_state_manager_scenario_370970_url_with_query', 0, async () => {
      const caseSeed: number = 370970;
      const url: string = SAMPLE_GAME_URL + '?case=42';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(370970);
    });

    // Scenario: web_state_manager_scenario_370971_geometry_area
    it('web_state_manager_scenario_370971_geometry_area', 0, async () => {
      const caseSeed: number = 370971;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 61);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370971);
    });

    // Scenario: web_state_manager_scenario_370972_circular_buffer_capacity
    it('web_state_manager_scenario_370972_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 370972;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(370972);
    });

    // Scenario: web_state_manager_scenario_370973_command_queue_fifo
    it('web_state_manager_scenario_370973_command_queue_fifo', 0, async () => {
      const caseSeed: number = 370973;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(370973);
    });

    // Scenario: web_state_manager_scenario_370974_token_bucket_consume
    it('web_state_manager_scenario_370974_token_bucket_consume', 0, async () => {
      const caseSeed: number = 370974;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(370974);
    });

    // Scenario: web_state_manager_scenario_370975_page_load_budget
    it('web_state_manager_scenario_370975_page_load_budget', 0, async () => {
      const caseSeed: number = 370975;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1975);
      expect(record.getDuration()).assertEqual(1975);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(370975);
    });

    // Scenario: web_state_manager_scenario_370976_perf_sampler_bounds
    it('web_state_manager_scenario_370976_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 370976;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(370976);
    });

    // Scenario: web_state_manager_scenario_370977_config_api_9
    it('web_state_manager_scenario_370977_config_api_9', 0, async () => {
      const caseSeed: number = 370977;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(370977);
    });

    // Scenario: web_state_manager_scenario_370978_retry_attempts
    it('web_state_manager_scenario_370978_retry_attempts', 0, async () => {
      const caseSeed: number = 370978;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(370978);
    });

    // Scenario: web_state_manager_scenario_370979_event_recorder_sequence
    it('web_state_manager_scenario_370979_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 370979;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(370979);
    });

    // Scenario: web_state_manager_scenario_370980_session_start_cycles
    it('web_state_manager_scenario_370980_session_start_cycles', 0, async () => {
      const caseSeed: number = 370980;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(370980);
    });

    // Scenario: web_state_manager_scenario_370981_paddle_step_sequence
    it('web_state_manager_scenario_370981_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 370981;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(370981);
    });

    // Scenario: web_state_manager_scenario_370982_catalog_lookup_start
    it('web_state_manager_scenario_370982_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 370982;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(370982);
    });

    // Scenario: web_state_manager_scenario_370983_pipeline_round_trip
    it('web_state_manager_scenario_370983_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 370983;
      const payload: string = '_main.paddle.moveLeft(); // case 370983';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(370983);
    });

    // Scenario: web_state_manager_scenario_370984_settings_zoom_true
    it('web_state_manager_scenario_370984_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370984;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370984);
    });

    // Scenario: web_state_manager_scenario_370985_layout_custom_columns
    it('web_state_manager_scenario_370985_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370985;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370985);
    });

    // Scenario: web_state_manager_scenario_370986_score_accumulation
    it('web_state_manager_scenario_370986_score_accumulation', 0, async () => {
      const caseSeed: number = 370986;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(370986);
    });

    // Scenario: web_state_manager_scenario_370987_brick_grid_progress
    it('web_state_manager_scenario_370987_brick_grid_progress', 0, async () => {
      const caseSeed: number = 370987;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(370987);
    });

    // Scenario: web_state_manager_scenario_370988_locale_lookup_en
    it('web_state_manager_scenario_370988_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370988;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370988);
    });

    // Scenario: web_state_manager_scenario_370989_validation_report_count
    it('web_state_manager_scenario_370989_validation_report_count', 0, async () => {
      const caseSeed: number = 370989;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(370989);
    });

  });
}
