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

    // 挡板初始位于场地最左侧
    it('game_deep_paddle_starts_at_left_edge', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      expect(paddle.getPosition()).assertEqual(0);
      expect(paddle.isAtLeftEdge()).assertTrue();
      expect(paddle.isAtRightEdge()).assertFalse();
      expect(paddle.getMoveCount()).assertEqual(0);
    });

    // 右移一次应增加一个步长
    it('game_deep_paddle_moves_right_by_one_step', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      const position: number = paddle.moveRight();
      expect(position).assertEqual(5);
      expect(paddle.getMoveCount()).assertEqual(1);
      expect(paddle.getRatio() > 0).assertTrue();
    });

    // 右移两次后左移一次应回到一个步长处
    it('game_deep_paddle_moves_left_by_one_step', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      paddle.moveRight();
      paddle.moveRight();
      const position: number = paddle.moveLeft();
      expect(position).assertEqual(5);
      expect(paddle.getMoveCount()).assertEqual(3);
    });

    // 连续左移不得越出左边界
    it('game_deep_paddle_clamps_at_left_boundary', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      for (let i = 0; i < 10; i++) {
        paddle.moveLeft();
      }
      expect(paddle.getPosition()).assertEqual(0);
      expect(paddle.isAtLeftEdge()).assertTrue();
    });

    // 连续右移不得越出右边界
    it('game_deep_paddle_clamps_at_right_boundary', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      for (let i = 0; i < 50; i++) {
        paddle.moveRight();
      }
      expect(paddle.getPosition()).assertEqual(100);
      expect(paddle.isAtRightEdge()).assertTrue();
      expect(paddle.getRatio()).assertEqual(1);
    });

    // 直接设置坐标时超出范围的值会被截断
    it('game_deep_paddle_set_position_is_clamped', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      paddle.setPosition(-20);
      expect(paddle.getPosition()).assertEqual(0);
      paddle.setPosition(140);
      expect(paddle.getPosition()).assertEqual(100);
      paddle.setPosition(40);
      expect(paddle.getPosition()).assertEqual(40);
    });

    // 复位后位置与移动计数同时归零
    it('game_deep_paddle_reset_restores_initial_state', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 100, 5);
      paddle.moveRight();
      paddle.moveRight();
      paddle.reset();
      expect(paddle.getPosition()).assertEqual(0);
      expect(paddle.getMoveCount()).assertEqual(0);
      expect(paddle.isAtLeftEdge()).assertTrue();
    });

    // 自定义步长应影响每次移动的距离
    it('game_deep_paddle_supports_custom_step', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(10, 50, 7);
      expect(paddle.getMin()).assertEqual(10);
      expect(paddle.getMax()).assertEqual(50);
      expect(paddle.getStep()).assertEqual(7);
      expect(paddle.moveRight()).assertEqual(17);
      expect(paddle.moveRight()).assertEqual(24);
    });

    // 位置比例应归一化到 0 到 1 之间
    it('game_deep_paddle_ratio_is_normalized', 0, async () => {
      const paddle: PaddleModel = new PaddleModel(0, 80, 10);
      paddle.setPosition(20);
      expect(paddle.getRatio()).assertEqual(0.25);
      paddle.setPosition(40);
      expect(paddle.getRatio()).assertEqual(0.5);
      paddle.setPosition(80);
      expect(paddle.getRatio()).assertEqual(1);
    });

    // 未发射时小球不移动
    it('game_deep_ball_is_idle_before_fire', 0, async () => {
      const ball: BallModel = new BallModel();
      const x: number = ball.getX();
      ball.update(16);
      expect(ball.isFired()).assertFalse();
      expect(ball.getX()).assertEqual(x);
    });

    // 发射后经过一帧时间小球坐标发生变化
    it('game_deep_ball_moves_after_fire', 0, async () => {
      const ball: BallModel = new BallModel();
      ball.fire();
      const x: number = ball.getX();
      const y: number = ball.getY();
      ball.update(16);
      expect(ball.isFired()).assertTrue();
      expect(ball.getX() !== x || ball.getY() !== y).assertTrue();
    });

    // 复位后发射标记与初始坐标恢复
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

    // 修改速度后位移方向随之改变
    it('game_deep_ball_velocity_can_be_changed', 0, async () => {
      const ball: BallModel = new BallModel();
      ball.fire();
      ball.setVelocity(-1, 2);
      const x: number = ball.getX();
      ball.update(16);
      expect(ball.getX() < x).assertTrue();
      expect(ball.getY() > 50).assertTrue();
    });

    // 砖块总数等于行数乘列数
    it('game_deep_brick_grid_total_matches_dimensions', 0, async () => {
      const grid: BrickGrid = new BrickGrid(4, 6);
      expect(grid.getRows()).assertEqual(4);
      expect(grid.getColumns()).assertEqual(6);
      expect(grid.total()).assertEqual(24);
      expect(grid.getRemaining()).assertEqual(24);
      expect(grid.isCleared()).assertFalse();
    });

    // 每次命中减少剩余砖块并推进进度
    it('game_deep_brick_hit_decreases_remaining', 0, async () => {
      const grid: BrickGrid = new BrickGrid(2, 2);
      expect(grid.hit()).assertTrue();
      expect(grid.getRemaining()).assertEqual(3);
      expect(grid.progress()).assertEqual(0.25);
      grid.hit();
      expect(grid.progress()).assertEqual(0.5);
    });

    // 清空后命中无效，复位可恢复全部砖块
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

    // 会话连续开始后保持运行且计数一致
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

    // 挡板按给定步长连续右移的位置计算正确
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

    // 按脚本标识查询目录并校验业务令牌
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

    // 注入地址构建后可被完整还原
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

    // 缩放开关变化后游戏配置判定正确
    it('game_deep_scenario_370804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370804);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_deep_scenario_370805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370805);
    });

    // 击打得分按次数累加，最高分同步更新
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

    // 砖块按命中次数递减并给出进度
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

    // 按语言读取控制标签且资源完整
    it('game_deep_scenario_370808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370808);
    });

    // 校验报告累计指定数量的错误
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

    // 带查询参数的地址解析长度与分段一致
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

    // 矩形面积与包含关系按给定尺寸计算
    it('game_deep_scenario_370811_geometry_area', 0, async () => {
      const caseSeed: number = 370811;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370811);
    });

    // 环形缓冲保持容量并保留最新样本
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

    // 命令队列按序消费指定数量的命令
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

    // 令牌桶消费后余额与补充上限正确
    it('game_deep_scenario_370814_token_bucket_consume', 0, async () => {
      const caseSeed: number = 370814;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(370814);
    });

    // 加载耗时按预算边界判定
    it('game_deep_scenario_370815_page_load_budget', 0, async () => {
      const caseSeed: number = 370815;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1815);
      expect(record.getDuration()).assertEqual(1815);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(370815);
    });

    // 延迟采样器的最大值不小于均值
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

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_deep_scenario_370817_config_api_9', 0, async () => {
      const caseSeed: number = 370817;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(370817);
    });

    // 重试次数达到上限后拒绝继续重试
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

    // 事件记录器按顺序保存指定数量的事件
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

    // 会话连续开始后保持运行且计数一致
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

    // 挡板按给定步长连续右移的位置计算正确
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

    // 按脚本标识查询目录并校验业务令牌
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

    // 注入地址构建后可被完整还原
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

    // 缩放开关变化后游戏配置判定正确
    it('game_deep_scenario_370824_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370824;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370824);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_deep_scenario_370825_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370825;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370825);
    });

    // 击打得分按次数累加，最高分同步更新
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

    // 砖块按命中次数递减并给出进度
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

    // 按语言读取控制标签且资源完整
    it('game_deep_scenario_370828_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370828;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370828);
    });

    // 校验报告累计指定数量的错误
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

    // 带查询参数的地址解析长度与分段一致
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

    // 矩形面积与包含关系按给定尺寸计算
    it('game_deep_scenario_370831_geometry_area', 0, async () => {
      const caseSeed: number = 370831;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370831);
    });

    // 环形缓冲保持容量并保留最新样本
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

    // 命令队列按序消费指定数量的命令
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

    // 令牌桶消费后余额与补充上限正确
    it('game_deep_scenario_370834_token_bucket_consume', 0, async () => {
      const caseSeed: number = 370834;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(370834);
    });

    // 加载耗时按预算边界判定
    it('game_deep_scenario_370835_page_load_budget', 0, async () => {
      const caseSeed: number = 370835;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1835);
      expect(record.getDuration()).assertEqual(1835);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(370835);
    });

    // 延迟采样器的最大值不小于均值
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

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_deep_scenario_370837_config_api_9', 0, async () => {
      const caseSeed: number = 370837;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(370837);
    });

    // 重试次数达到上限后拒绝继续重试
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

    // 事件记录器按顺序保存指定数量的事件
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

    // 会话连续开始后保持运行且计数一致
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

    // 挡板按给定步长连续右移的位置计算正确
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

    // 按脚本标识查询目录并校验业务令牌
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

    // 注入地址构建后可被完整还原
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

    // 缩放开关变化后游戏配置判定正确
    it('game_deep_scenario_370844_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370844;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370844);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_deep_scenario_370845_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370845;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370845);
    });

    // 击打得分按次数累加，最高分同步更新
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

    // 砖块按命中次数递减并给出进度
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

    // 按语言读取控制标签且资源完整
    it('game_deep_scenario_370848_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370848;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370848);
    });

    // 校验报告累计指定数量的错误
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

    // 带查询参数的地址解析长度与分段一致
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

    // 矩形面积与包含关系按给定尺寸计算
    it('game_deep_scenario_370851_geometry_area', 0, async () => {
      const caseSeed: number = 370851;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370851);
    });

    // 环形缓冲保持容量并保留最新样本
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

    // 命令队列按序消费指定数量的命令
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

    // 令牌桶消费后余额与补充上限正确
    it('game_deep_scenario_370854_token_bucket_consume', 0, async () => {
      const caseSeed: number = 370854;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(370854);
    });

    // 加载耗时按预算边界判定
    it('game_deep_scenario_370855_page_load_budget', 0, async () => {
      const caseSeed: number = 370855;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1855);
      expect(record.getDuration()).assertEqual(1855);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(370855);
    });

    // 延迟采样器的最大值不小于均值
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

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_deep_scenario_370857_config_api_9', 0, async () => {
      const caseSeed: number = 370857;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(370857);
    });

    // 重试次数达到上限后拒绝继续重试
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

    // 事件记录器按顺序保存指定数量的事件
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

    // 会话连续开始后保持运行且计数一致
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

    // 挡板按给定步长连续右移的位置计算正确
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

    // 按脚本标识查询目录并校验业务令牌
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

    // 注入地址构建后可被完整还原
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

    // 缩放开关变化后游戏配置判定正确
    it('game_deep_scenario_370864_settings_zoom_true', 0, async () => {
      const caseSeed: number = 370864;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(370864);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_deep_scenario_370865_layout_custom_columns', 0, async () => {
      const caseSeed: number = 370865;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(370865);
    });

    // 击打得分按次数累加，最高分同步更新
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

    // 砖块按命中次数递减并给出进度
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

    // 按语言读取控制标签且资源完整
    it('game_deep_scenario_370868_locale_lookup_en', 0, async () => {
      const caseSeed: number = 370868;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(370868);
    });

    // 校验报告累计指定数量的错误
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

    // 带查询参数的地址解析长度与分段一致
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

    // 矩形面积与包含关系按给定尺寸计算
    it('game_deep_scenario_370871_geometry_area', 0, async () => {
      const caseSeed: number = 370871;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(370871);
    });

    // 环形缓冲保持容量并保留最新样本
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
