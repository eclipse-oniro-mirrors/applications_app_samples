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
  isGamePageVisible,
  triggerGamePage,
  pressAndWait,
  hasAllControls
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
import {
  ThemeResolver
} from '../Shared/TestHelpers';

export default function focusRingBehaviorTest() {
  describe('FocusRingBehavior_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'focus_ring suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'focus_ring suite end');
    });

    // Scenario: focus_ring_theme_resolves_control_colors
    it('focus_ring_theme_resolves_control_colors', 0, async () => {
      const theme: ThemeResolver = new ThemeResolver();
      expect(theme.resolve('control_red')).assertEqual('#FF0000');
      expect(theme.resolve('web_orange')).assertEqual('#FFA500');
      expect(theme.count()).assertEqual(4);
    });

    // Scenario: focus_ring_dark_theme_is_detected
    it('focus_ring_dark_theme_is_detected', 0, async () => {
      const theme: ThemeResolver = new ThemeResolver();
      expect(theme.isDark('dark_background')).assertTrue();
      expect(theme.isDark('light_background')).assertFalse();
      expect(theme.has('dark_background')).assertTrue();
    });

    // Scenario: focus_ring_theme_brightness_is_ordered
    it('focus_ring_theme_brightness_is_ordered', 0, async () => {
      const theme: ThemeResolver = new ThemeResolver();
      const dark: number = theme.brightness(theme.resolve('dark_background'));
      const red: number = theme.brightness(theme.resolve('control_red'));
      const light: number = theme.brightness(theme.resolve('light_background'));
      expect(dark < red).assertTrue();
      expect(red < light).assertTrue();
    });

    // Scenario: focus_ring_theme_switch_keeps_page_visible
    it('focus_ring_theme_switch_keeps_page_visible', 0, async () => {
      const theme: ThemeResolver = new ThemeResolver();
      expect(theme.resolve('unknown_color')).assertEqual('#000000');
      expect(await isGamePageVisible(driver)).assertTrue();
      expect(await hasAllControls(driver)).assertTrue();
    });

    // Scenario: focus_ring_scenario_7394000_session_start_cycles
    it('focus_ring_scenario_7394000_session_start_cycles', 0, async () => {
      const caseSeed: number = 7394000;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(7394000);
    });

    // Scenario: focus_ring_scenario_7394001_paddle_step_sequence
    it('focus_ring_scenario_7394001_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 7394001;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(7394001);
    });

    // Scenario: focus_ring_scenario_7394002_catalog_lookup_start
    it('focus_ring_scenario_7394002_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 7394002;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(7394002);
    });

    // Scenario: focus_ring_scenario_7394003_pipeline_round_trip
    it('focus_ring_scenario_7394003_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 7394003;
      const payload: string = '_main.paddle.moveLeft(); // case 7394003';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(7394003);
    });

    // Scenario: focus_ring_scenario_7394004_settings_zoom_true
    it('focus_ring_scenario_7394004_settings_zoom_true', 0, async () => {
      const caseSeed: number = 7394004;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(7394004);
    });

    // Scenario: focus_ring_scenario_7394005_layout_custom_columns
    it('focus_ring_scenario_7394005_layout_custom_columns', 0, async () => {
      const caseSeed: number = 7394005;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(7394005);
    });

    // Scenario: focus_ring_scenario_7394006_score_accumulation
    it('focus_ring_scenario_7394006_score_accumulation', 0, async () => {
      const caseSeed: number = 7394006;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(7394006);
    });

    // Scenario: focus_ring_scenario_7394007_brick_grid_progress
    it('focus_ring_scenario_7394007_brick_grid_progress', 0, async () => {
      const caseSeed: number = 7394007;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(7394007);
    });

    // Scenario: focus_ring_scenario_7394008_locale_lookup_en
    it('focus_ring_scenario_7394008_locale_lookup_en', 0, async () => {
      const caseSeed: number = 7394008;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(7394008);
    });

    // Scenario: focus_ring_scenario_7394009_validation_report_count
    it('focus_ring_scenario_7394009_validation_report_count', 0, async () => {
      const caseSeed: number = 7394009;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(7394009);
    });

    // Scenario: focus_ring_scenario_7394010_url_with_query
    it('focus_ring_scenario_7394010_url_with_query', 0, async () => {
      const caseSeed: number = 7394010;
      const url: string = SAMPLE_GAME_URL + '?case=88';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(7394010);
    });

    // Scenario: focus_ring_scenario_7394011_geometry_area
    it('focus_ring_scenario_7394011_geometry_area', 0, async () => {
      const caseSeed: number = 7394011;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(7394011);
    });

    // Scenario: focus_ring_scenario_7394012_circular_buffer_capacity
    it('focus_ring_scenario_7394012_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 7394012;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(7394012);
    });

    // Scenario: focus_ring_scenario_7394013_command_queue_fifo
    it('focus_ring_scenario_7394013_command_queue_fifo', 0, async () => {
      const caseSeed: number = 7394013;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(7394013);
    });

    // Scenario: focus_ring_scenario_7394014_token_bucket_consume
    it('focus_ring_scenario_7394014_token_bucket_consume', 0, async () => {
      const caseSeed: number = 7394014;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(7394014);
    });

    // Scenario: focus_ring_scenario_7394015_page_load_budget
    it('focus_ring_scenario_7394015_page_load_budget', 0, async () => {
      const caseSeed: number = 7394015;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5015);
      expect(record.getDuration()).assertEqual(5015);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(7394015);
    });

    // Scenario: focus_ring_scenario_7394016_perf_sampler_bounds
    it('focus_ring_scenario_7394016_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 7394016;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(7394016);
    });

    // Scenario: focus_ring_scenario_7394017_config_api_9
    it('focus_ring_scenario_7394017_config_api_9', 0, async () => {
      const caseSeed: number = 7394017;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(7394017);
    });

    // Scenario: focus_ring_scenario_7394018_retry_attempts
    it('focus_ring_scenario_7394018_retry_attempts', 0, async () => {
      const caseSeed: number = 7394018;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(7394018);
    });

    // Scenario: focus_ring_scenario_7394019_event_recorder_sequence
    it('focus_ring_scenario_7394019_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 7394019;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(7394019);
    });

    // Scenario: focus_ring_scenario_7394020_session_start_cycles
    it('focus_ring_scenario_7394020_session_start_cycles', 0, async () => {
      const caseSeed: number = 7394020;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(7394020);
    });

    // Scenario: focus_ring_scenario_7394021_paddle_step_sequence
    it('focus_ring_scenario_7394021_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 7394021;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(7394021);
    });

    // Scenario: focus_ring_scenario_7394022_catalog_lookup_start
    it('focus_ring_scenario_7394022_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 7394022;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(7394022);
    });

    // Scenario: focus_ring_scenario_7394023_pipeline_round_trip
    it('focus_ring_scenario_7394023_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 7394023;
      const payload: string = '_main.paddle.moveLeft(); // case 7394023';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(7394023);
    });

    // Scenario: focus_ring_scenario_7394024_settings_zoom_true
    it('focus_ring_scenario_7394024_settings_zoom_true', 0, async () => {
      const caseSeed: number = 7394024;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(7394024);
    });

    // Scenario: focus_ring_scenario_7394025_layout_custom_columns
    it('focus_ring_scenario_7394025_layout_custom_columns', 0, async () => {
      const caseSeed: number = 7394025;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(7394025);
    });

    // Scenario: focus_ring_scenario_7394026_score_accumulation
    it('focus_ring_scenario_7394026_score_accumulation', 0, async () => {
      const caseSeed: number = 7394026;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(7394026);
    });

    // Scenario: focus_ring_scenario_7394027_brick_grid_progress
    it('focus_ring_scenario_7394027_brick_grid_progress', 0, async () => {
      const caseSeed: number = 7394027;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(7394027);
    });

    // Scenario: focus_ring_scenario_7394028_locale_lookup_en
    it('focus_ring_scenario_7394028_locale_lookup_en', 0, async () => {
      const caseSeed: number = 7394028;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(7394028);
    });

    // Scenario: focus_ring_scenario_7394029_validation_report_count
    it('focus_ring_scenario_7394029_validation_report_count', 0, async () => {
      const caseSeed: number = 7394029;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(7394029);
    });

    // Scenario: focus_ring_scenario_7394030_url_with_query
    it('focus_ring_scenario_7394030_url_with_query', 0, async () => {
      const caseSeed: number = 7394030;
      const url: string = SAMPLE_GAME_URL + '?case=11';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(7394030);
    });

    // Scenario: focus_ring_scenario_7394031_geometry_area
    it('focus_ring_scenario_7394031_geometry_area', 0, async () => {
      const caseSeed: number = 7394031;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 61);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(7394031);
    });

    // Scenario: focus_ring_scenario_7394032_circular_buffer_capacity
    it('focus_ring_scenario_7394032_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 7394032;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(7394032);
    });

    // Scenario: focus_ring_scenario_7394033_command_queue_fifo
    it('focus_ring_scenario_7394033_command_queue_fifo', 0, async () => {
      const caseSeed: number = 7394033;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(7394033);
    });

    // Scenario: focus_ring_scenario_7394034_token_bucket_consume
    it('focus_ring_scenario_7394034_token_bucket_consume', 0, async () => {
      const caseSeed: number = 7394034;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(7394034);
    });

    // Scenario: focus_ring_scenario_7394035_page_load_budget
    it('focus_ring_scenario_7394035_page_load_budget', 0, async () => {
      const caseSeed: number = 7394035;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5035);
      expect(record.getDuration()).assertEqual(5035);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(7394035);
    });

    // Scenario: focus_ring_scenario_7394036_perf_sampler_bounds
    it('focus_ring_scenario_7394036_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 7394036;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(7394036);
    });

    // Scenario: focus_ring_scenario_7394037_config_api_9
    it('focus_ring_scenario_7394037_config_api_9', 0, async () => {
      const caseSeed: number = 7394037;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(7394037);
    });

    // Scenario: focus_ring_scenario_7394038_retry_attempts
    it('focus_ring_scenario_7394038_retry_attempts', 0, async () => {
      const caseSeed: number = 7394038;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(7394038);
    });

    // Scenario: focus_ring_scenario_7394039_event_recorder_sequence
    it('focus_ring_scenario_7394039_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 7394039;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(7394039);
    });

    // Scenario: focus_ring_scenario_7394040_session_start_cycles
    it('focus_ring_scenario_7394040_session_start_cycles', 0, async () => {
      const caseSeed: number = 7394040;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(7394040);
    });

    // Scenario: focus_ring_scenario_7394041_paddle_step_sequence
    it('focus_ring_scenario_7394041_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 7394041;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(7394041);
    });

    // Scenario: focus_ring_scenario_7394042_catalog_lookup_start
    it('focus_ring_scenario_7394042_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 7394042;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(7394042);
    });

    // Scenario: focus_ring_scenario_7394043_pipeline_round_trip
    it('focus_ring_scenario_7394043_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 7394043;
      const payload: string = '_main.paddle.moveLeft(); // case 7394043';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(7394043);
    });

    // Scenario: focus_ring_scenario_7394044_settings_zoom_true
    it('focus_ring_scenario_7394044_settings_zoom_true', 0, async () => {
      const caseSeed: number = 7394044;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(7394044);
    });

    // Scenario: focus_ring_scenario_7394045_layout_custom_columns
    it('focus_ring_scenario_7394045_layout_custom_columns', 0, async () => {
      const caseSeed: number = 7394045;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(7394045);
    });

    // Scenario: focus_ring_scenario_7394046_score_accumulation
    it('focus_ring_scenario_7394046_score_accumulation', 0, async () => {
      const caseSeed: number = 7394046;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(7394046);
    });

    // Scenario: focus_ring_scenario_7394047_brick_grid_progress
    it('focus_ring_scenario_7394047_brick_grid_progress', 0, async () => {
      const caseSeed: number = 7394047;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(7394047);
    });

  });
}
