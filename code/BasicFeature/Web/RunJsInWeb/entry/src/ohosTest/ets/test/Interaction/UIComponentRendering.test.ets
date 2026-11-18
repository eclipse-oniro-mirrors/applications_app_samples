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

export default function uIComponentRenderingTest() {
  describe('UIComponentRendering_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'ui_rendering suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'ui_rendering suite end');
    });

    // Scenario: ui_rendering_scenario_9446400_session_start_cycles
    it('ui_rendering_scenario_9446400_session_start_cycles', 0, async () => {
      const caseSeed: number = 9446400;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9446400);
    });

    // Scenario: ui_rendering_scenario_9446401_paddle_step_sequence
    it('ui_rendering_scenario_9446401_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9446401;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9446401);
    });

    // Scenario: ui_rendering_scenario_9446402_catalog_lookup_start
    it('ui_rendering_scenario_9446402_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9446402;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9446402);
    });

    // Scenario: ui_rendering_scenario_9446403_pipeline_round_trip
    it('ui_rendering_scenario_9446403_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9446403;
      const payload: string = '_main.paddle.moveLeft(); // case 9446403';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9446403);
    });

    // Scenario: ui_rendering_scenario_9446404_settings_zoom_true
    it('ui_rendering_scenario_9446404_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9446404;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9446404);
    });

    // Scenario: ui_rendering_scenario_9446405_layout_custom_columns
    it('ui_rendering_scenario_9446405_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9446405;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9446405);
    });

    // Scenario: ui_rendering_scenario_9446406_score_accumulation
    it('ui_rendering_scenario_9446406_score_accumulation', 0, async () => {
      const caseSeed: number = 9446406;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(9446406);
    });

    // Scenario: ui_rendering_scenario_9446407_brick_grid_progress
    it('ui_rendering_scenario_9446407_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9446407;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9446407);
    });

    // Scenario: ui_rendering_scenario_9446408_locale_lookup_en
    it('ui_rendering_scenario_9446408_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9446408;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9446408);
    });

    // Scenario: ui_rendering_scenario_9446409_validation_report_count
    it('ui_rendering_scenario_9446409_validation_report_count', 0, async () => {
      const caseSeed: number = 9446409;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9446409);
    });

    // Scenario: ui_rendering_scenario_9446410_url_with_query
    it('ui_rendering_scenario_9446410_url_with_query', 0, async () => {
      const caseSeed: number = 9446410;
      const url: string = SAMPLE_GAME_URL + '?case=65';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9446410);
    });

    // Scenario: ui_rendering_scenario_9446411_geometry_area
    it('ui_rendering_scenario_9446411_geometry_area', 0, async () => {
      const caseSeed: number = 9446411;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9446411);
    });

    // Scenario: ui_rendering_scenario_9446412_circular_buffer_capacity
    it('ui_rendering_scenario_9446412_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9446412;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9446412);
    });

    // Scenario: ui_rendering_scenario_9446413_command_queue_fifo
    it('ui_rendering_scenario_9446413_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9446413;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9446413);
    });

    // Scenario: ui_rendering_scenario_9446414_token_bucket_consume
    it('ui_rendering_scenario_9446414_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9446414;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9446414);
    });

    // Scenario: ui_rendering_scenario_9446415_page_load_budget
    it('ui_rendering_scenario_9446415_page_load_budget', 0, async () => {
      const caseSeed: number = 9446415;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5415);
      expect(record.getDuration()).assertEqual(5415);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9446415);
    });

    // Scenario: ui_rendering_scenario_9446416_perf_sampler_bounds
    it('ui_rendering_scenario_9446416_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9446416;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(9446416);
    });

    // Scenario: ui_rendering_scenario_9446417_config_api_9
    it('ui_rendering_scenario_9446417_config_api_9', 0, async () => {
      const caseSeed: number = 9446417;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9446417);
    });

    // Scenario: ui_rendering_scenario_9446418_retry_attempts
    it('ui_rendering_scenario_9446418_retry_attempts', 0, async () => {
      const caseSeed: number = 9446418;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9446418);
    });

    // Scenario: ui_rendering_scenario_9446419_event_recorder_sequence
    it('ui_rendering_scenario_9446419_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9446419;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9446419);
    });

    // Scenario: ui_rendering_scenario_9446420_session_start_cycles
    it('ui_rendering_scenario_9446420_session_start_cycles', 0, async () => {
      const caseSeed: number = 9446420;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9446420);
    });

    // Scenario: ui_rendering_scenario_9446421_paddle_step_sequence
    it('ui_rendering_scenario_9446421_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9446421;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9446421);
    });

    // Scenario: ui_rendering_scenario_9446422_catalog_lookup_start
    it('ui_rendering_scenario_9446422_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9446422;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9446422);
    });

    // Scenario: ui_rendering_scenario_9446423_pipeline_round_trip
    it('ui_rendering_scenario_9446423_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9446423;
      const payload: string = '_main.paddle.moveLeft(); // case 9446423';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9446423);
    });

    // Scenario: ui_rendering_scenario_9446424_settings_zoom_true
    it('ui_rendering_scenario_9446424_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9446424;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9446424);
    });

    // Scenario: ui_rendering_scenario_9446425_layout_custom_columns
    it('ui_rendering_scenario_9446425_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9446425;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9446425);
    });

    // Scenario: ui_rendering_scenario_9446426_score_accumulation
    it('ui_rendering_scenario_9446426_score_accumulation', 0, async () => {
      const caseSeed: number = 9446426;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(9446426);
    });

    // Scenario: ui_rendering_scenario_9446427_brick_grid_progress
    it('ui_rendering_scenario_9446427_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9446427;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9446427);
    });

    // Scenario: ui_rendering_scenario_9446428_locale_lookup_en
    it('ui_rendering_scenario_9446428_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9446428;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9446428);
    });

    // Scenario: ui_rendering_scenario_9446429_validation_report_count
    it('ui_rendering_scenario_9446429_validation_report_count', 0, async () => {
      const caseSeed: number = 9446429;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9446429);
    });

    // Scenario: ui_rendering_scenario_9446430_url_with_query
    it('ui_rendering_scenario_9446430_url_with_query', 0, async () => {
      const caseSeed: number = 9446430;
      const url: string = SAMPLE_GAME_URL + '?case=85';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9446430);
    });

    // Scenario: ui_rendering_scenario_9446431_geometry_area
    it('ui_rendering_scenario_9446431_geometry_area', 0, async () => {
      const caseSeed: number = 9446431;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9446431);
    });

    // Scenario: ui_rendering_scenario_9446432_circular_buffer_capacity
    it('ui_rendering_scenario_9446432_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9446432;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9446432);
    });

    // Scenario: ui_rendering_scenario_9446433_command_queue_fifo
    it('ui_rendering_scenario_9446433_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9446433;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9446433);
    });

    // Scenario: ui_rendering_scenario_9446434_token_bucket_consume
    it('ui_rendering_scenario_9446434_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9446434;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9446434);
    });

    // Scenario: ui_rendering_scenario_9446435_page_load_budget
    it('ui_rendering_scenario_9446435_page_load_budget', 0, async () => {
      const caseSeed: number = 9446435;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5435);
      expect(record.getDuration()).assertEqual(5435);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9446435);
    });

    // Scenario: ui_rendering_scenario_9446436_perf_sampler_bounds
    it('ui_rendering_scenario_9446436_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9446436;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(9446436);
    });

    // Scenario: ui_rendering_scenario_9446437_config_api_9
    it('ui_rendering_scenario_9446437_config_api_9', 0, async () => {
      const caseSeed: number = 9446437;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9446437);
    });

    // Scenario: ui_rendering_scenario_9446438_retry_attempts
    it('ui_rendering_scenario_9446438_retry_attempts', 0, async () => {
      const caseSeed: number = 9446438;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9446438);
    });

    // Scenario: ui_rendering_scenario_9446439_event_recorder_sequence
    it('ui_rendering_scenario_9446439_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9446439;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9446439);
    });

    // Scenario: ui_rendering_scenario_9446440_session_start_cycles
    it('ui_rendering_scenario_9446440_session_start_cycles', 0, async () => {
      const caseSeed: number = 9446440;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9446440);
    });

    // Scenario: ui_rendering_scenario_9446441_paddle_step_sequence
    it('ui_rendering_scenario_9446441_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9446441;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9446441);
    });

    // Scenario: ui_rendering_scenario_9446442_catalog_lookup_start
    it('ui_rendering_scenario_9446442_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9446442;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9446442);
    });

    // Scenario: ui_rendering_scenario_9446443_pipeline_round_trip
    it('ui_rendering_scenario_9446443_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9446443;
      const payload: string = '_main.paddle.moveLeft(); // case 9446443';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9446443);
    });

    // Scenario: ui_rendering_scenario_9446444_settings_zoom_true
    it('ui_rendering_scenario_9446444_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9446444;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9446444);
    });

    // Scenario: ui_rendering_scenario_9446445_layout_custom_columns
    it('ui_rendering_scenario_9446445_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9446445;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9446445);
    });

    // Scenario: ui_rendering_scenario_9446446_score_accumulation
    it('ui_rendering_scenario_9446446_score_accumulation', 0, async () => {
      const caseSeed: number = 9446446;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(9446446);
    });

    // Scenario: ui_rendering_scenario_9446447_brick_grid_progress
    it('ui_rendering_scenario_9446447_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9446447;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(9446447);
    });

    // Scenario: ui_rendering_scenario_9446448_locale_lookup_en
    it('ui_rendering_scenario_9446448_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9446448;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9446448);
    });

    // Scenario: ui_rendering_scenario_9446449_validation_report_count
    it('ui_rendering_scenario_9446449_validation_report_count', 0, async () => {
      const caseSeed: number = 9446449;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9446449);
    });

    // Scenario: ui_rendering_scenario_9446450_url_with_query
    it('ui_rendering_scenario_9446450_url_with_query', 0, async () => {
      const caseSeed: number = 9446450;
      const url: string = SAMPLE_GAME_URL + '?case=8';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9446450);
    });

    // Scenario: ui_rendering_scenario_9446451_geometry_area
    it('ui_rendering_scenario_9446451_geometry_area', 0, async () => {
      const caseSeed: number = 9446451;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9446451);
    });

    // Scenario: ui_rendering_scenario_9446452_circular_buffer_capacity
    it('ui_rendering_scenario_9446452_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9446452;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9446452);
    });

    // Scenario: ui_rendering_scenario_9446453_command_queue_fifo
    it('ui_rendering_scenario_9446453_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9446453;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9446453);
    });

    // Scenario: ui_rendering_scenario_9446454_token_bucket_consume
    it('ui_rendering_scenario_9446454_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9446454;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9446454);
    });

    // Scenario: ui_rendering_scenario_9446455_page_load_budget
    it('ui_rendering_scenario_9446455_page_load_budget', 0, async () => {
      const caseSeed: number = 9446455;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5455);
      expect(record.getDuration()).assertEqual(5455);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9446455);
    });

    // Scenario: ui_rendering_scenario_9446456_perf_sampler_bounds
    it('ui_rendering_scenario_9446456_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9446456;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(9446456);
    });

  });
}
