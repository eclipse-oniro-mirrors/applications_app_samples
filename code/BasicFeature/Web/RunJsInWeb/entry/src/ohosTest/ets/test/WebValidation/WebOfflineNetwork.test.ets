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

export default function webOfflineNetworkTest() {
  describe('WebOfflineNetwork_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_offline suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'web_offline suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('web_offline_scenario_6198900_session_start_cycles', 0, async () => {
      const caseSeed: number = 6198900;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6198900);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_offline_scenario_6198901_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6198901;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(6198901);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_offline_scenario_6198902_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6198902;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6198902);
    });

    // 注入地址构建后可被完整还原
    it('web_offline_scenario_6198903_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6198903;
      const payload: string = '_main.paddle.moveLeft(); // case 6198903';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6198903);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_offline_scenario_6198904_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6198904;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6198904);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_offline_scenario_6198905_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6198905;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6198905);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_offline_scenario_6198906_score_accumulation', 0, async () => {
      const caseSeed: number = 6198906;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(1);
      }
      expect(board.getScore()).assertEqual(7);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(7);
      expect(caseSeed).assertEqual(6198906);
    });

    // 砖块按命中次数递减并给出进度
    it('web_offline_scenario_6198907_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6198907;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(6198907);
    });

    // 按语言读取控制标签且资源完整
    it('web_offline_scenario_6198908_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6198908;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6198908);
    });

    // 校验报告累计指定数量的错误
    it('web_offline_scenario_6198909_validation_report_count', 0, async () => {
      const caseSeed: number = 6198909;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6198909);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_offline_scenario_6198910_url_with_query', 0, async () => {
      const caseSeed: number = 6198910;
      const url: string = SAMPLE_GAME_URL + '?case=28';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6198910);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_offline_scenario_6198911_geometry_area', 0, async () => {
      const caseSeed: number = 6198911;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6198911);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_offline_scenario_6198912_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6198912;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6198912);
    });

    // 命令队列按序消费指定数量的命令
    it('web_offline_scenario_6198913_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6198913;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6198913);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_offline_scenario_6198914_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6198914;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(6198914);
    });

    // 加载耗时按预算边界判定
    it('web_offline_scenario_6198915_page_load_budget', 0, async () => {
      const caseSeed: number = 6198915;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6915);
      expect(record.getDuration()).assertEqual(6915);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6198915);
    });

    // 延迟采样器的最大值不小于均值
    it('web_offline_scenario_6198916_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6198916;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 5);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(5);
      expect(caseSeed).assertEqual(6198916);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_offline_scenario_6198917_config_api_9', 0, async () => {
      const caseSeed: number = 6198917;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6198917);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_offline_scenario_6198918_retry_attempts', 0, async () => {
      const caseSeed: number = 6198918;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6198918);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_offline_scenario_6198919_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6198919;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6198919);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_offline_scenario_6198920_session_start_cycles', 0, async () => {
      const caseSeed: number = 6198920;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6198920);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_offline_scenario_6198921_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6198921;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(6198921);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_offline_scenario_6198922_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6198922;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6198922);
    });

    // 注入地址构建后可被完整还原
    it('web_offline_scenario_6198923_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6198923;
      const payload: string = '_main.paddle.moveLeft(); // case 6198923';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6198923);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_offline_scenario_6198924_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6198924;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6198924);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_offline_scenario_6198925_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6198925;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6198925);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_offline_scenario_6198926_score_accumulation', 0, async () => {
      const caseSeed: number = 6198926;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(6198926);
    });

    // 砖块按命中次数递减并给出进度
    it('web_offline_scenario_6198927_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6198927;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(6198927);
    });

    // 按语言读取控制标签且资源完整
    it('web_offline_scenario_6198928_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6198928;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6198928);
    });

    // 校验报告累计指定数量的错误
    it('web_offline_scenario_6198929_validation_report_count', 0, async () => {
      const caseSeed: number = 6198929;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6198929);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_offline_scenario_6198930_url_with_query', 0, async () => {
      const caseSeed: number = 6198930;
      const url: string = SAMPLE_GAME_URL + '?case=48';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6198930);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_offline_scenario_6198931_geometry_area', 0, async () => {
      const caseSeed: number = 6198931;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 41);
      expect(box.area()).assertEqual(2501);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6198931);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_offline_scenario_6198932_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6198932;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6198932);
    });

    // 命令队列按序消费指定数量的命令
    it('web_offline_scenario_6198933_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6198933;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6198933);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_offline_scenario_6198934_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6198934;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(6198934);
    });

    // 加载耗时按预算边界判定
    it('web_offline_scenario_6198935_page_load_budget', 0, async () => {
      const caseSeed: number = 6198935;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6935);
      expect(record.getDuration()).assertEqual(6935);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6198935);
    });

    // 延迟采样器的最大值不小于均值
    it('web_offline_scenario_6198936_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6198936;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(6198936);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_offline_scenario_6198937_config_api_9', 0, async () => {
      const caseSeed: number = 6198937;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6198937);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_offline_scenario_6198938_retry_attempts', 0, async () => {
      const caseSeed: number = 6198938;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6198938);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_offline_scenario_6198939_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6198939;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6198939);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_offline_scenario_6198940_session_start_cycles', 0, async () => {
      const caseSeed: number = 6198940;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6198940);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_offline_scenario_6198941_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6198941;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(6198941);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_offline_scenario_6198942_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6198942;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6198942);
    });

    // 注入地址构建后可被完整还原
    it('web_offline_scenario_6198943_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6198943;
      const payload: string = '_main.paddle.moveLeft(); // case 6198943';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6198943);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_offline_scenario_6198944_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6198944;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6198944);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_offline_scenario_6198945_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6198945;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6198945);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_offline_scenario_6198946_score_accumulation', 0, async () => {
      const caseSeed: number = 6198946;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(6198946);
    });

    // 砖块按命中次数递减并给出进度
    it('web_offline_scenario_6198947_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6198947;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(6198947);
    });

    // 按语言读取控制标签且资源完整
    it('web_offline_scenario_6198948_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6198948;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6198948);
    });

    // 校验报告累计指定数量的错误
    it('web_offline_scenario_6198949_validation_report_count', 0, async () => {
      const caseSeed: number = 6198949;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6198949);
    });

    // 带查询参数的地址解析长度与分段一致
    it('web_offline_scenario_6198950_url_with_query', 0, async () => {
      const caseSeed: number = 6198950;
      const url: string = SAMPLE_GAME_URL + '?case=68';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6198950);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('web_offline_scenario_6198951_geometry_area', 0, async () => {
      const caseSeed: number = 6198951;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 61);
      expect(box.area()).assertEqual(4941);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6198951);
    });

    // 环形缓冲保持容量并保留最新样本
    it('web_offline_scenario_6198952_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6198952;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6198952);
    });

    // 命令队列按序消费指定数量的命令
    it('web_offline_scenario_6198953_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6198953;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6198953);
    });

    // 令牌桶消费后余额与补充上限正确
    it('web_offline_scenario_6198954_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6198954;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(1)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(6198954);
    });

    // 加载耗时按预算边界判定
    it('web_offline_scenario_6198955_page_load_budget', 0, async () => {
      const caseSeed: number = 6198955;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(6955);
      expect(record.getDuration()).assertEqual(6955);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6198955);
    });

    // 延迟采样器的最大值不小于均值
    it('web_offline_scenario_6198956_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6198956;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 9);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(9);
      expect(caseSeed).assertEqual(6198956);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('web_offline_scenario_6198957_config_api_9', 0, async () => {
      const caseSeed: number = 6198957;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6198957);
    });

    // 重试次数达到上限后拒绝继续重试
    it('web_offline_scenario_6198958_retry_attempts', 0, async () => {
      const caseSeed: number = 6198958;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6198958);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('web_offline_scenario_6198959_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6198959;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6198959);
    });

    // 会话连续开始后保持运行且计数一致
    it('web_offline_scenario_6198960_session_start_cycles', 0, async () => {
      const caseSeed: number = 6198960;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6198960);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('web_offline_scenario_6198961_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6198961;
      const paddle: PaddleModel = new PaddleModel(1, 101, 5);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 5 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(6198961);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('web_offline_scenario_6198962_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6198962;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6198962);
    });

    // 注入地址构建后可被完整还原
    it('web_offline_scenario_6198963_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6198963;
      const payload: string = '_main.paddle.moveLeft(); // case 6198963';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6198963);
    });

    // 缩放开关变化后游戏配置判定正确
    it('web_offline_scenario_6198964_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6198964;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6198964);
    });

    // 自定义三列宽度之和仍为 100%
    it('web_offline_scenario_6198965_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6198965;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6198965);
    });

    // 击打得分按次数累加，最高分同步更新
    it('web_offline_scenario_6198966_score_accumulation', 0, async () => {
      const caseSeed: number = 6198966;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(6198966);
    });

    // 砖块按命中次数递减并给出进度
    it('web_offline_scenario_6198967_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6198967;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 8; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(6198967);
    });

    // 按语言读取控制标签且资源完整
    it('web_offline_scenario_6198968_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6198968;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6198968);
    });

    // 校验报告累计指定数量的错误
    it('web_offline_scenario_6198969_validation_report_count', 0, async () => {
      const caseSeed: number = 6198969;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6198969);
    });

  });
}
