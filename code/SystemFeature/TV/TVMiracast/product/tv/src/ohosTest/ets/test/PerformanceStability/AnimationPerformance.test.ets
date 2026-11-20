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
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  miracastComponentCount,
  isPermissionDialogVisible,
  waitForPageStable,
  pressAndWait,
  triggerMiracastHome,
  serializedDelay,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'AnimationPerformanceSuite';

// ===== 领域模型（本地 Mock，纯逻辑，不依赖业务源码） =====

// 动画类型枚举：授权浮窗淡入淡出与多路宫格布局切换均属于本套件关注范围
enum AnimationKind {
  PERMISSION_FADE_IN = 'permission_fade_in',
  PERMISSION_FADE_OUT = 'permission_fade_out',
  TILE_LAYOUT_TRANSITION = 'tile_layout_transition',
  FOCUS_RING_MOVE = 'focus_ring_move',
  FULLSCREEN_TOGGLE = 'fullscreen_toggle'
}

// 帧率档位枚举：以平均帧率划分档位，作为流畅度结论的依据
enum FrameRateTier {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high',
  ULTRA = 'ultra'
}

// 瓶颈归因枚举：卡顿率越高，越倾向于 CPU/GPU 侧瓶颈
enum BottleneckKind {
  NONE = 'none',
  CPU_BOUND = 'cpu_bound',
  GPU_BOUND = 'gpu_bound',
  MEMORY_BOUND = 'memory_bound'
}

// 单帧采样接口：记录帧序号、帧间隔与所属动画类型
interface FrameSample {
  frameId: number;
  deltaMs: number;
  kind: AnimationKind;
}

interface AnimationEvent {
  kind: AnimationKind;
  durationMs: number;
  frameCount: number;
  fps: number;
  smooth: boolean;
  timestamp: number;
}

interface AnimationSnapshot {
  total: number;
  smoothCount: number;
  averageFps: number;
  averageDuration: number;
  bottleneck: BottleneckKind;
}

class FrameSequenceModel {
  private frames: Array<FrameSample> = [];

  public addFrame(frame: FrameSample): void {
    const copy: FrameSample = {
      frameId: frame.frameId,
      deltaMs: frame.deltaMs,
      kind: frame.kind
    };
    this.frames.push(copy);
  }

  public getFrameCount(): number {
    return this.frames.length;
  }

  public getFrames(): Array<FrameSample> {
    const result: Array<FrameSample> = [];
    for (let i = 0; i < this.frames.length; i++) {
      result.push(this.frames[i]);
    }
    return result;
  }

  public getTotalDeltaMs(): number {
    let total: number = 0;
    for (let i = 0; i < this.frames.length; i++) {
      total += this.frames[i].deltaMs;
    }
    return total;
  }

  public getAverageDeltaMs(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    return this.getTotalDeltaMs() / this.frames.length;
  }

  public getJankCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.frames.length; i++) {
      if (this.frames[i].deltaMs > 32) {
        count++;
      }
    }
    return count;
  }

  public getJankRate(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    return this.getJankCount() / this.frames.length;
  }

  public getAverageFps(): number {
    const average: number = this.getAverageDeltaMs();
    if (average === 0) {
      return 0;
    }
    return 1000 / average;
  }

  public getMaxDeltaMs(): number {
    let peak: number = 0;
    for (let i = 0; i < this.frames.length; i++) {
      if (this.frames[i].deltaMs > peak) {
        peak = this.frames[i].deltaMs;
      }
    }
    return peak;
  }

  public getCountByKind(kind: AnimationKind): number {
    let count: number = 0;
    for (let i = 0; i < this.frames.length; i++) {
      if (this.frames[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.frames.length; i++) {
      if (this.frames[i].frameId < this.frames[i - 1].frameId) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.frames = [];
  }
}

class AnimationRecorder {
  private static instance: AnimationRecorder | null = null;
  private events: Array<AnimationEvent> = [];

  public static getInstance(): AnimationRecorder {
    if (AnimationRecorder.instance === null) {
      AnimationRecorder.instance = new AnimationRecorder();
    }
    return AnimationRecorder.instance;
  }

  public record(kind: AnimationKind, durationMs: number, frameCount: number, fps: number,
    smooth: boolean): void {
    const event: AnimationEvent = {
      kind: kind,
      durationMs: durationMs,
      frameCount: frameCount,
      fps: fps,
      smooth: smooth,
      timestamp: Date.now()
    };
    this.events.push(event);
  }

  public getEvents(): Array<AnimationEvent> {
    const result: Array<AnimationEvent> = [];
    for (let i = 0; i < this.events.length; i++) {
      result.push(this.events[i]);
    }
    return result;
  }

  public getTotal(): number {
    return this.events.length;
  }

  public getSmoothCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].smooth) {
        count++;
      }
    }
    return count;
  }

  public getAverageFps(): number {
    if (this.events.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      total += this.events[i].fps;
    }
    return total / this.events.length;
  }

  public getAverageDuration(): number {
    if (this.events.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      total += this.events[i].durationMs;
    }
    return total / this.events.length;
  }

  public getSmoothRate(): number {
    if (this.events.length === 0) {
      return 0;
    }
    return this.getSmoothCount() / this.events.length;
  }

  public getCountByKind(kind: AnimationKind): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.events.length; i++) {
      if (this.events[i].timestamp < this.events[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.events = [];
  }
}

// 帧预算注册表：集中登记各类动画的预算，支持查询与覆盖
// 帧率档位分类器：把平均帧率映射为档位并给出流畅结论
class FrameRateClassifier {
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

  public isSmooth(fps: number): boolean {
    const tier: FrameRateTier = this.classify(fps);
    return tier === FrameRateTier.HIGH || tier === FrameRateTier.ULTRA;
  }

  public describe(tier: FrameRateTier): string {
    if (tier === FrameRateTier.ULTRA) {
      return 'ultra';
    }
    if (tier === FrameRateTier.HIGH) {
      return 'high';
    }
    if (tier === FrameRateTier.MEDIUM) {
      return 'medium';
    }
    return 'low';
  }
}

// 动画分析器：依据卡顿率推断瓶颈归因，并输出快照
class AnimationAnalyzer {
  private classifier: FrameRateClassifier = new FrameRateClassifier();

  public detectBottleneck(sequence: FrameSequenceModel): BottleneckKind {
    if (sequence.getFrameCount() === 0) {
      return BottleneckKind.NONE;
    }
    const jankRate: number = sequence.getJankRate();
    if (jankRate >= 0.5) {
      return BottleneckKind.CPU_BOUND;
    }
    if (jankRate >= 0.2) {
      return BottleneckKind.GPU_BOUND;
    }
    if (jankRate >= 0.05) {
      return BottleneckKind.MEMORY_BOUND;
    }
    return BottleneckKind.NONE;
  }

  public isHealthy(bottleneck: BottleneckKind): boolean {
    return bottleneck === BottleneckKind.NONE;
  }

  public buildSnapshot(recorder: AnimationRecorder, sequence: FrameSequenceModel): AnimationSnapshot {
    const snapshot: AnimationSnapshot = {
      total: recorder.getTotal(),
      smoothCount: recorder.getSmoothCount(),
      averageFps: recorder.getAverageFps(),
      averageDuration: recorder.getAverageDuration(),
      bottleneck: this.detectBottleneck(sequence)
    };
    return snapshot;
  }

  public isSmoothAnimation(fps: number, jankFrames: number, allowedJank: number): boolean {
    return this.classifier.isSmooth(fps) && jankFrames <= allowedJank;
  }

  public describeBottleneck(bottleneck: BottleneckKind): string {
    if (bottleneck === BottleneckKind.CPU_BOUND) {
      return 'cpu';
    }
    if (bottleneck === BottleneckKind.GPU_BOUND) {
      return 'gpu';
    }
    if (bottleneck === BottleneckKind.MEMORY_BOUND) {
      return 'memory';
    }
    return 'none';
  }
}

// 动画统计器：对帧间隔数组做基础统计，供用例直接断言
// 动画调度器：串行排队播放动画，保证浮窗淡入淡出与宫格切换不互相抢占
export default function animationPerformanceSuite(): void {
  describe('AnimationPerformance_Suite', () => {
    let driver: Driver;
    let recorder: AnimationRecorder;

    beforeAll(async () => {
      driver = getDriver();
      recorder = AnimationRecorder.getInstance();
      recorder.reset();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('recorder_should_count_focus_ring_events', 0, async () => {
      const recorder = AnimationRecorder.getInstance();
      recorder.reset();
      recorder.record(AnimationKind.FOCUS_RING_MOVE, 90, 3, 60, true);
      recorder.record(AnimationKind.FOCUS_RING_MOVE, 100, 4, 55, true);
      expect(recorder.getCountByKind(AnimationKind.FOCUS_RING_MOVE)).assertEqual(2);
      expect(recorder.getAverageFps()).assertEqual(57.5);
    });


    // 授权浮窗探测不应影响首页渲染：探测前后组件数保持稳定

    // 帧序列应正确统计平均帧间隔与卡顿率
    it('frame_sequence_should_compute_jank_rate', 0, async () => {
      const sequence = new FrameSequenceModel();
      const first: FrameSample = {
        frameId: 0,
        deltaMs: 16,
        kind: AnimationKind.PERMISSION_FADE_IN
      };
      const second: FrameSample = {
        frameId: 1,
        deltaMs: 16,
        kind: AnimationKind.PERMISSION_FADE_IN
      };
      const third: FrameSample = {
        frameId: 2,
        deltaMs: 40,
        kind: AnimationKind.PERMISSION_FADE_IN
      };
      sequence.addFrame(first);
      sequence.addFrame(second);
      sequence.addFrame(third);
      expect(sequence.getFrameCount()).assertEqual(3);
      expect(sequence.getTotalDeltaMs()).assertEqual(72);
      expect(sequence.getAverageDeltaMs()).assertEqual(24);
      expect(sequence.getJankCount()).assertEqual(1);
      expect(sequence.getJankRate()).assertEqual(1 / 3);
      expect(sequence.getMaxDeltaMs()).assertEqual(40);
    });

    // 帧序列的等效帧率应由平均帧间隔换算得到
    it('frame_sequence_should_convert_delta_to_fps', 0, async () => {
      const sequence = new FrameSequenceModel();
      const frame: FrameSample = {
        frameId: 0,
        deltaMs: 20,
        kind: AnimationKind.TILE_LAYOUT_TRANSITION
      };
      sequence.addFrame(frame);
      expect(sequence.getAverageFps()).assertEqual(50);
      expect(sequence.getCountByKind(AnimationKind.TILE_LAYOUT_TRANSITION)).assertEqual(1);
      expect(sequence.getCountByKind(AnimationKind.FOCUS_RING_MOVE)).assertEqual(0);
      sequence.clear();
      expect(sequence.getFrameCount()).assertEqual(0);
      expect(sequence.getAverageFps()).assertEqual(0);
    });

    // 帧序列应保持帧序号的单调性
    it('frame_sequence_should_keep_frame_order', 0, async () => {
      const sequence = new FrameSequenceModel();
      const first: FrameSample = {
        frameId: 5,
        deltaMs: 16,
        kind: AnimationKind.FOCUS_RING_MOVE
      };
      const second: FrameSample = {
        frameId: 6,
        deltaMs: 16,
        kind: AnimationKind.FOCUS_RING_MOVE
      };
      sequence.addFrame(first);
      sequence.addFrame(second);
      expect(sequence.isChronological()).assertTrue();
      const frames: Array<FrameSample> = sequence.getFrames();
      expect(frames.length).assertEqual(2);
      expect(frames[0].frameId).assertEqual(5);
    });

    // 帧率分类器应覆盖全部档位边界
    it('frame_rate_classifier_should_classify_boundaries', 0, async () => {
      const classifier = new FrameRateClassifier();
      expect(classifier.classify(120)).assertEqual(FrameRateTier.ULTRA);
      expect(classifier.classify(119)).assertEqual(FrameRateTier.HIGH);
      expect(classifier.classify(60)).assertEqual(FrameRateTier.HIGH);
      expect(classifier.classify(59)).assertEqual(FrameRateTier.MEDIUM);
      expect(classifier.classify(30)).assertEqual(FrameRateTier.MEDIUM);
      expect(classifier.classify(29)).assertEqual(FrameRateTier.LOW);
      expect(classifier.isSmooth(60)).assertTrue();
      expect(classifier.isSmooth(30)).assertFalse();
    });

    // 帧率档位的文本描述应与档位一一对应
    it('frame_rate_classifier_should_describe_tiers', 0, async () => {
      const classifier = new FrameRateClassifier();
      expect(classifier.describe(FrameRateTier.ULTRA)).assertEqual('ultra');
      expect(classifier.describe(FrameRateTier.HIGH)).assertEqual('high');
      expect(classifier.describe(FrameRateTier.MEDIUM)).assertEqual('medium');
      expect(classifier.describe(FrameRateTier.LOW)).assertEqual('low');
    });

    // 高卡顿率应被归因为 CPU 瓶颈
    it('analyzer_should_detect_cpu_bottleneck', 0, async () => {
      const sequence = new FrameSequenceModel();
      for (let i = 0; i < 4; i++) {
        const frame: FrameSample = {
          frameId: i,
          deltaMs: i % 2 === 0 ? 40 : 16,
          kind: AnimationKind.TILE_LAYOUT_TRANSITION
        };
        sequence.addFrame(frame);
      }
      const analyzer = new AnimationAnalyzer();
      expect(analyzer.detectBottleneck(sequence)).assertEqual(BottleneckKind.CPU_BOUND);
      expect(analyzer.isHealthy(BottleneckKind.CPU_BOUND)).assertFalse();
      expect(analyzer.describeBottleneck(BottleneckKind.CPU_BOUND)).assertEqual('cpu');
    });

    // 中等卡顿率应被归因为 GPU 瓶颈
    it('analyzer_should_detect_gpu_bottleneck', 0, async () => {
      const sequence = new FrameSequenceModel();
      const janky: FrameSample = {
        frameId: 0,
        deltaMs: 40,
        kind: AnimationKind.FULLSCREEN_TOGGLE
      };
      const smooth: FrameSample = {
        frameId: 1,
        deltaMs: 16,
        kind: AnimationKind.FULLSCREEN_TOGGLE
      };
      sequence.addFrame(janky);
      sequence.addFrame(smooth);
      sequence.addFrame(smooth);
      sequence.addFrame(smooth);
      const analyzer = new AnimationAnalyzer();
      expect(sequence.getJankRate()).assertEqual(0.25);
      expect(analyzer.detectBottleneck(sequence)).assertEqual(BottleneckKind.GPU_BOUND);
    });

    // 低卡顿率应被归因为内存侧抖动
    it('analyzer_should_detect_memory_bottleneck', 0, async () => {
      const sequence = new FrameSequenceModel();
      for (let i = 0; i < 20; i++) {
        const frame: FrameSample = {
          frameId: i,
          deltaMs: i === 0 ? 40 : 16,
          kind: AnimationKind.TILE_LAYOUT_TRANSITION
        };
        sequence.addFrame(frame);
      }
      const analyzer = new AnimationAnalyzer();
      expect(sequence.getJankRate()).assertEqual(0.05);
      expect(analyzer.detectBottleneck(sequence)).assertEqual(BottleneckKind.MEMORY_BOUND);
      expect(analyzer.describeBottleneck(BottleneckKind.MEMORY_BOUND)).assertEqual('memory');
    });

    // 无卡顿帧时应判定为健康
    it('analyzer_should_report_healthy_on_clean_frames', 0, async () => {
      const sequence = new FrameSequenceModel();
      for (let i = 0; i < 3; i++) {
        const frame: FrameSample = {
          frameId: i,
          deltaMs: 16,
          kind: AnimationKind.FOCUS_RING_MOVE
        };
        sequence.addFrame(frame);
      }
      const analyzer = new AnimationAnalyzer();
      expect(analyzer.detectBottleneck(sequence)).assertEqual(BottleneckKind.NONE);
      expect(analyzer.isHealthy(BottleneckKind.NONE)).assertTrue();
      expect(analyzer.describeBottleneck(BottleneckKind.NONE)).assertEqual('none');
      const empty = new FrameSequenceModel();
      expect(analyzer.detectBottleneck(empty)).assertEqual(BottleneckKind.NONE);
    });

    // 动画记录器应正确统计平滑率与平均帧率
    it('animation_recorder_should_compute_averages', 0, async () => {
      recorder.reset();
      recorder.record(AnimationKind.PERMISSION_FADE_IN, 100, 6, 60, true);
      recorder.record(AnimationKind.PERMISSION_FADE_OUT, 200, 12, 30, false);
      recorder.record(AnimationKind.TILE_LAYOUT_TRANSITION, 150, 9, 60, true);
      expect(recorder.getTotal()).assertEqual(3);
      expect(recorder.getSmoothCount()).assertEqual(2);
      expect(recorder.getAverageFps()).assertEqual(50);
      expect(recorder.getAverageDuration()).assertEqual(150);
      expect(recorder.getSmoothRate()).assertEqual(2 / 3);
    });

    // 动画记录器应按类型过滤并保持事件时序
    it('animation_recorder_should_filter_by_kind', 0, async () => {
      recorder.reset();
      recorder.record(AnimationKind.FOCUS_RING_MOVE, 80, 5, 60, true);
      recorder.record(AnimationKind.FOCUS_RING_MOVE, 90, 5, 60, true);
      recorder.record(AnimationKind.FULLSCREEN_TOGGLE, 220, 13, 60, true);
      expect(recorder.getCountByKind(AnimationKind.FOCUS_RING_MOVE)).assertEqual(2);
      expect(recorder.getCountByKind(AnimationKind.FULLSCREEN_TOGGLE)).assertEqual(1);
      expect(recorder.getCountByKind(AnimationKind.PERMISSION_FADE_IN)).assertEqual(0);
      expect(recorder.isChronological()).assertTrue();
      expect(recorder.getEvents().length).assertEqual(3);
    });

    // 动画记录器重置后所有统计归零
    it('animation_recorder_should_reset_all_metrics', 0, async () => {
      recorder.reset();
      recorder.record(AnimationKind.PERMISSION_FADE_IN, 100, 6, 60, true);
      expect(recorder.getTotal()).assertEqual(1);
      recorder.reset();
      expect(recorder.getTotal()).assertEqual(0);
      expect(recorder.getSmoothCount()).assertEqual(0);
      expect(recorder.getAverageFps()).assertEqual(0);
      expect(recorder.getAverageDuration()).assertEqual(0);
      expect(recorder.getSmoothRate()).assertEqual(0);
    });

    // 帧预算注册表应支持注册新预算与覆盖旧预算
    // 帧预算注册表清空后查询应返回空但帧判断保持放行
    // 帧预算模型应给出预期帧数
    // 动画统计器应输出求和、极值与标准差
    // 动画统计器标准差计算应与已知样本一致
    // 动画调度器应串行执行动画，同一时刻仅允许一个运行
    // 动画调度器取消后队列与运行态都应被清空
    // 分析器快照应聚合记录器与帧序列的结论
    it('analyzer_snapshot_should_aggregate_metrics', 0, async () => {
      recorder.reset();
      recorder.record(AnimationKind.TILE_LAYOUT_TRANSITION, 200, 12, 60, true);
      const sequence = new FrameSequenceModel();
      const frame: FrameSample = {
        frameId: 0,
        deltaMs: 16,
        kind: AnimationKind.TILE_LAYOUT_TRANSITION
      };
      sequence.addFrame(frame);
      const analyzer = new AnimationAnalyzer();
      const snapshot: AnimationSnapshot = analyzer.buildSnapshot(recorder, sequence);
      expect(snapshot.total).assertEqual(1);
      expect(snapshot.smoothCount).assertEqual(1);
      expect(snapshot.averageFps).assertEqual(60);
      expect(snapshot.averageDuration).assertEqual(200);
      expect(snapshot.bottleneck).assertEqual(BottleneckKind.NONE);
    });

    // 平滑判定需同时满足帧率与卡顿帧上限
    it('analyzer_should_require_both_fps_and_jank', 0, async () => {
      const analyzer = new AnimationAnalyzer();
      expect(analyzer.isSmoothAnimation(60, 0, 2)).assertTrue();
      expect(analyzer.isSmoothAnimation(60, 3, 2)).assertFalse();
      expect(analyzer.isSmoothAnimation(30, 0, 2)).assertFalse();
    });

    // 宫格占位应覆盖每个索引且不越界
    // 布局切换时长应随路数单调增长
    // 九路并发淡入淡出排队总时长应可控
    // 实测帧间隔应落在对应动画预算内
    // 完整动画场景：淡入 + 宫格切换 + 淡出后统计应自洽
    // 记录器单例在跨用例调用下应保持同一实例
    it('animation_recorder_singleton_should_be_stable', 0, async () => {
      const first: AnimationRecorder = AnimationRecorder.getInstance();
      const second: AnimationRecorder = AnimationRecorder.getInstance();
      expect(first === second).assertTrue();
      expect(first === recorder).assertTrue();
      first.reset();
      first.record(AnimationKind.FULLSCREEN_TOGGLE, 120, 7, 60, true);
      expect(second.getTotal()).assertEqual(1);
      expect(second.getSmoothCount()).assertEqual(1);
    });

    // 帧预算等同于窗口刷新周期时应允许单帧通过
    // 授权浮窗淡入淡出应共享同一预算档位
    // 单帧卡顿不应被计为整段动画不流畅
    it('single_jank_frame_should_not_fail_animation', 0, async () => {
      const sequence = new FrameSequenceModel();
      for (let i = 0; i < 10; i++) {
        const frame: FrameSample = {
          frameId: i,
          deltaMs: i === 3 ? 40 : 16,
          kind: AnimationKind.TILE_LAYOUT_TRANSITION
        };
        sequence.addFrame(frame);
      }
      expect(sequence.getJankCount()).assertEqual(1);
      expect(sequence.getJankRate()).assertEqual(0.1);
      const analyzer = new AnimationAnalyzer();
      expect(analyzer.isSmoothAnimation(60, sequence.getJankCount(), 4)).assertTrue();
      expect(analyzer.detectBottleneck(sequence)).assertEqual(BottleneckKind.MEMORY_BOUND);
    });

    // 帧序列中混合动画类型时应按类型分别计数
    it('mixed_kind_sequence_should_count_per_kind', 0, async () => {
      const sequence = new FrameSequenceModel();
      const kinds: Array<AnimationKind> = [
        AnimationKind.PERMISSION_FADE_IN,
        AnimationKind.PERMISSION_FADE_IN,
        AnimationKind.FULLSCREEN_TOGGLE
      ];
      for (let i = 0; i < kinds.length; i++) {
        const frame: FrameSample = {
          frameId: i,
          deltaMs: 16,
          kind: kinds[i]
        };
        sequence.addFrame(frame);
      }
      expect(sequence.getCountByKind(AnimationKind.PERMISSION_FADE_IN)).assertEqual(2);
      expect(sequence.getCountByKind(AnimationKind.FULLSCREEN_TOGGLE)).assertEqual(1);
      expect(sequence.getCountByKind(AnimationKind.FOCUS_RING_MOVE)).assertEqual(0);
      expect(sequence.getAverageFps()).assertEqual(62.5);
    });

    // 记录器事件时间戳应随录制顺序单调不减
    it('recorder_events_should_be_time_ordered', 0, async () => {
      recorder.reset();
      for (let i = 0; i < 4; i++) {
        recorder.record(AnimationKind.FOCUS_RING_MOVE, 80, 5, 60, true);
      }
      const events: Array<AnimationEvent> = recorder.getEvents();
      expect(events.length).assertEqual(4);
      expect(recorder.isChronological()).assertTrue();
      expect(events[3].timestamp).assertLargerOrEqual(events[0].timestamp);
      expect(events[0].frameCount).assertEqual(5);
    });

    // 全屏切换动画应被单独统计
    it('fullscreen_toggle_should_be_counted_separately', 0, async () => {
      recorder.reset();
      recorder.record(AnimationKind.FULLSCREEN_TOGGLE, 240, 14, 60, true);
      recorder.record(AnimationKind.TILE_LAYOUT_TRANSITION, 210, 12, 60, true);
      expect(recorder.getCountByKind(AnimationKind.FULLSCREEN_TOGGLE)).assertEqual(1);
      expect(recorder.getCountByKind(AnimationKind.TILE_LAYOUT_TRANSITION)).assertEqual(1);
      expect(recorder.getTotal()).assertEqual(2);
      expect(recorder.getSmoothRate()).assertEqual(1);
    });

    // 调度器在队列为空时不应产生运行态
    // 六路与九路布局的占位比例应不同
    // 报告中平均帧率与平滑率应相互印证
    it('recorder_metrics_should_be_consistent', 0, async () => {
      recorder.reset();
      recorder.record(AnimationKind.PERMISSION_FADE_IN, 100, 6, 60, true);
      recorder.record(AnimationKind.PERMISSION_FADE_OUT, 100, 6, 60, true);
      expect(recorder.getAverageFps()).assertEqual(60);
      expect(recorder.getSmoothRate()).assertEqual(1);
      expect(recorder.getAverageDuration()).assertEqual(100);
      const analyzer = new AnimationAnalyzer();
      const snapshot: AnimationSnapshot = analyzer.buildSnapshot(recorder, new FrameSequenceModel());
      expect(snapshot.total).assertEqual(2);
      expect(snapshot.smoothCount).assertEqual(2);
      expect(snapshot.bottleneck).assertEqual(BottleneckKind.NONE);
    });

    // 页面稳定探测与动画统计应可并行使用
    // 九宫格布局在七路与八路下应保持三列
    // 动画记录器统计应能跨多次录制累积
    it('recorder_should_accumulate_across_batches', 0, async () => {
      recorder.reset();
      for (let batch = 0; batch < 3; batch++) {
        for (let i = 0; i < 2; i++) {
          recorder.record(AnimationKind.FOCUS_RING_MOVE, 90, 5, 60, true);
        }
      }
      expect(recorder.getTotal()).assertEqual(6);
      expect(recorder.getSmoothCount()).assertEqual(6);
      expect(recorder.getSmoothRate()).assertEqual(1);
      expect(recorder.getAverageDuration()).assertEqual(90);
      expect(recorder.isChronological()).assertTrue();
    });
    it('frame_sequence_should_clear_recorded_frames', 0, async () => {
      const sequence = new FrameSequenceModel();
      sequence.addFrame({ frameId: 0, deltaMs: 16, kind: AnimationKind.PERMISSION_FADE_IN });
      expect(sequence.getFrameCount()).assertEqual(1);
      sequence.clear();
      expect(sequence.getFrameCount()).assertEqual(0);
      expect(sequence.getJankRate()).assertEqual(0);
    });

    it('frame_sequence_should_track_max_delta', 0, async () => {
      const sequence = new FrameSequenceModel();
      sequence.addFrame({ frameId: 0, deltaMs: 12, kind: AnimationKind.PERMISSION_FADE_IN });
      sequence.addFrame({ frameId: 1, deltaMs: 40, kind: AnimationKind.PERMISSION_FADE_IN });
      expect(sequence.getMaxDeltaMs()).assertEqual(40);
      expect(sequence.getTotalDeltaMs()).assertEqual(52);
      expect(sequence.getAverageDeltaMs()).assertEqual(26);
    });

    it('frame_sequence_should_report_empty_metrics', 0, async () => {
      const sequence = new FrameSequenceModel();
      expect(sequence.getAverageFps()).assertEqual(0);
      expect(sequence.getAverageDeltaMs()).assertEqual(0);
      expect(sequence.isChronological()).assertTrue();
    });

    it('recorder_should_reset_between_suites', 0, async () => {
      const recorder = AnimationRecorder.getInstance();
      recorder.reset();
      expect(recorder.getTotal()).assertEqual(0);
      recorder.record(AnimationKind.FOCUS_RING_MOVE, 90, 3, 60, true);
      expect(recorder.getCountByKind(AnimationKind.FOCUS_RING_MOVE)).assertEqual(1);
    });

    it('analyzer_should_treat_single_jank_as_smooth', 0, async () => {
      const analyzer = new AnimationAnalyzer();
      expect(analyzer.isSmoothAnimation(60, 1, 2)).assertTrue();
      expect(analyzer.isSmoothAnimation(60, 3, 2)).assertFalse();
      expect(analyzer.isSmoothAnimation(20, 0, 2)).assertFalse();
    });

    it('classifier_should_tier_boundary_fps', 0, async () => {
      const classifier = new FrameRateClassifier();
      expect(classifier.isSmooth(60)).assertTrue();
      expect(classifier.isSmooth(24)).assertFalse();
      expect(classifier.describe(classifier.classify(60)).length).assertLarger(0);
    });

    it('recorder_should_track_smooth_rate_across_kinds', 0, async () => {
      const recorder = AnimationRecorder.getInstance();
      recorder.reset();
      recorder.record(AnimationKind.PERMISSION_FADE_IN, 150, 9, 60, true);
      recorder.record(AnimationKind.PERMISSION_FADE_OUT, 150, 9, 30, false);
      expect(recorder.getTotal()).assertEqual(2);
      expect(recorder.getSmoothRate()).assertEqual(0.5);
      recorder.reset();
    });

    it('recorder_should_handle_nine_tile_transitions', 0, async () => {
      const recorder = AnimationRecorder.getInstance();
      recorder.reset();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        recorder.record(AnimationKind.TILE_LAYOUT_TRANSITION, 200, 12, 60, true);
      }
      expect(recorder.getTotal()).assertEqual(MAX_MIRROR_TILES);
      expect(recorder.getSmoothRate()).assertEqual(1);
      expect(recorder.getCountByKind(AnimationKind.TILE_LAYOUT_TRANSITION)).assertEqual(MAX_MIRROR_TILES);
      recorder.reset();
    });


    it('animation_metrics_should_coexist_with_page_probe', 0, async () => {
      const analyzer = new AnimationAnalyzer();
      const sequence = new FrameSequenceModel();
      sequence.addFrame({ frameId: 0, deltaMs: 16, kind: AnimationKind.FOCUS_RING_MOVE });
      expect(analyzer.isHealthy(analyzer.detectBottleneck(sequence))).assertTrue();
    });
  });
}
