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

export default function statePersistenceTest() {
  describe('StatePersistence_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'state_persistence suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'state_persistence suite end');
    });

    // Scenario: state_persistence_scenario_8669800_session_start_cycles
    it('state_persistence_scenario_8669800_session_start_cycles', 0, async () => {
      const caseSeed: number = 8669800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8669800);
    });

    // Scenario: state_persistence_scenario_8669801_paddle_step_sequence
    it('state_persistence_scenario_8669801_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8669801;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(8669801);
    });

    // Scenario: state_persistence_scenario_8669802_catalog_lookup_start
    it('state_persistence_scenario_8669802_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8669802;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8669802);
    });

    // Scenario: state_persistence_scenario_8669803_pipeline_round_trip
    it('state_persistence_scenario_8669803_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8669803;
      const payload: string = '_main.paddle.moveLeft(); // case 8669803';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8669803);
    });

    // Scenario: state_persistence_scenario_8669804_settings_zoom_true
    it('state_persistence_scenario_8669804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8669804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8669804);
    });

    // Scenario: state_persistence_scenario_8669805_layout_custom_columns
    it('state_persistence_scenario_8669805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8669805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8669805);
    });

    // Scenario: state_persistence_scenario_8669806_score_accumulation
    it('state_persistence_scenario_8669806_score_accumulation', 0, async () => {
      const caseSeed: number = 8669806;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(8669806);
    });

    // Scenario: state_persistence_scenario_8669807_brick_grid_progress
    it('state_persistence_scenario_8669807_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8669807;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(8669807);
    });

    // Scenario: state_persistence_scenario_8669808_locale_lookup_en
    it('state_persistence_scenario_8669808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8669808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8669808);
    });

    // Scenario: state_persistence_scenario_8669809_validation_report_count
    it('state_persistence_scenario_8669809_validation_report_count', 0, async () => {
      const caseSeed: number = 8669809;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8669809);
    });

    // Scenario: state_persistence_scenario_8669810_url_with_query
    it('state_persistence_scenario_8669810_url_with_query', 0, async () => {
      const caseSeed: number = 8669810;
      const url: string = SAMPLE_GAME_URL + '?case=47';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8669810);
    });

    // Scenario: state_persistence_scenario_8669811_geometry_area
    it('state_persistence_scenario_8669811_geometry_area', 0, async () => {
      const caseSeed: number = 8669811;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8669811);
    });

    // Scenario: state_persistence_scenario_8669812_circular_buffer_capacity
    it('state_persistence_scenario_8669812_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8669812;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8669812);
    });

    // Scenario: state_persistence_scenario_8669813_command_queue_fifo
    it('state_persistence_scenario_8669813_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8669813;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8669813);
    });

    // Scenario: state_persistence_scenario_8669814_token_bucket_consume
    it('state_persistence_scenario_8669814_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8669814;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(8669814);
    });

    // Scenario: state_persistence_scenario_8669815_page_load_budget
    it('state_persistence_scenario_8669815_page_load_budget', 0, async () => {
      const caseSeed: number = 8669815;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2815);
      expect(record.getDuration()).assertEqual(2815);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8669815);
    });

    // Scenario: state_persistence_scenario_8669816_perf_sampler_bounds
    it('state_persistence_scenario_8669816_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8669816;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(8669816);
    });

    // Scenario: state_persistence_scenario_8669817_config_api_9
    it('state_persistence_scenario_8669817_config_api_9', 0, async () => {
      const caseSeed: number = 8669817;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8669817);
    });

    // Scenario: state_persistence_scenario_8669818_retry_attempts
    it('state_persistence_scenario_8669818_retry_attempts', 0, async () => {
      const caseSeed: number = 8669818;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8669818);
    });

  });
}
