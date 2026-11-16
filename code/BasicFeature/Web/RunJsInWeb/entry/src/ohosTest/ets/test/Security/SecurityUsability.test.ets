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

export default function securityUsabilityTest() {
  describe('SecurityUsability_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'security_usability suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'security_usability suite end');
    });

    // Scenario: security_usability_scenario_2449800_session_start_cycles
    it('security_usability_scenario_2449800_session_start_cycles', 0, async () => {
      const caseSeed: number = 2449800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2449800);
    });

    // Scenario: security_usability_scenario_2449801_paddle_step_sequence
    it('security_usability_scenario_2449801_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2449801;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(2449801);
    });

    // Scenario: security_usability_scenario_2449802_catalog_lookup_start
    it('security_usability_scenario_2449802_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2449802;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2449802);
    });

    // Scenario: security_usability_scenario_2449803_pipeline_round_trip
    it('security_usability_scenario_2449803_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2449803;
      const payload: string = '_main.paddle.moveLeft(); // case 2449803';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2449803);
    });

    // Scenario: security_usability_scenario_2449804_settings_zoom_true
    it('security_usability_scenario_2449804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2449804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2449804);
    });

    // Scenario: security_usability_scenario_2449805_layout_custom_columns
    it('security_usability_scenario_2449805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2449805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2449805);
    });

    // Scenario: security_usability_scenario_2449806_score_accumulation
    it('security_usability_scenario_2449806_score_accumulation', 0, async () => {
      const caseSeed: number = 2449806;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(2449806);
    });

    // Scenario: security_usability_scenario_2449807_brick_grid_progress
    it('security_usability_scenario_2449807_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2449807;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(2449807);
    });

    // Scenario: security_usability_scenario_2449808_locale_lookup_en
    it('security_usability_scenario_2449808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2449808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2449808);
    });

    // Scenario: security_usability_scenario_2449809_validation_report_count
    it('security_usability_scenario_2449809_validation_report_count', 0, async () => {
      const caseSeed: number = 2449809;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2449809);
    });

    // Scenario: security_usability_scenario_2449810_url_with_query
    it('security_usability_scenario_2449810_url_with_query', 0, async () => {
      const caseSeed: number = 2449810;
      const url: string = SAMPLE_GAME_URL + '?case=75';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2449810);
    });

    // Scenario: security_usability_scenario_2449811_geometry_area
    it('security_usability_scenario_2449811_geometry_area', 0, async () => {
      const caseSeed: number = 2449811;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 21);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2449811);
    });

    // Scenario: security_usability_scenario_2449812_circular_buffer_capacity
    it('security_usability_scenario_2449812_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2449812;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2449812);
    });

    // Scenario: security_usability_scenario_2449813_command_queue_fifo
    it('security_usability_scenario_2449813_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2449813;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2449813);
    });

    // Scenario: security_usability_scenario_2449814_token_bucket_consume
    it('security_usability_scenario_2449814_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2449814;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(2449814);
    });

    // Scenario: security_usability_scenario_2449815_page_load_budget
    it('security_usability_scenario_2449815_page_load_budget', 0, async () => {
      const caseSeed: number = 2449815;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1815);
      expect(record.getDuration()).assertEqual(1815);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2449815);
    });

    // Scenario: security_usability_scenario_2449816_perf_sampler_bounds
    it('security_usability_scenario_2449816_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2449816;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(2449816);
    });

    // Scenario: security_usability_scenario_2449817_config_api_9
    it('security_usability_scenario_2449817_config_api_9', 0, async () => {
      const caseSeed: number = 2449817;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2449817);
    });

    // Scenario: security_usability_scenario_2449818_retry_attempts
    it('security_usability_scenario_2449818_retry_attempts', 0, async () => {
      const caseSeed: number = 2449818;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2449818);
    });

    // Scenario: security_usability_scenario_2449819_event_recorder_sequence
    it('security_usability_scenario_2449819_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2449819;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2449819);
    });

    // Scenario: security_usability_scenario_2449820_session_start_cycles
    it('security_usability_scenario_2449820_session_start_cycles', 0, async () => {
      const caseSeed: number = 2449820;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2449820);
    });

    // Scenario: security_usability_scenario_2449821_paddle_step_sequence
    it('security_usability_scenario_2449821_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2449821;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(2449821);
    });

    // Scenario: security_usability_scenario_2449822_catalog_lookup_start
    it('security_usability_scenario_2449822_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2449822;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2449822);
    });

    // Scenario: security_usability_scenario_2449823_pipeline_round_trip
    it('security_usability_scenario_2449823_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2449823;
      const payload: string = '_main.paddle.moveLeft(); // case 2449823';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2449823);
    });

    // Scenario: security_usability_scenario_2449824_settings_zoom_true
    it('security_usability_scenario_2449824_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2449824;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2449824);
    });

    // Scenario: security_usability_scenario_2449825_layout_custom_columns
    it('security_usability_scenario_2449825_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2449825;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2449825);
    });

  });
}
