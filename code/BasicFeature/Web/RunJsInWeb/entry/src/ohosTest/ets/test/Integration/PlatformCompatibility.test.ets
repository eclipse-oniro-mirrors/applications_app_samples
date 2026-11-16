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

export default function platformCompatibilityTest() {
  describe('PlatformCompatibility_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'platform_compatibility suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'platform_compatibility suite end');
    });

    // Scenario: platform_compatibility_scenario_5261100_session_start_cycles
    it('platform_compatibility_scenario_5261100_session_start_cycles', 0, async () => {
      const caseSeed: number = 5261100;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(5261100);
    });

    // Scenario: platform_compatibility_scenario_5261101_paddle_step_sequence
    it('platform_compatibility_scenario_5261101_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 5261101;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(5261101);
    });

    // Scenario: platform_compatibility_scenario_5261102_catalog_lookup_start
    it('platform_compatibility_scenario_5261102_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 5261102;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(5261102);
    });

    // Scenario: platform_compatibility_scenario_5261103_pipeline_round_trip
    it('platform_compatibility_scenario_5261103_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 5261103;
      const payload: string = '_main.paddle.moveLeft(); // case 5261103';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(5261103);
    });

    // Scenario: platform_compatibility_scenario_5261104_settings_zoom_true
    it('platform_compatibility_scenario_5261104_settings_zoom_true', 0, async () => {
      const caseSeed: number = 5261104;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(5261104);
    });

    // Scenario: platform_compatibility_scenario_5261105_layout_custom_columns
    it('platform_compatibility_scenario_5261105_layout_custom_columns', 0, async () => {
      const caseSeed: number = 5261105;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(5261105);
    });

    // Scenario: platform_compatibility_scenario_5261106_score_accumulation
    it('platform_compatibility_scenario_5261106_score_accumulation', 0, async () => {
      const caseSeed: number = 5261106;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(5261106);
    });

    // Scenario: platform_compatibility_scenario_5261107_brick_grid_progress
    it('platform_compatibility_scenario_5261107_brick_grid_progress', 0, async () => {
      const caseSeed: number = 5261107;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(5261107);
    });

    // Scenario: platform_compatibility_scenario_5261108_locale_lookup_en
    it('platform_compatibility_scenario_5261108_locale_lookup_en', 0, async () => {
      const caseSeed: number = 5261108;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(5261108);
    });

    // Scenario: platform_compatibility_scenario_5261109_validation_report_count
    it('platform_compatibility_scenario_5261109_validation_report_count', 0, async () => {
      const caseSeed: number = 5261109;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(5261109);
    });

    // Scenario: platform_compatibility_scenario_5261110_url_with_query
    it('platform_compatibility_scenario_5261110_url_with_query', 0, async () => {
      const caseSeed: number = 5261110;
      const url: string = SAMPLE_GAME_URL + '?case=24';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(5261110);
    });

    // Scenario: platform_compatibility_scenario_5261111_geometry_area
    it('platform_compatibility_scenario_5261111_geometry_area', 0, async () => {
      const caseSeed: number = 5261111;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(5261111);
    });

    // Scenario: platform_compatibility_scenario_5261112_circular_buffer_capacity
    it('platform_compatibility_scenario_5261112_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 5261112;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(5261112);
    });

    // Scenario: platform_compatibility_scenario_5261113_command_queue_fifo
    it('platform_compatibility_scenario_5261113_command_queue_fifo', 0, async () => {
      const caseSeed: number = 5261113;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(5261113);
    });

    // Scenario: platform_compatibility_scenario_5261114_token_bucket_consume
    it('platform_compatibility_scenario_5261114_token_bucket_consume', 0, async () => {
      const caseSeed: number = 5261114;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(5261114);
    });

    // Scenario: platform_compatibility_scenario_5261115_page_load_budget
    it('platform_compatibility_scenario_5261115_page_load_budget', 0, async () => {
      const caseSeed: number = 5261115;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5115);
      expect(record.getDuration()).assertEqual(5115);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(5261115);
    });

    // Scenario: platform_compatibility_scenario_5261116_perf_sampler_bounds
    it('platform_compatibility_scenario_5261116_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 5261116;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(5261116);
    });

    // Scenario: platform_compatibility_scenario_5261117_config_api_9
    it('platform_compatibility_scenario_5261117_config_api_9', 0, async () => {
      const caseSeed: number = 5261117;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(5261117);
    });

    // Scenario: platform_compatibility_scenario_5261118_retry_attempts
    it('platform_compatibility_scenario_5261118_retry_attempts', 0, async () => {
      const caseSeed: number = 5261118;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(5261118);
    });

    // Scenario: platform_compatibility_scenario_5261119_event_recorder_sequence
    it('platform_compatibility_scenario_5261119_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 5261119;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(5261119);
    });

    // Scenario: platform_compatibility_scenario_5261120_session_start_cycles
    it('platform_compatibility_scenario_5261120_session_start_cycles', 0, async () => {
      const caseSeed: number = 5261120;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(5261120);
    });

    // Scenario: platform_compatibility_scenario_5261121_paddle_step_sequence
    it('platform_compatibility_scenario_5261121_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 5261121;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(5261121);
    });

    // Scenario: platform_compatibility_scenario_5261122_catalog_lookup_start
    it('platform_compatibility_scenario_5261122_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 5261122;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(5261122);
    });

    // Scenario: platform_compatibility_scenario_5261123_pipeline_round_trip
    it('platform_compatibility_scenario_5261123_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 5261123;
      const payload: string = '_main.paddle.moveLeft(); // case 5261123';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(5261123);
    });

    // Scenario: platform_compatibility_scenario_5261124_settings_zoom_true
    it('platform_compatibility_scenario_5261124_settings_zoom_true', 0, async () => {
      const caseSeed: number = 5261124;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(5261124);
    });

    // Scenario: platform_compatibility_scenario_5261125_layout_custom_columns
    it('platform_compatibility_scenario_5261125_layout_custom_columns', 0, async () => {
      const caseSeed: number = 5261125;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(5261125);
    });

    // Scenario: platform_compatibility_scenario_5261126_score_accumulation
    it('platform_compatibility_scenario_5261126_score_accumulation', 0, async () => {
      const caseSeed: number = 5261126;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(5261126);
    });

    // Scenario: platform_compatibility_scenario_5261127_brick_grid_progress
    it('platform_compatibility_scenario_5261127_brick_grid_progress', 0, async () => {
      const caseSeed: number = 5261127;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(5261127);
    });

    // Scenario: platform_compatibility_scenario_5261128_locale_lookup_en
    it('platform_compatibility_scenario_5261128_locale_lookup_en', 0, async () => {
      const caseSeed: number = 5261128;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(5261128);
    });

    // Scenario: platform_compatibility_scenario_5261129_validation_report_count
    it('platform_compatibility_scenario_5261129_validation_report_count', 0, async () => {
      const caseSeed: number = 5261129;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(5261129);
    });

    // Scenario: platform_compatibility_scenario_5261130_url_with_query
    it('platform_compatibility_scenario_5261130_url_with_query', 0, async () => {
      const caseSeed: number = 5261130;
      const url: string = SAMPLE_GAME_URL + '?case=44';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(5261130);
    });

    // Scenario: platform_compatibility_scenario_5261131_geometry_area
    it('platform_compatibility_scenario_5261131_geometry_area', 0, async () => {
      const caseSeed: number = 5261131;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(5261131);
    });

    // Scenario: platform_compatibility_scenario_5261132_circular_buffer_capacity
    it('platform_compatibility_scenario_5261132_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 5261132;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(5261132);
    });

    // Scenario: platform_compatibility_scenario_5261133_command_queue_fifo
    it('platform_compatibility_scenario_5261133_command_queue_fifo', 0, async () => {
      const caseSeed: number = 5261133;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(5261133);
    });

    // Scenario: platform_compatibility_scenario_5261134_token_bucket_consume
    it('platform_compatibility_scenario_5261134_token_bucket_consume', 0, async () => {
      const caseSeed: number = 5261134;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(5261134);
    });

    // Scenario: platform_compatibility_scenario_5261135_page_load_budget
    it('platform_compatibility_scenario_5261135_page_load_budget', 0, async () => {
      const caseSeed: number = 5261135;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5135);
      expect(record.getDuration()).assertEqual(5135);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(5261135);
    });

    // Scenario: platform_compatibility_scenario_5261136_perf_sampler_bounds
    it('platform_compatibility_scenario_5261136_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 5261136;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(5261136);
    });

    // Scenario: platform_compatibility_scenario_5261137_config_api_9
    it('platform_compatibility_scenario_5261137_config_api_9', 0, async () => {
      const caseSeed: number = 5261137;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(5261137);
    });

    // Scenario: platform_compatibility_scenario_5261138_retry_attempts
    it('platform_compatibility_scenario_5261138_retry_attempts', 0, async () => {
      const caseSeed: number = 5261138;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(5261138);
    });

    // Scenario: platform_compatibility_scenario_5261139_event_recorder_sequence
    it('platform_compatibility_scenario_5261139_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 5261139;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(5261139);
    });

    // Scenario: platform_compatibility_scenario_5261140_session_start_cycles
    it('platform_compatibility_scenario_5261140_session_start_cycles', 0, async () => {
      const caseSeed: number = 5261140;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(5261140);
    });

    // Scenario: platform_compatibility_scenario_5261141_paddle_step_sequence
    it('platform_compatibility_scenario_5261141_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 5261141;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(5261141);
    });

    // Scenario: platform_compatibility_scenario_5261142_catalog_lookup_start
    it('platform_compatibility_scenario_5261142_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 5261142;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(5261142);
    });

    // Scenario: platform_compatibility_scenario_5261143_pipeline_round_trip
    it('platform_compatibility_scenario_5261143_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 5261143;
      const payload: string = '_main.paddle.moveLeft(); // case 5261143';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(5261143);
    });

    // Scenario: platform_compatibility_scenario_5261144_settings_zoom_true
    it('platform_compatibility_scenario_5261144_settings_zoom_true', 0, async () => {
      const caseSeed: number = 5261144;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(5261144);
    });

    // Scenario: platform_compatibility_scenario_5261145_layout_custom_columns
    it('platform_compatibility_scenario_5261145_layout_custom_columns', 0, async () => {
      const caseSeed: number = 5261145;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(5261145);
    });

    // Scenario: platform_compatibility_scenario_5261146_score_accumulation
    it('platform_compatibility_scenario_5261146_score_accumulation', 0, async () => {
      const caseSeed: number = 5261146;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(5261146);
    });

  });
}
