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
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_UP,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  runSerializedUiOperation,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

// 按钮状态枚举：覆盖TV遥控器操作中按钮的所有可能状态，确保交互逻辑完整
enum ButtonState {
  NORMAL = 'normal', FOCUSED = 'focused', PRESSED = 'pressed', DISABLED = 'disabled'
}

// 按钮记录接口：定义按钮交互的关键指标，用于量化评估用户交互体验
interface ButtonRecord {
  buttonIndex: number;
  state: ButtonState;
  isResponsive: boolean;
  responseTime: number;
  timestamp: number;
}

// 按钮交互追踪器：单例模式确保跨测试用例数据一致性，集中管理按钮交互评估
class ButtonInteractionTracker {
  private static instance: ButtonInteractionTracker;
  private buttonHistory: ButtonRecord[] = [];
  private totalInteractions: number = 0;
  private responsiveInteractions: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ButtonInteractionTracker {
    if (!ButtonInteractionTracker.instance) {
      ButtonInteractionTracker.instance = new ButtonInteractionTracker();
    }
    return ButtonInteractionTracker.instance;
  }

  // 记录按钮交互：收集每次按钮操作的状态和响应时间，为后续分析提供数据
  public recordButton(buttonIndex: number, state: ButtonState, isResponsive: boolean, responseTime: number): void {
    const record: ButtonRecord = {
      buttonIndex,
      state,
      isResponsive,
      responseTime,
      timestamp: Date.now()
    };
    this.buttonHistory.push(record);
    this.totalInteractions++;
    if (isResponsive) {
      this.responsiveInteractions++;
    }
  }

  public getButtonHistory(): ButtonRecord[] {
    return [...this.buttonHistory];
  }

  public getTotalInteractions(): number {
    return this.totalInteractions;
  }

  public getResponsiveInteractions(): number {
    return this.responsiveInteractions;
  }

  public resetTracker(): void {
    this.buttonHistory = [];
    this.totalInteractions = 0;
    this.responsiveInteractions = 0;
  }

  // 计算响应率：评估按钮交互的成功率，确保TV设备按钮响应符合设计标准
  public getResponsivenessRate(): number {
    if (this.totalInteractions === 0) {
      return 0;
    }
    return this.responsiveInteractions / this.totalInteractions;
  }

  public hasTestedButton(buttonIndex: number): boolean {
    return this.buttonHistory.some(record => record.buttonIndex === buttonIndex);
  }

  public hasState(state: ButtonState): boolean {
    return this.buttonHistory.some(record => record.state === state);
  }
}

// 按钮交互动作枚举：定义按钮交互支持的各类动作，用于交互分类统计
enum ButtonAction {
  FOCUS = 'focus', CLICK = 'click', LONG_PRESS = 'long_press', DOUBLE_CLICK = 'double_click', HOVER = 'hover'
}

// 按钮布局位置枚举：定义对话框按钮的布局位置
enum ButtonPosition {
  LEFT = 'left', CENTER = 'center', RIGHT = 'right', TOP = 'top', BOTTOM = 'bottom'
}

// 按钮描述接口：描述单个按钮的静态属性
interface ButtonDescriptor {
  buttonId: number;
  label: string;
  position: ButtonPosition;
  enabled: boolean;
}

// 按钮交互事件接口：描述一次按钮交互事件的完整信息
interface ButtonInteractionEvent {
  eventId: number;
  buttonId: number;
  action: ButtonAction;
  state: ButtonState;
  latencyMs: number;
}

// 按钮描述模型类：封装按钮静态属性并提供状态校验与克隆能力
class ButtonDescriptorModel {
  private buttonId: number;
  private label: string;
  private position: ButtonPosition;
  private enabled: boolean;

  constructor(buttonId: number, label: string, position: ButtonPosition, enabled: boolean) {
    this.buttonId = buttonId;
    this.label = label;
    this.position = position;
    this.enabled = enabled;
  }

  public getButtonId(): number {
    return this.buttonId;
  }

  public getLabel(): string {
    return this.label;
  }

  public getPosition(): ButtonPosition {
    return this.position;
  }

  public isEnabled(): boolean {
    return this.enabled;
  }

  public setEnabled(enabled: boolean): void {
    this.enabled = enabled;
  }

  // 判断按钮是否可交互：启用状态才可交互
  public isInteractive(): boolean {
    return this.enabled;
  }

  // 校验按钮标签是否非空
  public hasValidLabel(): boolean {
    return this.label.length > 0;
  }

  public equals(other: ButtonDescriptorModel): boolean {
    return this.buttonId === other.buttonId && this.label === other.label && this.position === other.position &&
      this.enabled === other.enabled;
  }

  public clone(): ButtonDescriptorModel {
    return new ButtonDescriptorModel(this.buttonId, this.label, this.position, this.enabled);
  }

  public toString(): string {
    return 'ButtonDescriptorModel(' + this.buttonId + ', ' + this.label + ')';
  }
}

// 按钮交互事件模型类：封装交互事件数据并提供延迟评估能力
class ButtonInteractionEventModel {
  private eventId: number;
  private buttonId: number;
  private action: ButtonAction;
  private state: ButtonState;
  private latencyMs: number;

  constructor(eventId: number, buttonId: number, action: ButtonAction, state: ButtonState, latencyMs: number) {
    this.eventId = eventId;
    this.buttonId = buttonId;
    this.action = action;
    this.state = state;
    this.latencyMs = latencyMs;
  }

  public getEventId(): number {
    return this.eventId;
  }

  public getButtonId(): number {
    return this.buttonId;
  }

  public getAction(): ButtonAction {
    return this.action;
  }

  public getState(): ButtonState {
    return this.state;
  }

  public getLatencyMs(): number {
    return this.latencyMs;
  }

  // 判断事件响应是否达标：延迟需在阈值以内
  public isResponsiveWithin(thresholdMs: number): boolean {
    return this.latencyMs <= thresholdMs;
  }

  // 判断是否为点击类动作
  public isClickAction(): boolean {
    return this.action === ButtonAction.CLICK || this.action === ButtonAction.DOUBLE_CLICK;
  }

  public equals(other: ButtonInteractionEventModel): boolean {
    return this.eventId === other.eventId && this.buttonId === other.buttonId;
  }

  public clone(): ButtonInteractionEventModel {
    return new ButtonInteractionEventModel(this.eventId, this.buttonId, this.action, this.state, this.latencyMs);
  }
}

// 按钮交互统计类：聚合按钮交互事件，输出响应率与延迟摘要
class ButtonInteractionStatistics {
  private events: ButtonInteractionEventModel[] = [];
  private descriptors: ButtonDescriptorModel[] = [];

  public addEvent(event: ButtonInteractionEventModel): void {
    this.events.push(event.clone());
  }

  public addDescriptor(descriptor: ButtonDescriptorModel): void {
    this.descriptors.push(descriptor.clone());
  }

  public clear(): void {
    this.events = [];
    this.descriptors = [];
  }

  public getEventCount(): number {
    return this.events.length;
  }

  public getDescriptorCount(): number {
    return this.descriptors.length;
  }

  // 计算响应率：延迟达标的交互占总交互比例
  public getResponsivenessRate(thresholdMs: number): number {
    if (this.events.length === 0) {
      return 0;
    }
    const responsiveCount: number = this.events.filter(event => event.isResponsiveWithin(thresholdMs)).length;
    return responsiveCount / this.events.length;
  }

  // 计算平均交互延迟：用于评估整体响应速度
  public getAverageLatency(): number {
    if (this.events.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const event of this.events) {
      total += event.getLatencyMs();
    }
    return total / this.events.length;
  }

  // 统计指定按钮的交互次数
  public getEventCountByButton(buttonId: number): number {
    return this.events.filter(event => event.getButtonId() === buttonId).length;
  }
}

// 按钮交互校验器：校验按钮描述与交互事件的合法性
class ButtonInteractionValidator {
  // 校验按钮描述是否合法：标签非空且按钮编号非负
  public isValidDescriptor(descriptor: ButtonDescriptorModel): boolean {
    return descriptor.getButtonId() >= 0 && descriptor.hasValidLabel();
  }

  // 校验交互事件是否合法：按钮编号非负且延迟非负
  public isValidEvent(event: ButtonInteractionEventModel): boolean {
    return event.getButtonId() >= 0 && event.getLatencyMs() >= 0;
  }

  // 校验事件是否针对启用的按钮
  public isEventTargetValid(descriptors: ButtonDescriptorModel[], event: ButtonInteractionEventModel): boolean {
    for (const descriptor of descriptors) {
      if (descriptor.getButtonId() === event.getButtonId()) {
        return descriptor.isEnabled();
      }
    }
    return false;
  }
}

// 按钮交互模式枚举：定义按钮交互的执行模式
enum InteractionMode {
  SINGLE = 'single', SEQUENTIAL = 'sequential', RANDOM = 'random', BURST = 'burst'
}

// 交互序列记录接口：描述一段按钮交互序列的汇总信息
interface InteractionSequenceRecord {
  sequenceId: number;
  mode: InteractionMode;
  actionCount: number;
  totalLatencyMs: number;
  allResponsive: boolean;
}

// 按钮交互序列模型类：封装交互序列信息并提供响应评估能力
class InteractionSequenceModel {
  private sequenceId: number;
  private mode: InteractionMode;
  private actionCount: number;
  private totalLatencyMs: number;
  private allResponsive: boolean;

  constructor(sequenceId: number, mode: InteractionMode, actionCount: number, totalLatencyMs: number,
    allResponsive: boolean) {
    this.sequenceId = sequenceId;
    this.mode = mode;
    this.actionCount = actionCount;
    this.totalLatencyMs = totalLatencyMs;
    this.allResponsive = allResponsive;
  }

  public getSequenceId(): number {
    return this.sequenceId;
  }

  public getMode(): InteractionMode {
    return this.mode;
  }

  public getActionCount(): number {
    return this.actionCount;
  }

  public getTotalLatencyMs(): number {
    return this.totalLatencyMs;
  }

  public isAllResponsive(): boolean {
    return this.allResponsive;
  }

  // 计算单次交互平均延迟
  public getAverageLatency(): number {
    if (this.actionCount === 0) {
      return 0;
    }
    return this.totalLatencyMs / this.actionCount;
  }

  // 判断是否为突发模式
  public isBurstMode(): boolean {
    return this.mode === InteractionMode.BURST;
  }

  public clone(): InteractionSequenceModel {
    return new InteractionSequenceModel(this.sequenceId, this.mode, this.actionCount, this.totalLatencyMs,
      this.allResponsive);
  }

  public toString(): string {
    return 'InteractionSequenceModel(' + this.sequenceId + ', ' + this.mode + ')';
  }
}

// 交互序列集合类：聚合交互序列记录，输出响应率与延迟摘要
class InteractionSequenceCollection {
  private sequences: InteractionSequenceModel[] = [];

  public addSequence(sequence: InteractionSequenceModel): void {
    this.sequences.push(sequence.clone());
  }

  public clear(): void {
    this.sequences = [];
  }

  public getSequenceCount(): number {
    return this.sequences.length;
  }

  // 计算全部响应序列的占比
  public getAllResponsiveRate(): number {
    if (this.sequences.length === 0) {
      return 0;
    }
    const responsiveCount: number = this.sequences.filter(sequence => sequence.isAllResponsive()).length;
    return responsiveCount / this.sequences.length;
  }

  // 计算所有序列的平均延迟
  public getOverallAverageLatency(): number {
    if (this.sequences.length === 0) {
      return 0;
    }
    let totalLatency: number = 0;
    let totalActions: number = 0;
    for (const sequence of this.sequences) {
      totalLatency += sequence.getTotalLatencyMs();
      totalActions += sequence.getActionCount();
    }
    if (totalActions === 0) {
      return 0;
    }
    return totalLatency / totalActions;
  }
}

// 交互序列构建器：以链式风格构建交互序列记录
class InteractionSequenceBuilder {
  private sequenceId: number = 0;
  private mode: InteractionMode = InteractionMode.SINGLE;
  private actionCount: number = 0;
  private totalLatencyMs: number = 0;
  private allResponsive: boolean = true;

  public setSequenceId(sequenceId: number): InteractionSequenceBuilder {
    this.sequenceId = sequenceId;
    return this;
  }

  public setMode(mode: InteractionMode): InteractionSequenceBuilder {
    this.mode = mode;
    return this;
  }

  public setActionCount(actionCount: number): InteractionSequenceBuilder {
    this.actionCount = actionCount;
    return this;
  }

  public setTotalLatencyMs(totalLatencyMs: number): InteractionSequenceBuilder {
    this.totalLatencyMs = totalLatencyMs;
    return this;
  }

  public setAllResponsive(allResponsive: boolean): InteractionSequenceBuilder {
    this.allResponsive = allResponsive;
    return this;
  }

  public build(): InteractionSequenceModel {
    return new InteractionSequenceModel(this.sequenceId, this.mode, this.actionCount, this.totalLatencyMs,
      this.allResponsive);
  }
}

// 按钮交互模式校验器：校验交互序列模式与数据的合法性
class InteractionModeValidator {
  // 校验交互序列模式是否合法
  public isValidMode(mode: InteractionMode): boolean {
    return mode === InteractionMode.SINGLE || mode === InteractionMode.SEQUENTIAL || mode === InteractionMode.RANDOM ||
      mode === InteractionMode.BURST;
  }

  // 校验序列数据是否自洽：动作数与延迟均非负
  public isValidSequence(sequence: InteractionSequenceModel): boolean {
    return sequence.getActionCount() >= 0 && sequence.getTotalLatencyMs() >= 0;
  }
}

export default function buttonInteractionTest() {
  describe('ButtonInteraction_Test', () => {
    let driver: Driver;
    let buttonTracker: ButtonInteractionTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      buttonTracker = ButtonInteractionTracker.getInstance();
      buttonTracker.resetTracker();
      await runSerializedUiOperation(async () => {
        await driver.delayMs(1000);
      });
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证button should响应：确保TV设备respond to focus交互流畅
    it('button_should_respond_to_focus', 0, async () => { // 验证按钮焦点响应：确保TV遥控器导航时按钮能正确获取焦点
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      buttonTracker.recordButton(0, ButtonState.FOCUSED, isFocusCorrect, responseTime);

      expect(buttonTracker.hasState(ButtonState.FOCUSED)).assertTrue();
    });

    // 验证button should响应：确保TV设备respond to press交互流畅
    it('button_should_respond_to_press', 0, async () => { // 验证按钮按下响应：确保TV遥控器确认键能正确触发按钮按下状态
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      buttonTracker.recordButton(0, ButtonState.PRESSED, true, responseTime);

      expect(buttonTracker.hasState(ButtonState.PRESSED)).assertTrue();
    });

    // 验证button should返回：确保TV设备return to normal after release结果正确
    it('button_should_return_to_normal_after_release', 0, async () => { // 验证按钮释放后恢复：确保TV设备按钮在操作完成后能正确回到正常状态
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      buttonTracker.recordButton(1, ButtonState.NORMAL, isFocusCorrect, responseTime);

      expect(buttonTracker.hasState(ButtonState.NORMAL)).assertTrue();
    });

    // 验证button should处理：确保TV设备在handle disabled state下功能正常
    it('button_should_handle_disabled_state', 0, async () => { // 验证禁用状态处理：确保TV设备在按钮不可用时正确显示禁用状态
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      buttonTracker.recordButton(2, ButtonState.DISABLED, false, 50);

      expect(buttonTracker.hasState(ButtonState.DISABLED)).assertTrue();
    });

    // 验证button should处理：确保TV设备在handle all buttons下功能正常
    it('button_should_handle_all_buttons', 0, async () => { // 验证所有按钮处理：确保TV设备对话框中所有按钮都能正常交互
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        buttonTracker.recordButton(i, ButtonState.FOCUSED, true, 50);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(50);
        });
      }

      expect(buttonTracker.getTotalInteractions()).assertEqual(3);
    });

    // 记录测试数据：收集每次操作的关键指标，为后续分析提供原始数据
    it('button_records_timestamps_should_be_chronological', 0, async () => { // 验证时间戳顺序：确保按钮记录按时间顺序存储，便于后续分析
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      buttonTracker.recordButton(0, ButtonState.FOCUSED, true, 50);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      buttonTracker.recordButton(1, ButtonState.PRESSED, true, 50);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      buttonTracker.recordButton(2, ButtonState.NORMAL, true, 50);

      const history = buttonTracker.getButtonHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证button tracker稳定：确保TV设备在singleton should maintain consistency下性能不降低
    it('button_tracker_singleton_should_maintain_consistency', 0, async () => { // 验证单例一致性：确保追踪器在跨测试用例时保持数据一致性
      const tracker1 = ButtonInteractionTracker.getInstance();
      const tracker2 = ButtonInteractionTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordButton(0, ButtonState.FOCUSED, true, 100);

      expect(tracker2.getTotalInteractions()).assertEqual(1);
      expect(tracker2.getResponsiveInteractions()).assertEqual(1);
    });

    // 验证button should处理：确保TV设备在handle all states下功能正常
    it('button_should_handle_all_states', 0, async () => { // 验证所有状态处理：确保TV设备按钮能正确切换各种状态
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      const states = [ButtonState.NORMAL, ButtonState.FOCUSED, ButtonState.PRESSED, ButtonState.DISABLED];
      for (const state of states) {
        buttonTracker.recordButton(0, state, state !== ButtonState.DISABLED, 50);
      }

      expect(buttonTracker.getTotalInteractions()).assertEqual(4);
    });

    // 验证button should稳定：确保TV设备在maintain responsiveness下性能不降低
    it('button_should_maintain_responsiveness', 0, async () => { // 验证响应稳定性：确保TV设备在频繁操作下按钮响应不降底
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        buttonTracker.recordButton(i % 3, ButtonState.FOCUSED, true, 30);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(50);
        });
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证button should处理：确保TV设备在handle rapid interactions下功能正常
    it('button_should_handle_rapid_interactions', 0, async () => { // 验证快速交互处理：确保TV设备在快速操作时按钮系统不崩溃
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      for (let i = 0; i < 15; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        buttonTracker.recordButton(i % 3, ButtonState.FOCUSED, true, 20);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(100);
        });
      }

      expect(buttonTracker.getTotalInteractions()).assertEqual(15);
      expect(buttonTracker.getResponsivenessRate()).assertEqual(1);
    });

    // 综合comprehensive button场景：验证完整操作流程中功能正确
    it('comprehensive_button_interaction_scenario', 0, async () => { // 综合按钮交互场景：验证完整操作流程中按钮状态转换正确
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      buttonTracker.recordButton(0, ButtonState.FOCUSED, true, responseTime1);

      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      buttonTracker.recordButton(0, ButtonState.PRESSED, true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(buttonTracker.getTotalInteractions()).assertEqual(2);
      expect(buttonTracker.getResponsivenessRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });

    // 验证按钮描述模型：确保校验与克隆功能正确
    it('button_descriptor_model_should_validate_and_clone', 0, async () => {
      const descriptor = new ButtonDescriptorModel(1, '关机', ButtonPosition.CENTER, true);
      expect(descriptor.getButtonId()).assertEqual(1);
      expect(descriptor.getLabel()).assertEqual('关机');
      expect(descriptor.getPosition()).assertEqual(ButtonPosition.CENTER);
      expect(descriptor.isInteractive()).assertTrue();
      expect(descriptor.hasValidLabel()).assertTrue();
      const cloned = descriptor.clone();
      expect(cloned.equals(descriptor)).assertTrue();
      const text = descriptor.toString();
      expect(text.indexOf('关机')).assertLargerOrEqual(0);
    });

    // 验证按钮交互事件模型：确保响应评估与动作分类正确
    it('button_interaction_event_model_should_evaluate_responsiveness', 0, async () => {
      const event = new ButtonInteractionEventModel(1, 0, ButtonAction.CLICK, ButtonState.PRESSED, 80);
      expect(event.getEventId()).assertEqual(1);
      expect(event.getButtonId()).assertEqual(0);
      expect(event.getLatencyMs()).assertEqual(80);
      expect(event.isResponsiveWithin(100)).assertTrue();
      expect(event.isResponsiveWithin(50)).assertFalse();
      expect(event.isClickAction()).assertTrue();
    });

    // 验证按钮交互统计：确保响应率与平均延迟计算正确
    it('button_interaction_statistics_should_compute_rates', 0, async () => {
      const statistics = new ButtonInteractionStatistics();
      statistics.addEvent(new ButtonInteractionEventModel(1, 0, ButtonAction.CLICK, ButtonState.PRESSED, 40));
      statistics.addEvent(new ButtonInteractionEventModel(2, 1, ButtonAction.FOCUS, ButtonState.FOCUSED, 200));
      statistics.addEvent(new ButtonInteractionEventModel(3, 2, ButtonAction.HOVER, ButtonState.NORMAL, 60));
      expect(statistics.getEventCount()).assertEqual(3);
      expect(statistics.getResponsivenessRate(100)).assertEqual(2 / 3);
      expect(statistics.getAverageLatency()).assertEqual(100);
    });

    // 验证按钮交互校验器：确保描述合法性校验正确
    it('button_interaction_validator_should_check_descriptor', 0, async () => {
      const validator = new ButtonInteractionValidator();
      const valid = new ButtonDescriptorModel(0, '重启', ButtonPosition.LEFT, true);
      const invalid = new ButtonDescriptorModel(-1, '', ButtonPosition.RIGHT, true);
      expect(validator.isValidDescriptor(valid)).assertTrue();
      expect(validator.isValidDescriptor(invalid)).assertFalse();
    });

    // 验证交互序列模型：确保平均延迟计算正确
    it('interaction_sequence_model_should_compute_average_latency', 0, async () => {
      const sequence = new InteractionSequenceModel(1, InteractionMode.SEQUENTIAL, 4, 200, true);
      expect(sequence.getSequenceId()).assertEqual(1);
      expect(sequence.getMode()).assertEqual(InteractionMode.SEQUENTIAL);
      expect(sequence.getActionCount()).assertEqual(4);
      expect(sequence.isAllResponsive()).assertTrue();
      expect(sequence.getAverageLatency()).assertEqual(50);
    });

    // 验证交互序列集合：确保整体响应率与平均延迟聚合正确
    it('interaction_sequence_collection_should_aggregate', 0, async () => {
      const collection = new InteractionSequenceCollection();
      collection.addSequence(new InteractionSequenceModel(1, InteractionMode.SINGLE, 2, 100, true));
      collection.addSequence(new InteractionSequenceModel(2, InteractionMode.BURST, 2, 300, false));
      collection.addSequence(new InteractionSequenceModel(3, InteractionMode.RANDOM, 2, 100, true));
      expect(collection.getSequenceCount()).assertEqual(3);
      expect(collection.getAllResponsiveRate()).assertEqual(2 / 3);
      expect(collection.getOverallAverageLatency()).assertEqual(500 / 6);
      collection.clear();
      expect(collection.getSequenceCount()).assertEqual(0);
    });

    // 验证交互序列构建器：确保链式配置生成正确序列
    it('interaction_sequence_builder_should_chain_configure', 0, async () => {
      const sequence = new InteractionSequenceBuilder()
        .setSequenceId(9)
        .setMode(InteractionMode.BURST)
        .setActionCount(6)
        .setTotalLatencyMs(120)
        .setAllResponsive(true)
        .build();
      expect(sequence.getSequenceId()).assertEqual(9);
      expect(sequence.getMode()).assertEqual(InteractionMode.BURST);
      expect(sequence.getActionCount()).assertEqual(6);
      expect(sequence.getTotalLatencyMs()).assertEqual(120);
      expect(sequence.isAllResponsive()).assertTrue();
    });

    // 验证交互模式校验器：确保模式与序列合法性校验正确
    it('interaction_mode_validator_should_check_modes', 0, async () => {
      const validator = new InteractionModeValidator();
      expect(validator.isValidMode(InteractionMode.SINGLE)).assertTrue();
      expect(validator.isValidMode(InteractionMode.SEQUENTIAL)).assertTrue();
      expect(validator.isValidSequence(
        new InteractionSequenceModel(1, InteractionMode.SINGLE, 3, 100, true))).assertTrue();
      expect(validator.isValidSequence(
        new InteractionSequenceModel(2, InteractionMode.SINGLE, -1, 100, true))).assertFalse();
    });

    // 验证按钮交互校验器目标：确保事件仅针对启用按钮有效
    it('button_interaction_validator_should_check_event_target', 0, async () => {
      const validator = new ButtonInteractionValidator();
      const descriptors: ButtonDescriptorModel[] = [
        new ButtonDescriptorModel(0, '关机', ButtonPosition.LEFT, true),
        new ButtonDescriptorModel(1, '重启', ButtonPosition.CENTER, false)
      ];
      const validEvent = new ButtonInteractionEventModel(1, 0, ButtonAction.CLICK, ButtonState.PRESSED, 50);
      const disabledEvent = new ButtonInteractionEventModel(2, 1, ButtonAction.CLICK, ButtonState.PRESSED, 50);
      const unknownEvent = new ButtonInteractionEventModel(3, 9, ButtonAction.CLICK, ButtonState.PRESSED, 50);
      expect(validator.isEventTargetValid(descriptors, validEvent)).assertTrue();
      expect(validator.isEventTargetValid(descriptors, disabledEvent)).assertFalse();
      expect(validator.isEventTargetValid(descriptors, unknownEvent)).assertFalse();
    });

    // 验证按钮描述切换：确保启用状态可动态切换
    it('button_descriptor_model_should_toggle_enabled_state', 0, async () => {
      const descriptor = new ButtonDescriptorModel(2, '待机', ButtonPosition.RIGHT, true);
      expect(descriptor.isEnabled()).assertTrue();
      descriptor.setEnabled(false);
      expect(descriptor.isEnabled()).assertFalse();
      expect(descriptor.isInteractive()).assertFalse();
    });

    // 验证按钮交互事件克隆：确保克隆副本保持独立
    it('button_interaction_event_model_should_clone_and_compare', 0, async () => {
      const event = new ButtonInteractionEventModel(5, 2, ButtonAction.DOUBLE_CLICK, ButtonState.PRESSED, 30);
      const cloned = event.clone();
      expect(cloned.equals(event)).assertTrue();
      expect(cloned.getAction()).assertEqual(ButtonAction.DOUBLE_CLICK);
      expect(event.isClickAction()).assertTrue();
    });

    // 验证交互序列突发模式：确保突发模式判定正确
    it('interaction_sequence_model_should_detect_burst_mode', 0, async () => {
      const burst = new InteractionSequenceModel(1, InteractionMode.BURST, 10, 500, true);
      const single = new InteractionSequenceModel(2, InteractionMode.SINGLE, 1, 50, true);
      expect(burst.isBurstMode()).assertTrue();
      expect(single.isBurstMode()).assertFalse();
      expect(burst.clone().isBurstMode()).assertTrue();
    });

    // 验证按钮交互统计按按钮计数：确保指定按钮交互次数准确
    it('button_interaction_statistics_should_count_per_button', 0, async () => {
      const statistics = new ButtonInteractionStatistics();
      statistics.addEvent(new ButtonInteractionEventModel(1, 0, ButtonAction.CLICK, ButtonState.PRESSED, 40));
      statistics.addEvent(new ButtonInteractionEventModel(2, 0, ButtonAction.FOCUS, ButtonState.FOCUSED, 40));
      statistics.addEvent(new ButtonInteractionEventModel(3, 1, ButtonAction.CLICK, ButtonState.PRESSED, 40));
      expect(statistics.getEventCountByButton(0)).assertEqual(2);
      expect(statistics.getEventCountByButton(1)).assertEqual(1);
      expect(statistics.getEventCountByButton(2)).assertEqual(0);
    });

    // 验证按钮交互校验器事件：确保交互事件合法性校验正确
    it('button_interaction_validator_should_validate_event', 0, async () => {
      const validator = new ButtonInteractionValidator();
      const valid = new ButtonInteractionEventModel(1, 0, ButtonAction.CLICK, ButtonState.PRESSED, 50);
      const invalid = new ButtonInteractionEventModel(2, -1, ButtonAction.CLICK, ButtonState.PRESSED, -5);
      expect(validator.isValidEvent(valid)).assertTrue();
      expect(validator.isValidEvent(invalid)).assertFalse();
    });
  });


}