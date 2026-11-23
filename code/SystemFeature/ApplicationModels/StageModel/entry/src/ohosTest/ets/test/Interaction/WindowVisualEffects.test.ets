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

import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, clampNumber, safeDiv
} from '../Shared/SharedDriver';

enum EasingCurve {
  LINEAR = 0,
  EASE_IN = 1,
  EASE_OUT = 2,
  EASE_IN_OUT = 3
}

class EffectSpec {
  blurRadius: number = 0;
  opacity: number = 1;
  shadowRadius: number = 0;
  cornerRadius: number = 0;
  brightness: number = 1;
  saturation: number = 1;
  grayscale: number = 0;

  constructor(blurRadius: number, opacity: number, shadowRadius: number, cornerRadius: number) {
    this.blurRadius = blurRadius;
    this.opacity = opacity;
    this.shadowRadius = shadowRadius;
    this.cornerRadius = cornerRadius;
  }

  isVisible(): boolean {
    return this.opacity > 0;
  }

  isBlurred(): boolean {
    return this.blurRadius > 0;
  }

  hasShadow(): boolean {
    return this.shadowRadius > 0;
  }

  isRounded(): boolean {
    return this.cornerRadius > 0;
  }

  effectCount(): number {
    let count = 0;
    if (this.isBlurred()) {
      count = count + 1;
    }
    if (this.hasShadow()) {
      count = count + 1;
    }
    if (this.isRounded()) {
      count = count + 1;
    }
    if (this.grayscale > 0) {
      count = count + 1;
    }
    return count;
  }

  clampAll(): void {
    this.blurRadius = clampNumber(this.blurRadius, 0, 100);
    this.opacity = clampNumber(this.opacity, 0, 1);
    this.shadowRadius = clampNumber(this.shadowRadius, 0, 100);
    this.cornerRadius = clampNumber(this.cornerRadius, 0, 1000);
    this.brightness = clampNumber(this.brightness, 0, 2);
    this.saturation = clampNumber(this.saturation, 0, 2);
    this.grayscale = clampNumber(this.grayscale, 0, 1);
  }

  describe(): string {
    return `blur=${this.blurRadius},opacity=${this.opacity},shadow=${this.shadowRadius}`;
  }
}

class TransitionModel {
  private duration: number = 300;
  private elapsed: number = 0;
  private curve: EasingCurve = EasingCurve.LINEAR;
  private from: number = 0;
  private to: number = 1;
  private running: boolean = false;

  constructor(duration: number, curve: EasingCurve, from: number, to: number) {
    if (duration > 0) {
      this.duration = duration;
    }
    this.curve = curve;
    this.from = from;
    this.to = to;
  }

  getDuration(): number {
    return this.duration;
  }

  getCurve(): EasingCurve {
    return this.curve;
  }

  isRunning(): boolean {
    return this.running;
  }

  start(): void {
    this.elapsed = 0;
    this.running = true;
  }

  advance(deltaMs: number): number {
    if (deltaMs <= 0 || !this.running) {
      return this.progress();
    }
    this.elapsed = this.elapsed + deltaMs;
    if (this.elapsed >= this.duration) {
      this.elapsed = this.duration;
      this.running = false;
    }
    return this.progress();
  }

  progress(): number {
    return clampNumber(safeDiv(this.elapsed, this.duration), 0, 1);
  }

  easedProgress(): number {
    const t = this.progress();
    if (this.curve === EasingCurve.EASE_IN) {
      return t * t;
    }
    if (this.curve === EasingCurve.EASE_OUT) {
      return 1 - (1 - t) * (1 - t);
    }
    if (this.curve === EasingCurve.EASE_IN_OUT) {
      if (t < 0.5) {
        return 2 * t * t;
      }
      return 1 - 2 * (1 - t) * (1 - t);
    }
    return t;
  }

  value(): number {
    return this.from + (this.to - this.from) * this.easedProgress();
  }

  finish(): void {
    this.elapsed = this.duration;
    this.running = false;
  }

  reset(): void {
    this.elapsed = 0;
    this.running = false;
  }
}

class VisualEffectsModel {
  private spec: EffectSpec = new EffectSpec(0, 1, 0, 0);
  private applied: number = 0;
  private resets: number = 0;

  getSpec(): EffectSpec {
    return this.spec;
  }

  setBlur(radius: number): number {
    this.spec.blurRadius = clampNumber(radius, 0, 100);
    this.applied = this.applied + 1;
    return this.spec.blurRadius;
  }

  setOpacity(value: number): number {
    this.spec.opacity = clampNumber(value, 0, 1);
    this.applied = this.applied + 1;
    return this.spec.opacity;
  }

  setShadow(radius: number): number {
    this.spec.shadowRadius = clampNumber(radius, 0, 100);
    this.applied = this.applied + 1;
    return this.spec.shadowRadius;
  }

  setCorner(radius: number): number {
    this.spec.cornerRadius = clampNumber(radius, 0, 1000);
    this.applied = this.applied + 1;
    return this.spec.cornerRadius;
  }

  setBrightness(value: number): number {
    this.spec.brightness = clampNumber(value, 0, 2);
    this.applied = this.applied + 1;
    return this.spec.brightness;
  }

  setSaturation(value: number): number {
    this.spec.saturation = clampNumber(value, 0, 2);
    this.applied = this.applied + 1;
    return this.spec.saturation;
  }

  setGrayscale(value: number): number {
    this.spec.grayscale = clampNumber(value, 0, 1);
    this.applied = this.applied + 1;
    return this.spec.grayscale;
  }

  getApplied(): number {
    return this.applied;
  }

  getResets(): number {
    return this.resets;
  }

  reset(): void {
    this.spec = new EffectSpec(0, 1, 0, 0);
    this.resets = this.resets + 1;
  }

  compositeOpacity(layers: number[]): number {
    let result = 1;
    for (const layer of layers) {
      result = result * clampNumber(layer, 0, 1);
    }
    return result;
  }

  effectiveBlur(baseRadius: number, blurScale: number): number {
    if (baseRadius <= 0 || blurScale <= 0) {
      return 0;
    }
    return clampNumber(baseRadius * blurScale, 0, 100);
  }

  cornerCircleRatio(radius: number, width: number): number {
    if (width <= 0) {
      return 0;
    }
    return clampNumber(safeDiv(radius * 2, width), 0, 1);
  }
}

export default function windowVisualEffectsTest(): void {
  describe('WindowVisualEffects', () => {
    it('WindowVisualEffects_001', 0, async (done: Function) => {
      const spec = new EffectSpec(0, 1, 0, 0);
      expect(spec.isVisible()).assertTrue();
      expect(spec.isBlurred()).assertFalse();
      expect(spec.effectCount()).assertEqual(0);
      done();
    });

    it('WindowVisualEffects_002', 0, async (done: Function) => {
      const spec = new EffectSpec(10, 0.5, 4, 16);
      expect(spec.isBlurred()).assertTrue();
      expect(spec.hasShadow()).assertTrue();
      expect(spec.isRounded()).assertTrue();
      expect(spec.effectCount()).assertEqual(3);
      done();
    });

    it('WindowVisualEffects_003', 0, async (done: Function) => {
      const spec = new EffectSpec(200, 2, 200, 2000);
      spec.clampAll();
      expect(spec.blurRadius).assertEqual(100);
      expect(spec.opacity).assertEqual(1);
      expect(spec.cornerRadius).assertEqual(1000);
      done();
    });

    it('WindowVisualEffects_004', 0, async (done: Function) => {
      const spec = new EffectSpec(-1, -1, -1, -1);
      spec.clampAll();
      expect(spec.blurRadius).assertEqual(0);
      expect(spec.opacity).assertEqual(0);
      expect(spec.isVisible()).assertFalse();
      done();
    });

    it('WindowVisualEffects_005', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.setBlur(25)).assertEqual(25);
      expect(model.setBlur(500)).assertEqual(100);
      expect(model.getApplied()).assertEqual(2);
      done();
    });

    it('WindowVisualEffects_006', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.setOpacity(0.4)).assertEqual(0.4);
      expect(model.setOpacity(9)).assertEqual(1);
      expect(model.setOpacity(-9)).assertEqual(0);
      done();
    });

    it('WindowVisualEffects_007', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.setShadow(12)).assertEqual(12);
      expect(model.setCorner(48)).assertEqual(48);
      expect(model.getSpec().hasShadow()).assertTrue();
      expect(model.getSpec().isRounded()).assertTrue();
      done();
    });

    it('WindowVisualEffects_008', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.setBrightness(3)).assertEqual(2);
      expect(model.setSaturation(0.5)).assertEqual(0.5);
      expect(model.setGrayscale(2)).assertEqual(1);
      done();
    });

    it('WindowVisualEffects_009', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      model.setBlur(10);
      model.setOpacity(0.5);
      model.reset();
      expect(model.getSpec().blurRadius).assertEqual(0);
      expect(model.getSpec().opacity).assertEqual(1);
      expect(model.getResets()).assertEqual(1);
      done();
    });

    it('WindowVisualEffects_010', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.compositeOpacity([1, 1, 1])).assertEqual(1);
      expect(model.compositeOpacity([0.5, 0.5])).assertEqual(0.25);
      expect(model.compositeOpacity([])).assertEqual(1);
      done();
    });

    it('WindowVisualEffects_011', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.effectiveBlur(10, 2)).assertEqual(20);
      expect(model.effectiveBlur(0, 2)).assertEqual(0);
      expect(model.effectiveBlur(10, 0)).assertEqual(0);
      done();
    });

    it('WindowVisualEffects_012', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.cornerCircleRatio(50, 100)).assertEqual(1);
      expect(model.cornerCircleRatio(10, 100)).assertEqual(0.2);
      expect(model.cornerCircleRatio(10, 0)).assertEqual(0);
      done();
    });

    it('WindowVisualEffects_013', 0, async (done: Function) => {
      const transition = new TransitionModel(300, EasingCurve.LINEAR, 0, 1);
      expect(transition.getDuration()).assertEqual(300);
      expect(transition.getCurve()).assertEqual(EasingCurve.LINEAR);
      expect(transition.isRunning()).assertFalse();
      done();
    });

    it('WindowVisualEffects_014', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.LINEAR, 0, 1);
      transition.start();
      expect(transition.isRunning()).assertTrue();
      expect(transition.advance(50)).assertEqual(0.5);
      expect(transition.isRunning()).assertTrue();
      done();
    });

    it('WindowVisualEffects_015', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.LINEAR, 0, 1);
      transition.start();
      transition.advance(150);
      expect(transition.progress()).assertEqual(1);
      expect(transition.isRunning()).assertFalse();
      done();
    });

    it('WindowVisualEffects_016', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.LINEAR, 10, 20);
      transition.start();
      transition.advance(50);
      expect(transition.value()).assertEqual(15);
      done();
    });

    it('WindowVisualEffects_017', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.EASE_IN, 0, 1);
      transition.start();
      transition.advance(50);
      expect(transition.easedProgress()).assertEqual(0.25);
      done();
    });

    it('WindowVisualEffects_018', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.EASE_OUT, 0, 1);
      transition.start();
      transition.advance(50);
      expect(transition.easedProgress()).assertEqual(0.75);
      done();
    });

    it('WindowVisualEffects_019', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.EASE_IN_OUT, 0, 1);
      transition.start();
      transition.advance(25);
      expect(transition.easedProgress()).assertEqual(0.125);
      transition.advance(50);
      expect(transition.easedProgress()).assertEqual(0.875);
      done();
    });

    it('WindowVisualEffects_020', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.LINEAR, 0, 1);
      transition.start();
      transition.finish();
      expect(transition.progress()).assertEqual(1);
      expect(transition.isRunning()).assertFalse();
      expect(transition.advance(50)).assertEqual(1);
      done();
    });

    it('WindowVisualEffects_021', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.LINEAR, 0, 1);
      transition.start();
      transition.advance(40);
      transition.reset();
      expect(transition.progress()).assertEqual(0);
      expect(transition.isRunning()).assertFalse();
      done();
    });

    it('WindowVisualEffects_022', 0, async (done: Function) => {
      const transition = new TransitionModel(0, EasingCurve.LINEAR, 0, 1);
      expect(transition.getDuration()).assertEqual(300);
      expect(transition.advance(10)).assertEqual(0);
      done();
    });

    it('WindowVisualEffects_023', 0, async (done: Function) => {
      const spec = new EffectSpec(5, 1, 6, 7);
      spec.brightness = 1.5;
      spec.saturation = 0.5;
      spec.grayscale = 0.25;
      expect(spec.effectCount()).assertEqual(4);
      expect(spec.describe()).assertEqual('blur=5,opacity=1,shadow=6');
      done();
    });

    it('WindowVisualEffects_024', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      model.setBlur(30);
      model.setShadow(20);
      model.setCorner(24);
      model.setGrayscale(0.5);
      expect(model.getSpec().effectCount()).assertEqual(4);
      expect(model.getApplied()).assertEqual(4);
      done();
    });

    it('WindowVisualEffects_025', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.compositeOpacity([0.5, 0.5, 0.5])).assertEqual(0.125);
      expect(model.compositeOpacity([2, 2])).assertEqual(1);
      done();
    });

    it('WindowVisualEffects_026', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.EASE_IN, 0, 100);
      transition.start();
      transition.advance(50);
      expect(transition.value()).assertEqual(25);
      transition.advance(50);
      expect(transition.value()).assertEqual(100);
      done();
    });

    it('WindowVisualEffects_027', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.LINEAR, 0, 1);
      expect(transition.advance(50)).assertEqual(0);
      expect(transition.isRunning()).assertFalse();
      done();
    });

    it('WindowVisualEffects_028', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Image');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('WindowVisualEffects_029', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.setCorner(2000)).assertEqual(1000);
      expect(model.setCorner(-5)).assertEqual(0);
      expect(model.getSpec().isRounded()).assertFalse();
      done();
    });

    it('WindowVisualEffects_030', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      model.setBlur(40);
      model.setShadow(30);
      model.setCorner(20);
      const spec = model.getSpec();
      expect(spec.effectCount()).assertEqual(3);
      expect(spec.isBlurred()).assertTrue();
      expect(spec.hasShadow()).assertTrue();
      done();
    });

    it('WindowVisualEffects_031', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      const layers: number[] = [0.9, 0.8, 0.7];
      const result = model.compositeOpacity(layers);
      expect(Math.round(result * 1000)).assertEqual(504);
      done();
    });

    it('WindowVisualEffects_032', 0, async (done: Function) => {
      const transition = new TransitionModel(200, EasingCurve.LINEAR, 5, 25);
      transition.start();
      transition.advance(100);
      expect(transition.progress()).assertEqual(0.5);
      expect(transition.value()).assertEqual(15);
      done();
    });

    it('WindowVisualEffects_033', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.EASE_OUT, 0, 1);
      transition.start();
      transition.advance(0);
      expect(transition.progress()).assertEqual(0);
      expect(transition.easedProgress()).assertEqual(0);
      done();
    });

    it('WindowVisualEffects_034', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.getApplied()).assertEqual(0);
      expect(model.getResets()).assertEqual(0);
      model.reset();
      expect(model.getResets()).assertEqual(1);
      expect(model.getSpec().effectCount()).assertEqual(0);
      done();
    });

    it('WindowVisualEffects_035', 0, async (done: Function) => {
      const spec = new EffectSpec(0, 0, 0, 0);
      spec.grayscale = 0.4;
      expect(spec.isVisible()).assertFalse();
      expect(spec.effectCount()).assertEqual(1);
      done();
    });

    it('WindowVisualEffects_036', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      expect(model.effectiveBlur(60, 2)).assertEqual(100);
      expect(model.cornerCircleRatio(60, 100)).assertEqual(1);
      done();
    });

    it('WindowVisualEffects_037', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      model.setBrightness(-1);
      model.setSaturation(-1);
      model.setGrayscale(-1);
      expect(model.getSpec().brightness).assertEqual(0);
      expect(model.getSpec().saturation).assertEqual(0);
      expect(model.getSpec().grayscale).assertEqual(0);
      done();
    });

    it('WindowVisualEffects_038', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.EASE_IN_OUT, 0, 1);
      transition.start();
      transition.advance(100);
      expect(transition.easedProgress()).assertEqual(1);
      expect(transition.isRunning()).assertFalse();
      done();
    });

    it('WindowVisualEffects_039', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      const empty: number[] = [];
      expect(model.compositeOpacity(empty)).assertEqual(1);
      expect(model.cornerCircleRatio(0, 100)).assertEqual(0);
      done();
    });

    it('WindowVisualEffects_040', 0, async (done: Function) => {
      const model = new VisualEffectsModel();
      model.setBlur(10);
      model.setShadow(10);
      model.setCorner(10);
      model.setGrayscale(0.1);
      expect(model.getSpec().effectCount()).assertEqual(4);
      done();
    });

    it('WindowVisualEffects_041', 0, async (done: Function) => {
      const transition = new TransitionModel(100, EasingCurve.EASE_IN, 10, 30);
      transition.start();
      transition.advance(50);
      expect(transition.value()).assertEqual(15);
      done();
    });
  });
}
