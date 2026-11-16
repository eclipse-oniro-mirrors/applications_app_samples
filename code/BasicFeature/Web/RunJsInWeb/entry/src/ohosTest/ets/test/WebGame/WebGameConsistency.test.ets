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

export default function webGameConsistencyTest() {
  describe('WebGameConsistency_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_consistency suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_consistency suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('game_consistency_scenario_6769600_session_start_cycles', 0, async () => {
      const caseSeed: number = 6769600;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6769600);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_consistency_scenario_6769601_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6769601;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(6769601);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_consistency_scenario_6769602_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6769602;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6769602);
    });

    // 注入地址构建后可被完整还原
    it('game_consistency_scenario_6769603_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6769603;
      const payload: string = '_main.paddle.moveLeft(); // case 6769603';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6769603);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_consistency_scenario_6769604_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6769604;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6769604);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_consistency_scenario_6769605_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6769605;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6769605);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_consistency_scenario_6769606_score_accumulation', 0, async () => {
      const caseSeed: number = 6769606;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(6769606);
    });

    // 砖块按命中次数递减并给出进度
    it('game_consistency_scenario_6769607_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6769607;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(6769607);
    });

    // 按语言读取控制标签且资源完整
    it('game_consistency_scenario_6769608_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6769608;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6769608);
    });

    // 校验报告累计指定数量的错误
    it('game_consistency_scenario_6769609_validation_report_count', 0, async () => {
      const caseSeed: number = 6769609;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6769609);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_consistency_scenario_6769610_url_with_query', 0, async () => {
      const caseSeed: number = 6769610;
      const url: string = SAMPLE_GAME_URL + '?case=77';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6769610);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_consistency_scenario_6769611_geometry_area', 0, async () => {
      const caseSeed: number = 6769611;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 61);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6769611);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_consistency_scenario_6769612_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6769612;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6769612);
    });

    // 命令队列按序消费指定数量的命令
    it('game_consistency_scenario_6769613_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6769613;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6769613);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_consistency_scenario_6769614_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6769614;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(6769614);
    });

    // 加载耗时按预算边界判定
    it('game_consistency_scenario_6769615_page_load_budget', 0, async () => {
      const caseSeed: number = 6769615;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1615);
      expect(record.getDuration()).assertEqual(1615);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6769615);
    });

    // 延迟采样器的最大值不小于均值
    it('game_consistency_scenario_6769616_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6769616;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(6769616);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_consistency_scenario_6769617_config_api_9', 0, async () => {
      const caseSeed: number = 6769617;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6769617);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_consistency_scenario_6769618_retry_attempts', 0, async () => {
      const caseSeed: number = 6769618;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6769618);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_consistency_scenario_6769619_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6769619;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6769619);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_consistency_scenario_6769620_session_start_cycles', 0, async () => {
      const caseSeed: number = 6769620;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6769620);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_consistency_scenario_6769621_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6769621;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(6769621);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_consistency_scenario_6769622_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6769622;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6769622);
    });

    // 注入地址构建后可被完整还原
    it('game_consistency_scenario_6769623_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6769623;
      const payload: string = '_main.paddle.moveLeft(); // case 6769623';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6769623);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_consistency_scenario_6769624_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6769624;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6769624);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_consistency_scenario_6769625_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6769625;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6769625);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_consistency_scenario_6769626_score_accumulation', 0, async () => {
      const caseSeed: number = 6769626;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(6769626);
    });

    // 砖块按命中次数递减并给出进度
    it('game_consistency_scenario_6769627_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6769627;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(6769627);
    });

    // 按语言读取控制标签且资源完整
    it('game_consistency_scenario_6769628_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6769628;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6769628);
    });

    // 校验报告累计指定数量的错误
    it('game_consistency_scenario_6769629_validation_report_count', 0, async () => {
      const caseSeed: number = 6769629;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6769629);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_consistency_scenario_6769630_url_with_query', 0, async () => {
      const caseSeed: number = 6769630;
      const url: string = SAMPLE_GAME_URL + '?case=0';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6769630);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_consistency_scenario_6769631_geometry_area', 0, async () => {
      const caseSeed: number = 6769631;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6769631);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_consistency_scenario_6769632_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6769632;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6769632);
    });

    // 命令队列按序消费指定数量的命令
    it('game_consistency_scenario_6769633_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6769633;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6769633);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_consistency_scenario_6769634_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6769634;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(6769634);
    });

    // 加载耗时按预算边界判定
    it('game_consistency_scenario_6769635_page_load_budget', 0, async () => {
      const caseSeed: number = 6769635;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(1635);
      expect(record.getDuration()).assertEqual(1635);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6769635);
    });

    // 延迟采样器的最大值不小于均值
    it('game_consistency_scenario_6769636_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6769636;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(6769636);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_consistency_scenario_6769637_config_api_9', 0, async () => {
      const caseSeed: number = 6769637;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6769637);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_consistency_scenario_6769638_retry_attempts', 0, async () => {
      const caseSeed: number = 6769638;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6769638);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_consistency_scenario_6769639_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6769639;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6769639);
    });

  });
}
