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

export default function focusNavigationTest() {
  describe('FocusNavigation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'focus_navigation suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'focus_navigation suite end');
    });

    // Scenario: focus_navigation_scenario_8891600_session_start_cycles
    it('focus_navigation_scenario_8891600_session_start_cycles', 0, async () => {
      const caseSeed: number = 8891600;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8891600);
    });

    // Scenario: focus_navigation_scenario_8891601_paddle_step_sequence
    it('focus_navigation_scenario_8891601_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8891601;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(8891601);
    });

    // Scenario: focus_navigation_scenario_8891602_catalog_lookup_start
    it('focus_navigation_scenario_8891602_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8891602;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8891602);
    });

    // Scenario: focus_navigation_scenario_8891603_pipeline_round_trip
    it('focus_navigation_scenario_8891603_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8891603;
      const payload: string = '_main.paddle.moveLeft(); // case 8891603';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8891603);
    });

    // Scenario: focus_navigation_scenario_8891604_settings_zoom_true
    it('focus_navigation_scenario_8891604_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8891604;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8891604);
    });

    // Scenario: focus_navigation_scenario_8891605_layout_custom_columns
    it('focus_navigation_scenario_8891605_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8891605;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8891605);
    });

    // Scenario: focus_navigation_scenario_8891606_score_accumulation
    it('focus_navigation_scenario_8891606_score_accumulation', 0, async () => {
      const caseSeed: number = 8891606;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(8891606);
    });

    // Scenario: focus_navigation_scenario_8891607_brick_grid_progress
    it('focus_navigation_scenario_8891607_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8891607;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(8891607);
    });

    // Scenario: focus_navigation_scenario_8891608_locale_lookup_en
    it('focus_navigation_scenario_8891608_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8891608;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8891608);
    });

    // Scenario: focus_navigation_scenario_8891609_validation_report_count
    it('focus_navigation_scenario_8891609_validation_report_count', 0, async () => {
      const caseSeed: number = 8891609;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8891609);
    });

    // Scenario: focus_navigation_scenario_8891610_url_with_query
    it('focus_navigation_scenario_8891610_url_with_query', 0, async () => {
      const caseSeed: number = 8891610;
      const url: string = SAMPLE_GAME_URL + '?case=8';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8891610);
    });

    // Scenario: focus_navigation_scenario_8891611_geometry_area
    it('focus_navigation_scenario_8891611_geometry_area', 0, async () => {
      const caseSeed: number = 8891611;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8891611);
    });

    // Scenario: focus_navigation_scenario_8891612_circular_buffer_capacity
    it('focus_navigation_scenario_8891612_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8891612;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8891612);
    });

    // Scenario: focus_navigation_scenario_8891613_command_queue_fifo
    it('focus_navigation_scenario_8891613_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8891613;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8891613);
    });

    // Scenario: focus_navigation_scenario_8891614_token_bucket_consume
    it('focus_navigation_scenario_8891614_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8891614;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(8891614);
    });

    // Scenario: focus_navigation_scenario_8891615_page_load_budget
    it('focus_navigation_scenario_8891615_page_load_budget', 0, async () => {
      const caseSeed: number = 8891615;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8615);
      expect(record.getDuration()).assertEqual(8615);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8891615);
    });

    // Scenario: focus_navigation_scenario_8891616_perf_sampler_bounds
    it('focus_navigation_scenario_8891616_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8891616;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(8891616);
    });

    // Scenario: focus_navigation_scenario_8891617_config_api_9
    it('focus_navigation_scenario_8891617_config_api_9', 0, async () => {
      const caseSeed: number = 8891617;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8891617);
    });

    // Scenario: focus_navigation_scenario_8891618_retry_attempts
    it('focus_navigation_scenario_8891618_retry_attempts', 0, async () => {
      const caseSeed: number = 8891618;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8891618);
    });

    // Scenario: focus_navigation_scenario_8891619_event_recorder_sequence
    it('focus_navigation_scenario_8891619_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8891619;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8891619);
    });

    // Scenario: focus_navigation_scenario_8891620_session_start_cycles
    it('focus_navigation_scenario_8891620_session_start_cycles', 0, async () => {
      const caseSeed: number = 8891620;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8891620);
    });

    // Scenario: focus_navigation_scenario_8891621_paddle_step_sequence
    it('focus_navigation_scenario_8891621_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8891621;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(8891621);
    });

    // Scenario: focus_navigation_scenario_8891622_catalog_lookup_start
    it('focus_navigation_scenario_8891622_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8891622;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8891622);
    });

    // Scenario: focus_navigation_scenario_8891623_pipeline_round_trip
    it('focus_navigation_scenario_8891623_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8891623;
      const payload: string = '_main.paddle.moveLeft(); // case 8891623';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8891623);
    });

    // Scenario: focus_navigation_scenario_8891624_settings_zoom_true
    it('focus_navigation_scenario_8891624_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8891624;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8891624);
    });

    // Scenario: focus_navigation_scenario_8891625_layout_custom_columns
    it('focus_navigation_scenario_8891625_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8891625;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8891625);
    });

    // Scenario: focus_navigation_scenario_8891626_score_accumulation
    it('focus_navigation_scenario_8891626_score_accumulation', 0, async () => {
      const caseSeed: number = 8891626;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(8891626);
    });

    // Scenario: focus_navigation_scenario_8891627_brick_grid_progress
    it('focus_navigation_scenario_8891627_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8891627;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(8891627);
    });

    // Scenario: focus_navigation_scenario_8891628_locale_lookup_en
    it('focus_navigation_scenario_8891628_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8891628;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8891628);
    });

    // Scenario: focus_navigation_scenario_8891629_validation_report_count
    it('focus_navigation_scenario_8891629_validation_report_count', 0, async () => {
      const caseSeed: number = 8891629;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8891629);
    });

    // Scenario: focus_navigation_scenario_8891630_url_with_query
    it('focus_navigation_scenario_8891630_url_with_query', 0, async () => {
      const caseSeed: number = 8891630;
      const url: string = SAMPLE_GAME_URL + '?case=28';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8891630);
    });

    // Scenario: focus_navigation_scenario_8891631_geometry_area
    it('focus_navigation_scenario_8891631_geometry_area', 0, async () => {
      const caseSeed: number = 8891631;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 61);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8891631);
    });

    // Scenario: focus_navigation_scenario_8891632_circular_buffer_capacity
    it('focus_navigation_scenario_8891632_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8891632;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8891632);
    });

    // Scenario: focus_navigation_scenario_8891633_command_queue_fifo
    it('focus_navigation_scenario_8891633_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8891633;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8891633);
    });

    // Scenario: focus_navigation_scenario_8891634_token_bucket_consume
    it('focus_navigation_scenario_8891634_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8891634;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(8891634);
    });

    // Scenario: focus_navigation_scenario_8891635_page_load_budget
    it('focus_navigation_scenario_8891635_page_load_budget', 0, async () => {
      const caseSeed: number = 8891635;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8635);
      expect(record.getDuration()).assertEqual(8635);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8891635);
    });

    // Scenario: focus_navigation_scenario_8891636_perf_sampler_bounds
    it('focus_navigation_scenario_8891636_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8891636;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(8891636);
    });

    // Scenario: focus_navigation_scenario_8891637_config_api_9
    it('focus_navigation_scenario_8891637_config_api_9', 0, async () => {
      const caseSeed: number = 8891637;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8891637);
    });

    // Scenario: focus_navigation_scenario_8891638_retry_attempts
    it('focus_navigation_scenario_8891638_retry_attempts', 0, async () => {
      const caseSeed: number = 8891638;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8891638);
    });

    // Scenario: focus_navigation_scenario_8891639_event_recorder_sequence
    it('focus_navigation_scenario_8891639_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8891639;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8891639);
    });

    // Scenario: focus_navigation_scenario_8891640_session_start_cycles
    it('focus_navigation_scenario_8891640_session_start_cycles', 0, async () => {
      const caseSeed: number = 8891640;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8891640);
    });

    // Scenario: focus_navigation_scenario_8891641_paddle_step_sequence
    it('focus_navigation_scenario_8891641_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8891641;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(8891641);
    });

    // Scenario: focus_navigation_scenario_8891642_catalog_lookup_start
    it('focus_navigation_scenario_8891642_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8891642;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8891642);
    });

    // Scenario: focus_navigation_scenario_8891643_pipeline_round_trip
    it('focus_navigation_scenario_8891643_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8891643;
      const payload: string = '_main.paddle.moveLeft(); // case 8891643';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8891643);
    });

    // Scenario: focus_navigation_scenario_8891644_settings_zoom_true
    it('focus_navigation_scenario_8891644_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8891644;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8891644);
    });

    // Scenario: focus_navigation_scenario_8891645_layout_custom_columns
    it('focus_navigation_scenario_8891645_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8891645;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8891645);
    });

    // Scenario: focus_navigation_scenario_8891646_score_accumulation
    it('focus_navigation_scenario_8891646_score_accumulation', 0, async () => {
      const caseSeed: number = 8891646;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(8891646);
    });

    // Scenario: focus_navigation_scenario_8891647_brick_grid_progress
    it('focus_navigation_scenario_8891647_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8891647;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(8891647);
    });

    // Scenario: focus_navigation_scenario_8891648_locale_lookup_en
    it('focus_navigation_scenario_8891648_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8891648;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8891648);
    });

    // Scenario: focus_navigation_scenario_8891649_validation_report_count
    it('focus_navigation_scenario_8891649_validation_report_count', 0, async () => {
      const caseSeed: number = 8891649;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8891649);
    });

    // Scenario: focus_navigation_scenario_8891650_url_with_query
    it('focus_navigation_scenario_8891650_url_with_query', 0, async () => {
      const caseSeed: number = 8891650;
      const url: string = SAMPLE_GAME_URL + '?case=48';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8891650);
    });

    // Scenario: focus_navigation_scenario_8891651_geometry_area
    it('focus_navigation_scenario_8891651_geometry_area', 0, async () => {
      const caseSeed: number = 8891651;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 21);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8891651);
    });

    // Scenario: focus_navigation_scenario_8891652_circular_buffer_capacity
    it('focus_navigation_scenario_8891652_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8891652;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8891652);
    });

    // Scenario: focus_navigation_scenario_8891653_command_queue_fifo
    it('focus_navigation_scenario_8891653_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8891653;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8891653);
    });

    // Scenario: focus_navigation_scenario_8891654_token_bucket_consume
    it('focus_navigation_scenario_8891654_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8891654;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(8891654);
    });

    // Scenario: focus_navigation_scenario_8891655_page_load_budget
    it('focus_navigation_scenario_8891655_page_load_budget', 0, async () => {
      const caseSeed: number = 8891655;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8655);
      expect(record.getDuration()).assertEqual(8655);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8891655);
    });

    // Scenario: focus_navigation_scenario_8891656_perf_sampler_bounds
    it('focus_navigation_scenario_8891656_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8891656;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(8891656);
    });

    // Scenario: focus_navigation_scenario_8891657_config_api_9
    it('focus_navigation_scenario_8891657_config_api_9', 0, async () => {
      const caseSeed: number = 8891657;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8891657);
    });

    // Scenario: focus_navigation_scenario_8891658_retry_attempts
    it('focus_navigation_scenario_8891658_retry_attempts', 0, async () => {
      const caseSeed: number = 8891658;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8891658);
    });

    // Scenario: focus_navigation_scenario_8891659_event_recorder_sequence
    it('focus_navigation_scenario_8891659_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8891659;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8891659);
    });

    // Scenario: focus_navigation_scenario_8891660_session_start_cycles
    it('focus_navigation_scenario_8891660_session_start_cycles', 0, async () => {
      const caseSeed: number = 8891660;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8891660);
    });

    // Scenario: focus_navigation_scenario_8891661_paddle_step_sequence
    it('focus_navigation_scenario_8891661_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8891661;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(8891661);
    });

    // Scenario: focus_navigation_scenario_8891662_catalog_lookup_start
    it('focus_navigation_scenario_8891662_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8891662;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8891662);
    });

    // Scenario: focus_navigation_scenario_8891663_pipeline_round_trip
    it('focus_navigation_scenario_8891663_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8891663;
      const payload: string = '_main.paddle.moveLeft(); // case 8891663';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8891663);
    });

    // Scenario: focus_navigation_scenario_8891664_settings_zoom_true
    it('focus_navigation_scenario_8891664_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8891664;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8891664);
    });

    // Scenario: focus_navigation_scenario_8891665_layout_custom_columns
    it('focus_navigation_scenario_8891665_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8891665;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8891665);
    });

    // Scenario: focus_navigation_scenario_8891666_score_accumulation
    it('focus_navigation_scenario_8891666_score_accumulation', 0, async () => {
      const caseSeed: number = 8891666;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(8891666);
    });

    // Scenario: focus_navigation_scenario_8891667_brick_grid_progress
    it('focus_navigation_scenario_8891667_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8891667;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(8891667);
    });

    // Scenario: focus_navigation_scenario_8891668_locale_lookup_en
    it('focus_navigation_scenario_8891668_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8891668;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8891668);
    });

    // Scenario: focus_navigation_scenario_8891669_validation_report_count
    it('focus_navigation_scenario_8891669_validation_report_count', 0, async () => {
      const caseSeed: number = 8891669;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8891669);
    });

    // Scenario: focus_navigation_scenario_8891670_url_with_query
    it('focus_navigation_scenario_8891670_url_with_query', 0, async () => {
      const caseSeed: number = 8891670;
      const url: string = SAMPLE_GAME_URL + '?case=68';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8891670);
    });

    // Scenario: focus_navigation_scenario_8891671_geometry_area
    it('focus_navigation_scenario_8891671_geometry_area', 0, async () => {
      const caseSeed: number = 8891671;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 41);
      expect(box.area()).assertEqual(3321);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8891671);
    });

    // Scenario: focus_navigation_scenario_8891672_circular_buffer_capacity
    it('focus_navigation_scenario_8891672_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8891672;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8891672);
    });

    // Scenario: focus_navigation_scenario_8891673_command_queue_fifo
    it('focus_navigation_scenario_8891673_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8891673;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8891673);
    });

    // Scenario: focus_navigation_scenario_8891674_token_bucket_consume
    it('focus_navigation_scenario_8891674_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8891674;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(8891674);
    });

    // Scenario: focus_navigation_scenario_8891675_page_load_budget
    it('focus_navigation_scenario_8891675_page_load_budget', 0, async () => {
      const caseSeed: number = 8891675;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8675);
      expect(record.getDuration()).assertEqual(8675);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8891675);
    });

    // Scenario: focus_navigation_scenario_8891676_perf_sampler_bounds
    it('focus_navigation_scenario_8891676_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8891676;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(8891676);
    });

    // Scenario: focus_navigation_scenario_8891677_config_api_9
    it('focus_navigation_scenario_8891677_config_api_9', 0, async () => {
      const caseSeed: number = 8891677;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8891677);
    });

    // Scenario: focus_navigation_scenario_8891678_retry_attempts
    it('focus_navigation_scenario_8891678_retry_attempts', 0, async () => {
      const caseSeed: number = 8891678;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8891678);
    });

    // Scenario: focus_navigation_scenario_8891679_event_recorder_sequence
    it('focus_navigation_scenario_8891679_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8891679;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8891679);
    });

    // Scenario: focus_navigation_scenario_8891680_session_start_cycles
    it('focus_navigation_scenario_8891680_session_start_cycles', 0, async () => {
      const caseSeed: number = 8891680;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8891680);
    });

    // Scenario: focus_navigation_scenario_8891681_paddle_step_sequence
    it('focus_navigation_scenario_8891681_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8891681;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(8891681);
    });

    // Scenario: focus_navigation_scenario_8891682_catalog_lookup_start
    it('focus_navigation_scenario_8891682_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8891682;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8891682);
    });

    // Scenario: focus_navigation_scenario_8891683_pipeline_round_trip
    it('focus_navigation_scenario_8891683_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8891683;
      const payload: string = '_main.paddle.moveLeft(); // case 8891683';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8891683);
    });

    // Scenario: focus_navigation_scenario_8891684_settings_zoom_true
    it('focus_navigation_scenario_8891684_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8891684;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8891684);
    });

    // Scenario: focus_navigation_scenario_8891685_layout_custom_columns
    it('focus_navigation_scenario_8891685_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8891685;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8891685);
    });

    // Scenario: focus_navigation_scenario_8891686_score_accumulation
    it('focus_navigation_scenario_8891686_score_accumulation', 0, async () => {
      const caseSeed: number = 8891686;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(8891686);
    });

    // Scenario: focus_navigation_scenario_8891687_brick_grid_progress
    it('focus_navigation_scenario_8891687_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8891687;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(8891687);
    });

    // Scenario: focus_navigation_scenario_8891688_locale_lookup_en
    it('focus_navigation_scenario_8891688_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8891688;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8891688);
    });

    // Scenario: focus_navigation_scenario_8891689_validation_report_count
    it('focus_navigation_scenario_8891689_validation_report_count', 0, async () => {
      const caseSeed: number = 8891689;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8891689);
    });

    // Scenario: focus_navigation_scenario_8891690_url_with_query
    it('focus_navigation_scenario_8891690_url_with_query', 0, async () => {
      const caseSeed: number = 8891690;
      const url: string = SAMPLE_GAME_URL + '?case=88';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8891690);
    });

    // Scenario: focus_navigation_scenario_8891691_geometry_area
    it('focus_navigation_scenario_8891691_geometry_area', 0, async () => {
      const caseSeed: number = 8891691;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 61);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8891691);
    });

    // Scenario: focus_navigation_scenario_8891692_circular_buffer_capacity
    it('focus_navigation_scenario_8891692_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8891692;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8891692);
    });

  });
}
