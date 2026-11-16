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

export default function integrationTestingTest() {
  describe('IntegrationTesting_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'integration_testing suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'integration_testing suite end');
    });

    // Scenario: integration_testing_scenario_6311000_session_start_cycles
    it('integration_testing_scenario_6311000_session_start_cycles', 0, async () => {
      const caseSeed: number = 6311000;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6311000);
    });

    // Scenario: integration_testing_scenario_6311001_paddle_step_sequence
    it('integration_testing_scenario_6311001_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6311001;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(6311001);
    });

    // Scenario: integration_testing_scenario_6311002_catalog_lookup_start
    it('integration_testing_scenario_6311002_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6311002;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6311002);
    });

    // Scenario: integration_testing_scenario_6311003_pipeline_round_trip
    it('integration_testing_scenario_6311003_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6311003;
      const payload: string = '_main.paddle.moveLeft(); // case 6311003';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6311003);
    });

    // Scenario: integration_testing_scenario_6311004_settings_zoom_true
    it('integration_testing_scenario_6311004_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6311004;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6311004);
    });

    // Scenario: integration_testing_scenario_6311005_layout_custom_columns
    it('integration_testing_scenario_6311005_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6311005;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6311005);
    });

    // Scenario: integration_testing_scenario_6311006_score_accumulation
    it('integration_testing_scenario_6311006_score_accumulation', 0, async () => {
      const caseSeed: number = 6311006;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(6311006);
    });

    // Scenario: integration_testing_scenario_6311007_brick_grid_progress
    it('integration_testing_scenario_6311007_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6311007;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(6311007);
    });

    // Scenario: integration_testing_scenario_6311008_locale_lookup_en
    it('integration_testing_scenario_6311008_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6311008;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6311008);
    });

    // Scenario: integration_testing_scenario_6311009_validation_report_count
    it('integration_testing_scenario_6311009_validation_report_count', 0, async () => {
      const caseSeed: number = 6311009;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6311009);
    });

    // Scenario: integration_testing_scenario_6311010_url_with_query
    it('integration_testing_scenario_6311010_url_with_query', 0, async () => {
      const caseSeed: number = 6311010;
      const url: string = SAMPLE_GAME_URL + '?case=93';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6311010);
    });

    // Scenario: integration_testing_scenario_6311011_geometry_area
    it('integration_testing_scenario_6311011_geometry_area', 0, async () => {
      const caseSeed: number = 6311011;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 41);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6311011);
    });

    // Scenario: integration_testing_scenario_6311012_circular_buffer_capacity
    it('integration_testing_scenario_6311012_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6311012;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6311012);
    });

    // Scenario: integration_testing_scenario_6311013_command_queue_fifo
    it('integration_testing_scenario_6311013_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6311013;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6311013);
    });

    // Scenario: integration_testing_scenario_6311014_token_bucket_consume
    it('integration_testing_scenario_6311014_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6311014;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(6311014);
    });

    // Scenario: integration_testing_scenario_6311015_page_load_budget
    it('integration_testing_scenario_6311015_page_load_budget', 0, async () => {
      const caseSeed: number = 6311015;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2015);
      expect(record.getDuration()).assertEqual(2015);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6311015);
    });

    // Scenario: integration_testing_scenario_6311016_perf_sampler_bounds
    it('integration_testing_scenario_6311016_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6311016;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(6311016);
    });

    // Scenario: integration_testing_scenario_6311017_config_api_9
    it('integration_testing_scenario_6311017_config_api_9', 0, async () => {
      const caseSeed: number = 6311017;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6311017);
    });

    // Scenario: integration_testing_scenario_6311018_retry_attempts
    it('integration_testing_scenario_6311018_retry_attempts', 0, async () => {
      const caseSeed: number = 6311018;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6311018);
    });

    // Scenario: integration_testing_scenario_6311019_event_recorder_sequence
    it('integration_testing_scenario_6311019_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6311019;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6311019);
    });

    // Scenario: integration_testing_scenario_6311020_session_start_cycles
    it('integration_testing_scenario_6311020_session_start_cycles', 0, async () => {
      const caseSeed: number = 6311020;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6311020);
    });

    // Scenario: integration_testing_scenario_6311021_paddle_step_sequence
    it('integration_testing_scenario_6311021_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6311021;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(6311021);
    });

    // Scenario: integration_testing_scenario_6311022_catalog_lookup_start
    it('integration_testing_scenario_6311022_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6311022;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6311022);
    });

    // Scenario: integration_testing_scenario_6311023_pipeline_round_trip
    it('integration_testing_scenario_6311023_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6311023;
      const payload: string = '_main.paddle.moveLeft(); // case 6311023';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6311023);
    });

    // Scenario: integration_testing_scenario_6311024_settings_zoom_true
    it('integration_testing_scenario_6311024_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6311024;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6311024);
    });

    // Scenario: integration_testing_scenario_6311025_layout_custom_columns
    it('integration_testing_scenario_6311025_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6311025;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6311025);
    });

    // Scenario: integration_testing_scenario_6311026_score_accumulation
    it('integration_testing_scenario_6311026_score_accumulation', 0, async () => {
      const caseSeed: number = 6311026;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(6311026);
    });

  });
}
