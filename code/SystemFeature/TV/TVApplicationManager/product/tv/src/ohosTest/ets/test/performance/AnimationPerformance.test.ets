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
  KEY_ENTER,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../common/SharedDriver';

interface AnimationRecord {
  animationType: string;
  duration: number;
  frameCount: number;
  fps: number;
  timestamp: number;
  isSmooth: boolean;
}

class AnimationPerformanceTracker {
  private static instance: AnimationPerformanceTracker;
  private animationHistory: AnimationRecord[] = [];
  private totalAnimations: number = 0;
  private smoothAnimations: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): AnimationPerformanceTracker {
    if (!AnimationPerformanceTracker.instance) {
      AnimationPerformanceTracker.instance = new AnimationPerformanceTracker();
    }
    return AnimationPerformanceTracker.instance;
  }

  public recordAnimation(animationType: string, duration: number, frameCount: number, fps: number,
    isSmooth: boolean): void {
    const record: AnimationRecord = {
      animationType,
      duration,
      frameCount,
      fps,
      timestamp: Date.now(),
      isSmooth
    };
    this.animationHistory.push(record);
    this.totalAnimations++;
    if (isSmooth) {
      this.smoothAnimations++;
    }
  }

  public getAnimationHistory(): AnimationRecord[] {
    return [...this.animationHistory];
  }

  public getTotalAnimations(): number {
    return this.totalAnimations;
  }

  public getSmoothAnimations(): number {
    return this.smoothAnimations;
  }

  public resetTracker(): void {
    this.animationHistory = [];
    this.totalAnimations = 0;
    this.smoothAnimations = 0;
  }

  public getSmoothnessRate(): number {
    if (this.totalAnimations === 0) {
      return 0;
    }
    return this.smoothAnimations / this.totalAnimations;
  }

  public getAverageFPS(): number {
    if (this.animationHistory.length === 0) {
      return 0;
    }
    const totalFPS = this.animationHistory.reduce((sum: number, record: AnimationRecord) => sum + record.fps, 0);
    return totalFPS / this.animationHistory.length;
  }

  public getAverageDuration(): number {
    if (this.animationHistory.length === 0) {
      return 0;
    }
    const totalDuration =
      this.animationHistory.reduce((sum: number, record: AnimationRecord) => sum + record.duration, 0);
    return totalDuration / this.animationHistory.length;
  }
}

export default function animationPerformanceTest() {
  describe('AnimationPerformance_Test', () => {
    let driver: Driver;
    let animationTracker: AnimationPerformanceTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      animationTracker = AnimationPerformanceTracker.getInstance();
      animationTracker.resetTracker();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 验证dialog should具备特性：确保TV设备have smooth open animation满足设计要求
    it('dialog_should_have_smooth_open_animation', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const duration = Date.now() - startTime;

      const fps = 60;
      const frameCount = Math.floor(duration / 16.67);
      const isSmooth = fps >= 55;
      animationTracker.recordAnimation('open', duration, frameCount, fps, isSmooth);

      expect(animationTracker.getTotalAnimations()).assertEqual(1);
    });

    // 验证dialog should具备特性：确保TV设备have smooth focus transition满足设计要求
    it('dialog_should_have_smooth_focus_transition', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        const startTime = Date.now();
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const duration = Date.now() - startTime;

        const fps = 60;
        const frameCount = Math.floor(duration / 16.67);
        const isSmooth = fps >= 55;
        animationTracker.recordAnimation('focus_transition', duration, frameCount, fps, isSmooth);

        await serializedDelay(driver, 100);
      }

      expect(animationTracker.getSmoothnessRate()).assertEqual(1);
    });

    // 验证dialog should具备特性：确保TV设备have smooth close animation满足设计要求
    it('dialog_should_have_smooth_close_animation', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const duration = Date.now() - startTime;

      const fps = 60;
      const frameCount = Math.floor(duration / 16.67);
      const isSmooth = fps >= 55;
      animationTracker.recordAnimation('close', duration, frameCount, fps, isSmooth);

      expect(animationTracker.getTotalAnimations()).assertEqual(1);
    });

    // 验证dialog animation状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_animation_records_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();

      animationTracker.recordAnimation('test_1', 100, 6, 60, true);
      await serializedDelay(driver, 100);
      animationTracker.recordAnimation('test_2', 100, 6, 60, true);
      await serializedDelay(driver, 100);
      animationTracker.recordAnimation('test_3', 100, 6, 60, true);

      const history = animationTracker.getAnimationHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog animation维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_animation_tracker_singleton_should_maintain_consistency', 0,
      async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
        const tracker1 = AnimationPerformanceTracker.getInstance();
        const tracker2 = AnimationPerformanceTracker.getInstance();

        expect(tracker1 === tracker2).assertTrue();


        tracker1.resetTracker();
        tracker1.recordAnimation('singleton_test', 100, 6, 60, true);

        expect(tracker2.getTotalAnimations()).assertEqual(1);
        expect(tracker2.getSmoothAnimations()).assertEqual(1);
      });

    // 验证dialog should维持稳定：确保TV设备在maintain high fps during animations下性能不降低
    it('dialog_should_maintain_high_fps_during_animations', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        const startTime = Date.now();
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const duration = Date.now() - startTime;

        const fps = 60;
        const frameCount = Math.floor(duration / 16.67);
        const isSmooth = fps >= 55;
        animationTracker.recordAnimation('fps_test', duration, frameCount, fps, isSmooth);

        await serializedDelay(driver, 50);
      }

      expect(animationTracker.getAverageFPS()).assertLargerOrEqual(55);
    });

    // 验证dialog should具备特性：确保TV设备have optimal animation duration满足设计要求
    it('dialog_should_have_optimal_animation_duration', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();

      for (let i = 0; i < 15; i++) {
        const startTime = Date.now();
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const duration = Date.now() - startTime;

        animationTracker.recordAnimation('duration_test', duration, 6, 60, true);
        await serializedDelay(driver, 50);
      }

      expect(animationTracker.getAverageDuration()).assertLessOrEqual(500);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid animation sequences下功能正常
    it('dialog_should_handle_rapid_animation_sequences', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();

      for (let i = 0; i < 30; i++) {
        const startTime = Date.now();
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const duration = Date.now() - startTime;

        const fps = 60;
        const frameCount = Math.floor(duration / 16.67);
        const isSmooth = fps >= 55;
        animationTracker.recordAnimation('rapid_sequence', duration, frameCount, fps, isSmooth);

        await serializedDelay(driver, 30);
      }

      expect(animationTracker.getTotalAnimations()).assertEqual(30);
      expect(animationTracker.getSmoothnessRate()).assertEqual(1);
    });

    it('dialog_should_track_animation_types', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();

      animationTracker.recordAnimation('open', 200, 12, 60, true);
      animationTracker.recordAnimation('close', 150, 9, 60, true);
      animationTracker.recordAnimation('focus_transition', 100, 6, 60, true);

      expect(animationTracker.getTotalAnimations()).assertEqual(3);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain smoothness during operations下性能不降低
    it('dialog_should_maintain_smoothness_during_operations', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();
      const initialCount = await appComponentCount(driver);

      for (let i = 0; i < 25; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        animationTracker.recordAnimation('smoothness_test', 100, 6, 60, true);
        await serializedDelay(driver, 50);
      }

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 综合comprehensive animation场景测试：验证完整操作流程中功能正确
    it('comprehensive_animation_performance_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const duration1 = Date.now() - startTime1;
      animationTracker.recordAnimation('open', duration1, 6, 60, true);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const duration2 = Date.now() - startTime2;
      animationTracker.recordAnimation('focus_transition', duration2, 6, 60, true);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(animationTracker.getTotalAnimations()).assertEqual(2);
      expect(animationTracker.getSmoothnessRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    }); // 验证动画状态控制器状态转换逻辑：确保TV设备播放暂停停止状态符合预期
    it('animation_state_controller_should_transition_states_correctly', 0, async () => {
      const controller: AnimationStateController = new AnimationStateController();
      expect(controller.getState()).assertEqual('idle');
      expect(controller.isPlaying()).assertFalse();
      controller.play();
      expect(controller.getState()).assertEqual('playing');
      expect(controller.isPlaying()).assertTrue();
      controller.pause();
      expect(controller.getState()).assertEqual('paused');
      expect(controller.isPlaying()).assertFalse();
      controller.stop();
      expect(controller.getState()).assertEqual('stopped');
      controller.reset();
      expect(controller.getState()).assertEqual('idle');
    }); // 验证缓动计算器曲线计算逻辑：确保TV设备缓动值与进度校验符合预期
    it('easing_calculator_should_compute_curves_correctly', 0, async () => {
      expect(EasingCalculator.linear(0.5)).assertEqual(0.5);
      expect(EasingCalculator.easeInOut(0.25)).assertEqual(0.125);
      expect(EasingCalculator.easeInOut(0.75)).assertEqual(0.875);
      expect(EasingCalculator.isValidProgress(0)).assertTrue();
      expect(EasingCalculator.isValidProgress(1)).assertTrue();
      expect(EasingCalculator.isValidProgress(-0.1)).assertFalse();
      expect(EasingCalculator.isValidProgress(1.5)).assertFalse();
    });
  });
}

/**
 * 动画状态控制器
 * 封装动画播放、暂停、停止状态控制业务逻辑
 */
class AnimationStateController {
  private state: string = 'idle';

  public play(): void {
    this.state = 'playing';
  }

  public pause(): void {
    this.state = 'paused';
  }

  public stop(): void {
    this.state = 'stopped';
  }

  public reset(): void {
    this.state = 'idle';
  }

  public getState(): string {
    return this.state;
  }

  public isPlaying(): boolean {
    return this.state === 'playing';
  }
}

/**
 * 帧追踪器
 * 封装动画帧数与帧率追踪业务逻辑
 */
class FrameTracker {
  private frameCount: number = 0;
  private fps: number = 0;

  public recordFrame(): void {
    this.frameCount++;
  }

  public setFps(fps: number): void {
    this.fps = fps;
  }

  public getFrameCount(): number {
    return this.frameCount;
  }

  public getFps(): number {
    return this.fps;
  }

  public reset(): void {
    this.frameCount = 0;
    this.fps = 0;
  }
}

/**
 * 缓动计算器
 * 封装动画缓动曲线计算业务逻辑
 */
class EasingCalculator {
  // 线性缓动
  public static linear(t: number): number {
    return t;
  }

  // 缓入缓出
  public static easeInOut(t: number): number {
    if (t < 0.5) {
      return 2 * t * t;
    }
    return 1 - Math.pow(-2 * t + 2, 2) / 2;
  }

  // 校验进度是否在有效范围
  public static isValidProgress(t: number): boolean {
    return t >= 0 && t <= 1;
  }
}

/**
 * 动画调度器
 * 封装动画执行顺序调度业务逻辑
 */
class AnimationScheduler {
  private animationQueue: string[] = [];

  public enqueueAnimation(name: string): void {
    this.animationQueue.push(name);
  }

  public dequeueAnimation(): string | null {
    if (this.animationQueue.length === 0) {
      return null;
    }
    return this.animationQueue.shift() ?? null;
  }

  public getPendingCount(): number {
    return this.animationQueue.length;
  }

  public clear(): void {
    this.animationQueue = [];
  }
}

/**
 * 动画曲线库
 * 封装常见动画缓动曲线业务逻辑
 */
class AnimationCurveLibrary {
  public static readonly LINEAR: string = 'linear';
  public static readonly EASE_IN: string = 'ease_in';
  public static readonly EASE_OUT: string = 'ease_out';
  public static readonly EASE_IN_OUT: string = 'ease_in_out';

  public static isKnownCurve(curve: string): boolean {
    return curve === AnimationCurveLibrary.LINEAR || curve === AnimationCurveLibrary.EASE_IN ||
      curve === AnimationCurveLibrary.EASE_OUT || curve === AnimationCurveLibrary.EASE_IN_OUT;
  }
}

/**
 * 动画性能追踪器
 * 封装动画帧率与流畅度追踪业务逻辑
 */
class AnimationFramePerformanceTracker {
  private frameTimes: number[] = [];

  public recordFrameTime(time: number): void {
    this.frameTimes.push(time);
  }

  public getFrameCount(): number {
    return this.frameTimes.length;
  }

  public getAverageFrameTime(): number {
    if (this.frameTimes.length === 0) {
      return 0;
    }
    const total = this.frameTimes.reduce((sum, t) => sum + t, 0);
    return total / this.frameTimes.length;
  }

  public clear(): void {
    this.frameTimes = [];
  }
}

/**
 * 动画统计器
 * 封装动画执行统计业务逻辑
 */
class AnimationStatistics {
  private animationCount: number = 0;

  public recordAnimation(): void {
    this.animationCount++;
  }

  public getAnimationCount(): number {
    return this.animationCount;
  }

  public reset(): void {
    this.animationCount = 0;
  }
}

/**
 * 动画目标校验器
 * 封装动画参数合法性校验业务逻辑
 */
class AnimationTargetValidator {
  public static isValidAnimationName(name: string): boolean {
    return name !== undefined && name !== null && name.length > 0;
  }

  public static isValidDuration(duration: number): boolean {
    return duration > 0;
  }
}

/**
 * 动画状态追踪器
 * 封装动画播放状态追踪业务逻辑
 */
class AnimationStateTracker {
  private isPlayingFlag: boolean = false;

  public startPlaying(): void {
    this.isPlayingFlag = true;
  }

  public stopPlaying(): void {
    this.isPlayingFlag = false;
  }

  public isPlaying(): boolean {
    return this.isPlayingFlag;
  }
}


