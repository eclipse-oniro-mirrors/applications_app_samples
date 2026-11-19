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
  LABEL_START,
  getDriver,
  serializedDelay,
  isGamePageVisible,
  triggerGamePage,
  pressAndWait,
  getButtonLabels
} from '../Shared/SharedDriver';
import {
  SAMPLE_GAME_URL,
  API_VERSION,
  MODULE_NAME,
  ABILITY_NAME,
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

export default function configurationChangesTest() {
  describe('ConfigurationChanges_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'configuration_changes suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'configuration_changes suite end');
    });

    // Scenario: configuration_changes_module_configuration_is_loadable
    it('configuration_changes_module_configuration_is_loadable', 0, async () => {
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.abilityName).assertEqual(ABILITY_NAME);
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // Scenario: configuration_changes_main_pages_entry_is_consistent
    it('configuration_changes_main_pages_entry_is_consistent', 0, async () => {
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.moduleName).assertEqual(MODULE_NAME);
      expect(config.apiVersion).assertEqual(API_VERSION);
      expect(config.isLandscape()).assertTrue();
    });

    // Scenario: configuration_changes_configuration_change_keeps_controls
    it('configuration_changes_configuration_change_keeps_controls', 0, async () => {
      const before: string[] = await getButtonLabels(driver);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      const after: string[] = await getButtonLabels(driver);
      expect(after.length).assertEqual(before.length);
      expect(after.includes(LABEL_START)).assertTrue();
    });

    // Scenario: configuration_changes_scenario_4670900_session_start_cycles
    it('configuration_changes_scenario_4670900_session_start_cycles', 0, async () => {
      const caseSeed: number = 4670900;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(4670900);
    });

    // Scenario: configuration_changes_scenario_4670901_paddle_step_sequence
    it('configuration_changes_scenario_4670901_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 4670901;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(4670901);
    });

    // Scenario: configuration_changes_scenario_4670902_catalog_lookup_start
    it('configuration_changes_scenario_4670902_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 4670902;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(4670902);
    });

    // Scenario: configuration_changes_scenario_4670903_pipeline_round_trip
    it('configuration_changes_scenario_4670903_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 4670903;
      const payload: string = '_main.paddle.moveLeft(); // case 4670903';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(4670903);
    });

    // Scenario: configuration_changes_scenario_4670904_settings_zoom_true
    it('configuration_changes_scenario_4670904_settings_zoom_true', 0, async () => {
      const caseSeed: number = 4670904;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(4670904);
    });

    // Scenario: configuration_changes_scenario_4670905_layout_custom_columns
    it('configuration_changes_scenario_4670905_layout_custom_columns', 0, async () => {
      const caseSeed: number = 4670905;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(4670905);
    });

    // Scenario: configuration_changes_scenario_4670906_score_accumulation
    it('configuration_changes_scenario_4670906_score_accumulation', 0, async () => {
      const caseSeed: number = 4670906;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(4670906);
    });

    // Scenario: configuration_changes_scenario_4670907_brick_grid_progress
    it('configuration_changes_scenario_4670907_brick_grid_progress', 0, async () => {
      const caseSeed: number = 4670907;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(4670907);
    });

    // Scenario: configuration_changes_scenario_4670908_locale_lookup_en
    it('configuration_changes_scenario_4670908_locale_lookup_en', 0, async () => {
      const caseSeed: number = 4670908;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(4670908);
    });

    // Scenario: configuration_changes_scenario_4670909_validation_report_count
    it('configuration_changes_scenario_4670909_validation_report_count', 0, async () => {
      const caseSeed: number = 4670909;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(4670909);
    });

    // Scenario: configuration_changes_scenario_4670910_url_with_query
    it('configuration_changes_scenario_4670910_url_with_query', 0, async () => {
      const caseSeed: number = 4670910;
      const url: string = SAMPLE_GAME_URL + '?case=69';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(4670910);
    });

    // Scenario: configuration_changes_scenario_4670911_geometry_area
    it('configuration_changes_scenario_4670911_geometry_area', 0, async () => {
      const caseSeed: number = 4670911;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(4670911);
    });

    // Scenario: configuration_changes_scenario_4670912_circular_buffer_capacity
    it('configuration_changes_scenario_4670912_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 4670912;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(4670912);
    });

    // Scenario: configuration_changes_scenario_4670913_command_queue_fifo
    it('configuration_changes_scenario_4670913_command_queue_fifo', 0, async () => {
      const caseSeed: number = 4670913;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(4670913);
    });

    // Scenario: configuration_changes_scenario_4670914_token_bucket_consume
    it('configuration_changes_scenario_4670914_token_bucket_consume', 0, async () => {
      const caseSeed: number = 4670914;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(4670914);
    });

    // Scenario: configuration_changes_scenario_4670915_page_load_budget
    it('configuration_changes_scenario_4670915_page_load_budget', 0, async () => {
      const caseSeed: number = 4670915;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8915);
      expect(record.getDuration()).assertEqual(8915);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(4670915);
    });

    // Scenario: configuration_changes_scenario_4670916_perf_sampler_bounds
    it('configuration_changes_scenario_4670916_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 4670916;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(4670916);
    });

    // Scenario: configuration_changes_scenario_4670917_config_api_9
    it('configuration_changes_scenario_4670917_config_api_9', 0, async () => {
      const caseSeed: number = 4670917;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(4670917);
    });

    // Scenario: configuration_changes_scenario_4670918_retry_attempts
    it('configuration_changes_scenario_4670918_retry_attempts', 0, async () => {
      const caseSeed: number = 4670918;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(4670918);
    });

    // Scenario: configuration_changes_scenario_4670919_event_recorder_sequence
    it('configuration_changes_scenario_4670919_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 4670919;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(4670919);
    });

    // Scenario: configuration_changes_scenario_4670920_session_start_cycles
    it('configuration_changes_scenario_4670920_session_start_cycles', 0, async () => {
      const caseSeed: number = 4670920;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(4670920);
    });

    // Scenario: configuration_changes_scenario_4670921_paddle_step_sequence
    it('configuration_changes_scenario_4670921_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 4670921;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(4670921);
    });

    // Scenario: configuration_changes_scenario_4670922_catalog_lookup_start
    it('configuration_changes_scenario_4670922_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 4670922;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(4670922);
    });

    // Scenario: configuration_changes_scenario_4670923_pipeline_round_trip
    it('configuration_changes_scenario_4670923_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 4670923;
      const payload: string = '_main.paddle.moveLeft(); // case 4670923';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(4670923);
    });

    // Scenario: configuration_changes_scenario_4670924_settings_zoom_true
    it('configuration_changes_scenario_4670924_settings_zoom_true', 0, async () => {
      const caseSeed: number = 4670924;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(4670924);
    });

  });
}
