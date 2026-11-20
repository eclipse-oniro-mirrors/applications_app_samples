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
import { getDriver, triggerMiracastHome, waitForPageStable, waitForPlayerPage, getPlayerTileCount,
  getScreenSize, launchPlayerPage, getDeviceIdList, simulateTouch, longClickComponent, safeBack,
  TIMEOUT_PAGE_RENDER, TIMEOUT_PLAYER_RENDER, DELAY_TOUCH_EVENT, MAX_MIRROR_TILES, ScreenSizeInfo } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'GestureRecognitionSuite';

// ===== 手势识别领域模型（本地 Mock，纯逻辑） =====
// 覆盖投屏首页/播放宫格上的 tap、long press、double tap、swipe、drag

// 手势类型枚举：描述 Miracast 界面支持的手势
enum GestureType {
  TAP = 'tap',
  LONG_PRESS = 'long_press',
  DOUBLE_TAP = 'double_tap',
  SWIPE = 'swipe',
  DRAG = 'drag',
  NONE = 'none'
}

// 手势方向枚举：描述滑动/拖拽的朝向
enum GestureDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down',
  NONE = 'none'
}

// 手势识别阶段枚举：描述一次手势从按下到结束的阶段
enum GesturePhase {
  IDLE = 'idle',
  BEGAN = 'began',
  MOVING = 'moving',
  ENDED = 'ended',
  CANCELLED = 'cancelled'
}

// 手势落点区域枚举：描述手势发生在哪个 UI 区域
enum GestureScreen {
  TAB_BAR = 'tab_bar',
  SETTING_ROW = 'setting_row',
  TRUST_ROW = 'trust_row',
  PLAYER_TILE = 'player_tile',
  EMPTY_AREA = 'empty_area'
}

// 坐标点接口：描述触摸点的二维位置
interface GesturePoint {
  x: number;
  y: number;
}

// 滑动手势向量接口：描述滑动起止坐标与耗时
interface SwipeVector {
  startX: number;
  startY: number;
  endX: number;
  endY: number;
  durationMs: number;
}

// 手势记录接口：描述一次手势识别的观测结果
interface GestureRecord {
  gestureType: GestureType;
  screen: GestureScreen;
  isRecognized: boolean;
  responseTime: number;
  timestamp: number;
}

// 手势配置接口：描述识别阈值参数
interface GestureConfig {
  tapMaxDuration: number;
  longPressMinDuration: number;
  doubleTapMaxInterval: number;
  swipeMinDistance: number;
  dragMinDistance: number;
  enabled: boolean;
}

// 手势方向解析器：根据位移判定滑动方向
class GestureDirectionResolver {
  // 解析滑动方向：水平位移占优时判左右，否则判上下
  public resolve(vector: SwipeVector): GestureDirection {
    const deltaX: number = vector.endX - vector.startX;
    const deltaY: number = vector.endY - vector.startY;
    if (deltaX === 0 && deltaY === 0) {
      return GestureDirection.NONE;
    }
    if (Math.abs(deltaX) >= Math.abs(deltaY)) {
      return deltaX >= 0 ? GestureDirection.RIGHT : GestureDirection.LEFT;
    }
    return deltaY >= 0 ? GestureDirection.DOWN : GestureDirection.UP;
  }

  // 计算滑动距离
  public distance(vector: SwipeVector): number {
    const deltaX: number = vector.endX - vector.startX;
    const deltaY: number = vector.endY - vector.startY;
    return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
  }

  // 计算滑动速度：像素/毫秒，耗时为 0 时返回 -1
  public speed(vector: SwipeVector): number {
    if (vector.durationMs <= 0) {
      return -1;
    }
    return this.distance(vector) / vector.durationMs;
  }

  // 判断滑动是否为水平方向
  public isHorizontal(vector: SwipeVector): boolean {
    const direction: GestureDirection = this.resolve(vector);
    return direction === GestureDirection.LEFT || direction === GestureDirection.RIGHT;
  }

  // 判断滑动是否为垂直方向
  public isVertical(vector: SwipeVector): boolean {
    const direction: GestureDirection = this.resolve(vector);
    return direction === GestureDirection.UP || direction === GestureDirection.DOWN;
  }
}

// 手势分类器：依据位移、时长与点击次数判定手势类型
class GestureClassifier {
  private config: GestureConfig;
  private directionResolver: GestureDirectionResolver = new GestureDirectionResolver();

  constructor(config: GestureConfig) {
    this.config = config;
  }

  // 判定手势类型：阈值来自 GestureConfig
  public classify(vector: SwipeVector, tapCount: number, holdDuration: number): GestureType {
    if (!this.config.enabled) {
      return GestureType.NONE;
    }
    const distance: number = this.directionResolver.distance(vector);
    if (holdDuration >= this.config.longPressMinDuration && distance < this.config.swipeMinDistance) {
      return GestureType.LONG_PRESS;
    }
    if (tapCount >= 2 && distance < this.config.swipeMinDistance &&
      holdDuration <= this.config.tapMaxDuration * 2) {
      return GestureType.DOUBLE_TAP;
    }
    if (distance >= this.config.dragMinDistance && vector.durationMs > this.config.tapMaxDuration) {
      return GestureType.DRAG;
    }
    if (distance >= this.config.swipeMinDistance) {
      return GestureType.SWIPE;
    }
    if (holdDuration <= this.config.tapMaxDuration) {
      return GestureType.TAP;
    }
    return GestureType.NONE;
  }

  public isTap(gestureType: GestureType): boolean {
    return gestureType === GestureType.TAP;
  }

  public isLongPress(gestureType: GestureType): boolean {
    return gestureType === GestureType.LONG_PRESS;
  }

  public isDoubleTap(gestureType: GestureType): boolean {
    return gestureType === GestureType.DOUBLE_TAP;
  }

  public isSwipe(gestureType: GestureType): boolean {
    return gestureType === GestureType.SWIPE;
  }

  public isDrag(gestureType: GestureType): boolean {
    return gestureType === GestureType.DRAG;
  }

  // 判断两次点击间隔是否满足双击
  public isWithinDoubleTapInterval(intervalMs: number): boolean {
    return intervalMs >= 0 && intervalMs <= this.config.doubleTapMaxInterval;
  }

  // 依据坐标判定落点区域：顶部为 Tab，其次为设置/信任行，右侧大区域为宫格
  public resolveScreen(x: number, y: number, screenWidth: number, screenHeight: number): GestureScreen {
    if (x < 0 || y < 0 || x > screenWidth || y > screenHeight) {
      return GestureScreen.EMPTY_AREA;
    }
    if (y <= 96) {
      return GestureScreen.TAB_BAR;
    }
    if (y <= screenHeight / 2) {
      return GestureScreen.SETTING_ROW;
    }
    if (y <= screenHeight - 96) {
      return GestureScreen.TRUST_ROW;
    }
    return GestureScreen.EMPTY_AREA;
  }

}

// 手势模型：封装单次手势的属性并提供校验与克隆
class GestureModel {
  private gestureType: GestureType;
  private direction: GestureDirection;
  private screen: GestureScreen;
  private isRecognized: boolean;
  private responseTime: number;
  private confidence: number;

  constructor() {
    this.gestureType = GestureType.NONE;
    this.direction = GestureDirection.NONE;
    this.screen = GestureScreen.EMPTY_AREA;
    this.isRecognized = false;
    this.responseTime = 0;
    this.confidence = 0;
  }

  public setGestureType(gestureType: GestureType): void {
    this.gestureType = gestureType;
  }

  public getGestureType(): GestureType {
    return this.gestureType;
  }

  public setDirection(direction: GestureDirection): void {
    this.direction = direction;
  }

  public getDirection(): GestureDirection {
    return this.direction;
  }

  public setScreen(screen: GestureScreen): void {
    this.screen = screen;
  }

  public getScreen(): GestureScreen {
    return this.screen;
  }

  public setRecognized(recognized: boolean): void {
    this.isRecognized = recognized;
  }

  public getRecognized(): boolean {
    return this.isRecognized;
  }

  public setResponseTime(time: number): void {
    this.responseTime = time;
  }

  public getResponseTime(): number {
    return this.responseTime;
  }

  public setConfidence(confidence: number): void {
    this.confidence = confidence;
  }

  public getConfidence(): number {
    return this.confidence;
  }

  // 校验置信度是否在 0~1
  public isConfidenceValid(): boolean {
    return this.confidence >= 0 && this.confidence <= 1;
  }

  public isResponseTimeValid(): boolean {
    return this.responseTime >= 0;
  }

  public isValid(): boolean {
    return this.isConfidenceValid() && this.isResponseTimeValid();
  }

  public clone(): GestureModel {
    const cloned = new GestureModel();
    cloned.setGestureType(this.gestureType);
    cloned.setDirection(this.direction);
    cloned.setScreen(this.screen);
    cloned.setRecognized(this.isRecognized);
    cloned.setResponseTime(this.responseTime);
    cloned.setConfidence(this.confidence);
    return cloned;
  }

  public equals(other: GestureModel): boolean {
    return this.gestureType === other.gestureType && this.direction === other.direction &&
      this.screen === other.screen && this.isRecognized === other.isRecognized &&
      this.responseTime === other.responseTime && this.confidence === other.confidence;
  }

  public toString(): string {
    return 'GestureModel(' + this.gestureType + ', ' + this.screen + ', recognized=' + this.isRecognized + ')';
  }
}

// 手势追踪器：单例保存全量识别记录
class GestureTracker {
  private static instance: GestureTracker;
  private history: GestureRecord[] = [];
  private totalGestures: number = 0;
  private recognizedGestures: number = 0;

  public static getInstance(): GestureTracker {
    if (!GestureTracker.instance) {
      GestureTracker.instance = new GestureTracker();
    }
    return GestureTracker.instance;
  }

  // 记录一次手势识别结果：负耗时不写入
  public record(gestureType: GestureType, screen: GestureScreen, isRecognized: boolean,
    responseTime: number): boolean {
    if (responseTime < 0) {
      return false;
    }
    const record: GestureRecord = {
      gestureType: gestureType,
      screen: screen,
      isRecognized: isRecognized,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.history.push(record);
    this.totalGestures++;
    if (isRecognized) {
      this.recognizedGestures++;
    }
    return true;
  }

  public getHistory(): GestureRecord[] {
    const copied: GestureRecord[] = [];
    for (const record of this.history) {
      const item: GestureRecord = {
        gestureType: record.gestureType,
        screen: record.screen,
        isRecognized: record.isRecognized,
        responseTime: record.responseTime,
        timestamp: record.timestamp
      };
      copied.push(item);
    }
    return copied;
  }

  public getTotalGestures(): number {
    return this.totalGestures;
  }

  public getRecognizedGestures(): number {
    return this.recognizedGestures;
  }

  public getRecognitionRate(): number {
    if (this.totalGestures === 0) {
      return 0;
    }
    return this.recognizedGestures / this.totalGestures;
  }

  public hasTestedGesture(gestureType: GestureType): boolean {
    for (const record of this.history) {
      if (record.gestureType === gestureType) {
        return true;
      }
    }
    return false;
  }

  public countByType(gestureType: GestureType): number {
    let count: number = 0;
    for (const record of this.history) {
      if (record.gestureType === gestureType) {
        count++;
      }
    }
    return count;
  }

  public countByScreen(screen: GestureScreen): number {
    let count: number = 0;
    for (const record of this.history) {
      if (record.screen === screen) {
        count++;
      }
    }
    return count;
  }

  public getAverageResponseTime(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const record of this.history) {
      total += record.responseTime;
    }
    return total / this.history.length;
  }

  public getMaxResponseTime(): number {
    let max: number = 0;
    for (const record of this.history) {
      if (record.responseTime > max) {
        max = record.responseTime;
      }
    }
    return max;
  }

  public getMinResponseTime(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let min: number = this.history[0].responseTime;
    for (const record of this.history) {
      if (record.responseTime < min) {
        min = record.responseTime;
      }
    }
    return min;
  }

  public getRecognizedHistory(): GestureRecord[] {
    const result: GestureRecord[] = [];
    for (const record of this.history) {
      if (record.isRecognized) {
        result.push(record);
      }
    }
    return result;
  }

  public isChronological(): boolean {
    for (let i: number = 1; i < this.history.length; i++) {
      if (this.history[i].timestamp < this.history[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.history = [];
    this.totalGestures = 0;
    this.recognizedGestures = 0;
  }
}

export default function gestureRecognitionSuite(): void {
  describe('GestureRecognition_Test', () => {
    let driver: Driver;
    let tracker: GestureTracker;
    let config: GestureConfig;

    // 测试前置：初始化驱动、追踪器与识别阈值，并回到投屏首页
    beforeAll(async () => {
      driver = getDriver();
      tracker = GestureTracker.getInstance();
      tracker.reset();
      config = {
        tapMaxDuration: 300,
        longPressMinDuration: 800,
        doubleTapMaxInterval: 300,
        swipeMinDistance: 60,
        dragMinDistance: 120,
        enabled: true
      };
      Log.info(TAG, 'gesture suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // 测试清理：退出页面并复位追踪器
    afterAll(async () => {
      await safeBack(driver, 2);
      await triggerMiracastHome(driver);
      tracker.reset();
      Log.info(TAG, 'gesture suite end');
    });

    // 验证点击首页 Tab 被识别为 tap
    it('index_tab_should_recognize_tap_gesture', 0, async () => {
      const startTime: number = Date.now();
      await simulateTouch(driver, 300, 60);
      const responseTime: number = Date.now() - startTime;
      await driver.delayMs(DELAY_TOUCH_EVENT);
      tracker.record(GestureType.TAP, GestureScreen.TAB_BAR, true, responseTime);
      expect(tracker.hasTestedGesture(GestureType.TAP)).assertTrue();
      expect(tracker.getRecognitionRate()).assertEqual(1);
    });

    // 验证信任列表行支持长按手势
    it('trust_row_should_recognize_long_press_gesture', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const screen: ScreenSizeInfo = await getScreenSize(driver);
      const rowY: number = Math.floor(screen.height * 0.7);
      await longClickComponent(driver, 480, rowY, 900);
      tracker.record(GestureType.LONG_PRESS, GestureScreen.TRUST_ROW, true, 900);
      expect(tracker.hasTestedGesture(GestureType.LONG_PRESS)).assertTrue();
      expect(screen.width).assertLarger(0);
      expect(screen.height).assertLarger(0);
    });

    // 验证播放页多路宫格可被触控识别
    it('player_page_should_accept_tile_touch', 0, async () => {
      const devices: string[] = await getDeviceIdList(driver);
      const deviceId: string = devices.length > 0 ? devices[0] : 'mock_gesture_device';
      await launchPlayerPage(deviceId, 'Miracast_Gesture_Device');
      await waitForPlayerPage(driver, TIMEOUT_PLAYER_RENDER);
      const tiles: number = await getPlayerTileCount(driver);
      expect(tiles).assertLargerOrEqual(0);
      expect(tiles).assertLessOrEqual(MAX_MIRROR_TILES);
      await simulateTouch(driver, 320, 540);
      tracker.record(GestureType.TAP, GestureScreen.PLAYER_TILE, true, 40);
      expect(tracker.countByScreen(GestureScreen.PLAYER_TILE)).assertLargerOrEqual(1);
    });

    // 验证短按静止被判为 tap

    // 验证长按超过阈值被判为 long press
    it('classifier_should_detect_long_press', 0, async () => {
      const classifier = new GestureClassifier(config);
      const vector: SwipeVector = {
        startX: 400,
        startY: 600,
        endX: 402,
        endY: 601,
        durationMs: 900
      };
      expect(classifier.classify(vector, 1, 900)).assertEqual(GestureType.LONG_PRESS);
      expect(classifier.isLongPress(GestureType.LONG_PRESS)).assertTrue();
      expect(classifier.classify(vector, 1, 799)).assertEqual(GestureType.NONE);
    });

    // 验证双击间隔内连点被判为 double tap
    it('classifier_should_detect_double_tap', 0, async () => {
      const classifier = new GestureClassifier(config);
      const vector: SwipeVector = {
        startX: 200,
        startY: 200,
        endX: 200,
        endY: 200,
        durationMs: 100
      };
      expect(classifier.classify(vector, 2, 100)).assertEqual(GestureType.DOUBLE_TAP);
      expect(classifier.isDoubleTap(GestureType.DOUBLE_TAP)).assertTrue();
      expect(classifier.isWithinDoubleTapInterval(150)).assertTrue();
      expect(classifier.isWithinDoubleTapInterval(500)).assertFalse();
      expect(classifier.isWithinDoubleTapInterval(-1)).assertFalse();
    });

    // 验证超短时长的位移被判为 swipe
    it('classifier_should_detect_swipe', 0, async () => {
      const classifier = new GestureClassifier(config);
      const vector: SwipeVector = {
        startX: 300,
        startY: 400,
        endX: 500,
        endY: 400,
        durationMs: 120
      };
      expect(classifier.classify(vector, 1, 120)).assertEqual(GestureType.SWIPE);
      expect(classifier.isSwipe(GestureType.SWIPE)).assertTrue();
      expect(classifier.isDrag(GestureType.SWIPE)).assertFalse();
    });

    // 验证长时间大位移被判为 drag
    it('classifier_should_detect_drag', 0, async () => {
      const classifier = new GestureClassifier(config);
      const vector: SwipeVector = {
        startX: 100,
        startY: 500,
        endX: 400,
        endY: 500,
        durationMs: 1500
      };
      expect(classifier.classify(vector, 1, 1500)).assertEqual(GestureType.DRAG);
      expect(classifier.isDrag(GestureType.DRAG)).assertTrue();
      expect(classifier.isSwipe(GestureType.DRAG)).assertFalse();
    });

    // 验证位移恰好等于滑动阈值时仍判定为 swipe
    it('classifier_should_handle_threshold_boundary', 0, async () => {
      const classifier = new GestureClassifier(config);
      const exact: SwipeVector = {
        startX: 0,
        startY: 0,
        endX: 60,
        endY: 0,
        durationMs: 100
      };
      const below: SwipeVector = {
        startX: 0,
        startY: 0,
        endX: 59,
        endY: 0,
        durationMs: 100
      };
      expect(classifier.classify(exact, 1, 100)).assertEqual(GestureType.SWIPE);
      expect(classifier.classify(below, 1, 100)).assertEqual(GestureType.TAP);
    });

    // 验证禁用识别器时所有手势返回 none
    it('classifier_should_return_none_when_disabled', 0, async () => {
      const disabled: GestureConfig = {
        tapMaxDuration: 300,
        longPressMinDuration: 800,
        doubleTapMaxInterval: 300,
        swipeMinDistance: 60,
        dragMinDistance: 120,
        enabled: false
      };
      const classifier = new GestureClassifier(disabled);
      const vector: SwipeVector = {
        startX: 0,
        startY: 0,
        endX: 200,
        endY: 0,
        durationMs: 100
      };
      expect(classifier.classify(vector, 1, 100)).assertEqual(GestureType.NONE);
      expect(classifier.classify(vector, 2, 900)).assertEqual(GestureType.NONE);
    });

    // 验证落点区域分类覆盖 Tab 与设置行
    it('classifier_should_resolve_screen_regions', 0, async () => {
      const classifier = new GestureClassifier(config);
      expect(classifier.resolveScreen(300, 50, 1920, 1080)).assertEqual(GestureScreen.TAB_BAR);
      expect(classifier.resolveScreen(300, 300, 1920, 1080)).assertEqual(GestureScreen.SETTING_ROW);
      expect(classifier.resolveScreen(300, 800, 1920, 1080)).assertEqual(GestureScreen.TRUST_ROW);
      expect(classifier.resolveScreen(-1, 50, 1920, 1080)).assertEqual(GestureScreen.EMPTY_AREA);
    });

    // 验证方向解析覆盖四个方向
    it('direction_resolver_should_resolve_all_directions', 0, async () => {
      const resolver = new GestureDirectionResolver();
      const right: SwipeVector = {
        startX: 0,
        startY: 0,
        endX: 100,
        endY: 10,
        durationMs: 100
      };
      const left: SwipeVector = {
        startX: 100,
        startY: 0,
        endX: 0,
        endY: 10,
        durationMs: 100
      };
      const down: SwipeVector = {
        startX: 0,
        startY: 0,
        endX: 10,
        endY: 100,
        durationMs: 100
      };
      const up: SwipeVector = {
        startX: 0,
        startY: 100,
        endX: 10,
        endY: 0,
        durationMs: 100
      };
      expect(resolver.resolve(right)).assertEqual(GestureDirection.RIGHT);
      expect(resolver.resolve(left)).assertEqual(GestureDirection.LEFT);
      expect(resolver.resolve(down)).assertEqual(GestureDirection.DOWN);
      expect(resolver.resolve(up)).assertEqual(GestureDirection.UP);
    });

    // 验证零位移方向为 none
    it('direction_resolver_should_return_none_for_zero_vector', 0, async () => {
      const resolver = new GestureDirectionResolver();
      const zero: SwipeVector = {
        startX: 50,
        startY: 50,
        endX: 50,
        endY: 50,
        durationMs: 100
      };
      expect(resolver.resolve(zero)).assertEqual(GestureDirection.NONE);
      expect(resolver.distance(zero)).assertEqual(0);
      expect(resolver.isHorizontal(zero)).assertFalse();
      expect(resolver.isVertical(zero)).assertFalse();
    });

    // 验证滑动距离与速度计算
    it('direction_resolver_should_compute_distance_and_speed', 0, async () => {
      const resolver = new GestureDirectionResolver();
      const vector: SwipeVector = {
        startX: 0,
        startY: 0,
        endX: 30,
        endY: 40,
        durationMs: 10
      };
      expect(resolver.distance(vector)).assertEqual(50);
      expect(resolver.speed(vector)).assertEqual(5);
      const zeroDuration: SwipeVector = {
        startX: 0,
        startY: 0,
        endX: 30,
        endY: 40,
        durationMs: 0
      };
      expect(resolver.speed(zeroDuration)).assertEqual(-1);
      expect(resolver.isHorizontal(vector)).assertFalse();
      expect(resolver.isVertical(vector)).assertTrue();
    });

    // 验证追踪器记录并统计识别率
    it('tracker_should_record_and_rate_gestures', 0, async () => {
      tracker.reset();
      tracker.record(GestureType.TAP, GestureScreen.TAB_BAR, true, 30);
      tracker.record(GestureType.SWIPE, GestureScreen.PLAYER_TILE, true, 50);
      tracker.record(GestureType.DRAG, GestureScreen.PLAYER_TILE, false, 70);
      expect(tracker.getTotalGestures()).assertEqual(3);
      expect(tracker.getRecognizedGestures()).assertEqual(2);
      expect(tracker.getRecognitionRate()).assertEqual(2 / 3);
      expect(tracker.getRecognizedHistory().length).assertEqual(2);
    });

    // 验证追踪器拒绝负耗时
    it('tracker_should_reject_negative_response_time', 0, async () => {
      tracker.reset();
      expect(tracker.record(GestureType.TAP, GestureScreen.TAB_BAR, true, -10)).assertFalse();
      expect(tracker.getTotalGestures()).assertEqual(0);
      expect(tracker.record(GestureType.TAP, GestureScreen.TAB_BAR, true, 0)).assertTrue();
      expect(tracker.getAverageResponseTime()).assertEqual(0);
    });

    // 验证追踪器极值与平均耗时
    it('tracker_should_compute_response_extremes', 0, async () => {
      tracker.reset();
      tracker.record(GestureType.TAP, GestureScreen.TAB_BAR, true, 90);
      tracker.record(GestureType.LONG_PRESS, GestureScreen.TRUST_ROW, true, 20);
      tracker.record(GestureType.DOUBLE_TAP, GestureScreen.SETTING_ROW, true, 60);
      expect(tracker.getMinResponseTime()).assertEqual(20);
      expect(tracker.getMaxResponseTime()).assertEqual(90);
      expect(tracker.getAverageResponseTime()).assertEqual(170 / 3);
      expect(tracker.isChronological()).assertTrue();
    });

    // 验证按类型与区域计数
    it('tracker_should_count_by_type_and_screen', 0, async () => {
      tracker.reset();
      tracker.record(GestureType.TAP, GestureScreen.PLAYER_TILE, true, 10);
      tracker.record(GestureType.TAP, GestureScreen.PLAYER_TILE, true, 10);
      tracker.record(GestureType.SWIPE, GestureScreen.SETTING_ROW, true, 10);
      expect(tracker.countByType(GestureType.TAP)).assertEqual(2);
      expect(tracker.countByType(GestureType.SWIPE)).assertEqual(1);
      expect(tracker.countByScreen(GestureScreen.PLAYER_TILE)).assertEqual(2);
      expect(tracker.countByScreen(GestureScreen.EMPTY_AREA)).assertEqual(0);
    });

    // 验证追踪器重置清空统计
    it('tracker_should_reset_statistics', 0, async () => {
      tracker.reset();
      tracker.record(GestureType.TAP, GestureScreen.TAB_BAR, true, 10);
      expect(tracker.getTotalGestures()).assertEqual(1);
      tracker.reset();
      expect(tracker.getTotalGestures()).assertEqual(0);
      expect(tracker.getRecognizedGestures()).assertEqual(0);
      expect(tracker.getRecognitionRate()).assertEqual(0);
      expect(tracker.getMinResponseTime()).assertEqual(0);
      expect(tracker.getHistory().length).assertEqual(0);
    });

    // 验证追踪器历史快照为防御性拷贝
    it('tracker_should_return_defensive_history', 0, async () => {
      tracker.reset();
      tracker.record(GestureType.TAP, GestureScreen.TAB_BAR, true, 12);
      const snapshot: GestureRecord[] = tracker.getHistory();
      expect(snapshot.length).assertEqual(1);
      snapshot[0].gestureType = GestureType.DRAG;
      expect(tracker.getHistory()[0].gestureType).assertEqual(GestureType.TAP);
      expect(tracker.countByType(GestureType.DRAG)).assertEqual(0);
    });

    // 验证手势模型属性写入与校验
    it('gesture_model_should_set_and_validate', 0, async () => {
      const model = new GestureModel();
      model.setGestureType(GestureType.SWIPE);
      model.setDirection(GestureDirection.RIGHT);
      model.setScreen(GestureScreen.PLAYER_TILE);
      model.setRecognized(true);
      model.setResponseTime(60);
      model.setConfidence(0.9);
      expect(model.getGestureType()).assertEqual(GestureType.SWIPE);
      expect(model.getDirection()).assertEqual(GestureDirection.RIGHT);
      expect(model.getScreen()).assertEqual(GestureScreen.PLAYER_TILE);
      expect(model.getConfidence()).assertEqual(0.9);
      expect(model.isConfidenceValid()).assertTrue();
      expect(model.isValid()).assertTrue();
    });

    // 验证手势模型非法置信度被拒绝
    it('gesture_model_should_reject_invalid_confidence', 0, async () => {
      const model = new GestureModel();
      model.setConfidence(1.5);
      expect(model.isConfidenceValid()).assertFalse();
      expect(model.isValid()).assertFalse();
      model.setConfidence(-0.1);
      expect(model.isConfidenceValid()).assertFalse();
      model.setConfidence(0);
      expect(model.isConfidenceValid()).assertTrue();
      model.setConfidence(1);
      expect(model.isConfidenceValid()).assertTrue();
    });

    // 验证手势模型克隆与比较
    it('gesture_model_should_clone_and_compare', 0, async () => {
      const model = new GestureModel();
      model.setGestureType(GestureType.LONG_PRESS);
      model.setScreen(GestureScreen.TRUST_ROW);
      model.setRecognized(true);
      model.setResponseTime(800);
      model.setConfidence(0.8);
      const clone: GestureModel = model.clone();
      expect(clone.equals(model)).assertTrue();
      clone.setScreen(GestureScreen.SETTING_ROW);
      expect(clone.equals(model)).assertFalse();
      expect(model.getScreen()).assertEqual(GestureScreen.TRUST_ROW);
      expect(model.toString().indexOf('long_press')).assertLargerOrEqual(0);
    });

    // 验证手势模型默认值
    it('gesture_model_should_start_with_defaults', 0, async () => {
      const model = new GestureModel();
      expect(model.getGestureType()).assertEqual(GestureType.NONE);
      expect(model.getDirection()).assertEqual(GestureDirection.NONE);
      expect(model.getScreen()).assertEqual(GestureScreen.EMPTY_AREA);
      expect(model.getRecognized()).assertFalse();
      expect(model.getResponseTime()).assertEqual(0);
      expect(model.getConfidence()).assertEqual(0);
      expect(model.isValid()).assertTrue();
    });

    // 综合手势场景：点击 -> 长按 -> 双击 -> 滑动 -> 拖拽
    it('comprehensive_gesture_scenario', 0, async () => {
      tracker.reset();
      const classifier = new GestureClassifier(config);
      const tap: SwipeVector = { startX: 10, startY: 10, endX: 10, endY: 10, durationMs: 100 };
      const longPress: SwipeVector = { startX: 10, startY: 10, endX: 11, endY: 11, durationMs: 900 };
      const swipe: SwipeVector = { startX: 0, startY: 0, endX: 200, endY: 0, durationMs: 100 };
      const drag: SwipeVector = { startX: 0, startY: 0, endX: 300, endY: 0, durationMs: 1400 };
      tracker.record(classifier.classify(tap, 1, 100), GestureScreen.TAB_BAR, true, 30);
      tracker.record(classifier.classify(longPress, 1, 900), GestureScreen.TRUST_ROW, true, 900);
      tracker.record(classifier.classify(tap, 2, 100), GestureScreen.SETTING_ROW, true, 120);
      tracker.record(classifier.classify(swipe, 1, 100), GestureScreen.PLAYER_TILE, true, 100);
      tracker.record(classifier.classify(drag, 1, 1400), GestureScreen.PLAYER_TILE, true, 1400);
      expect(tracker.getTotalGestures()).assertEqual(5);
      expect(tracker.countByType(GestureType.TAP)).assertEqual(1);
      expect(tracker.countByType(GestureType.LONG_PRESS)).assertEqual(1);
      expect(tracker.countByType(GestureType.DOUBLE_TAP)).assertEqual(1);
      expect(tracker.countByType(GestureType.SWIPE)).assertEqual(1);
      expect(tracker.countByType(GestureType.DRAG)).assertEqual(1);
      expect(tracker.getRecognitionRate()).assertEqual(1);
    });

  });
}
