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
  DELAY_AFTER_INJECT,
  DELAY_PAGE_SETTLE,
  LABEL_START,
  LABEL_LEFT,
  LABEL_RIGHT,
  LABEL_RESET,
  getDriver,
  serializedDelay,
  isGamePageVisible,
  triggerGamePage,
  pressAndWait,
  clickButtonByLabel,
  hasAllControls,
  measureLatency
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

export default function gameControlFlowTest() {
  describe('GameControlFlow_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_flow suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_flow suite end');
    });

    // Scenario: game_flow_command_queue_is_fifo
    it('game_flow_command_queue_is_fifo', 0, async () => {
      const queue: CommandQueue = new CommandQueue();
      queue.enqueue('start');
      queue.enqueue('left');
      expect(queue.peek()).assertEqual('start');
      expect(queue.size()).assertEqual(2);
      expect(queue.dequeue()).assertEqual('start');
      expect(queue.dequeue()).assertEqual('left');
      expect(queue.isEmpty()).assertTrue();
      expect(queue.executedCommands().length).assertEqual(2);
    });

    // Scenario: game_flow_empty_command_queue_returns_empty
    it('game_flow_empty_command_queue_returns_empty', 0, async () => {
      const queue: CommandQueue = new CommandQueue();
      expect(queue.dequeue()).assertEqual('');
      expect(queue.peek()).assertEqual('');
      expect(queue.isEmpty()).assertTrue();
      queue.enqueue('reset');
      queue.clear();
      expect(queue.size()).assertEqual(0);
    });

    // Scenario: game_flow_start_button_triggers_injection
    it('game_flow_start_button_triggers_injection', 0, async () => {
      const clicked: boolean = await clickButtonByLabel(driver, LABEL_START);
      expect(clicked).assertTrue();
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // Scenario: game_flow_reset_button_triggers_injection
    it('game_flow_reset_button_triggers_injection', 0, async () => {
      expect(await clickButtonByLabel(driver, LABEL_RESET)).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_INJECT);
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // Scenario: game_flow_left_button_triggers_injection
    it('game_flow_left_button_triggers_injection', 0, async () => {
      expect(await clickButtonByLabel(driver, LABEL_LEFT)).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_INJECT);
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // Scenario: game_flow_right_button_triggers_injection
    it('game_flow_right_button_triggers_injection', 0, async () => {
      expect(await clickButtonByLabel(driver, LABEL_RIGHT)).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_INJECT);
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // Scenario: game_flow_single_injection_latency_is_within_budget
    it('game_flow_single_injection_latency_is_within_budget', 0, async () => {
      const latency: number = await measureLatency(async () => {
        await clickButtonByLabel(driver, LABEL_START);
      });
      expect(latency).assertLessOrEqual(3000);
      expect(latency).assertLargerOrEqual(0);
    });

    // Scenario: game_flow_repeated_injections_do_not_break_page
    it('game_flow_repeated_injections_do_not_break_page', 0, async () => {
      for (let i = 0; i < 5; i++) {
        await clickButtonByLabel(driver, LABEL_START);
        await clickButtonByLabel(driver, LABEL_RESET);
      }
      expect(await isGamePageVisible(driver)).assertTrue();
      expect(await hasAllControls(driver)).assertTrue();
    });

    // Scenario: game_flow_scenario_8354200_session_start_cycles
    it('game_flow_scenario_8354200_session_start_cycles', 0, async () => {
      const caseSeed: number = 8354200;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8354200);
    });

    // Scenario: game_flow_scenario_8354201_paddle_step_sequence
    it('game_flow_scenario_8354201_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8354201;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(8354201);
    });

    // Scenario: game_flow_scenario_8354202_catalog_lookup_start
    it('game_flow_scenario_8354202_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8354202;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8354202);
    });

    // Scenario: game_flow_scenario_8354203_pipeline_round_trip
    it('game_flow_scenario_8354203_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8354203;
      const payload: string = '_main.paddle.moveLeft(); // case 8354203';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8354203);
    });

    // Scenario: game_flow_scenario_8354204_settings_zoom_true
    it('game_flow_scenario_8354204_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8354204;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8354204);
    });

    // Scenario: game_flow_scenario_8354205_layout_custom_columns
    it('game_flow_scenario_8354205_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8354205;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8354205);
    });

    // Scenario: game_flow_scenario_8354206_score_accumulation
    it('game_flow_scenario_8354206_score_accumulation', 0, async () => {
      const caseSeed: number = 8354206;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(8354206);
    });

    // Scenario: game_flow_scenario_8354207_brick_grid_progress
    it('game_flow_scenario_8354207_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8354207;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(8354207);
    });

    // Scenario: game_flow_scenario_8354208_locale_lookup_en
    it('game_flow_scenario_8354208_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8354208;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8354208);
    });

    // Scenario: game_flow_scenario_8354209_validation_report_count
    it('game_flow_scenario_8354209_validation_report_count', 0, async () => {
      const caseSeed: number = 8354209;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8354209);
    });

    // Scenario: game_flow_scenario_8354210_url_with_query
    it('game_flow_scenario_8354210_url_with_query', 0, async () => {
      const caseSeed: number = 8354210;
      const url: string = SAMPLE_GAME_URL + '?case=85';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8354210);
    });

    // Scenario: game_flow_scenario_8354211_geometry_area
    it('game_flow_scenario_8354211_geometry_area', 0, async () => {
      const caseSeed: number = 8354211;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8354211);
    });

    // Scenario: game_flow_scenario_8354212_circular_buffer_capacity
    it('game_flow_scenario_8354212_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8354212;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8354212);
    });

    // Scenario: game_flow_scenario_8354213_command_queue_fifo
    it('game_flow_scenario_8354213_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8354213;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8354213);
    });

    // Scenario: game_flow_scenario_8354214_token_bucket_consume
    it('game_flow_scenario_8354214_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8354214;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(8354214);
    });

    // Scenario: game_flow_scenario_8354215_page_load_budget
    it('game_flow_scenario_8354215_page_load_budget', 0, async () => {
      const caseSeed: number = 8354215;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2215);
      expect(record.getDuration()).assertEqual(2215);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8354215);
    });

    // Scenario: game_flow_scenario_8354216_perf_sampler_bounds
    it('game_flow_scenario_8354216_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8354216;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(8354216);
    });

    // Scenario: game_flow_scenario_8354217_config_api_9
    it('game_flow_scenario_8354217_config_api_9', 0, async () => {
      const caseSeed: number = 8354217;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8354217);
    });

    // Scenario: game_flow_scenario_8354218_retry_attempts
    it('game_flow_scenario_8354218_retry_attempts', 0, async () => {
      const caseSeed: number = 8354218;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8354218);
    });

    // Scenario: game_flow_scenario_8354219_event_recorder_sequence
    it('game_flow_scenario_8354219_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8354219;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8354219);
    });

    // Scenario: game_flow_scenario_8354220_session_start_cycles
    it('game_flow_scenario_8354220_session_start_cycles', 0, async () => {
      const caseSeed: number = 8354220;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8354220);
    });

    // Scenario: game_flow_scenario_8354221_paddle_step_sequence
    it('game_flow_scenario_8354221_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8354221;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(8354221);
    });

    // Scenario: game_flow_scenario_8354222_catalog_lookup_start
    it('game_flow_scenario_8354222_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8354222;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8354222);
    });

    // Scenario: game_flow_scenario_8354223_pipeline_round_trip
    it('game_flow_scenario_8354223_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8354223;
      const payload: string = '_main.paddle.moveLeft(); // case 8354223';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8354223);
    });

    // Scenario: game_flow_scenario_8354224_settings_zoom_true
    it('game_flow_scenario_8354224_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8354224;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8354224);
    });

    // Scenario: game_flow_scenario_8354225_layout_custom_columns
    it('game_flow_scenario_8354225_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8354225;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8354225);
    });

    // Scenario: game_flow_scenario_8354226_score_accumulation
    it('game_flow_scenario_8354226_score_accumulation', 0, async () => {
      const caseSeed: number = 8354226;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(8354226);
    });

    // Scenario: game_flow_scenario_8354227_brick_grid_progress
    it('game_flow_scenario_8354227_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8354227;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(8354227);
    });

    // Scenario: game_flow_scenario_8354228_locale_lookup_en
    it('game_flow_scenario_8354228_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8354228;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8354228);
    });

    // Scenario: game_flow_scenario_8354229_validation_report_count
    it('game_flow_scenario_8354229_validation_report_count', 0, async () => {
      const caseSeed: number = 8354229;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8354229);
    });

    // Scenario: game_flow_scenario_8354230_url_with_query
    it('game_flow_scenario_8354230_url_with_query', 0, async () => {
      const caseSeed: number = 8354230;
      const url: string = SAMPLE_GAME_URL + '?case=8';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8354230);
    });

    // Scenario: game_flow_scenario_8354231_geometry_area
    it('game_flow_scenario_8354231_geometry_area', 0, async () => {
      const caseSeed: number = 8354231;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8354231);
    });

    // Scenario: game_flow_scenario_8354232_circular_buffer_capacity
    it('game_flow_scenario_8354232_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8354232;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8354232);
    });

    // Scenario: game_flow_scenario_8354233_command_queue_fifo
    it('game_flow_scenario_8354233_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8354233;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8354233);
    });

    // Scenario: game_flow_scenario_8354234_token_bucket_consume
    it('game_flow_scenario_8354234_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8354234;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(8354234);
    });

    // Scenario: game_flow_scenario_8354235_page_load_budget
    it('game_flow_scenario_8354235_page_load_budget', 0, async () => {
      const caseSeed: number = 8354235;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2235);
      expect(record.getDuration()).assertEqual(2235);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8354235);
    });

    // Scenario: game_flow_scenario_8354236_perf_sampler_bounds
    it('game_flow_scenario_8354236_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8354236;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(8354236);
    });

    // Scenario: game_flow_scenario_8354237_config_api_9
    it('game_flow_scenario_8354237_config_api_9', 0, async () => {
      const caseSeed: number = 8354237;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8354237);
    });

    // Scenario: game_flow_scenario_8354238_retry_attempts
    it('game_flow_scenario_8354238_retry_attempts', 0, async () => {
      const caseSeed: number = 8354238;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8354238);
    });

    // Scenario: game_flow_scenario_8354239_event_recorder_sequence
    it('game_flow_scenario_8354239_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8354239;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8354239);
    });

    // Scenario: game_flow_scenario_8354240_session_start_cycles
    it('game_flow_scenario_8354240_session_start_cycles', 0, async () => {
      const caseSeed: number = 8354240;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8354240);
    });

    // Scenario: game_flow_scenario_8354241_paddle_step_sequence
    it('game_flow_scenario_8354241_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8354241;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(8354241);
    });

    // Scenario: game_flow_scenario_8354242_catalog_lookup_start
    it('game_flow_scenario_8354242_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8354242;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8354242);
    });

    // Scenario: game_flow_scenario_8354243_pipeline_round_trip
    it('game_flow_scenario_8354243_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8354243;
      const payload: string = '_main.paddle.moveLeft(); // case 8354243';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8354243);
    });

    // Scenario: game_flow_scenario_8354244_settings_zoom_true
    it('game_flow_scenario_8354244_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8354244;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8354244);
    });

    // Scenario: game_flow_scenario_8354245_layout_custom_columns
    it('game_flow_scenario_8354245_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8354245;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8354245);
    });

    // Scenario: game_flow_scenario_8354246_score_accumulation
    it('game_flow_scenario_8354246_score_accumulation', 0, async () => {
      const caseSeed: number = 8354246;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(8354246);
    });

    // Scenario: game_flow_scenario_8354247_brick_grid_progress
    it('game_flow_scenario_8354247_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8354247;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(8354247);
    });

    // Scenario: game_flow_scenario_8354248_locale_lookup_en
    it('game_flow_scenario_8354248_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8354248;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8354248);
    });

    // Scenario: game_flow_scenario_8354249_validation_report_count
    it('game_flow_scenario_8354249_validation_report_count', 0, async () => {
      const caseSeed: number = 8354249;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8354249);
    });

    // Scenario: game_flow_scenario_8354250_url_with_query
    it('game_flow_scenario_8354250_url_with_query', 0, async () => {
      const caseSeed: number = 8354250;
      const url: string = SAMPLE_GAME_URL + '?case=28';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8354250);
    });

    // Scenario: game_flow_scenario_8354251_geometry_area
    it('game_flow_scenario_8354251_geometry_area', 0, async () => {
      const caseSeed: number = 8354251;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8354251);
    });

    // Scenario: game_flow_scenario_8354252_circular_buffer_capacity
    it('game_flow_scenario_8354252_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8354252;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8354252);
    });

    // Scenario: game_flow_scenario_8354253_command_queue_fifo
    it('game_flow_scenario_8354253_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8354253;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8354253);
    });

    // Scenario: game_flow_scenario_8354254_token_bucket_consume
    it('game_flow_scenario_8354254_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8354254;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(8354254);
    });

    // Scenario: game_flow_scenario_8354255_page_load_budget
    it('game_flow_scenario_8354255_page_load_budget', 0, async () => {
      const caseSeed: number = 8354255;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2255);
      expect(record.getDuration()).assertEqual(2255);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8354255);
    });

    // Scenario: game_flow_scenario_8354256_perf_sampler_bounds
    it('game_flow_scenario_8354256_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8354256;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(8354256);
    });

    // Scenario: game_flow_scenario_8354257_config_api_9
    it('game_flow_scenario_8354257_config_api_9', 0, async () => {
      const caseSeed: number = 8354257;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8354257);
    });

    // Scenario: game_flow_scenario_8354258_retry_attempts
    it('game_flow_scenario_8354258_retry_attempts', 0, async () => {
      const caseSeed: number = 8354258;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8354258);
    });

    // Scenario: game_flow_scenario_8354259_event_recorder_sequence
    it('game_flow_scenario_8354259_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8354259;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8354259);
    });

    // Scenario: game_flow_scenario_8354260_session_start_cycles
    it('game_flow_scenario_8354260_session_start_cycles', 0, async () => {
      const caseSeed: number = 8354260;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8354260);
    });

    // Scenario: game_flow_scenario_8354261_paddle_step_sequence
    it('game_flow_scenario_8354261_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8354261;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(8354261);
    });

    // Scenario: game_flow_scenario_8354262_catalog_lookup_start
    it('game_flow_scenario_8354262_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8354262;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8354262);
    });

    // Scenario: game_flow_scenario_8354263_pipeline_round_trip
    it('game_flow_scenario_8354263_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8354263;
      const payload: string = '_main.paddle.moveLeft(); // case 8354263';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8354263);
    });

    // Scenario: game_flow_scenario_8354264_settings_zoom_true
    it('game_flow_scenario_8354264_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8354264;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8354264);
    });

    // Scenario: game_flow_scenario_8354265_layout_custom_columns
    it('game_flow_scenario_8354265_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8354265;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8354265);
    });

    // Scenario: game_flow_scenario_8354266_score_accumulation
    it('game_flow_scenario_8354266_score_accumulation', 0, async () => {
      const caseSeed: number = 8354266;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(8354266);
    });

    // Scenario: game_flow_scenario_8354267_brick_grid_progress
    it('game_flow_scenario_8354267_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8354267;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(8354267);
    });

    // Scenario: game_flow_scenario_8354268_locale_lookup_en
    it('game_flow_scenario_8354268_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8354268;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8354268);
    });

    // Scenario: game_flow_scenario_8354269_validation_report_count
    it('game_flow_scenario_8354269_validation_report_count', 0, async () => {
      const caseSeed: number = 8354269;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8354269);
    });

  });
}
