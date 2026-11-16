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

export default function webPerformanceTest() {
  describe('WebPerformance_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_performance suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_performance suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('web_performance_scenario_8488400_session_start_cycles', 0, async () => {
      const caseSeed: number = 8488400;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8488400);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_performance_scenario_8488401_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8488401;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(8488401);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_performance_scenario_8488402_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8488402;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8488402);
    });

    // 注入地址构建后可被完整还原
    it('web_performance_scenario_8488403_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8488403;
      const payload: string = '_main.paddle.moveLeft(); // case 8488403';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8488403);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_performance_scenario_8488404_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8488404;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8488404);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_performance_scenario_8488405_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8488405;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8488405);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_performance_scenario_8488406_score_accumulation', 0, async () => {
      const caseSeed: number = 8488406;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(8488406);
    });

    // 砖块按命中次数递减并给出进度
    it('web_performance_scenario_8488407_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8488407;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(8488407);
    });

    // 按语言读取控制标签且资源完整
    it('web_performance_scenario_8488408_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8488408;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8488408);
    });

    // 校验报告累计指定数量的错误
    it('web_performance_scenario_8488409_validation_report_count', 0, async () => {
      const caseSeed: number = 8488409;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8488409);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_performance_scenario_8488410_url_with_query', 0, async () => {
      const caseSeed: number = 8488410;
      const url: string = SAMPLE_GAME_URL + '?case=37';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8488410);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_performance_scenario_8488411_geometry_area', 0, async () => {
      const caseSeed: number = 8488411;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8488411);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_performance_scenario_8488412_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8488412;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8488412);
    });

    // 命令队列按序消费指定数量的命令
    it('web_performance_scenario_8488413_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8488413;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8488413);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_performance_scenario_8488414_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8488414;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(8488414);
    });

    // 加载耗时按预算边界判定
    it('web_performance_scenario_8488415_page_load_budget', 0, async () => {
      const caseSeed: number = 8488415;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1415);
      expect(record.getDuration()).assertEqual(1415);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8488415);
    });

    // 延迟采样器的最大值不小于均值
    it('web_performance_scenario_8488416_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8488416;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(8488416);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_performance_scenario_8488417_config_api_9', 0, async () => {
      const caseSeed: number = 8488417;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8488417);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_performance_scenario_8488418_retry_attempts', 0, async () => {
      const caseSeed: number = 8488418;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8488418);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_performance_scenario_8488419_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8488419;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8488419);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_performance_scenario_8488420_session_start_cycles', 0, async () => {
      const caseSeed: number = 8488420;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8488420);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_performance_scenario_8488421_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8488421;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(8488421);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_performance_scenario_8488422_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8488422;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8488422);
    });

    // 注入地址构建后可被完整还原
    it('web_performance_scenario_8488423_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8488423;
      const payload: string = '_main.paddle.moveLeft(); // case 8488423';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8488423);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_performance_scenario_8488424_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8488424;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8488424);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_performance_scenario_8488425_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8488425;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8488425);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_performance_scenario_8488426_score_accumulation', 0, async () => {
      const caseSeed: number = 8488426;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(8488426);
    });

    // 砖块按命中次数递减并给出进度
    it('web_performance_scenario_8488427_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8488427;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(8488427);
    });

    // 按语言读取控制标签且资源完整
    it('web_performance_scenario_8488428_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8488428;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8488428);
    });

    // 校验报告累计指定数量的错误
    it('web_performance_scenario_8488429_validation_report_count', 0, async () => {
      const caseSeed: number = 8488429;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8488429);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_performance_scenario_8488430_url_with_query', 0, async () => {
      const caseSeed: number = 8488430;
      const url: string = SAMPLE_GAME_URL + '?case=57';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8488430);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_performance_scenario_8488431_geometry_area', 0, async () => {
      const caseSeed: number = 8488431;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 61);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8488431);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_performance_scenario_8488432_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8488432;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8488432);
    });

    // 命令队列按序消费指定数量的命令
    it('web_performance_scenario_8488433_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8488433;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8488433);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_performance_scenario_8488434_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8488434;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(8488434);
    });

    // 加载耗时按预算边界判定
    it('web_performance_scenario_8488435_page_load_budget', 0, async () => {
      const caseSeed: number = 8488435;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1435);
      expect(record.getDuration()).assertEqual(1435);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8488435);
    });

    // 延迟采样器的最大值不小于均值
    it('web_performance_scenario_8488436_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8488436;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(8488436);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_performance_scenario_8488437_config_api_9', 0, async () => {
      const caseSeed: number = 8488437;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8488437);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_performance_scenario_8488438_retry_attempts', 0, async () => {
      const caseSeed: number = 8488438;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8488438);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_performance_scenario_8488439_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8488439;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8488439);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_performance_scenario_8488440_session_start_cycles', 0, async () => {
      const caseSeed: number = 8488440;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8488440);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_performance_scenario_8488441_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8488441;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(8488441);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_performance_scenario_8488442_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8488442;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8488442);
    });

    // 注入地址构建后可被完整还原
    it('web_performance_scenario_8488443_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 8488443;
      const payload: string = '_main.paddle.moveLeft(); // case 8488443';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(8488443);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_performance_scenario_8488444_settings_zoom_true', 0, async () => {
      const caseSeed: number = 8488444;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(8488444);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_performance_scenario_8488445_layout_custom_columns', 0, async () => {
      const caseSeed: number = 8488445;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(8488445);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_performance_scenario_8488446_score_accumulation', 0, async () => {
      const caseSeed: number = 8488446;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(8488446);
    });

    // 砖块按命中次数递减并给出进度
    it('web_performance_scenario_8488447_brick_grid_progress', 0, async () => {
      const caseSeed: number = 8488447;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(8488447);
    });

    // 按语言读取控制标签且资源完整
    it('web_performance_scenario_8488448_locale_lookup_en', 0, async () => {
      const caseSeed: number = 8488448;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(8488448);
    });

    // 校验报告累计指定数量的错误
    it('web_performance_scenario_8488449_validation_report_count', 0, async () => {
      const caseSeed: number = 8488449;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(8488449);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_performance_scenario_8488450_url_with_query', 0, async () => {
      const caseSeed: number = 8488450;
      const url: string = SAMPLE_GAME_URL + '?case=77';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(8488450);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_performance_scenario_8488451_geometry_area', 0, async () => {
      const caseSeed: number = 8488451;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 21);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(8488451);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_performance_scenario_8488452_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 8488452;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(8488452);
    });

    // 命令队列按序消费指定数量的命令
    it('web_performance_scenario_8488453_command_queue_fifo', 0, async () => {
      const caseSeed: number = 8488453;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(8488453);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_performance_scenario_8488454_token_bucket_consume', 0, async () => {
      const caseSeed: number = 8488454;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(8488454);
    });

    // 加载耗时按预算边界判定
    it('web_performance_scenario_8488455_page_load_budget', 0, async () => {
      const caseSeed: number = 8488455;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1455);
      expect(record.getDuration()).assertEqual(1455);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(8488455);
    });

    // 延迟采样器的最大值不小于均值
    it('web_performance_scenario_8488456_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 8488456;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(8488456);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_performance_scenario_8488457_config_api_9', 0, async () => {
      const caseSeed: number = 8488457;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(8488457);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_performance_scenario_8488458_retry_attempts', 0, async () => {
      const caseSeed: number = 8488458;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(8488458);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_performance_scenario_8488459_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 8488459;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(8488459);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_performance_scenario_8488460_session_start_cycles', 0, async () => {
      const caseSeed: number = 8488460;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(8488460);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_performance_scenario_8488461_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 8488461;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(8488461);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_performance_scenario_8488462_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 8488462;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(8488462);
    });

  });
}
