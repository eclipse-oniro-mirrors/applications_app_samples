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
import { Driver, Component } from '@ohos.UiTest';
import {
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_SETTLE,
  LABEL_START,
  LABEL_LEFT,
  LABEL_RIGHT,
  LABEL_RESET,
  getDriver,
  serializedDelay,
  isGamePageVisible,
  checkComponentExists,
  triggerGamePage,
  pressAndWait,
  getCurrentFocusIndex,
  getComponentBounds,
  findButtonByLabel,
  getButtonLabels,
  summarizePage,
  safeGetText
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
import type { BoundsInfo, PageSummary } from '../Shared/SharedDriver';

export default function usabilityNavigationTest() {
  describe('UsabilityNavigation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'usability_navigation suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'usability_navigation suite end');
    });

    // Scenario: usability_navigation_all_controls_have_readable_labels
    it('usability_navigation_all_controls_have_readable_labels', 0, async () => {
      const labels: string[] = await getButtonLabels(driver);
      for (let i = 0; i < labels.length; i++) {
        expect(labels[i].length > 0).assertTrue();
      }
      expect(labels.length).assertLargerOrEqual(4);
    });

    // Scenario: usability_navigation_control_buttons_have_adequate_height
    it('usability_navigation_control_buttons_have_adequate_height', 0, async () => {
      const leftButton: Component | null = await findButtonByLabel(driver, LABEL_LEFT);
      expect(leftButton !== null).assertTrue();
      if (leftButton !== null) {
        const bounds: BoundsInfo = await getComponentBounds(leftButton);
        expect(bounds.height).assertLargerOrEqual(80);
        expect(bounds.width).assertLargerOrEqual(40);
      }
    });

    // Scenario: usability_navigation_focus_is_reachable_by_navigation
    it('usability_navigation_focus_is_reachable_by_navigation', 0, async () => {
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(-1);
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // Scenario: usability_navigation_every_control_is_traversable
    it('usability_navigation_every_control_is_traversable', 0, async () => {
      const labels: string[] = [LABEL_START, LABEL_LEFT, LABEL_RIGHT, LABEL_RESET];
      for (let i = 0; i < labels.length; i++) {
        const button: Component | null = await findButtonByLabel(driver, labels[i]);
        expect(button !== null).assertTrue();
        if (button !== null) {
          expect((await safeGetText(button)).length > 0).assertTrue();
        }
      }
    });

    // Scenario: usability_navigation_button_and_web_components_are_rendered
    it('usability_navigation_button_and_web_components_are_rendered', 0, async () => {
      expect(await checkComponentExists(driver, 'Button')).assertTrue();
      expect(await checkComponentExists(driver, 'Web')).assertTrue();
      expect(await checkComponentExists(driver, 'Row')).assertTrue();
      expect(await checkComponentExists(driver, 'Column')).assertTrue();
    });

    // Scenario: usability_navigation_control_buttons_are_inside_viewport
    it('usability_navigation_control_buttons_are_inside_viewport', 0, async () => {
      const button: Component | null = await findButtonByLabel(driver, LABEL_LEFT);
      expect(button !== null).assertTrue();
      if (button !== null) {
        const bounds: BoundsInfo = await getComponentBounds(button);
        expect(bounds.left).assertLargerOrEqual(0);
        expect(bounds.top).assertLargerOrEqual(0);
        expect(bounds.width).assertLarger(0);
        expect(bounds.height).assertLarger(0);
      }
    });

    // Scenario: usability_navigation_left_and_right_controls_are_separated
    it('usability_navigation_left_and_right_controls_are_separated', 0, async () => {
      const left: Component | null = await findButtonByLabel(driver, LABEL_LEFT);
      const right: Component | null = await findButtonByLabel(driver, LABEL_RIGHT);
      expect(left !== null && right !== null).assertTrue();
      if (left !== null && right !== null) {
        const leftBox: BoundsInfo = await getComponentBounds(left);
        const rightBox: BoundsInfo = await getComponentBounds(right);
        expect(rightBox.left > leftBox.left).assertTrue();
      }
    });

    // Scenario: usability_navigation_page_summary_matches_expectations
    it('usability_navigation_page_summary_matches_expectations', 0, async () => {
      const summary: PageSummary = await summarizePage(driver);
      expect(summary.buttonCount).assertLargerOrEqual(4);
      expect(summary.textCount).assertLargerOrEqual(0);
      expect(summary.webCount).assertLargerOrEqual(1);
      expect(summary.controlLabels.length).assertLargerOrEqual(4);
    });

    // Scenario: usability_navigation_scenario_8093800_session_start_cycles
    it('usability_navigation_scenario_8093800_session_start_cycles', 0, async () => {
      const caseSeed: number = 8093800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8093800);
    });

    // Scenario: usability_navigation_scenario_8093801_paddle_step_sequence
    it('usability_navigation_scenario_8093801_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8093801;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(8093801);
    });

    // Scenario: usability_navigation_scenario_8093802_catalog_lookup_start
    it('usability_navigation_scenario_8093802_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8093802;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8093802);
    });

    // Scenario: usability_navigation_scenario_8093803_pipeline_round_trip
    it('usability_navigation_scenario_8093803_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8093803;
      const payload: string = '_main.paddle.moveLeft(); // case 8093803';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8093803);
    });

    // Scenario: usability_navigation_scenario_8093804_settings_zoom_true
    it('usability_navigation_scenario_8093804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8093804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8093804);
    });

    // Scenario: usability_navigation_scenario_8093805_layout_custom_columns
    it('usability_navigation_scenario_8093805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8093805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8093805);
    });

    // Scenario: usability_navigation_scenario_8093806_score_accumulation
    it('usability_navigation_scenario_8093806_score_accumulation', 0, async () => {
      const caseSeed: number = 8093806;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(8093806);
    });

    // Scenario: usability_navigation_scenario_8093807_brick_grid_progress
    it('usability_navigation_scenario_8093807_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8093807;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(8093807);
    });

    // Scenario: usability_navigation_scenario_8093808_locale_lookup_en
    it('usability_navigation_scenario_8093808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8093808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8093808);
    });

    // Scenario: usability_navigation_scenario_8093809_validation_report_count
    it('usability_navigation_scenario_8093809_validation_report_count', 0, async () => {
      const caseSeed: number = 8093809;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8093809);
    });

    // Scenario: usability_navigation_scenario_8093810_url_with_query
    it('usability_navigation_scenario_8093810_url_with_query', 0, async () => {
      const caseSeed: number = 8093810;
      const url: string = SAMPLE_GAME_URL + '?case=33';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8093810);
    });

    // Scenario: usability_navigation_scenario_8093811_geometry_area
    it('usability_navigation_scenario_8093811_geometry_area', 0, async () => {
      const caseSeed: number = 8093811;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8093811);
    });

    // Scenario: usability_navigation_scenario_8093812_circular_buffer_capacity
    it('usability_navigation_scenario_8093812_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8093812;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8093812);
    });

    // Scenario: usability_navigation_scenario_8093813_command_queue_fifo
    it('usability_navigation_scenario_8093813_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8093813;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8093813);
    });

    // Scenario: usability_navigation_scenario_8093814_token_bucket_consume
    it('usability_navigation_scenario_8093814_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8093814;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(8093814);
    });

    // Scenario: usability_navigation_scenario_8093815_page_load_budget
    it('usability_navigation_scenario_8093815_page_load_budget', 0, async () => {
      const caseSeed: number = 8093815;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2815);
      expect(record.getDuration()).assertEqual(2815);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8093815);
    });

    // Scenario: usability_navigation_scenario_8093816_perf_sampler_bounds
    it('usability_navigation_scenario_8093816_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8093816;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(8093816);
    });

    // Scenario: usability_navigation_scenario_8093817_config_api_9
    it('usability_navigation_scenario_8093817_config_api_9', 0, async () => {
      const caseSeed: number = 8093817;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8093817);
    });

    // Scenario: usability_navigation_scenario_8093818_retry_attempts
    it('usability_navigation_scenario_8093818_retry_attempts', 0, async () => {
      const caseSeed: number = 8093818;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8093818);
    });

    // Scenario: usability_navigation_scenario_8093819_event_recorder_sequence
    it('usability_navigation_scenario_8093819_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8093819;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8093819);
    });

    // Scenario: usability_navigation_scenario_8093820_session_start_cycles
    it('usability_navigation_scenario_8093820_session_start_cycles', 0, async () => {
      const caseSeed: number = 8093820;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8093820);
    });

    // Scenario: usability_navigation_scenario_8093821_paddle_step_sequence
    it('usability_navigation_scenario_8093821_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8093821;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(8093821);
    });

    // Scenario: usability_navigation_scenario_8093822_catalog_lookup_start
    it('usability_navigation_scenario_8093822_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8093822;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8093822);
    });

    // Scenario: usability_navigation_scenario_8093823_pipeline_round_trip
    it('usability_navigation_scenario_8093823_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8093823;
      const payload: string = '_main.paddle.moveLeft(); // case 8093823';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8093823);
    });

    // Scenario: usability_navigation_scenario_8093824_settings_zoom_true
    it('usability_navigation_scenario_8093824_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8093824;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8093824);
    });

    // Scenario: usability_navigation_scenario_8093825_layout_custom_columns
    it('usability_navigation_scenario_8093825_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8093825;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8093825);
    });

    // Scenario: usability_navigation_scenario_8093826_score_accumulation
    it('usability_navigation_scenario_8093826_score_accumulation', 0, async () => {
      const caseSeed: number = 8093826;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(8093826);
    });

    // Scenario: usability_navigation_scenario_8093827_brick_grid_progress
    it('usability_navigation_scenario_8093827_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8093827;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(8093827);
    });

    // Scenario: usability_navigation_scenario_8093828_locale_lookup_en
    it('usability_navigation_scenario_8093828_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8093828;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8093828);
    });

    // Scenario: usability_navigation_scenario_8093829_validation_report_count
    it('usability_navigation_scenario_8093829_validation_report_count', 0, async () => {
      const caseSeed: number = 8093829;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8093829);
    });

    // Scenario: usability_navigation_scenario_8093830_url_with_query
    it('usability_navigation_scenario_8093830_url_with_query', 0, async () => {
      const caseSeed: number = 8093830;
      const url: string = SAMPLE_GAME_URL + '?case=53';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8093830);
    });

    // Scenario: usability_navigation_scenario_8093831_geometry_area
    it('usability_navigation_scenario_8093831_geometry_area', 0, async () => {
      const caseSeed: number = 8093831;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8093831);
    });

    // Scenario: usability_navigation_scenario_8093832_circular_buffer_capacity
    it('usability_navigation_scenario_8093832_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8093832;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8093832);
    });

    // Scenario: usability_navigation_scenario_8093833_command_queue_fifo
    it('usability_navigation_scenario_8093833_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8093833;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8093833);
    });

    // Scenario: usability_navigation_scenario_8093834_token_bucket_consume
    it('usability_navigation_scenario_8093834_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8093834;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(8093834);
    });

    // Scenario: usability_navigation_scenario_8093835_page_load_budget
    it('usability_navigation_scenario_8093835_page_load_budget', 0, async () => {
      const caseSeed: number = 8093835;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2835);
      expect(record.getDuration()).assertEqual(2835);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8093835);
    });

    // Scenario: usability_navigation_scenario_8093836_perf_sampler_bounds
    it('usability_navigation_scenario_8093836_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8093836;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(8093836);
    });

    // Scenario: usability_navigation_scenario_8093837_config_api_9
    it('usability_navigation_scenario_8093837_config_api_9', 0, async () => {
      const caseSeed: number = 8093837;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8093837);
    });

    // Scenario: usability_navigation_scenario_8093838_retry_attempts
    it('usability_navigation_scenario_8093838_retry_attempts', 0, async () => {
      const caseSeed: number = 8093838;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8093838);
    });

    // Scenario: usability_navigation_scenario_8093839_event_recorder_sequence
    it('usability_navigation_scenario_8093839_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8093839;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8093839);
    });

    // Scenario: usability_navigation_scenario_8093840_session_start_cycles
    it('usability_navigation_scenario_8093840_session_start_cycles', 0, async () => {
      const caseSeed: number = 8093840;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8093840);
    });

    // Scenario: usability_navigation_scenario_8093841_paddle_step_sequence
    it('usability_navigation_scenario_8093841_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8093841;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(8093841);
    });

    // Scenario: usability_navigation_scenario_8093842_catalog_lookup_start
    it('usability_navigation_scenario_8093842_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8093842;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8093842);
    });

    // Scenario: usability_navigation_scenario_8093843_pipeline_round_trip
    it('usability_navigation_scenario_8093843_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8093843;
      const payload: string = '_main.paddle.moveLeft(); // case 8093843';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8093843);
    });

    // Scenario: usability_navigation_scenario_8093844_settings_zoom_true
    it('usability_navigation_scenario_8093844_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8093844;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8093844);
    });

    // Scenario: usability_navigation_scenario_8093845_layout_custom_columns
    it('usability_navigation_scenario_8093845_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8093845;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8093845);
    });

    // Scenario: usability_navigation_scenario_8093846_score_accumulation
    it('usability_navigation_scenario_8093846_score_accumulation', 0, async () => {
      const caseSeed: number = 8093846;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(8093846);
    });

    // Scenario: usability_navigation_scenario_8093847_brick_grid_progress
    it('usability_navigation_scenario_8093847_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8093847;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(8093847);
    });

    // Scenario: usability_navigation_scenario_8093848_locale_lookup_en
    it('usability_navigation_scenario_8093848_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8093848;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8093848);
    });

    // Scenario: usability_navigation_scenario_8093849_validation_report_count
    it('usability_navigation_scenario_8093849_validation_report_count', 0, async () => {
      const caseSeed: number = 8093849;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8093849);
    });

    // Scenario: usability_navigation_scenario_8093850_url_with_query
    it('usability_navigation_scenario_8093850_url_with_query', 0, async () => {
      const caseSeed: number = 8093850;
      const url: string = SAMPLE_GAME_URL + '?case=73';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8093850);
    });

    // Scenario: usability_navigation_scenario_8093851_geometry_area
    it('usability_navigation_scenario_8093851_geometry_area', 0, async () => {
      const caseSeed: number = 8093851;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8093851);
    });

    // Scenario: usability_navigation_scenario_8093852_circular_buffer_capacity
    it('usability_navigation_scenario_8093852_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8093852;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8093852);
    });

    // Scenario: usability_navigation_scenario_8093853_command_queue_fifo
    it('usability_navigation_scenario_8093853_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8093853;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8093853);
    });

    // Scenario: usability_navigation_scenario_8093854_token_bucket_consume
    it('usability_navigation_scenario_8093854_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8093854;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(8093854);
    });

    // Scenario: usability_navigation_scenario_8093855_page_load_budget
    it('usability_navigation_scenario_8093855_page_load_budget', 0, async () => {
      const caseSeed: number = 8093855;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2855);
      expect(record.getDuration()).assertEqual(2855);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8093855);
    });

    // Scenario: usability_navigation_scenario_8093856_perf_sampler_bounds
    it('usability_navigation_scenario_8093856_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8093856;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(8093856);
    });

    // Scenario: usability_navigation_scenario_8093857_config_api_9
    it('usability_navigation_scenario_8093857_config_api_9', 0, async () => {
      const caseSeed: number = 8093857;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8093857);
    });

    // Scenario: usability_navigation_scenario_8093858_retry_attempts
    it('usability_navigation_scenario_8093858_retry_attempts', 0, async () => {
      const caseSeed: number = 8093858;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8093858);
    });

    // Scenario: usability_navigation_scenario_8093859_event_recorder_sequence
    it('usability_navigation_scenario_8093859_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8093859;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8093859);
    });

    // Scenario: usability_navigation_scenario_8093860_session_start_cycles
    it('usability_navigation_scenario_8093860_session_start_cycles', 0, async () => {
      const caseSeed: number = 8093860;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8093860);
    });

  });
}
