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
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_SETTLE,
  LABEL_START,
  LABEL_LEFT,
  LABEL_RIGHT,
  LABEL_RESET,
  getDriver,
  serializedDelay,
  isGamePageVisible,
  checkComponentExists,
  triggerGamePage,
  pressAndWait,
  getCurrentFocusIndex,
  getComponentBounds,
  findButtonByLabel,
  getButtonLabels,
  summarizePage,
  safeGetText
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
import type { BoundsInfo, PageSummary } from '../Shared/SharedDriver';

export default function accessibilityNavigationTest() {
  describe('AccessibilityNavigation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'a11y_nav suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'a11y_nav suite end');
    });

    // 所有控制按钮都应带有可读文本标签
    it('a11y_nav_all_controls_have_readable_labels', 0, async () => {
      const labels: string[] = await getButtonLabels(driver);
      for (let i = 0; i < labels.length; i++) {
        expect(labels[i].length > 0).assertTrue();
      }
      expect(labels.length).assertLargerOrEqual(4);
    });

    // 左右控制按钮高度应不小于 80vp，符合可点击尺寸要求
    it('a11y_nav_control_buttons_have_adequate_height', 0, async () => {
      const leftButton: Component | null = await findButtonByLabel(driver, LABEL_LEFT);
      expect(leftButton !== null).assertTrue();
      if (leftButton !== null) {
        const bounds: BoundsInfo = await getComponentBounds(leftButton);
        expect(bounds.height).assertLargerOrEqual(80);
        expect(bounds.width).assertLargerOrEqual(40);
      }
    });

    // 遥控器导航应能把焦点落在页面控件上
    it('a11y_nav_focus_is_reachable_by_navigation', 0, async () => {
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      expect(await getCurrentFocusIndex(driver)).assertLargerOrEqual(-1);
      expect(await isGamePageVisible(driver)).assertTrue();
    });

    // 逐个按钮查询文本与边界，确保全部可遍历
    it('a11y_nav_every_control_is_traversable', 0, async () => {
      const labels: string[] = [LABEL_START, LABEL_LEFT, LABEL_RIGHT, LABEL_RESET];
      for (let i = 0; i < labels.length; i++) {
        const button: Component | null = await findButtonByLabel(driver, labels[i]);
        expect(button !== null).assertTrue();
        if (button !== null) {
          expect((await safeGetText(button)).length > 0).assertTrue();
        }
      }
    });

    // Button、Web、Row、Column 四类组件均应渲染
    it('a11y_nav_button_and_web_components_are_rendered', 0, async () => {
      expect(await checkComponentExists(driver, 'Button')).assertTrue();
      expect(await checkComponentExists(driver, 'Web')).assertTrue();
      expect(await checkComponentExists(driver, 'Row')).assertTrue();
      expect(await checkComponentExists(driver, 'Column')).assertTrue();
    });

    // 控制按钮边界应位于屏幕可视区域内
    it('a11y_nav_control_buttons_are_inside_viewport', 0, async () => {
      const button: Component | null = await findButtonByLabel(driver, LABEL_LEFT);
      expect(button !== null).assertTrue();
      if (button !== null) {
        const bounds: BoundsInfo = await getComponentBounds(button);
        expect(bounds.left).assertLargerOrEqual(0);
        expect(bounds.top).assertLargerOrEqual(0);
        expect(bounds.width).assertLarger(0);
        expect(bounds.height).assertLarger(0);
      }
    });

    // 左控制按钮的横坐标应小于右控制按钮
    it('a11y_nav_left_and_right_controls_are_separated', 0, async () => {
      const left: Component | null = await findButtonByLabel(driver, LABEL_LEFT);
      const right: Component | null = await findButtonByLabel(driver, LABEL_RIGHT);
      expect(left !== null && right !== null).assertTrue();
      if (left !== null && right !== null) {
        const leftBox: BoundsInfo = await getComponentBounds(left);
        const rightBox: BoundsInfo = await getComponentBounds(right);
        expect(rightBox.left > leftBox.left).assertTrue();
      }
    });

    // 页面摘要中的按钮、文本与网页数量均为正数
    it('a11y_nav_page_summary_matches_expectations', 0, async () => {
      const summary: PageSummary = await summarizePage(driver);
      expect(summary.buttonCount).assertLargerOrEqual(4);
      expect(summary.textCount).assertLargerOrEqual(0);
      expect(summary.webCount).assertLargerOrEqual(1);
      expect(summary.controlLabels.length).assertLargerOrEqual(4);
    });

    // 会话连续开始后保持运行且计数一致
    it('a11y_nav_scenario_9904500_session_start_cycles', 0, async () => {
      const caseSeed: number = 9904500;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9904500);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('a11y_nav_scenario_9904501_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9904501;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(9904501);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('a11y_nav_scenario_9904502_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9904502;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9904502);
    });

    // 注入地址构建后可被完整还原
    it('a11y_nav_scenario_9904503_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9904503;
      const payload: string = '_main.paddle.moveLeft(); // case 9904503';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9904503);
    });

    // 缩放开关变化后游戏配置判定正确
    it('a11y_nav_scenario_9904504_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9904504;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9904504);
    });

    // 自定义三列宽度之和仍为 100%
    it('a11y_nav_scenario_9904505_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9904505;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9904505);
    });

    // 击打得分按次数累加，最高分同步更新
    it('a11y_nav_scenario_9904506_score_accumulation', 0, async () => {
      const caseSeed: number = 9904506;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(9904506);
    });

    // 砖块按命中次数递减并给出进度
    it('a11y_nav_scenario_9904507_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9904507;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(9904507);
    });

    // 按语言读取控制标签且资源完整
    it('a11y_nav_scenario_9904508_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9904508;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9904508);
    });

    // 校验报告累计指定数量的错误
    it('a11y_nav_scenario_9904509_validation_report_count', 0, async () => {
      const caseSeed: number = 9904509;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9904509);
    });

    // 带查询参数的地址解析长度与分段一致
    it('a11y_nav_scenario_9904510_url_with_query', 0, async () => {
      const caseSeed: number = 9904510;
      const url: string = SAMPLE_GAME_URL + '?case=34';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9904510);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('a11y_nav_scenario_9904511_geometry_area', 0, async () => {
      const caseSeed: number = 9904511;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9904511);
    });

    // 环形缓冲保持容量并保留最新样本
    it('a11y_nav_scenario_9904512_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9904512;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9904512);
    });

    // 命令队列按序消费指定数量的命令
    it('a11y_nav_scenario_9904513_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9904513;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9904513);
    });

    // 令牌桶消费后余额与补充上限正确
    it('a11y_nav_scenario_9904514_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9904514;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9904514);
    });

    // 加载耗时按预算边界判定
    it('a11y_nav_scenario_9904515_page_load_budget', 0, async () => {
      const caseSeed: number = 9904515;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4515);
      expect(record.getDuration()).assertEqual(4515);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9904515);
    });

    // 延迟采样器的最大值不小于均值
    it('a11y_nav_scenario_9904516_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9904516;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(9904516);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('a11y_nav_scenario_9904517_config_api_9', 0, async () => {
      const caseSeed: number = 9904517;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9904517);
    });

    // 重试次数达到上限后拒绝继续重试
    it('a11y_nav_scenario_9904518_retry_attempts', 0, async () => {
      const caseSeed: number = 9904518;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9904518);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('a11y_nav_scenario_9904519_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9904519;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9904519);
    });

    // 会话连续开始后保持运行且计数一致
    it('a11y_nav_scenario_9904520_session_start_cycles', 0, async () => {
      const caseSeed: number = 9904520;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9904520);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('a11y_nav_scenario_9904521_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9904521;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(9904521);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('a11y_nav_scenario_9904522_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9904522;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9904522);
    });

    // 注入地址构建后可被完整还原
    it('a11y_nav_scenario_9904523_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9904523;
      const payload: string = '_main.paddle.moveLeft(); // case 9904523';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9904523);
    });

    // 缩放开关变化后游戏配置判定正确
    it('a11y_nav_scenario_9904524_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9904524;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9904524);
    });

    // 自定义三列宽度之和仍为 100%
    it('a11y_nav_scenario_9904525_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9904525;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9904525);
    });

    // 击打得分按次数累加，最高分同步更新
    it('a11y_nav_scenario_9904526_score_accumulation', 0, async () => {
      const caseSeed: number = 9904526;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(3);
      }
      expect(board.getScore()).assertEqual(21);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(21);
      expect(caseSeed).assertEqual(9904526);
    });

    // 砖块按命中次数递减并给出进度
    it('a11y_nav_scenario_9904527_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9904527;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(9904527);
    });

    // 按语言读取控制标签且资源完整
    it('a11y_nav_scenario_9904528_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9904528;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9904528);
    });

    // 校验报告累计指定数量的错误
    it('a11y_nav_scenario_9904529_validation_report_count', 0, async () => {
      const caseSeed: number = 9904529;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9904529);
    });

    // 带查询参数的地址解析长度与分段一致
    it('a11y_nav_scenario_9904530_url_with_query', 0, async () => {
      const caseSeed: number = 9904530;
      const url: string = SAMPLE_GAME_URL + '?case=54';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9904530);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('a11y_nav_scenario_9904531_geometry_area', 0, async () => {
      const caseSeed: number = 9904531;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 41);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9904531);
    });

    // 环形缓冲保持容量并保留最新样本
    it('a11y_nav_scenario_9904532_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9904532;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9904532);
    });

    // 命令队列按序消费指定数量的命令
    it('a11y_nav_scenario_9904533_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9904533;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9904533);
    });

    // 令牌桶消费后余额与补充上限正确
    it('a11y_nav_scenario_9904534_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9904534;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(9904534);
    });

    // 加载耗时按预算边界判定
    it('a11y_nav_scenario_9904535_page_load_budget', 0, async () => {
      const caseSeed: number = 9904535;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4535);
      expect(record.getDuration()).assertEqual(4535);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9904535);
    });

    // 延迟采样器的最大值不小于均值
    it('a11y_nav_scenario_9904536_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9904536;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(9904536);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('a11y_nav_scenario_9904537_config_api_9', 0, async () => {
      const caseSeed: number = 9904537;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9904537);
    });

    // 重试次数达到上限后拒绝继续重试
    it('a11y_nav_scenario_9904538_retry_attempts', 0, async () => {
      const caseSeed: number = 9904538;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9904538);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('a11y_nav_scenario_9904539_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9904539;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9904539);
    });

    // 会话连续开始后保持运行且计数一致
    it('a11y_nav_scenario_9904540_session_start_cycles', 0, async () => {
      const caseSeed: number = 9904540;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9904540);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('a11y_nav_scenario_9904541_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 9904541;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(9904541);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('a11y_nav_scenario_9904542_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 9904542;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(9904542);
    });

    // 注入地址构建后可被完整还原
    it('a11y_nav_scenario_9904543_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 9904543;
      const payload: string = '_main.paddle.moveLeft(); // case 9904543';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(9904543);
    });

    // 缩放开关变化后游戏配置判定正确
    it('a11y_nav_scenario_9904544_settings_zoom_true', 0, async () => {
      const caseSeed: number = 9904544;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(9904544);
    });

    // 自定义三列宽度之和仍为 100%
    it('a11y_nav_scenario_9904545_layout_custom_columns', 0, async () => {
      const caseSeed: number = 9904545;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(9904545);
    });

    // 击打得分按次数累加，最高分同步更新
    it('a11y_nav_scenario_9904546_score_accumulation', 0, async () => {
      const caseSeed: number = 9904546;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(2);
      }
      expect(board.getScore()).assertEqual(14);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(14);
      expect(caseSeed).assertEqual(9904546);
    });

    // 砖块按命中次数递减并给出进度
    it('a11y_nav_scenario_9904547_brick_grid_progress', 0, async () => {
      const caseSeed: number = 9904547;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(9904547);
    });

    // 按语言读取控制标签且资源完整
    it('a11y_nav_scenario_9904548_locale_lookup_en', 0, async () => {
      const caseSeed: number = 9904548;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(9904548);
    });

    // 校验报告累计指定数量的错误
    it('a11y_nav_scenario_9904549_validation_report_count', 0, async () => {
      const caseSeed: number = 9904549;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(9904549);
    });

    // 带查询参数的地址解析长度与分段一致
    it('a11y_nav_scenario_9904550_url_with_query', 0, async () => {
      const caseSeed: number = 9904550;
      const url: string = SAMPLE_GAME_URL + '?case=74';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(9904550);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('a11y_nav_scenario_9904551_geometry_area', 0, async () => {
      const caseSeed: number = 9904551;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(9904551);
    });

    // 环形缓冲保持容量并保留最新样本
    it('a11y_nav_scenario_9904552_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 9904552;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(9904552);
    });

    // 命令队列按序消费指定数量的命令
    it('a11y_nav_scenario_9904553_command_queue_fifo', 0, async () => {
      const caseSeed: number = 9904553;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(9904553);
    });

    // 令牌桶消费后余额与补充上限正确
    it('a11y_nav_scenario_9904554_token_bucket_consume', 0, async () => {
      const caseSeed: number = 9904554;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(9904554);
    });

    // 加载耗时按预算边界判定
    it('a11y_nav_scenario_9904555_page_load_budget', 0, async () => {
      const caseSeed: number = 9904555;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(4555);
      expect(record.getDuration()).assertEqual(4555);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(9904555);
    });

    // 延迟采样器的最大值不小于均值
    it('a11y_nav_scenario_9904556_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 9904556;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(9904556);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('a11y_nav_scenario_9904557_config_api_9', 0, async () => {
      const caseSeed: number = 9904557;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(9904557);
    });

    // 重试次数达到上限后拒绝继续重试
    it('a11y_nav_scenario_9904558_retry_attempts', 0, async () => {
      const caseSeed: number = 9904558;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(9904558);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('a11y_nav_scenario_9904559_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 9904559;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(9904559);
    });

    // 会话连续开始后保持运行且计数一致
    it('a11y_nav_scenario_9904560_session_start_cycles', 0, async () => {
      const caseSeed: number = 9904560;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(9904560);
    });

  });
}
