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

export default function webAppVersionTest() {
  describe('WebAppVersion_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_app_version suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_app_version suite end');
    });

    // Scenario: web_app_version_scenario_9428000_session_start_cycles
    it('web_app_version_scenario_9428000_session_start_cycles', 0, async () => {
      const caseSeed: number = 9428000;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9428000);
    });

    // Scenario: web_app_version_scenario_9428001_paddle_step_sequence
    it('web_app_version_scenario_9428001_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9428001;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9428001);
    });

    // Scenario: web_app_version_scenario_9428002_catalog_lookup_start
    it('web_app_version_scenario_9428002_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9428002;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9428002);
    });

    // Scenario: web_app_version_scenario_9428003_pipeline_round_trip
    it('web_app_version_scenario_9428003_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9428003;
      const payload: string = '_main.paddle.moveLeft(); // case 9428003';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9428003);
    });

    // Scenario: web_app_version_scenario_9428004_settings_zoom_true
    it('web_app_version_scenario_9428004_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9428004;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9428004);
    });

    // Scenario: web_app_version_scenario_9428005_layout_custom_columns
    it('web_app_version_scenario_9428005_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9428005;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9428005);
    });

    // Scenario: web_app_version_scenario_9428006_score_accumulation
    it('web_app_version_scenario_9428006_score_accumulation', 0, async () => {
      const caseSeed: number = 9428006;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(9428006);
    });

    // Scenario: web_app_version_scenario_9428007_brick_grid_progress
    it('web_app_version_scenario_9428007_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9428007;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9428007);
    });

    // Scenario: web_app_version_scenario_9428008_locale_lookup_en
    it('web_app_version_scenario_9428008_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9428008;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9428008);
    });

    // Scenario: web_app_version_scenario_9428009_validation_report_count
    it('web_app_version_scenario_9428009_validation_report_count', 0, async () => {
      const caseSeed: number = 9428009;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9428009);
    });

    // Scenario: web_app_version_scenario_9428010_url_with_query
    it('web_app_version_scenario_9428010_url_with_query', 0, async () => {
      const caseSeed: number = 9428010;
      const url: string = SAMPLE_GAME_URL + '?case=95';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9428010);
    });

    // Scenario: web_app_version_scenario_9428011_geometry_area
    it('web_app_version_scenario_9428011_geometry_area', 0, async () => {
      const caseSeed: number = 9428011;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9428011);
    });

    // Scenario: web_app_version_scenario_9428012_circular_buffer_capacity
    it('web_app_version_scenario_9428012_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9428012;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9428012);
    });

    // Scenario: web_app_version_scenario_9428013_command_queue_fifo
    it('web_app_version_scenario_9428013_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9428013;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9428013);
    });

    // Scenario: web_app_version_scenario_9428014_token_bucket_consume
    it('web_app_version_scenario_9428014_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9428014;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9428014);
    });

    // Scenario: web_app_version_scenario_9428015_page_load_budget
    it('web_app_version_scenario_9428015_page_load_budget', 0, async () => {
      const caseSeed: number = 9428015;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5015);
      expect(record.getDuration()).assertEqual(5015);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9428015);
    });

    // Scenario: web_app_version_scenario_9428016_perf_sampler_bounds
    it('web_app_version_scenario_9428016_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9428016;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(9428016);
    });

    // Scenario: web_app_version_scenario_9428017_config_api_9
    it('web_app_version_scenario_9428017_config_api_9', 0, async () => {
      const caseSeed: number = 9428017;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9428017);
    });

    // Scenario: web_app_version_scenario_9428018_retry_attempts
    it('web_app_version_scenario_9428018_retry_attempts', 0, async () => {
      const caseSeed: number = 9428018;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9428018);
    });

    // Scenario: web_app_version_scenario_9428019_event_recorder_sequence
    it('web_app_version_scenario_9428019_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9428019;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9428019);
    });

    // Scenario: web_app_version_scenario_9428020_session_start_cycles
    it('web_app_version_scenario_9428020_session_start_cycles', 0, async () => {
      const caseSeed: number = 9428020;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9428020);
    });

    // Scenario: web_app_version_scenario_9428021_paddle_step_sequence
    it('web_app_version_scenario_9428021_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9428021;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9428021);
    });

    // Scenario: web_app_version_scenario_9428022_catalog_lookup_start
    it('web_app_version_scenario_9428022_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9428022;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9428022);
    });

    // Scenario: web_app_version_scenario_9428023_pipeline_round_trip
    it('web_app_version_scenario_9428023_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9428023;
      const payload: string = '_main.paddle.moveLeft(); // case 9428023';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9428023);
    });

    // Scenario: web_app_version_scenario_9428024_settings_zoom_true
    it('web_app_version_scenario_9428024_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9428024;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9428024);
    });

    // Scenario: web_app_version_scenario_9428025_layout_custom_columns
    it('web_app_version_scenario_9428025_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9428025;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9428025);
    });

    // Scenario: web_app_version_scenario_9428026_score_accumulation
    it('web_app_version_scenario_9428026_score_accumulation', 0, async () => {
      const caseSeed: number = 9428026;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(9428026);
    });

    // Scenario: web_app_version_scenario_9428027_brick_grid_progress
    it('web_app_version_scenario_9428027_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9428027;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(9428027);
    });

    // Scenario: web_app_version_scenario_9428028_locale_lookup_en
    it('web_app_version_scenario_9428028_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9428028;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9428028);
    });

    // Scenario: web_app_version_scenario_9428029_validation_report_count
    it('web_app_version_scenario_9428029_validation_report_count', 0, async () => {
      const caseSeed: number = 9428029;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9428029);
    });

    // Scenario: web_app_version_scenario_9428030_url_with_query
    it('web_app_version_scenario_9428030_url_with_query', 0, async () => {
      const caseSeed: number = 9428030;
      const url: string = SAMPLE_GAME_URL + '?case=18';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9428030);
    });

    // Scenario: web_app_version_scenario_9428031_geometry_area
    it('web_app_version_scenario_9428031_geometry_area', 0, async () => {
      const caseSeed: number = 9428031;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 61);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9428031);
    });

    // Scenario: web_app_version_scenario_9428032_circular_buffer_capacity
    it('web_app_version_scenario_9428032_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9428032;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9428032);
    });

    // Scenario: web_app_version_scenario_9428033_command_queue_fifo
    it('web_app_version_scenario_9428033_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9428033;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9428033);
    });

    // Scenario: web_app_version_scenario_9428034_token_bucket_consume
    it('web_app_version_scenario_9428034_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9428034;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9428034);
    });

    // Scenario: web_app_version_scenario_9428035_page_load_budget
    it('web_app_version_scenario_9428035_page_load_budget', 0, async () => {
      const caseSeed: number = 9428035;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5035);
      expect(record.getDuration()).assertEqual(5035);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9428035);
    });

    // Scenario: web_app_version_scenario_9428036_perf_sampler_bounds
    it('web_app_version_scenario_9428036_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9428036;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(9428036);
    });

    // Scenario: web_app_version_scenario_9428037_config_api_9
    it('web_app_version_scenario_9428037_config_api_9', 0, async () => {
      const caseSeed: number = 9428037;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9428037);
    });

    // Scenario: web_app_version_scenario_9428038_retry_attempts
    it('web_app_version_scenario_9428038_retry_attempts', 0, async () => {
      const caseSeed: number = 9428038;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9428038);
    });

    // Scenario: web_app_version_scenario_9428039_event_recorder_sequence
    it('web_app_version_scenario_9428039_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9428039;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9428039);
    });

    // Scenario: web_app_version_scenario_9428040_session_start_cycles
    it('web_app_version_scenario_9428040_session_start_cycles', 0, async () => {
      const caseSeed: number = 9428040;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9428040);
    });

    // Scenario: web_app_version_scenario_9428041_paddle_step_sequence
    it('web_app_version_scenario_9428041_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9428041;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9428041);
    });

    // Scenario: web_app_version_scenario_9428042_catalog_lookup_start
    it('web_app_version_scenario_9428042_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9428042;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9428042);
    });

    // Scenario: web_app_version_scenario_9428043_pipeline_round_trip
    it('web_app_version_scenario_9428043_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9428043;
      const payload: string = '_main.paddle.moveLeft(); // case 9428043';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9428043);
    });

    // Scenario: web_app_version_scenario_9428044_settings_zoom_true
    it('web_app_version_scenario_9428044_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9428044;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9428044);
    });

    // Scenario: web_app_version_scenario_9428045_layout_custom_columns
    it('web_app_version_scenario_9428045_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9428045;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9428045);
    });

    // Scenario: web_app_version_scenario_9428046_score_accumulation
    it('web_app_version_scenario_9428046_score_accumulation', 0, async () => {
      const caseSeed: number = 9428046;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(9428046);
    });

    // Scenario: web_app_version_scenario_9428047_brick_grid_progress
    it('web_app_version_scenario_9428047_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9428047;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9428047);
    });

    // Scenario: web_app_version_scenario_9428048_locale_lookup_en
    it('web_app_version_scenario_9428048_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9428048;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9428048);
    });

    // Scenario: web_app_version_scenario_9428049_validation_report_count
    it('web_app_version_scenario_9428049_validation_report_count', 0, async () => {
      const caseSeed: number = 9428049;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9428049);
    });

    // Scenario: web_app_version_scenario_9428050_url_with_query
    it('web_app_version_scenario_9428050_url_with_query', 0, async () => {
      const caseSeed: number = 9428050;
      const url: string = SAMPLE_GAME_URL + '?case=38';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9428050);
    });

    // Scenario: web_app_version_scenario_9428051_geometry_area
    it('web_app_version_scenario_9428051_geometry_area', 0, async () => {
      const caseSeed: number = 9428051;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 21);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9428051);
    });

    // Scenario: web_app_version_scenario_9428052_circular_buffer_capacity
    it('web_app_version_scenario_9428052_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9428052;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9428052);
    });

    // Scenario: web_app_version_scenario_9428053_command_queue_fifo
    it('web_app_version_scenario_9428053_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9428053;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9428053);
    });

    // Scenario: web_app_version_scenario_9428054_token_bucket_consume
    it('web_app_version_scenario_9428054_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9428054;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9428054);
    });

    // Scenario: web_app_version_scenario_9428055_page_load_budget
    it('web_app_version_scenario_9428055_page_load_budget', 0, async () => {
      const caseSeed: number = 9428055;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5055);
      expect(record.getDuration()).assertEqual(5055);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9428055);
    });

    // Scenario: web_app_version_scenario_9428056_perf_sampler_bounds
    it('web_app_version_scenario_9428056_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9428056;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(9428056);
    });

    // Scenario: web_app_version_scenario_9428057_config_api_9
    it('web_app_version_scenario_9428057_config_api_9', 0, async () => {
      const caseSeed: number = 9428057;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9428057);
    });

    // Scenario: web_app_version_scenario_9428058_retry_attempts
    it('web_app_version_scenario_9428058_retry_attempts', 0, async () => {
      const caseSeed: number = 9428058;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9428058);
    });

    // Scenario: web_app_version_scenario_9428059_event_recorder_sequence
    it('web_app_version_scenario_9428059_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9428059;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9428059);
    });

    // Scenario: web_app_version_scenario_9428060_session_start_cycles
    it('web_app_version_scenario_9428060_session_start_cycles', 0, async () => {
      const caseSeed: number = 9428060;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9428060);
    });

    // Scenario: web_app_version_scenario_9428061_paddle_step_sequence
    it('web_app_version_scenario_9428061_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9428061;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9428061);
    });

    // Scenario: web_app_version_scenario_9428062_catalog_lookup_start
    it('web_app_version_scenario_9428062_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9428062;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9428062);
    });

    // Scenario: web_app_version_scenario_9428063_pipeline_round_trip
    it('web_app_version_scenario_9428063_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9428063;
      const payload: string = '_main.paddle.moveLeft(); // case 9428063';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9428063);
    });

    // Scenario: web_app_version_scenario_9428064_settings_zoom_true
    it('web_app_version_scenario_9428064_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9428064;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9428064);
    });

    // Scenario: web_app_version_scenario_9428065_layout_custom_columns
    it('web_app_version_scenario_9428065_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9428065;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9428065);
    });

    // Scenario: web_app_version_scenario_9428066_score_accumulation
    it('web_app_version_scenario_9428066_score_accumulation', 0, async () => {
      const caseSeed: number = 9428066;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(9428066);
    });

    // Scenario: web_app_version_scenario_9428067_brick_grid_progress
    it('web_app_version_scenario_9428067_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9428067;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9428067);
    });

    // Scenario: web_app_version_scenario_9428068_locale_lookup_en
    it('web_app_version_scenario_9428068_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9428068;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9428068);
    });

    // Scenario: web_app_version_scenario_9428069_validation_report_count
    it('web_app_version_scenario_9428069_validation_report_count', 0, async () => {
      const caseSeed: number = 9428069;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9428069);
    });

    // Scenario: web_app_version_scenario_9428070_url_with_query
    it('web_app_version_scenario_9428070_url_with_query', 0, async () => {
      const caseSeed: number = 9428070;
      const url: string = SAMPLE_GAME_URL + '?case=58';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9428070);
    });

    // Scenario: web_app_version_scenario_9428071_geometry_area
    it('web_app_version_scenario_9428071_geometry_area', 0, async () => {
      const caseSeed: number = 9428071;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 41);
      expect(box.area()).assertEqual(3321);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9428071);
    });

  });
}
