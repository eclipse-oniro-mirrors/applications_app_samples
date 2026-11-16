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

export default function webDataSourceValidationTest() {
  describe('WebDataSourceValidation_Test', () => {
    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_data_source suite start');
    });

    afterAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_data_source suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('web_data_source_scenario_2468400_session_start_cycles', 0, async () => {
      const caseSeed: number = 2468400;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2468400);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_data_source_scenario_2468401_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2468401;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(2468401);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_data_source_scenario_2468402_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2468402;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2468402);
    });

    // 注入地址构建后可被完整还原
    it('web_data_source_scenario_2468403_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2468403;
      const payload: string = '_main.paddle.moveLeft(); // case 2468403';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2468403);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_data_source_scenario_2468404_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2468404;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2468404);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_data_source_scenario_2468405_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2468405;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2468405);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_data_source_scenario_2468406_score_accumulation', 0, async () => {
      const caseSeed: number = 2468406;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(2468406);
    });

    // 砖块按命中次数递减并给出进度
    it('web_data_source_scenario_2468407_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2468407;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(2468407);
    });

    // 按语言读取控制标签且资源完整
    it('web_data_source_scenario_2468408_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2468408;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2468408);
    });

    // 校验报告累计指定数量的错误
    it('web_data_source_scenario_2468409_validation_report_count', 0, async () => {
      const caseSeed: number = 2468409;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2468409);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_data_source_scenario_2468410_url_with_query', 0, async () => {
      const caseSeed: number = 2468410;
      const url: string = SAMPLE_GAME_URL + '?case=51';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2468410);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_data_source_scenario_2468411_geometry_area', 0, async () => {
      const caseSeed: number = 2468411;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 21);
      expect(box.area()).assertEqual(441);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2468411);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_data_source_scenario_2468412_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2468412;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2468412);
    });

    // 命令队列按序消费指定数量的命令
    it('web_data_source_scenario_2468413_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2468413;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2468413);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_data_source_scenario_2468414_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2468414;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(2468414);
    });

    // 加载耗时按预算边界判定
    it('web_data_source_scenario_2468415_page_load_budget', 0, async () => {
      const caseSeed: number = 2468415;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2415);
      expect(record.getDuration()).assertEqual(2415);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2468415);
    });

    // 延迟采样器的最大值不小于均值
    it('web_data_source_scenario_2468416_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2468416;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(2468416);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_data_source_scenario_2468417_config_api_9', 0, async () => {
      const caseSeed: number = 2468417;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2468417);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_data_source_scenario_2468418_retry_attempts', 0, async () => {
      const caseSeed: number = 2468418;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2468418);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_data_source_scenario_2468419_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2468419;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2468419);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_data_source_scenario_2468420_session_start_cycles', 0, async () => {
      const caseSeed: number = 2468420;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2468420);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_data_source_scenario_2468421_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2468421;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(2468421);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_data_source_scenario_2468422_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2468422;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2468422);
    });

    // 注入地址构建后可被完整还原
    it('web_data_source_scenario_2468423_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2468423;
      const payload: string = '_main.paddle.moveLeft(); // case 2468423';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2468423);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_data_source_scenario_2468424_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2468424;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2468424);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_data_source_scenario_2468425_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2468425;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2468425);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_data_source_scenario_2468426_score_accumulation', 0, async () => {
      const caseSeed: number = 2468426;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(2468426);
    });

    // 砖块按命中次数递减并给出进度
    it('web_data_source_scenario_2468427_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2468427;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(2468427);
    });

    // 按语言读取控制标签且资源完整
    it('web_data_source_scenario_2468428_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2468428;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2468428);
    });

    // 校验报告累计指定数量的错误
    it('web_data_source_scenario_2468429_validation_report_count', 0, async () => {
      const caseSeed: number = 2468429;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2468429);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_data_source_scenario_2468430_url_with_query', 0, async () => {
      const caseSeed: number = 2468430;
      const url: string = SAMPLE_GAME_URL + '?case=71';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2468430);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_data_source_scenario_2468431_geometry_area', 0, async () => {
      const caseSeed: number = 2468431;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2468431);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_data_source_scenario_2468432_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2468432;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2468432);
    });

    // 命令队列按序消费指定数量的命令
    it('web_data_source_scenario_2468433_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2468433;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2468433);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_data_source_scenario_2468434_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2468434;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(2468434);
    });

    // 加载耗时按预算边界判定
    it('web_data_source_scenario_2468435_page_load_budget', 0, async () => {
      const caseSeed: number = 2468435;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(2435);
      expect(record.getDuration()).assertEqual(2435);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2468435);
    });

    // 延迟采样器的最大值不小于均值
    it('web_data_source_scenario_2468436_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2468436;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(2468436);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_data_source_scenario_2468437_config_api_9', 0, async () => {
      const caseSeed: number = 2468437;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2468437);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_data_source_scenario_2468438_retry_attempts', 0, async () => {
      const caseSeed: number = 2468438;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2468438);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_data_source_scenario_2468439_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2468439;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2468439);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_data_source_scenario_2468440_session_start_cycles', 0, async () => {
      const caseSeed: number = 2468440;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2468440);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_data_source_scenario_2468441_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2468441;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(2468441);
    });

  });
}
