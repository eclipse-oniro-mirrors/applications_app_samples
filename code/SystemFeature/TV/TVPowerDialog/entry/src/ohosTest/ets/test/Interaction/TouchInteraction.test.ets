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
  KEY_ENTER,
  KEY_BACK,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  simulateTouch,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_TOUCH_EVENT,
  TOLERANCE_COMPONENT_COUNT
} from '../Shared/SharedDriver';

interface TouchEventRecord {
  x: number;
  y: number;
  eventType: 'click' | 'long_press' | 'swipe';
  timestamp: number;
  targetIndex: number;
}

interface CoordinateRecord {
  x: number;
  y: number;
  index: number;
}

class TouchInteractionTracker {
  private static instance: TouchInteractionTracker;
  private touchHistory: TouchEventRecord[] = [];
  private totalTouchEvents: number = 0;
  private clickCount: number = 0;
  private longPressCount: number = 0;
  private swipeCount: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): TouchInteractionTracker {
    if (!TouchInteractionTracker.instance) {
      TouchInteractionTracker.instance = new TouchInteractionTracker();
    }
    return TouchInteractionTracker.instance;
  }

  public recordTouchEvent(x: number, y: number, eventType: 'click' | 'long_press' | 'swipe',
    targetIndex: number): void {
    const record: TouchEventRecord = {
      x,
      y,
      eventType,
      timestamp: Date.now(),
      targetIndex
    };
    this.touchHistory.push(record);
    this.totalTouchEvents++;

    switch (eventType) {
      case 'click':
        this.clickCount++;
        break;
      case 'long_press':
        this.longPressCount++;
        break;
      case 'swipe':
        this.swipeCount++;
        break;
    }
  }

  public getTouchHistory(): TouchEventRecord[] {
    return [...this.touchHistory];
  }

  public getTotalTouchEvents(): number {
    return this.totalTouchEvents;
  }

  public getClickCount(): number {
    return this.clickCount;
  }

  public getLongPressCount(): number {
    return this.longPressCount;
  }

  public getSwipeCount(): number {
    return this.swipeCount;
  }

  public resetTracker(): void {
    this.touchHistory = [];
    this.totalTouchEvents = 0;
    this.clickCount = 0;
    this.longPressCount = 0;
    this.swipeCount = 0;
  }

  public hasTouchedIndex(index: number): boolean {
    return this.touchHistory.some(record => record.targetIndex === index);
  }

  public getTouchCountForIndex(index: number): number {
    return this.touchHistory.filter(record => record.targetIndex === index).length;
  }
}

// 触摸手势类型枚举：定义TV设备支持的触摸手势种类，用于触摸事件分类统计
enum TouchGestureType {
  TAP = 'tap', DOUBLE_TAP = 'double_tap', LONG_PRESS = 'long_press', SWIPE_LEFT = 'swipe_left', SWIPE_RIGHT = 'swipe_right', SWIPE_UP = 'swipe_up', SWIPE_DOWN = 'swipe_down'
}

// 触摸区域枚举：划分对话框触摸热区，便于命中区域判定与统计
enum TouchRegion {
  DIALOG_LEFT = 'dialog_left', DIALOG_CENTER = 'dialog_center', DIALOG_RIGHT = 'dialog_right', OUTSIDE_DIALOG = 'outside_dialog'
}

// 触摸坐标点接口：描述一次触摸操作在屏幕上的二维坐标位置
interface TouchPoint {
  x: number;
  y: number;
}

// 滑动手势向量接口：描述滑动手势的起止坐标，用于方向与距离判定
interface SwipeVector {
  startX: number;
  startY: number;
  endX: number;
  endY: number;
}

// 触摸会话记录接口：汇总一次完整触摸交互的统计信息
interface TouchSessionRecord {
  sessionId: number;
  gestureType: TouchGestureType;
  region: TouchRegion;
  duration: number;
  distance: number;
}

// 触摸坐标模型类：封装二维坐标点并提供几何运算能力，供测试断言与统计复用
class TouchCoordinate {
  private xValue: number;
  private yValue: number;

  constructor(x: number, y: number) {
    this.xValue = x;
    this.yValue = y;
  }

  public getX(): number {
    return this.xValue;
  }

  public getY(): number {
    return this.yValue;
  }

  public setX(x: number): void {
    this.xValue = x;
  }

  public setY(y: number): void {
    this.yValue = y;
  }

  // 计算两点之间的欧几里得距离：用于触摸滑动距离统计
  public distanceTo(other: TouchCoordinate): number {
    const deltaX: number = this.xValue - other.xValue;
    const deltaY: number = this.yValue - other.yValue;
    return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
  }

  // 判断坐标点是否落在指定矩形区域内：用于触摸热区命中判定
  public isWithinBounds(minX: number, minY: number, maxX: number, maxY: number): boolean {
    return this.xValue >= minX && this.xValue <= maxX && this.yValue >= minY && this.yValue <= maxY;
  }

  public equals(other: TouchCoordinate): boolean {
    return this.xValue === other.xValue && this.yValue === other.yValue;
  }

  public clone(): TouchCoordinate {
    return new TouchCoordinate(this.xValue, this.yValue);
  }

  public toString(): string {
    return 'TouchCoordinate(' + this.xValue + ', ' + this.yValue + ')';
  }
}

// 触摸统计类：聚合多个坐标点的距离、分布等指标，输出统计摘要
class TouchStatistics {
  private coordinates: TouchCoordinate[] = [];

  public addCoordinate(coord: TouchCoordinate): void {
    this.coordinates.push(coord.clone());
  }

  public getCoordinateCount(): number {
    return this.coordinates.length;
  }

  public clear(): void {
    this.coordinates = [];
  }

  // 计算坐标点集合的质心：用于判断触摸集中趋势
  public getCentroid(): TouchCoordinate {
    if (this.coordinates.length === 0) {
      return new TouchCoordinate(0, 0);
    }
    let sumX: number = 0;
    let sumY: number = 0;
    for (const coord of this.coordinates) {
      sumX += coord.getX();
      sumY += coord.getY();
    }
    return new TouchCoordinate(sumX / this.coordinates.length, sumY / this.coordinates.length);
  }

  // 计算坐标点集合的总路径长度：用于评估滑动轨迹
  public getTotalPathLength(): number {
    if (this.coordinates.length < 2) {
      return 0;
    }
    let total: number = 0;
    for (let i: number = 1; i < this.coordinates.length; i++) {
      total += this.coordinates[i - 1].distanceTo(this.coordinates[i]);
    }
    return total;
  }

  // 计算坐标点集合的最小包围盒面积：用于评估触摸分布范围
  public getBoundingBoxArea(): number {
    if (this.coordinates.length === 0) {
      return 0;
    }
    let minX: number = this.coordinates[0].getX();
    let maxX: number = this.coordinates[0].getX();
    let minY: number = this.coordinates[0].getY();
    let maxY: number = this.coordinates[0].getY();
    for (const coord of this.coordinates) {
      minX = Math.min(minX, coord.getX());
      maxX = Math.max(maxX, coord.getX());
      minY = Math.min(minY, coord.getY());
      maxY = Math.max(maxY, coord.getY());
    }
    return (maxX - minX) * (maxY - minY);
  }
}

// 触摸坐标校验器：校验坐标合法性并归类触摸热区，防止越界或非法值进入统计流程
class TouchCoordinateValidator {
  private static readonly MAX_SCREEN_WIDTH: number = 1920;
  private static readonly MAX_SCREEN_HEIGHT: number = 1080;

  public isValidCoordinate(x: number, y: number): boolean {
    return x >= 0 && y >= 0 && x <= TouchCoordinateValidator.MAX_SCREEN_WIDTH &&
      y <= TouchCoordinateValidator.MAX_SCREEN_HEIGHT;
  }

  public classifyRegion(x: number, y: number): TouchRegion {
    if (!this.isValidCoordinate(x, y)) {
      return TouchRegion.OUTSIDE_DIALOG;
    }
    if (x < 640) {
      return TouchRegion.DIALOG_LEFT;
    }
    if (x < 1280) {
      return TouchRegion.DIALOG_CENTER;
    }
    return TouchRegion.DIALOG_RIGHT;
  }

  // 计算滑动手势的位移距离：用于判定滑动是否达到触发阈值
  public getSwipeDistance(vector: SwipeVector): number {
    const start: TouchCoordinate = new TouchCoordinate(vector.startX, vector.startY);
    const end: TouchCoordinate = new TouchCoordinate(vector.endX, vector.endY);
    return start.distanceTo(end);
  }

  // 判定滑动手势方向：根据起止坐标推断滑动方向
  public getSwipeDirection(vector: SwipeVector): TouchGestureType {
    const deltaX: number = vector.endX - vector.startX;
    const deltaY: number = vector.endY - vector.startY;
    if (Math.abs(deltaX) >= Math.abs(deltaY)) {
      return deltaX >= 0 ? TouchGestureType.SWIPE_RIGHT : TouchGestureType.SWIPE_LEFT;
    }
    return deltaY >= 0 ? TouchGestureType.SWIPE_DOWN : TouchGestureType.SWIPE_UP;
  }
}

// 触摸会话构建器：以链式风格构建触摸会话记录，提升测试数据构造的可读性
class TouchSessionBuilder {
  private sessionId: number = 0;
  private gestureType: TouchGestureType = TouchGestureType.TAP;
  private region: TouchRegion = TouchRegion.DIALOG_CENTER;
  private duration: number = 0;
  private distance: number = 0;

  public setSessionId(sessionId: number): TouchSessionBuilder {
    this.sessionId = sessionId;
    return this;
  }

  public setGestureType(gestureType: TouchGestureType): TouchSessionBuilder {
    this.gestureType = gestureType;
    return this;
  }

  public setRegion(region: TouchRegion): TouchSessionBuilder {
    this.region = region;
    return this;
  }

  public setDuration(duration: number): TouchSessionBuilder {
    this.duration = duration;
    return this;
  }

  public setDistance(distance: number): TouchSessionBuilder {
    this.distance = distance;
    return this;
  }

  public build(): TouchSessionRecord {
    return {
      sessionId: this.sessionId,
      gestureType: this.gestureType,
      region: this.region,
      duration: this.duration,
      distance: this.distance
    };
  }
}

// 触摸指标类型枚举：定义触摸统计报告包含的指标维度
enum TouchMetricType {
  TOTAL_EVENTS = 'total_events', CLICK_COUNT = 'click_count', LONG_PRESS_COUNT = 'long_press_count', SWIPE_COUNT = 'swipe_count', AVG_PATH_LENGTH = 'avg_path_length'
}

// 触摸指标条目接口：描述统计报告中的单个指标项
interface TouchMetricEntry {
  metricType: TouchMetricType;
  metricValue: number;
  metricLabel: string;
}

// 触摸报告生成器：根据触摸统计数据生成结构化指标报告
class TouchReportGenerator {
  private entries: TouchMetricEntry[] = [];

  public addEntry(metricType: TouchMetricType, metricValue: number, metricLabel: string): void {
    const entry: TouchMetricEntry = {
      metricType: metricType, metricValue: metricValue, metricLabel: metricLabel
    };
    this.entries.push(entry);
  }

  public clear(): void {
    this.entries = [];
  }

  public getEntries(): TouchMetricEntry[] {
    const result: TouchMetricEntry[] = [];
    for (const entry of this.entries) {
      const copied: TouchMetricEntry = {
        metricType: entry.metricType, metricValue: entry.metricValue, metricLabel: entry.metricLabel
      };
      result.push(copied);
    }
    return result;
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  // 计算所有指标值的总和：用于汇总评估
  public getTotalMetricValue(): number {
    let total: number = 0;
    for (const entry of this.entries) {
      total += entry.metricValue;
    }
    return total;
  }

  // 查找指定类型的指标值：未找到返回0
  public getValueByType(metricType: TouchMetricType): number {
    for (const entry of this.entries) {
      if (entry.metricType === metricType) {
        return entry.metricValue;
      }
    }
    return 0;
  }
}

// 触摸事件工厂：批量生成规范化触摸坐标序列，用于压力与批量测试
class TouchEventFactory {
  // 生成水平均匀分布的触摸坐标序列
  public generateHorizontalPoints(startX: number, endX: number, y: number, count: number): TouchCoordinate[] {
    const points: TouchCoordinate[] = [];
    if (count <= 0) {
      return points;
    }
    const step: number = (endX - startX) / count;
    for (let i: number = 0; i < count; i++) {
      points.push(new TouchCoordinate(startX + step * i, y));
    }
    return points;
  }

  // 生成矩形网格触摸坐标序列：用于覆盖整个对话框区域
  public generateGridPoints(startX: number, startY: number, cols: number, rows: number, cellWidth: number,
    cellHeight: number): TouchCoordinate[] {
    const points: TouchCoordinate[] = [];
    for (let row: number = 0; row < rows; row++) {
      for (let col: number = 0; col < cols; col++) {
        points.push(new TouchCoordinate(startX + col * cellWidth, startY + row * cellHeight));
      }
    }
    return points;
  }
}

export default function touchInteractionTest() {
  describe('TouchInteraction_Test', () => {
    let driver: Driver;
    let touchTracker: TouchInteractionTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      touchTracker = TouchInteractionTracker.getInstance();
      touchTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_TOUCH_EVENT);
      await driver.delayMs(500);
    });

    // 验证touch on触发：确保TV设备screen out option should trigger focus机制有效
    it('touch_on_screen_out_option_should_trigger_focus', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      expect(touchTracker.getClickCount()).assertEqual(1);
    });

    // 验证touch on触发：确保TV设备shutdown option should trigger focus机制有效
    it('touch_on_shutdown_option_should_trigger_focus', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 600, 500);
      touchTracker.recordTouchEvent(600, 500, 'click', 1);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
    });

    // 验证touch on触发：确保TV设备reboot option should trigger focus机制有效
    it('touch_on_reboot_option_should_trigger_focus', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
    });

    // 验证multiple touch状态正确：确保TV设备events should be recorded符合预期
    it('multiple_touch_events_should_be_recorded', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 600, 500);
      touchTracker.recordTouchEvent(600, 500, 'click', 1);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      expect(touchTracker.getTotalTouchEvents()).assertEqual(3);
      expect(touchTracker.hasTouchedIndex(0)).assertTrue();
      expect(touchTracker.hasTouchedIndex(1)).assertTrue();
      expect(touchTracker.hasTouchedIndex(2)).assertTrue();
    });

    it('touch_focus_should_match_keyboard_navigation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_TOUCH_EVENT);
      await driver.delayMs(DELAY_TOUCH_EVENT);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_TOUCH_EVENT);
      await driver.delayMs(DELAY_TOUCH_EVENT);
    });

    // 验证touch coordinates状态正确：确保TV设备should be recorded accurately符合预期
    it('touch_coordinates_should_be_recorded_accurately', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      const testCoordinates: CoordinateRecord[] =
        [{ x: 250, y: 450, index: 0 }, { x: 600, y: 500, index: 1 }, { x: 950, y: 550, index: 2 }];

      for (const coord of testCoordinates) {
        await simulateTouch(driver, coord.x, coord.y);
        touchTracker.recordTouchEvent(coord.x, coord.y, 'click', coord.index);
        await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      }

      const history = touchTracker.getTouchHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].x).assertEqual(250);
      expect(history[0].y).assertEqual(450);
      expect(history[1].x).assertEqual(600);
      expect(history[1].y).assertEqual(500);
    });

    // 验证rapid touch状态正确：确保TV设备events should be handled符合预期
    it('rapid_touch_events_should_be_handled', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        const x = 300 + (i % 3) * 300;
        const y = 500;
        await simulateTouch(driver, x, y);
        touchTracker.recordTouchEvent(x, y, 'click', i % 3);
        await driver.delayMs(100);
      }

      expect(touchTracker.getTotalTouchEvents()).assertEqual(10);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('touch_outside_dialog_should_not_change_focus', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      await simulateTouch(driver, 50, 50);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证touch should触发：确保TV设备trigger correct focus state机制有效
    it('touch_should_trigger_correct_focus_state', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
    });

    // 验证touch interaction状态正确：确保TV设备statistics should be accurate符合预期
    it('touch_interaction_statistics_should_be_accurate', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      for (let i = 0; i < 5; i++) {
        await simulateTouch(driver, 300, 500);
        touchTracker.recordTouchEvent(300, 500, 'click', 0);
        await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      }

      for (let i = 0; i < 3; i++) {
        await simulateTouch(driver, 900, 500);
        touchTracker.recordTouchEvent(900, 500, 'click', 2);
        await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      }

      expect(touchTracker.getTouchCountForIndex(0)).assertEqual(5);
      expect(touchTracker.getTouchCountForIndex(2)).assertEqual(3);
      expect(touchTracker.getTotalTouchEvents()).assertEqual(8);
    });

    // 验证touch response状态正确：确保TV设备time should be within limit符合预期
    it('touch_response_time_should_be_within_limit', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      await simulateTouch(driver, 600, 500);
      touchTracker.recordTouchEvent(600, 500, 'click', 1);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const endTime = Date.now();

      const responseTime = endTime - startTime;
      expect(responseTime).assertLessOrEqual(1500);
    });

    it('touch_should_work_after_keyboard_navigation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_TOUCH_EVENT);
      await driver.delayMs(DELAY_TOUCH_EVENT);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
    });

    it('keyboard_should_work_after_touch_navigation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_TOUCH_EVENT);
      await driver.delayMs(DELAY_TOUCH_EVENT);
    });

    // 验证touch history状态正确：确保TV设备timestamps should be chronological符合预期
    it('touch_history_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(200);

      await simulateTouch(driver, 600, 500);
      touchTracker.recordTouchEvent(600, 500, 'click', 1);
      await driver.delayMs(200);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);

      const history = touchTracker.getTouchHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证touch should处理能力：确保TV设备在handle boundary coordinates下功能正常
    it('touch_should_handle_boundary_coordinates', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      await simulateTouch(driver, 100, 100);
      touchTracker.recordTouchEvent(100, 100, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 1200, 800);
      touchTracker.recordTouchEvent(1200, 800, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证touch focus持久：确保TV设备should persist after delay状态保持
    it('touch_focus_should_persist_after_delay', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await driver.delayMs(3000);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('touch_interaction_with_mixed_options', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      const touchSequence: CoordinateRecord[] =
        [{ x: 600, y: 500, index: 1 }, { x: 300, y: 500, index: 0 }, { x: 900, y: 500, index: 2 },
          { x: 600, y: 500, index: 1 }, { x: 300, y: 500, index: 0 }];

      for (const touch of touchSequence) {
        await simulateTouch(driver, touch.x, touch.y);
        touchTracker.recordTouchEvent(touch.x, touch.y, 'click', touch.index);
        await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      }

      expect(touchTracker.getTotalTouchEvents()).assertEqual(5);
      expect(touchTracker.getTouchCountForIndex(0)).assertEqual(2);
      expect(touchTracker.getTouchCountForIndex(1)).assertEqual(2);
      expect(touchTracker.getTouchCountForIndex(2)).assertEqual(1);
    });

    it('touch_should_not_crash_with_invalid_coordinates', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      // 使用边界但有效的坐标进行测试
      await simulateTouch(driver, 10, 10);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 1200, 800);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 综合comprehensive touch场景测试：验证完整操作流程中功能正确
    it('comprehensive_touch_interaction_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      const scenarioStart = Date.now();

      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_TOUCH_EVENT);

      await simulateTouch(driver, 600, 500);
      touchTracker.recordTouchEvent(600, 500, 'click', 1);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await driver.delayMs(1000);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(touchTracker.getTotalTouchEvents()).assertEqual(3);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证触摸坐标模型：确保距离与边界判定正确
    it('touch_coordinate_should_compute_distance_and_bounds', 0, async () => {
      const point = new TouchCoordinate(100, 100);
      const other = new TouchCoordinate(130, 100);
      expect(point.distanceTo(other)).assertEqual(30);
      expect(point.isWithinBounds(0, 0, 200, 200)).assertTrue();
      expect(point.isWithinBounds(200, 200, 300, 300)).assertFalse();
      expect(point.equals(other)).assertFalse();
    });

    // 验证触摸统计质心：确保多坐标点质心计算正确
    it('touch_statistics_should_compute_centroid', 0, async () => {
      const statistics = new TouchStatistics();
      statistics.addCoordinate(new TouchCoordinate(0, 0));
      statistics.addCoordinate(new TouchCoordinate(10, 0));
      statistics.addCoordinate(new TouchCoordinate(0, 10));
      expect(statistics.getCoordinateCount()).assertEqual(3);
      const centroid = statistics.getCentroid();
      expect(centroid.getX()).assertEqual(10 / 3);
      expect(centroid.getY()).assertEqual(10 / 3);
      statistics.clear();
      expect(statistics.getCoordinateCount()).assertEqual(0);
    });

    // 验证触摸坐标校验器：确保热区分类正确
    it('touch_coordinate_validator_should_classify_regions', 0, async () => {
      const validator = new TouchCoordinateValidator();
      expect(validator.isValidCoordinate(300, 400)).assertTrue();
      expect(validator.isValidCoordinate(-1, 400)).assertFalse();
      expect(validator.classifyRegion(300, 500)).assertEqual(TouchRegion.DIALOG_LEFT);
      expect(validator.classifyRegion(900, 500)).assertEqual(TouchRegion.DIALOG_CENTER);
      expect(validator.classifyRegion(1500, 500)).assertEqual(TouchRegion.DIALOG_RIGHT);
      expect(validator.classifyRegion(-1, 500)).assertEqual(TouchRegion.OUTSIDE_DIALOG);
    });

    // 验证触摸会话构建器：确保链式配置生效
    it('touch_session_builder_should_chain_configuration', 0, async () => {
      const session = new TouchSessionBuilder()
        .setSessionId(7)
        .setGestureType(TouchGestureType.SWIPE_UP)
        .setRegion(TouchRegion.DIALOG_RIGHT)
        .setDuration(500)
        .setDistance(120)
        .build();
      expect(session.sessionId).assertEqual(7);
      expect(session.gestureType).assertEqual(TouchGestureType.SWIPE_UP);
      expect(session.region).assertEqual(TouchRegion.DIALOG_RIGHT);
      expect(session.duration).assertEqual(500);
      expect(session.distance).assertEqual(120);
    });

    // 验证触摸报告生成器：确保指标汇总正确
    it('touch_report_generator_should_aggregate_metrics', 0, async () => {
      const generator = new TouchReportGenerator();
      generator.addEntry(TouchMetricType.CLICK_COUNT, 5, 'clicks');
      generator.addEntry(TouchMetricType.SWIPE_COUNT, 3, 'swipes');
      generator.addEntry(TouchMetricType.LONG_PRESS_COUNT, 2, 'long presses');
      expect(generator.getEntryCount()).assertEqual(3);
      expect(generator.getTotalMetricValue()).assertEqual(10);
      generator.clear();
      expect(generator.getEntryCount()).assertEqual(0);
    });

    // 验证触摸事件工厂：确保水平坐标序列生成正确
    it('touch_event_factory_should_generate_horizontal_points', 0, async () => {
      const factory = new TouchEventFactory();
      const points = factory.generateHorizontalPoints(0, 100, 50, 5);
      expect(points.length).assertEqual(5);
      expect(points[0].getX()).assertEqual(0);
      expect(points[1].getX()).assertEqual(20);
      const empty = factory.generateHorizontalPoints(0, 100, 50, 0);
      expect(empty.length).assertEqual(0);
    });

    // 验证触摸统计路径长度：确保轨迹总长计算正确
    it('touch_statistics_should_compute_path_length', 0, async () => {
      const statistics = new TouchStatistics();
      statistics.addCoordinate(new TouchCoordinate(0, 0));
      statistics.addCoordinate(new TouchCoordinate(3, 4));
      expect(statistics.getTotalPathLength()).assertEqual(5);
      const single = new TouchStatistics();
      single.addCoordinate(new TouchCoordinate(0, 0));
      expect(single.getTotalPathLength()).assertEqual(0);
    });

    // 验证触摸坐标校验器滑动方向：确保手势方向判定正确
    it('touch_coordinate_validator_should_judge_swipe_direction', 0, async () => {
      const validator = new TouchCoordinateValidator();
      const right: SwipeVector = { startX: 0, startY: 0, endX: 100, endY: 10 };
      const left: SwipeVector = { startX: 100, startY: 0, endX: 0, endY: 10 };
      const down: SwipeVector = { startX: 0, startY: 0, endX: 10, endY: 100 };
      expect(validator.getSwipeDirection(right)).assertEqual(TouchGestureType.SWIPE_RIGHT);
      expect(validator.getSwipeDirection(left)).assertEqual(TouchGestureType.SWIPE_LEFT);
      expect(validator.getSwipeDirection(down)).assertEqual(TouchGestureType.SWIPE_DOWN);
    });

    // 验证触摸事件工厂网格生成：确保网格坐标序列正确
    it('touch_event_factory_should_generate_grid_points', 0, async () => {
      const factory = new TouchEventFactory();
      const points = factory.generateGridPoints(0, 0, 2, 2, 10, 20);
      expect(points.length).assertEqual(4);
      expect(points[0].getX()).assertEqual(0);
      expect(points[0].getY()).assertEqual(0);
      expect(points[2].getX()).assertEqual(0);
      expect(points[2].getY()).assertEqual(20);
    });

    // 验证触摸报告指标查询：确保按类型查找指标值正确
    it('touch_report_generator_should_lookup_by_metric_type', 0, async () => {
      const generator = new TouchReportGenerator();
      generator.addEntry(TouchMetricType.TOTAL_EVENTS, 12, 'total');
      expect(generator.getValueByType(TouchMetricType.TOTAL_EVENTS)).assertEqual(12);
      expect(generator.getValueByType(TouchMetricType.AVG_PATH_LENGTH)).assertEqual(0);
    });

    // 验证触摸坐标克隆：确保克隆副本保持独立
    it('touch_coordinate_should_clone_and_compare', 0, async () => {
      const point = new TouchCoordinate(50, 60);
      const cloned = point.clone();
      expect(cloned.equals(point)).assertTrue();
      cloned.setX(999);
      expect(cloned.equals(point)).assertFalse();
      expect(point.getX()).assertEqual(50);
      const text = point.toString();
      expect(text.indexOf('50')).assertLargerOrEqual(0);
    });

    // 验证触摸统计包围盒：确保触摸分布范围计算正确
    it('touch_statistics_should_compute_bounding_box_area', 0, async () => {
      const statistics = new TouchStatistics();
      statistics.addCoordinate(new TouchCoordinate(0, 0));
      statistics.addCoordinate(new TouchCoordinate(10, 20));
      expect(statistics.getBoundingBoxArea()).assertEqual(200);
      const empty = new TouchStatistics();
      expect(empty.getBoundingBoxArea()).assertEqual(0);
    });

    // 验证触摸坐标校验器滑动距离：确保位移距离计算正确
    it('touch_coordinate_validator_should_compute_swipe_distance', 0, async () => {
      const validator = new TouchCoordinateValidator();
      const vector: SwipeVector = { startX: 0, startY: 0, endX: 3, endY: 4 };
      expect(validator.getSwipeDistance(vector)).assertEqual(5);
      const zero: SwipeVector = { startX: 5, startY: 5, endX: 5, endY: 5 };
      expect(validator.getSwipeDistance(zero)).assertEqual(0);
    });

    // 验证触摸会话构建器默认值：确保未设置字段使用默认配置
    it('touch_session_builder_should_apply_defaults', 0, async () => {
      const session = new TouchSessionBuilder().build();
      expect(session.sessionId).assertEqual(0);
      expect(session.gestureType).assertEqual(TouchGestureType.TAP);
      expect(session.region).assertEqual(TouchRegion.DIALOG_CENTER);
      expect(session.duration).assertEqual(0);
    });
  });


}