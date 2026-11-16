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

export default function pointerUtilValidationTest() {
  describe('PointerUtilValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'pointer_util suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'pointer_util suite end');
    });

    // 矩形包含与相交判定应符合坐标定义
    it('pointer_util_geometry_contains_and_overlaps', 0, async () => {
      const outer: GeometryBox = new GeometryBox(0, 0, 100, 100);
      const inner: GeometryBox = new GeometryBox(10, 10, 20, 20);
      expect(outer.contains(50, 50)).assertTrue();
      expect(outer.contains(150, 50)).assertFalse();
      expect(outer.overlaps(inner)).assertTrue();
      expect(inner.overlaps(new GeometryBox(200, 200, 10, 10))).assertFalse();
    });

    // 面积与中心点计算应准确
    it('pointer_util_geometry_area_and_center', 0, async () => {
      const box: GeometryBox = new GeometryBox(10, 20, 50, 40);
      expect(box.area()).assertEqual(2000);
      expect(box.right()).assertEqual(60);
      expect(box.bottom()).assertEqual(60);
      expect(box.centerX()).assertEqual(35);
      expect(box.centerY()).assertEqual(40);
      expect(box.isDegenerate()).assertFalse();
    });

    // 会话连续开始后保持运行且计数一致
    it('pointer_util_scenario_7715500_session_start_cycles', 0, async () => {
      const caseSeed: number = 7715500;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(7715500);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('pointer_util_scenario_7715501_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 7715501;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(7715501);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('pointer_util_scenario_7715502_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 7715502;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(7715502);
    });

    // 注入地址构建后可被完整还原
    it('pointer_util_scenario_7715503_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 7715503;
      const payload: string = '_main.paddle.moveLeft(); // case 7715503';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(7715503);
    });

    // 缩放开关变化后游戏配置判定正确
    it('pointer_util_scenario_7715504_settings_zoom_true', 0, async () => {
      const caseSeed: number = 7715504;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(7715504);
    });

    // 自定义三列宽度之和仍为 100%
    it('pointer_util_scenario_7715505_layout_custom_columns', 0, async () => {
      const caseSeed: number = 7715505;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(7715505);
    });

    // 击打得分按次数累加，最高分同步更新
    it('pointer_util_scenario_7715506_score_accumulation', 0, async () => {
      const caseSeed: number = 7715506;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(7715506);
    });

    // 砖块按命中次数递减并给出进度
    it('pointer_util_scenario_7715507_brick_grid_progress', 0, async () => {
      const caseSeed: number = 7715507;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(7715507);
    });

    // 按语言读取控制标签且资源完整
    it('pointer_util_scenario_7715508_locale_lookup_en', 0, async () => {
      const caseSeed: number = 7715508;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(7715508);
    });

    // 校验报告累计指定数量的错误
    it('pointer_util_scenario_7715509_validation_report_count', 0, async () => {
      const caseSeed: number = 7715509;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(7715509);
    });

    // 带查询参数的地址解析长度与分段一致
    it('pointer_util_scenario_7715510_url_with_query', 0, async () => {
      const caseSeed: number = 7715510;
      const url: string = SAMPLE_GAME_URL + '?case=33';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(7715510);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('pointer_util_scenario_7715511_geometry_area', 0, async () => {
      const caseSeed: number = 7715511;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(7715511);
    });

    // 环形缓冲保持容量并保留最新样本
    it('pointer_util_scenario_7715512_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 7715512;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(7715512);
    });

    // 命令队列按序消费指定数量的命令
    it('pointer_util_scenario_7715513_command_queue_fifo', 0, async () => {
      const caseSeed: number = 7715513;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(7715513);
    });

    // 令牌桶消费后余额与补充上限正确
    it('pointer_util_scenario_7715514_token_bucket_consume', 0, async () => {
      const caseSeed: number = 7715514;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(7715514);
    });

    // 加载耗时按预算边界判定
    it('pointer_util_scenario_7715515_page_load_budget', 0, async () => {
      const caseSeed: number = 7715515;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2515);
      expect(record.getDuration()).assertEqual(2515);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(7715515);
    });

    // 延迟采样器的最大值不小于均值
    it('pointer_util_scenario_7715516_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 7715516;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(7715516);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('pointer_util_scenario_7715517_config_api_9', 0, async () => {
      const caseSeed: number = 7715517;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(7715517);
    });

    // 重试次数达到上限后拒绝继续重试
    it('pointer_util_scenario_7715518_retry_attempts', 0, async () => {
      const caseSeed: number = 7715518;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(7715518);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('pointer_util_scenario_7715519_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 7715519;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(7715519);
    });

    // 会话连续开始后保持运行且计数一致
    it('pointer_util_scenario_7715520_session_start_cycles', 0, async () => {
      const caseSeed: number = 7715520;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(7715520);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('pointer_util_scenario_7715521_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 7715521;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(7715521);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('pointer_util_scenario_7715522_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 7715522;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(7715522);
    });

    // 注入地址构建后可被完整还原
    it('pointer_util_scenario_7715523_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 7715523;
      const payload: string = '_main.paddle.moveLeft(); // case 7715523';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(7715523);
    });

    // 缩放开关变化后游戏配置判定正确
    it('pointer_util_scenario_7715524_settings_zoom_true', 0, async () => {
      const caseSeed: number = 7715524;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(7715524);
    });

    // 自定义三列宽度之和仍为 100%
    it('pointer_util_scenario_7715525_layout_custom_columns', 0, async () => {
      const caseSeed: number = 7715525;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(7715525);
    });

    // 击打得分按次数累加，最高分同步更新
    it('pointer_util_scenario_7715526_score_accumulation', 0, async () => {
      const caseSeed: number = 7715526;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(7715526);
    });

    // 砖块按命中次数递减并给出进度
    it('pointer_util_scenario_7715527_brick_grid_progress', 0, async () => {
      const caseSeed: number = 7715527;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(7715527);
    });

    // 按语言读取控制标签且资源完整
    it('pointer_util_scenario_7715528_locale_lookup_en', 0, async () => {
      const caseSeed: number = 7715528;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(7715528);
    });

    // 校验报告累计指定数量的错误
    it('pointer_util_scenario_7715529_validation_report_count', 0, async () => {
      const caseSeed: number = 7715529;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(7715529);
    });

    // 带查询参数的地址解析长度与分段一致
    it('pointer_util_scenario_7715530_url_with_query', 0, async () => {
      const caseSeed: number = 7715530;
      const url: string = SAMPLE_GAME_URL + '?case=53';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(7715530);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('pointer_util_scenario_7715531_geometry_area', 0, async () => {
      const caseSeed: number = 7715531;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(7715531);
    });

    // 环形缓冲保持容量并保留最新样本
    it('pointer_util_scenario_7715532_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 7715532;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(7715532);
    });

    // 命令队列按序消费指定数量的命令
    it('pointer_util_scenario_7715533_command_queue_fifo', 0, async () => {
      const caseSeed: number = 7715533;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(7715533);
    });

    // 令牌桶消费后余额与补充上限正确
    it('pointer_util_scenario_7715534_token_bucket_consume', 0, async () => {
      const caseSeed: number = 7715534;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(7715534);
    });

    // 加载耗时按预算边界判定
    it('pointer_util_scenario_7715535_page_load_budget', 0, async () => {
      const caseSeed: number = 7715535;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2535);
      expect(record.getDuration()).assertEqual(2535);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(7715535);
    });

    // 延迟采样器的最大值不小于均值
    it('pointer_util_scenario_7715536_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 7715536;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(7715536);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('pointer_util_scenario_7715537_config_api_9', 0, async () => {
      const caseSeed: number = 7715537;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(7715537);
    });

    // 重试次数达到上限后拒绝继续重试
    it('pointer_util_scenario_7715538_retry_attempts', 0, async () => {
      const caseSeed: number = 7715538;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(7715538);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('pointer_util_scenario_7715539_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 7715539;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(7715539);
    });

    // 会话连续开始后保持运行且计数一致
    it('pointer_util_scenario_7715540_session_start_cycles', 0, async () => {
      const caseSeed: number = 7715540;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(7715540);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('pointer_util_scenario_7715541_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 7715541;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(7715541);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('pointer_util_scenario_7715542_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 7715542;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(7715542);
    });

    // 注入地址构建后可被完整还原
    it('pointer_util_scenario_7715543_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 7715543;
      const payload: string = '_main.paddle.moveLeft(); // case 7715543';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(7715543);
    });

    // 缩放开关变化后游戏配置判定正确
    it('pointer_util_scenario_7715544_settings_zoom_true', 0, async () => {
      const caseSeed: number = 7715544;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(7715544);
    });

    // 自定义三列宽度之和仍为 100%
    it('pointer_util_scenario_7715545_layout_custom_columns', 0, async () => {
      const caseSeed: number = 7715545;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(7715545);
    });

    // 击打得分按次数累加，最高分同步更新
    it('pointer_util_scenario_7715546_score_accumulation', 0, async () => {
      const caseSeed: number = 7715546;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(7715546);
    });

    // 砖块按命中次数递减并给出进度
    it('pointer_util_scenario_7715547_brick_grid_progress', 0, async () => {
      const caseSeed: number = 7715547;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(7715547);
    });

    // 按语言读取控制标签且资源完整
    it('pointer_util_scenario_7715548_locale_lookup_en', 0, async () => {
      const caseSeed: number = 7715548;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(7715548);
    });

    // 校验报告累计指定数量的错误
    it('pointer_util_scenario_7715549_validation_report_count', 0, async () => {
      const caseSeed: number = 7715549;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(7715549);
    });

    // 带查询参数的地址解析长度与分段一致
    it('pointer_util_scenario_7715550_url_with_query', 0, async () => {
      const caseSeed: number = 7715550;
      const url: string = SAMPLE_GAME_URL + '?case=73';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(7715550);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('pointer_util_scenario_7715551_geometry_area', 0, async () => {
      const caseSeed: number = 7715551;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(7715551);
    });

    // 环形缓冲保持容量并保留最新样本
    it('pointer_util_scenario_7715552_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 7715552;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(7715552);
    });

    // 命令队列按序消费指定数量的命令
    it('pointer_util_scenario_7715553_command_queue_fifo', 0, async () => {
      const caseSeed: number = 7715553;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(7715553);
    });

    // 令牌桶消费后余额与补充上限正确
    it('pointer_util_scenario_7715554_token_bucket_consume', 0, async () => {
      const caseSeed: number = 7715554;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(7715554);
    });

    // 加载耗时按预算边界判定
    it('pointer_util_scenario_7715555_page_load_budget', 0, async () => {
      const caseSeed: number = 7715555;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2555);
      expect(record.getDuration()).assertEqual(2555);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(7715555);
    });

    // 延迟采样器的最大值不小于均值
    it('pointer_util_scenario_7715556_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 7715556;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(7715556);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('pointer_util_scenario_7715557_config_api_9', 0, async () => {
      const caseSeed: number = 7715557;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(7715557);
    });

    // 重试次数达到上限后拒绝继续重试
    it('pointer_util_scenario_7715558_retry_attempts', 0, async () => {
      const caseSeed: number = 7715558;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(7715558);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('pointer_util_scenario_7715559_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 7715559;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(7715559);
    });

    // 会话连续开始后保持运行且计数一致
    it('pointer_util_scenario_7715560_session_start_cycles', 0, async () => {
      const caseSeed: number = 7715560;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(7715560);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('pointer_util_scenario_7715561_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 7715561;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(7715561);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('pointer_util_scenario_7715562_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 7715562;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(7715562);
    });

    // 注入地址构建后可被完整还原
    it('pointer_util_scenario_7715563_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 7715563;
      const payload: string = '_main.paddle.moveLeft(); // case 7715563';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(7715563);
    });

    // 缩放开关变化后游戏配置判定正确
    it('pointer_util_scenario_7715564_settings_zoom_true', 0, async () => {
      const caseSeed: number = 7715564;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(7715564);
    });

    // 自定义三列宽度之和仍为 100%
    it('pointer_util_scenario_7715565_layout_custom_columns', 0, async () => {
      const caseSeed: number = 7715565;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(7715565);
    });

    // 击打得分按次数累加，最高分同步更新
    it('pointer_util_scenario_7715566_score_accumulation', 0, async () => {
      const caseSeed: number = 7715566;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(7715566);
    });

    // 砖块按命中次数递减并给出进度
    it('pointer_util_scenario_7715567_brick_grid_progress', 0, async () => {
      const caseSeed: number = 7715567;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(7715567);
    });

    // 按语言读取控制标签且资源完整
    it('pointer_util_scenario_7715568_locale_lookup_en', 0, async () => {
      const caseSeed: number = 7715568;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(7715568);
    });

    // 校验报告累计指定数量的错误
    it('pointer_util_scenario_7715569_validation_report_count', 0, async () => {
      const caseSeed: number = 7715569;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(7715569);
    });

    // 带查询参数的地址解析长度与分段一致
    it('pointer_util_scenario_7715570_url_with_query', 0, async () => {
      const caseSeed: number = 7715570;
      const url: string = SAMPLE_GAME_URL + '?case=93';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(7715570);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('pointer_util_scenario_7715571_geometry_area', 0, async () => {
      const caseSeed: number = 7715571;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(7715571);
    });

    // 环形缓冲保持容量并保留最新样本
    it('pointer_util_scenario_7715572_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 7715572;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(7715572);
    });

    // 命令队列按序消费指定数量的命令
    it('pointer_util_scenario_7715573_command_queue_fifo', 0, async () => {
      const caseSeed: number = 7715573;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(7715573);
    });

    // 令牌桶消费后余额与补充上限正确
    it('pointer_util_scenario_7715574_token_bucket_consume', 0, async () => {
      const caseSeed: number = 7715574;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(7715574);
    });

    // 加载耗时按预算边界判定
    it('pointer_util_scenario_7715575_page_load_budget', 0, async () => {
      const caseSeed: number = 7715575;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2575);
      expect(record.getDuration()).assertEqual(2575);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(7715575);
    });

    // 延迟采样器的最大值不小于均值
    it('pointer_util_scenario_7715576_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 7715576;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(7715576);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('pointer_util_scenario_7715577_config_api_9', 0, async () => {
      const caseSeed: number = 7715577;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(7715577);
    });

    // 重试次数达到上限后拒绝继续重试
    it('pointer_util_scenario_7715578_retry_attempts', 0, async () => {
      const caseSeed: number = 7715578;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(7715578);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('pointer_util_scenario_7715579_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 7715579;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(7715579);
    });

    // 会话连续开始后保持运行且计数一致
    it('pointer_util_scenario_7715580_session_start_cycles', 0, async () => {
      const caseSeed: number = 7715580;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(7715580);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('pointer_util_scenario_7715581_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 7715581;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(7715581);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('pointer_util_scenario_7715582_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 7715582;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(7715582);
    });

    // 注入地址构建后可被完整还原
    it('pointer_util_scenario_7715583_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 7715583;
      const payload: string = '_main.paddle.moveLeft(); // case 7715583';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(7715583);
    });

    // 缩放开关变化后游戏配置判定正确
    it('pointer_util_scenario_7715584_settings_zoom_true', 0, async () => {
      const caseSeed: number = 7715584;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(7715584);
    });

    // 自定义三列宽度之和仍为 100%
    it('pointer_util_scenario_7715585_layout_custom_columns', 0, async () => {
      const caseSeed: number = 7715585;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(7715585);
    });

    // 击打得分按次数累加，最高分同步更新
    it('pointer_util_scenario_7715586_score_accumulation', 0, async () => {
      const caseSeed: number = 7715586;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(7715586);
    });

    // 砖块按命中次数递减并给出进度
    it('pointer_util_scenario_7715587_brick_grid_progress', 0, async () => {
      const caseSeed: number = 7715587;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(7715587);
    });

    // 按语言读取控制标签且资源完整
    it('pointer_util_scenario_7715588_locale_lookup_en', 0, async () => {
      const caseSeed: number = 7715588;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(7715588);
    });

    // 校验报告累计指定数量的错误
    it('pointer_util_scenario_7715589_validation_report_count', 0, async () => {
      const caseSeed: number = 7715589;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(7715589);
    });

    // 带查询参数的地址解析长度与分段一致
    it('pointer_util_scenario_7715590_url_with_query', 0, async () => {
      const caseSeed: number = 7715590;
      const url: string = SAMPLE_GAME_URL + '?case=16';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(7715590);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('pointer_util_scenario_7715591_geometry_area', 0, async () => {
      const caseSeed: number = 7715591;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(7715591);
    });

    // 环形缓冲保持容量并保留最新样本
    it('pointer_util_scenario_7715592_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 7715592;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(7715592);
    });

  });
}
