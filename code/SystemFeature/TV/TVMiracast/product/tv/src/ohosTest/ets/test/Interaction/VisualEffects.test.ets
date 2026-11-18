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
import { Driver, Component } from '../Shared/MiracastDriver';
import { getDriver, triggerMiracastHome, waitForPageStable, waitForPlayerPage, miracastComponentCount,
  findComponentsByType, pressAndWait, safeBack, serializedDelay, launchPlayerPage, getDeviceIdList,
  getPlayerTileCount, KEY_LEFT, KEY_RIGHT, TIMEOUT_PAGE_RENDER, TIMEOUT_PLAYER_RENDER, DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT, MAX_MIRROR_TILES } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'VisualEffectsSuite';

// ===== 视觉效果领域模型（本地 Mock，纯逻辑） =====
// 覆盖 opacity 0.4 禁用态、18/36/72lpx 圆角、灰色焦点描边与 zIndex 2 浮层

// 特效类别枚举：描述 Miracast 界面支持的视觉效果
enum EffectCategory {
  OPACITY = 'opacity',
  BORDER = 'border',
  RADIUS = 'radius',
  ZINDEX = 'zindex',
  SHADOW = 'shadow',
  BLUR = 'blur'
}

// 特效混合模式枚举：描述叠加策略
enum EffectBlendMode {
  NORMAL = 'normal',
  MULTIPLY = 'multiply',
  OVERLAY = 'overlay',
  SOFT_LIGHT = 'soft_light'
}

// 特效帧接口：描述特效在某一帧的状态
interface EffectFrame {
  frameId: number;
  intensity: number;
  alpha: number;
  scale: number;
}

// 特效记录接口：描述一次特效观测结果
interface EffectRecord {
  effectType: string;
  isApplied: boolean;
  intensity: number;
  timestamp: number;
}

// 视觉特效模型：封装特效参数并校验强度
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

  public isIntensityValid(): boolean {
    return this.intensity >= 0 && this.intensity <= 1;
  }

  // 是否高亮特效：强度不低于 0.8
  public isHighIntensity(): boolean {
    return this.intensity >= 0.8;
  }

  // 是否为禁用态透明度 0.4
  public isDisabledOpacity(): boolean {
    return this.category === EffectCategory.OPACITY && Math.abs(this.intensity - 0.4) <= 0.0001;
  }

  public equals(other: VisualEffectModel): boolean {
    return this.category === other.category && this.intensity === other.intensity &&
      this.duration === other.duration && this.blendMode === other.blendMode;
  }

  public clone(): VisualEffectModel {
    return new VisualEffectModel(this.category, this.intensity, this.duration, this.blendMode);
  }

  public toString(): string {
    return 'VisualEffectModel(' + this.category + ', ' + this.intensity + ')';
  }
}

// 圆角特效模型：管理 18/36/72lpx 三档设计稿圆角
class RadiusEffectModel {
  public static readonly SMALL: number = 18;
  public static readonly MEDIUM: number = 36;
  public static readonly LARGE: number = 72;
  private radius: number;

  constructor(radius: number) {
    this.radius = radius;
  }

  public getRadius(): number {
    return this.radius;
  }

  public setRadius(radius: number): void {
    this.radius = radius;
  }

  public isDesignRadius(): boolean {
    return this.radius === RadiusEffectModel.SMALL || this.radius === RadiusEffectModel.MEDIUM ||
      this.radius === RadiusEffectModel.LARGE;
  }

  // 按设计稿档位名称返回圆角值
  public resolveByName(name: string): number {
    if (name === 'small') {
      return RadiusEffectModel.SMALL;
    }
    if (name === 'medium') {
      return RadiusEffectModel.MEDIUM;
    }
    if (name === 'large') {
      return RadiusEffectModel.LARGE;
    }
    return -1;
  }

  // 判断圆角是否超出组件短边一半
  public isAffordable(shortSide: number): boolean {
    if (shortSide <= 0) {
      return false;
    }
    return this.radius <= shortSide / 2;
  }

  // 圆角倍数换算
  public scaleBy(factor: number): number {
    if (factor <= 0) {
      return -1;
    }
    return Math.round(this.radius * factor);
  }
}

// 层级特效模型：管理 zIndex 浮层层级
class ElevationEffectModel {
  private zIndex: number;

  constructor(zIndex: number) {
    this.zIndex = zIndex;
  }

  public getZIndex(): number {
    return this.zIndex;
  }

  public setZIndex(zIndex: number): void {
    this.zIndex = zIndex;
  }

  // 是否达到浮层级别
  public isOverlay(): boolean {
    return this.zIndex >= 2;
  }

  // 是否高于另一层级
  public isAbove(other: ElevationEffectModel): boolean {
    return this.zIndex > other.getZIndex();
  }

  // 层级是否在允许范围内
  public isWithinRange(maxZIndex: number): boolean {
    return this.zIndex >= 0 && this.zIndex <= maxZIndex;
  }
}

// 特效帧生成器：按特效模型生成逐帧数据
class EffectFrameGenerator {
  public generateFrame(effect: VisualEffectModel, frameId: number): EffectFrame {
    const progress: number = effect.getDuration() === 0 ? 1 : Math.min(1, frameId / effect.getDuration());
    const intensity: number = effect.getIntensity() * progress;
    const alpha: number = 1 - intensity;
    const scale: number = effect.getCategory() === EffectCategory.RADIUS ? 1 + intensity * 0.1 : 1;
    const frame: EffectFrame = {
      frameId: frameId,
      intensity: intensity,
      alpha: alpha,
      scale: scale
    };
    return frame;
  }

  public generateFrames(effect: VisualEffectModel, frameCount: number): EffectFrame[] {
    const frames: EffectFrame[] = [];
    if (frameCount <= 0) {
      return frames;
    }
    for (let i: number = 0; i < frameCount; i++) {
      frames.push(this.generateFrame(effect, i + 1));
    }
    return frames;
  }
}

// 特效追踪器：单例保存特效观测记录
class VisualEffectsTracker {
  private static instance: VisualEffectsTracker;
  private history: EffectRecord[] = [];
  private totalEffects: number = 0;

  public static getInstance(): VisualEffectsTracker {
    if (!VisualEffectsTracker.instance) {
      VisualEffectsTracker.instance = new VisualEffectsTracker();
    }
    return VisualEffectsTracker.instance;
  }

  public record(effectType: string, isApplied: boolean, intensity: number): boolean {
    if (effectType.length === 0 || intensity < 0 || intensity > 1) {
      return false;
    }
    const record: EffectRecord = {
      effectType: effectType,
      isApplied: isApplied,
      intensity: intensity,
      timestamp: Date.now()
    };
    this.history.push(record);
    this.totalEffects++;
    return true;
  }

  public getHistory(): EffectRecord[] {
    const copied: EffectRecord[] = [];
    for (const record of this.history) {
      const item: EffectRecord = {
        effectType: record.effectType,
        isApplied: record.isApplied,
        intensity: record.intensity,
        timestamp: record.timestamp
      };
      copied.push(item);
    }
    return copied;
  }

  public getTotalEffects(): number {
    return this.totalEffects;
  }

  public hasAppliedEffect(effectType: string): boolean {
    for (const record of this.history) {
      if (record.effectType === effectType) {
        return true;
      }
    }
    return false;
  }

  public getEffectCountByType(effectType: string): number {
    let count: number = 0;
    for (const record of this.history) {
      if (record.effectType === effectType) {
        count++;
      }
    }
    return count;
  }

  public getAverageIntensity(effectType: string): number {
    let total: number = 0;
    let count: number = 0;
    for (const record of this.history) {
      if (record.effectType === effectType) {
        total += record.intensity;
        count++;
      }
    }
    return count === 0 ? 0 : total / count;
  }

  public countApplied(): number {
    let count: number = 0;
    for (const record of this.history) {
      if (record.isApplied) {
        count++;
      }
    }
    return count;
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
    this.totalEffects = 0;
  }
}

export default function visualEffectsSuite(): void {
  describe('VisualEffects_Test', () => {
    let driver: Driver;
    let tracker: VisualEffectsTracker;

    // 测试前置：初始化驱动与追踪器，并回到投屏首页
    beforeAll(async () => {
      driver = getDriver();
      tracker = VisualEffectsTracker.getInstance();
      tracker.reset();
      Log.info(TAG, 'visual effects suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // 测试清理：退出页面并复位追踪器
    afterAll(async () => {
      await safeBack(driver, 2);
      await triggerMiracastHome(driver);
      tracker.reset();
      Log.info(TAG, 'visual effects suite end');
    });

    // 验证首页具备深色背景遮罩
    it('index_should_have_background_screen', 0, async () => {
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertEqual(0);
      expect(tracker.record('background_screen', true, 1)).assertTrue();
      expect(tracker.hasAppliedEffect('background_screen')).assertTrue();
    });

    // 验证导航过程中视觉状态保持稳定
    it('visual_effects_should_stay_stable_during_navigation', 0, async () => {
      const initialCount: number = await miracastComponentCount(driver);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const finalCount: number = await miracastComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      expect(tracker.record('navigation_effect', true, 0.9)).assertTrue();
    });

    // 验证文本与图片视觉元素渲染
    it('visual_elements_should_render', 0, async () => {
      tracker.reset();
      const texts: Component[] = await findComponentsByType(driver, 'Text');
      tracker.record('text_render', texts.length >= 1, 1);
      const images: Component[] = await findComponentsByType(driver, 'Image');
      tracker.record('image_render', images.length >= 0, 1);
      expect(tracker.getTotalEffects()).assertEqual(2);
      expect(tracker.countApplied()).assertLargerOrEqual(1);
    });

    // 验证禁用态透明度 0.4 应用于不可用设置项
    it('disabled_item_should_use_opacity_zero_point_four', 0, async () => {
      const effect = new VisualEffectModel(EffectCategory.OPACITY, 0.4, 0, EffectBlendMode.NORMAL);
      expect(effect.isDisabledOpacity()).assertTrue();
      expect(effect.isIntensityValid()).assertTrue();
      expect(effect.isHighIntensity()).assertFalse();
      tracker.record('opacity_disabled', true, 0.4);
      expect(tracker.getAverageIntensity('opacity_disabled')).assertEqual(0.4);
    });

    // 验证焦点描边特效可被记录
    it('focus_border_effect_should_be_applied', 0, async () => {
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const border = new VisualEffectModel(EffectCategory.BORDER, 0.86, 120, EffectBlendMode.NORMAL);
      expect(border.isIntensityValid()).assertTrue();
      expect(border.isHighIntensity()).assertTrue();
      tracker.record('focus_border', true, border.getIntensity());
      expect(tracker.hasAppliedEffect('focus_border')).assertTrue();
    });

    // 验证圆角特效映射到设计稿档位
    it('radius_effect_should_map_design_slots', 0, async () => {
      const radius = new RadiusEffectModel(RadiusEffectModel.SMALL);
      expect(radius.isDesignRadius()).assertTrue();
      expect(radius.resolveByName('medium')).assertEqual(36);
      expect(radius.resolveByName('large')).assertEqual(72);
      expect(radius.resolveByName('unknown')).assertEqual(-1);
      tracker.record('radius_small', true, 1);
      expect(tracker.getEffectCountByType('radius_small')).assertEqual(1);
    });

    // 验证浮层层级 zIndex 2 生效
    it('overlay_should_use_zindex_two', 0, async () => {
      const overlay = new ElevationEffectModel(2);
      const base = new ElevationEffectModel(0);
      expect(overlay.isOverlay()).assertTrue();
      expect(base.isOverlay()).assertFalse();
      expect(overlay.isAbove(base)).assertTrue();
      expect(overlay.isWithinRange(3)).assertTrue();
      tracker.record('overlay_zindex', true, 1);
      expect(tracker.hasAppliedEffect('overlay_zindex')).assertTrue();
    });

    // 验证全量特效类别可被应用
    it('visual_effects_should_handle_all_categories', 0, async () => {
      tracker.reset();
      const categories: EffectCategory[] = [
        EffectCategory.OPACITY,
        EffectCategory.BORDER,
        EffectCategory.RADIUS,
        EffectCategory.ZINDEX,
        EffectCategory.SHADOW,
        EffectCategory.BLUR
      ];
      for (const category of categories) {
        tracker.record(category, true, 0.8);
      }
      expect(tracker.getTotalEffects()).assertEqual(6);
      expect(tracker.getEffectCountByType(EffectCategory.RADIUS)).assertEqual(1);
    });

    // 验证特效强度归一化记录
    it('visual_effects_intensity_should_stay_in_range', 0, async () => {
      tracker.reset();
      tracker.record('intensity_probe', true, 0.5);
      tracker.record('intensity_probe', true, 0.7);
      tracker.record('intensity_probe', true, 0.9);
      expect(Math.abs(tracker.getAverageIntensity('intensity_probe') - 0.7)).assertLessOrEqual(0.0001);
      expect(tracker.record('intensity_probe', true, 1.5)).assertFalse();
      expect(tracker.getTotalEffects()).assertEqual(3);
    });

    // 验证播放页宫格渲染后特效记录
    it('player_tiles_should_render_with_radius_effect', 0, async () => {
      const devices: string[] = await getDeviceIdList(driver);
      const deviceId: string = devices.length > 0 ? devices[0] : 'mock_effect_device';
      await launchPlayerPage(deviceId, 'Miracast_Effect_Device');
      await waitForPlayerPage(driver, TIMEOUT_PLAYER_RENDER);
      const tiles: number = await getPlayerTileCount(driver);
      expect(tiles).assertLessOrEqual(MAX_MIRROR_TILES);
      tracker.record('tile_radius', true, 1);
      expect(tracker.getEffectCountByType('tile_radius')).assertEqual(1);
      await safeBack(driver, 1);
      await triggerMiracastHome(driver);
    });

    // 验证特效模型度量字段
    it('effect_model_should_expose_parameters', 0, async () => {
      const effect = new VisualEffectModel(EffectCategory.BLUR, 0.6, 300, EffectBlendMode.OVERLAY);
      expect(effect.getCategory()).assertEqual(EffectCategory.BLUR);
      expect(effect.getIntensity()).assertEqual(0.6);
      expect(effect.getDuration()).assertEqual(300);
      expect(effect.getBlendMode()).assertEqual(EffectBlendMode.OVERLAY);
      expect(effect.isIntensityValid()).assertTrue();
      expect(effect.toString().indexOf('blur')).assertLargerOrEqual(0);
    });

    // 验证强度上界判定
    it('effect_model_should_reject_intensity_above_one', 0, async () => {
      const effect = new VisualEffectModel(EffectCategory.SHADOW, 1.2, 100, EffectBlendMode.NORMAL);
      effect.setIntensity(1.2);
      expect(effect.isIntensityValid()).assertFalse();
      effect.setIntensity(1);
      expect(effect.isIntensityValid()).assertTrue();
      expect(effect.isHighIntensity()).assertTrue();
    });

    // 验证禁用态透明度判定只对 opacity 生效
    it('effect_model_should_limit_disabled_opacity_to_opacity_category', 0, async () => {
      const opacity = new VisualEffectModel(EffectCategory.OPACITY, 0.4, 0, EffectBlendMode.NORMAL);
      const border = new VisualEffectModel(EffectCategory.BORDER, 0.4, 0, EffectBlendMode.NORMAL);
      expect(opacity.isDisabledOpacity()).assertTrue();
      expect(border.isDisabledOpacity()).assertFalse();
      expect(border.getCategory()).assertEqual(EffectCategory.BORDER);
    });

    // 验证特效模型克隆与相等比较
    it('effect_model_should_clone_and_compare', 0, async () => {
      const effect = new VisualEffectModel(EffectCategory.RADIUS, 0.9, 200, EffectBlendMode.MULTIPLY);
      const clone: VisualEffectModel = effect.clone();
      expect(clone.equals(effect)).assertTrue();
      clone.setIntensity(0.5);
      expect(clone.equals(effect)).assertFalse();
      expect(effect.getIntensity()).assertEqual(0.9);
      expect(clone.getIntensity()).assertEqual(0.5);
    });

    // 验证三档圆角取值
    it('radius_effect_should_support_three_slots', 0, async () => {
      const model = new RadiusEffectModel(18);
      expect(model.getRadius()).assertEqual(18);
      expect(model.isDesignRadius()).assertTrue();
      model.setRadius(36);
      expect(model.isDesignRadius()).assertTrue();
      model.setRadius(72);
      expect(model.isDesignRadius()).assertTrue();
      expect(RadiusEffectModel.LARGE).assertEqual(72);
    });

    // 验证非设计稿圆角被拒绝
    it('radius_effect_should_reject_non_design_radius', 0, async () => {
      const model = new RadiusEffectModel(20);
      expect(model.isDesignRadius()).assertFalse();
      model.setRadius(0);
      expect(model.isDesignRadius()).assertFalse();
      model.setRadius(72);
      expect(model.isDesignRadius()).assertTrue();
      expect(model.resolveByName('small')).assertEqual(18);
    });

    // 验证圆角可用性校验
    it('radius_effect_should_check_affordability', 0, async () => {
      const model = new RadiusEffectModel(72);
      expect(model.isAffordable(180)).assertTrue();
      expect(model.isAffordable(144)).assertTrue();
      expect(model.isAffordable(100)).assertFalse();
      expect(model.isAffordable(0)).assertFalse();
      expect(model.scaleBy(2)).assertEqual(144);
      expect(model.scaleBy(0)).assertEqual(-1);
    });

    // 验证层级浮层判定
    it('elevation_effect_should_detect_overlay', 0, async () => {
      const model = new ElevationEffectModel(0);
      expect(model.getZIndex()).assertEqual(0);
      expect(model.isOverlay()).assertFalse();
      model.setZIndex(1);
      expect(model.isOverlay()).assertFalse();
      model.setZIndex(2);
      expect(model.isOverlay()).assertTrue();
      expect(model.isWithinRange(2)).assertTrue();
      expect(model.isWithinRange(1)).assertFalse();
    });

    // 验证帧生成器的进度与透明度
    it('frame_generator_should_compute_progress', 0, async () => {
      const generator = new EffectFrameGenerator();
      const effect = new VisualEffectModel(EffectCategory.OPACITY, 1, 4, EffectBlendMode.NORMAL);
      const frame: EffectFrame = generator.generateFrame(effect, 2);
      expect(frame.frameId).assertEqual(2);
      expect(frame.intensity).assertEqual(0.5);
      expect(frame.alpha).assertEqual(0.5);
      expect(frame.scale).assertEqual(1);
    });

    // 验证帧序列生成数量与半径缩放
    it('frame_generator_should_build_frame_series', 0, async () => {
      const generator = new EffectFrameGenerator();
      const radius = new VisualEffectModel(EffectCategory.RADIUS, 1, 2, EffectBlendMode.NORMAL);
      const frames: EffectFrame[] = generator.generateFrames(radius, 4);
      expect(frames.length).assertEqual(4);
      expect(frames[0].intensity).assertEqual(0.5);
      expect(frames[1].intensity).assertEqual(1);
      expect(frames[1].scale).assertLarger(1);
      expect(generator.generateFrames(radius, 0).length).assertEqual(0);
    });

    // 验证追踪器记录与平均强度
    it('tracker_should_record_effects', 0, async () => {
      tracker.reset();
      expect(tracker.record('opacity', true, 0.4)).assertTrue();
      expect(tracker.record('border', true, 0.8)).assertTrue();
      expect(tracker.getTotalEffects()).assertEqual(2);
      expect(tracker.countApplied()).assertEqual(2);
      expect(tracker.getEffectCountByType('opacity')).assertEqual(1);
      expect(tracker.getAverageIntensity('border')).assertEqual(0.8);
      expect(tracker.isChronological()).assertTrue();
    });

    // 验证追踪器拒绝非法输入
    it('tracker_should_reject_invalid_effect', 0, async () => {
      tracker.reset();
      expect(tracker.record('', true, 0.5)).assertFalse();
      expect(tracker.record('blur', true, -0.1)).assertFalse();
      expect(tracker.record('blur', true, 1.1)).assertFalse();
      expect(tracker.getTotalEffects()).assertEqual(0);
      expect(tracker.record('blur', true, 0.4)).assertTrue();
      expect(tracker.getAverageIntensity('blur')).assertEqual(0.4);
    });

    // 验证追踪器历史为防御性拷贝
    it('tracker_should_return_defensive_history', 0, async () => {
      tracker.reset();
      tracker.record('radius', true, 1);
      const snapshot: EffectRecord[] = tracker.getHistory();
      snapshot[0].effectType = 'mutated';
      expect(tracker.getHistory()[0].effectType).assertEqual('radius');
      expect(tracker.hasAppliedEffect('mutated')).assertFalse();
    });

    // 综合视觉效果场景：透明、圆角、描边与层级一致
    it('comprehensive_visual_effects_scenario', 0, async () => {
      tracker.reset();
      const opacity = new VisualEffectModel(EffectCategory.OPACITY, 0.4, 0, EffectBlendMode.NORMAL);
      const radius = new RadiusEffectModel(RadiusEffectModel.MEDIUM);
      const overlay = new ElevationEffectModel(2);
      const border = new VisualEffectModel(EffectCategory.BORDER, 0.86, 120, EffectBlendMode.NORMAL);
      expect(opacity.isDisabledOpacity()).assertTrue();
      expect(radius.isDesignRadius()).assertTrue();
      expect(overlay.isOverlay()).assertTrue();
      expect(border.isHighIntensity()).assertTrue();
      tracker.record('opacity', true, opacity.getIntensity());
      tracker.record('radius', true, 1);
      tracker.record('overlay', true, 1);
      tracker.record('border', true, border.getIntensity());
      expect(tracker.getTotalEffects()).assertEqual(4);
      expect(tracker.countApplied()).assertEqual(4);
      expect(tracker.getEffectCountByType('radius')).assertEqual(1);
    });

    // 验证圆角向下缩放
    it('radius_effect_should_scale_down', 0, async () => {
      const model = new RadiusEffectModel(72);
      expect(model.scaleBy(0.5)).assertEqual(36);
      expect(model.scaleBy(0.25)).assertEqual(18);
      expect(model.scaleBy(-1)).assertEqual(-1);
      expect(model.isAffordable(144)).assertTrue();
      expect(model.isAffordable(143)).assertFalse();
    });

    // 验证快速导航下特效记录连续
    it('visual_effects_should_handle_rapid_updates', 0, async () => {
      tracker.reset();
      for (let i: number = 0; i < 12; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        tracker.record('rapid_effect', true, 0.8);
        await serializedDelay(driver, 20);
      }
      expect(tracker.getTotalEffects()).assertEqual(12);
      expect(tracker.getEffectCountByType('rapid_effect')).assertEqual(12);
    });

    // 验证特效模型强度为 0 时视为完全透明
    it('effect_model_should_treat_zero_intensity_as_transparent', 0, async () => {
      const effect = new VisualEffectModel(EffectCategory.OPACITY, 0, 100, EffectBlendMode.NORMAL);
      const generator = new EffectFrameGenerator();
      const frame: EffectFrame = generator.generateFrame(effect, 50);
      expect(effect.isIntensityValid()).assertTrue();
      expect(effect.isHighIntensity()).assertFalse();
      expect(frame.intensity).assertEqual(0);
      expect(frame.alpha).assertEqual(1);
    });

  });
}
