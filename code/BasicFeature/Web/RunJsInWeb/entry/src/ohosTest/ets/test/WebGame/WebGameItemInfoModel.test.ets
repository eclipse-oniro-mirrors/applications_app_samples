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
  API_VERSION,
  MODULE_NAME,
  ABILITY_NAME,
  BUNDLE_NAME,
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

export default function webGameItemInfoModelTest() {
  describe('WebGameItemInfoModel_Test', () => {
    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_item suite start');
    });

    afterAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_item suite end');
    });

    // Scenario: game_item_config_identity_matches_module
    it('game_item_config_identity_matches_module', 0, async () => {
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.bundleName).assertEqual(BUNDLE_NAME);
      expect(config.moduleName).assertEqual(MODULE_NAME);
      expect(config.abilityName).assertEqual(ABILITY_NAME);
      expect(config.apiVersion).assertEqual(API_VERSION);
    });

    // Scenario: game_item_config_is_landscape_only
    it('game_item_config_is_landscape_only', 0, async () => {
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.isLandscape()).assertTrue();
      expect(config.supportsDevice('default')).assertTrue();
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.supportsDevice('phone')).assertFalse();
      expect(config.deviceTypeCount()).assertEqual(2);
    });

    // Scenario: game_item_config_requests_internet_permission
    it('game_item_config_requests_internet_permission', 0, async () => {
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.permissions.length).assertEqual(1);
      expect(config.permissions[0]).assertEqual('ohos.permission.INTERNET');
    });

    // Scenario: game_item_config_metadata_enables_partial_update
    it('game_item_config_metadata_enables_partial_update', 0, async () => {
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.hasMetadata('ArkTSPartialUpdate')).assertTrue();
      expect(config.hasMetadata('UnknownMetadata')).assertFalse();
    });

    // Scenario: game_item_config_snapshots_are_comparable
    it('game_item_config_snapshots_are_comparable', 0, async () => {
      const first: ConfigSnapshot = ConfigSnapshot.createDefault();
      const second: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(first.equals(second)).assertTrue();
      const changed: ConfigSnapshot = new ConfigSnapshot(BUNDLE_NAME, MODULE_NAME, ABILITY_NAME, API_VERSION,
        'portrait', ['default', 'tablet'], [INTERNET_PERMISSION], ['ArkTSPartialUpdate']);
      expect(first.equals(changed)).assertFalse();
    });

    // Scenario: game_item_report_starts_valid
    it('game_item_report_starts_valid', 0, async () => {
      const report: ValidationReport = new ValidationReport();
      expect(report.isValid()).assertTrue();
      expect(report.getErrorCount()).assertEqual(0);
      expect(report.summary()).assertEqual('valid');
    });

    // Scenario: game_item_report_collects_and_merges_errors
    it('game_item_report_collects_and_merges_errors', 0, async () => {
      const first: ValidationReport = new ValidationReport();
      first.addError('missing trace');
      const second: ValidationReport = new ValidationReport();
      second.addError('unbalanced braces');
      first.merge(second);
      expect(first.getErrorCount()).assertEqual(2);
      expect(first.contains('missing trace')).assertTrue();
      expect(first.summary()).assertEqual('invalid:2');
      first.clear();
      expect(first.isValid()).assertTrue();
    });

    // Scenario: game_item_scenario_9972500_session_start_cycles
    it('game_item_scenario_9972500_session_start_cycles', 0, async () => {
      const caseSeed: number = 9972500;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9972500);
    });

    // Scenario: game_item_scenario_9972501_paddle_step_sequence
    it('game_item_scenario_9972501_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9972501;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9972501);
    });

    // Scenario: game_item_scenario_9972502_catalog_lookup_start
    it('game_item_scenario_9972502_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9972502;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9972502);
    });

    // Scenario: game_item_scenario_9972503_pipeline_round_trip
    it('game_item_scenario_9972503_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9972503;
      const payload: string = '_main.paddle.moveLeft(); // case 9972503';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9972503);
    });

    // Scenario: game_item_scenario_9972504_settings_zoom_true
    it('game_item_scenario_9972504_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9972504;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9972504);
    });

    // Scenario: game_item_scenario_9972505_layout_custom_columns
    it('game_item_scenario_9972505_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9972505;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9972505);
    });

    // Scenario: game_item_scenario_9972506_score_accumulation
    it('game_item_scenario_9972506_score_accumulation', 0, async () => {
      const caseSeed: number = 9972506;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(9972506);
    });

    // Scenario: game_item_scenario_9972507_brick_grid_progress
    it('game_item_scenario_9972507_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9972507;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9972507);
    });

    // Scenario: game_item_scenario_9972508_locale_lookup_en
    it('game_item_scenario_9972508_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9972508;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9972508);
    });

    // Scenario: game_item_scenario_9972509_validation_report_count
    it('game_item_scenario_9972509_validation_report_count', 0, async () => {
      const caseSeed: number = 9972509;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9972509);
    });

    // Scenario: game_item_scenario_9972510_url_with_query
    it('game_item_scenario_9972510_url_with_query', 0, async () => {
      const caseSeed: number = 9972510;
      const url: string = SAMPLE_GAME_URL + '?case=37';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9972510);
    });

    // Scenario: game_item_scenario_9972511_geometry_area
    it('game_item_scenario_9972511_geometry_area', 0, async () => {
      const caseSeed: number = 9972511;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9972511);
    });

    // Scenario: game_item_scenario_9972512_circular_buffer_capacity
    it('game_item_scenario_9972512_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9972512;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9972512);
    });

    // Scenario: game_item_scenario_9972513_command_queue_fifo
    it('game_item_scenario_9972513_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9972513;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9972513);
    });

    // Scenario: game_item_scenario_9972514_token_bucket_consume
    it('game_item_scenario_9972514_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9972514;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9972514);
    });

    // Scenario: game_item_scenario_9972515_page_load_budget
    it('game_item_scenario_9972515_page_load_budget', 0, async () => {
      const caseSeed: number = 9972515;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(515);
      expect(record.getDuration()).assertEqual(515);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9972515);
    });

    // Scenario: game_item_scenario_9972516_perf_sampler_bounds
    it('game_item_scenario_9972516_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9972516;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(9972516);
    });

    // Scenario: game_item_scenario_9972517_config_api_9
    it('game_item_scenario_9972517_config_api_9', 0, async () => {
      const caseSeed: number = 9972517;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9972517);
    });

    // Scenario: game_item_scenario_9972518_retry_attempts
    it('game_item_scenario_9972518_retry_attempts', 0, async () => {
      const caseSeed: number = 9972518;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9972518);
    });

    // Scenario: game_item_scenario_9972519_event_recorder_sequence
    it('game_item_scenario_9972519_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9972519;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9972519);
    });

    // Scenario: game_item_scenario_9972520_session_start_cycles
    it('game_item_scenario_9972520_session_start_cycles', 0, async () => {
      const caseSeed: number = 9972520;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9972520);
    });

    // Scenario: game_item_scenario_9972521_paddle_step_sequence
    it('game_item_scenario_9972521_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9972521;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9972521);
    });

    // Scenario: game_item_scenario_9972522_catalog_lookup_start
    it('game_item_scenario_9972522_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9972522;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9972522);
    });

    // Scenario: game_item_scenario_9972523_pipeline_round_trip
    it('game_item_scenario_9972523_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9972523;
      const payload: string = '_main.paddle.moveLeft(); // case 9972523';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9972523);
    });

    // Scenario: game_item_scenario_9972524_settings_zoom_true
    it('game_item_scenario_9972524_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9972524;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9972524);
    });

    // Scenario: game_item_scenario_9972525_layout_custom_columns
    it('game_item_scenario_9972525_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9972525;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9972525);
    });

    // Scenario: game_item_scenario_9972526_score_accumulation
    it('game_item_scenario_9972526_score_accumulation', 0, async () => {
      const caseSeed: number = 9972526;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(9972526);
    });

    // Scenario: game_item_scenario_9972527_brick_grid_progress
    it('game_item_scenario_9972527_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9972527;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(9972527);
    });

    // Scenario: game_item_scenario_9972528_locale_lookup_en
    it('game_item_scenario_9972528_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9972528;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9972528);
    });

    // Scenario: game_item_scenario_9972529_validation_report_count
    it('game_item_scenario_9972529_validation_report_count', 0, async () => {
      const caseSeed: number = 9972529;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9972529);
    });

    // Scenario: game_item_scenario_9972530_url_with_query
    it('game_item_scenario_9972530_url_with_query', 0, async () => {
      const caseSeed: number = 9972530;
      const url: string = SAMPLE_GAME_URL + '?case=57';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9972530);
    });

    // Scenario: game_item_scenario_9972531_geometry_area
    it('game_item_scenario_9972531_geometry_area', 0, async () => {
      const caseSeed: number = 9972531;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9972531);
    });

    // Scenario: game_item_scenario_9972532_circular_buffer_capacity
    it('game_item_scenario_9972532_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9972532;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9972532);
    });

    // Scenario: game_item_scenario_9972533_command_queue_fifo
    it('game_item_scenario_9972533_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9972533;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9972533);
    });

    // Scenario: game_item_scenario_9972534_token_bucket_consume
    it('game_item_scenario_9972534_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9972534;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9972534);
    });

    // Scenario: game_item_scenario_9972535_page_load_budget
    it('game_item_scenario_9972535_page_load_budget', 0, async () => {
      const caseSeed: number = 9972535;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(535);
      expect(record.getDuration()).assertEqual(535);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9972535);
    });

    // Scenario: game_item_scenario_9972536_perf_sampler_bounds
    it('game_item_scenario_9972536_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9972536;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(9972536);
    });

    // Scenario: game_item_scenario_9972537_config_api_9
    it('game_item_scenario_9972537_config_api_9', 0, async () => {
      const caseSeed: number = 9972537;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9972537);
    });

    // Scenario: game_item_scenario_9972538_retry_attempts
    it('game_item_scenario_9972538_retry_attempts', 0, async () => {
      const caseSeed: number = 9972538;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9972538);
    });

    // Scenario: game_item_scenario_9972539_event_recorder_sequence
    it('game_item_scenario_9972539_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9972539;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9972539);
    });

    // Scenario: game_item_scenario_9972540_session_start_cycles
    it('game_item_scenario_9972540_session_start_cycles', 0, async () => {
      const caseSeed: number = 9972540;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9972540);
    });

    // Scenario: game_item_scenario_9972541_paddle_step_sequence
    it('game_item_scenario_9972541_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9972541;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9972541);
    });

    // Scenario: game_item_scenario_9972542_catalog_lookup_start
    it('game_item_scenario_9972542_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9972542;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9972542);
    });

    // Scenario: game_item_scenario_9972543_pipeline_round_trip
    it('game_item_scenario_9972543_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9972543;
      const payload: string = '_main.paddle.moveLeft(); // case 9972543';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9972543);
    });

    // Scenario: game_item_scenario_9972544_settings_zoom_true
    it('game_item_scenario_9972544_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9972544;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9972544);
    });

    // Scenario: game_item_scenario_9972545_layout_custom_columns
    it('game_item_scenario_9972545_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9972545;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9972545);
    });

    // Scenario: game_item_scenario_9972546_score_accumulation
    it('game_item_scenario_9972546_score_accumulation', 0, async () => {
      const caseSeed: number = 9972546;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(9972546);
    });

    // Scenario: game_item_scenario_9972547_brick_grid_progress
    it('game_item_scenario_9972547_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9972547;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9972547);
    });

    // Scenario: game_item_scenario_9972548_locale_lookup_en
    it('game_item_scenario_9972548_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9972548;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9972548);
    });

    // Scenario: game_item_scenario_9972549_validation_report_count
    it('game_item_scenario_9972549_validation_report_count', 0, async () => {
      const caseSeed: number = 9972549;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9972549);
    });

    // Scenario: game_item_scenario_9972550_url_with_query
    it('game_item_scenario_9972550_url_with_query', 0, async () => {
      const caseSeed: number = 9972550;
      const url: string = SAMPLE_GAME_URL + '?case=77';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9972550);
    });

    // Scenario: game_item_scenario_9972551_geometry_area
    it('game_item_scenario_9972551_geometry_area', 0, async () => {
      const caseSeed: number = 9972551;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9972551);
    });

    // Scenario: game_item_scenario_9972552_circular_buffer_capacity
    it('game_item_scenario_9972552_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9972552;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9972552);
    });

    // Scenario: game_item_scenario_9972553_command_queue_fifo
    it('game_item_scenario_9972553_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9972553;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9972553);
    });

    // Scenario: game_item_scenario_9972554_token_bucket_consume
    it('game_item_scenario_9972554_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9972554;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9972554);
    });

    // Scenario: game_item_scenario_9972555_page_load_budget
    it('game_item_scenario_9972555_page_load_budget', 0, async () => {
      const caseSeed: number = 9972555;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(555);
      expect(record.getDuration()).assertEqual(555);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9972555);
    });

    // Scenario: game_item_scenario_9972556_perf_sampler_bounds
    it('game_item_scenario_9972556_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9972556;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(9972556);
    });

    // Scenario: game_item_scenario_9972557_config_api_9
    it('game_item_scenario_9972557_config_api_9', 0, async () => {
      const caseSeed: number = 9972557;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9972557);
    });

    // Scenario: game_item_scenario_9972558_retry_attempts
    it('game_item_scenario_9972558_retry_attempts', 0, async () => {
      const caseSeed: number = 9972558;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9972558);
    });

    // Scenario: game_item_scenario_9972559_event_recorder_sequence
    it('game_item_scenario_9972559_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9972559;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9972559);
    });

    // Scenario: game_item_scenario_9972560_session_start_cycles
    it('game_item_scenario_9972560_session_start_cycles', 0, async () => {
      const caseSeed: number = 9972560;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9972560);
    });

    // Scenario: game_item_scenario_9972561_paddle_step_sequence
    it('game_item_scenario_9972561_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9972561;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9972561);
    });

    // Scenario: game_item_scenario_9972562_catalog_lookup_start
    it('game_item_scenario_9972562_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9972562;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9972562);
    });

    // Scenario: game_item_scenario_9972563_pipeline_round_trip
    it('game_item_scenario_9972563_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9972563;
      const payload: string = '_main.paddle.moveLeft(); // case 9972563';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9972563);
    });

    // Scenario: game_item_scenario_9972564_settings_zoom_true
    it('game_item_scenario_9972564_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9972564;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9972564);
    });

    // Scenario: game_item_scenario_9972565_layout_custom_columns
    it('game_item_scenario_9972565_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9972565;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9972565);
    });

    // Scenario: game_item_scenario_9972566_score_accumulation
    it('game_item_scenario_9972566_score_accumulation', 0, async () => {
      const caseSeed: number = 9972566;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(9972566);
    });

    // Scenario: game_item_scenario_9972567_brick_grid_progress
    it('game_item_scenario_9972567_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9972567;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9972567);
    });

    // Scenario: game_item_scenario_9972568_locale_lookup_en
    it('game_item_scenario_9972568_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9972568;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9972568);
    });

    // Scenario: game_item_scenario_9972569_validation_report_count
    it('game_item_scenario_9972569_validation_report_count', 0, async () => {
      const caseSeed: number = 9972569;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9972569);
    });

    // Scenario: game_item_scenario_9972570_url_with_query
    it('game_item_scenario_9972570_url_with_query', 0, async () => {
      const caseSeed: number = 9972570;
      const url: string = SAMPLE_GAME_URL + '?case=0';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9972570);
    });

  });
}
