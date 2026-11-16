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
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  TIMEOUT_WEB_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_SETTLE,
  LABEL_START,
  LABEL_LEFT,
  LABEL_RIGHT,
  LABEL_RESET,
  getDriver,
  serializedDelay,
  gameComponentCount,
  isGamePageVisible,
  waitForGamePageStable,
  checkComponentExists,
  triggerGamePage,
  pressAndWait,
  findButtonByLabel,
  getButtonLabels,
  countButtonsByLabel,
  isHorizontalControlLayout,
  summarizePage
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
  LayoutMetricsCollector,
  ThemeResolver
} from '../Shared/TestHelpers';
import type { PageSummary } from '../Shared/SharedDriver';

export default function webGameUITest() {
  describe('WebGameUI_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'webgame_ui suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'webgame_ui suite end');
    });

    // Scenario: webgame_ui_game_page_is_visible
    it('webgame_ui_game_page_is_visible', 0, async () => {
      const visible: boolean = await waitForGamePageStable(driver, TIMEOUT_WEB_RENDER);
      expect(visible).assertTrue();
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // Scenario: webgame_ui_all_four_control_buttons_exist
    it('webgame_ui_all_four_control_buttons_exist', 0, async () => {
      const labels: string[] = await getButtonLabels(driver);
      expect(labels.length).assertLargerOrEqual(4);
      expect(labels.includes(LABEL_START)).assertTrue();
      expect(labels.includes(LABEL_LEFT)).assertTrue();
      expect(labels.includes(LABEL_RIGHT)).assertTrue();
      expect(labels.includes(LABEL_RESET)).assertTrue();
    });

    // Scenario: webgame_ui_page_contains_web_component
    it('webgame_ui_page_contains_web_component', 0, async () => {
      const summary: PageSummary = await summarizePage(driver);
      expect(summary.webCount).assertLargerOrEqual(1);
      expect(summary.buttonCount).assertLargerOrEqual(4);
      expect(summary.componentCount).assertLargerOrEqual(1);
    });

    // Scenario: webgame_ui_component_count_is_bounded
    it('webgame_ui_component_count_is_bounded', 0, async () => {
      const count: number = await gameComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      expect(count).assertLessOrEqual(80);
    });

    // Scenario: webgame_ui_controls_use_horizontal_layout
    it('webgame_ui_controls_use_horizontal_layout', 0, async () => {
      expect(await isHorizontalControlLayout(driver)).assertTrue();
      expect(await checkComponentExists(driver, 'Button')).assertTrue();
    });

    // Scenario: webgame_ui_button_start_appears_once
    it('webgame_ui_button_start_appears_once', 0, async () => {
      expect(await countButtonsByLabel(driver, 'Start')).assertEqual(1);
      expect(await findButtonByLabel(driver, 'Start') !== null).assertTrue();
    });

    // Scenario: webgame_ui_button_l_appears_once
    it('webgame_ui_button_l_appears_once', 0, async () => {
      expect(await countButtonsByLabel(driver, 'L')).assertEqual(1);
      expect(await findButtonByLabel(driver, 'L') !== null).assertTrue();
    });

    // Scenario: webgame_ui_button_r_appears_once
    it('webgame_ui_button_r_appears_once', 0, async () => {
      expect(await countButtonsByLabel(driver, 'R')).assertEqual(1);
      expect(await findButtonByLabel(driver, 'R') !== null).assertTrue();
    });

    // Scenario: webgame_ui_button_reset_appears_once
    it('webgame_ui_button_reset_appears_once', 0, async () => {
      expect(await countButtonsByLabel(driver, 'Reset')).assertEqual(1);
      expect(await findButtonByLabel(driver, 'Reset') !== null).assertTrue();
    });

    // Scenario: webgame_ui_layout_columns_sum_to_full_width
    it('webgame_ui_layout_columns_sum_to_full_width', 0, async () => {
      const layout: LayoutProfile = LayoutProfile.createDefault();
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isValid()).assertTrue();
      expect(layout.getOrientation()).assertEqual(ORIENTATION_LANDSCAPE);
    });

    // Scenario: webgame_ui_layout_controls_are_balanced
    it('webgame_ui_layout_controls_are_balanced', 0, async () => {
      const layout: LayoutProfile = LayoutProfile.createDefault();
      expect(layout.isBalanced()).assertTrue();
      expect(layout.webShare()).assertEqual(80);
      expect(layout.controlShare()).assertEqual(20);
    });

    // Scenario: webgame_ui_control_button_aspect_ratio
    it('webgame_ui_control_button_aspect_ratio', 0, async () => {
      const layout: LayoutProfile = LayoutProfile.createDefault();
      expect(layout.getButtonAspectRatio()).assertEqual(2);
      expect(layout.scaledWidth(1)).assertEqual(80);
      expect(layout.scaledWidth(0.5)).assertEqual(40);
    });

    // Scenario: webgame_ui_layout_equal_check_is_strict
    it('webgame_ui_layout_equal_check_is_strict', 0, async () => {
      const first: LayoutProfile = LayoutProfile.createDefault();
      const second: LayoutProfile = LayoutProfile.createDefault();
      expect(first.equals(second)).assertTrue();
      const changed: LayoutProfile = new LayoutProfile(15, 70, 15, 50, 100, ORIENTATION_LANDSCAPE);
      expect(first.equals(changed)).assertFalse();
      expect(changed.totalWidth()).assertEqual(100);
      expect(changed.isBalanced()).assertTrue();
    });

    // Scenario: webgame_ui_invalid_layout_is_rejected
    it('webgame_ui_invalid_layout_is_rejected', 0, async () => {
      const broken: LayoutProfile = new LayoutProfile(10, 70, 10, 0, 100, ORIENTATION_LANDSCAPE);
      expect(broken.totalWidth()).assertEqual(90);
      expect(broken.isValid()).assertFalse();
      const portrait: LayoutProfile = new LayoutProfile(10, 80, 10, 50, 100, 'portrait');
      expect(portrait.isValid()).assertFalse();
    });

    // Scenario: webgame_ui_default_settings_match_game_requirements
    it('webgame_ui_default_settings_match_game_requirements', 0, async () => {
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      expect(profile.isJavaScriptAccess()).assertTrue();
      expect(profile.isDomStorageAccess()).assertTrue();
      expect(profile.isImageAccess()).assertTrue();
      expect(profile.isOnlineImageAccess()).assertTrue();
      expect(profile.isZoomAccess()).assertFalse();
      expect(profile.isValidGameProfile()).assertTrue();
    });

    // Scenario: webgame_ui_default_profile_enables_four_switches
    it('webgame_ui_default_profile_enables_four_switches', 0, async () => {
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      expect(profile.countEnabled()).assertEqual(4);
      expect(profile.toSummary()).assertContain('js=true');
      expect(profile.toSummary()).assertContain('zoom=false');
    });

    // Scenario: webgame_ui_javascript_access_can_be_disabled
    it('webgame_ui_javascript_access_can_be_disabled', 0, async () => {
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setJavaScriptAccess(false);
      expect(profile.isJavaScriptAccess()).assertFalse();
      expect(profile.isValidGameProfile()).assertFalse();
      expect(profile.countEnabled()).assertEqual(3);
    });

    // Scenario: webgame_ui_zoom_access_can_be_enabled_for_debug
    it('webgame_ui_zoom_access_can_be_enabled_for_debug', 0, async () => {
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertTrue();
      expect(profile.isValidGameProfile()).assertFalse();
      expect(profile.countEnabled()).assertEqual(5);
    });

    // Scenario: webgame_ui_settings_profiles_are_comparable
    it('webgame_ui_settings_profiles_are_comparable', 0, async () => {
      const first: WebSettingsProfile = WebSettingsProfile.createDefault();
      const second: WebSettingsProfile = WebSettingsProfile.createDefault();
      expect(first.equals(second)).assertTrue();
      second.setImageAccess(false);
      expect(first.equals(second)).assertFalse();
    });

    // Scenario: webgame_ui_control_color_has_expected_intensity
    it('webgame_ui_control_color_has_expected_intensity', 0, async () => {
      const theme: ThemeResolver = new ThemeResolver();
      const red: number = theme.brightness(theme.resolve('control_red'));
      const dark: number = theme.brightness(theme.resolve('dark_background'));
      expect(red > dark).assertTrue();
      expect(theme.resolve('web_orange')).assertEqual('#FFA500');
    });

    // Scenario: webgame_ui_layout_metrics_reflect_three_columns
    it('webgame_ui_layout_metrics_reflect_three_columns', 0, async () => {
      const metrics: LayoutMetricsCollector = new LayoutMetricsCollector();
      metrics.add(10, 100, true);
      metrics.add(80, 100, true);
      metrics.add(10, 100, true);
      expect(metrics.count()).assertEqual(3);
      expect(metrics.totalWidth()).assertEqual(100);
      expect(metrics.visible()).assertEqual(3);
      expect(metrics.averageWidth() > 0).assertTrue();
    });

    // Scenario: webgame_ui_visual_state_after_navigation
    it('webgame_ui_visual_state_after_navigation', 0, async () => {
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const summary: PageSummary = await summarizePage(driver);
      expect(summary.webCount).assertLargerOrEqual(1);
      expect(summary.buttonCount).assertLargerOrEqual(4);
    });

    // Scenario: webgame_ui_scenario_6127400_session_start_cycles
    it('webgame_ui_scenario_6127400_session_start_cycles', 0, async () => {
      const caseSeed: number = 6127400;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6127400);
    });

    // Scenario: webgame_ui_scenario_6127401_paddle_step_sequence
    it('webgame_ui_scenario_6127401_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6127401;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(6127401);
    });

    // Scenario: webgame_ui_scenario_6127402_catalog_lookup_start
    it('webgame_ui_scenario_6127402_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6127402;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6127402);
    });

    // Scenario: webgame_ui_scenario_6127403_pipeline_round_trip
    it('webgame_ui_scenario_6127403_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6127403;
      const payload: string = '_main.paddle.moveLeft(); // case 6127403';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6127403);
    });

    // Scenario: webgame_ui_scenario_6127404_settings_zoom_true
    it('webgame_ui_scenario_6127404_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6127404;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6127404);
    });

    // Scenario: webgame_ui_scenario_6127405_layout_custom_columns
    it('webgame_ui_scenario_6127405_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6127405;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6127405);
    });

    // Scenario: webgame_ui_scenario_6127406_score_accumulation
    it('webgame_ui_scenario_6127406_score_accumulation', 0, async () => {
      const caseSeed: number = 6127406;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(6127406);
    });

    // Scenario: webgame_ui_scenario_6127407_brick_grid_progress
    it('webgame_ui_scenario_6127407_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6127407;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(6127407);
    });

    // Scenario: webgame_ui_scenario_6127408_locale_lookup_en
    it('webgame_ui_scenario_6127408_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6127408;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6127408);
    });

    // Scenario: webgame_ui_scenario_6127409_validation_report_count
    it('webgame_ui_scenario_6127409_validation_report_count', 0, async () => {
      const caseSeed: number = 6127409;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6127409);
    });

    // Scenario: webgame_ui_scenario_6127410_url_with_query
    it('webgame_ui_scenario_6127410_url_with_query', 0, async () => {
      const caseSeed: number = 6127410;
      const url: string = SAMPLE_GAME_URL + '?case=17';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6127410);
    });

    // Scenario: webgame_ui_scenario_6127411_geometry_area
    it('webgame_ui_scenario_6127411_geometry_area', 0, async () => {
      const caseSeed: number = 6127411;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 41);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6127411);
    });

    // Scenario: webgame_ui_scenario_6127412_circular_buffer_capacity
    it('webgame_ui_scenario_6127412_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6127412;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6127412);
    });

    // Scenario: webgame_ui_scenario_6127413_command_queue_fifo
    it('webgame_ui_scenario_6127413_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6127413;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6127413);
    });

    // Scenario: webgame_ui_scenario_6127414_token_bucket_consume
    it('webgame_ui_scenario_6127414_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6127414;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(6127414);
    });

    // Scenario: webgame_ui_scenario_6127415_page_load_budget
    it('webgame_ui_scenario_6127415_page_load_budget', 0, async () => {
      const caseSeed: number = 6127415;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7415);
      expect(record.getDuration()).assertEqual(7415);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6127415);
    });

    // Scenario: webgame_ui_scenario_6127416_perf_sampler_bounds
    it('webgame_ui_scenario_6127416_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6127416;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(6127416);
    });

    // Scenario: webgame_ui_scenario_6127417_config_api_9
    it('webgame_ui_scenario_6127417_config_api_9', 0, async () => {
      const caseSeed: number = 6127417;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6127417);
    });

    // Scenario: webgame_ui_scenario_6127418_retry_attempts
    it('webgame_ui_scenario_6127418_retry_attempts', 0, async () => {
      const caseSeed: number = 6127418;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6127418);
    });

    // Scenario: webgame_ui_scenario_6127419_event_recorder_sequence
    it('webgame_ui_scenario_6127419_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6127419;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6127419);
    });

    // Scenario: webgame_ui_scenario_6127420_session_start_cycles
    it('webgame_ui_scenario_6127420_session_start_cycles', 0, async () => {
      const caseSeed: number = 6127420;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6127420);
    });

    // Scenario: webgame_ui_scenario_6127421_paddle_step_sequence
    it('webgame_ui_scenario_6127421_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6127421;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(6127421);
    });

  });
}
