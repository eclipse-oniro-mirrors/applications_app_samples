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
  ORIENTATION_LANDSCAPE,
  PAGE_LOAD_BUDGET_MS,
  LoadStatus,
  GameScript,
  ScriptCatalog,
  InjectionPipeline,
  GameSession,
  PaddleModel,
  WebSettingsProfile,
  LayoutProfile,
  PageLoadRecord,
  ScoreBoard,
  BrickGrid,
  LocaleCatalog,
  ValidationReport
} from '../Shared/GameModel';
import {
  UrlParts,
  GeometryBox,
  CircularBuffer,
  CommandQueue
} from '../Shared/GameTestKit';

export default function webViewLifecycleTest() {
  describe('WebViewLifecycle_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'webview_lifecycle suite start');
      driver = getDriver();
      await serializedDelay(driver, DELAY_PAGE_SETTLE);
      await triggerGamePage(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'webview_lifecycle suite end');
    });

    // 页面开始加载时状态为 LOADING 且耗时为 0
    it('webview_lifecycle_page_load_starts_in_loading_state', 0, async () => {
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 1000);
      expect(record.getStatus()).assertEqual(LoadStatus.LOADING);
      expect(record.getDuration()).assertEqual(0);
      expect(record.isSuccess()).assertFalse();
      expect(record.getUrl()).assertEqual(SAMPLE_GAME_URL);
    });

    // 加载成功后记录耗时且处于预算内
    it('webview_lifecycle_successful_load_records_duration', 0, async () => {
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 1000);
      record.finish(2500);
      expect(record.getStatus()).assertEqual(LoadStatus.LOADED);
      expect(record.getDuration()).assertEqual(1500);
      expect(record.isSuccess()).assertTrue();
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertTrue();
    });

    // 加载失败时保留错误码且不计为成功
    it('webview_lifecycle_failed_load_records_error_code', 0, async () => {
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.fail(404, 900);
      expect(record.getStatus()).assertEqual(LoadStatus.ERROR);
      expect(record.getErrorCode()).assertEqual(404);
      expect(record.isSuccess()).assertFalse();
      expect(record.getDuration()).assertEqual(900);
    });

    // 超过预算的加载耗时应被判定为不在预算内
    it('webview_lifecycle_slow_load_exceeds_budget', 0, async () => {
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(9000);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertFalse();
      expect(record.getDuration() > PAGE_LOAD_BUDGET_MS).assertTrue();
    });

    // 会话连续开始后保持运行且计数一致
    it('webview_lifecycle_scenario_5764500_session_start_cycles', 0, async () => {
      const caseSeed: number = 5764500;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(5764500);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('webview_lifecycle_scenario_5764501_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 5764501;
      const paddle: PaddleModel = new PaddleModel(1, 101, 2);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 2 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(5764501);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('webview_lifecycle_scenario_5764502_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 5764502;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(5764502);
    });

    // 注入地址构建后可被完整还原
    it('webview_lifecycle_scenario_5764503_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 5764503;
      const payload: string = '_main.paddle.moveLeft(); // case 5764503';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(5764503);
    });

    // 缩放开关变化后游戏配置判定正确
    it('webview_lifecycle_scenario_5764504_settings_zoom_true', 0, async () => {
      const caseSeed: number = 5764504;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(5764504);
    });

    // 自定义三列宽度之和仍为 100%
    it('webview_lifecycle_scenario_5764505_layout_custom_columns', 0, async () => {
      const caseSeed: number = 5764505;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(5764505);
    });

    // 击打得分按次数累加，最高分同步更新
    it('webview_lifecycle_scenario_5764506_score_accumulation', 0, async () => {
      const caseSeed: number = 5764506;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(5764506);
    });

    // 砖块按命中次数递减并给出进度
    it('webview_lifecycle_scenario_5764507_brick_grid_progress', 0, async () => {
      const caseSeed: number = 5764507;
      const grid: BrickGrid = new BrickGrid(2, 4);
      for (let i = 0; i < 4; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(4);
      expect(grid.isCleared()).assertEqual(false);
      expect(grid.total()).assertEqual(8);
      expect(caseSeed).assertEqual(5764507);
    });

    // 按语言读取控制标签且资源完整
    it('webview_lifecycle_scenario_5764508_locale_lookup_en', 0, async () => {
      const caseSeed: number = 5764508;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(5764508);
    });

    // 校验报告累计指定数量的错误
    it('webview_lifecycle_scenario_5764509_validation_report_count', 0, async () => {
      const caseSeed: number = 5764509;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(5764509);
    });

    // 带查询参数的地址解析长度与分段一致
    it('webview_lifecycle_scenario_5764510_url_with_query', 0, async () => {
      const caseSeed: number = 5764510;
      const url: string = SAMPLE_GAME_URL + '?case=91';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(5764510);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('webview_lifecycle_scenario_5764511_geometry_area', 0, async () => {
      const caseSeed: number = 5764511;
      const box: GeometryBox = new GeometryBox(0, 0, 41, 21);
      expect(box.area()).assertEqual(861);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(5764511);
    });

    // 环形缓冲保持容量并保留最新样本
    it('webview_lifecycle_scenario_5764512_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 5764512;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(5764512);
    });

    // 命令队列按序消费指定数量的命令
    it('webview_lifecycle_scenario_5764513_command_queue_fifo', 0, async () => {
      const caseSeed: number = 5764513;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(5764513);
    });

  });
}
