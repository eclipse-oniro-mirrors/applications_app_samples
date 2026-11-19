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

export default function securityValidationTest() {
  describe('SecurityValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'security_validation suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'security_validation suite end');
    });

    // Scenario: security_validation_scenario_9271100_session_start_cycles
    it('security_validation_scenario_9271100_session_start_cycles', 0, async () => {
      const caseSeed: number = 9271100;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9271100);
    });

    // Scenario: security_validation_scenario_9271101_paddle_step_sequence
    it('security_validation_scenario_9271101_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9271101;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9271101);
    });

    // Scenario: security_validation_scenario_9271102_catalog_lookup_start
    it('security_validation_scenario_9271102_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9271102;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9271102);
    });

    // Scenario: security_validation_scenario_9271103_pipeline_round_trip
    it('security_validation_scenario_9271103_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9271103;
      const payload: string = '_main.paddle.moveLeft(); // case 9271103';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9271103);
    });

    // Scenario: security_validation_scenario_9271104_settings_zoom_true
    it('security_validation_scenario_9271104_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9271104;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9271104);
    });

    // Scenario: security_validation_scenario_9271105_layout_custom_columns
    it('security_validation_scenario_9271105_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9271105;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9271105);
    });

    // Scenario: security_validation_scenario_9271106_score_accumulation
    it('security_validation_scenario_9271106_score_accumulation', 0, async () => {
      const caseSeed: number = 9271106;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(9271106);
    });

    // Scenario: security_validation_scenario_9271107_brick_grid_progress
    it('security_validation_scenario_9271107_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9271107;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9271107);
    });

    // Scenario: security_validation_scenario_9271108_locale_lookup_en
    it('security_validation_scenario_9271108_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9271108;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9271108);
    });

    // Scenario: security_validation_scenario_9271109_validation_report_count
    it('security_validation_scenario_9271109_validation_report_count', 0, async () => {
      const caseSeed: number = 9271109;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9271109);
    });

    // Scenario: security_validation_scenario_9271110_url_with_query
    it('security_validation_scenario_9271110_url_with_query', 0, async () => {
      const caseSeed: number = 9271110;
      const url: string = SAMPLE_GAME_URL + '?case=44';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9271110);
    });

    // Scenario: security_validation_scenario_9271111_geometry_area
    it('security_validation_scenario_9271111_geometry_area', 0, async () => {
      const caseSeed: number = 9271111;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 41);
      expect(box.area()).assertEqual(3321);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9271111);
    });

    // Scenario: security_validation_scenario_9271112_circular_buffer_capacity
    it('security_validation_scenario_9271112_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9271112;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9271112);
    });

    // Scenario: security_validation_scenario_9271113_command_queue_fifo
    it('security_validation_scenario_9271113_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9271113;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9271113);
    });

    // Scenario: security_validation_scenario_9271114_token_bucket_consume
    it('security_validation_scenario_9271114_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9271114;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9271114);
    });

    // Scenario: security_validation_scenario_9271115_page_load_budget
    it('security_validation_scenario_9271115_page_load_budget', 0, async () => {
      const caseSeed: number = 9271115;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1115);
      expect(record.getDuration()).assertEqual(1115);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9271115);
    });

    // Scenario: security_validation_scenario_9271116_perf_sampler_bounds
    it('security_validation_scenario_9271116_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9271116;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(9271116);
    });

    // Scenario: security_validation_scenario_9271117_config_api_9
    it('security_validation_scenario_9271117_config_api_9', 0, async () => {
      const caseSeed: number = 9271117;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9271117);
    });

    // Scenario: security_validation_scenario_9271118_retry_attempts
    it('security_validation_scenario_9271118_retry_attempts', 0, async () => {
      const caseSeed: number = 9271118;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9271118);
    });

    // Scenario: security_validation_scenario_9271119_event_recorder_sequence
    it('security_validation_scenario_9271119_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9271119;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9271119);
    });

    // Scenario: security_validation_scenario_9271120_session_start_cycles
    it('security_validation_scenario_9271120_session_start_cycles', 0, async () => {
      const caseSeed: number = 9271120;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9271120);
    });

    // Scenario: security_validation_scenario_9271121_paddle_step_sequence
    it('security_validation_scenario_9271121_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9271121;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9271121);
    });

  });
}
