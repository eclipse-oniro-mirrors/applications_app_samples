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

export default function resourceLoaderValidationTest() {
  describe('ResourceLoaderValidation_Test', () => {
    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'resource_loader suite start');
    });

    afterAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'resource_loader suite end');
    });

    // Scenario: resource_loader_scenario_5456300_session_start_cycles
    it('resource_loader_scenario_5456300_session_start_cycles', 0, async () => {
      const caseSeed: number = 5456300;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(5456300);
    });

    // Scenario: resource_loader_scenario_5456301_paddle_step_sequence
    it('resource_loader_scenario_5456301_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 5456301;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(5456301);
    });

    // Scenario: resource_loader_scenario_5456302_catalog_lookup_start
    it('resource_loader_scenario_5456302_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 5456302;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(5456302);
    });

    // Scenario: resource_loader_scenario_5456303_pipeline_round_trip
    it('resource_loader_scenario_5456303_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 5456303;
      const payload: string = '_main.paddle.moveLeft(); // case 5456303';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(5456303);
    });

    // Scenario: resource_loader_scenario_5456304_settings_zoom_true
    it('resource_loader_scenario_5456304_settings_zoom_true', 0, async () => {
      const caseSeed: number = 5456304;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(5456304);
    });

    // Scenario: resource_loader_scenario_5456305_layout_custom_columns
    it('resource_loader_scenario_5456305_layout_custom_columns', 0, async () => {
      const caseSeed: number = 5456305;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(5456305);
    });

    // Scenario: resource_loader_scenario_5456306_score_accumulation
    it('resource_loader_scenario_5456306_score_accumulation', 0, async () => {
      const caseSeed: number = 5456306;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(5456306);
    });

    // Scenario: resource_loader_scenario_5456307_brick_grid_progress
    it('resource_loader_scenario_5456307_brick_grid_progress', 0, async () => {
      const caseSeed: number = 5456307;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(5456307);
    });

    // Scenario: resource_loader_scenario_5456308_locale_lookup_en
    it('resource_loader_scenario_5456308_locale_lookup_en', 0, async () => {
      const caseSeed: number = 5456308;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(5456308);
    });

    // Scenario: resource_loader_scenario_5456309_validation_report_count
    it('resource_loader_scenario_5456309_validation_report_count', 0, async () => {
      const caseSeed: number = 5456309;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(5456309);
    });

    // Scenario: resource_loader_scenario_5456310_url_with_query
    it('resource_loader_scenario_5456310_url_with_query', 0, async () => {
      const caseSeed: number = 5456310;
      const url: string = SAMPLE_GAME_URL + '?case=60';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(5456310);
    });

    // Scenario: resource_loader_scenario_5456311_geometry_area
    it('resource_loader_scenario_5456311_geometry_area', 0, async () => {
      const caseSeed: number = 5456311;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 41);
      expect(box.area()).assertEqual(3321);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(5456311);
    });

    // Scenario: resource_loader_scenario_5456312_circular_buffer_capacity
    it('resource_loader_scenario_5456312_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 5456312;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(5456312);
    });

    // Scenario: resource_loader_scenario_5456313_command_queue_fifo
    it('resource_loader_scenario_5456313_command_queue_fifo', 0, async () => {
      const caseSeed: number = 5456313;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(5456313);
    });

    // Scenario: resource_loader_scenario_5456314_token_bucket_consume
    it('resource_loader_scenario_5456314_token_bucket_consume', 0, async () => {
      const caseSeed: number = 5456314;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(5456314);
    });

    // Scenario: resource_loader_scenario_5456315_page_load_budget
    it('resource_loader_scenario_5456315_page_load_budget', 0, async () => {
      const caseSeed: number = 5456315;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2315);
      expect(record.getDuration()).assertEqual(2315);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(5456315);
    });

    // Scenario: resource_loader_scenario_5456316_perf_sampler_bounds
    it('resource_loader_scenario_5456316_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 5456316;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(5456316);
    });

    // Scenario: resource_loader_scenario_5456317_config_api_9
    it('resource_loader_scenario_5456317_config_api_9', 0, async () => {
      const caseSeed: number = 5456317;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(5456317);
    });

    // Scenario: resource_loader_scenario_5456318_retry_attempts
    it('resource_loader_scenario_5456318_retry_attempts', 0, async () => {
      const caseSeed: number = 5456318;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(5456318);
    });

    // Scenario: resource_loader_scenario_5456319_event_recorder_sequence
    it('resource_loader_scenario_5456319_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 5456319;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(5456319);
    });

    // Scenario: resource_loader_scenario_5456320_session_start_cycles
    it('resource_loader_scenario_5456320_session_start_cycles', 0, async () => {
      const caseSeed: number = 5456320;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(5456320);
    });

    // Scenario: resource_loader_scenario_5456321_paddle_step_sequence
    it('resource_loader_scenario_5456321_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 5456321;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(5456321);
    });

    // Scenario: resource_loader_scenario_5456322_catalog_lookup_start
    it('resource_loader_scenario_5456322_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 5456322;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(5456322);
    });

    // Scenario: resource_loader_scenario_5456323_pipeline_round_trip
    it('resource_loader_scenario_5456323_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 5456323;
      const payload: string = '_main.paddle.moveLeft(); // case 5456323';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(5456323);
    });

    // Scenario: resource_loader_scenario_5456324_settings_zoom_true
    it('resource_loader_scenario_5456324_settings_zoom_true', 0, async () => {
      const caseSeed: number = 5456324;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(5456324);
    });

    // Scenario: resource_loader_scenario_5456325_layout_custom_columns
    it('resource_loader_scenario_5456325_layout_custom_columns', 0, async () => {
      const caseSeed: number = 5456325;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(5456325);
    });

    // Scenario: resource_loader_scenario_5456326_score_accumulation
    it('resource_loader_scenario_5456326_score_accumulation', 0, async () => {
      const caseSeed: number = 5456326;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(5456326);
    });

    // Scenario: resource_loader_scenario_5456327_brick_grid_progress
    it('resource_loader_scenario_5456327_brick_grid_progress', 0, async () => {
      const caseSeed: number = 5456327;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(5456327);
    });

    // Scenario: resource_loader_scenario_5456328_locale_lookup_en
    it('resource_loader_scenario_5456328_locale_lookup_en', 0, async () => {
      const caseSeed: number = 5456328;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(5456328);
    });

    // Scenario: resource_loader_scenario_5456329_validation_report_count
    it('resource_loader_scenario_5456329_validation_report_count', 0, async () => {
      const caseSeed: number = 5456329;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(5456329);
    });

    // Scenario: resource_loader_scenario_5456330_url_with_query
    it('resource_loader_scenario_5456330_url_with_query', 0, async () => {
      const caseSeed: number = 5456330;
      const url: string = SAMPLE_GAME_URL + '?case=80';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(5456330);
    });

    // Scenario: resource_loader_scenario_5456331_geometry_area
    it('resource_loader_scenario_5456331_geometry_area', 0, async () => {
      const caseSeed: number = 5456331;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 61);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(5456331);
    });

    // Scenario: resource_loader_scenario_5456332_circular_buffer_capacity
    it('resource_loader_scenario_5456332_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 5456332;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(5456332);
    });

    // Scenario: resource_loader_scenario_5456333_command_queue_fifo
    it('resource_loader_scenario_5456333_command_queue_fifo', 0, async () => {
      const caseSeed: number = 5456333;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(5456333);
    });

    // Scenario: resource_loader_scenario_5456334_token_bucket_consume
    it('resource_loader_scenario_5456334_token_bucket_consume', 0, async () => {
      const caseSeed: number = 5456334;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(5456334);
    });

    // Scenario: resource_loader_scenario_5456335_page_load_budget
    it('resource_loader_scenario_5456335_page_load_budget', 0, async () => {
      const caseSeed: number = 5456335;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2335);
      expect(record.getDuration()).assertEqual(2335);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(5456335);
    });

    // Scenario: resource_loader_scenario_5456336_perf_sampler_bounds
    it('resource_loader_scenario_5456336_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 5456336;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(5456336);
    });

  });
}
