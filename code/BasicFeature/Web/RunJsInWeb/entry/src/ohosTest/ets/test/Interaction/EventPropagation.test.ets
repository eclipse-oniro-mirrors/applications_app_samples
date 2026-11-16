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

export default function eventPropagationTest() {
  describe('EventPropagation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'event_propagation suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'event_propagation suite end');
    });

    // Scenario: event_propagation_scenario_9879400_session_start_cycles
    it('event_propagation_scenario_9879400_session_start_cycles', 0, async () => {
      const caseSeed: number = 9879400;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9879400);
    });

    // Scenario: event_propagation_scenario_9879401_paddle_step_sequence
    it('event_propagation_scenario_9879401_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9879401;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9879401);
    });

    // Scenario: event_propagation_scenario_9879402_catalog_lookup_start
    it('event_propagation_scenario_9879402_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9879402;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9879402);
    });

    // Scenario: event_propagation_scenario_9879403_pipeline_round_trip
    it('event_propagation_scenario_9879403_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9879403;
      const payload: string = '_main.paddle.moveLeft(); // case 9879403';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9879403);
    });

    // Scenario: event_propagation_scenario_9879404_settings_zoom_true
    it('event_propagation_scenario_9879404_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9879404;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9879404);
    });

    // Scenario: event_propagation_scenario_9879405_layout_custom_columns
    it('event_propagation_scenario_9879405_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9879405;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9879405);
    });

    // Scenario: event_propagation_scenario_9879406_score_accumulation
    it('event_propagation_scenario_9879406_score_accumulation', 0, async () => {
      const caseSeed: number = 9879406;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(9879406);
    });

    // Scenario: event_propagation_scenario_9879407_brick_grid_progress
    it('event_propagation_scenario_9879407_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9879407;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(9879407);
    });

    // Scenario: event_propagation_scenario_9879408_locale_lookup_en
    it('event_propagation_scenario_9879408_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9879408;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9879408);
    });

    // Scenario: event_propagation_scenario_9879409_validation_report_count
    it('event_propagation_scenario_9879409_validation_report_count', 0, async () => {
      const caseSeed: number = 9879409;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9879409);
    });

    // Scenario: event_propagation_scenario_9879410_url_with_query
    it('event_propagation_scenario_9879410_url_with_query', 0, async () => {
      const caseSeed: number = 9879410;
      const url: string = SAMPLE_GAME_URL + '?case=57';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9879410);
    });

    // Scenario: event_propagation_scenario_9879411_geometry_area
    it('event_propagation_scenario_9879411_geometry_area', 0, async () => {
      const caseSeed: number = 9879411;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9879411);
    });

    // Scenario: event_propagation_scenario_9879412_circular_buffer_capacity
    it('event_propagation_scenario_9879412_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9879412;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9879412);
    });

    // Scenario: event_propagation_scenario_9879413_command_queue_fifo
    it('event_propagation_scenario_9879413_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9879413;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9879413);
    });

    // Scenario: event_propagation_scenario_9879414_token_bucket_consume
    it('event_propagation_scenario_9879414_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9879414;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9879414);
    });

    // Scenario: event_propagation_scenario_9879415_page_load_budget
    it('event_propagation_scenario_9879415_page_load_budget', 0, async () => {
      const caseSeed: number = 9879415;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6415);
      expect(record.getDuration()).assertEqual(6415);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9879415);
    });

    // Scenario: event_propagation_scenario_9879416_perf_sampler_bounds
    it('event_propagation_scenario_9879416_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9879416;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(9879416);
    });

    // Scenario: event_propagation_scenario_9879417_config_api_9
    it('event_propagation_scenario_9879417_config_api_9', 0, async () => {
      const caseSeed: number = 9879417;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9879417);
    });

    // Scenario: event_propagation_scenario_9879418_retry_attempts
    it('event_propagation_scenario_9879418_retry_attempts', 0, async () => {
      const caseSeed: number = 9879418;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9879418);
    });

    // Scenario: event_propagation_scenario_9879419_event_recorder_sequence
    it('event_propagation_scenario_9879419_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9879419;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9879419);
    });

    // Scenario: event_propagation_scenario_9879420_session_start_cycles
    it('event_propagation_scenario_9879420_session_start_cycles', 0, async () => {
      const caseSeed: number = 9879420;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9879420);
    });

    // Scenario: event_propagation_scenario_9879421_paddle_step_sequence
    it('event_propagation_scenario_9879421_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9879421;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9879421);
    });

    // Scenario: event_propagation_scenario_9879422_catalog_lookup_start
    it('event_propagation_scenario_9879422_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9879422;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9879422);
    });

    // Scenario: event_propagation_scenario_9879423_pipeline_round_trip
    it('event_propagation_scenario_9879423_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9879423;
      const payload: string = '_main.paddle.moveLeft(); // case 9879423';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9879423);
    });

    // Scenario: event_propagation_scenario_9879424_settings_zoom_true
    it('event_propagation_scenario_9879424_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9879424;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9879424);
    });

    // Scenario: event_propagation_scenario_9879425_layout_custom_columns
    it('event_propagation_scenario_9879425_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9879425;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9879425);
    });

    // Scenario: event_propagation_scenario_9879426_score_accumulation
    it('event_propagation_scenario_9879426_score_accumulation', 0, async () => {
      const caseSeed: number = 9879426;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(9879426);
    });

    // Scenario: event_propagation_scenario_9879427_brick_grid_progress
    it('event_propagation_scenario_9879427_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9879427;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9879427);
    });

    // Scenario: event_propagation_scenario_9879428_locale_lookup_en
    it('event_propagation_scenario_9879428_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9879428;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9879428);
    });

    // Scenario: event_propagation_scenario_9879429_validation_report_count
    it('event_propagation_scenario_9879429_validation_report_count', 0, async () => {
      const caseSeed: number = 9879429;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9879429);
    });

    // Scenario: event_propagation_scenario_9879430_url_with_query
    it('event_propagation_scenario_9879430_url_with_query', 0, async () => {
      const caseSeed: number = 9879430;
      const url: string = SAMPLE_GAME_URL + '?case=77';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9879430);
    });

    // Scenario: event_propagation_scenario_9879431_geometry_area
    it('event_propagation_scenario_9879431_geometry_area', 0, async () => {
      const caseSeed: number = 9879431;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9879431);
    });

    // Scenario: event_propagation_scenario_9879432_circular_buffer_capacity
    it('event_propagation_scenario_9879432_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9879432;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9879432);
    });

    // Scenario: event_propagation_scenario_9879433_command_queue_fifo
    it('event_propagation_scenario_9879433_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9879433;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9879433);
    });

    // Scenario: event_propagation_scenario_9879434_token_bucket_consume
    it('event_propagation_scenario_9879434_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9879434;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9879434);
    });

    // Scenario: event_propagation_scenario_9879435_page_load_budget
    it('event_propagation_scenario_9879435_page_load_budget', 0, async () => {
      const caseSeed: number = 9879435;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6435);
      expect(record.getDuration()).assertEqual(6435);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9879435);
    });

    // Scenario: event_propagation_scenario_9879436_perf_sampler_bounds
    it('event_propagation_scenario_9879436_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9879436;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(9879436);
    });

    // Scenario: event_propagation_scenario_9879437_config_api_9
    it('event_propagation_scenario_9879437_config_api_9', 0, async () => {
      const caseSeed: number = 9879437;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9879437);
    });

    // Scenario: event_propagation_scenario_9879438_retry_attempts
    it('event_propagation_scenario_9879438_retry_attempts', 0, async () => {
      const caseSeed: number = 9879438;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9879438);
    });

    // Scenario: event_propagation_scenario_9879439_event_recorder_sequence
    it('event_propagation_scenario_9879439_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9879439;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9879439);
    });

    // Scenario: event_propagation_scenario_9879440_session_start_cycles
    it('event_propagation_scenario_9879440_session_start_cycles', 0, async () => {
      const caseSeed: number = 9879440;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9879440);
    });

    // Scenario: event_propagation_scenario_9879441_paddle_step_sequence
    it('event_propagation_scenario_9879441_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9879441;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9879441);
    });

    // Scenario: event_propagation_scenario_9879442_catalog_lookup_start
    it('event_propagation_scenario_9879442_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9879442;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9879442);
    });

    // Scenario: event_propagation_scenario_9879443_pipeline_round_trip
    it('event_propagation_scenario_9879443_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9879443;
      const payload: string = '_main.paddle.moveLeft(); // case 9879443';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9879443);
    });

    // Scenario: event_propagation_scenario_9879444_settings_zoom_true
    it('event_propagation_scenario_9879444_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9879444;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9879444);
    });

    // Scenario: event_propagation_scenario_9879445_layout_custom_columns
    it('event_propagation_scenario_9879445_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9879445;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9879445);
    });

    // Scenario: event_propagation_scenario_9879446_score_accumulation
    it('event_propagation_scenario_9879446_score_accumulation', 0, async () => {
      const caseSeed: number = 9879446;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(9879446);
    });

    // Scenario: event_propagation_scenario_9879447_brick_grid_progress
    it('event_propagation_scenario_9879447_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9879447;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9879447);
    });

    // Scenario: event_propagation_scenario_9879448_locale_lookup_en
    it('event_propagation_scenario_9879448_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9879448;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9879448);
    });

    // Scenario: event_propagation_scenario_9879449_validation_report_count
    it('event_propagation_scenario_9879449_validation_report_count', 0, async () => {
      const caseSeed: number = 9879449;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9879449);
    });

    // Scenario: event_propagation_scenario_9879450_url_with_query
    it('event_propagation_scenario_9879450_url_with_query', 0, async () => {
      const caseSeed: number = 9879450;
      const url: string = SAMPLE_GAME_URL + '?case=0';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9879450);
    });

    // Scenario: event_propagation_scenario_9879451_geometry_area
    it('event_propagation_scenario_9879451_geometry_area', 0, async () => {
      const caseSeed: number = 9879451;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9879451);
    });

    // Scenario: event_propagation_scenario_9879452_circular_buffer_capacity
    it('event_propagation_scenario_9879452_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9879452;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9879452);
    });

    // Scenario: event_propagation_scenario_9879453_command_queue_fifo
    it('event_propagation_scenario_9879453_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9879453;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9879453);
    });

    // Scenario: event_propagation_scenario_9879454_token_bucket_consume
    it('event_propagation_scenario_9879454_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9879454;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9879454);
    });

    // Scenario: event_propagation_scenario_9879455_page_load_budget
    it('event_propagation_scenario_9879455_page_load_budget', 0, async () => {
      const caseSeed: number = 9879455;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6455);
      expect(record.getDuration()).assertEqual(6455);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9879455);
    });

    // Scenario: event_propagation_scenario_9879456_perf_sampler_bounds
    it('event_propagation_scenario_9879456_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9879456;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(9879456);
    });

    // Scenario: event_propagation_scenario_9879457_config_api_9
    it('event_propagation_scenario_9879457_config_api_9', 0, async () => {
      const caseSeed: number = 9879457;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9879457);
    });

    // Scenario: event_propagation_scenario_9879458_retry_attempts
    it('event_propagation_scenario_9879458_retry_attempts', 0, async () => {
      const caseSeed: number = 9879458;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9879458);
    });

    // Scenario: event_propagation_scenario_9879459_event_recorder_sequence
    it('event_propagation_scenario_9879459_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9879459;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9879459);
    });

    // Scenario: event_propagation_scenario_9879460_session_start_cycles
    it('event_propagation_scenario_9879460_session_start_cycles', 0, async () => {
      const caseSeed: number = 9879460;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9879460);
    });

    // Scenario: event_propagation_scenario_9879461_paddle_step_sequence
    it('event_propagation_scenario_9879461_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9879461;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9879461);
    });

    // Scenario: event_propagation_scenario_9879462_catalog_lookup_start
    it('event_propagation_scenario_9879462_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9879462;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9879462);
    });

    // Scenario: event_propagation_scenario_9879463_pipeline_round_trip
    it('event_propagation_scenario_9879463_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9879463;
      const payload: string = '_main.paddle.moveLeft(); // case 9879463';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9879463);
    });

    // Scenario: event_propagation_scenario_9879464_settings_zoom_true
    it('event_propagation_scenario_9879464_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9879464;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9879464);
    });

  });
}
