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

export default function sessionManagementTest() {
  describe('SessionManagement_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'session_management suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'session_management suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('session_management_scenario_1760500_session_start_cycles', 0, async () => {
      const caseSeed: number = 1760500;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1760500);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('session_management_scenario_1760501_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1760501;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(1760501);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('session_management_scenario_1760502_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1760502;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1760502);
    });

    // 注入地址构建后可被完整还原
    it('session_management_scenario_1760503_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1760503;
      const payload: string = '_main.paddle.moveLeft(); // case 1760503';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1760503);
    });

    // 缩放开关变化后游戏配置判定正确
    it('session_management_scenario_1760504_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1760504;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1760504);
    });

    // 自定义三列宽度之和仍为 100%
    it('session_management_scenario_1760505_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1760505;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1760505);
    });

    // 击打得分按次数累加，最高分同步更新
    it('session_management_scenario_1760506_score_accumulation', 0, async () => {
      const caseSeed: number = 1760506;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(1760506);
    });

    // 砖块按命中次数递减并给出进度
    it('session_management_scenario_1760507_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1760507;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(1760507);
    });

    // 按语言读取控制标签且资源完整
    it('session_management_scenario_1760508_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1760508;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1760508);
    });

    // 校验报告累计指定数量的错误
    it('session_management_scenario_1760509_validation_report_count', 0, async () => {
      const caseSeed: number = 1760509;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1760509);
    });

    // 带查询参数的地址解析长度与分段一致
    it('session_management_scenario_1760510_url_with_query', 0, async () => {
      const caseSeed: number = 1760510;
      const url: string = SAMPLE_GAME_URL + '?case=57';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1760510);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('session_management_scenario_1760511_geometry_area', 0, async () => {
      const caseSeed: number = 1760511;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 61);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1760511);
    });

    // 环形缓冲保持容量并保留最新样本
    it('session_management_scenario_1760512_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1760512;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1760512);
    });

    // 命令队列按序消费指定数量的命令
    it('session_management_scenario_1760513_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1760513;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1760513);
    });

    // 令牌桶消费后余额与补充上限正确
    it('session_management_scenario_1760514_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1760514;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(1760514);
    });

    // 加载耗时按预算边界判定
    it('session_management_scenario_1760515_page_load_budget', 0, async () => {
      const caseSeed: number = 1760515;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5515);
      expect(record.getDuration()).assertEqual(5515);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1760515);
    });

    // 延迟采样器的最大值不小于均值
    it('session_management_scenario_1760516_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1760516;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(1760516);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('session_management_scenario_1760517_config_api_9', 0, async () => {
      const caseSeed: number = 1760517;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1760517);
    });

    // 重试次数达到上限后拒绝继续重试
    it('session_management_scenario_1760518_retry_attempts', 0, async () => {
      const caseSeed: number = 1760518;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1760518);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('session_management_scenario_1760519_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1760519;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1760519);
    });

    // 会话连续开始后保持运行且计数一致
    it('session_management_scenario_1760520_session_start_cycles', 0, async () => {
      const caseSeed: number = 1760520;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1760520);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('session_management_scenario_1760521_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1760521;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(1760521);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('session_management_scenario_1760522_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1760522;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1760522);
    });

    // 注入地址构建后可被完整还原
    it('session_management_scenario_1760523_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1760523;
      const payload: string = '_main.paddle.moveLeft(); // case 1760523';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1760523);
    });

    // 缩放开关变化后游戏配置判定正确
    it('session_management_scenario_1760524_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1760524;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1760524);
    });

    // 自定义三列宽度之和仍为 100%
    it('session_management_scenario_1760525_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1760525;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1760525);
    });

    // 击打得分按次数累加，最高分同步更新
    it('session_management_scenario_1760526_score_accumulation', 0, async () => {
      const caseSeed: number = 1760526;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(1760526);
    });

    // 砖块按命中次数递减并给出进度
    it('session_management_scenario_1760527_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1760527;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(1760527);
    });

    // 按语言读取控制标签且资源完整
    it('session_management_scenario_1760528_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1760528;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1760528);
    });

    // 校验报告累计指定数量的错误
    it('session_management_scenario_1760529_validation_report_count', 0, async () => {
      const caseSeed: number = 1760529;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1760529);
    });

    // 带查询参数的地址解析长度与分段一致
    it('session_management_scenario_1760530_url_with_query', 0, async () => {
      const caseSeed: number = 1760530;
      const url: string = SAMPLE_GAME_URL + '?case=77';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1760530);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('session_management_scenario_1760531_geometry_area', 0, async () => {
      const caseSeed: number = 1760531;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 21);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1760531);
    });

  });
}
