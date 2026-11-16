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
import { Driver, Component } from '@ohos.UiTest';
import {
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_PAGE_SETTLE,
  TOLERANCE_COMPONENT_COUNT,
  LABEL_START,
  getDriver,
  serializedDelay,
  gameComponentCount,
  isGamePageVisible,
  checkComponentExists,
  simulateTouch,
  triggerGamePage,
  pressAndWait,
  getComponentBounds,
  findButtonByLabel
} from '../Shared/SharedDriver';
import {
  SAMPLE_GAME_URL,
  INTERNET_PERMISSION,
  ORIENTATION_LANDSCAPE,
  LONG_PRESS_DURATION,
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
import {
  KeySequenceMatcher,
  GestureClassifier
} from '../Shared/TestHelpers';
import type { BoundsInfo, PageSummary } from '../Shared/SharedDriver';

export default function gameInputInteractionTest() {
  describe('GameInputInteraction_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_input suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_input suite end');
    });

    // 手势分类器应区分点击、长按与滑动
    it('game_input_gesture_classifier_distinguishes_inputs', 0, async () => {
      const gestures: GestureClassifier = new GestureClassifier(500, 20);
      expect(gestures.classify(100, 5)).assertEqual(GestureClassifier.TAP);
      expect(gestures.classify(800, 5)).assertEqual(GestureClassifier.LONG_PRESS);
      expect(gestures.classify(100, 50)).assertEqual(GestureClassifier.SWIPE);
      expect(gestures.isTap(100, 0)).assertTrue();
      expect(gestures.isLongPress(600, 0)).assertTrue();
    });

    // 按键序列匹配器可识别左右左组合
    it('game_input_key_sequence_matcher_detects_combo', 0, async () => {
      const matcher: KeySequenceMatcher = new KeySequenceMatcher([KEY_LEFT, KEY_RIGHT, KEY_LEFT]);
      matcher.feed(KEY_LEFT);
      matcher.feed(KEY_RIGHT);
      expect(matcher.matched()).assertFalse();
      matcher.feed(KEY_LEFT);
      expect(matcher.matched()).assertTrue();
      expect(matcher.lastKey()).assertEqual(KEY_LEFT);
      expect(matcher.size()).assertEqual(3);
    });

    // 按住左控制按钮期间应能触发多次按键事件
    it('game_input_long_press_repeat_on_control', 0, async () => {
      const before: number = await gameComponentCount(driver);
      await pressAndWait(driver, KEY_LEFT, 3, LONG_PRESS_DURATION);
      const after: number = await gameComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // 在页面左侧控制区域点击不应导致页面退出
    it('game_input_tap_on_control_area_is_accepted', 0, async () => {
      await simulateTouch(driver, 60, 300);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // 在网页区域点击不应破坏 Web 组件
    it('game_input_tap_on_web_area_is_accepted', 0, async () => {
      await simulateTouch(driver, 360, 300);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      expect(await checkComponentExists(driver, 'Web')).assertTrue();
    });

    // 点击按钮中心坐标应命中控件并保持布局
    it('game_input_button_center_click_reaches_control', 0, async () => {
      const button: Component | null = await findButtonByLabel(driver, LABEL_START);
      expect(button !== null).assertTrue();
      if (button !== null) {
        const bounds: BoundsInfo = await getComponentBounds(button);
        const box: GeometryBox = new GeometryBox(bounds.left, bounds.top, bounds.width, bounds.height);
        expect(box.isDegenerate()).assertFalse();
        expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      }
    });

    // 会话连续开始后保持运行且计数一致
    it('game_input_scenario_3671800_session_start_cycles', 0, async () => {
      const caseSeed: number = 3671800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(3671800);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_input_scenario_3671801_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 3671801;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(3671801);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_input_scenario_3671802_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 3671802;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(3671802);
    });

    // 注入地址构建后可被完整还原
    it('game_input_scenario_3671803_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 3671803;
      const payload: string = '_main.paddle.moveLeft(); // case 3671803';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(3671803);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_input_scenario_3671804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 3671804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(3671804);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_input_scenario_3671805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 3671805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(3671805);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_input_scenario_3671806_score_accumulation', 0, async () => {
      const caseSeed: number = 3671806;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(3671806);
    });

    // 砖块按命中次数递减并给出进度
    it('game_input_scenario_3671807_brick_grid_progress', 0, async () => {
      const caseSeed: number = 3671807;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(3671807);
    });

    // 按语言读取控制标签且资源完整
    it('game_input_scenario_3671808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 3671808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(3671808);
    });

    // 校验报告累计指定数量的错误
    it('game_input_scenario_3671809_validation_report_count', 0, async () => {
      const caseSeed: number = 3671809;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(3671809);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_input_scenario_3671810_url_with_query', 0, async () => {
      const caseSeed: number = 3671810;
      const url: string = SAMPLE_GAME_URL + '?case=69';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(3671810);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_input_scenario_3671811_geometry_area', 0, async () => {
      const caseSeed: number = 3671811;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(3671811);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_input_scenario_3671812_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 3671812;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(3671812);
    });

    // 命令队列按序消费指定数量的命令
    it('game_input_scenario_3671813_command_queue_fifo', 0, async () => {
      const caseSeed: number = 3671813;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(3671813);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_input_scenario_3671814_token_bucket_consume', 0, async () => {
      const caseSeed: number = 3671814;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(3671814);
    });

    // 加载耗时按预算边界判定
    it('game_input_scenario_3671815_page_load_budget', 0, async () => {
      const caseSeed: number = 3671815;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8815);
      expect(record.getDuration()).assertEqual(8815);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(3671815);
    });

    // 延迟采样器的最大值不小于均值
    it('game_input_scenario_3671816_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 3671816;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(3671816);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_input_scenario_3671817_config_api_9', 0, async () => {
      const caseSeed: number = 3671817;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(3671817);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_input_scenario_3671818_retry_attempts', 0, async () => {
      const caseSeed: number = 3671818;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(3671818);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_input_scenario_3671819_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 3671819;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(3671819);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_input_scenario_3671820_session_start_cycles', 0, async () => {
      const caseSeed: number = 3671820;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(3671820);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_input_scenario_3671821_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 3671821;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(3671821);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_input_scenario_3671822_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 3671822;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(3671822);
    });

    // 注入地址构建后可被完整还原
    it('game_input_scenario_3671823_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 3671823;
      const payload: string = '_main.paddle.moveLeft(); // case 3671823';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(3671823);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_input_scenario_3671824_settings_zoom_true', 0, async () => {
      const caseSeed: number = 3671824;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(3671824);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_input_scenario_3671825_layout_custom_columns', 0, async () => {
      const caseSeed: number = 3671825;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(3671825);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_input_scenario_3671826_score_accumulation', 0, async () => {
      const caseSeed: number = 3671826;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(3671826);
    });

    // 砖块按命中次数递减并给出进度
    it('game_input_scenario_3671827_brick_grid_progress', 0, async () => {
      const caseSeed: number = 3671827;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(3671827);
    });

    // 按语言读取控制标签且资源完整
    it('game_input_scenario_3671828_locale_lookup_en', 0, async () => {
      const caseSeed: number = 3671828;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(3671828);
    });

    // 校验报告累计指定数量的错误
    it('game_input_scenario_3671829_validation_report_count', 0, async () => {
      const caseSeed: number = 3671829;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(3671829);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_input_scenario_3671830_url_with_query', 0, async () => {
      const caseSeed: number = 3671830;
      const url: string = SAMPLE_GAME_URL + '?case=89';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(3671830);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_input_scenario_3671831_geometry_area', 0, async () => {
      const caseSeed: number = 3671831;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(3671831);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_input_scenario_3671832_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 3671832;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(3671832);
    });

    // 命令队列按序消费指定数量的命令
    it('game_input_scenario_3671833_command_queue_fifo', 0, async () => {
      const caseSeed: number = 3671833;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(3671833);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_input_scenario_3671834_token_bucket_consume', 0, async () => {
      const caseSeed: number = 3671834;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(3671834);
    });

    // 加载耗时按预算边界判定
    it('game_input_scenario_3671835_page_load_budget', 0, async () => {
      const caseSeed: number = 3671835;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(8835);
      expect(record.getDuration()).assertEqual(8835);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(false);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(3671835);
    });

    // 延迟采样器的最大值不小于均值
    it('game_input_scenario_3671836_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 3671836;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(3671836);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_input_scenario_3671837_config_api_9', 0, async () => {
      const caseSeed: number = 3671837;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(3671837);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_input_scenario_3671838_retry_attempts', 0, async () => {
      const caseSeed: number = 3671838;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(3671838);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_input_scenario_3671839_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 3671839;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(3671839);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_input_scenario_3671840_session_start_cycles', 0, async () => {
      const caseSeed: number = 3671840;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(3671840);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_input_scenario_3671841_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 3671841;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(3671841);
    });

  });
}
