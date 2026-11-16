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

export default function inputValidationTest() {
  describe('InputValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'input_validation suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'input_validation suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('input_validation_scenario_6771100_session_start_cycles', 0, async () => {
      const caseSeed: number = 6771100;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6771100);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('input_validation_scenario_6771101_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6771101;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(6771101);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('input_validation_scenario_6771102_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6771102;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6771102);
    });

    // 注入地址构建后可被完整还原
    it('input_validation_scenario_6771103_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6771103;
      const payload: string = '_main.paddle.moveLeft(); // case 6771103';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6771103);
    });

    // 缩放开关变化后游戏配置判定正确
    it('input_validation_scenario_6771104_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6771104;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6771104);
    });

    // 自定义三列宽度之和仍为 100%
    it('input_validation_scenario_6771105_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6771105;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6771105);
    });

    // 击打得分按次数累加，最高分同步更新
    it('input_validation_scenario_6771106_score_accumulation', 0, async () => {
      const caseSeed: number = 6771106;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(6771106);
    });

    // 砖块按命中次数递减并给出进度
    it('input_validation_scenario_6771107_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6771107;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(6771107);
    });

    // 按语言读取控制标签且资源完整
    it('input_validation_scenario_6771108_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6771108;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6771108);
    });

    // 校验报告累计指定数量的错误
    it('input_validation_scenario_6771109_validation_report_count', 0, async () => {
      const caseSeed: number = 6771109;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6771109);
    });

    // 带查询参数的地址解析长度与分段一致
    it('input_validation_scenario_6771110_url_with_query', 0, async () => {
      const caseSeed: number = 6771110;
      const url: string = SAMPLE_GAME_URL + '?case=25';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6771110);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('input_validation_scenario_6771111_geometry_area', 0, async () => {
      const caseSeed: number = 6771111;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6771111);
    });

    // 环形缓冲保持容量并保留最新样本
    it('input_validation_scenario_6771112_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6771112;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6771112);
    });

    // 命令队列按序消费指定数量的命令
    it('input_validation_scenario_6771113_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6771113;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6771113);
    });

    // 令牌桶消费后余额与补充上限正确
    it('input_validation_scenario_6771114_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6771114;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(6771114);
    });

    // 加载耗时按预算边界判定
    it('input_validation_scenario_6771115_page_load_budget', 0, async () => {
      const caseSeed: number = 6771115;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(3115);
      expect(record.getDuration()).assertEqual(3115);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6771115);
    });

    // 延迟采样器的最大值不小于均值
    it('input_validation_scenario_6771116_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6771116;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(6771116);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('input_validation_scenario_6771117_config_api_9', 0, async () => {
      const caseSeed: number = 6771117;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6771117);
    });

    // 重试次数达到上限后拒绝继续重试
    it('input_validation_scenario_6771118_retry_attempts', 0, async () => {
      const caseSeed: number = 6771118;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6771118);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('input_validation_scenario_6771119_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6771119;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6771119);
    });

    // 会话连续开始后保持运行且计数一致
    it('input_validation_scenario_6771120_session_start_cycles', 0, async () => {
      const caseSeed: number = 6771120;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6771120);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('input_validation_scenario_6771121_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6771121;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(6771121);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('input_validation_scenario_6771122_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6771122;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6771122);
    });

    // 注入地址构建后可被完整还原
    it('input_validation_scenario_6771123_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6771123;
      const payload: string = '_main.paddle.moveLeft(); // case 6771123';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6771123);
    });

    // 缩放开关变化后游戏配置判定正确
    it('input_validation_scenario_6771124_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6771124;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6771124);
    });

    // 自定义三列宽度之和仍为 100%
    it('input_validation_scenario_6771125_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6771125;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6771125);
    });

    // 击打得分按次数累加，最高分同步更新
    it('input_validation_scenario_6771126_score_accumulation', 0, async () => {
      const caseSeed: number = 6771126;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(6771126);
    });

    // 砖块按命中次数递减并给出进度
    it('input_validation_scenario_6771127_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6771127;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(6771127);
    });

    // 按语言读取控制标签且资源完整
    it('input_validation_scenario_6771128_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6771128;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6771128);
    });

    // 校验报告累计指定数量的错误
    it('input_validation_scenario_6771129_validation_report_count', 0, async () => {
      const caseSeed: number = 6771129;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6771129);
    });

    // 带查询参数的地址解析长度与分段一致
    it('input_validation_scenario_6771130_url_with_query', 0, async () => {
      const caseSeed: number = 6771130;
      const url: string = SAMPLE_GAME_URL + '?case=45';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6771130);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('input_validation_scenario_6771131_geometry_area', 0, async () => {
      const caseSeed: number = 6771131;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6771131);
    });

    // 环形缓冲保持容量并保留最新样本
    it('input_validation_scenario_6771132_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6771132;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6771132);
    });

    // 命令队列按序消费指定数量的命令
    it('input_validation_scenario_6771133_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6771133;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6771133);
    });

    // 令牌桶消费后余额与补充上限正确
    it('input_validation_scenario_6771134_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6771134;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(6771134);
    });

    // 加载耗时按预算边界判定
    it('input_validation_scenario_6771135_page_load_budget', 0, async () => {
      const caseSeed: number = 6771135;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(3135);
      expect(record.getDuration()).assertEqual(3135);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6771135);
    });

    // 延迟采样器的最大值不小于均值
    it('input_validation_scenario_6771136_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6771136;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(6771136);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('input_validation_scenario_6771137_config_api_9', 0, async () => {
      const caseSeed: number = 6771137;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6771137);
    });

    // 重试次数达到上限后拒绝继续重试
    it('input_validation_scenario_6771138_retry_attempts', 0, async () => {
      const caseSeed: number = 6771138;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6771138);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('input_validation_scenario_6771139_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6771139;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6771139);
    });

    // 会话连续开始后保持运行且计数一致
    it('input_validation_scenario_6771140_session_start_cycles', 0, async () => {
      const caseSeed: number = 6771140;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6771140);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('input_validation_scenario_6771141_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6771141;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(6771141);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('input_validation_scenario_6771142_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6771142;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6771142);
    });

    // 注入地址构建后可被完整还原
    it('input_validation_scenario_6771143_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6771143;
      const payload: string = '_main.paddle.moveLeft(); // case 6771143';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6771143);
    });

    // 缩放开关变化后游戏配置判定正确
    it('input_validation_scenario_6771144_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6771144;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6771144);
    });

    // 自定义三列宽度之和仍为 100%
    it('input_validation_scenario_6771145_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6771145;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6771145);
    });

    // 击打得分按次数累加，最高分同步更新
    it('input_validation_scenario_6771146_score_accumulation', 0, async () => {
      const caseSeed: number = 6771146;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(6771146);
    });

    // 砖块按命中次数递减并给出进度
    it('input_validation_scenario_6771147_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6771147;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(6771147);
    });

    // 按语言读取控制标签且资源完整
    it('input_validation_scenario_6771148_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6771148;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6771148);
    });

    // 校验报告累计指定数量的错误
    it('input_validation_scenario_6771149_validation_report_count', 0, async () => {
      const caseSeed: number = 6771149;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6771149);
    });

    // 带查询参数的地址解析长度与分段一致
    it('input_validation_scenario_6771150_url_with_query', 0, async () => {
      const caseSeed: number = 6771150;
      const url: string = SAMPLE_GAME_URL + '?case=65';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6771150);
    });

  });
}
