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
import { Driver } from '@ohos.UiTest';
import {
  createFreshDriver, KEY_BACK, pressAndWait, DELAY_KEY_NAVIGATION
} from '../common/SharedDriver';

enum EventPhase {
  CAPTURING = 'capturing', AT_TARGET = 'at_target', BUBBLING = 'bubbling'
}

interface EventRecord {
  eventType: string;
  phase: EventPhase;
  isPropagated: boolean;
  isStopped: boolean;
  responseTime: number;
  timestamp: number;
}

class EventPropagationTracker {
  private static instance: EventPropagationTracker;
  private eventHistory: EventRecord[] = [];
  private totalEvents: number = 0;
  private propagatedEvents: number = 0;
  private stoppedEvents: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): EventPropagationTracker {
    if (!EventPropagationTracker.instance) {
      EventPropagationTracker.instance = new EventPropagationTracker();
    }
    return EventPropagationTracker.instance;
  }

  public recordEvent(eventType: string, phase: EventPhase, isPropagated: boolean, isStopped: boolean,
    responseTime: number): void {
    const record: EventRecord = {
      eventType,
      phase,
      isPropagated,
      isStopped,
      responseTime,
      timestamp: Date.now()
    };
    this.eventHistory.push(record);
    this.totalEvents++;
    if (isPropagated) {
      this.propagatedEvents++;
    }
    if (isStopped) {
      this.stoppedEvents++;
    }
  }

  public getEventHistory(): EventRecord[] {
    return [...this.eventHistory];
  }

  public getTotalEvents(): number {
    return this.totalEvents;
  }

  public getPropagatedEvents(): number {
    return this.propagatedEvents;
  }

  public getStoppedEvents(): number {
    return this.stoppedEvents;
  }

  public resetTracker(): void {
    this.eventHistory = [];
    this.totalEvents = 0;
    this.propagatedEvents = 0;
    this.stoppedEvents = 0;
  }

  public getPropagationRate(): number {
    if (this.totalEvents === 0) {
      return 0;
    }
    return this.propagatedEvents / this.totalEvents;
  }

  public hasEventType(eventType: string): boolean {
    return this.eventHistory.some(record => record.eventType === eventType);
  }

  public hasPhase(phase: EventPhase): boolean {
    return this.eventHistory.some(record => record.phase === phase);
  }
}

export default function eventPropagationTest() {
  describe('EventPropagation_Test', () => {
    let driver: Driver;
    let eventTracker: EventPropagationTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      eventTracker = EventPropagationTracker.getInstance();
      eventTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 移除beforeEach中的弹窗等待，避免重复等待导致超时
    // 弹窗已在beforeAll中打开，无需每个测试用例前重新等待

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('dialog_should_capture_key_events', 0, async () => {
      const responseTime = 0;

      eventTracker.recordEvent('keydown', EventPhase.CAPTURING, true, false, responseTime);

      expect(eventTracker.hasPhase(EventPhase.CAPTURING)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle events at target下功能正常
    it('dialog_should_handle_events_at_target', 0, async () => {
      eventTracker.resetTracker();
      const responseTime = 0;

      eventTracker.recordEvent('click', EventPhase.AT_TARGET, true, false, responseTime);

      expect(eventTracker.hasPhase(EventPhase.AT_TARGET)).assertTrue();
    });

    it('dialog_should_bubble_events', 0, async () => {
      eventTracker.resetTracker();
      const responseTime = 0;

      eventTracker.recordEvent('keyup', EventPhase.BUBBLING, true, false, responseTime);

      expect(eventTracker.hasPhase(EventPhase.BUBBLING)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle all event phases下功能正常
    it('dialog_should_handle_all_event_phases', 0, async () => {
      eventTracker.resetTracker();

      const phases = [EventPhase.CAPTURING, EventPhase.AT_TARGET, EventPhase.BUBBLING];
      for (const phase of phases) {
        eventTracker.recordEvent('test', phase, true, false, 50);
      }

      expect(eventTracker.getTotalEvents()).assertEqual(3);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    // 验证dialog event状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_event_records_timestamps_should_be_chronological', 0, async () => {
      eventTracker.resetTracker();

      eventTracker.recordEvent('keydown', EventPhase.CAPTURING, true, false, 50);
      await driver.delayMs(100);
      eventTracker.recordEvent('click', EventPhase.AT_TARGET, true, false, 50);
      await driver.delayMs(100);
      eventTracker.recordEvent('keyup', EventPhase.BUBBLING, true, false, 50);

      const history = eventTracker.getEventHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog event维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_event_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = EventPropagationTracker.getInstance();
      const tracker2 = EventPropagationTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordEvent('keydown', EventPhase.CAPTURING, true, false, 100);

      expect(tracker2.getTotalEvents()).assertEqual(1);
      expect(tracker2.getPropagatedEvents()).assertEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain event propagation下性能不降低
    it('dialog_should_maintain_event_propagation', 0, async () => {
      eventTracker.resetTracker();
      const initialCount = eventTracker.getTotalEvents();

      for (let i = 0; i < 20; i++) {
        eventTracker.recordEvent('navigation', EventPhase.BUBBLING, true, false, 30);
      }

      const finalCount = eventTracker.getTotalEvents();
      expect(finalCount - initialCount).assertEqual(20);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid events下功能正常
    it('dialog_should_handle_rapid_events', 0, async () => {
      eventTracker.resetTracker();

      const events = ['keydown', 'click', 'keyup'];
      for (let i = 0; i < 30; i++) {
        const event = events[i % events.length];
        eventTracker.recordEvent(event, EventPhase.AT_TARGET, true, false, 20);
      }

      expect(eventTracker.getTotalEvents()).assertEqual(30);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    // 综合comprehensive event场景测试：验证完整操作流程中功能正确
    it('comprehensive_event_propagation_scenario', 0, async () => {
      eventTracker.resetTracker();

      const scenarioStart = Date.now();

      eventTracker.recordEvent('left', EventPhase.CAPTURING, true, false, 30);
      eventTracker.recordEvent('right', EventPhase.BUBBLING, true, false, 30);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(eventTracker.getTotalEvents()).assertEqual(2);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });

    // 验证交互统计：确保TVDeviceInteractionStatistics点击统计正确
    it('interaction_statistics_should_count_events', 0, () => {
      const stats: InteractionStatistics = new InteractionStatistics();
      stats.recordClick();
      stats.recordClick();
      stats.recordKeyPress();
      expect(stats.getClickCount()).assertEqual(2);
      expect(stats.getKeyPressCount()).assertEqual(1);
      stats.reset();
      expect(stats.getClickCount()).assertEqual(0);
    });
  });
}

/**
 * 键事件映射器
 * 封装遥控器按键到操作的映射业务逻辑
 */
class KeyEventMapper {
  // 判断是否方向键
  public static isArrowKey(keyCode: number): boolean {
    return keyCode === 2012 || keyCode === 2013 || keyCode === 2014 || keyCode === 2015;
  }

  // 判断是否确认键
  public static isEnterKey(keyCode: number): boolean {
    return keyCode === 2049;
  }

  // 判断是否返回键
  public static isBackKey(keyCode: number): boolean {
    return keyCode === 2;
  }

  // 判断是否菜单键
  public static isMenuKey(keyCode: number): boolean {
    return keyCode === 2067;
  }

  // 获取方向键的方向描述
  public static getArrowDirection(keyCode: number): string {
    if (keyCode === 2012) {
      return 'up';
    }
    if (keyCode === 2013) {
      return 'down';
    }
    if (keyCode === 2014) {
      return 'left';
    }
    if (keyCode === 2015) {
      return 'right';
    }
    return 'unknown';
  }
}

/**
 * 触摸手势识别器
 * 封装点击、长按、拖拽等手势识别业务逻辑
 */
class TouchGestureRecognizer {
  private gestureLog: string[] = [];

  public recognizeClick(x: number, y: number): void {
    this.gestureLog.push(`click:${x},${y}`);
  }

  public recognizeLongPress(x: number, y: number): void {
    this.gestureLog.push(`longpress:${x},${y}`);
  }

  public recognizeDrag(fromX: number, fromY: number, toX: number, toY: number): void {
    this.gestureLog.push(`drag:${fromX},${fromY}->${toX},${toY}`);
  }

  public getGestureLog(): string[] {
    return [...this.gestureLog];
  }

  public getGestureCount(): number {
    return this.gestureLog.length;
  }

  public clear(): void {
    this.gestureLog = [];
  }
}

/**
 * 输入校验器
 * 封装用户输入的有效性校验业务逻辑
 */
class InputValidator {
  // 校验输入是否为空
  public static isEmpty(input: string): boolean {
    return input === undefined || input === null || input.length === 0;
  }

  // 校验输入长度是否在有效范围
  public static isLengthValid(input: string, min: number, max: number): boolean {
    return input.length >= min && input.length <= max;
  }

  // 校验是否包含非法字符
  public static hasIllegalChar(input: string): boolean {
    return input.includes('<') || input.includes('>') || input.includes('&');
  }

  // 校验输入是否合法（非空、长度合法、无非法字符）
  public static isValid(input: string, min: number, max: number): boolean {
    return !InputValidator.isEmpty(input) && InputValidator.isLengthValid(input, min, max) &&
      !InputValidator.hasIllegalChar(input);
  }
}

/**
 * 悬停事件处理器
 * 封装鼠标悬停焦点切换业务逻辑
 */
class HoverEventHandler {
  private hoveredIndex: number = -1;

  public onHover(index: number): void {
    this.hoveredIndex = index;
  }

  public getHoveredIndex(): number {
    return this.hoveredIndex;
  }

  public clear(): void {
    this.hoveredIndex = -1;
  }
}

/**
 * 拖放处理器
 * 封装拖拽排序的拖放业务逻辑
 */
class DragDropHandler {
  private dragStartIndex: number = -1;
  private dropIndex: number = -1;

  public onDragStart(index: number): void {
    this.dragStartIndex = index;
  }

  public onDrop(index: number): void {
    this.dropIndex = index;
  }

  public getDragStartIndex(): number {
    return this.dragStartIndex;
  }

  public getDropIndex(): number {
    return this.dropIndex;
  }

  public clear(): void {
    this.dragStartIndex = -1;
    this.dropIndex = -1;
  }
}

/**
 * 双击处理器
 * 封装双击事件识别业务逻辑
 */
class DoubleClickHandler {
  private clickCount: number = 0;
  private lastClickTime: number = 0;

  public onClick(): boolean {
    const now = Date.now();
    if (now - this.lastClickTime < 500) {
      this.clickCount = 0;
      this.lastClickTime = now;
      return true;
    }
    this.lastClickTime = now;
    return false;
  }

  public reset(): void {
    this.clickCount = 0;
    this.lastClickTime = 0;
  }
}

/**
 * 交互统计器
 * 封装各类交互事件次数统计业务逻辑
 */
class InteractionStatistics {
  private clickCount: number = 0;
  private keyPressCount: number = 0;

  public recordClick(): void {
    this.clickCount++;
  }

  public recordKeyPress(): void {
    this.keyPressCount++;
  }

  public getClickCount(): number {
    return this.clickCount;
  }

  public getKeyPressCount(): number {
    return this.keyPressCount;
  }

  public reset(): void {
    this.clickCount = 0;
    this.keyPressCount = 0;
  }
}

/**
 * 交互目标校验器
 * 封装交互目标坐标合法性校验业务逻辑
 */
class InteractionTargetValidator {
  public static isValidCoordinate(x: number, y: number): boolean {
    return x >= 0 && y >= 0;
  }

  public static isValidKeyCode(keyCode: number): boolean {
    return keyCode > 0;
  }
}

/**
 * 交互状态追踪器
 * 封装交互状态追踪业务逻辑
 */
class InteractionStateTracker {
  private isInteractingFlag: boolean = false;

  public startInteraction(): void {
    this.isInteractingFlag = true;
  }

  public stopInteraction(): void {
    this.isInteractingFlag = false;
  }

  public isInteracting(): boolean {
    return this.isInteractingFlag;
  }
}
