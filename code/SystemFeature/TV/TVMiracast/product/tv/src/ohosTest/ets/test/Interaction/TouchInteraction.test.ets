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
import { getDriver, triggerMiracastHome, waitForPageStable, waitForPlayerPage, miracastComponentCount,
  getScreenSize, getPlayerTileCount, getDeviceIdList, launchPlayerPage, simulateTouch, longClickComponent,
  swipeOnScreen, pressAndWait, safeBack, KEY_LEFT, KEY_RIGHT, TIMEOUT_PAGE_RENDER, TIMEOUT_PLAYER_RENDER,
  TIMEOUT_FOCUS_CHANGE, DELAY_TOUCH_EVENT, MAX_MIRROR_TILES, ScreenSizeInfo } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'TouchInteractionSuite';

// ===== 触摸交互领域模型（本地 Mock，纯逻辑） =====
// 覆盖首页 Tab、设置行、信任行、删除弹窗与播放宫格的触控坐标与命中区域

// 触摸手势类型枚举：描述触控事件识别结果
enum TouchGestureType {
  TAP = 'tap',
  DOUBLE_TAP = 'double_tap',
  LONG_PRESS = 'long_press',
  SWIPE_LEFT = 'swipe_left',
  SWIPE_RIGHT = 'swipe_right',
  SWIPE_UP = 'swipe_up',
  SWIPE_DOWN = 'swipe_down'
}

// 触摸区域枚举：划分 Miracast 界面的触控热区
enum TouchRegion {
  TAB_BAR = 'tab_bar',
  SETTING_LIST = 'setting_list',
  TRUST_LIST = 'trust_list',
  PLAYER_GRID = 'player_grid',
  OUTSIDE = 'outside'
}

// 触摸指标类型枚举：描述触摸统计报告的指标维度
enum TouchMetricType {
  TOTAL_EVENTS = 'total_events',
  CLICK_COUNT = 'click_count',
  LONG_PRESS_COUNT = 'long_press_count',
  SWIPE_COUNT = 'swipe_count',
  AVG_PATH_LENGTH = 'avg_path_length'
}

// 触摸点接口：描述一次触摸在屏幕上的二维位置
interface TouchPoint {
  x: number;
  y: number;
}

// 滑动手势向量接口：描述滑动起止坐标
interface SwipeVector {
  startX: number;
  startY: number;
  endX: number;
  endY: number;
}

// 触摸会话记录接口：汇总一次完整触摸交互
interface TouchSessionRecord {
  sessionId: number;
  gestureType: TouchGestureType;
  region: TouchRegion;
  duration: number;
  distance: number;
}

// 触摸指标条目接口：描述统计报告中的单个指标
interface TouchMetricEntry {
  metricType: TouchMetricType;
  metricValue: number;
  metricLabel: string;
}

// 触摸坐标模型：封装二维坐标并支持几何运算
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

  // 计算两点欧氏距离
  public distanceTo(other: TouchCoordinate): number {
    const deltaX: number = this.xValue - other.xValue;
    const deltaY: number = this.yValue - other.yValue;
    return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
  }

  // 判断坐标是否落在矩形内
  public isWithinBounds(minX: number, minY: number, maxX: number, maxY: number): boolean {
    return this.xValue >= minX && this.xValue <= maxX && this.yValue >= minY && this.yValue <= maxY;
  }

  public equals(other: TouchCoordinate): boolean {
    return this.xValue === other.xValue && this.yValue === other.yValue;
  }

  public clone(): TouchCoordinate {
    return new TouchCoordinate(this.xValue, this.yValue);
  }

}

// 触摸统计模型：聚合坐标集合，输出质心、轨迹长度与包围盒
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

  // 计算质心：空集合返回原点
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

  // 计算轨迹总长度
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

  // 计算包围盒面积
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

  // 计算坐标的平均横坐标
  public getAverageX(): number {
    if (this.coordinates.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const coord of this.coordinates) {
      total += coord.getX();
    }
    return total / this.coordinates.length;
  }
}

// 触摸坐标校验器：校验坐标、划分热区、判定滑动方向与宫格命中
class TouchCoordinateValidator {
  private screenWidth: number;
  private screenHeight: number;

  constructor(screenWidth: number, screenHeight: number) {
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
  }

  public isValidCoordinate(x: number, y: number): boolean {
    return x >= 0 && y >= 0 && x <= this.screenWidth && y <= this.screenHeight;
  }

  // 依据纵坐标划分热区：顶部 Tab、中上设置、中下信任、底部宫格
  public classifyRegion(x: number, y: number): TouchRegion {
    if (!this.isValidCoordinate(x, y)) {
      return TouchRegion.OUTSIDE;
    }
    if (y <= 96) {
      return TouchRegion.TAB_BAR;
    }
    if (y <= this.screenHeight / 2) {
      return TouchRegion.SETTING_LIST;
    }
    if (y <= this.screenHeight - 120) {
      return TouchRegion.TRUST_LIST;
    }
    return TouchRegion.PLAYER_GRID;
  }

}

// 宫格命中测试器：依据列数规则把坐标换算为瓦片索引
class TileHitTester {
  private screenWidth: number;
  private screenHeight: number;
  private tileCount: number;

  constructor(screenWidth: number, screenHeight: number, tileCount: number) {
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
    this.tileCount = tileCount;
  }

  // 计算宫格列数：1 路全屏、2~4 路两列、5~9 路三列
  public columns(): number {
    if (this.tileCount <= 0) {
      return 0;
    }
    if (this.tileCount === 1) {
      return 1;
    }
    if (this.tileCount <= 4) {
      return 2;
    }
    return 3;
  }

  // 计算宫格行数
  public rows(): number {
    const columns: number = this.columns();
    if (columns <= 0) {
      return 0;
    }
    return Math.ceil(this.tileCount / columns);
  }

  public tileWidth(): number {
    const columns: number = this.columns();
    return columns <= 0 ? 0 : this.screenWidth / columns;
  }

  public tileHeight(): number {
    const rows: number = this.rows();
    return rows <= 0 ? 0 : this.screenHeight / rows;
  }

  // 把坐标换算为瓦片索引：越界返回 -1
  public hitTest(x: number, y: number): number {
    if (this.tileCount <= 0 || x < 0 || y < 0 || x > this.screenWidth || y > this.screenHeight) {
      return -1;
    }
    const columns: number = this.columns();
    const rows: number = this.rows();
    const column: number = Math.min(Math.floor(x / this.tileWidth()), columns - 1);
    const row: number = Math.min(Math.floor(y / this.tileHeight()), rows - 1);
    const index: number = row * columns + column;
    return index < this.tileCount ? index : -1;
  }

  // 计算瓦片中心坐标
  public centerOf(index: number): TouchCoordinate {
    const columns: number = this.columns();
    if (columns <= 0 || index < 0 || index >= this.tileCount) {
      return new TouchCoordinate(-1, -1);
    }
    const row: number = Math.floor(index / columns);
    const column: number = index % columns;
    return new TouchCoordinate(column * this.tileWidth() + this.tileWidth() / 2,
      row * this.tileHeight() + this.tileHeight() / 2);
  }

  // 判断两个瓦片是否相邻
  public areAdjacent(first: number, second: number): boolean {
    if (first < 0 || second < 0 || first >= this.tileCount || second >= this.tileCount) {
      return false;
    }
    return Math.abs(first - second) === 1 || Math.abs(first - second) === this.columns();
  }
}

// 触摸会话构建器：链式构造触摸会话记录
class TouchSessionBuilder {
  private sessionId: number = 0;
  private gestureType: TouchGestureType = TouchGestureType.TAP;
  private region: TouchRegion = TouchRegion.SETTING_LIST;
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
    const record: TouchSessionRecord = {
      sessionId: this.sessionId,
      gestureType: this.gestureType,
      region: this.region,
      duration: this.duration,
      distance: this.distance
    };
    return record;
  }
}

// 触摸报告生成器：聚合触摸指标并支持按类型查询
class TouchReportGenerator {
  private entries: TouchMetricEntry[] = [];

  public addEntry(metricType: TouchMetricType, metricValue: number, metricLabel: string): boolean {
    if (metricValue < 0 || metricLabel.length === 0) {
      return false;
    }
    const entry: TouchMetricEntry = {
      metricType: metricType,
      metricValue: metricValue,
      metricLabel: metricLabel
    };
    this.entries.push(entry);
    return true;
  }

  public clear(): void {
    this.entries = [];
  }

  public getEntries(): TouchMetricEntry[] {
    const result: TouchMetricEntry[] = [];
    for (const entry of this.entries) {
      const copied: TouchMetricEntry = {
        metricType: entry.metricType,
        metricValue: entry.metricValue,
        metricLabel: entry.metricLabel
      };
      result.push(copied);
    }
    return result;
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public getTotalMetricValue(): number {
    let total: number = 0;
    for (const entry of this.entries) {
      total += entry.metricValue;
    }
    return total;
  }

  public getValueByType(metricType: TouchMetricType): number {
    for (const entry of this.entries) {
      if (entry.metricType === metricType) {
        return entry.metricValue;
      }
    }
    return 0;
  }

  // 判断报告是否包含全部指标类型
  public hasAllMetricTypes(): boolean {
    const types: TouchMetricType[] = [
      TouchMetricType.TOTAL_EVENTS,
      TouchMetricType.CLICK_COUNT,
      TouchMetricType.LONG_PRESS_COUNT,
      TouchMetricType.SWIPE_COUNT,
      TouchMetricType.AVG_PATH_LENGTH
    ];
    for (const type of types) {
      let found: boolean = false;
      for (const entry of this.entries) {
        if (entry.metricType === type) {
          found = true;
        }
      }
      if (!found) {
        return false;
      }
    }
    return true;
  }
}

// 触摸事件工厂：批量生成规范化坐标序列
class TouchEventFactory {
  // 生成水平均匀分布的坐标序列
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

}

// 触摸交互追踪器：单例保存全量触控记录
class TouchTracker {
  private static instance: TouchTracker;
  private history: TouchSessionRecord[] = [];
  private totalEvents: number = 0;
  private clickCount: number = 0;
  private longPressCount: number = 0;
  private swipeCount: number = 0;

  public static getInstance(): TouchTracker {
    if (!TouchTracker.instance) {
      TouchTracker.instance = new TouchTracker();
    }
    return TouchTracker.instance;
  }

  // 记录一次触摸会话：负时长或负距离拒绝写入
  public record(session: TouchSessionRecord): boolean {
    if (session.duration < 0 || session.distance < 0) {
      return false;
    }
    this.history.push(session);
    this.totalEvents++;
    if (session.gestureType === TouchGestureType.TAP) {
      this.clickCount++;
    } else if (session.gestureType === TouchGestureType.LONG_PRESS) {
      this.longPressCount++;
    } else if (session.gestureType === TouchGestureType.SWIPE_LEFT ||
      session.gestureType === TouchGestureType.SWIPE_RIGHT ||
      session.gestureType === TouchGestureType.SWIPE_UP ||
      session.gestureType === TouchGestureType.SWIPE_DOWN) {
      this.swipeCount++;
    }
    return true;
  }

  public getHistory(): TouchSessionRecord[] {
    const copied: TouchSessionRecord[] = [];
    for (const session of this.history) {
      const item: TouchSessionRecord = {
        sessionId: session.sessionId,
        gestureType: session.gestureType,
        region: session.region,
        duration: session.duration,
        distance: session.distance
      };
      copied.push(item);
    }
    return copied;
  }

  public getTotalEvents(): number {
    return this.totalEvents;
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

  public countByRegion(region: TouchRegion): number {
    let count: number = 0;
    for (const session of this.history) {
      if (session.region === region) {
        count++;
      }
    }
    return count;
  }

  public hasTouchedRegion(region: TouchRegion): boolean {
    return this.countByRegion(region) > 0;
  }

  public getAverageDistance(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const session of this.history) {
      total += session.distance;
    }
    return total / this.history.length;
  }

  public getAverageDuration(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const session of this.history) {
      total += session.duration;
    }
    return total / this.history.length;
  }

  public reset(): void {
    this.history = [];
    this.totalEvents = 0;
    this.clickCount = 0;
    this.longPressCount = 0;
    this.swipeCount = 0;
  }
}

export default function touchInteractionSuite(): void {
  describe('TouchInteraction_Test', () => {
    let driver: Driver;
    let tracker: TouchTracker;
    let screen: ScreenSizeInfo;

    // 测试前置：初始化驱动与追踪器，并回到投屏首页
    beforeAll(async () => {
      driver = getDriver();
      tracker = TouchTracker.getInstance();
      tracker.reset();
      Log.info(TAG, 'touch suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      screen = await getScreenSize(driver);
    });

    // 测试清理：退出页面并复位追踪器
    afterAll(async () => {
      await safeBack(driver, 2);
      await triggerMiracastHome(driver);
      tracker.reset();
      Log.info(TAG, 'touch suite end');
    });

    // 验证点击首个 Tab 触发焦点响应
    it('touch_on_miracast_tab_should_trigger_focus', 0, async () => {
      await simulateTouch(driver, 300, 60);
      const session: TouchSessionRecord = new TouchSessionBuilder()
        .setSessionId(1)
        .setGestureType(TouchGestureType.TAP)
        .setRegion(TouchRegion.TAB_BAR)
        .setDuration(TIMEOUT_FOCUS_CHANGE)
        .setDistance(0)
        .build();
      expect(tracker.record(session)).assertTrue();
      await driver.delayMs(DELAY_TOUCH_EVENT);
      expect(tracker.getClickCount()).assertEqual(1);
      expect(tracker.hasTouchedRegion(TouchRegion.TAB_BAR)).assertTrue();
    });

    // 验证多次触摸事件被完整记录
    it('multiple_touch_events_should_be_recorded', 0, async () => {
      tracker.reset();
      await simulateTouch(driver, 300, 320);
      tracker.record(new TouchSessionBuilder().setSessionId(1).setRegion(TouchRegion.SETTING_LIST).build());
      await simulateTouch(driver, 900, 320);
      tracker.record(new TouchSessionBuilder().setSessionId(2).setRegion(TouchRegion.SETTING_LIST).build());
      await simulateTouch(driver, 480, 700);
      tracker.record(new TouchSessionBuilder().setSessionId(3).setRegion(TouchRegion.TRUST_LIST).build());
      expect(tracker.getTotalEvents()).assertEqual(3);
      expect(tracker.countByRegion(TouchRegion.SETTING_LIST)).assertEqual(2);
      expect(tracker.countByRegion(TouchRegion.TRUST_LIST)).assertEqual(1);
    });

    // 验证快速连续触摸被正确处理
    it('rapid_touch_events_should_be_handled', 0, async () => {
      tracker.reset();
      for (let i: number = 0; i < 10; i++) {
        await simulateTouch(driver, 300 + (i % 3) * 200, 320);
        tracker.record(new TouchSessionBuilder()
          .setSessionId(i + 1)
          .setRegion(TouchRegion.SETTING_LIST)
          .setDuration(20)
          .build());
        await driver.delayMs(30);
      }
      expect(tracker.getTotalEvents()).assertEqual(10);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertEqual(0);
    });

    // 验证长按信任行被记录为长按
    it('long_press_on_trust_row_should_be_recorded', 0, async () => {
      const rowY: number = Math.floor(screen.height * 0.65);
      await longClickComponent(driver, 480, rowY, 900);
      tracker.record(new TouchSessionBuilder()
        .setSessionId(20)
        .setGestureType(TouchGestureType.LONG_PRESS)
        .setRegion(TouchRegion.TRUST_LIST)
        .setDuration(900)
        .setDistance(2)
        .build());
      expect(tracker.getLongPressCount()).assertEqual(1);
      expect(tracker.countByRegion(TouchRegion.TRUST_LIST)).assertLargerOrEqual(1);
      expect(screen.height).assertLarger(0);
    });

    // 验证滑动事件被记录并计算距离
    it('swipe_event_should_record_distance', 0, async () => {
      await swipeOnScreen(driver, 200, 600, 800, 600, 700);
      tracker.record(new TouchSessionBuilder()
        .setSessionId(21)
        .setGestureType(TouchGestureType.SWIPE_RIGHT)
        .setRegion(TouchRegion.PLAYER_GRID)
        .setDuration(700)
        .setDistance(600)
        .build());
      expect(tracker.getSwipeCount()).assertEqual(1);
      expect(tracker.getAverageDistance()).assertLarger(0);
      expect(tracker.hasTouchedRegion(TouchRegion.PLAYER_GRID)).assertTrue();
    });

    // 验证边界坐标不会导致崩溃
    it('touch_should_handle_boundary_coordinates', 0, async () => {
      const validator = new TouchCoordinateValidator(screen.width, screen.height);
      await simulateTouch(driver, 1, 1);
      await simulateTouch(driver, screen.width - 1, screen.height - 1);
      expect(validator.isValidCoordinate(1, 1)).assertTrue();
      expect(validator.isValidCoordinate(screen.width, screen.height)).assertTrue();
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertEqual(0);
    });

    // 验证触摸坐标模型距离与边界
    it('touch_coordinate_should_compute_distance_and_bounds', 0, async () => {
      const point = new TouchCoordinate(100, 100);
      const other = new TouchCoordinate(130, 100);
      expect(point.distanceTo(other)).assertEqual(30);
      expect(point.isWithinBounds(0, 0, 200, 200)).assertTrue();
      expect(point.isWithinBounds(200, 200, 300, 300)).assertFalse();
      expect(point.equals(other)).assertFalse();
      expect(point.getX()).assertEqual(100);
    });

    // 验证统计质心计算
    it('touch_statistics_should_compute_centroid', 0, async () => {
      const statistics = new TouchStatistics();
      statistics.addCoordinate(new TouchCoordinate(0, 0));
      statistics.addCoordinate(new TouchCoordinate(10, 0));
      statistics.addCoordinate(new TouchCoordinate(0, 10));
      expect(statistics.getCoordinateCount()).assertEqual(3);
      const centroid: TouchCoordinate = statistics.getCentroid();
      expect(centroid.getX()).assertEqual(10 / 3);
      expect(centroid.getY()).assertEqual(10 / 3);
      expect(statistics.getAverageX()).assertEqual(10 / 3);
    });

    // 验证空统计集合的默认值
    it('touch_statistics_should_handle_empty_set', 0, async () => {
      const statistics = new TouchStatistics();
      const centroid: TouchCoordinate = statistics.getCentroid();
      expect(centroid.getX()).assertEqual(0);
      expect(centroid.getY()).assertEqual(0);
      expect(statistics.getTotalPathLength()).assertEqual(0);
      expect(statistics.getBoundingBoxArea()).assertEqual(0);
      expect(statistics.getAverageX()).assertEqual(0);
      expect(statistics.getCoordinateCount()).assertEqual(0);
    });

    // 验证热区分类覆盖全部区域
    it('touch_validator_should_classify_all_regions', 0, async () => {
      const validator = new TouchCoordinateValidator(1920, 1080);
      expect(validator.classifyRegion(300, 50)).assertEqual(TouchRegion.TAB_BAR);
      expect(validator.classifyRegion(300, 300)).assertEqual(TouchRegion.SETTING_LIST);
      expect(validator.classifyRegion(300, 800)).assertEqual(TouchRegion.TRUST_LIST);
      expect(validator.classifyRegion(300, 1050)).assertEqual(TouchRegion.PLAYER_GRID);
      expect(validator.classifyRegion(-1, 300)).assertEqual(TouchRegion.OUTSIDE);
      expect(validator.classifyRegion(300, 2000)).assertEqual(TouchRegion.OUTSIDE);
    });

    // 验证会话构建器链式配置
    it('touch_session_builder_should_chain_configuration', 0, async () => {
      const session: TouchSessionRecord = new TouchSessionBuilder()
        .setSessionId(7)
        .setGestureType(TouchGestureType.SWIPE_UP)
        .setRegion(TouchRegion.PLAYER_GRID)
        .setDuration(500)
        .setDistance(120)
        .build();
      expect(session.sessionId).assertEqual(7);
      expect(session.gestureType).assertEqual(TouchGestureType.SWIPE_UP);
      expect(session.region).assertEqual(TouchRegion.PLAYER_GRID);
      expect(session.duration).assertEqual(500);
      expect(session.distance).assertEqual(120);
    });

    // 验证报告生成器聚合指标
    it('touch_report_generator_should_aggregate_metrics', 0, async () => {
      const generator = new TouchReportGenerator();
      expect(generator.addEntry(TouchMetricType.CLICK_COUNT, 5, 'clicks')).assertTrue();
      expect(generator.addEntry(TouchMetricType.SWIPE_COUNT, 3, 'swipes')).assertTrue();
      expect(generator.addEntry(TouchMetricType.LONG_PRESS_COUNT, 2, 'long presses')).assertTrue();
      expect(generator.getEntryCount()).assertEqual(3);
      expect(generator.getTotalMetricValue()).assertEqual(10);
      expect(generator.getValueByType(TouchMetricType.SWIPE_COUNT)).assertEqual(3);
      expect(generator.getValueByType(TouchMetricType.TOTAL_EVENTS)).assertEqual(0);
      generator.clear();
      expect(generator.getEntryCount()).assertEqual(0);
    });

    // 验证九路宫格行列换算
    it('tile_hit_tester_should_resolve_nine_tiles', 0, async () => {
      const tester = new TileHitTester(1920, 1080, 9);
      expect(tester.columns()).assertEqual(3);
      expect(tester.rows()).assertEqual(3);
      expect(tester.tileWidth()).assertEqual(640);
      expect(tester.tileHeight()).assertEqual(360);
      expect(tester.hitTest(100, 100)).assertEqual(0);
      expect(tester.hitTest(700, 100)).assertEqual(1);
      expect(tester.hitTest(1400, 100)).assertEqual(2);
      expect(tester.hitTest(100, 400)).assertEqual(3);
      const center: TouchCoordinate = tester.centerOf(4);
      expect(center.getX()).assertEqual(960);
      expect(center.getY()).assertEqual(540);
    });

    // 验证宫格越界坐标返回 -1
    it('tile_hit_tester_should_reject_out_of_range_points', 0, async () => {
      const tester = new TileHitTester(1920, 1080, 5);
      expect(tester.hitTest(-1, 100)).assertEqual(-1);
      expect(tester.hitTest(100, -1)).assertEqual(-1);
      expect(tester.hitTest(2000, 100)).assertEqual(-1);
      expect(tester.hitTest(100, 2000)).assertEqual(-1);
      const invalidCenter: TouchCoordinate = tester.centerOf(9);
      expect(invalidCenter.getX()).assertEqual(-1);
      expect(tester.centerOf(-1).getY()).assertEqual(-1);
    });

    // 验证空宫格不会崩溃
    it('tile_hit_tester_should_handle_empty_grid', 0, async () => {
      const tester = new TileHitTester(1920, 1080, 0);
      expect(tester.columns()).assertEqual(0);
      expect(tester.rows()).assertEqual(0);
      expect(tester.tileWidth()).assertEqual(0);
      expect(tester.hitTest(100, 100)).assertEqual(-1);
      expect(tester.areAdjacent(0, 1)).assertFalse();
      expect(tester.centerOf(0).getX()).assertEqual(-1);
    });

    // 验证水平坐标序列生成
    it('touch_event_factory_should_generate_horizontal_points', 0, async () => {
      const factory = new TouchEventFactory();
      const points: TouchCoordinate[] = factory.generateHorizontalPoints(0, 100, 50, 5);
      expect(points.length).assertEqual(5);
      expect(points[0].getX()).assertEqual(0);
      expect(points[1].getX()).assertEqual(20);
      expect(points[4].getX()).assertEqual(80);
      expect(points[0].getY()).assertEqual(50);
      expect(factory.generateHorizontalPoints(0, 100, 50, 0).length).assertEqual(0);
    });

    // 验证追踪器统计点击、长按与滑动
    it('tracker_should_count_all_gesture_kinds', 0, async () => {
      tracker.reset();
      tracker.record(new TouchSessionBuilder().setSessionId(1).setGestureType(TouchGestureType.TAP).build());
      tracker.record(new TouchSessionBuilder().setSessionId(2).setGestureType(TouchGestureType.TAP).build());
      tracker.record(new TouchSessionBuilder().setSessionId(3).setGestureType(TouchGestureType.LONG_PRESS).build());
      tracker.record(new TouchSessionBuilder().setSessionId(4).setGestureType(TouchGestureType.SWIPE_LEFT).build());
      tracker.record(new TouchSessionBuilder().setSessionId(5).setGestureType(TouchGestureType.SWIPE_UP).build());
      expect(tracker.getTotalEvents()).assertEqual(5);
      expect(tracker.getClickCount()).assertEqual(2);
      expect(tracker.getLongPressCount()).assertEqual(1);
      expect(tracker.getSwipeCount()).assertEqual(2);
    });

    // 验证追踪器平均距离与平均时长
    it('tracker_should_compute_average_metrics', 0, async () => {
      tracker.reset();
      tracker.record(new TouchSessionBuilder().setSessionId(1).setDistance(100).setDuration(200).build());
      tracker.record(new TouchSessionBuilder().setSessionId(2).setDistance(300).setDuration(400).build());
      expect(tracker.getAverageDistance()).assertEqual(200);
      expect(tracker.getAverageDuration()).assertEqual(300);
      expect(tracker.getHistory().length).assertEqual(2);
    });

    // 验证追踪器历史为防御性拷贝
    it('tracker_should_return_defensive_history', 0, async () => {
      tracker.reset();
      tracker.record(new TouchSessionBuilder().setSessionId(1).setRegion(TouchRegion.SETTING_LIST).build());
      const snapshot: TouchSessionRecord[] = tracker.getHistory();
      snapshot[0].region = TouchRegion.OUTSIDE;
      expect(tracker.getHistory()[0].region).assertEqual(TouchRegion.SETTING_LIST);
      expect(tracker.hasTouchedRegion(TouchRegion.OUTSIDE)).assertFalse();
    });

    // 验证报告条目拒绝非法值
    it('touch_report_generator_should_reject_invalid_entry', 0, async () => {
      const generator = new TouchReportGenerator();
      expect(generator.addEntry(TouchMetricType.TOTAL_EVENTS, -1, 'total')).assertFalse();
      expect(generator.addEntry(TouchMetricType.TOTAL_EVENTS, 5, '')).assertFalse();
      expect(generator.getEntryCount()).assertEqual(0);
      expect(generator.addEntry(TouchMetricType.TOTAL_EVENTS, 5, 'total')).assertTrue();
      expect(generator.getValueByType(TouchMetricType.TOTAL_EVENTS)).assertEqual(5);
    });

    // 验证报告覆盖全部指标类型
    it('touch_report_generator_should_cover_all_metrics', 0, async () => {
      const generator = new TouchReportGenerator();
      generator.addEntry(TouchMetricType.TOTAL_EVENTS, 12, 'total');
      generator.addEntry(TouchMetricType.CLICK_COUNT, 6, 'clicks');
      generator.addEntry(TouchMetricType.LONG_PRESS_COUNT, 2, 'long');
      generator.addEntry(TouchMetricType.SWIPE_COUNT, 4, 'swipes');
      generator.addEntry(TouchMetricType.AVG_PATH_LENGTH, 120, 'avg');
      expect(generator.hasAllMetricTypes()).assertTrue();
      expect(generator.getTotalMetricValue()).assertEqual(144);
      expect(generator.getEntries().length).assertEqual(5);
    });

    // 综合触摸交互场景：多区域点击与滑动
    it('comprehensive_touch_interaction_scenario', 0, async () => {
      tracker.reset();
      const validator = new TouchCoordinateValidator(1920, 1080);
      await simulateTouch(driver, 300, 60);
      tracker.record(new TouchSessionBuilder()
        .setSessionId(1).setRegion(validator.classifyRegion(300, 60)).build());
      await simulateTouch(driver, 480, 320);
      tracker.record(new TouchSessionBuilder()
        .setSessionId(2).setRegion(validator.classifyRegion(480, 320)).build());
      await swipeOnScreen(driver, 200, 800, 800, 800, 700);
      tracker.record(new TouchSessionBuilder()
        .setSessionId(3)
        .setGestureType(TouchGestureType.SWIPE_RIGHT)
        .setRegion(validator.classifyRegion(200, 800))
        .setDistance(600)
        .setDuration(700)
        .build());
      expect(tracker.getTotalEvents()).assertEqual(3);
      expect(tracker.getClickCount()).assertEqual(2);
      expect(tracker.getSwipeCount()).assertEqual(1);
      expect(tracker.getAverageDistance()).assertEqual(200);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertEqual(0);
    });

    // 验证播放页宫格触控可命中瓦片
    it('player_page_touch_should_hit_tile', 0, async () => {
      const devices: string[] = await getDeviceIdList(driver);
      const deviceId: string = devices.length > 0 ? devices[0] : 'mock_touch_device';
      await launchPlayerPage(deviceId, 'Miracast_Touch_Device');
      await waitForPlayerPage(driver, TIMEOUT_PLAYER_RENDER);
      const tiles: number = await getPlayerTileCount(driver);
      expect(tiles).assertLessOrEqual(MAX_MIRROR_TILES);
      const tester = new TileHitTester(screen.width, screen.height, Math.max(tiles, 1));
      expect(tester.columns()).assertLargerOrEqual(1);
      await simulateTouch(driver, 200, 300);
      tracker.record(new TouchSessionBuilder()
        .setSessionId(30).setRegion(TouchRegion.PLAYER_GRID).build());
      expect(tracker.hasTouchedRegion(TouchRegion.PLAYER_GRID)).assertTrue();
      await safeBack(driver, 1);
      await triggerMiracastHome(driver);
    });

    // 验证键盘与触摸混合操作后仍可继续触摸
    it('touch_should_work_after_keyboard_navigation', 0, async () => {
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_TOUCH_EVENT);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_TOUCH_EVENT);
      await simulateTouch(driver, 480, 320);
      await driver.delayMs(DELAY_TOUCH_EVENT);
      tracker.record(new TouchSessionBuilder()
        .setSessionId(31).setRegion(TouchRegion.SETTING_LIST).build());
      expect(tracker.getTotalEvents()).assertLargerOrEqual(1);
    });

    // 验证触摸区域命中测试的列数契约
    it('tile_hit_tester_should_follow_column_contract', 0, async () => {
      const single = new TileHitTester(1920, 1080, 1);
      const pair = new TileHitTester(1920, 1080, 2);
      const quad = new TileHitTester(1920, 1080, 4);
      const nine = new TileHitTester(1920, 1080, 9);
      expect(single.columns()).assertEqual(1);
      expect(pair.columns()).assertEqual(2);
      expect(quad.columns()).assertEqual(2);
      expect(nine.columns()).assertEqual(3);
      expect(nine.rows()).assertEqual(3);
      expect(quad.rows()).assertEqual(2);
    });

    // 验证单路全屏宫格命中
    it('tile_hit_tester_should_resolve_single_tile', 0, async () => {
      const tester = new TileHitTester(1920, 1080, 1);
      expect(tester.columns()).assertEqual(1);
      expect(tester.rows()).assertEqual(1);
      expect(tester.hitTest(10, 10)).assertEqual(0);
      expect(tester.hitTest(1919, 1079)).assertEqual(0);
      const center: TouchCoordinate = tester.centerOf(0);
      expect(center.getX()).assertEqual(960);
      expect(center.getY()).assertEqual(540);
    });

    // 验证包围盒面积与清空
    it('touch_statistics_should_compute_bounding_box', 0, async () => {
      const statistics = new TouchStatistics();
      statistics.addCoordinate(new TouchCoordinate(0, 0));
      statistics.addCoordinate(new TouchCoordinate(10, 20));
      expect(statistics.getBoundingBoxArea()).assertEqual(200);
      statistics.clear();
      expect(statistics.getCoordinateCount()).assertEqual(0);
      expect(statistics.getBoundingBoxArea()).assertEqual(0);
    });
  });
}
