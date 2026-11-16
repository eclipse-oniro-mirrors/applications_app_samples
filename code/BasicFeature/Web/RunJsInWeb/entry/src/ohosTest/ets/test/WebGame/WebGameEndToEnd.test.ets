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

export default function webGameEndToEndTest() {
  describe('WebGameEndToEnd_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_e2e suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_e2e suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('game_e2e_scenario_4965800_session_start_cycles', 0, async () => {
      const caseSeed: number = 4965800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(4965800);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_e2e_scenario_4965801_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 4965801;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(4965801);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_e2e_scenario_4965802_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 4965802;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(4965802);
    });

    // 注入地址构建后可被完整还原
    it('game_e2e_scenario_4965803_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 4965803;
      const payload: string = '_main.paddle.moveLeft(); // case 4965803';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(4965803);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_e2e_scenario_4965804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 4965804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(4965804);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_e2e_scenario_4965805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 4965805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(4965805);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_e2e_scenario_4965806_score_accumulation', 0, async () => {
      const caseSeed: number = 4965806;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(4965806);
    });

    // 砖块按命中次数递减并给出进度
    it('game_e2e_scenario_4965807_brick_grid_progress', 0, async () => {
      const caseSeed: number = 4965807;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(4965807);
    });

    // 按语言读取控制标签且资源完整
    it('game_e2e_scenario_4965808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 4965808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(4965808);
    });

    // 校验报告累计指定数量的错误
    it('game_e2e_scenario_4965809_validation_report_count', 0, async () => {
      const caseSeed: number = 4965809;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(4965809);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_e2e_scenario_4965810_url_with_query', 0, async () => {
      const caseSeed: number = 4965810;
      const url: string = SAMPLE_GAME_URL + '?case=89';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(4965810);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_e2e_scenario_4965811_geometry_area', 0, async () => {
      const caseSeed: number = 4965811;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 41);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(4965811);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_e2e_scenario_4965812_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 4965812;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(4965812);
    });

    // 命令队列按序消费指定数量的命令
    it('game_e2e_scenario_4965813_command_queue_fifo', 0, async () => {
      const caseSeed: number = 4965813;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(4965813);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_e2e_scenario_4965814_token_bucket_consume', 0, async () => {
      const caseSeed: number = 4965814;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(4965814);
    });

    // 加载耗时按预算边界判定
    it('game_e2e_scenario_4965815_page_load_budget', 0, async () => {
      const caseSeed: number = 4965815;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6815);
      expect(record.getDuration()).assertEqual(6815);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(4965815);
    });

    // 延迟采样器的最大值不小于均值
    it('game_e2e_scenario_4965816_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 4965816;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(4965816);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_e2e_scenario_4965817_config_api_9', 0, async () => {
      const caseSeed: number = 4965817;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(4965817);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_e2e_scenario_4965818_retry_attempts', 0, async () => {
      const caseSeed: number = 4965818;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(4965818);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_e2e_scenario_4965819_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 4965819;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(4965819);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_e2e_scenario_4965820_session_start_cycles', 0, async () => {
      const caseSeed: number = 4965820;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(4965820);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_e2e_scenario_4965821_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 4965821;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(4965821);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_e2e_scenario_4965822_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 4965822;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(4965822);
    });

    // 注入地址构建后可被完整还原
    it('game_e2e_scenario_4965823_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 4965823;
      const payload: string = '_main.paddle.moveLeft(); // case 4965823';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(4965823);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_e2e_scenario_4965824_settings_zoom_true', 0, async () => {
      const caseSeed: number = 4965824;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(4965824);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_e2e_scenario_4965825_layout_custom_columns', 0, async () => {
      const caseSeed: number = 4965825;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(4965825);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_e2e_scenario_4965826_score_accumulation', 0, async () => {
      const caseSeed: number = 4965826;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(4965826);
    });

    // 砖块按命中次数递减并给出进度
    it('game_e2e_scenario_4965827_brick_grid_progress', 0, async () => {
      const caseSeed: number = 4965827;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(4965827);
    });

    // 按语言读取控制标签且资源完整
    it('game_e2e_scenario_4965828_locale_lookup_en', 0, async () => {
      const caseSeed: number = 4965828;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(4965828);
    });

    // 校验报告累计指定数量的错误
    it('game_e2e_scenario_4965829_validation_report_count', 0, async () => {
      const caseSeed: number = 4965829;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(4965829);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_e2e_scenario_4965830_url_with_query', 0, async () => {
      const caseSeed: number = 4965830;
      const url: string = SAMPLE_GAME_URL + '?case=12';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(4965830);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_e2e_scenario_4965831_geometry_area', 0, async () => {
      const caseSeed: number = 4965831;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(4965831);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_e2e_scenario_4965832_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 4965832;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(4965832);
    });

    // 命令队列按序消费指定数量的命令
    it('game_e2e_scenario_4965833_command_queue_fifo', 0, async () => {
      const caseSeed: number = 4965833;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(4965833);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_e2e_scenario_4965834_token_bucket_consume', 0, async () => {
      const caseSeed: number = 4965834;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(4965834);
    });

    // 加载耗时按预算边界判定
    it('game_e2e_scenario_4965835_page_load_budget', 0, async () => {
      const caseSeed: number = 4965835;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6835);
      expect(record.getDuration()).assertEqual(6835);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(4965835);
    });

    // 延迟采样器的最大值不小于均值
    it('game_e2e_scenario_4965836_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 4965836;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(4965836);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_e2e_scenario_4965837_config_api_9', 0, async () => {
      const caseSeed: number = 4965837;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(4965837);
    });

  });
}
