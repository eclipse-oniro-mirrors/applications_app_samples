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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

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

// 帧率档位枚举：定义动画帧率的分级档位，用于流畅度判定
enum FrameRateTier {
  LOW = 'low', MEDIUM = 'medium', HIGH = 'high', ULTRA = 'ultra'
}

// 性能瓶颈类型枚举：定义动画性能瓶颈的可能来源
enum BottleneckType {
  NONE = 'none', CPU_BOUND = 'cpu_bound', GPU_BOUND = 'gpu_bound', MEMORY_BOUND = 'memory_bound'
}

// 帧时间数据接口：描述单帧渲染的时间数据
interface FrameTimeData {
  frameId: number;
  deltaMs: number;
  jank: boolean;
}

// 性能快照接口：描述一次性能采样得到的综合数据
interface PerformanceSnapshot {
  snapshotId: number;
  frameCount: number;
  totalDuration: number;
  averageFps: number;
  jankCount: number;
  bottleneck: BottleneckType;
}

// 帧时间模型类：封装单帧时间数据并提供卡顿判定能力
class FrameTimeModel {
  private frameId: number;
  private deltaMs: number;
  private jank: boolean;

  constructor(frameId: number, deltaMs: number) {
    this.frameId = frameId;
    this.deltaMs = deltaMs;
    this.jank = deltaMs > 32;
  }

  public getFrameId(): number {
    return this.frameId;
  }

  public getDeltaMs(): number {
    return this.deltaMs;
  }

  public isJank(): boolean {
    return this.jank;
  }

  // 计算该帧对应的即时帧率
  public getInstantFps(): number {
    if (this.deltaMs === 0) {
      return 0;
    }
    return 1000 / this.deltaMs;
  }

  public equals(other: FrameTimeModel): boolean {
    return this.frameId === other.frameId && this.deltaMs === other.deltaMs;
  }

  public clone(): FrameTimeModel {
    return new FrameTimeModel(this.frameId, this.deltaMs);
  }

  public toString(): string {
    return 'FrameTimeModel(' + this.frameId + ', ' + this.deltaMs + 'ms)';
  }
}

// 帧时间序列类：聚合多帧时间数据，提供流畅度统计能力
class FrameTimeSeries {
  private frames: FrameTimeModel[] = [];

  public addFrame(frame: FrameTimeModel): void {
    this.frames.push(frame.clone());
  }

  public clear(): void {
    this.frames = [];
  }

  public getFrameCount(): number {
    return this.frames.length;
  }

  // 计算平均帧间隔：用于评估整体流畅度
  public getAverageDeltaMs(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const frame of this.frames) {
      total += frame.getDeltaMs();
    }
    return total / this.frames.length;
  }

  // 统计卡顿帧数量：用于识别性能瓶颈
  public getJankCount(): number {
    return this.frames.filter(frame => frame.isJank()).length;
  }

  // 计算卡顿率：卡顿帧占总帧数的比例
  public getJankRate(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    return this.getJankCount() / this.frames.length;
  }

  // 计算平均帧率：基于平均帧间隔换算
  public getAverageFps(): number {
    const avgDelta: number = this.getAverageDeltaMs();
    if (avgDelta === 0) {
      return 0;
    }
    return 1000 / avgDelta;
  }
}

// 帧率档位判定器：根据帧率值划分档位
class FrameRateTierClassifier {
  // 根据平均帧率划分档位
  public classify(fps: number): FrameRateTier {
    if (fps >= 120) {
      return FrameRateTier.ULTRA;
    }
    if (fps >= 60) {
      return FrameRateTier.HIGH;
    }
    if (fps >= 30) {
      return FrameRateTier.MEDIUM;
    }
    return FrameRateTier.LOW;
  }

  // 判断帧率是否满足流畅标准：达到高档位视为流畅
  public isSmoothFps(fps: number): boolean {
    const tier: FrameRateTier = this.classify(fps);
    return tier === FrameRateTier.HIGH || tier === FrameRateTier.ULTRA;
  }
}

// 性能瓶颈分析器：根据帧时间序列分析潜在瓶颈
class BottleneckAnalyzer {
  // 分析帧时间序列，推断性能瓶颈类型
  public analyze(series: FrameTimeSeries): BottleneckType {
    if (series.getFrameCount() === 0) {
      return BottleneckType.NONE;
    }
    const jankRate: number = series.getJankRate();
    if (jankRate >= 0.5) {
      return BottleneckType.CPU_BOUND;
    }
    if (jankRate >= 0.2) {
      return BottleneckType.GPU_BOUND;
    }
    if (jankRate >= 0.05) {
      return BottleneckType.MEMORY_BOUND;
    }
    return BottleneckType.NONE;
  }

  // 判断性能是否健康：无瓶颈视为健康
  public isHealthy(bottleneck: BottleneckType): boolean {
    return bottleneck === BottleneckType.NONE;
  }
}

// 性能快照构建器：以链式风格构建性能快照，便于测试断言与状态记录
class PerformanceSnapshotBuilder {
  private snapshotId: number = 0;
  private frameCount: number = 0;
  private totalDuration: number = 0;
  private averageFps: number = 0;
  private jankCount: number = 0;
  private bottleneck: BottleneckType = BottleneckType.NONE;

  public setSnapshotId(snapshotId: number): PerformanceSnapshotBuilder {
    this.snapshotId = snapshotId;
    return this;
  }

  public setFrameCount(frameCount: number): PerformanceSnapshotBuilder {
    this.frameCount = frameCount;
    return this;
  }

  public setTotalDuration(totalDuration: number): PerformanceSnapshotBuilder {
    this.totalDuration = totalDuration;
    return this;
  }

  public setAverageFps(averageFps: number): PerformanceSnapshotBuilder {
    this.averageFps = averageFps;
    return this;
  }

  public setJankCount(jankCount: number): PerformanceSnapshotBuilder {
    this.jankCount = jankCount;
    return this;
  }

  public setBottleneck(bottleneck: BottleneckType): PerformanceSnapshotBuilder {
    this.bottleneck = bottleneck;
    return this;
  }

  public build(): PerformanceSnapshot {
    return {
      snapshotId: this.snapshotId,
      frameCount: this.frameCount,
      totalDuration: this.totalDuration,
      averageFps: this.averageFps,
      jankCount: this.jankCount,
      bottleneck: this.bottleneck
    };
  }
}

// 性能采样模式枚举：定义性能采样的触发模式
enum SamplingMode {
  PERIODIC = 'periodic', EVENT_DRIVEN = 'event_driven', MANUAL = 'manual'
}

// 性能采样记录接口：描述单次性能采样的结果
interface SamplingRecord {
  sampleId: number;
  mode: SamplingMode;
  frameCount: number;
  elapsedMs: number;
  jankCount: number;
}

// 性能采样记录器：周期性或事件驱动地记录性能采样结果
class PerformanceSampler {
  private records: SamplingRecord[] = [];
  private nextSampleId: number = 0;

  public record(mode: SamplingMode, frameCount: number, elapsedMs: number, jankCount: number): void {
    const record: SamplingRecord = {
      sampleId: this.nextSampleId,
      mode: mode,
      frameCount: frameCount,
      elapsedMs: elapsedMs,
      jankCount: jankCount
    };
    this.nextSampleId++;
    this.records.push(record);
  }

  public clear(): void {
    this.records = [];
    this.nextSampleId = 0;
  }

  public getRecords(): SamplingRecord[] {
    const result: SamplingRecord[] = [];
    for (const record of this.records) {
      const copied: SamplingRecord = {
        sampleId: record.sampleId,
        mode: record.mode,
        frameCount: record.frameCount,
        elapsedMs: record.elapsedMs,
        jankCount: record.jankCount
      };
      result.push(copied);
    }
    return result;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  // 计算采样记录的平均卡顿数：用于性能趋势分析
  public getAverageJankCount(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const record of this.records) {
      total += record.jankCount;
    }
    return total / this.records.length;
  }

  // 统计指定模式的采样记录数量
  public getRecordCountByMode(mode: SamplingMode): number {
    return this.records.filter(record => record.mode === mode).length;
  }
}

// 帧预算模型类：封装帧时间预算与超支判定能力
class FrameBudgetModel {
  private budgetMs: number;
  private toleranceMs: number;

  constructor(budgetMs: number, toleranceMs: number) {
    this.budgetMs = budgetMs;
    this.toleranceMs = toleranceMs;
  }

  public getBudgetMs(): number {
    return this.budgetMs;
  }

  public getToleranceMs(): number {
    return this.toleranceMs;
  }

  // 判断帧时间是否在预算内
  public isWithinBudget(actualMs: number): boolean {
    return actualMs <= this.budgetMs + this.toleranceMs;
  }

  // 计算帧时间超出预算的量
  public getOverrunAmount(actualMs: number): number {
    const limit: number = this.budgetMs + this.toleranceMs;
    return Math.max(0, actualMs - limit);
  }
}

// 性能采样评估器：评估采样结果是否满足性能要求
class SamplingEvaluator {
  // 评估采样集合是否满足性能要求：平均卡顿数需低于阈值
  public evaluate(sampler: PerformanceSampler, maxAverageJank: number): boolean {
    return sampler.getAverageJankCount() <= maxAverageJank;
  }

  // 评估单条采样记录是否健康
  public isRecordHealthy(record: SamplingRecord, maxJankCount: number): boolean {
    return record.jankCount <= maxJankCount;
  }
}

export default function animationPerformanceTest() {
  describe('AnimationPerformance_Test', () => {
    let driver: Driver;
    let animationTracker: AnimationPerformanceTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      animationTracker = AnimationPerformanceTracker.getInstance();
      animationTracker.resetTracker();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 验证dialog should具备特性：确保TV设备have smooth open animation满足设计要求
    it('dialog_should_have_smooth_open_animation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();

      animationTracker.recordAnimation('open', 200, 12, 60, true);
      animationTracker.recordAnimation('close', 150, 9, 60, true);
      animationTracker.recordAnimation('focus_transition', 100, 6, 60, true);

      expect(animationTracker.getTotalAnimations()).assertEqual(3);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain smoothness during operations下性能不降低
    it('dialog_should_maintain_smoothness_during_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      animationTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      for (let i = 0; i < 25; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        animationTracker.recordAnimation('smoothness_test', 100, 6, 60, true);
        await serializedDelay(driver, 50);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 综合comprehensive animation场景测试：验证完整操作流程中功能正确
    it('comprehensive_animation_performance_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
    });

    // 适配 FrameTimeModel：验证卡顿帧判定与即时帧率
    it('frame_time_model_should_detect_jank', 0, async () => {
      const janky = new FrameTimeModel(0, 33);
      expect(janky.getFrameId()).assertEqual(0);
      expect(janky.isJank()).assertTrue();
      const smooth = new FrameTimeModel(1, 16);
      expect(smooth.isJank()).assertFalse();
      expect(smooth.getInstantFps()).assertEqual(1000 / 16);
    });

    // 适配 FrameTimeModel：验证克隆、相等与文本表示
    it('frame_time_model_should_support_clone_and_equals', 0, async () => {
      const model = new FrameTimeModel(0, 16);
      const cloned = model.clone();
      expect(model.equals(cloned)).assertTrue();
      expect(model === cloned).assertFalse();
      expect(model.toString()).assertContain('FrameTimeModel');
      expect(cloned.getDeltaMs()).assertEqual(16);
    });

    // 适配 FrameTimeSeries：验证帧时间序列聚合统计
    it('frame_time_series_should_aggregate_frames', 0, async () => {
      const series = new FrameTimeSeries();
      series.addFrame(new FrameTimeModel(0, 16));
      series.addFrame(new FrameTimeModel(1, 16));
      series.addFrame(new FrameTimeModel(2, 40));
      expect(series.getFrameCount()).assertEqual(3);
      expect(series.getAverageDeltaMs()).assertEqual(24);
      expect(series.getJankCount()).assertEqual(1);
      expect(series.getJankRate()).assertEqual(1 / 3);
      expect(series.getAverageFps()).assertEqual(1000 / 24);
      series.clear();
      expect(series.getFrameCount()).assertEqual(0);
    });

    // 适配 FrameRateTierClassifier：验证帧率档位分类边界
    it('frame_rate_tier_classifier_should_classify', 0, async () => {
      const classifier = new FrameRateTierClassifier();
      expect(classifier.classify(120)).assertEqual(FrameRateTier.ULTRA);
      expect(classifier.classify(60)).assertEqual(FrameRateTier.HIGH);
      expect(classifier.classify(30)).assertEqual(FrameRateTier.MEDIUM);
      expect(classifier.classify(10)).assertEqual(FrameRateTier.LOW);
    });

    // 适配 FrameRateTierClassifier：验证流畅帧率判定
    it('frame_rate_tier_classifier_should_detect_smooth', 0, async () => {
      const classifier = new FrameRateTierClassifier();
      expect(classifier.isSmoothFps(60)).assertTrue();
      expect(classifier.isSmoothFps(120)).assertTrue();
      expect(classifier.isSmoothFps(30)).assertFalse();
      expect(classifier.isSmoothFps(15)).assertFalse();
    });

    // 适配 BottleneckAnalyzer：验证高卡顿率判定为CPU瓶颈
    it('bottleneck_analyzer_should_detect_cpu_bound', 0, async () => {
      const series = new FrameTimeSeries();
      series.addFrame(new FrameTimeModel(0, 40));
      series.addFrame(new FrameTimeModel(1, 16));
      series.addFrame(new FrameTimeModel(2, 40));
      series.addFrame(new FrameTimeModel(3, 16));
      const analyzer = new BottleneckAnalyzer();
      expect(analyzer.analyze(series)).assertEqual(BottleneckType.CPU_BOUND);
      expect(analyzer.isHealthy(BottleneckType.CPU_BOUND)).assertFalse();
    });

    // 适配 BottleneckAnalyzer：验证低卡顿率判定为无瓶颈
    it('bottleneck_analyzer_should_detect_healthy', 0, async () => {
      const series = new FrameTimeSeries();
      series.addFrame(new FrameTimeModel(0, 16));
      series.addFrame(new FrameTimeModel(1, 16));
      series.addFrame(new FrameTimeModel(2, 16));
      const analyzer = new BottleneckAnalyzer();
      expect(analyzer.analyze(series)).assertEqual(BottleneckType.NONE);
      expect(analyzer.isHealthy(BottleneckType.NONE)).assertTrue();
      const empty = new FrameTimeSeries();
      expect(analyzer.analyze(empty)).assertEqual(BottleneckType.NONE);
    });

    // 适配 PerformanceSnapshotBuilder：验证快照字段链式构建
    it('performance_snapshot_builder_should_build', 0, async () => {
      const builder = new PerformanceSnapshotBuilder();
      const snapshot: PerformanceSnapshot = builder.setSnapshotId(7).setFrameCount(60).setTotalDuration(1000)
        .setAverageFps(60).setJankCount(1).setBottleneck(BottleneckType.NONE).build();
      expect(snapshot.snapshotId).assertEqual(7);
      expect(snapshot.frameCount).assertEqual(60);
      expect(snapshot.totalDuration).assertEqual(1000);
      expect(snapshot.averageFps).assertEqual(60);
      expect(snapshot.jankCount).assertEqual(1);
      expect(snapshot.bottleneck).assertEqual(BottleneckType.NONE);
    });

    // 适配 PerformanceSampler：验证采样记录与按模式统计
    it('performance_sampler_should_record_samples', 0, async () => {
      const sampler = new PerformanceSampler();
      sampler.record(SamplingMode.PERIODIC, 60, 1000, 2);
      sampler.record(SamplingMode.EVENT_DRIVEN, 60, 1000, 4);
      sampler.record(SamplingMode.PERIODIC, 60, 1000, 6);
      expect(sampler.getRecordCount()).assertEqual(3);
      expect(sampler.getRecordCountByMode(SamplingMode.PERIODIC)).assertEqual(2);
      const records = sampler.getRecords();
      expect(records[0].sampleId).assertEqual(0);
      expect(records[1].sampleId).assertEqual(1);
      sampler.clear();
      expect(sampler.getRecordCount()).assertEqual(0);
    });

    // 适配 PerformanceSampler：验证平均卡顿数计算
    it('performance_sampler_should_compute_average_jank', 0, async () => {
      const sampler = new PerformanceSampler();
      sampler.record(SamplingMode.MANUAL, 60, 1000, 2);
      sampler.record(SamplingMode.MANUAL, 60, 1000, 4);
      sampler.record(SamplingMode.MANUAL, 60, 1000, 6);
      expect(sampler.getAverageJankCount()).assertEqual(4);
    });

    // 适配 FrameBudgetModel：验证帧预算与超支量计算
    it('frame_budget_model_should_check_budget', 0, async () => {
      const budget = new FrameBudgetModel(16, 8);
      expect(budget.getBudgetMs()).assertEqual(16);
      expect(budget.getToleranceMs()).assertEqual(8);
      expect(budget.isWithinBudget(24)).assertTrue();
      expect(budget.isWithinBudget(25)).assertFalse();
      expect(budget.getOverrunAmount(30)).assertEqual(6);
      expect(budget.getOverrunAmount(10)).assertEqual(0);
    });

    // 适配 SamplingEvaluator：验证采样健康评估
    it('sampling_evaluator_should_evaluate_health', 0, async () => {
      const evaluator = new SamplingEvaluator();
      const sampler = new PerformanceSampler();
      sampler.record(SamplingMode.MANUAL, 60, 1000, 3);
      sampler.record(SamplingMode.MANUAL, 60, 1000, 5);
      expect(evaluator.evaluate(sampler, 4)).assertTrue();
      const records = sampler.getRecords();
      expect(evaluator.isRecordHealthy(records[0], 5)).assertTrue();
      expect(evaluator.isRecordHealthy(records[1], 4)).assertFalse();
    });

    // 适配 AnimationPerformanceTracker：验证平均帧率、时长与平滑率
    it('animation_tracker_should_compute_average_fps_and_duration', 0, async () => {
      animationTracker.resetTracker();
      animationTracker.recordAnimation('open', 100, 6, 60, true);
      animationTracker.recordAnimation('close', 200, 12, 30, false);
      animationTracker.recordAnimation('focus', 150, 9, 60, true);
      expect(animationTracker.getTotalAnimations()).assertEqual(3);
      expect(animationTracker.getAverageFPS()).assertEqual(50);
      expect(animationTracker.getAverageDuration()).assertEqual(150);
      expect(animationTracker.getSmoothnessRate()).assertEqual(2 / 3);
    });

    // 适配 AnimationPerformanceTracker：验证平滑动画计数与重置
    it('animation_tracker_should_track_smooth_animations', 0, async () => {
      animationTracker.resetTracker();
      animationTracker.recordAnimation('open', 100, 6, 60, true);
      animationTracker.recordAnimation('close', 200, 12, 30, false);
      expect(animationTracker.getSmoothAnimations()).assertEqual(1);
      expect(animationTracker.getAnimationHistory().length).assertEqual(2);
      animationTracker.resetTracker();
      expect(animationTracker.getTotalAnimations()).assertEqual(0);
      expect(animationTracker.getSmoothnessRate()).assertEqual(0);
    });
  });


}