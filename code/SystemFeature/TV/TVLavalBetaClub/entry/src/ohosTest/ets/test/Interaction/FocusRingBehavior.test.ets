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

const RING_WIDTH_DEFAULT: number = 2;

const RING_WIDTH_STRONG: number = 4;

const RING_MARGIN: number = 2;

const RING_RADIUS: number = 8;

const RING_OPACITY_MIN: number = 0.3;

const RING_OPACITY_MAX: number = 1;

const ANIMATION_MS: number = 150;

const STROKE_COLOR: number = 0xFFFFFF;

const STROKE_COLOR_DISABLED: number = 0x666666;

interface FocusRingStyle {
  width: number;
  margin: number;
  radius: number;
  color: number;
  opacity: number;
}

// Builds focus ring styles for each interaction state
class FocusRingFactory {
  public static focused(): FocusRingStyle {
    return {
      width: RING_WIDTH_DEFAULT,
      margin: RING_MARGIN,
      radius: RING_RADIUS,
      color: STROKE_COLOR,
      opacity: RING_OPACITY_MAX
    };
  }

  public static pressed(): FocusRingStyle {
    return {
      width: RING_WIDTH_STRONG,
      margin: RING_MARGIN,
      radius: RING_RADIUS,
      color: STROKE_COLOR,
      opacity: RING_OPACITY_MAX
    };
  }

  public static disabled(): FocusRingStyle {
    return {
      width: RING_WIDTH_DEFAULT,
      margin: RING_MARGIN,
      radius: RING_RADIUS,
      color: STROKE_COLOR_DISABLED,
      opacity: RING_OPACITY_MIN
    };
  }

  public static isValid(style: FocusRingStyle): boolean {
    return style.width > 0 && style.width <= 8 && style.margin >= 0 &&
      style.radius >= 0 && style.opacity >= RING_OPACITY_MIN && style.opacity <= RING_OPACITY_MAX;
  }

  public static copy(style: FocusRingStyle): FocusRingStyle {
    return {
      width: style.width,
      margin: style.margin,
      radius: style.radius,
      color: style.color,
      opacity: style.opacity
    };
  }
}

// Tracks visibility and animation state of the focus ring
class FocusRingController {
  private visible: boolean = false;
  private animating: boolean = false;
  private opacity: number = 0;
  private strokes: number = 0;

  public show(animate: boolean): void {
    this.visible = true;
    this.opacity = RING_OPACITY_MAX;
    this.strokes++;
    this.animating = animate;
  }

  public hide(): void {
    this.visible = false;
    this.animating = false;
    this.opacity = 0;
  }

  public startAnimation(): boolean {
    if (!this.visible || this.animating) {
      return false;
    }
    this.animating = true;
    return true;
  }

  public finishAnimation(): boolean {
    if (!this.animating) {
      return false;
    }
    this.animating = false;
    return true;
  }

  public isVisible(): boolean {
    return this.visible;
  }

  public isAnimating(): boolean {
    return this.animating;
  }

  public getOpacity(): number {
    return this.opacity;
  }

  public getStrokeCount(): number {
    return this.strokes;
  }

  public reset(): void {
    this.visible = false;
    this.animating = false;
    this.opacity = 0;
    this.strokes = 0;
  }
}

// Validates ring contrast against the background
class RingContrast {
  public static ratio(foreground: number, background: number): number {
    const fg = RingContrast.brightness(foreground);
    const bg = RingContrast.brightness(background);
    const lighter = Math.max(fg, bg);
    const darker = Math.min(fg, bg);
    return (lighter + 5) / (darker + 5);
  }

  // Accepts both a packed rgb(a) color (0xRRGGBB) and an already 0-255 gray level and
  // returns the perceived brightness so that a white ring on a white background is
  // reported as low contrast.
  public static brightness(value: number): number {
    if (value <= 0xFF) {
      return value;
    }
    const r = (value >> 16) & 0xFF;
    const g = (value >> 8) & 0xFF;
    const b = value & 0xFF;
    return Math.round(0.299 * r + 0.587 * g + 0.114 * b);
  }

  public static isVisible(style: FocusRingStyle, background: number): boolean {
    return RingContrast.ratio(style.color, background) >= 3 && style.opacity > 0;
  }

  public static needsStrongerRing(style: FocusRingStyle, background: number): boolean {
    return style.width < RING_WIDTH_STRONG && RingContrast.ratio(style.color, background) < 5;
  }

  public static blend(color: number, background: number, opacity: number): number {
    const clamped = opacity < 0 ? 0 : (opacity > 1 ? 1 : opacity);
    return Math.round(color * clamped + background * (1 - clamped));
  }
}

// Collects rendered ring paths for assertions
class RingPathCollector {
  private paths: string[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public add(nodeId: string): boolean {
    if (nodeId.length === 0 || this.capacity <= 0) {
      return false;
    }
    if (this.paths.length >= this.capacity) {
      this.paths.shift();
    }
    this.paths.push(nodeId);
    return true;
  }

  public count(): number {
    return this.paths.length;
  }

  public latest(): string {
    return this.paths.length === 0 ? '' : this.paths[this.paths.length - 1];
  }

  public contains(nodeId: string): boolean {
    return this.paths.includes(nodeId);
  }

  public all(): string[] {
    return [...this.paths];
  }

  public clear(): void {
    this.paths = [];
  }
}

export default function focusRingBehaviorTest() {
  describe('FocusRingBehavior_Test', () => {

    it('factory_should_build_focused_style', 0, () => {
      const style = FocusRingFactory.focused();
      expect(style.width).assertEqual(RING_WIDTH_DEFAULT);
      expect(style.margin).assertEqual(RING_MARGIN);
      expect(style.radius).assertEqual(RING_RADIUS);
      expect(style.color).assertEqual(STROKE_COLOR);
      expect(style.opacity).assertEqual(RING_OPACITY_MAX);
      expect(FocusRingFactory.isValid(style)).assertTrue();
    });

    it('factory_should_strengthen_pressed_style', 0, () => {
      const pressed = FocusRingFactory.pressed();
      expect(pressed.width).assertEqual(RING_WIDTH_STRONG);
      expect(pressed.width).assertLarger(FocusRingFactory.focused().width);
      expect(FocusRingFactory.isValid(pressed)).assertTrue();
    });

    it('factory_should_dim_disabled_style', 0, () => {
      const disabled = FocusRingFactory.disabled();
      expect(disabled.color).assertEqual(STROKE_COLOR_DISABLED);
      expect(disabled.opacity).assertEqual(RING_OPACITY_MIN);
      expect(disabled.opacity).assertLess(FocusRingFactory.focused().opacity);
      expect(FocusRingFactory.isValid(disabled)).assertTrue();
    });

    it('factory_should_validate_styles', 0, () => {
      const style = FocusRingFactory.focused();
      style.width = 0;
      expect(FocusRingFactory.isValid(style)).assertFalse();
      style.width = 9;
      expect(FocusRingFactory.isValid(style)).assertFalse();
      style.width = RING_WIDTH_DEFAULT;
      style.opacity = 0;
      expect(FocusRingFactory.isValid(style)).assertFalse();
      style.opacity = 1.1;
      expect(FocusRingFactory.isValid(style)).assertFalse();
    });

    it('factory_copy_should_be_independent', 0, () => {
      const source = FocusRingFactory.focused();
      const copy = FocusRingFactory.copy(source);
      copy.width = 8;
      copy.color = 0;
      expect(source.width).assertEqual(RING_WIDTH_DEFAULT);
      expect(source.color).assertEqual(STROKE_COLOR);
      expect(copy.width).assertEqual(8);
      expect(FocusRingFactory.isValid(copy)).assertTrue();
    });

    it('controller_should_show_and_hide', 0, () => {
      const controller = new FocusRingController();
      expect(controller.isVisible()).assertFalse();
      expect(controller.getOpacity()).assertEqual(0);
      controller.show(false);
      expect(controller.isVisible()).assertTrue();
      expect(controller.getOpacity()).assertEqual(RING_OPACITY_MAX);
      expect(controller.isAnimating()).assertFalse();
      expect(controller.getStrokeCount()).assertEqual(1);
      controller.hide();
      expect(controller.isVisible()).assertFalse();
      expect(controller.getOpacity()).assertEqual(0);
    });

    it('controller_should_animate_visibility', 0, () => {
      const controller = new FocusRingController();
      expect(controller.startAnimation()).assertFalse();
      controller.show(true);
      expect(controller.isAnimating()).assertTrue();
      expect(controller.startAnimation()).assertFalse();
      expect(controller.finishAnimation()).assertTrue();
      expect(controller.isAnimating()).assertFalse();
      expect(controller.finishAnimation()).assertFalse();
      expect(controller.getStrokeCount()).assertEqual(1);
    });

    it('controller_should_count_show_events', 0, () => {
      const controller = new FocusRingController();
      controller.show(false);
      controller.hide();
      controller.show(false);
      expect(controller.getStrokeCount()).assertEqual(2);
      controller.reset();
      expect(controller.isVisible()).assertFalse();
      expect(controller.getStrokeCount()).assertEqual(0);
      expect(controller.getOpacity()).assertEqual(0);
    });

    it('contrast_should_detect_visibility', 0, () => {
      const style = FocusRingFactory.focused();
      expect(RingContrast.isVisible(style, 0)).assertTrue();
      expect(RingContrast.isVisible(style, 0)).assertTrue();
      expect(RingContrast.isVisible(style, 255)).assertFalse();
      expect(RingContrast.ratio(255, 0)).assertLarger(3);
      expect(RingContrast.ratio(0, 0)).assertEqual(1);
    });

    it('contrast_should_recommend_stronger_ring', 0, () => {
      const style = FocusRingFactory.focused();
      expect(RingContrast.needsStrongerRing(style, 0)).assertFalse();
      expect(RingContrast.needsStrongerRing(style, 200)).assertTrue();
      const pressed = FocusRingFactory.pressed();
      expect(RingContrast.needsStrongerRing(pressed, 200)).assertFalse();
    });

    it('contrast_should_blend_opacity', 0, () => {
      expect(RingContrast.blend(255, 0, 1)).assertEqual(255);
      expect(RingContrast.blend(255, 0, 0)).assertEqual(0);
      expect(RingContrast.blend(255, 0, 0.5)).assertEqual(128);
      expect(RingContrast.blend(255, 0, 2)).assertEqual(255);
      expect(RingContrast.blend(255, 0, -1)).assertEqual(0);
    });

    it('collector_should_track_ring_paths', 0, () => {
      const collector = new RingPathCollector(2);
      expect(collector.add('button-a')).assertTrue();
      collector.add('button-b');
      collector.add('button-c');
      expect(collector.count()).assertEqual(2);
      expect(collector.contains('button-a')).assertFalse();
      expect(collector.contains('button-c')).assertTrue();
      expect(collector.latest()).assertEqual('button-c');
      expect(collector.all().length).assertEqual(2);
      collector.clear();
      expect(collector.count()).assertEqual(0);
    });

    it('collector_should_reject_invalid_input', 0, () => {
      const collector = new RingPathCollector(2);
      expect(collector.add('')).assertFalse();
      expect(collector.count()).assertEqual(0);
      expect(collector.latest()).assertEqual('');
      const zero = new RingPathCollector(0);
      expect(zero.add('a')).assertFalse();
      expect(zero.count()).assertEqual(0);
    });

    it('ring_flow_should_track_focus_move', 0, () => {
      const controller = new FocusRingController();
      const collector = new RingPathCollector(10);
      const nodes: string[] = ['create', 'list', 'intro'];
      for (let i = 0; i < nodes.length; i++) {
        controller.show(i === 0);
        collector.add(nodes[i]);
        expect(controller.isVisible()).assertTrue();
      }
      expect(controller.getStrokeCount()).assertEqual(3);
      expect(collector.count()).assertEqual(3);
      expect(collector.latest()).assertEqual('intro');
      expect(RingContrast.isVisible(FocusRingFactory.focused(), 0)).assertTrue();
    });

    it('focus_ring_constants_should_be_stable', 0, () => {
      expect(RING_WIDTH_DEFAULT).assertEqual(2);
      expect(RING_WIDTH_STRONG).assertEqual(4);
      expect(RING_MARGIN).assertEqual(2);
      expect(RING_RADIUS).assertEqual(8);
      expect(RING_OPACITY_MIN).assertEqual(0.3);
      expect(RING_OPACITY_MAX).assertEqual(1);
      expect(ANIMATION_MS).assertEqual(150);
    });
  });
}

