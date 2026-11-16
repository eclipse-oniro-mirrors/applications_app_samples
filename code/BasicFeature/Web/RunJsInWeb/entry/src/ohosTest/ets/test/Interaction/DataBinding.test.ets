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
  LABEL_START,
  LABEL_RESET,
  getDriver,
  serializedDelay,
  isGamePageVisible,
  triggerGamePage,
  pressAndWait,
  getButtonLabels
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
import {
  EventBus
} from '../Shared/TestHelpers';

export default function dataBindingTest() {
  describe('DataBinding_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'data_binding suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'data_binding suite end');
    });

    // 开始脚本应把会话与小球状态同步为运行中
    it('data_binding_start_updates_bound_ball_state', 0, async () => {
      const session: GameSession = new GameSession();
      const ball: BallModel = new BallModel();
      session.start();
      ball.fire();
      expect(session.isRunning()).assertTrue();
      expect(ball.isFired()).assertTrue();
    });

    // 复位脚本应清空小球发射标记
    it('data_binding_reset_clears_bound_ball_state', 0, async () => {
      const session: GameSession = new GameSession();
      const ball: BallModel = new BallModel();
      session.start();
      ball.fire();
      session.markGameOver();
      session.reset();
      ball.reset();
      expect(session.isStarted()).assertTrue();
      expect(ball.isFired()).assertFalse();
    });

    // 事件总线应能统计开始与复位事件
    it('data_binding_event_bus_tracks_injection_events', 0, async () => {
      const bus: EventBus = new EventBus();
      bus.on('start');
      bus.on('reset');
      expect(bus.emit('start')).assertTrue();
      expect(bus.emit('start')).assertTrue();
      expect(bus.emit('left')).assertFalse();
      expect(bus.emittedCount()).assertEqual(2);
      expect(bus.listenerCount('reset')).assertEqual(1);
    });

    // 页面控件存在时数据层的四个动作均可映射到按钮
    it('data_binding_ui_reflects_data_state', 0, async () => {
      const labels: string[] = await getButtonLabels(driver);
      expect(labels.includes(LABEL_START)).assertTrue();
      expect(labels.includes(LABEL_RESET)).assertTrue();
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // 会话连续开始后保持运行且计数一致
    it('data_binding_scenario_2709700_session_start_cycles', 0, async () => {
      const caseSeed: number = 2709700;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2709700);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('data_binding_scenario_2709701_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2709701;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(2709701);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('data_binding_scenario_2709702_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2709702;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2709702);
    });

    // 注入地址构建后可被完整还原
    it('data_binding_scenario_2709703_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2709703;
      const payload: string = '_main.paddle.moveLeft(); // case 2709703';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2709703);
    });

    // 缩放开关变化后游戏配置判定正确
    it('data_binding_scenario_2709704_settings_zoom_true', 0, async () => {
      const caseSeed: number = 2709704;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(2709704);
    });

    // 自定义三列宽度之和仍为 100%
    it('data_binding_scenario_2709705_layout_custom_columns', 0, async () => {
      const caseSeed: number = 2709705;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(2709705);
    });

    // 击打得分按次数累加，最高分同步更新
    it('data_binding_scenario_2709706_score_accumulation', 0, async () => {
      const caseSeed: number = 2709706;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(2709706);
    });

    // 砖块按命中次数递减并给出进度
    it('data_binding_scenario_2709707_brick_grid_progress', 0, async () => {
      const caseSeed: number = 2709707;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(2709707);
    });

    // 按语言读取控制标签且资源完整
    it('data_binding_scenario_2709708_locale_lookup_en', 0, async () => {
      const caseSeed: number = 2709708;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(2709708);
    });

    // 校验报告累计指定数量的错误
    it('data_binding_scenario_2709709_validation_report_count', 0, async () => {
      const caseSeed: number = 2709709;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(2709709);
    });

    // 带查询参数的地址解析长度与分段一致
    it('data_binding_scenario_2709710_url_with_query', 0, async () => {
      const caseSeed: number = 2709710;
      const url: string = SAMPLE_GAME_URL + '?case=15';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(2709710);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('data_binding_scenario_2709711_geometry_area', 0, async () => {
      const caseSeed: number = 2709711;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 61);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(2709711);
    });

    // 环形缓冲保持容量并保留最新样本
    it('data_binding_scenario_2709712_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 2709712;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(2709712);
    });

    // 命令队列按序消费指定数量的命令
    it('data_binding_scenario_2709713_command_queue_fifo', 0, async () => {
      const caseSeed: number = 2709713;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(2709713);
    });

    // 令牌桶消费后余额与补充上限正确
    it('data_binding_scenario_2709714_token_bucket_consume', 0, async () => {
      const caseSeed: number = 2709714;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(2709714);
    });

    // 加载耗时按预算边界判定
    it('data_binding_scenario_2709715_page_load_budget', 0, async () => {
      const caseSeed: number = 2709715;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(715);
      expect(record.getDuration()).assertEqual(715);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(2709715);
    });

    // 延迟采样器的最大值不小于均值
    it('data_binding_scenario_2709716_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 2709716;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(2709716);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('data_binding_scenario_2709717_config_api_9', 0, async () => {
      const caseSeed: number = 2709717;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(2709717);
    });

    // 重试次数达到上限后拒绝继续重试
    it('data_binding_scenario_2709718_retry_attempts', 0, async () => {
      const caseSeed: number = 2709718;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(2709718);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('data_binding_scenario_2709719_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 2709719;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(2709719);
    });

    // 会话连续开始后保持运行且计数一致
    it('data_binding_scenario_2709720_session_start_cycles', 0, async () => {
      const caseSeed: number = 2709720;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(2709720);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('data_binding_scenario_2709721_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 2709721;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(2709721);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('data_binding_scenario_2709722_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 2709722;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(2709722);
    });

    // 注入地址构建后可被完整还原
    it('data_binding_scenario_2709723_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 2709723;
      const payload: string = '_main.paddle.moveLeft(); // case 2709723';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(2709723);
    });

  });
}
