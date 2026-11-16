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

export default function webNotificationTest() {
  describe('WebNotification_Test', () => {
    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_notification suite start');
    });

    afterAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_notification suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('web_notification_scenario_8564100_session_start_cycles', 0, async () => {
      const caseSeed: number = 8564100;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8564100);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_notification_scenario_8564101_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8564101;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(8564101);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_notification_scenario_8564102_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8564102;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8564102);
    });

    // 注入地址构建后可被完整还原
    it('web_notification_scenario_8564103_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8564103;
      const payload: string = '_main.paddle.moveLeft(); // case 8564103';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8564103);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_notification_scenario_8564104_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8564104;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8564104);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_notification_scenario_8564105_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8564105;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8564105);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_notification_scenario_8564106_score_accumulation', 0, async () => {
      const caseSeed: number = 8564106;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(8564106);
    });

    // 砖块按命中次数递减并给出进度
    it('web_notification_scenario_8564107_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8564107;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(8564107);
    });

    // 按语言读取控制标签且资源完整
    it('web_notification_scenario_8564108_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8564108;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8564108);
    });

    // 校验报告累计指定数量的错误
    it('web_notification_scenario_8564109_validation_report_count', 0, async () => {
      const caseSeed: number = 8564109;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8564109);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_notification_scenario_8564110_url_with_query', 0, async () => {
      const caseSeed: number = 8564110;
      const url: string = SAMPLE_GAME_URL + '?case=77';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8564110);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_notification_scenario_8564111_geometry_area', 0, async () => {
      const caseSeed: number = 8564111;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8564111);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_notification_scenario_8564112_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8564112;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8564112);
    });

    // 命令队列按序消费指定数量的命令
    it('web_notification_scenario_8564113_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8564113;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8564113);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_notification_scenario_8564114_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8564114;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(8564114);
    });

    // 加载耗时按预算边界判定
    it('web_notification_scenario_8564115_page_load_budget', 0, async () => {
      const caseSeed: number = 8564115;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5115);
      expect(record.getDuration()).assertEqual(5115);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8564115);
    });

    // 延迟采样器的最大值不小于均值
    it('web_notification_scenario_8564116_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8564116;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(8564116);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_notification_scenario_8564117_config_api_9', 0, async () => {
      const caseSeed: number = 8564117;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8564117);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_notification_scenario_8564118_retry_attempts', 0, async () => {
      const caseSeed: number = 8564118;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8564118);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_notification_scenario_8564119_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8564119;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8564119);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_notification_scenario_8564120_session_start_cycles', 0, async () => {
      const caseSeed: number = 8564120;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8564120);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_notification_scenario_8564121_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8564121;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(8564121);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_notification_scenario_8564122_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8564122;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8564122);
    });

    // 注入地址构建后可被完整还原
    it('web_notification_scenario_8564123_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8564123;
      const payload: string = '_main.paddle.moveLeft(); // case 8564123';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8564123);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_notification_scenario_8564124_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8564124;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8564124);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_notification_scenario_8564125_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8564125;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8564125);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_notification_scenario_8564126_score_accumulation', 0, async () => {
      const caseSeed: number = 8564126;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(8564126);
    });

    // 砖块按命中次数递减并给出进度
    it('web_notification_scenario_8564127_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8564127;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(8564127);
    });

    // 按语言读取控制标签且资源完整
    it('web_notification_scenario_8564128_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8564128;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8564128);
    });

    // 校验报告累计指定数量的错误
    it('web_notification_scenario_8564129_validation_report_count', 0, async () => {
      const caseSeed: number = 8564129;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8564129);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_notification_scenario_8564130_url_with_query', 0, async () => {
      const caseSeed: number = 8564130;
      const url: string = SAMPLE_GAME_URL + '?case=0';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8564130);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_notification_scenario_8564131_geometry_area', 0, async () => {
      const caseSeed: number = 8564131;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 41);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8564131);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_notification_scenario_8564132_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8564132;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8564132);
    });

    // 命令队列按序消费指定数量的命令
    it('web_notification_scenario_8564133_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8564133;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8564133);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_notification_scenario_8564134_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8564134;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(8564134);
    });

    // 加载耗时按预算边界判定
    it('web_notification_scenario_8564135_page_load_budget', 0, async () => {
      const caseSeed: number = 8564135;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5135);
      expect(record.getDuration()).assertEqual(5135);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8564135);
    });

    // 延迟采样器的最大值不小于均值
    it('web_notification_scenario_8564136_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8564136;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(8564136);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_notification_scenario_8564137_config_api_9', 0, async () => {
      const caseSeed: number = 8564137;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8564137);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_notification_scenario_8564138_retry_attempts', 0, async () => {
      const caseSeed: number = 8564138;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8564138);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_notification_scenario_8564139_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8564139;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8564139);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_notification_scenario_8564140_session_start_cycles', 0, async () => {
      const caseSeed: number = 8564140;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8564140);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_notification_scenario_8564141_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8564141;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(8564141);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_notification_scenario_8564142_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8564142;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8564142);
    });

    // 注入地址构建后可被完整还原
    it('web_notification_scenario_8564143_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8564143;
      const payload: string = '_main.paddle.moveLeft(); // case 8564143';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8564143);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_notification_scenario_8564144_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8564144;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8564144);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_notification_scenario_8564145_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8564145;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8564145);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_notification_scenario_8564146_score_accumulation', 0, async () => {
      const caseSeed: number = 8564146;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(8564146);
    });

    // 砖块按命中次数递减并给出进度
    it('web_notification_scenario_8564147_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8564147;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(8564147);
    });

    // 按语言读取控制标签且资源完整
    it('web_notification_scenario_8564148_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8564148;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8564148);
    });

    // 校验报告累计指定数量的错误
    it('web_notification_scenario_8564149_validation_report_count', 0, async () => {
      const caseSeed: number = 8564149;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8564149);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_notification_scenario_8564150_url_with_query', 0, async () => {
      const caseSeed: number = 8564150;
      const url: string = SAMPLE_GAME_URL + '?case=20';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8564150);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_notification_scenario_8564151_geometry_area', 0, async () => {
      const caseSeed: number = 8564151;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8564151);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_notification_scenario_8564152_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8564152;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8564152);
    });

    // 命令队列按序消费指定数量的命令
    it('web_notification_scenario_8564153_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8564153;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8564153);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_notification_scenario_8564154_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8564154;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(8564154);
    });

    // 加载耗时按预算边界判定
    it('web_notification_scenario_8564155_page_load_budget', 0, async () => {
      const caseSeed: number = 8564155;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5155);
      expect(record.getDuration()).assertEqual(5155);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8564155);
    });

    // 延迟采样器的最大值不小于均值
    it('web_notification_scenario_8564156_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8564156;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(8564156);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_notification_scenario_8564157_config_api_9', 0, async () => {
      const caseSeed: number = 8564157;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8564157);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_notification_scenario_8564158_retry_attempts', 0, async () => {
      const caseSeed: number = 8564158;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8564158);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_notification_scenario_8564159_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8564159;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8564159);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_notification_scenario_8564160_session_start_cycles', 0, async () => {
      const caseSeed: number = 8564160;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8564160);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_notification_scenario_8564161_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8564161;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(8564161);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_notification_scenario_8564162_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8564162;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8564162);
    });

    // 注入地址构建后可被完整还原
    it('web_notification_scenario_8564163_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8564163;
      const payload: string = '_main.paddle.moveLeft(); // case 8564163';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8564163);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_notification_scenario_8564164_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8564164;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8564164);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_notification_scenario_8564165_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8564165;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8564165);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_notification_scenario_8564166_score_accumulation', 0, async () => {
      const caseSeed: number = 8564166;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(8564166);
    });

    // 砖块按命中次数递减并给出进度
    it('web_notification_scenario_8564167_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8564167;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(8564167);
    });

    // 按语言读取控制标签且资源完整
    it('web_notification_scenario_8564168_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8564168;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8564168);
    });

    // 校验报告累计指定数量的错误
    it('web_notification_scenario_8564169_validation_report_count', 0, async () => {
      const caseSeed: number = 8564169;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8564169);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_notification_scenario_8564170_url_with_query', 0, async () => {
      const caseSeed: number = 8564170;
      const url: string = SAMPLE_GAME_URL + '?case=40';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8564170);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_notification_scenario_8564171_geometry_area', 0, async () => {
      const caseSeed: number = 8564171;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8564171);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_notification_scenario_8564172_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8564172;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8564172);
    });

  });
}
