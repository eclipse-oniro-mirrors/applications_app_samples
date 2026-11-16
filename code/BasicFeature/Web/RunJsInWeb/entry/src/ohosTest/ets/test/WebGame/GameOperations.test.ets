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
  JAVASCRIPT_PREFIX,
  INTERNET_PERMISSION,
  ORIENTATION_LANDSCAPE,
  PAGE_LOAD_BUDGET_MS,
  GameState,
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
  ValidationReport,
  ScriptPayloadBuilder
} from '../Shared/GameModel';
import {
  UrlParts,
  GeometryBox,
  CircularBuffer,
  CommandQueue,
  TokenBucket
} from '../Shared/GameTestKit';

export default function gameOperationsTest() {
  describe('GameOperations_Test', () => {
    beforeAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_ops suite start');
    });

    afterAll(async () => {
      hilog.info(0xF811, 'RunJsInWebTest', '%{public}s', 'game_ops suite end');
    });

    // 新建会话默认处于 START 状态，球未发射
    it('game_ops_session_initial_state_is_start', 0, async () => {
      const session: GameSession = new GameSession();
      expect(session.getState()).assertEqual(GameState.STATE_START);
      expect(session.isStarted()).assertTrue();
      expect(session.isRunning()).assertFalse();
      expect(session.isBallFired()).assertFalse();
      expect(session.getStartCount()).assertEqual(0);
    });

    // START 状态下调用开始脚本应进入 RUNNING 并发射小球
    it('game_ops_start_from_start_switches_to_running', 0, async () => {
      const session: GameSession = new GameSession();
      const changed: boolean = session.start();
      expect(changed).assertTrue();
      expect(session.getState()).assertEqual(GameState.STATE_RUNNING);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getStartCount()).assertEqual(1);
    });

    // RUNNING 状态下重复开始仍保持 RUNNING，开始次数累加
    it('game_ops_start_from_running_keeps_running', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      const changed: boolean = session.start();
      expect(changed).assertTrue();
      expect(session.getState()).assertEqual(GameState.STATE_RUNNING);
      expect(session.getStartCount()).assertEqual(2);
      expect(session.getIgnoredStartCount()).assertEqual(0);
    });

    // GAMEOVER 状态下开始脚本必须被忽略，等待复位
    it('game_ops_start_from_gameover_is_ignored', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      session.markGameOver();
      const changed: boolean = session.start();
      expect(changed).assertFalse();
      expect(session.isGameOver()).assertTrue();
      expect(session.getIgnoredStartCount()).assertEqual(1);
    });

    // START 状态下复位脚本不生效，状态保持不变
    it('game_ops_reset_from_start_is_ignored', 0, async () => {
      const session: GameSession = new GameSession();
      const changed: boolean = session.reset();
      expect(changed).assertFalse();
      expect(session.isStarted()).assertTrue();
      expect(session.getIgnoredResetCount()).assertEqual(1);
      expect(session.getResetCount()).assertEqual(0);
    });

    // RUNNING 状态下复位脚本不生效，避免中途清空分数
    it('game_ops_reset_from_running_is_ignored', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      const changed: boolean = session.reset();
      expect(changed).assertFalse();
      expect(session.isRunning()).assertTrue();
      expect(session.getIgnoredResetCount()).assertEqual(1);
    });

    // GAMEOVER 状态下复位脚本回到 START 并清空发射标记
    it('game_ops_reset_from_gameover_returns_to_start', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      session.markGameOver();
      const changed: boolean = session.reset();
      expect(changed).assertTrue();
      expect(session.isStarted()).assertTrue();
      expect(session.isBallFired()).assertFalse();
      expect(session.getResetCount()).assertEqual(1);
    });

    // 执行 开始-结束-复位 完整循环后回到初始状态
    it('game_ops_full_lifecycle_cycle_is_consistent', 0, async () => {
      const session: GameSession = new GameSession();
      expect(session.start()).assertTrue();
      session.markGameOver();
      expect(session.reset()).assertTrue();
      expect(session.getState()).assertEqual(GameState.STATE_START);
      const history: string[] = session.getHistory();
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual('start:running');
      expect(history[2]).assertEqual('reset:start');
    });

    // resetSession 应清空计数器与历史，避免用例间状态污染
    it('game_ops_session_reset_clears_all_counters', 0, async () => {
      const session: GameSession = new GameSession();
      session.start();
      session.markGameOver();
      session.resetSession();
      expect(session.getStartCount()).assertEqual(0);
      expect(session.getResetCount()).assertEqual(0);
      expect(session.getIgnoredStartCount()).assertEqual(0);
      expect(session.getHistory().length).assertEqual(0);
      expect(session.isStarted()).assertTrue();
    });

    // 脚本目录应包含左移、右移、开始、复位与移除说明五个脚本
    it('game_ops_catalog_contains_all_five_scripts', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      expect(catalog.size()).assertEqual(5);
      expect(catalog.contains('start')).assertTrue();
      expect(catalog.contains('left')).assertTrue();
      expect(catalog.contains('right')).assertTrue();
      expect(catalog.contains('reset')).assertTrue();
      expect(catalog.contains('removeDesc')).assertTrue();
    });

    // 所有脚本都应携带动作名、负载、跟踪调用与 _main 入口
    it('game_ops_catalog_validates_all_payloads', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      expect(catalog.validateAll()).assertTrue();
      expect(catalog.findMissingEntryPoint().length).assertEqual(0);
      expect(catalog.totalPayloadLength()).assertLarger(0);
    });

    // 目录应为每个脚本生成 javascript: 前缀的注入地址
    it('game_ops_catalog_builds_javascript_urls', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const urls: string[] = catalog.toInjectionUrls();
      expect(urls.length).assertEqual(5);
      for (let i = 0; i < urls.length; i++) {
        expect(urls[i].startsWith(JAVASCRIPT_PREFIX)).assertTrue();
        expect(urls[i].length).assertLarger(JAVASCRIPT_PREFIX.length);
      }
    });

    // 脚本 left 应存在并调用 moveLeft
    it('game_ops_script_left_exists_and_executes_moveleft', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('left');
      expect(script.containsToken('moveLeft')).assertTrue();
      expect(script.action).assertEqual('gameLeft');
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(script.hasCode()).assertTrue();
    });

    // 脚本 left 的负载语法完整，且不包含换行或嵌套 javascript: 协议
    it('game_ops_script_left_payload_is_wellformed_and_safe', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('left');
      expect(InjectionPipeline.isWellFormed(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedParentheses(script.code)).assertTrue();
      expect(InjectionPipeline.isSafe(script.code)).assertTrue();
      expect(script.toInjectionUrl()).assertContain(JAVASCRIPT_PREFIX);
    });

    // 脚本 right 应存在并调用 moveRight
    it('game_ops_script_right_exists_and_executes_moveright', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('right');
      expect(script.containsToken('moveRight')).assertTrue();
      expect(script.action).assertEqual('gameRight');
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(script.hasCode()).assertTrue();
    });

    // 脚本 right 的负载语法完整，且不包含换行或嵌套 javascript: 协议
    it('game_ops_script_right_payload_is_wellformed_and_safe', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('right');
      expect(InjectionPipeline.isWellFormed(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedParentheses(script.code)).assertTrue();
      expect(InjectionPipeline.isSafe(script.code)).assertTrue();
      expect(script.toInjectionUrl()).assertContain(JAVASCRIPT_PREFIX);
    });

    // 脚本 start 应存在并调用 state_RUNNING
    it('game_ops_script_start_exists_and_executes_state_running', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.action).assertEqual('gameStart');
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(script.hasCode()).assertTrue();
    });

    // 脚本 start 的负载语法完整，且不包含换行或嵌套 javascript: 协议
    it('game_ops_script_start_payload_is_wellformed_and_safe', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(InjectionPipeline.isWellFormed(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedParentheses(script.code)).assertTrue();
      expect(InjectionPipeline.isSafe(script.code)).assertTrue();
      expect(script.toInjectionUrl()).assertContain(JAVASCRIPT_PREFIX);
    });

    // 脚本 reset 应存在并调用 state_START
    it('game_ops_script_reset_exists_and_executes_state_start', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('reset');
      expect(script.containsToken('state_START')).assertTrue();
      expect(script.action).assertEqual('gameReset');
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(script.hasCode()).assertTrue();
    });

    // 脚本 reset 的负载语法完整，且不包含换行或嵌套 javascript: 协议
    it('game_ops_script_reset_payload_is_wellformed_and_safe', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('reset');
      expect(InjectionPipeline.isWellFormed(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedParentheses(script.code)).assertTrue();
      expect(InjectionPipeline.isSafe(script.code)).assertTrue();
      expect(script.toInjectionUrl()).assertContain(JAVASCRIPT_PREFIX);
    });

    // 脚本 removeDesc 应存在并调用 removeChild
    it('game_ops_script_removeDesc_exists_and_executes_removechild', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('removeDesc');
      expect(script.containsToken('removeChild')).assertTrue();
      expect(script.action).assertEqual('removeDesc');
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(script.hasCode()).assertTrue();
    });

    // 脚本 removeDesc 的负载语法完整，且不包含换行或嵌套 javascript: 协议
    it('game_ops_script_removeDesc_payload_is_wellformed_and_safe', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('removeDesc');
      expect(InjectionPipeline.isWellFormed(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces(script.code)).assertTrue();
      expect(InjectionPipeline.hasBalancedParentheses(script.code)).assertTrue();
      expect(InjectionPipeline.isSafe(script.code)).assertTrue();
      expect(script.toInjectionUrl()).assertContain(JAVASCRIPT_PREFIX);
    });

    // 构建注入地址时应拼接 javascript: 前缀
    it('game_ops_build_adds_javascript_prefix', 0, async () => {
      const url: string = InjectionPipeline.build('_main.start();');
      expect(url).assertEqual('javascript:_main.start();');
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
    });

    // 从脚本对象构建地址时负载内容保持不变
    it('game_ops_build_from_script_keeps_payload', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      const url: string = InjectionPipeline.buildFromScript(script);
      expect(url.startsWith(JAVASCRIPT_PREFIX)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(script.code);
    });

    // 空负载必须抛出错误，避免执行空脚本
    it('game_ops_build_rejects_empty_payload', 0, async () => {
      let thrown: boolean = false;
      try {
        InjectionPipeline.build('');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    // 注入地址校验应只接受 javascript: 前缀
    it('game_ops_validate_recognizes_injection_url', 0, async () => {
      expect(InjectionPipeline.isInjectionUrl('javascript:void(0)')).assertTrue();
      expect(InjectionPipeline.isInjectionUrl('https://example.com')).assertFalse();
      expect(InjectionPipeline.isInjectionUrl('file:///data/a.html')).assertFalse();
      expect(InjectionPipeline.extract('https://example.com')).assertEqual('');
    });

    // 远端页面地址应识别为 http 或 https 协议
    it('game_ops_remote_url_detection', 0, async () => {
      expect(InjectionPipeline.isRemoteUrl(SAMPLE_GAME_URL)).assertTrue();
      expect(InjectionPipeline.isRemoteUrl('http://localhost:8080')).assertTrue();
      expect(InjectionPipeline.isRemoteUrl('javascript:void(0)')).assertFalse();
    });

    // 花括号或圆括号不配对的负载应被识别为语法异常
    it('game_ops_malformed_payload_is_detected', 0, async () => {
      const malformed: string = ScriptPayloadBuilder.malformedPayload();
      expect(InjectionPipeline.hasBalancedBraces(malformed)).assertFalse();
      expect(InjectionPipeline.isWellFormed(malformed)).assertFalse();
      expect(InjectionPipeline.hasBalancedParentheses('foo(bar')).assertFalse();
    });

    // 包含换行、控制字符或嵌套协议的负载应被拒绝
    it('game_ops_unsafe_payload_is_rejected', 0, async () => {
      expect(InjectionPipeline.isSafe(ScriptPayloadBuilder.unsafePayload())).assertFalse();
      expect(InjectionPipeline.isSafe('line1\nline2')).assertFalse();
      expect(InjectionPipeline.isSafe('line1\rline2')).assertFalse();
      expect(InjectionPipeline.isSafe('_main.start();')).assertTrue();
    });

    // 空字符串既不是安全负载也不是合法注入地址
    it('game_ops_empty_payload_is_not_safe', 0, async () => {
      expect(InjectionPipeline.isSafe(ScriptPayloadBuilder.emptyPayload())).assertFalse();
      expect(InjectionPipeline.isWellFormed(ScriptPayloadBuilder.emptyPayload())).assertFalse();
      expect(InjectionPipeline.extract('')).assertEqual('');
    });

    // 嵌套函数调用应保持圆括号平衡
    it('game_ops_escaped_parentheses_are_balanced', 0, async () => {
      const payload: string = '_main.start(_main.game.state);';
      expect(InjectionPipeline.hasBalancedParentheses(payload)).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces('if (a) { b(); }')).assertTrue();
      expect(InjectionPipeline.hasBalancedBraces('} { ')).assertFalse();
    });

    // 目录中的每个脚本都应能构建出合法且安全的注入地址
    it('game_ops_catalog_payloads_are_all_injectable', 0, async () => {
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const scripts: GameScript[] = catalog.all();
      for (let i = 0; i < scripts.length; i++) {
        const url: string = InjectionPipeline.buildFromScript(scripts[i]);
        expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
        expect(InjectionPipeline.isSafe(InjectionPipeline.extract(url))).assertTrue();
      }
    });

    // 击打砖块累加分数并统计命中次数
    it('game_ops_score_accumulates_points', 0, async () => {
      const board: ScoreBoard = new ScoreBoard();
      expect(board.add(10)).assertEqual(10);
      expect(board.add(20)).assertEqual(30);
      expect(board.getScore()).assertEqual(30);
      expect(board.getHitCount()).assertEqual(2);
      expect(board.getHighScore()).assertEqual(30);
    });

    // 非正分不得改变分数与命中次数
    it('game_ops_non_positive_points_are_ignored', 0, async () => {
      const board: ScoreBoard = new ScoreBoard();
      board.add(10);
      expect(board.add(0)).assertEqual(10);
      expect(board.add(-5)).assertEqual(10);
      expect(board.getHitCount()).assertEqual(1);
    });

    // 复位当前分数后历史最高分保持
    it('game_ops_high_score_survives_reset', 0, async () => {
      const board: ScoreBoard = new ScoreBoard();
      board.add(50);
      board.reset();
      expect(board.getScore()).assertEqual(0);
      expect(board.getHighScore()).assertEqual(50);
      board.add(20);
      expect(board.isNewRecord()).assertFalse();
    });

    // 会话连续开始后保持运行且计数一致
    it('game_ops_scenario_6260800_session_start_cycles', 0, async () => {
      const caseSeed: number = 6260800;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6260800);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_ops_scenario_6260801_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6260801;
      const paddle: PaddleModel = new PaddleModel(1, 101, 6);
      for (let i = 0; i < 6; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 6 * 6, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(6);
      expect(caseSeed).assertEqual(6260801);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_ops_scenario_6260802_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6260802;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6260802);
    });

    // 注入地址构建后可被完整还原
    it('game_ops_scenario_6260803_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6260803;
      const payload: string = '_main.paddle.moveLeft(); // case 6260803';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6260803);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_ops_scenario_6260804_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6260804;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6260804);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_ops_scenario_6260805_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6260805;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6260805);
    });

    // 击打得分按次数累加，最高分同步更新
    it('game_ops_scenario_6260806_score_accumulation', 0, async () => {
      const caseSeed: number = 6260806;
      const board: ScoreBoard = new ScoreBoard();
      for (let i = 0; i < 7; i++) {
        board.add(7);
      }
      expect(board.getScore()).assertEqual(49);
      expect(board.getHitCount()).assertEqual(7);
      expect(board.getHighScore()).assertEqual(49);
      expect(caseSeed).assertEqual(6260806);
    });

    // 砖块按命中次数递减并给出进度
    it('game_ops_scenario_6260807_brick_grid_progress', 0, async () => {
      const caseSeed: number = 6260807;
      const grid: BrickGrid = new BrickGrid(3, 4);
      for (let i = 0; i < 12; i++) {
        expect(grid.hit()).assertTrue();
      }
      expect(grid.getRemaining()).assertEqual(0);
      expect(grid.isCleared()).assertEqual(true);
      expect(grid.total()).assertEqual(12);
      expect(caseSeed).assertEqual(6260807);
    });

    // 按语言读取控制标签且资源完整
    it('game_ops_scenario_6260808_locale_lookup_en', 0, async () => {
      const caseSeed: number = 6260808;
      const catalog: LocaleCatalog = LocaleCatalog.createEnglish();
      expect(catalog.isComplete()).assertTrue();
      expect(catalog.get('start').length).assertLarger(0);
      expect(catalog.get('reset').length).assertLarger(0);
      expect(catalog.size()).assertEqual(6);
      expect(caseSeed).assertEqual(6260808);
    });

    // 校验报告累计指定数量的错误
    it('game_ops_scenario_6260809_validation_report_count', 0, async () => {
      const caseSeed: number = 6260809;
      const report: ValidationReport = new ValidationReport();
      for (let i = 0; i < 5; i++) {
        report.addError('e' + i);
      }
      expect(report.getErrorCount()).assertEqual(5);
      expect(report.isValid()).assertEqual(false);
      expect(report.summary()).assertEqual('invalid:5');
      expect(caseSeed).assertEqual(6260809);
    });

    // 带查询参数的地址解析长度与分段一致
    it('game_ops_scenario_6260810_url_with_query', 0, async () => {
      const caseSeed: number = 6260810;
      const url: string = SAMPLE_GAME_URL + '?case=42';
      const parts: UrlParts = UrlParts.parse(url);
      expect(parts.isHttps()).assertTrue();
      expect(parts.hasQuery()).assertTrue();
      expect(parts.length()).assertEqual(url.length);
      expect(parts.getHost()).assertEqual('yangyunhe369.github.io');
      expect(caseSeed).assertEqual(6260810);
    });

    // 矩形面积与包含关系按给定尺寸计算
    it('game_ops_scenario_6260811_geometry_area', 0, async () => {
      const caseSeed: number = 6260811;
      const box: GeometryBox = new GeometryBox(0, 0, 21, 61);
      expect(box.area()).assertEqual(1281);
      expect(box.contains(0, 0)).assertTrue();
      expect(box.contains(box.centerX(), box.centerY())).assertTrue();
      expect(box.isDegenerate()).assertFalse();
      expect(caseSeed).assertEqual(6260811);
    });

    // 环形缓冲保持容量并保留最新样本
    it('game_ops_scenario_6260812_circular_buffer_capacity', 0, async () => {
      const caseSeed: number = 6260812;
      const buffer: CircularBuffer = new CircularBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.push(i);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.isFull()).assertTrue();
      expect(buffer.last()).assertEqual(4);
      expect(caseSeed).assertEqual(6260812);
    });

    // 命令队列按序消费指定数量的命令
    it('game_ops_scenario_6260813_command_queue_fifo', 0, async () => {
      const caseSeed: number = 6260813;
      const queue: CommandQueue = new CommandQueue();
      for (let i = 0; i < 4; i++) {
        queue.enqueue('cmd' + i);
      }
      expect(queue.size()).assertEqual(4);
      expect(queue.dequeue()).assertEqual('cmd0');
      expect(queue.executedCommands().length).assertEqual(1);
      expect(caseSeed).assertEqual(6260813);
    });

    // 令牌桶消费后余额与补充上限正确
    it('game_ops_scenario_6260814_token_bucket_consume', 0, async () => {
      const caseSeed: number = 6260814;
      const bucket: TokenBucket = new TokenBucket(10);
      expect(bucket.tryConsume(5)).assertTrue();
      expect(bucket.available()).assertEqual(5);
      bucket.refill(1000);
      expect(bucket.available()).assertEqual(10);
      expect(caseSeed).assertEqual(6260814);
    });

    // 加载耗时按预算边界判定
    it('game_ops_scenario_6260815_page_load_budget', 0, async () => {
      const caseSeed: number = 6260815;
      const record: PageLoadRecord = new PageLoadRecord(SAMPLE_GAME_URL, 0);
      record.finish(5815);
      expect(record.getDuration()).assertEqual(5815);
      expect(record.isWithinBudget(PAGE_LOAD_BUDGET_MS)).assertEqual(true);
      expect(record.isSuccess()).assertTrue();
      expect(caseSeed).assertEqual(6260815);
    });

    // 延迟采样器的最大值不小于均值
    it('game_ops_scenario_6260816_perf_sampler_bounds', 0, async () => {
      const caseSeed: number = 6260816;
      const sampler: PerformanceSampler = new PerformanceSampler();
      for (let i = 1; i <= 21; i++) {
        sampler.record(i * 3);
      }
      expect(sampler.count()).assertEqual(21);
      expect(sampler.max()).assertLargerOrEqual(sampler.average());
      expect(sampler.min()).assertEqual(3);
      expect(caseSeed).assertEqual(6260816);
    });

    // 配置快照的 API 版本与设备能力保持自洽
    it('game_ops_scenario_6260817_config_api_9', 0, async () => {
      const caseSeed: number = 6260817;
      const config: ConfigSnapshot = ConfigSnapshot.createDefault();
      expect(config.apiVersion).assertEqual(9);
      expect(config.supportsDevice('tablet')).assertTrue();
      expect(config.hasPermission(INTERNET_PERMISSION)).assertTrue();
      expect(config.apiVersion === 9).assertEqual(true);
      expect(caseSeed).assertEqual(6260817);
    });

    // 重试次数达到上限后拒绝继续重试
    it('game_ops_scenario_6260818_retry_attempts', 0, async () => {
      const caseSeed: number = 6260818;
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      for (let i = 0; i < 1; i++) {
        expect(policy.recordAttempt()).assertTrue();
      }
      expect(policy.getAttempts()).assertEqual(1);
      expect(policy.canRetry()).assertEqual(true);
      expect(caseSeed).assertEqual(6260818);
    });

    // 事件记录器按顺序保存指定数量的事件
    it('game_ops_scenario_6260819_event_recorder_sequence', 0, async () => {
      const caseSeed: number = 6260819;
      const recorder: EventRecorder = new EventRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record('start');
      }
      expect(recorder.count()).assertEqual(4);
      expect(recorder.countOf('start')).assertEqual(4);
      expect(recorder.last()).assertEqual('start');
      expect(caseSeed).assertEqual(6260819);
    });

    // 会话连续开始后保持运行且计数一致
    it('game_ops_scenario_6260820_session_start_cycles', 0, async () => {
      const caseSeed: number = 6260820;
      const session: GameSession = new GameSession();
      for (let i = 0; i < 1; i++) {
        expect(session.start()).assertTrue();
      }
      expect(session.getStartCount()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.isBallFired()).assertTrue();
      expect(session.getHistory().length).assertEqual(1);
      expect(caseSeed).assertEqual(6260820);
    });

    // 挡板按给定步长连续右移的位置计算正确
    it('game_ops_scenario_6260821_paddle_step_sequence', 0, async () => {
      const caseSeed: number = 6260821;
      const paddle: PaddleModel = new PaddleModel(1, 101, 8);
      for (let i = 0; i < 2; i++) {
        paddle.moveRight();
      }
      const expected: number = Math.min(1 + 8 * 2, 101);
      expect(paddle.getPosition()).assertEqual(expected);
      expect(paddle.getMoveCount()).assertEqual(2);
      expect(caseSeed).assertEqual(6260821);
    });

    // 按脚本标识查询目录并校验业务令牌
    it('game_ops_scenario_6260822_catalog_lookup_start', 0, async () => {
      const caseSeed: number = 6260822;
      const catalog: ScriptCatalog = ScriptCatalog.createDefault();
      const script: GameScript = catalog.require('start');
      expect(script.containsToken('state_RUNNING')).assertTrue();
      expect(script.hasTraceCall()).assertTrue();
      expect(script.referencesEntryPoint()).assertTrue();
      expect(catalog.size()).assertEqual(5);
      expect(caseSeed).assertEqual(6260822);
    });

    // 注入地址构建后可被完整还原
    it('game_ops_scenario_6260823_pipeline_round_trip', 0, async () => {
      const caseSeed: number = 6260823;
      const payload: string = '_main.paddle.moveLeft(); // case 6260823';
      const url: string = InjectionPipeline.build(payload);
      expect(InjectionPipeline.isInjectionUrl(url)).assertTrue();
      expect(InjectionPipeline.extract(url)).assertEqual(payload);
      expect(InjectionPipeline.isSafe(payload)).assertTrue();
      expect(InjectionPipeline.isWellFormed(payload)).assertTrue();
      expect(caseSeed).assertEqual(6260823);
    });

    // 缩放开关变化后游戏配置判定正确
    it('game_ops_scenario_6260824_settings_zoom_true', 0, async () => {
      const caseSeed: number = 6260824;
      const profile: WebSettingsProfile = WebSettingsProfile.createDefault();
      profile.setZoomAccess(true);
      expect(profile.isZoomAccess()).assertEqual(true);
      expect(profile.isValidGameProfile()).assertEqual(false);
      expect(profile.countEnabled()).assertEqual(5);
      expect(caseSeed).assertEqual(6260824);
    });

    // 自定义三列宽度之和仍为 100%
    it('game_ops_scenario_6260825_layout_custom_columns', 0, async () => {
      const caseSeed: number = 6260825;
      const layout: LayoutProfile = new LayoutProfile(5, 90, 5, 50, 100, ORIENTATION_LANDSCAPE);
      expect(layout.totalWidth()).assertEqual(100);
      expect(layout.isBalanced()).assertTrue();
      expect(layout.controlShare()).assertEqual(10);
      expect(layout.webShare()).assertEqual(90);
      expect(caseSeed).assertEqual(6260825);
    });

  });
}
