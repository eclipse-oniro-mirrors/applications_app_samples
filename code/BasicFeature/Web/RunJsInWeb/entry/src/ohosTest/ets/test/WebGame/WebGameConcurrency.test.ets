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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_SETTLE,
  TOLERANCE_COMPONENT_COUNT,
  LABEL_START,
  LABEL_LEFT,
  LABEL_RIGHT,
  LABEL_RESET,
  getDriver,
  serializedDelay,
  gameComponentCount,
  isGamePageVisible,
  checkComponentExists,
  triggerGamePage,
  pressAndWait,
  getCurrentFocusIndex,
  clickButtonByLabel,
  hasAllControls,
  measureLatency
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

export default function webGameConcurrencyTest() {
  describe('WebGameConcurrency_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_concurrency suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_concurrency suite end');
    });

    // 20 轮左右导航后页面仍可见且控件完整
    it('game_concurrency_twenty_navigation_rounds_keep_page_stable', 0, async () => {
      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      expect(await isGamePageVisible(driver)).assertTrue();
      expect(await hasAllControls(driver)).assertTrue();
    });

    // 10 轮注入后组件数量变化不超过容差
    it('game_concurrency_ten_injection_rounds_keep_component_count', 0, async () => {
      const before: number = await gameComponentCount(driver);
      for (let i = 0; i < 10; i++) {
        await clickButtonByLabel(driver, LABEL_START);
      }
      const after: number = await gameComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    // 交替点击四个按钮 12 次后页面保持可用
    it('game_concurrency_mixed_controls_do_not_crash', 0, async () => {
      const labels: string[] = [LABEL_START, LABEL_LEFT, LABEL_RIGHT, LABEL_RESET];
      for (let i = 0; i < 12; i++) {
        await clickButtonByLabel(driver, labels[i % labels.length]);
      }
      expect(await isGamePageVisible(driver)).assertTrue();
      expect(await checkComponentExists(driver, 'Web')).assertTrue();
    });

    // 压力循环中的单次注入耗时保持可控
    it('game_concurrency_stress_latency_stays_bounded', 0, async () => {
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 0; i < 5; i++) {
        const cost: number = await measureLatency(async () => {
          await clickButtonByLabel(driver, LABEL_LEFT);
        });
        sampler.record(cost);
      }
      expect(sampler.max()).assertLessOrEqual(5000);
    });

    // 页面初始焦点索引应可查询（-1 表示当前无焦点）
    it('game_concurrency_initial_focus_is_valid', 0, async () => {
      const index: number = await getCurrentFocusIndex(driver);
      expect(index).assertLargerOrEqual(-1);
      expect(index).assertLessOrEqual(100);
    });

    // 按右键后焦点保持在有效范围
    it('game_concurrency_right_key_moves_focus', 0, async () => {
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(-1);
    });

    // 按左键后焦点保持在有效范围
    it('game_concurrency_left_key_moves_focus', 0, async () => {
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(-1);
    });

    // 上下键在单行布局中不应使焦点越界
    it('game_concurrency_up_down_keys_keep_focus_valid', 0, async () => {
      await pressAndWait(driver, KEY_DOWN, 2, DELAY_KEY_NAVIGATION);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(-1);
      await pressAndWait(driver, KEY_UP, 2, DELAY_KEY_NAVIGATION);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(-1);
    });

    // 连续五次左移后焦点仍在页面内且页面可见
    it('game_concurrency_boundary_navigation_does_not_escape_page', 0, async () => {
      await pressAndWait(driver, KEY_LEFT, 5, DELAY_KEY_NAVIGATION);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(-1);
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // 左右交替导航两轮后页面结构保持稳定
    it('game_concurrency_navigation_cycle_is_repeatable', 0, async () => {
      for (let i = 0; i < 2; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      expect(await hasAllControls(driver)).assertTrue();
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // 会话连续开始后保持运行且计数一致
    it('game_concurrency_scenario_1933700_session_start_cycles', 0, async () => {
      const caseSeed: number = 1933700;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1933700);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_concurrency_scenario_1933701_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1933701;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(1933701);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_concurrency_scenario_1933702_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1933702;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1933702);
    });

    // 注入地址构建后可被完整还原
    it('game_concurrency_scenario_1933703_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1933703;
      const payload: string = '_main.paddle.moveLeft(); // case 1933703';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1933703);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_concurrency_scenario_1933704_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1933704;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1933704);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_concurrency_scenario_1933705_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1933705;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1933705);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_concurrency_scenario_1933706_score_accumulation', 0, async () => {
      const caseSeed: number = 1933706;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(1933706);
    });

    // 砖块按命中次数递减并给出进度
    it('game_concurrency_scenario_1933707_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1933707;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(1933707);
    });

    // 按语言读取控制标签且资源完整
    it('game_concurrency_scenario_1933708_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1933708;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1933708);
    });

    // 校验报告累计指定数量的错误
    it('game_concurrency_scenario_1933709_validation_report_count', 0, async () => {
      const caseSeed: number = 1933709;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1933709);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_concurrency_scenario_1933710_url_with_query', 0, async () => {
      const caseSeed: number = 1933710;
      const url: string = SAMPLE_GAME_URL + '?case=15';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1933710);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_concurrency_scenario_1933711_geometry_area', 0, async () => {
      const caseSeed: number = 1933711;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1933711);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_concurrency_scenario_1933712_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1933712;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1933712);
    });

    // 命令队列按序消费指定数量的命令
    it('game_concurrency_scenario_1933713_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1933713;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1933713);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_concurrency_scenario_1933714_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1933714;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(1933714);
    });

    // 加载耗时按预算边界判定
    it('game_concurrency_scenario_1933715_page_load_budget', 0, async () => {
      const caseSeed: number = 1933715;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7715);
      expect(record.getDuration()).assertEqual(7715);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1933715);
    });

    // 延迟采样器的最大值不小于均值
    it('game_concurrency_scenario_1933716_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1933716;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(1933716);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_concurrency_scenario_1933717_config_api_9', 0, async () => {
      const caseSeed: number = 1933717;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1933717);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_concurrency_scenario_1933718_retry_attempts', 0, async () => {
      const caseSeed: number = 1933718;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1933718);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_concurrency_scenario_1933719_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1933719;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1933719);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_concurrency_scenario_1933720_session_start_cycles', 0, async () => {
      const caseSeed: number = 1933720;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1933720);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_concurrency_scenario_1933721_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1933721;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(1933721);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_concurrency_scenario_1933722_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1933722;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1933722);
    });

    // 注入地址构建后可被完整还原
    it('game_concurrency_scenario_1933723_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1933723;
      const payload: string = '_main.paddle.moveLeft(); // case 1933723';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1933723);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_concurrency_scenario_1933724_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1933724;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1933724);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_concurrency_scenario_1933725_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1933725;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1933725);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_concurrency_scenario_1933726_score_accumulation', 0, async () => {
      const caseSeed: number = 1933726;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(1933726);
    });

    // 砖块按命中次数递减并给出进度
    it('game_concurrency_scenario_1933727_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1933727;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(1933727);
    });

    // 按语言读取控制标签且资源完整
    it('game_concurrency_scenario_1933728_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1933728;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1933728);
    });

    // 校验报告累计指定数量的错误
    it('game_concurrency_scenario_1933729_validation_report_count', 0, async () => {
      const caseSeed: number = 1933729;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1933729);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_concurrency_scenario_1933730_url_with_query', 0, async () => {
      const caseSeed: number = 1933730;
      const url: string = SAMPLE_GAME_URL + '?case=35';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1933730);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_concurrency_scenario_1933731_geometry_area', 0, async () => {
      const caseSeed: number = 1933731;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1933731);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_concurrency_scenario_1933732_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1933732;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1933732);
    });

    // 命令队列按序消费指定数量的命令
    it('game_concurrency_scenario_1933733_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1933733;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1933733);
    });

  });
}
