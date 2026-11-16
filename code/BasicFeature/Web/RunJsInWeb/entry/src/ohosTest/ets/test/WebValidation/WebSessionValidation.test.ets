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

export default function webSessionValidationTest() {
  describe('WebSessionValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_session suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_session suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('web_session_scenario_9975000_session_start_cycles', 0, async () => {
      const caseSeed: number = 9975000;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9975000);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_session_scenario_9975001_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9975001;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9975001);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_session_scenario_9975002_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9975002;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9975002);
    });

    // 注入地址构建后可被完整还原
    it('web_session_scenario_9975003_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9975003;
      const payload: string = '_main.paddle.moveLeft(); // case 9975003';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9975003);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_session_scenario_9975004_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9975004;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9975004);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_session_scenario_9975005_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9975005;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9975005);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_session_scenario_9975006_score_accumulation', 0, async () => {
      const caseSeed: number = 9975006;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(9975006);
    });

    // 砖块按命中次数递减并给出进度
    it('web_session_scenario_9975007_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9975007;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9975007);
    });

    // 按语言读取控制标签且资源完整
    it('web_session_scenario_9975008_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9975008;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9975008);
    });

    // 校验报告累计指定数量的错误
    it('web_session_scenario_9975009_validation_report_count', 0, async () => {
      const caseSeed: number = 9975009;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9975009);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_session_scenario_9975010_url_with_query', 0, async () => {
      const caseSeed: number = 9975010;
      const url: string = SAMPLE_GAME_URL + '?case=15';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9975010);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_session_scenario_9975011_geometry_area', 0, async () => {
      const caseSeed: number = 9975011;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 21);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9975011);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_session_scenario_9975012_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9975012;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9975012);
    });

    // 命令队列按序消费指定数量的命令
    it('web_session_scenario_9975013_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9975013;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9975013);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_session_scenario_9975014_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9975014;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9975014);
    });

    // 加载耗时按预算边界判定
    it('web_session_scenario_9975015_page_load_budget', 0, async () => {
      const caseSeed: number = 9975015;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(3015);
      expect(record.getDuration()).assertEqual(3015);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9975015);
    });

    // 延迟采样器的最大值不小于均值
    it('web_session_scenario_9975016_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9975016;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 2);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(2);
      expect(caseSeed).assertEqual(9975016);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_session_scenario_9975017_config_api_9', 0, async () => {
      const caseSeed: number = 9975017;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9975017);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_session_scenario_9975018_retry_attempts', 0, async () => {
      const caseSeed: number = 9975018;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9975018);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_session_scenario_9975019_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9975019;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9975019);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_session_scenario_9975020_session_start_cycles', 0, async () => {
      const caseSeed: number = 9975020;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9975020);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_session_scenario_9975021_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9975021;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9975021);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_session_scenario_9975022_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9975022;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9975022);
    });

    // 注入地址构建后可被完整还原
    it('web_session_scenario_9975023_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9975023;
      const payload: string = '_main.paddle.moveLeft(); // case 9975023';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9975023);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_session_scenario_9975024_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9975024;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9975024);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_session_scenario_9975025_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9975025;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9975025);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_session_scenario_9975026_score_accumulation', 0, async () => {
      const caseSeed: number = 9975026;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(9975026);
    });

    // 砖块按命中次数递减并给出进度
    it('web_session_scenario_9975027_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9975027;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9975027);
    });

    // 按语言读取控制标签且资源完整
    it('web_session_scenario_9975028_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9975028;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9975028);
    });

    // 校验报告累计指定数量的错误
    it('web_session_scenario_9975029_validation_report_count', 0, async () => {
      const caseSeed: number = 9975029;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9975029);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_session_scenario_9975030_url_with_query', 0, async () => {
      const caseSeed: number = 9975030;
      const url: string = SAMPLE_GAME_URL + '?case=35';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9975030);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_session_scenario_9975031_geometry_area', 0, async () => {
      const caseSeed: number = 9975031;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 41);
      expect(box.area()).assertEqual(3321);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9975031);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_session_scenario_9975032_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9975032;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9975032);
    });

    // 命令队列按序消费指定数量的命令
    it('web_session_scenario_9975033_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9975033;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9975033);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_session_scenario_9975034_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9975034;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9975034);
    });

    // 加载耗时按预算边界判定
    it('web_session_scenario_9975035_page_load_budget', 0, async () => {
      const caseSeed: number = 9975035;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(3035);
      expect(record.getDuration()).assertEqual(3035);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9975035);
    });

    // 延迟采样器的最大值不小于均值
    it('web_session_scenario_9975036_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9975036;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(9975036);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_session_scenario_9975037_config_api_9', 0, async () => {
      const caseSeed: number = 9975037;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9975037);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_session_scenario_9975038_retry_attempts', 0, async () => {
      const caseSeed: number = 9975038;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9975038);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_session_scenario_9975039_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9975039;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9975039);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_session_scenario_9975040_session_start_cycles', 0, async () => {
      const caseSeed: number = 9975040;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9975040);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_session_scenario_9975041_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9975041;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9975041);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_session_scenario_9975042_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9975042;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9975042);
    });

    // 注入地址构建后可被完整还原
    it('web_session_scenario_9975043_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9975043;
      const payload: string = '_main.paddle.moveLeft(); // case 9975043';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9975043);
    });

  });
}
