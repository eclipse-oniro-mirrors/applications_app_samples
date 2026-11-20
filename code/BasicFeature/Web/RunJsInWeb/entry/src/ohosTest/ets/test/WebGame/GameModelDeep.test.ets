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
  INTERNET_PERMISSION,
  ORIENTATION_LANDSCAPE,
  PAGE_LOAD_BUDGET_MS,
  GameScript,
  ScriptCatalog,
  InjectionPipeline,
  GameSession,
  PaddleModel,
  BallModel,
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

export default function gameModelDeepTest() {
  describe('GameModelDeep_Test', () => {
    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_deep suite start');
    });

    afterAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_deep suite end');
    });

    // Scenario: game_deep_paddle_starts_at_left_edge
    it('game_deep_paddle_starts_at_left_edge', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      expect(paddle.getPosition()).assertEqual(0);
      expect(paddle.isAtLeftEdge()).assertTrue();
      expect(paddle.isAtRightEdge()).assertFalse();
      expect(paddle.getMoveCount()).assertEqual(0);
    });

    // Scenario: game_deep_paddle_moves_right_by_one_step
    it('game_deep_paddle_moves_right_by_one_step', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      const position: number = paddle.moveRight();
      expect(position).assertEqual(5);
      expect(paddle.getMoveCount()).assertEqual(1);
      expect(paddle.getRatio() > 0).assertTrue();
    });

    // Scenario: game_deep_paddle_moves_left_by_one_step
    it('game_deep_paddle_moves_left_by_one_step', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      paddle.moveRight();
      paddle.moveRight();
      const position: number = paddle.moveLeft();
      expect(position).assertEqual(5);
      expect(paddle.getMoveCount()).assertEqual(3);
    });

    // Scenario: game_deep_paddle_clamps_at_left_boundary
    it('game_deep_paddle_clamps_at_left_boundary', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      for (let i = 0; i < 10; i++) {
        paddle.moveLeft();
      }
      expect(paddle.getPosition()).assertEqual(0);
      expect(paddle.isAtLeftEdge()).assertTrue();
    });

    // Scenario: game_deep_paddle_clamps_at_right_boundary
    it('game_deep_paddle_clamps_at_right_boundary', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      for (let i = 0; i < 50; i++) {
        paddle.moveRight();
      }
      expect(paddle.getPosition()).assertEqual(100);
      expect(paddle.isAtRightEdge()).assertTrue();
      expect(paddle.getRatio()).assertEqual(1);
    });

    // Scenario: game_deep_paddle_set_position_is_clamped
    it('game_deep_paddle_set_position_is_clamped', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      paddle.setPosition(-20);
      expect(paddle.getPosition()).assertEqual(0);
      paddle.setPosition(140);
      expect(paddle.getPosition()).assertEqual(100);
      paddle.setPosition(40);
      expect(paddle.getPosition()).assertEqual(40);
    });

    // Scenario: game_deep_paddle_reset_restores_initial_state
    it('game_deep_paddle_reset_restores_initial_state', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      paddle.moveRight();
      paddle.moveRight();
      paddle.reset();
      expect(paddle.getPosition()).assertEqual(0);
      expect(paddle.getMoveCount()).assertEqual(0);
      expect(paddle.isAtLeftEdge()).assertTrue();
    });

    // Scenario: game_deep_paddle_supports_custom_step
    it('game_deep_paddle_supports_custom_step', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(10, 50, 7);
      expect(paddle.getMin()).assertEqual(10);
      expect(paddle.getMax()).assertEqual(50);
      expect(paddle.getStep()).assertEqual(7);
      expect(paddle.moveRight()).assertEqual(17);
      expect(paddle.moveRight()).assertEqual(24);
    });

    // Scenario: game_deep_paddle_ratio_is_normalized
    it('game_deep_paddle_ratio_is_normalized', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 80, 10);
      paddle.setPosition(20);
      expect(paddle.getRatio()).assertEqual(0.25);
      paddle.setPosition(40);
      expect(paddle.getRatio()).assertEqual(0.5);
      paddle.setPosition(80);
      expect(paddle.getRatio()).assertEqual(1);
    });

    // Scenario: game_deep_ball_is_idle_before_fire
    it('game_deep_ball_is_idle_before_fire', 0, async () => {
      const ball: BallModel = new BallModel();
      const x: number = ball.getX();
      ball.update(16);
      expect(ball.isFired()).assertFalse();
      expect(ball.getX()).assertEqual(x);
    });

    // Scenario: game_deep_ball_moves_after_fire
    it('game_deep_ball_moves_after_fire', 0, async () => {
      const ball: BallModel = new BallModel();
      ball.fire();
      const x: number = ball.getX();
      const y: number = ball.getY();
      ball.update(16);
      expect(ball.isFired()).assertTrue();
      expect(ball.getX() !== x || ball.getY() !== y).assertTrue();
    });

    // Scenario: game_deep_ball_reset_restores_position
    it('game_deep_ball_reset_restores_position', 0, async () => {
      const ball: BallModel = new BallModel();
      ball.fire();
      ball.update(32);
      ball.reset();
      expect(ball.isFired()).assertFalse();
      expect(ball.getX()).assertEqual(50);
      expect(ball.getY()).assertEqual(50);
      expect(ball.getVelocityX()).assertEqual(2);
    });

    // Scenario: game_deep_ball_velocity_can_be_changed
    it('game_deep_ball_velocity_can_be_changed', 0, async () => {
      const ball: BallModel = new BallModel();
      ball.fire();
      ball.setVelocity(-1, 2);
      const x: number = ball.getX();
      ball.update(16);
      expect(ball.getX() < x).assertTrue();
      expect(ball.getY() > 50).assertTrue();
    });

    // Scenario: game_deep_brick_grid_total_matches_dimensions
    it('game_deep_brick_grid_total_matches_dimensions', 0, async () => {
      const grid: BrickGrid = new BrickGrid(4, 6);
      expect(grid.getRows()).assertEqual(4);
      expect(grid.getColumns()).assertEqual(6);
      expect(grid.total()).assertEqual(24);
      expect(grid.getRemaining()).assertEqual(24);
      expect(grid.isCleared()).assertFalse();
    });

    // Scenario: game_deep_brick_hit_decreases_remaining
    it('game_deep_brick_hit_decreases_remaining', 0, async () => {
      const grid: BrickGrid = new BrickGrid(2, 2);
      expect(grid.hit()).assertTrue();
      expect(grid.getRemaining()).assertEqual(3);
      expect(grid.progress()).assertEqual(0.25);
      grid.hit();
      expect(grid.progress()).assertEqual(0.5);
    });

    // Scenario: game_deep_cleared_grid_rejects_hits_and_can_reset
    it('game_deep_cleared_grid_rejects_hits_and_can_reset', 0, async () => {
      const grid: BrickGrid = new BrickGrid(1, 2);
      grid.hit();
      grid.hit();
      expect(grid.isCleared()).assertTrue();
      expect(grid.hit()).assertFalse();
      expect(grid.progress()).assertEqual(1);
      grid.reset();
      expect(grid.getRemaining()).assertEqual(2);
    });

    // Scenario: game_deep_scenario_370800_session_start_cycles
    it('game_deep_scenario_370800_session_start_cycles', 0, async () => {
      const caseSeed: number = 370800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(370800);
    });

    // Scenario: game_deep_scenario_370801_paddle_step_sequence
    it('game_deep_scenario_370801_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 370801;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(370801);
    });

    // Scenario: game_deep_scenario_370802_catalog_lookup_start
    it('game_deep_scenario_370802_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 370802;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(370802);
    });

    // Scenario: game_deep_scenario_370803_pipeline_round_trip
    it('game_deep_scenario_370803_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 370803;
      const payload: string = '_main.paddle.moveLeft(); // case 370803';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(370803);
    });

    // Scenario: game_deep_scenario_370804_settings_zoom_true
    it('game_deep_scenario_370804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370804);
    });

    // Scenario: game_deep_scenario_370805_layout_custom_columns
    it('game_deep_scenario_370805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370805);
    });

    // Scenario: game_deep_scenario_370806_score_accumulation
    it('game_deep_scenario_370806_score_accumulation', 0, async () => {
      const caseSeed: number = 370806;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(370806);
    });

    // Scenario: game_deep_scenario_370807_brick_grid_progress
    it('game_deep_scenario_370807_brick_grid_progress', 0, async () => {
      const caseSeed: number = 370807;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(370807);
    });

    // Scenario: game_deep_scenario_370808_locale_lookup_en
    it('game_deep_scenario_370808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370808);
    });

    // Scenario: game_deep_scenario_370809_validation_report_count
    it('game_deep_scenario_370809_validation_report_count', 0, async () => {
      const caseSeed: number = 370809;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(370809);
    });

    // Scenario: game_deep_scenario_370810_url_with_query
    it('game_deep_scenario_370810_url_with_query', 0, async () => {
      const caseSeed: number = 370810;
      const url: string = SAMPLE_GAME_URL + '?case=76';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(370810);
    });

    // Scenario: game_deep_scenario_370811_geometry_area
    it('game_deep_scenario_370811_geometry_area', 0, async () => {
      const caseSeed: number = 370811;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370811);
    });

    // Scenario: game_deep_scenario_370812_circular_buffer_capacity
    it('game_deep_scenario_370812_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 370812;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(370812);
    });

    // Scenario: game_deep_scenario_370813_command_queue_fifo
    it('game_deep_scenario_370813_command_queue_fifo', 0, async () => {
      const caseSeed: number = 370813;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(370813);
    });

    // Scenario: game_deep_scenario_370814_token_bucket_consume
    it('game_deep_scenario_370814_token_bucket_consume', 0, async () => {
      const caseSeed: number = 370814;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(370814);
    });

    // Scenario: game_deep_scenario_370815_page_load_budget
    it('game_deep_scenario_370815_page_load_budget', 0, async () => {
      const caseSeed: number = 370815;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1815);
      expect(record.getDuration()).assertEqual(1815);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(370815);
    });

    // Scenario: game_deep_scenario_370816_perf_sampler_bounds
    it('game_deep_scenario_370816_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 370816;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(370816);
    });

    // Scenario: game_deep_scenario_370817_config_api_9
    it('game_deep_scenario_370817_config_api_9', 0, async () => {
      const caseSeed: number = 370817;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(370817);
    });

    // Scenario: game_deep_scenario_370818_retry_attempts
    it('game_deep_scenario_370818_retry_attempts', 0, async () => {
      const caseSeed: number = 370818;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(370818);
    });

    // Scenario: game_deep_scenario_370819_event_recorder_sequence
    it('game_deep_scenario_370819_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 370819;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(370819);
    });

    // Scenario: game_deep_scenario_370820_session_start_cycles
    it('game_deep_scenario_370820_session_start_cycles', 0, async () => {
      const caseSeed: number = 370820;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(370820);
    });

    // Scenario: game_deep_scenario_370821_paddle_step_sequence
    it('game_deep_scenario_370821_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 370821;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(370821);
    });

    // Scenario: game_deep_scenario_370822_catalog_lookup_start
    it('game_deep_scenario_370822_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 370822;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(370822);
    });

    // Scenario: game_deep_scenario_370823_pipeline_round_trip
    it('game_deep_scenario_370823_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 370823;
      const payload: string = '_main.paddle.moveLeft(); // case 370823';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(370823);
    });

    // Scenario: game_deep_scenario_370824_settings_zoom_true
    it('game_deep_scenario_370824_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370824;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370824);
    });

    // Scenario: game_deep_scenario_370825_layout_custom_columns
    it('game_deep_scenario_370825_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370825;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370825);
    });

    // Scenario: game_deep_scenario_370826_score_accumulation
    it('game_deep_scenario_370826_score_accumulation', 0, async () => {
      const caseSeed: number = 370826;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(370826);
    });

    // Scenario: game_deep_scenario_370827_brick_grid_progress
    it('game_deep_scenario_370827_brick_grid_progress', 0, async () => {
      const caseSeed: number = 370827;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(370827);
    });

    // Scenario: game_deep_scenario_370828_locale_lookup_en
    it('game_deep_scenario_370828_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370828;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370828);
    });

    // Scenario: game_deep_scenario_370829_validation_report_count
    it('game_deep_scenario_370829_validation_report_count', 0, async () => {
      const caseSeed: number = 370829;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(370829);
    });

    // Scenario: game_deep_scenario_370830_url_with_query
    it('game_deep_scenario_370830_url_with_query', 0, async () => {
      const caseSeed: number = 370830;
      const url: string = SAMPLE_GAME_URL + '?case=96';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(370830);
    });

    // Scenario: game_deep_scenario_370831_geometry_area
    it('game_deep_scenario_370831_geometry_area', 0, async () => {
      const caseSeed: number = 370831;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370831);
    });

    // Scenario: game_deep_scenario_370832_circular_buffer_capacity
    it('game_deep_scenario_370832_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 370832;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(370832);
    });

    // Scenario: game_deep_scenario_370833_command_queue_fifo
    it('game_deep_scenario_370833_command_queue_fifo', 0, async () => {
      const caseSeed: number = 370833;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(370833);
    });

    // Scenario: game_deep_scenario_370834_token_bucket_consume
    it('game_deep_scenario_370834_token_bucket_consume', 0, async () => {
      const caseSeed: number = 370834;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(370834);
    });

    // Scenario: game_deep_scenario_370835_page_load_budget
    it('game_deep_scenario_370835_page_load_budget', 0, async () => {
      const caseSeed: number = 370835;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1835);
      expect(record.getDuration()).assertEqual(1835);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(370835);
    });

    // Scenario: game_deep_scenario_370836_perf_sampler_bounds
    it('game_deep_scenario_370836_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 370836;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(370836);
    });

    // Scenario: game_deep_scenario_370837_config_api_9
    it('game_deep_scenario_370837_config_api_9', 0, async () => {
      const caseSeed: number = 370837;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(370837);
    });

    // Scenario: game_deep_scenario_370838_retry_attempts
    it('game_deep_scenario_370838_retry_attempts', 0, async () => {
      const caseSeed: number = 370838;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(370838);
    });

    // Scenario: game_deep_scenario_370839_event_recorder_sequence
    it('game_deep_scenario_370839_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 370839;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(370839);
    });

    // Scenario: game_deep_scenario_370840_session_start_cycles
    it('game_deep_scenario_370840_session_start_cycles', 0, async () => {
      const caseSeed: number = 370840;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(370840);
    });

    // Scenario: game_deep_scenario_370841_paddle_step_sequence
    it('game_deep_scenario_370841_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 370841;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(370841);
    });

    // Scenario: game_deep_scenario_370842_catalog_lookup_start
    it('game_deep_scenario_370842_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 370842;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(370842);
    });

    // Scenario: game_deep_scenario_370843_pipeline_round_trip
    it('game_deep_scenario_370843_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 370843;
      const payload: string = '_main.paddle.moveLeft(); // case 370843';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(370843);
    });

    // Scenario: game_deep_scenario_370844_settings_zoom_true
    it('game_deep_scenario_370844_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370844;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370844);
    });

    // Scenario: game_deep_scenario_370845_layout_custom_columns
    it('game_deep_scenario_370845_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370845;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370845);
    });

    // Scenario: game_deep_scenario_370846_score_accumulation
    it('game_deep_scenario_370846_score_accumulation', 0, async () => {
      const caseSeed: number = 370846;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(370846);
    });

    // Scenario: game_deep_scenario_370847_brick_grid_progress
    it('game_deep_scenario_370847_brick_grid_progress', 0, async () => {
      const caseSeed: number = 370847;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(370847);
    });

    // Scenario: game_deep_scenario_370848_locale_lookup_en
    it('game_deep_scenario_370848_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370848;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370848);
    });

    // Scenario: game_deep_scenario_370849_validation_report_count
    it('game_deep_scenario_370849_validation_report_count', 0, async () => {
      const caseSeed: number = 370849;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(370849);
    });

    // Scenario: game_deep_scenario_370850_url_with_query
    it('game_deep_scenario_370850_url_with_query', 0, async () => {
      const caseSeed: number = 370850;
      const url: string = SAMPLE_GAME_URL + '?case=19';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(370850);
    });

    // Scenario: game_deep_scenario_370851_geometry_area
    it('game_deep_scenario_370851_geometry_area', 0, async () => {
      const caseSeed: number = 370851;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370851);
    });

    // Scenario: game_deep_scenario_370852_circular_buffer_capacity
    it('game_deep_scenario_370852_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 370852;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(370852);
    });

    // Scenario: game_deep_scenario_370853_command_queue_fifo
    it('game_deep_scenario_370853_command_queue_fifo', 0, async () => {
      const caseSeed: number = 370853;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(370853);
    });

    // Scenario: game_deep_scenario_370854_token_bucket_consume
    it('game_deep_scenario_370854_token_bucket_consume', 0, async () => {
      const caseSeed: number = 370854;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(370854);
    });

    // Scenario: game_deep_scenario_370855_page_load_budget
    it('game_deep_scenario_370855_page_load_budget', 0, async () => {
      const caseSeed: number = 370855;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1855);
      expect(record.getDuration()).assertEqual(1855);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(370855);
    });

    // Scenario: game_deep_scenario_370856_perf_sampler_bounds
    it('game_deep_scenario_370856_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 370856;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(370856);
    });

    // Scenario: game_deep_scenario_370857_config_api_9
    it('game_deep_scenario_370857_config_api_9', 0, async () => {
      const caseSeed: number = 370857;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(370857);
    });

    // Scenario: game_deep_scenario_370858_retry_attempts
    it('game_deep_scenario_370858_retry_attempts', 0, async () => {
      const caseSeed: number = 370858;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(370858);
    });

    // Scenario: game_deep_scenario_370859_event_recorder_sequence
    it('game_deep_scenario_370859_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 370859;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(370859);
    });

    // Scenario: game_deep_scenario_370860_session_start_cycles
    it('game_deep_scenario_370860_session_start_cycles', 0, async () => {
      const caseSeed: number = 370860;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(370860);
    });

    // Scenario: game_deep_scenario_370861_paddle_step_sequence
    it('game_deep_scenario_370861_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 370861;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(370861);
    });

    // Scenario: game_deep_scenario_370862_catalog_lookup_start
    it('game_deep_scenario_370862_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 370862;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(370862);
    });

    // Scenario: game_deep_scenario_370863_pipeline_round_trip
    it('game_deep_scenario_370863_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 370863;
      const payload: string = '_main.paddle.moveLeft(); // case 370863';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(370863);
    });

    // Scenario: game_deep_scenario_370864_settings_zoom_true
    it('game_deep_scenario_370864_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370864;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370864);
    });

    // Scenario: game_deep_scenario_370865_layout_custom_columns
    it('game_deep_scenario_370865_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370865;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370865);
    });

    // Scenario: game_deep_scenario_370866_score_accumulation
    it('game_deep_scenario_370866_score_accumulation', 0, async () => {
      const caseSeed: number = 370866;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(370866);
    });

    // Scenario: game_deep_scenario_370867_brick_grid_progress
    it('game_deep_scenario_370867_brick_grid_progress', 0, async () => {
      const caseSeed: number = 370867;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(370867);
    });

    // Scenario: game_deep_scenario_370868_locale_lookup_en
    it('game_deep_scenario_370868_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370868;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370868);
    });

    // Scenario: game_deep_scenario_370869_validation_report_count
    it('game_deep_scenario_370869_validation_report_count', 0, async () => {
      const caseSeed: number = 370869;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(370869);
    });

    // Scenario: game_deep_scenario_370870_url_with_query
    it('game_deep_scenario_370870_url_with_query', 0, async () => {
      const caseSeed: number = 370870;
      const url: string = SAMPLE_GAME_URL + '?case=39';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(370870);
    });

    // Scenario: game_deep_scenario_370871_geometry_area
    it('game_deep_scenario_370871_geometry_area', 0, async () => {
      const caseSeed: number = 370871;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370871);
    });

    // Scenario: game_deep_scenario_370872_circular_buffer_capacity
    it('game_deep_scenario_370872_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 370872;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(370872);
    });

  });
}
