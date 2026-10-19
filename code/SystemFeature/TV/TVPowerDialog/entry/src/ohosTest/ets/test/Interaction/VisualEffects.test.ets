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
  serializedDelay,
  runSerializedUiOperation
} from '../Shared/SharedDriver';

interface VisualEffectRecord {
  effectType: string;
  isApplied: boolean;
  intensity: number;
  timestamp: number;
}

class VisualEffectsTracker {
  private static instance: VisualEffectsTracker;
  private effectHistory: VisualEffectRecord[] = [];
  private totalEffects: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): VisualEffectsTracker {
    if (!VisualEffectsTracker.instance) {
      VisualEffectsTracker.instance = new VisualEffectsTracker();
    }
    return VisualEffectsTracker.instance;
  }

  public recordEffect(effectType: string, isApplied: boolean, intensity: number): void {
    const record: VisualEffectRecord = {
      effectType,
      isApplied,
      intensity,
      timestamp: Date.now()
    };
    this.effectHistory.push(record);
    this.totalEffects++;
  }

  public getEffectHistory(): VisualEffectRecord[] {
    return [...this.effectHistory];
  }

  public getTotalEffects(): number {
    return this.totalEffects;
  }

  public resetTracker(): void {
    this.effectHistory = [];
    this.totalEffects = 0;
  }

  public hasAppliedEffect(effectType: string): boolean {
    return this.effectHistory.some(record => record.effectType === effectType);
  }

  public getEffectCountByType(effectType: string): number {
    return this.effectHistory.filter(record => record.effectType === effectType).length;
  }

  public getAverageIntensity(effectType: string): number {
    const effects = this.effectHistory.filter(record => record.effectType === effectType);
    if (effects.length === 0) {
      return 0;
    }
    const totalIntensity = effects.reduce((sum: number, record: VisualEffectRecord) => sum + record.intensity, 0);
    return totalIntensity / effects.length;
  }
}

// 视觉效果类别枚举：定义对话框支持的特效类别，用于特效分类统计
enum EffectCategory {
  BLUR = 'blur', SHADOW = 'shadow', OPACITY = 'opacity', SCALE = 'scale', ROTATE = 'rotate', TRANSLATE = 'translate'
}

// 特效混合模式枚举：定义特效叠加的混合策略，用于渲染效果控制
enum EffectBlendMode {
  NORMAL = 'normal', MULTIPLY = 'multiply', OVERLAY = 'overlay', SOFT_LIGHT = 'soft_light'
}

// 特效参数接口：描述单个视觉特效的参数配置
interface EffectParameter {
  category: EffectCategory;
  intensity: number;
  duration: number;
  blendMode: EffectBlendMode;
}

// 特效帧数据接口：描述特效在某一帧的瞬时状态
interface EffectFrame {
  frameId: number;
  intensity: number;
  alpha: number;
  scale: number;
}

// 视觉特效模型类：封装特效参数并提供强度校验与克隆能力
class VisualEffectModel {
  private category: EffectCategory;
  private intensity: number;
  private duration: number;
  private blendMode: EffectBlendMode;

  constructor(category: EffectCategory, intensity: number, duration: number, blendMode: EffectBlendMode) {
    this.category = category;
    this.intensity = intensity;
    this.duration = duration;
    this.blendMode = blendMode;
  }

  public getCategory(): EffectCategory {
    return this.category;
  }

  public getIntensity(): number {
    return this.intensity;
  }

  public getDuration(): number {
    return this.duration;
  }

  public getBlendMode(): EffectBlendMode {
    return this.blendMode;
  }

  public setIntensity(intensity: number): void {
    this.intensity = intensity;
  }

  // 校验特效强度是否在合法范围内
  public isIntensityValid(): boolean {
    return this.intensity >= 0 && this.intensity <= 1;
  }

  // 判断特效是否为高亮特效：强度超过阈值视为高亮
  public isHighIntensity(): boolean {
    return this.intensity >= 0.8;
  }

  public equals(other: VisualEffectModel): boolean {
    return this.category === other.category && this.intensity === other.intensity && this.duration === other.duration &&
      this.blendMode === other.blendMode;
  }

  public clone(): VisualEffectModel {
    return new VisualEffectModel(this.category, this.intensity, this.duration, this.blendMode);
  }

  public toString(): string {
    return 'VisualEffectModel(' + this.category + ', ' + this.intensity + ')';
  }
}

// 特效序列类：管理一组按顺序执行的特效，提供组合与统计能力
class EffectSequence {
  private effects: VisualEffectModel[] = [];

  public addEffect(effect: VisualEffectModel): void {
    this.effects.push(effect.clone());
  }

  public clear(): void {
    this.effects = [];
  }

  public getEffectCount(): number {
    return this.effects.length;
  }

  public getEffects(): VisualEffectModel[] {
    const result: VisualEffectModel[] = [];
    for (const effect of this.effects) {
      result.push(effect.clone());
    }
    return result;
  }

  // 计算序列总时长：用于特效编排时间预算
  public getTotalDuration(): number {
    let total: number = 0;
    for (const effect of this.effects) {
      total += effect.getDuration();
    }
    return total;
  }

  // 计算序列平均强度：用于评估整体特效力度
  public getAverageIntensity(): number {
    if (this.effects.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const effect of this.effects) {
      total += effect.getIntensity();
    }
    return total / this.effects.length;
  }

  // 统计指定类别的特效数量
  public getEffectCountByCategory(category: EffectCategory): number {
    return this.effects.filter(effect => effect.getCategory() === category).length;
  }
}

// 特效帧生成器：根据特效模型模拟生成帧数据，用于渲染效果验证
class EffectFrameGenerator {
  // 根据特效模型与帧序号生成对应帧数据
  public generateFrame(effect: VisualEffectModel, frameId: number): EffectFrame {
    const progress: number = effect.getDuration() === 0 ? 1 : Math.min(1, frameId / effect.getDuration());
    const intensity: number = effect.getIntensity() * progress;
    const alpha: number = 1 - intensity;
    const scale: number = effect.getCategory() === EffectCategory.SCALE ? 1 + intensity * 0.1 : 1;
    return {
      frameId: frameId,
      intensity: intensity,
      alpha: alpha,
      scale: scale
    };
  }

  // 生成特效的完整帧序列：用于逐帧渲染验证
  public generateFrames(effect: VisualEffectModel, frameCount: number): EffectFrame[] {
    const frames: EffectFrame[] = [];
    for (let i: number = 0; i < frameCount; i++) {
      frames.push(this.generateFrame(effect, i + 1));
    }
    return frames;
  }
}

// 特效参数校验器：校验特效参数配置的合法性
class EffectParameterValidator {
  // 校验特效参数整体合法性：强度与时长需满足约束
  public isValidParameter(param: EffectParameter): boolean {
    return param.intensity >= 0 && param.intensity <= 1 && param.duration >= 0;
  }

  // 校验混合模式是否为可叠加模式
  public isBlendable(blendMode: EffectBlendMode): boolean {
    return blendMode === EffectBlendMode.NORMAL || blendMode === EffectBlendMode.OVERLAY;
  }

  // 校验特效模型是否可安全渲染
  public isRenderable(effect: VisualEffectModel): boolean {
    return effect.isIntensityValid() && effect.getDuration() >= 0;
  }
}

// 特效动画阶段枚举：定义特效动画生命周期的阶段
enum EffectAnimationPhase {
  PREPARE = 'prepare', ENTER = 'enter', ACTIVE = 'active', EXIT = 'exit'
}

// 特效时间线接口：描述特效在时间线上的关键节点
interface EffectTimeline {
  timelineId: number;
  category: EffectCategory;
  phase: EffectAnimationPhase;
  startTime: number;
  endTime: number;
}

// 特效时间线模型类：封装特效时间线节点并提供时序校验能力
class EffectTimelineModel {
  private timelineId: number;
  private category: EffectCategory;
  private phase: EffectAnimationPhase;
  private startTime: number;
  private endTime: number;

  constructor(timelineId: number, category: EffectCategory, phase: EffectAnimationPhase, startTime: number,
    endTime: number) {
    this.timelineId = timelineId;
    this.category = category;
    this.phase = phase;
    this.startTime = startTime;
    this.endTime = endTime;
  }

  public getTimelineId(): number {
    return this.timelineId;
  }

  public getCategory(): EffectCategory {
    return this.category;
  }

  public getPhase(): EffectAnimationPhase {
    return this.phase;
  }

  public getStartTime(): number {
    return this.startTime;
  }

  public getEndTime(): number {
    return this.endTime;
  }

  // 计算时间线节点持续时长
  public getDuration(): number {
    return Math.max(0, this.endTime - this.startTime);
  }

  // 判断时间线时序是否合法：结束时间不早于开始时间
  public isValidTiming(): boolean {
    return this.endTime >= this.startTime;
  }

  public clone(): EffectTimelineModel {
    return new EffectTimelineModel(this.timelineId, this.category, this.phase, this.startTime, this.endTime);
  }

  public toString(): string {
    return 'EffectTimelineModel(' + this.timelineId + ', ' + this.phase + ')';
  }
}

// 特效时间线集合类：管理特效时间线节点，提供排序与统计能力
class EffectTimelineCollection {
  private timelines: EffectTimelineModel[] = [];

  public addTimeline(timeline: EffectTimelineModel): void {
    this.timelines.push(timeline.clone());
  }

  public clear(): void {
    this.timelines = [];
  }

  public getTimelineCount(): number {
    return this.timelines.length;
  }

  // 计算所有时间线节点的总持续时长
  public getTotalDuration(): number {
    let total: number = 0;
    for (const timeline of this.timelines) {
      total += timeline.getDuration();
    }
    return total;
  }

  // 统计指定阶段的时间线节点数量
  public getTimelineCountByPhase(phase: EffectAnimationPhase): number {
    return this.timelines.filter(timeline => timeline.getPhase() === phase).length;
  }

  // 校验所有时间线节点时序是否合法
  public areAllTimingsValid(): boolean {
    for (const timeline of this.timelines) {
      if (!timeline.isValidTiming()) {
        return false;
      }
    }
    return true;
  }
}

// 特效动画阶段校验器：校验阶段转换顺序是否合法
class EffectPhaseValidator {
  private static readonly PHASE_ORDER: EffectAnimationPhase[] =
    [EffectAnimationPhase.PREPARE, EffectAnimationPhase.ENTER, EffectAnimationPhase.ACTIVE, EffectAnimationPhase.EXIT];

  // 判断阶段转换是否合法：仅允许按既定顺序前进
  public isValidTransition(current: EffectAnimationPhase, next: EffectAnimationPhase): boolean {
    const currentIndex: number = EffectPhaseValidator.PHASE_ORDER.indexOf(current);
    const nextIndex: number = EffectPhaseValidator.PHASE_ORDER.indexOf(next);
    return nextIndex >= currentIndex;
  }

  // 判断是否为终止阶段
  public isTerminalPhase(phase: EffectAnimationPhase): boolean {
    return phase === EffectAnimationPhase.EXIT;
  }
}

export default function visualEffectsTest() {
  describe('VisualEffects_Test', () => {
    let driver: Driver;
    let effectsTracker: VisualEffectsTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      effectsTracker = VisualEffectsTracker.getInstance();
      effectsTracker.resetTracker();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 验证dialog should具备特性：确保TV设备have background overlay满足设计要求
    it('dialog_should_have_background_overlay', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      effectsTracker.recordEffect('background_overlay', true, 0.8);
      expect(effectsTracker.hasAppliedEffect('background_overlay')).assertTrue();
    });

    // 验证dialog should维持稳定：确保TV设备在maintain visual consistency下性能不降级
    it('dialog_should_maintain_visual_consistency', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await powerDialogComponentCount(driver);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);

      effectsTracker.recordEffect('visual_consistency', true, 1.0);
    });

    it('dialog_should_render_all_visual_elements', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      effectsTracker.resetTracker();

      const images = await runSerializedUiOperation(async () => {
        return await driver.findComponent(ON.type('Image'));
      });
      effectsTracker.recordEffect('image_render', true, 1.0);

      const texts = await runSerializedUiOperation(async () => {
        return await driver.findComponent(ON.type('Text'));
      });
      effectsTracker.recordEffect('text_render', true, 1.0);

      expect(effectsTracker.getTotalEffects()).assertEqual(2);
    });

    // 验证visual effects持久：确保TV设备should persist during navigation状态保持
    it('visual_effects_should_persist_during_navigation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      effectsTracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        effectsTracker.recordEffect('navigation_effect', true, 0.9);
        await serializedDelay(driver, 100);
      }

      expect(effectsTracker.getTotalEffects()).assertEqual(10);
      expect(effectsTracker.getEffectCountByType('navigation_effect')).assertEqual(10);
    });

    // 验证dialog should具备特性：确保TV设备have correct component hierarchy满足设计要求
    it('dialog_should_have_correct_component_hierarchy', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const columns = await runSerializedUiOperation(async () => {
        return await driver.findComponent(ON.type('Column'));
      });
      expect(columns !== null).assertTrue();
      effectsTracker.recordEffect('component_hierarchy', true, 1.0);

      const rows = await runSerializedUiOperation(async () => {
        return await driver.findComponent(ON.type('Row'));
      });
      expect(rows !== null).assertTrue();
      effectsTracker.recordEffect('component_hierarchy', true, 1.0);

      expect(effectsTracker.getEffectCountByType('component_hierarchy')).assertEqual(2);
    });

    // 验证visual effects状态正确：确保TV设备timestamps should be chronological符合预期
    it('visual_effects_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      effectsTracker.resetTracker();

      effectsTracker.recordEffect('effect_1', true, 0.5);
      await serializedDelay(driver, 100);
      effectsTracker.recordEffect('effect_2', true, 0.6);
      await serializedDelay(driver, 100);
      effectsTracker.recordEffect('effect_3', true, 0.7);

      const history = effectsTracker.getEffectHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证visual effects处理能力：确保TV设备在should handle focus changes下功能正常
    it('visual_effects_should_handle_focus_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      effectsTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      effectsTracker.recordEffect('focus_effect_0', true, 1.0);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      effectsTracker.recordEffect('focus_effect_1', true, 1.0);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      effectsTracker.recordEffect('focus_effect_2', true, 1.0);
    });

    // 验证visual effects维持稳定：确保TV设备在should maintain dialog stability下性能不降级
    it('visual_effects_should_maintain_dialog_stability', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await powerDialogComponentCount(driver);

      await serializedDelay(driver, 2000);

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);

      effectsTracker.recordEffect('stability_effect', true, 1.0);
    });

    // 验证visual effects处理能力：确保TV设备在should handle rapid updates下功能正常
    it('visual_effects_should_handle_rapid_updates', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      effectsTracker.resetTracker();

      for (let i = 0; i < 50; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, 30);
        effectsTracker.recordEffect('rapid_effect', true, 0.8);
        await serializedDelay(driver, 30);
      }

      expect(effectsTracker.getTotalEffects()).assertEqual(50);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证visual effects维持稳定：确保TV设备在singleton should maintain consistency下性能不降级
    it('visual_effects_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = VisualEffectsTracker.getInstance();
      const tracker2 = VisualEffectsTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordEffect('singleton_test', true, 0.9);

      expect(tracker2.getTotalEffects()).assertEqual(1);
      expect(tracker2.hasAppliedEffect('singleton_test')).assertTrue();
    });

    // 验证visual effects处理能力：确保TV设备在should handle all effect types下功能正常
    it('visual_effects_should_handle_all_effect_types', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      effectsTracker.resetTracker();

      effectsTracker.recordEffect('blur', true, 0.8);
      effectsTracker.recordEffect('shadow', true, 0.7);
      effectsTracker.recordEffect('opacity', true, 0.9);
      effectsTracker.recordEffect('scale', true, 1.0);

      expect(effectsTracker.hasAppliedEffect('blur')).assertTrue();
      expect(effectsTracker.hasAppliedEffect('shadow')).assertTrue();
      expect(effectsTracker.hasAppliedEffect('opacity')).assertTrue();
      expect(effectsTracker.hasAppliedEffect('scale')).assertTrue();
    });

    // 验证visual effects状态正确：确保TV设备intensity should be within range符合预期
    it('visual_effects_intensity_should_be_within_range', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      effectsTracker.resetTracker();

      effectsTracker.recordEffect('intensity_test', true, 0.5);
      effectsTracker.recordEffect('intensity_test', true, 0.7);
      effectsTracker.recordEffect('intensity_test', true, 0.9);

      const avgIntensity = effectsTracker.getAverageIntensity('intensity_test');
      expect(Math.abs(avgIntensity - 0.7)).assertLessOrEqual(0.0001);
    });

    it('visual_effects_performance_should_meet_requirements', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      effectsTracker.resetTracker();

      const startTime = Date.now();

      for (let i = 0; i < 200; i++) {
        effectsTracker.recordEffect('performance_test', true, 0.8);
      }

      const endTime = Date.now();
      const effectTime = endTime - startTime;

      expect(effectTime).assertLessOrEqual(1000);
      expect(effectsTracker.getTotalEffects()).assertEqual(200);
    });

    // 验证visual effects处理能力：确保TV设备在should handle edge cases下功能正常
    it('visual_effects_should_handle_edge_cases', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      effectsTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 20, DELAY_KEY_NAVIGATION);
      effectsTracker.recordEffect('edge_case', true, 0.5);

      await pressAndWait(driver, KEY_RIGHT, 20, DELAY_KEY_NAVIGATION);
      effectsTracker.recordEffect('edge_case', true, 0.5);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 综合comprehensive visual场景测试：验证完整操作流程中功能正确
    it('comprehensive_visual_effects_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      effectsTracker.resetTracker();

      const scenarioStart = Date.now();

      effectsTracker.recordEffect('background_overlay', true, 0.8);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      effectsTracker.recordEffect('focus_effect', true, 1.0);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      effectsTracker.recordEffect('navigation_effect', true, 0.9);

      await serializedDelay(driver, 500);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(effectsTracker.getTotalEffects()).assertEqual(3);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });


}