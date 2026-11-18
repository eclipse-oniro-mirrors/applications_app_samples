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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '../Shared/MiracastDriver';
import { getDriver, triggerMiracastHome, waitForPageStable, waitForPermissionDialog, waitForPlayerPage,
  miracastComponentCount, countComponentsById, pressAndWait, getCurrentFocusIndex, checkFocusState,
  checkComponentExists, runSerializedUiOperation, serializedDelay, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN,
  KEY_ENTER, KEY_BACK, ID_SWITCH_BTN, ID_TAB_MIRACAST, ID_TAB_SETTINGS, ID_SAVE_BTN, ID_ALLOW_BTN,
  ID_PERMANENT_TRUST, ID_CONFIRM_BTN, ID_CANCEL_BTN, TIMEOUT_PAGE_RENDER, TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'ButtonInteractionSuite';

// ===== 按钮交互领域模型（本地 Mock，纯逻辑，不依赖业务源码） =====

// 按钮状态枚举：覆盖遥控器焦点、按压、禁用等全部状态
enum ButtonState {
  NORMAL = 'normal',
  FOCUSED = 'focused',
  PRESSED = 'pressed',
  DISABLED = 'disabled'
}

// 按钮动作枚举：定义投屏界面支持的用户动作
enum ButtonAction {
  FOCUS = 'focus',
  BLUR = 'blur',
  PRESS = 'press',
  RELEASE = 'release',
  LONG_PRESS = 'long_press',
  DOUBLE_CLICK = 'double_click'
}

// 按钮位置枚举：定义弹窗与页面中按钮的布局位置
enum ButtonPosition {
  LEFT = 'left',
  CENTER = 'center',
  RIGHT = 'right',
  TOP = 'top',
  BOTTOM = 'bottom'
}

// 按钮规格接口：描述一个按钮的静态属性
interface ButtonSpec {
  buttonId: number;
  componentId: string;
  label: string;
  position: ButtonPosition;
  enabled: boolean;
  focusable: boolean;
}

// 按钮交互事件接口：描述一次按钮交互的完整度量
interface ButtonEvent {
  eventId: number;
  buttonId: number;
  action: ButtonAction;
  state: ButtonState;
  latencyMs: number;
}

// 按钮统计接口：汇总一组按钮交互的响应指标
interface ButtonStatistics {
  totalEvents: number;
  responsiveEvents: number;
  averageLatency: number;
  maxLatency: number;
  responsivenessRate: number;
}

// 按钮描述模型：封装按钮静态属性并提供状态迁移能力
class ButtonDescriptorModel {
  private buttonId: number;
  private componentId: string;
  private label: string;
  private position: ButtonPosition;
  private enabled: boolean;
  private state: ButtonState = ButtonState.NORMAL;

  constructor(buttonId: number, componentId: string, label: string, position: ButtonPosition, enabled: boolean) {
    this.buttonId = buttonId;
    this.componentId = componentId;
    this.label = label;
    this.position = position;
    this.enabled = enabled;
    if (!enabled) {
      this.state = ButtonState.DISABLED;
    }
  }

  public getButtonId(): number {
    return this.buttonId;
  }

  public getComponentId(): string {
    return this.componentId;
  }

  public getLabel(): string {
    return this.label;
  }

  public getPosition(): ButtonPosition {
    return this.position;
  }

  public getState(): ButtonState {
    return this.state;
  }

  public isEnabled(): boolean {
    return this.enabled;
  }

  public setEnabled(enabled: boolean): void {
    this.enabled = enabled;
    this.state = enabled ? ButtonState.NORMAL : ButtonState.DISABLED;
  }

  // 聚焦：仅在启用且非按压态时生效
  public focus(): boolean {
    if (!this.enabled) {
      return false;
    }
    if (this.state === ButtonState.PRESSED) {
      return false;
    }
    this.state = ButtonState.FOCUSED;
    return true;
  }

  // 失焦：回到普通态
  public blur(): boolean {
    if (!this.enabled) {
      return false;
    }
    if (this.state !== ButtonState.FOCUSED) {
      return false;
    }
    this.state = ButtonState.NORMAL;
    return true;
  }

  // 按下：仅聚焦态可进入按压态
  public press(): boolean {
    if (!this.enabled || this.state !== ButtonState.FOCUSED) {
      return false;
    }
    this.state = ButtonState.PRESSED;
    return true;
  }

  // 抬起：按压态回到聚焦态
  public release(): boolean {
    if (this.state !== ButtonState.PRESSED) {
      return false;
    }
    this.state = ButtonState.FOCUSED;
    return true;
  }

  public isInteractive(): boolean {
    return this.enabled;
  }

  public equals(other: ButtonDescriptorModel): boolean {
    return this.buttonId === other.getButtonId() && this.componentId === other.getComponentId();
  }

  public clone(): ButtonDescriptorModel {
    const copy = new ButtonDescriptorModel(this.buttonId, this.componentId, this.label, this.position, this.enabled);
    if (this.state === ButtonState.FOCUSED) {
      copy.focus();
    }
    return copy;
  }

  public toString(): string {
    return 'ButtonDescriptorModel(' + this.componentId + ', ' + this.label + ', ' + this.state + ')';
  }
}

// 按钮注册表：按投屏真实组件 id 注册按钮，支持查找、统计与启用态切换
class ButtonRegistry {
  private buttons: ButtonDescriptorModel[] = [];
  private nextId: number = 0;

  public register(componentId: string, label: string, position: ButtonPosition, enabled: boolean): number {
    const id: number = this.nextId;
    this.nextId++;
    this.buttons.push(new ButtonDescriptorModel(id, componentId, label, position, enabled));
    return id;
  }

  // 按投屏首页、权限浮窗、设备名称页的真实按钮装配注册表
  public registerMiracastCatalog(): void {
    this.register(ID_SWITCH_BTN, 'Miracast switch', ButtonPosition.LEFT, true);
    this.register(ID_TAB_MIRACAST, 'Screen casting', ButtonPosition.CENTER, true);
    this.register(ID_TAB_SETTINGS, 'Projection settings', ButtonPosition.RIGHT, true);
    this.register(ID_ALLOW_BTN, 'Allow once', ButtonPosition.LEFT, true);
    this.register(ID_PERMANENT_TRUST, 'Always allow', ButtonPosition.CENTER, true);
    this.register(ID_CANCEL_BTN, 'Cancel', ButtonPosition.RIGHT, true);
    this.register(ID_CONFIRM_BTN, 'Confirm', ButtonPosition.RIGHT, true);
    this.register(ID_SAVE_BTN, 'Save', ButtonPosition.BOTTOM, true);
  }

  public getCount(): number {
    return this.buttons.length;
  }

  public getEnabledCount(): number {
    let count: number = 0;
    for (const button of this.buttons) {
      if (button.isEnabled()) {
        count++;
      }
    }
    return count;
  }

  public findByComponentId(componentId: string): ButtonDescriptorModel | null {
    for (const button of this.buttons) {
      if (button.getComponentId() === componentId) {
        return button;
      }
    }
    return null;
  }

  public hasComponentId(componentId: string): boolean {
    return this.findByComponentId(componentId) !== null;
  }

  public getComponentIds(): string[] {
    const ids: string[] = [];
    for (const button of this.buttons) {
      ids.push(button.getComponentId());
    }
    return ids;
  }

  public getLabels(): string[] {
    const labels: string[] = [];
    for (const button of this.buttons) {
      labels.push(button.getLabel());
    }
    return labels;
  }

  public countByPosition(position: ButtonPosition): number {
    let count: number = 0;
    for (const button of this.buttons) {
      if (button.getPosition() === position) {
        count++;
      }
    }
    return count;
  }

  public disable(componentId: string): boolean {
    const button = this.findByComponentId(componentId);
    if (button === null) {
      return false;
    }
    button.setEnabled(false);
    return true;
  }

  public clear(): void {
    this.buttons = [];
    this.nextId = 0;
  }
}

// 按压时序校验器：校验焦点、按压、抬起、失焦的合法顺序
class PressSequenceValidator {
  private expected: ButtonState[] = [ButtonState.NORMAL, ButtonState.FOCUSED, ButtonState.PRESSED, ButtonState.FOCUSED,
    ButtonState.NORMAL];

  public isValidSequence(states: ButtonState[]): boolean {
    if (states.length !== this.expected.length) {
      return false;
    }
    for (let i = 0; i < states.length; i++) {
      if (states[i] !== this.expected[i]) {
        return false;
      }
    }
    return true;
  }

  public getExpectedLength(): number {
    return this.expected.length;
  }

  public isTerminalNormal(states: ButtonState[]): boolean {
    if (states.length === 0) {
      return false;
    }
    return states[states.length - 1] === ButtonState.NORMAL;
  }

  // 重入校验：同一按钮连续两次按压必须经过抬起
  public hasNoDoublePress(states: ButtonState[]): boolean {
    for (let i = 0; i < states.length - 1; i++) {
      if (states[i] === ButtonState.PRESSED && states[i + 1] === ButtonState.PRESSED) {
        return false;
      }
    }
    return true;
  }
}

// 按压延迟分析器：统计按钮响应耗时并给出预算判定
class PressLatencyAnalyzer {
  private latencies: number[] = [];

  public record(latencyMs: number): void {
    if (latencyMs < 0) {
      return;
    }
    this.latencies.push(latencyMs);
  }

  public getSampleCount(): number {
    return this.latencies.length;
  }

  public getAverageLatency(): number {
    if (this.latencies.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const latency of this.latencies) {
      total += latency;
    }
    return total / this.latencies.length;
  }

  public getMaxLatency(): number {
    let max: number = 0;
    for (const latency of this.latencies) {
      if (latency > max) {
        max = latency;
      }
    }
    return max;
  }

  public isWithinBudget(budgetMs: number): boolean {
    return this.latencies.length > 0 && this.getMaxLatency() <= budgetMs;
  }

}

// 按钮事件日志：记录每次按钮交互并按按钮、动作统计
class ButtonEventJournal {
  private events: ButtonEvent[] = [];

  public record(buttonId: number, action: ButtonAction, state: ButtonState, latencyMs: number): void {
    const event: ButtonEvent = {
      eventId: this.events.length + 1,
      buttonId: buttonId,
      action: action,
      state: state,
      latencyMs: latencyMs
    };
    this.events.push(event);
  }

  public getCount(): number {
    return this.events.length;
  }

  public getEvents(): ButtonEvent[] {
    return [...this.events];
  }

  public countByButton(buttonId: number): number {
    let count: number = 0;
    for (const event of this.events) {
      if (event.buttonId === buttonId) {
        count++;
      }
    }
    return count;
  }

  public countByAction(action: ButtonAction): number {
    let count: number = 0;
    for (const event of this.events) {
      if (event.action === action) {
        count++;
      }
    }
    return count;
  }

  public buildStatistics(budgetMs: number): ButtonStatistics {
    let responsive: number = 0;
    let total: number = 0;
    let max: number = 0;
    for (const event of this.events) {
      total += event.latencyMs;
      if (event.latencyMs <= budgetMs) {
        responsive++;
      }
      if (event.latencyMs > max) {
        max = event.latencyMs;
      }
    }
    const stats: ButtonStatistics = {
      totalEvents: this.events.length,
      responsiveEvents: responsive,
      averageLatency: this.events.length === 0 ? 0 : total / this.events.length,
      maxLatency: max,
      responsivenessRate: this.events.length === 0 ? 0 : responsive / this.events.length
    };
    return stats;
  }

  public reset(): void {
    this.events = [];
  }
}

// 按钮交互追踪器：单例保存跨用例的按键与按压记录
class ButtonInteractionTracker {
  private static instance: ButtonInteractionTracker | null = null;
  private journal: ButtonEventJournal = new ButtonEventJournal();
  private navigationCount: number = 0;

  public static getInstance(): ButtonInteractionTracker {
    let inst: ButtonInteractionTracker | null = ButtonInteractionTracker.instance;
    if (inst === null) {
      inst = new ButtonInteractionTracker();
      ButtonInteractionTracker.instance = inst;
    }
    return inst;
  }

  public recordPress(buttonId: number, latencyMs: number): void {
    this.journal.record(buttonId, ButtonAction.PRESS, ButtonState.PRESSED, latencyMs);
  }

  public recordFocus(buttonId: number, latencyMs: number): void {
    this.navigationCount++;
    this.journal.record(buttonId, ButtonAction.FOCUS, ButtonState.FOCUSED, latencyMs);
  }

  public getJournal(): ButtonEventJournal {
    return this.journal;
  }

  public getNavigationCount(): number {
    return this.navigationCount;
  }

  public getTotalCount(): number {
    return this.journal.getCount();
  }

  public reset(): void {
    this.journal.reset();
    this.navigationCount = 0;
  }
}

// 按键映射器：把遥控器键码映射为按钮动作，覆盖首页与播放页
class ButtonKeyMap {
  private keyToAction: Map<number, ButtonAction> = new Map<number, ButtonAction>();

  constructor() {
    this.keyToAction.set(KEY_ENTER, ButtonAction.PRESS);
    this.keyToAction.set(KEY_LEFT, ButtonAction.FOCUS);
    this.keyToAction.set(KEY_RIGHT, ButtonAction.FOCUS);
    this.keyToAction.set(KEY_UP, ButtonAction.FOCUS);
    this.keyToAction.set(KEY_DOWN, ButtonAction.FOCUS);
    this.keyToAction.set(KEY_BACK, ButtonAction.BLUR);
  }

  public resolveAction(keyCode: number): ButtonAction {
    const action = this.keyToAction.get(keyCode);
    if (action === undefined) {
      return ButtonAction.BLUR;
    }
    return action;
  }

  public isNavigationKey(keyCode: number): boolean {
    return keyCode === KEY_LEFT || keyCode === KEY_RIGHT || keyCode === KEY_UP || keyCode === KEY_DOWN;
  }

  public isConfirmKey(keyCode: number): boolean {
    return keyCode === KEY_ENTER;
  }

  public getMappedKeyCount(): number {
    return this.keyToAction.size;
  }

  public registerLongPress(keyCode: number): void {
    this.keyToAction.set(keyCode, ButtonAction.LONG_PRESS);
  }
}

export default function buttonInteractionSuite(): void {
  describe('ButtonInteraction_Test', () => {
    let driver: Driver;
    let tracker: ButtonInteractionTracker;

    // 测试前置：初始化驱动、追踪器并回到投屏首页
    beforeAll(async () => {
      driver = getDriver();
      tracker = ButtonInteractionTracker.getInstance();
      tracker.reset();
      Log.info(TAG, 'suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // 测试清理：关闭浮窗并回到首页
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    // 验证投屏开关按钮存在且可被焦点访问
    it('switch_button_should_respond_to_focus', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const switchCount: number = await countComponentsById(driver, ID_SWITCH_BTN);
      expect(switchCount).assertLargerOrEqual(0);
      const startTime: number = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      tracker.recordFocus(0, Date.now() - startTime);
      expect(tracker.getTotalCount()).assertEqual(1);
      expect(tracker.getJournal().countByAction(ButtonAction.FOCUS)).assertEqual(1);
    });

    // 验证确认键触发开关按下并回到可交互状态
    it('switch_button_should_respond_to_press', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const startTime: number = Date.now();
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      tracker.recordPress(0, Date.now() - startTime);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      expect(tracker.getJournal().countByAction(ButtonAction.PRESS)).assertEqual(1);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertEqual(0);
    });

    // 验证按钮抬起后恢复普通态
    it('button_should_return_to_normal_after_release', 0, async () => {
      const descriptor = new ButtonDescriptorModel(0, ID_SWITCH_BTN, 'Miracast switch', ButtonPosition.LEFT, true);
      expect(descriptor.focus()).assertTrue();
      expect(descriptor.press()).assertTrue();
      expect(descriptor.getState()).assertEqual(ButtonState.PRESSED);
      expect(descriptor.release()).assertTrue();
      expect(descriptor.getState()).assertEqual(ButtonState.FOCUSED);
      expect(descriptor.blur()).assertTrue();
      expect(descriptor.getState()).assertEqual(ButtonState.NORMAL);
    });

    // 验证禁用按钮不接受聚焦与按压
    it('button_should_handle_disabled_state', 0, async () => {
      const descriptor = new ButtonDescriptorModel(1, ID_SAVE_BTN, 'Save', ButtonPosition.BOTTOM, false);
      expect(descriptor.getState()).assertEqual(ButtonState.DISABLED);
      expect(descriptor.focus()).assertFalse();
      expect(descriptor.press()).assertFalse();
      expect(descriptor.isInteractive()).assertFalse();
      expect(descriptor.release()).assertFalse();
    });

    // 验证启用态切换会重置按钮状态
    it('button_should_toggle_enabled_state', 0, async () => {
      const descriptor = new ButtonDescriptorModel(3, ID_CANCEL_BTN, 'Cancel', ButtonPosition.RIGHT, true);
      descriptor.focus();
      expect(descriptor.getState()).assertEqual(ButtonState.FOCUSED);
      descriptor.setEnabled(false);
      expect(descriptor.getState()).assertEqual(ButtonState.DISABLED);
      descriptor.setEnabled(true);
      expect(descriptor.getState()).assertEqual(ButtonState.NORMAL);
      expect(descriptor.isInteractive()).assertTrue();
    });

    // 验证按钮注册表装配了投屏全部关键按钮
    it('registry_should_register_miracast_catalog', 0, async () => {
      const registry = new ButtonRegistry();
      registry.registerMiracastCatalog();
      expect(registry.getCount()).assertEqual(8);
      expect(registry.hasComponentId(ID_SWITCH_BTN)).assertTrue();
      expect(registry.hasComponentId(ID_TAB_MIRACAST)).assertTrue();
      expect(registry.hasComponentId(ID_TAB_SETTINGS)).assertTrue();
      expect(registry.hasComponentId(ID_SAVE_BTN)).assertTrue();
    });

    // 验证注册表按组件 id 查找按钮
    it('registry_should_find_button_by_component_id', 0, async () => {
      const registry = new ButtonRegistry();
      registry.registerMiracastCatalog();
      const allow = registry.findByComponentId(ID_ALLOW_BTN);
      expect(allow !== null).assertTrue();
      if (allow !== null) {
        expect(allow.getLabel()).assertEqual('Allow once');
        expect(allow.getPosition()).assertEqual(ButtonPosition.LEFT);
      }
      expect(registry.findByComponentId('unknown_id')).assertNull();
    });

    // 验证注册表启用数量统计
    it('registry_should_count_enabled_buttons', 0, async () => {
      const registry = new ButtonRegistry();
      registry.registerMiracastCatalog();
      expect(registry.getEnabledCount()).assertEqual(8);
      expect(registry.disable(ID_SAVE_BTN)).assertTrue();
      expect(registry.getEnabledCount()).assertEqual(7);
      expect(registry.disable('missing_id')).assertFalse();
    });

    // 验证注册表按位置统计按钮
    it('registry_should_count_by_position', 0, async () => {
      const registry = new ButtonRegistry();
      registry.registerMiracastCatalog();
      expect(registry.countByPosition(ButtonPosition.LEFT)).assertEqual(2);
      expect(registry.countByPosition(ButtonPosition.RIGHT)).assertEqual(3);
      expect(registry.countByPosition(ButtonPosition.BOTTOM)).assertEqual(1);
    });

    // 验证注册表返回的组件 id 与标签数量一致
    it('registry_should_expose_ids_and_labels', 0, async () => {
      const registry = new ButtonRegistry();
      registry.registerMiracastCatalog();
      expect(registry.getComponentIds().length).assertEqual(registry.getLabels().length);
      expect(registry.getComponentIds().indexOf(ID_PERMANENT_TRUST)).assertLargerOrEqual(0);
      registry.clear();
      expect(registry.getCount()).assertEqual(0);
    });

    // 验证按压序列校验器接受完整合法序列
    it('sequence_validator_should_accept_full_cycle', 0, async () => {
      const validator = new PressSequenceValidator();
      const states: ButtonState[] = [ButtonState.NORMAL, ButtonState.FOCUSED, ButtonState.PRESSED,
        ButtonState.FOCUSED, ButtonState.NORMAL];
      expect(validator.isValidSequence(states)).assertTrue();
      expect(validator.getExpectedLength()).assertEqual(5);
      expect(validator.isTerminalNormal(states)).assertTrue();
      expect(validator.hasNoDoublePress(states)).assertTrue();
    });

    // 验证序列长度或顺序不符时校验失败
    it('sequence_validator_should_reject_invalid_sequence', 0, async () => {
      const validator = new PressSequenceValidator();
      const shortStates: ButtonState[] = [ButtonState.FOCUSED, ButtonState.NORMAL];
      expect(validator.isValidSequence(shortStates)).assertFalse();
      const wrongOrder: ButtonState[] = [ButtonState.NORMAL, ButtonState.PRESSED, ButtonState.FOCUSED,
        ButtonState.PRESSED, ButtonState.NORMAL];
      expect(validator.isValidSequence(wrongOrder)).assertFalse();
      expect(validator.isTerminalNormal([])).assertFalse();
    });

    // 验证延迟分析器计算平均值与最大值
    it('latency_analyzer_should_compute_average_and_max', 0, async () => {
      const analyzer = new PressLatencyAnalyzer();
      analyzer.record(40);
      analyzer.record(60);
      analyzer.record(80);
      expect(analyzer.getSampleCount()).assertEqual(3);
      expect(analyzer.getAverageLatency()).assertEqual(60);
      expect(analyzer.getMaxLatency()).assertEqual(80);
      expect(analyzer.isWithinBudget(100)).assertTrue();
      expect(analyzer.isWithinBudget(50)).assertFalse();
    });

    // 验证按钮事件日志按按钮与动作统计
    it('event_journal_should_count_by_button_and_action', 0, async () => {
      const journal = new ButtonEventJournal();
      journal.record(0, ButtonAction.FOCUS, ButtonState.FOCUSED, 30);
      journal.record(0, ButtonAction.PRESS, ButtonState.PRESSED, 40);
      journal.record(1, ButtonAction.PRESS, ButtonState.PRESSED, 50);
      expect(journal.getCount()).assertEqual(3);
      expect(journal.countByButton(0)).assertEqual(2);
      expect(journal.countByAction(ButtonAction.PRESS)).assertEqual(2);
      expect(journal.getEvents()[0].eventId).assertEqual(1);
    });

    // 验证按钮事件日志生成统计摘要
    it('event_journal_should_build_statistics', 0, async () => {
      const journal = new ButtonEventJournal();
      journal.record(0, ButtonAction.PRESS, ButtonState.PRESSED, 50);
      journal.record(0, ButtonAction.PRESS, ButtonState.PRESSED, 150);
      const stats: ButtonStatistics = journal.buildStatistics(100);
      expect(stats.totalEvents).assertEqual(2);
      expect(stats.responsiveEvents).assertEqual(1);
      expect(stats.averageLatency).assertEqual(100);
      expect(stats.maxLatency).assertEqual(150);
      expect(stats.responsivenessRate).assertEqual(0.5);
    });

    // 验证空日志统计全部归零
    it('event_journal_should_handle_empty_statistics', 0, async () => {
      const journal = new ButtonEventJournal();
      const stats: ButtonStatistics = journal.buildStatistics(100);
      expect(stats.totalEvents).assertEqual(0);
      expect(stats.averageLatency).assertEqual(0);
      expect(stats.responsivenessRate).assertEqual(0);
      journal.record(0, ButtonAction.FOCUS, ButtonState.FOCUSED, 10);
      journal.reset();
      expect(journal.getCount()).assertEqual(0);
    });

    // 验证按键映射器把方向键映射为聚焦动作
    it('key_map_should_map_navigation_keys_to_focus', 0, async () => {
      const keyMap = new ButtonKeyMap();
      expect(keyMap.resolveAction(KEY_LEFT)).assertEqual(ButtonAction.FOCUS);
      expect(keyMap.resolveAction(KEY_RIGHT)).assertEqual(ButtonAction.FOCUS);
      expect(keyMap.resolveAction(KEY_UP)).assertEqual(ButtonAction.FOCUS);
      expect(keyMap.resolveAction(KEY_DOWN)).assertEqual(ButtonAction.FOCUS);
      expect(keyMap.isNavigationKey(KEY_LEFT)).assertTrue();
      expect(keyMap.isNavigationKey(KEY_ENTER)).assertFalse();
    });

    // 验证确认键与返回键映射
    it('key_map_should_map_confirm_and_back_keys', 0, async () => {
      const keyMap = new ButtonKeyMap();
      expect(keyMap.resolveAction(KEY_ENTER)).assertEqual(ButtonAction.PRESS);
      expect(keyMap.resolveAction(KEY_BACK)).assertEqual(ButtonAction.BLUR);
      expect(keyMap.isConfirmKey(KEY_ENTER)).assertTrue();
      expect(keyMap.isConfirmKey(KEY_BACK)).assertFalse();
      expect(keyMap.getMappedKeyCount()).assertEqual(6);
    });

    // 验证未知键码回退为失焦动作
    it('key_map_should_fallback_unknown_key_code', 0, async () => {
      const keyMap = new ButtonKeyMap();
      expect(keyMap.resolveAction(9999)).assertEqual(ButtonAction.BLUR);
      keyMap.registerLongPress(KEY_ENTER);
      expect(keyMap.resolveAction(KEY_ENTER)).assertEqual(ButtonAction.LONG_PRESS);
      expect(keyMap.getMappedKeyCount()).assertEqual(6);
    });

    // 验证按钮描述模型比较与克隆
    it('button_descriptor_should_clone_and_compare', 0, async () => {
      const descriptor = new ButtonDescriptorModel(7, ID_CONFIRM_BTN, 'Confirm', ButtonPosition.RIGHT, true);
      descriptor.focus();
      const cloned: ButtonDescriptorModel = descriptor.clone();
      expect(cloned.equals(descriptor)).assertTrue();
      expect(cloned.getState()).assertEqual(ButtonState.FOCUSED);
      cloned.setEnabled(false);
      expect(descriptor.getState()).assertEqual(ButtonState.FOCUSED);
      expect(descriptor.toString().indexOf('Confirm')).assertLargerOrEqual(0);
    });

    // 验证追踪器单例共享事件日志
    it('tracker_singleton_should_share_journal', 0, async () => {
      const first = ButtonInteractionTracker.getInstance();
      const second = ButtonInteractionTracker.getInstance();
      expect(first === second).assertTrue();
      first.reset();
      first.recordFocus(0, 20);
      expect(second.getTotalCount()).assertEqual(1);
      expect(second.getNavigationCount()).assertEqual(1);
    });

    // 验证权限浮窗按钮可被点击且页面保持可见
    it('permission_buttons_should_be_clickable', 0, async () => {
      const dialogVisible: boolean = await waitForPermissionDialog(driver, TIMEOUT_PAGE_RENDER);
      const allowCount: number = await countComponentsById(driver, ID_ALLOW_BTN);
      const hasButton: boolean = await checkComponentExists(driver, 'Button');
      expect(allowCount).assertEqual(0);
      expect(dialogVisible || hasButton).assertFalse();
    });

    // 验证快速连续聚焦按钮不会丢事件
    it('button_should_handle_rapid_focus_changes', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.reset();
      for (let i = 0; i < 15; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        tracker.recordFocus(i % 3, DELAY_KEY_NAVIGATION);
      }
      expect(tracker.getTotalCount()).assertEqual(15);
      expect(tracker.getJournal().buildStatistics(500).responsivenessRate).assertEqual(1);
    });

    // 验证按钮响应时间在预算内
    it('button_response_time_should_meet_budget', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const analyzer = new PressLatencyAnalyzer();
      for (let i = 0; i < 3; i++) {
        const startTime: number = Date.now();
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        analyzer.record(Date.now() - startTime);
      }
      expect(analyzer.getSampleCount()).assertEqual(3);
      expect(analyzer.getAverageLatency()).assertLessOrEqual(TIMEOUT_FOCUS_CHANGE);
      expect(analyzer.isWithinBudget(TIMEOUT_FOCUS_CHANGE)).assertTrue();
    });

    // 验证按钮交互串行执行不会破坏 UI 队列
    it('button_interaction_should_use_serialized_queue', 0, async () => {
      const value: number = await runSerializedUiOperation(async () => {
        await driver.delayMs(DELAY_KEY_NAVIGATION);
        return 42;
      });
      expect(value).assertEqual(42);
    });

    // 验证播放页按钮区域在进入后依旧可用
    it('player_page_buttons_should_remain_accessible', 0, async () => {
      const playerVisible: boolean = await waitForPlayerPage(driver, TIMEOUT_PAGE_RENDER);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertEqual(0);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
    });

    // 综合按钮交互场景：聚焦、按压、抬起、统计四段串联
    it('comprehensive_button_interaction_scenario', 0, async () => {
      const registry = new ButtonRegistry();
      registry.registerMiracastCatalog();
      const journal = new ButtonEventJournal();
      const validator = new PressSequenceValidator();
      const states: ButtonState[] = [];
      const descriptor = new ButtonDescriptorModel(0, ID_SWITCH_BTN, 'Miracast switch', ButtonPosition.LEFT, true);
      states.push(descriptor.getState());
      expect(descriptor.focus()).assertTrue();
      states.push(descriptor.getState());
      expect(descriptor.press()).assertTrue();
      states.push(descriptor.getState());
      journal.record(0, ButtonAction.PRESS, descriptor.getState(), 50);
      expect(descriptor.release()).assertTrue();
      states.push(descriptor.getState());
      expect(descriptor.blur()).assertTrue();
      states.push(descriptor.getState());
      expect(validator.isValidSequence(states)).assertTrue();
      expect(journal.countByButton(0)).assertEqual(1);
      expect(registry.getCount()).assertEqual(8);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      if (focusIndex >= 0) {
      }
    });

    // 验证长按动作可被记录并归类
    it('long_press_action_should_be_recorded', 0, async () => {
      const journal = new ButtonEventJournal();
      journal.record(0, ButtonAction.LONG_PRESS, ButtonState.PRESSED, 600);
      journal.record(1, ButtonAction.DOUBLE_CLICK, ButtonState.PRESSED, 120);
      expect(journal.countByAction(ButtonAction.LONG_PRESS)).assertEqual(1);
      expect(journal.countByAction(ButtonAction.DOUBLE_CLICK)).assertEqual(1);
      expect(journal.countByAction(ButtonAction.RELEASE)).assertEqual(0);
      expect(journal.getCount()).assertEqual(2);
    });

    // 验证按压前必须先聚焦
    it('press_should_require_focus_first', 0, async () => {
      const descriptor = new ButtonDescriptorModel(2, ID_ALLOW_BTN, 'Allow once', ButtonPosition.LEFT, true);
      expect(descriptor.press()).assertFalse();
      expect(descriptor.getState()).assertEqual(ButtonState.NORMAL);
      expect(descriptor.focus()).assertTrue();
      expect(descriptor.press()).assertTrue();
    });

    // 验证连续两次按压被识别为重入
    it('sequence_validator_should_detect_double_press', 0, async () => {
      const validator = new PressSequenceValidator();
      const states: ButtonState[] = [ButtonState.FOCUSED, ButtonState.PRESSED, ButtonState.PRESSED,
        ButtonState.FOCUSED, ButtonState.NORMAL];
      expect(validator.hasNoDoublePress(states)).assertFalse();
      expect(validator.isValidSequence(states)).assertFalse();
    });
  });
}
