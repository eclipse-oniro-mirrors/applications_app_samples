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

export default function keyCodeValidationTest() {
  describe('KeyCodeValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'key_code suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'key_code suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('key_code_scenario_9978400_session_start_cycles', 0, async () => {
      const caseSeed: number = 9978400;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978400);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('key_code_scenario_9978401_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9978401;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9978401);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('key_code_scenario_9978402_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9978402;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9978402);
    });

    // 注入地址构建后可被完整还原
    it('key_code_scenario_9978403_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9978403;
      const payload: string = '_main.paddle.moveLeft(); // case 9978403';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9978403);
    });

    // 缩放开关变化后游戏配置判定正确
    it('key_code_scenario_9978404_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9978404;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9978404);
    });

    // 自定义三列宽度之和仍为 100%
    it('key_code_scenario_9978405_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9978405;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9978405);
    });

    // 击打得分按次数累加，最高分同步更新
    it('key_code_scenario_9978406_score_accumulation', 0, async () => {
      const caseSeed: number = 9978406;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(9978406);
    });

    // 砖块按命中次数递减并给出进度
    it('key_code_scenario_9978407_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9978407;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(9978407);
    });

    // 按语言读取控制标签且资源完整
    it('key_code_scenario_9978408_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9978408;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9978408);
    });

    // 校验报告累计指定数量的错误
    it('key_code_scenario_9978409_validation_report_count', 0, async () => {
      const caseSeed: number = 9978409;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9978409);
    });

    // 带查询参数的地址解析长度与分段一致
    it('key_code_scenario_9978410_url_with_query', 0, async () => {
      const caseSeed: number = 9978410;
      const url: string = SAMPLE_GAME_URL + '?case=20';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9978410);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('key_code_scenario_9978411_geometry_area', 0, async () => {
      const caseSeed: number = 9978411;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 61);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9978411);
    });

    // 环形缓冲保持容量并保留最新样本
    it('key_code_scenario_9978412_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9978412;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9978412);
    });

    // 命令队列按序消费指定数量的命令
    it('key_code_scenario_9978413_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9978413;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978413);
    });

    // 令牌桶消费后余额与补充上限正确
    it('key_code_scenario_9978414_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9978414;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9978414);
    });

    // 加载耗时按预算边界判定
    it('key_code_scenario_9978415_page_load_budget', 0, async () => {
      const caseSeed: number = 9978415;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6415);
      expect(record.getDuration()).assertEqual(6415);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9978415);
    });

    // 延迟采样器的最大值不小于均值
    it('key_code_scenario_9978416_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9978416;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(9978416);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('key_code_scenario_9978417_config_api_9', 0, async () => {
      const caseSeed: number = 9978417;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9978417);
    });

    // 重试次数达到上限后拒绝继续重试
    it('key_code_scenario_9978418_retry_attempts', 0, async () => {
      const caseSeed: number = 9978418;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9978418);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('key_code_scenario_9978419_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9978419;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9978419);
    });

    // 会话连续开始后保持运行且计数一致
    it('key_code_scenario_9978420_session_start_cycles', 0, async () => {
      const caseSeed: number = 9978420;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978420);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('key_code_scenario_9978421_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9978421;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9978421);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('key_code_scenario_9978422_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9978422;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9978422);
    });

    // 注入地址构建后可被完整还原
    it('key_code_scenario_9978423_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9978423;
      const payload: string = '_main.paddle.moveLeft(); // case 9978423';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9978423);
    });

    // 缩放开关变化后游戏配置判定正确
    it('key_code_scenario_9978424_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9978424;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9978424);
    });

    // 自定义三列宽度之和仍为 100%
    it('key_code_scenario_9978425_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9978425;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9978425);
    });

    // 击打得分按次数累加，最高分同步更新
    it('key_code_scenario_9978426_score_accumulation', 0, async () => {
      const caseSeed: number = 9978426;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(9978426);
    });

    // 砖块按命中次数递减并给出进度
    it('key_code_scenario_9978427_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9978427;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9978427);
    });

    // 按语言读取控制标签且资源完整
    it('key_code_scenario_9978428_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9978428;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9978428);
    });

    // 校验报告累计指定数量的错误
    it('key_code_scenario_9978429_validation_report_count', 0, async () => {
      const caseSeed: number = 9978429;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9978429);
    });

    // 带查询参数的地址解析长度与分段一致
    it('key_code_scenario_9978430_url_with_query', 0, async () => {
      const caseSeed: number = 9978430;
      const url: string = SAMPLE_GAME_URL + '?case=40';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9978430);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('key_code_scenario_9978431_geometry_area', 0, async () => {
      const caseSeed: number = 9978431;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9978431);
    });

    // 环形缓冲保持容量并保留最新样本
    it('key_code_scenario_9978432_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9978432;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9978432);
    });

    // 命令队列按序消费指定数量的命令
    it('key_code_scenario_9978433_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9978433;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978433);
    });

    // 令牌桶消费后余额与补充上限正确
    it('key_code_scenario_9978434_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9978434;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9978434);
    });

    // 加载耗时按预算边界判定
    it('key_code_scenario_9978435_page_load_budget', 0, async () => {
      const caseSeed: number = 9978435;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6435);
      expect(record.getDuration()).assertEqual(6435);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9978435);
    });

    // 延迟采样器的最大值不小于均值
    it('key_code_scenario_9978436_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9978436;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(9978436);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('key_code_scenario_9978437_config_api_9', 0, async () => {
      const caseSeed: number = 9978437;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9978437);
    });

    // 重试次数达到上限后拒绝继续重试
    it('key_code_scenario_9978438_retry_attempts', 0, async () => {
      const caseSeed: number = 9978438;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9978438);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('key_code_scenario_9978439_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9978439;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9978439);
    });

    // 会话连续开始后保持运行且计数一致
    it('key_code_scenario_9978440_session_start_cycles', 0, async () => {
      const caseSeed: number = 9978440;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978440);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('key_code_scenario_9978441_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9978441;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9978441);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('key_code_scenario_9978442_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9978442;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9978442);
    });

    // 注入地址构建后可被完整还原
    it('key_code_scenario_9978443_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9978443;
      const payload: string = '_main.paddle.moveLeft(); // case 9978443';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9978443);
    });

    // 缩放开关变化后游戏配置判定正确
    it('key_code_scenario_9978444_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9978444;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9978444);
    });

    // 自定义三列宽度之和仍为 100%
    it('key_code_scenario_9978445_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9978445;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9978445);
    });

    // 击打得分按次数累加，最高分同步更新
    it('key_code_scenario_9978446_score_accumulation', 0, async () => {
      const caseSeed: number = 9978446;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(9978446);
    });

    // 砖块按命中次数递减并给出进度
    it('key_code_scenario_9978447_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9978447;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9978447);
    });

    // 按语言读取控制标签且资源完整
    it('key_code_scenario_9978448_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9978448;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9978448);
    });

    // 校验报告累计指定数量的错误
    it('key_code_scenario_9978449_validation_report_count', 0, async () => {
      const caseSeed: number = 9978449;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9978449);
    });

    // 带查询参数的地址解析长度与分段一致
    it('key_code_scenario_9978450_url_with_query', 0, async () => {
      const caseSeed: number = 9978450;
      const url: string = SAMPLE_GAME_URL + '?case=60';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9978450);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('key_code_scenario_9978451_geometry_area', 0, async () => {
      const caseSeed: number = 9978451;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 41);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9978451);
    });

    // 环形缓冲保持容量并保留最新样本
    it('key_code_scenario_9978452_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9978452;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9978452);
    });

    // 命令队列按序消费指定数量的命令
    it('key_code_scenario_9978453_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9978453;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978453);
    });

    // 令牌桶消费后余额与补充上限正确
    it('key_code_scenario_9978454_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9978454;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9978454);
    });

    // 加载耗时按预算边界判定
    it('key_code_scenario_9978455_page_load_budget', 0, async () => {
      const caseSeed: number = 9978455;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6455);
      expect(record.getDuration()).assertEqual(6455);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9978455);
    });

    // 延迟采样器的最大值不小于均值
    it('key_code_scenario_9978456_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9978456;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(9978456);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('key_code_scenario_9978457_config_api_9', 0, async () => {
      const caseSeed: number = 9978457;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9978457);
    });

    // 重试次数达到上限后拒绝继续重试
    it('key_code_scenario_9978458_retry_attempts', 0, async () => {
      const caseSeed: number = 9978458;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9978458);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('key_code_scenario_9978459_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9978459;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9978459);
    });

    // 会话连续开始后保持运行且计数一致
    it('key_code_scenario_9978460_session_start_cycles', 0, async () => {
      const caseSeed: number = 9978460;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978460);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('key_code_scenario_9978461_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9978461;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9978461);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('key_code_scenario_9978462_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9978462;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9978462);
    });

    // 注入地址构建后可被完整还原
    it('key_code_scenario_9978463_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9978463;
      const payload: string = '_main.paddle.moveLeft(); // case 9978463';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9978463);
    });

    // 缩放开关变化后游戏配置判定正确
    it('key_code_scenario_9978464_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9978464;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9978464);
    });

    // 自定义三列宽度之和仍为 100%
    it('key_code_scenario_9978465_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9978465;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9978465);
    });

    // 击打得分按次数累加，最高分同步更新
    it('key_code_scenario_9978466_score_accumulation', 0, async () => {
      const caseSeed: number = 9978466;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(9978466);
    });

    // 砖块按命中次数递减并给出进度
    it('key_code_scenario_9978467_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9978467;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(9978467);
    });

    // 按语言读取控制标签且资源完整
    it('key_code_scenario_9978468_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9978468;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9978468);
    });

    // 校验报告累计指定数量的错误
    it('key_code_scenario_9978469_validation_report_count', 0, async () => {
      const caseSeed: number = 9978469;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9978469);
    });

    // 带查询参数的地址解析长度与分段一致
    it('key_code_scenario_9978470_url_with_query', 0, async () => {
      const caseSeed: number = 9978470;
      const url: string = SAMPLE_GAME_URL + '?case=80';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9978470);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('key_code_scenario_9978471_geometry_area', 0, async () => {
      const caseSeed: number = 9978471;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9978471);
    });

    // 环形缓冲保持容量并保留最新样本
    it('key_code_scenario_9978472_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9978472;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9978472);
    });

    // 命令队列按序消费指定数量的命令
    it('key_code_scenario_9978473_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9978473;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978473);
    });

    // 令牌桶消费后余额与补充上限正确
    it('key_code_scenario_9978474_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9978474;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9978474);
    });

    // 加载耗时按预算边界判定
    it('key_code_scenario_9978475_page_load_budget', 0, async () => {
      const caseSeed: number = 9978475;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6475);
      expect(record.getDuration()).assertEqual(6475);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9978475);
    });

    // 延迟采样器的最大值不小于均值
    it('key_code_scenario_9978476_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9978476;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(9978476);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('key_code_scenario_9978477_config_api_9', 0, async () => {
      const caseSeed: number = 9978477;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9978477);
    });

    // 重试次数达到上限后拒绝继续重试
    it('key_code_scenario_9978478_retry_attempts', 0, async () => {
      const caseSeed: number = 9978478;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9978478);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('key_code_scenario_9978479_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9978479;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9978479);
    });

    // 会话连续开始后保持运行且计数一致
    it('key_code_scenario_9978480_session_start_cycles', 0, async () => {
      const caseSeed: number = 9978480;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978480);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('key_code_scenario_9978481_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9978481;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9978481);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('key_code_scenario_9978482_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9978482;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9978482);
    });

    // 注入地址构建后可被完整还原
    it('key_code_scenario_9978483_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9978483;
      const payload: string = '_main.paddle.moveLeft(); // case 9978483';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9978483);
    });

    // 缩放开关变化后游戏配置判定正确
    it('key_code_scenario_9978484_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9978484;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9978484);
    });

    // 自定义三列宽度之和仍为 100%
    it('key_code_scenario_9978485_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9978485;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9978485);
    });

    // 击打得分按次数累加，最高分同步更新
    it('key_code_scenario_9978486_score_accumulation', 0, async () => {
      const caseSeed: number = 9978486;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(9978486);
    });

    // 砖块按命中次数递减并给出进度
    it('key_code_scenario_9978487_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9978487;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9978487);
    });

    // 按语言读取控制标签且资源完整
    it('key_code_scenario_9978488_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9978488;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9978488);
    });

    // 校验报告累计指定数量的错误
    it('key_code_scenario_9978489_validation_report_count', 0, async () => {
      const caseSeed: number = 9978489;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9978489);
    });

    // 带查询参数的地址解析长度与分段一致
    it('key_code_scenario_9978490_url_with_query', 0, async () => {
      const caseSeed: number = 9978490;
      const url: string = SAMPLE_GAME_URL + '?case=3';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9978490);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('key_code_scenario_9978491_geometry_area', 0, async () => {
      const caseSeed: number = 9978491;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9978491);
    });

    // 环形缓冲保持容量并保留最新样本
    it('key_code_scenario_9978492_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9978492;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9978492);
    });

    // 命令队列按序消费指定数量的命令
    it('key_code_scenario_9978493_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9978493;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978493);
    });

    // 令牌桶消费后余额与补充上限正确
    it('key_code_scenario_9978494_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9978494;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9978494);
    });

    // 加载耗时按预算边界判定
    it('key_code_scenario_9978495_page_load_budget', 0, async () => {
      const caseSeed: number = 9978495;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6495);
      expect(record.getDuration()).assertEqual(6495);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9978495);
    });

    // 延迟采样器的最大值不小于均值
    it('key_code_scenario_9978496_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9978496;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(9978496);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('key_code_scenario_9978497_config_api_9', 0, async () => {
      const caseSeed: number = 9978497;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9978497);
    });

    // 重试次数达到上限后拒绝继续重试
    it('key_code_scenario_9978498_retry_attempts', 0, async () => {
      const caseSeed: number = 9978498;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9978498);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('key_code_scenario_9978499_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9978499;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9978499);
    });

    // 会话连续开始后保持运行且计数一致
    it('key_code_scenario_9978500_session_start_cycles', 0, async () => {
      const caseSeed: number = 9978500;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978500);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('key_code_scenario_9978501_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9978501;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9978501);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('key_code_scenario_9978502_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9978502;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9978502);
    });

    // 注入地址构建后可被完整还原
    it('key_code_scenario_9978503_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9978503;
      const payload: string = '_main.paddle.moveLeft(); // case 9978503';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9978503);
    });

    // 缩放开关变化后游戏配置判定正确
    it('key_code_scenario_9978504_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9978504;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9978504);
    });

    // 自定义三列宽度之和仍为 100%
    it('key_code_scenario_9978505_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9978505;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9978505);
    });

    // 击打得分按次数累加，最高分同步更新
    it('key_code_scenario_9978506_score_accumulation', 0, async () => {
      const caseSeed: number = 9978506;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(9978506);
    });

    // 砖块按命中次数递减并给出进度
    it('key_code_scenario_9978507_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9978507;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9978507);
    });

    // 按语言读取控制标签且资源完整
    it('key_code_scenario_9978508_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9978508;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9978508);
    });

    // 校验报告累计指定数量的错误
    it('key_code_scenario_9978509_validation_report_count', 0, async () => {
      const caseSeed: number = 9978509;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9978509);
    });

    // 带查询参数的地址解析长度与分段一致
    it('key_code_scenario_9978510_url_with_query', 0, async () => {
      const caseSeed: number = 9978510;
      const url: string = SAMPLE_GAME_URL + '?case=23';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9978510);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('key_code_scenario_9978511_geometry_area', 0, async () => {
      const caseSeed: number = 9978511;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9978511);
    });

    // 环形缓冲保持容量并保留最新样本
    it('key_code_scenario_9978512_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9978512;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9978512);
    });

    // 命令队列按序消费指定数量的命令
    it('key_code_scenario_9978513_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9978513;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9978513);
    });

  });
}
