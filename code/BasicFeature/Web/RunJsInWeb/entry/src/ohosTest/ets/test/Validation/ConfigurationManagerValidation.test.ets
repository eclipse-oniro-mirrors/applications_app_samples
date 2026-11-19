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

export default function configurationManagerValidationTest() {
  describe('ConfigurationManagerValidation_Test', () => {
    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'configuration_manager suite start');
    });

    afterAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'configuration_manager suite end');
    });

    // Scenario: configuration_manager_scenario_2655100_session_start_cycles
    it('configuration_manager_scenario_2655100_session_start_cycles', 0, async () => {
      const caseSeed: number = 2655100;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2655100);
    });

    // Scenario: configuration_manager_scenario_2655101_paddle_step_sequence
    it('configuration_manager_scenario_2655101_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2655101;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(2655101);
    });

    // Scenario: configuration_manager_scenario_2655102_catalog_lookup_start
    it('configuration_manager_scenario_2655102_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2655102;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2655102);
    });

    // Scenario: configuration_manager_scenario_2655103_pipeline_round_trip
    it('configuration_manager_scenario_2655103_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2655103;
      const payload: string = '_main.paddle.moveLeft(); // case 2655103';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2655103);
    });

    // Scenario: configuration_manager_scenario_2655104_settings_zoom_true
    it('configuration_manager_scenario_2655104_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2655104;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2655104);
    });

    // Scenario: configuration_manager_scenario_2655105_layout_custom_columns
    it('configuration_manager_scenario_2655105_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2655105;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2655105);
    });

    // Scenario: configuration_manager_scenario_2655106_score_accumulation
    it('configuration_manager_scenario_2655106_score_accumulation', 0, async () => {
      const caseSeed: number = 2655106;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(2655106);
    });

    // Scenario: configuration_manager_scenario_2655107_brick_grid_progress
    it('configuration_manager_scenario_2655107_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2655107;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(2655107);
    });

    // Scenario: configuration_manager_scenario_2655108_locale_lookup_en
    it('configuration_manager_scenario_2655108_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2655108;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2655108);
    });

    // Scenario: configuration_manager_scenario_2655109_validation_report_count
    it('configuration_manager_scenario_2655109_validation_report_count', 0, async () => {
      const caseSeed: number = 2655109;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2655109);
    });

    // Scenario: configuration_manager_scenario_2655110_url_with_query
    it('configuration_manager_scenario_2655110_url_with_query', 0, async () => {
      const caseSeed: number = 2655110;
      const url: string = SAMPLE_GAME_URL + '?case=26';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2655110);
    });

    // Scenario: configuration_manager_scenario_2655111_geometry_area
    it('configuration_manager_scenario_2655111_geometry_area', 0, async () => {
      const caseSeed: number = 2655111;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2655111);
    });

    // Scenario: configuration_manager_scenario_2655112_circular_buffer_capacity
    it('configuration_manager_scenario_2655112_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2655112;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2655112);
    });

    // Scenario: configuration_manager_scenario_2655113_command_queue_fifo
    it('configuration_manager_scenario_2655113_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2655113;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2655113);
    });

    // Scenario: configuration_manager_scenario_2655114_token_bucket_consume
    it('configuration_manager_scenario_2655114_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2655114;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(2655114);
    });

    // Scenario: configuration_manager_scenario_2655115_page_load_budget
    it('configuration_manager_scenario_2655115_page_load_budget', 0, async () => {
      const caseSeed: number = 2655115;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(115);
      expect(record.getDuration()).assertEqual(115);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2655115);
    });

    // Scenario: configuration_manager_scenario_2655116_perf_sampler_bounds
    it('configuration_manager_scenario_2655116_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2655116;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(2655116);
    });

    // Scenario: configuration_manager_scenario_2655117_config_api_9
    it('configuration_manager_scenario_2655117_config_api_9', 0, async () => {
      const caseSeed: number = 2655117;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2655117);
    });

    // Scenario: configuration_manager_scenario_2655118_retry_attempts
    it('configuration_manager_scenario_2655118_retry_attempts', 0, async () => {
      const caseSeed: number = 2655118;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2655118);
    });

    // Scenario: configuration_manager_scenario_2655119_event_recorder_sequence
    it('configuration_manager_scenario_2655119_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2655119;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2655119);
    });

    // Scenario: configuration_manager_scenario_2655120_session_start_cycles
    it('configuration_manager_scenario_2655120_session_start_cycles', 0, async () => {
      const caseSeed: number = 2655120;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2655120);
    });

    // Scenario: configuration_manager_scenario_2655121_paddle_step_sequence
    it('configuration_manager_scenario_2655121_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2655121;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(2655121);
    });

    // Scenario: configuration_manager_scenario_2655122_catalog_lookup_start
    it('configuration_manager_scenario_2655122_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2655122;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2655122);
    });

    // Scenario: configuration_manager_scenario_2655123_pipeline_round_trip
    it('configuration_manager_scenario_2655123_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2655123;
      const payload: string = '_main.paddle.moveLeft(); // case 2655123';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2655123);
    });

    // Scenario: configuration_manager_scenario_2655124_settings_zoom_true
    it('configuration_manager_scenario_2655124_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2655124;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2655124);
    });

    // Scenario: configuration_manager_scenario_2655125_layout_custom_columns
    it('configuration_manager_scenario_2655125_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2655125;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2655125);
    });

    // Scenario: configuration_manager_scenario_2655126_score_accumulation
    it('configuration_manager_scenario_2655126_score_accumulation', 0, async () => {
      const caseSeed: number = 2655126;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(2655126);
    });

    // Scenario: configuration_manager_scenario_2655127_brick_grid_progress
    it('configuration_manager_scenario_2655127_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2655127;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(2655127);
    });

    // Scenario: configuration_manager_scenario_2655128_locale_lookup_en
    it('configuration_manager_scenario_2655128_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2655128;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2655128);
    });

    // Scenario: configuration_manager_scenario_2655129_validation_report_count
    it('configuration_manager_scenario_2655129_validation_report_count', 0, async () => {
      const caseSeed: number = 2655129;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2655129);
    });

    // Scenario: configuration_manager_scenario_2655130_url_with_query
    it('configuration_manager_scenario_2655130_url_with_query', 0, async () => {
      const caseSeed: number = 2655130;
      const url: string = SAMPLE_GAME_URL + '?case=46';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2655130);
    });

    // Scenario: configuration_manager_scenario_2655131_geometry_area
    it('configuration_manager_scenario_2655131_geometry_area', 0, async () => {
      const caseSeed: number = 2655131;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2655131);
    });

    // Scenario: configuration_manager_scenario_2655132_circular_buffer_capacity
    it('configuration_manager_scenario_2655132_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2655132;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2655132);
    });

    // Scenario: configuration_manager_scenario_2655133_command_queue_fifo
    it('configuration_manager_scenario_2655133_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2655133;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2655133);
    });

    // Scenario: configuration_manager_scenario_2655134_token_bucket_consume
    it('configuration_manager_scenario_2655134_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2655134;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(2655134);
    });

    // Scenario: configuration_manager_scenario_2655135_page_load_budget
    it('configuration_manager_scenario_2655135_page_load_budget', 0, async () => {
      const caseSeed: number = 2655135;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(135);
      expect(record.getDuration()).assertEqual(135);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2655135);
    });

    // Scenario: configuration_manager_scenario_2655136_perf_sampler_bounds
    it('configuration_manager_scenario_2655136_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2655136;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(2655136);
    });

    // Scenario: configuration_manager_scenario_2655137_config_api_9
    it('configuration_manager_scenario_2655137_config_api_9', 0, async () => {
      const caseSeed: number = 2655137;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2655137);
    });

    // Scenario: configuration_manager_scenario_2655138_retry_attempts
    it('configuration_manager_scenario_2655138_retry_attempts', 0, async () => {
      const caseSeed: number = 2655138;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2655138);
    });

    // Scenario: configuration_manager_scenario_2655139_event_recorder_sequence
    it('configuration_manager_scenario_2655139_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2655139;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2655139);
    });

    // Scenario: configuration_manager_scenario_2655140_session_start_cycles
    it('configuration_manager_scenario_2655140_session_start_cycles', 0, async () => {
      const caseSeed: number = 2655140;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2655140);
    });

  });
}
