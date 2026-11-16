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
  JAVASCRIPT_PREFIX,
  INTERNET_PERMISSION,
  ORIENTATION_LANDSCAPE,
  PAGE_LOAD_BUDGET_MS,
  GameState,
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
  ValidationReport,
  ScriptPayloadBuilder
} from '../Shared/GameModel';
import {
  UrlParts,
  GeometryBox,
  CircularBuffer,
  CommandQueue,
  TokenBucket
} from '../Shared/GameTestKit';

export default function gameOperationsTest() {
  describe('GameOperations_Test', () => {
    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_ops suite start');
    });

    afterAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_ops suite end');
    });

    // Scenario: game_ops_session_initial_state_is_start
    it('game_ops_session_initial_state_is_start', 0, async () => {
      const session: GameSession = new GameSession();
      expect(session.getState()).assertEqual(GameState.STATE_START);
      expect(session.isStarted()).assertTrue();
      expect(session.isRunning()).assertFalse();
      expect(session.isBallFired()).assertFalse();
      expect(session.getStartCount()).assertEqual(0);
    });

    // Scenario: game_ops_start_from_start_switches_to_running
    it('game_ops_start_from_start_switches_to_running', 0, async () => {
      const session: GameSession = new GameSession();
      const changed: boolean = session.start();
      expect(changed).assertTrue();
      expect(session.getState()).assertEqual(GameState.STATE_RUNNING);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getStartCount()).assertEqual(1);
    });

    // Scenario: game_ops_start_from_running_keeps_running
    it('game_ops_start_from_running_keeps_running', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      const changed: boolean = session.start();
      expect(changed).assertTrue();
      expect(session.getState()).assertEqual(GameState.STATE_RUNNING);
      expect(session.getStartCount()).assertEqual(2);
      expect(session.getIgnoredStartCount()).assertEqual(0);
    });

    // Scenario: game_ops_start_from_gameover_is_ignored
    it('game_ops_start_from_gameover_is_ignored', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      session.markGameOver();
      const changed: boolean = session.start();
      expect(changed).assertFalse();
      expect(session.isGameOver()).assertTrue();
      expect(session.getIgnoredStartCount()).assertEqual(1);
    });

    // Scenario: game_ops_reset_from_start_is_ignored
    it('game_ops_reset_from_start_is_ignored', 0, async () => {
      const session: GameSession = new GameSession();
      const changed: boolean = session.reset();
      expect(changed).assertFalse();
      expect(session.isStarted()).assertTrue();
      expect(session.getIgnoredResetCount()).assertEqual(1);
      expect(session.getResetCount()).assertEqual(0);
    });

    // Scenario: game_ops_reset_from_running_is_ignored
    it('game_ops_reset_from_running_is_ignored', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      const changed: boolean = session.reset();
      expect(changed).assertFalse();
      expect(session.isRunning()).assertTrue();
      expect(session.getIgnoredResetCount()).assertEqual(1);
    });

    // Scenario: game_ops_reset_from_gameover_returns_to_start
    it('game_ops_reset_from_gameover_returns_to_start', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      session.markGameOver();
      const changed: boolean = session.reset();
      expect(changed).assertTrue();
      expect(session.isStarted()).assertTrue();
      expect(session.isBallFired()).assertFalse();
      expect(session.getResetCount()).assertEqual(1);
    });

    // Scenario: game_ops_full_lifecycle_cycle_is_consistent
    it('game_ops_full_lifecycle_cycle_is_consistent', 0, async () => {
      const session: GameSession = new GameSession();
      expect(session.start()).assertTrue();
      session.markGameOver();
      expect(session.reset()).assertTrue();
      expect(session.getState()).assertEqual(GameState.STATE_START);
      const history: string[] = session.getHistory();
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('start:running');
      expect(history[2]).assertEqual('reset:start');
    });

    // Scenario: game_ops_session_reset_clears_all_counters
    it('game_ops_session_reset_clears_all_counters', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      session.markGameOver();
      session.resetSession();
      expect(session.getStartCount()).assertEqual(0);
      expect(session.getResetCount()).assertEqual(0);
      expect(session.getIgnoredStartCount()).assertEqual(0);
      expect(session.getHistory().length).assertEqual(0);
      expect(session.isStarted()).assertTrue();
    });

    // Scenario: game_ops_catalog_contains_all_five_scripts
    it('game_ops_catalog_contains_all_five_scripts', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      expect(catalog.size()).assertEqual(5);
      expect(catalog.contains('start')).assertTrue();
      expect(catalog.contains('left')).assertTrue();
      expect(catalog.contains('right')).assertTrue();
      expect(catalog.contains('reset')).assertTrue();
      expect(catalog.contains('removeDesc')).assertTrue();
    });

    // Scenario: game_ops_catalog_validates_all_payloads
    it('game_ops_catalog_validates_all_payloads', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      expect(catalog.validateAll()).assertTrue();
      expect(catalog.findMissingEntryPoint().length).assertEqual(0);
      expect(catalog.totalPayloadLength()).assertLarger(0);
    });

    // Scenario: game_ops_catalog_builds_javascript_urls
    it('game_ops_catalog_builds_javascript_urls', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const urls: string[] = catalog.toInjectionUrls();
      expect(urls.length).assertEqual(5);
      for (let i = 0; i < urls.length; i++) {
        expect(urls[i].startsWith(JAVASCRIPT_PREFIX)).assertTrue();
        expect(urls[i].length).assertLarger(JAVASCRIPT_PREFIX.length);
      }
    });

    // Scenario: game_ops_script_left_exists_and_executes_moveleft
    it('game_ops_script_left_exists_and_executes_moveleft', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('left');
      expect(script.containsToken('moveLeft')).assertTrue();
      expect(script.action).assertEqual('gameLeft');
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(script.hasCode()).assertTrue();
    });

    // Scenario: game_ops_script_left_payload_is_wellformed_and_safe
    it('game_ops_script_left_payload_is_wellformed_and_safe', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('left');
      expect(InjectionPipeline.isWellFormed(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedParentheses(script.code)).assertTrue();
      expect(InjectionPipeline.isSafe(script.code)).assertTrue();
      expect(script.toInjectionUrl()).assertContain(JAVASCRIPT_PREFIX);
    });

    // Scenario: game_ops_script_right_exists_and_executes_moveright
    it('game_ops_script_right_exists_and_executes_moveright', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('right');
      expect(script.containsToken('moveRight')).assertTrue();
      expect(script.action).assertEqual('gameRight');
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(script.hasCode()).assertTrue();
    });

    // Scenario: game_ops_script_right_payload_is_wellformed_and_safe
    it('game_ops_script_right_payload_is_wellformed_and_safe', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('right');
      expect(InjectionPipeline.isWellFormed(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedParentheses(script.code)).assertTrue();
      expect(InjectionPipeline.isSafe(script.code)).assertTrue();
      expect(script.toInjectionUrl()).assertContain(JAVASCRIPT_PREFIX);
    });

    // Scenario: game_ops_script_start_exists_and_executes_state_running
    it('game_ops_script_start_exists_and_executes_state_running', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.action).assertEqual('gameStart');
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(script.hasCode()).assertTrue();
    });

    // Scenario: game_ops_script_start_payload_is_wellformed_and_safe
    it('game_ops_script_start_payload_is_wellformed_and_safe', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(InjectionPipeline.isWellFormed(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedParentheses(script.code)).assertTrue();
      expect(InjectionPipeline.isSafe(script.code)).assertTrue();
      expect(script.toInjectionUrl()).assertContain(JAVASCRIPT_PREFIX);
    });

    // Scenario: game_ops_script_reset_exists_and_executes_state_start
    it('game_ops_script_reset_exists_and_executes_state_start', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('reset');
      expect(script.containsToken('state_START')).assertTrue();
      expect(script.action).assertEqual('gameReset');
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(script.hasCode()).assertTrue();
    });

    // Scenario: game_ops_script_reset_payload_is_wellformed_and_safe
    it('game_ops_script_reset_payload_is_wellformed_and_safe', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('reset');
      expect(InjectionPipeline.isWellFormed(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedParentheses(script.code)).assertTrue();
      expect(InjectionPipeline.isSafe(script.code)).assertTrue();
      expect(script.toInjectionUrl()).assertContain(JAVASCRIPT_PREFIX);
    });

    // Scenario: game_ops_script_removeDesc_exists_and_executes_removechild
    it('game_ops_script_removeDesc_exists_and_executes_removechild', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('removeDesc');
      expect(script.containsToken('removeChild')).assertTrue();
      expect(script.action).assertEqual('removeDesc');
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(script.hasCode()).assertTrue();
    });

    // Scenario: game_ops_script_removeDesc_payload_is_wellformed_and_safe
    it('game_ops_script_removeDesc_payload_is_wellformed_and_safe', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('removeDesc');
      expect(InjectionPipeline.isWellFormed(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedParentheses(script.code)).assertTrue();
      expect(InjectionPipeline.isSafe(script.code)).assertTrue();
      expect(script.toInjectionUrl()).assertContain(JAVASCRIPT_PREFIX);
    });

    // Scenario: game_ops_build_adds_javascript_prefix
    it('game_ops_build_adds_javascript_prefix', 0, async () => {
      const url: string = InjectionPipeline.build('_main.start();');
      expect(url).assertEqual('javascript:_main.start();');
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
    });

    // Scenario: game_ops_build_from_script_keeps_payload
    it('game_ops_build_from_script_keeps_payload', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      const url: string = InjectionPipeline.buildFromScript(script);
      expect(url.startsWith(JAVASCRIPT_PREFIX)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(script.code);
    });

    // Scenario: game_ops_build_rejects_empty_payload
    it('game_ops_build_rejects_empty_payload', 0, async () => {
      let thrown: boolean = false;
      try {
        InjectionPipeline.build('');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    // Scenario: game_ops_validate_recognizes_injection_url
    it('game_ops_validate_recognizes_injection_url', 0, async () => {
      expect(InjectionPipeline.isInjectionUrl('javascript:void(0)')).assertTrue();
      expect(InjectionPipeline.isInjectionUrl('https://example.com')).assertFalse();
      expect(InjectionPipeline.isInjectionUrl('file:///data/a.html')).assertFalse();
      expect(InjectionPipeline.extract('https://example.com')).assertEqual('');
    });

    // Scenario: game_ops_remote_url_detection
    it('game_ops_remote_url_detection', 0, async () => {
      expect(InjectionPipeline.isRemoteUrl(SAMPLE_GAME_URL)).assertTrue();
      expect(InjectionPipeline.isRemoteUrl('http://localhost:8080')).assertTrue();
      expect(InjectionPipeline.isRemoteUrl('javascript:void(0)')).assertFalse();
    });

    // Scenario: game_ops_malformed_payload_is_detected
    it('game_ops_malformed_payload_is_detected', 0, async () => {
      const malformed: string = ScriptPayloadBuilder.malformedPayload();
      expect(InjectionPipeline.hasBalancedBraces(malformed)).assertFalse();
      expect(InjectionPipeline.isWellFormed(malformed)).assertFalse();
      expect(InjectionPipeline.hasBalancedParentheses('foo(bar')).assertFalse();
    });

    // Scenario: game_ops_unsafe_payload_is_rejected
    it('game_ops_unsafe_payload_is_rejected', 0, async () => {
      expect(InjectionPipeline.isSafe(ScriptPayloadBuilder.unsafePayload())).assertFalse();
      expect(InjectionPipeline.isSafe('line1\nline2')).assertFalse();
      expect(InjectionPipeline.isSafe('line1\rline2')).assertFalse();
      expect(InjectionPipeline.isSafe('_main.start();')).assertTrue();
    });

    // Scenario: game_ops_empty_payload_is_not_safe
    it('game_ops_empty_payload_is_not_safe', 0, async () => {
      expect(InjectionPipeline.isSafe(ScriptPayloadBuilder.emptyPayload())).assertFalse();
      expect(InjectionPipeline.isWellFormed(ScriptPayloadBuilder.emptyPayload())).assertFalse();
      expect(InjectionPipeline.extract('')).assertEqual('');
    });

    // Scenario: game_ops_escaped_parentheses_are_balanced
    it('game_ops_escaped_parentheses_are_balanced', 0, async () => {
      const payload: string = '_main.start(_main.game.state);';
      expect(InjectionPipeline.hasBalancedParentheses(payload)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces('if (a) { b(); }')).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces('} { ')).assertFalse();
    });

    // Scenario: game_ops_catalog_payloads_are_all_injectable
    it('game_ops_catalog_payloads_are_all_injectable', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const scripts: GameScript[] = catalog.all();
      for (let i = 0; i < scripts.length; i++) {
        const url: string = InjectionPipeline.buildFromScript(scripts[i]);
        expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
        expect(InjectionPipeline.isSafe(InjectionPipeline.extract(url))).assertTrue();
      }
    });

    // Scenario: game_ops_score_accumulates_points
    it('game_ops_score_accumulates_points', 0, async () => {
      const board: ScoreBoard = new ScoreBoard();
      expect(board.add(10)).assertEqual(10);
      expect(board.add(20)).assertEqual(30);
      expect(board.getScore()).assertEqual(30);
      expect(board.getHitCount()).assertEqual(2);
      expect(board.getHighScore()).assertEqual(30);
    });

    // Scenario: game_ops_non_positive_points_are_ignored
    it('game_ops_non_positive_points_are_ignored', 0, async () => {
      const board: ScoreBoard = new ScoreBoard();
      board.add(10);
      expect(board.add(0)).assertEqual(10);
      expect(board.add(-5)).assertEqual(10);
      expect(board.getHitCount()).assertEqual(1);
    });

    // Scenario: game_ops_high_score_survives_reset
    it('game_ops_high_score_survives_reset', 0, async () => {
      const board: ScoreBoard = new ScoreBoard();
      board.add(50);
      board.reset();
      expect(board.getScore()).assertEqual(0);
      expect(board.getHighScore()).assertEqual(50);
      board.add(20);
      expect(board.isNewRecord()).assertFalse();
    });

    // Scenario: game_ops_scenario_6260800_session_start_cycles
    it('game_ops_scenario_6260800_session_start_cycles', 0, async () => {
      const caseSeed: number = 6260800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6260800);
    });

    // Scenario: game_ops_scenario_6260801_paddle_step_sequence
    it('game_ops_scenario_6260801_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6260801;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(6260801);
    });

    // Scenario: game_ops_scenario_6260802_catalog_lookup_start
    it('game_ops_scenario_6260802_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6260802;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6260802);
    });

    // Scenario: game_ops_scenario_6260803_pipeline_round_trip
    it('game_ops_scenario_6260803_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6260803;
      const payload: string = '_main.paddle.moveLeft(); // case 6260803';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6260803);
    });

    // Scenario: game_ops_scenario_6260804_settings_zoom_true
    it('game_ops_scenario_6260804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6260804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6260804);
    });

    // Scenario: game_ops_scenario_6260805_layout_custom_columns
    it('game_ops_scenario_6260805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6260805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6260805);
    });

    // Scenario: game_ops_scenario_6260806_score_accumulation
    it('game_ops_scenario_6260806_score_accumulation', 0, async () => {
      const caseSeed: number = 6260806;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(6260806);
    });

    // Scenario: game_ops_scenario_6260807_brick_grid_progress
    it('game_ops_scenario_6260807_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6260807;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(6260807);
    });

    // Scenario: game_ops_scenario_6260808_locale_lookup_en
    it('game_ops_scenario_6260808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6260808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6260808);
    });

    // Scenario: game_ops_scenario_6260809_validation_report_count
    it('game_ops_scenario_6260809_validation_report_count', 0, async () => {
      const caseSeed: number = 6260809;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6260809);
    });

    // Scenario: game_ops_scenario_6260810_url_with_query
    it('game_ops_scenario_6260810_url_with_query', 0, async () => {
      const caseSeed: number = 6260810;
      const url: string = SAMPLE_GAME_URL + '?case=42';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6260810);
    });

    // Scenario: game_ops_scenario_6260811_geometry_area
    it('game_ops_scenario_6260811_geometry_area', 0, async () => {
      const caseSeed: number = 6260811;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 61);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6260811);
    });

    // Scenario: game_ops_scenario_6260812_circular_buffer_capacity
    it('game_ops_scenario_6260812_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6260812;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6260812);
    });

    // Scenario: game_ops_scenario_6260813_command_queue_fifo
    it('game_ops_scenario_6260813_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6260813;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6260813);
    });

    // Scenario: game_ops_scenario_6260814_token_bucket_consume
    it('game_ops_scenario_6260814_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6260814;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(6260814);
    });

    // Scenario: game_ops_scenario_6260815_page_load_budget
    it('game_ops_scenario_6260815_page_load_budget', 0, async () => {
      const caseSeed: number = 6260815;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5815);
      expect(record.getDuration()).assertEqual(5815);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6260815);
    });

    // Scenario: game_ops_scenario_6260816_perf_sampler_bounds
    it('game_ops_scenario_6260816_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6260816;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(6260816);
    });

    // Scenario: game_ops_scenario_6260817_config_api_9
    it('game_ops_scenario_6260817_config_api_9', 0, async () => {
      const caseSeed: number = 6260817;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6260817);
    });

    // Scenario: game_ops_scenario_6260818_retry_attempts
    it('game_ops_scenario_6260818_retry_attempts', 0, async () => {
      const caseSeed: number = 6260818;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6260818);
    });

    // Scenario: game_ops_scenario_6260819_event_recorder_sequence
    it('game_ops_scenario_6260819_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6260819;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6260819);
    });

    // Scenario: game_ops_scenario_6260820_session_start_cycles
    it('game_ops_scenario_6260820_session_start_cycles', 0, async () => {
      const caseSeed: number = 6260820;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6260820);
    });

    // Scenario: game_ops_scenario_6260821_paddle_step_sequence
    it('game_ops_scenario_6260821_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6260821;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(6260821);
    });

    // Scenario: game_ops_scenario_6260822_catalog_lookup_start
    it('game_ops_scenario_6260822_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6260822;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6260822);
    });

    // Scenario: game_ops_scenario_6260823_pipeline_round_trip
    it('game_ops_scenario_6260823_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6260823;
      const payload: string = '_main.paddle.moveLeft(); // case 6260823';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6260823);
    });

    // Scenario: game_ops_scenario_6260824_settings_zoom_true
    it('game_ops_scenario_6260824_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6260824;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6260824);
    });

    // Scenario: game_ops_scenario_6260825_layout_custom_columns
    it('game_ops_scenario_6260825_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6260825;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6260825);
    });

  });
}
