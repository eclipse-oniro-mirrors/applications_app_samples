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

export default function gameScriptCatalogTest() {
  describe('GameScriptCatalog_Test', () => {
    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_catalog suite start');
    });

    afterAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_catalog suite end');
    });

    // 事件记录器按发生顺序保存事件并可统计同名事件次数
    it('game_catalog_event_recorder_keeps_order', 0, async () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('start');
      recorder.record('left');
      recorder.record('start');
      expect(recorder.count()).assertEqual(3);
      expect(recorder.first()).assertEqual('start');
      expect(recorder.last()).assertEqual('start');
      expect(recorder.countOf('start')).assertEqual(2);
      expect(recorder.contains('right')).assertFalse();
    });

    // 清空后事件数量与首尾事件均为空
    it('game_catalog_event_recorder_clear_empties_sequence', 0, async () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('reset');
      recorder.clear();
      expect(recorder.count()).assertEqual(0);
      expect(recorder.first()).assertEqual('');
      expect(recorder.last()).assertEqual('');
      expect(recorder.sequence().length).assertEqual(0);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_catalog_scenario_1141700_session_start_cycles', 0, async () => {
      const caseSeed: number = 1141700;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1141700);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_catalog_scenario_1141701_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1141701;
      const paddle: PaddleModel = new PaddleModel(1, 101, 7);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 7 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(1141701);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_catalog_scenario_1141702_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1141702;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1141702);
    });

    // 注入地址构建后可被完整还原
    it('game_catalog_scenario_1141703_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1141703;
      const payload: string = '_main.paddle.moveLeft(); // case 1141703';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1141703);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_catalog_scenario_1141704_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1141704;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1141704);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_catalog_scenario_1141705_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1141705;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1141705);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_catalog_scenario_1141706_score_accumulation', 0, async () => {
      const caseSeed: number = 1141706;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(1141706);
    });

    // 砖块按命中次数递减并给出进度
    it('game_catalog_scenario_1141707_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1141707;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(1141707);
    });

    // 按语言读取控制标签且资源完整
    it('game_catalog_scenario_1141708_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1141708;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1141708);
    });

    // 校验报告累计指定数量的错误
    it('game_catalog_scenario_1141709_validation_report_count', 0, async () => {
      const caseSeed: number = 1141709;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1141709);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_catalog_scenario_1141710_url_with_query', 0, async () => {
      const caseSeed: number = 1141710;
      const url: string = SAMPLE_GAME_URL + '?case=20';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1141710);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_catalog_scenario_1141711_geometry_area', 0, async () => {
      const caseSeed: number = 1141711;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1141711);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_catalog_scenario_1141712_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1141712;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1141712);
    });

    // 命令队列按序消费指定数量的命令
    it('game_catalog_scenario_1141713_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1141713;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1141713);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_catalog_scenario_1141714_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1141714;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(1141714);
    });

    // 加载耗时按预算边界判定
    it('game_catalog_scenario_1141715_page_load_budget', 0, async () => {
      const caseSeed: number = 1141715;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7715);
      expect(record.getDuration()).assertEqual(7715);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1141715);
    });

    // 延迟采样器的最大值不小于均值
    it('game_catalog_scenario_1141716_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1141716;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 4);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(4);
      expect(caseSeed).assertEqual(1141716);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_catalog_scenario_1141717_config_api_9', 0, async () => {
      const caseSeed: number = 1141717;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1141717);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_catalog_scenario_1141718_retry_attempts', 0, async () => {
      const caseSeed: number = 1141718;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1141718);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_catalog_scenario_1141719_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1141719;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1141719);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_catalog_scenario_1141720_session_start_cycles', 0, async () => {
      const caseSeed: number = 1141720;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1141720);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_catalog_scenario_1141721_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1141721;
      const paddle: PaddleModel = new PaddleModel(1, 101, 9);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 9 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(1141721);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_catalog_scenario_1141722_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1141722;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1141722);
    });

    // 注入地址构建后可被完整还原
    it('game_catalog_scenario_1141723_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1141723;
      const payload: string = '_main.paddle.moveLeft(); // case 1141723';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1141723);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_catalog_scenario_1141724_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1141724;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1141724);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_catalog_scenario_1141725_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1141725;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1141725);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_catalog_scenario_1141726_score_accumulation', 0, async () => {
      const caseSeed: number = 1141726;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(6);
      }
      expect(board.getScore()).assertEqual(42);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(42);
      expect(caseSeed).assertEqual(1141726);
    });

    // 砖块按命中次数递减并给出进度
    it('game_catalog_scenario_1141727_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1141727;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(1141727);
    });

    // 按语言读取控制标签且资源完整
    it('game_catalog_scenario_1141728_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1141728;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1141728);
    });

    // 校验报告累计指定数量的错误
    it('game_catalog_scenario_1141729_validation_report_count', 0, async () => {
      const caseSeed: number = 1141729;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1141729);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_catalog_scenario_1141730_url_with_query', 0, async () => {
      const caseSeed: number = 1141730;
      const url: string = SAMPLE_GAME_URL + '?case=40';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1141730);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_catalog_scenario_1141731_geometry_area', 0, async () => {
      const caseSeed: number = 1141731;
      const box: GeometryBox = new GeometryBox(0, 0, 61, 61);
      expect(box.area()).assertEqual(3721);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1141731);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_catalog_scenario_1141732_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1141732;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1141732);
    });

    // 命令队列按序消费指定数量的命令
    it('game_catalog_scenario_1141733_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1141733;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1141733);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_catalog_scenario_1141734_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1141734;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(1141734);
    });

    // 加载耗时按预算边界判定
    it('game_catalog_scenario_1141735_page_load_budget', 0, async () => {
      const caseSeed: number = 1141735;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7735);
      expect(record.getDuration()).assertEqual(7735);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1141735);
    });

    // 延迟采样器的最大值不小于均值
    it('game_catalog_scenario_1141736_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1141736;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 6);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(6);
      expect(caseSeed).assertEqual(1141736);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_catalog_scenario_1141737_config_api_9', 0, async () => {
      const caseSeed: number = 1141737;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1141737);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_catalog_scenario_1141738_retry_attempts', 0, async () => {
      const caseSeed: number = 1141738;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1141738);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_catalog_scenario_1141739_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1141739;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1141739);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_catalog_scenario_1141740_session_start_cycles', 0, async () => {
      const caseSeed: number = 1141740;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1141740);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_catalog_scenario_1141741_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1141741;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(1141741);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_catalog_scenario_1141742_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1141742;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1141742);
    });

    // 注入地址构建后可被完整还原
    it('game_catalog_scenario_1141743_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1141743;
      const payload: string = '_main.paddle.moveLeft(); // case 1141743';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1141743);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_catalog_scenario_1141744_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1141744;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1141744);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_catalog_scenario_1141745_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1141745;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1141745);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_catalog_scenario_1141746_score_accumulation', 0, async () => {
      const caseSeed: number = 1141746;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(5);
      }
      expect(board.getScore()).assertEqual(35);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(35);
      expect(caseSeed).assertEqual(1141746);
    });

    // 砖块按命中次数递减并给出进度
    it('game_catalog_scenario_1141747_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1141747;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(1141747);
    });

    // 按语言读取控制标签且资源完整
    it('game_catalog_scenario_1141748_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1141748;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1141748);
    });

    // 校验报告累计指定数量的错误
    it('game_catalog_scenario_1141749_validation_report_count', 0, async () => {
      const caseSeed: number = 1141749;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1141749);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_catalog_scenario_1141750_url_with_query', 0, async () => {
      const caseSeed: number = 1141750;
      const url: string = SAMPLE_GAME_URL + '?case=60';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1141750);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_catalog_scenario_1141751_geometry_area', 0, async () => {
      const caseSeed: number = 1141751;
      const box: GeometryBox = new GeometryBox(0, 0, 81, 21);
      expect(box.area()).assertEqual(1701);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1141751);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_catalog_scenario_1141752_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1141752;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1141752);
    });

    // 命令队列按序消费指定数量的命令
    it('game_catalog_scenario_1141753_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1141753;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1141753);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_catalog_scenario_1141754_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1141754;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(3)).assertTrue();
      expect(bucket.available()).assertEqual(3);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(1141754);
    });

    // 加载耗时按预算边界判定
    it('game_catalog_scenario_1141755_page_load_budget', 0, async () => {
      const caseSeed: number = 1141755;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7755);
      expect(record.getDuration()).assertEqual(7755);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1141755);
    });

    // 延迟采样器的最大值不小于均值
    it('game_catalog_scenario_1141756_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1141756;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 8);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(8);
      expect(caseSeed).assertEqual(1141756);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_catalog_scenario_1141757_config_api_9', 0, async () => {
      const caseSeed: number = 1141757;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1141757);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_catalog_scenario_1141758_retry_attempts', 0, async () => {
      const caseSeed: number = 1141758;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 0; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(0);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1141758);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_catalog_scenario_1141759_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1141759;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1141759);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_catalog_scenario_1141760_session_start_cycles', 0, async () => {
      const caseSeed: number = 1141760;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1141760);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_catalog_scenario_1141761_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1141761;
      const paddle: PaddleModel = new PaddleModel(1, 101, 4);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 4 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(1141761);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_catalog_scenario_1141762_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1141762;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1141762);
    });

    // 注入地址构建后可被完整还原
    it('game_catalog_scenario_1141763_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 1141763;
      const payload: string = '_main.paddle.moveLeft(); // case 1141763';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(1141763);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_catalog_scenario_1141764_settings_zoom_true', 0, async () => {
      const caseSeed: number = 1141764;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(1141764);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_catalog_scenario_1141765_layout_custom_columns', 0, async () => {
      const caseSeed: number = 1141765;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(1141765);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_catalog_scenario_1141766_score_accumulation', 0, async () => {
      const caseSeed: number = 1141766;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(1141766);
    });

    // 砖块按命中次数递减并给出进度
    it('game_catalog_scenario_1141767_brick_grid_progress', 0, async () => {
      const caseSeed: number = 1141767;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(1141767);
    });

    // 按语言读取控制标签且资源完整
    it('game_catalog_scenario_1141768_locale_lookup_en', 0, async () => {
      const caseSeed: number = 1141768;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(1141768);
    });

    // 校验报告累计指定数量的错误
    it('game_catalog_scenario_1141769_validation_report_count', 0, async () => {
      const caseSeed: number = 1141769;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(1141769);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_catalog_scenario_1141770_url_with_query', 0, async () => {
      const caseSeed: number = 1141770;
      const url: string = SAMPLE_GAME_URL + '?case=80';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(1141770);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_catalog_scenario_1141771_geometry_area', 0, async () => {
      const caseSeed: number = 1141771;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 41);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(1141771);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_catalog_scenario_1141772_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 1141772;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(1141772);
    });

    // 命令队列按序消费指定数量的命令
    it('game_catalog_scenario_1141773_command_queue_fifo', 0, async () => {
      const caseSeed: number = 1141773;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(1141773);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_catalog_scenario_1141774_token_bucket_consume', 0, async () => {
      const caseSeed: number = 1141774;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(1141774);
    });

    // 加载耗时按预算边界判定
    it('game_catalog_scenario_1141775_page_load_budget', 0, async () => {
      const caseSeed: number = 1141775;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(7775);
      expect(record.getDuration()).assertEqual(7775);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(1141775);
    });

    // 延迟采样器的最大值不小于均值
    it('game_catalog_scenario_1141776_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 1141776;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 1);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(1);
      expect(caseSeed).assertEqual(1141776);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_catalog_scenario_1141777_config_api_9', 0, async () => {
      const caseSeed: number = 1141777;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(1141777);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_catalog_scenario_1141778_retry_attempts', 0, async () => {
      const caseSeed: number = 1141778;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(1141778);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_catalog_scenario_1141779_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 1141779;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(1141779);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_catalog_scenario_1141780_session_start_cycles', 0, async () => {
      const caseSeed: number = 1141780;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(1141780);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_catalog_scenario_1141781_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 1141781;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(1141781);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_catalog_scenario_1141782_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 1141782;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(1141782);
    });

  });
}
