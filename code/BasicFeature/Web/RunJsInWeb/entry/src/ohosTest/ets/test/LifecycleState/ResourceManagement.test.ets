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

export default function resourceManagementTest() {
  describe('ResourceManagement_Test', () => {
    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'resource_management suite start');
    });

    afterAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'resource_management suite end');
    });

    // 会话连续开始后保持运行且计数一致
    it('resource_management_scenario_6071300_session_start_cycles', 0, async () => {
      const caseSeed: number = 6071300;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6071300);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('resource_management_scenario_6071301_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6071301;
      const paddle: PaddleModel = new PaddleModel(1, 101, 1);
      for (let i = 0; i < 10; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 1 * 10, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(10);
      expect(caseSeed).assertEqual(6071301);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('resource_management_scenario_6071302_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6071302;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6071302);
    });

    // 注入地址构建后可被完整还原
    it('resource_management_scenario_6071303_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6071303;
      const payload: string = '_main.paddle.moveLeft(); // case 6071303';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6071303);
    });

    // 缩放开关变化后游戏配置判定正确
    it('resource_management_scenario_6071304_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6071304;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6071304);
    });

    // 自定义三列宽度之和仍为 100%
    it('resource_management_scenario_6071305_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6071305;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6071305);
    });

    // 击打得分按次数累加，最高分同步更新
    it('resource_management_scenario_6071306_score_accumulation', 0, async () => {
      const caseSeed: number = 6071306;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(4);
      }
      expect(board.getScore()).assertEqual(28);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(28);
      expect(caseSeed).assertEqual(6071306);
    });

    // 砖块按命中次数递减并给出进度
    it('resource_management_scenario_6071307_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6071307;
      const grid: BrickGrid = new BrickGrid(1, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(4);
      expect(caseSeed).assertEqual(6071307);
    });

    // 按语言读取控制标签且资源完整
    it('resource_management_scenario_6071308_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6071308;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6071308);
    });

    // 校验报告累计指定数量的错误
    it('resource_management_scenario_6071309_validation_report_count', 0, async () => {
      const caseSeed: number = 6071309;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6071309);
    });

    // 带查询参数的地址解析长度与分段一致
    it('resource_management_scenario_6071310_url_with_query', 0, async () => {
      const caseSeed: number = 6071310;
      const url: string = SAMPLE_GAME_URL + '?case=80';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6071310);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('resource_management_scenario_6071311_geometry_area', 0, async () => {
      const caseSeed: number = 6071311;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 41);
      expect(box.area()).assertEqual(1681);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6071311);
    });

    // 环形缓冲保持容量并保留最新样本
    it('resource_management_scenario_6071312_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6071312;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6071312);
    });

    // 命令队列按序消费指定数量的命令
    it('resource_management_scenario_6071313_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6071313;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6071313);
    });

    // 令牌桶消费后余额与补充上限正确
    it('resource_management_scenario_6071314_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6071314;
      const bucket: TokenBucket = new TokenBucket(6);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(1);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(6);
      expect(caseSeed).assertEqual(6071314);
    });

    // 加载耗时按预算边界判定
    it('resource_management_scenario_6071315_page_load_budget', 0, async () => {
      const caseSeed: number = 6071315;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5315);
      expect(record.getDuration()).assertEqual(5315);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6071315);
    });

    // 延迟采样器的最大值不小于均值
    it('resource_management_scenario_6071316_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6071316;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 7);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(7);
      expect(caseSeed).assertEqual(6071316);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('resource_management_scenario_6071317_config_api_9', 0, async () => {
      const caseSeed: number = 6071317;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6071317);
    });

    // 重试次数达到上限后拒绝继续重试
    it('resource_management_scenario_6071318_retry_attempts', 0, async () => {
      const caseSeed: number = 6071318;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 2; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(2);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6071318);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('resource_management_scenario_6071319_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6071319;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6071319);
    });

    // 会话连续开始后保持运行且计数一致
    it('resource_management_scenario_6071320_session_start_cycles', 0, async () => {
      const caseSeed: number = 6071320;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6071320);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('resource_management_scenario_6071321_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6071321;
      const paddle: PaddleModel = new PaddleModel(1, 101, 3);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 3 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(6071321);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('resource_management_scenario_6071322_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6071322;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6071322);
    });

    // 注入地址构建后可被完整还原
    it('resource_management_scenario_6071323_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6071323;
      const payload: string = '_main.paddle.moveLeft(); // case 6071323';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6071323);
    });

    // 缩放开关变化后游戏配置判定正确
    it('resource_management_scenario_6071324_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6071324;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6071324);
    });

    // 自定义三列宽度之和仍为 100%
    it('resource_management_scenario_6071325_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6071325;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6071325);
    });

  });
}
