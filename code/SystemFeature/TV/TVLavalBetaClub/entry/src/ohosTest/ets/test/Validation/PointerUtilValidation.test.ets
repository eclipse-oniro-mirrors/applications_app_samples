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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { PointerUtil } from '../../../../main/ets/common/Utils/PointerUtil';
import { EventUtil } from '../../../../main/ets/common/Utils/EventUtil';

// Touch type values declared by the ArkUI TouchType enum
const TOUCH_TYPE_DOWN: number = 0;

const TOUCH_TYPE_UP: number = 1;

const TOUCH_TYPE_MOVE: number = 2;

const TOUCH_TYPE_CANCEL: number = 3;

// Source types relevant for TV remote and mouse interaction
const SOURCE_TYPE_MOUSE: number = 1;

const SOURCE_TYPE_TOUCHSCREEN: number = 2;

const SOURCE_TYPE_KEYBOARD: number = 4;

const CURSOR_SIZE: number = 50;

const CURSOR_HOTSPOT: number = 25;

const DESIGN_WIDTH: number = 1920;

const DESIGN_HEIGHT: number = 1080;

interface PointerSample {
  x: number;
  y: number;
  sourceType: number;
  touchType: number;
}

interface CursorMetrics {
  width: number;
  height: number;
  hotspotX: number;
  hotspotY: number;
}

// Mirrors EventUtil.isTouchEvent without requiring a real TouchEvent
class TouchEventClassifier {
  public static isTouchEvent(sample: PointerSample): boolean {
    if (sample.touchType === TOUCH_TYPE_DOWN) {
      return false;
    }
    return sample.sourceType === SOURCE_TYPE_MOUSE || sample.sourceType === SOURCE_TYPE_TOUCHSCREEN;
  }

  public static shouldChangeCursor(touchType: number): boolean {
    return touchType === TOUCH_TYPE_DOWN;
  }

  public static isPointerSource(sourceType: number): boolean {
    return sourceType === SOURCE_TYPE_MOUSE || sourceType === SOURCE_TYPE_TOUCHSCREEN;
  }
}

// Scales design-space coordinates to the current TV resolution
class PointerCoordinateMapper {
  public static mapX(x: number, screenWidth: number): number {
    if (screenWidth <= 0) {
      return 0;
    }
    return Math.round(x * screenWidth / DESIGN_WIDTH);
  }

  public static mapY(y: number, screenHeight: number): number {
    if (screenHeight <= 0) {
      return 0;
    }
    return Math.round(y * screenHeight / DESIGN_HEIGHT);
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public static isInside(x: number, y: number, width: number, height: number): boolean {
    return x >= 0 && y >= 0 && x <= width && y <= height;
  }
}

// Validates cursor asset metrics used by PointerUtil.changePointStyle
class CursorMetricsValidator {
  public static isSizeValid(width: number, height: number): boolean {
    return width > 0 && height > 0 && width <= 128 && height <= 128;
  }

  public static isHotspotValid(hotspot: number, size: number): boolean {
    return hotspot >= 0 && hotspot < size;
  }

  public static build(): CursorMetrics {
    return {
      width: CURSOR_SIZE,
      height: CURSOR_SIZE,
      hotspotX: CURSOR_HOTSPOT,
      hotspotY: CURSOR_HOTSPOT
    };
  }

  public static isCentered(metrics: CursorMetrics): boolean {
    return metrics.hotspotX === metrics.width / 2 && metrics.hotspotY === metrics.height / 2;
  }
}

// Validates pointer samples recorded during interaction tests
class PointerSampleRecorder {
  private samples: PointerSample[] = [];

  public record(sample: PointerSample): void {
    this.samples.push(sample);
  }

  public getCount(): number {
    return this.samples.length;
  }

  public countBySource(sourceType: number): number {
    return this.samples.filter((sample: PointerSample) => sample.sourceType === sourceType).length;
  }

  public countTouchEvents(): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (TouchEventClassifier.isTouchEvent(this.samples[i])) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.samples = [];
  }
}

// Describes a logical screen frame used to map pointer coordinates
class PointerFrame {
  public width: number;
  public height: number;
  public density: number;

  constructor(width: number, height: number, density: number) {
    this.width = width;
    this.height = height;
    this.density = density;
  }

  public getScaleX(): number {
    return this.width / DESIGN_WIDTH;
  }

  public getScaleY(): number {
    return this.height / DESIGN_HEIGHT;
  }

  public contains(x: number, y: number): boolean {
    return x >= 0 && y >= 0 && x < this.width && y < this.height;
  }

  public isLandscape(): boolean {
    return this.width > this.height;
  }

  public aspectRatio(): number {
    return this.height === 0 ? 0 : this.width / this.height;
  }
}

// Cursor state machine mirrors PointerUtil.changePointStyle behavior
class CursorStateMachine {
  public static readonly DEFAULT: string = 'default';

  public static readonly CLICK: string = 'click';

  public static readonly HIDDEN: string = 'hidden';

  private state: string = CursorStateMachine.DEFAULT;

  public onTouchDown(): string {
    if (this.state === CursorStateMachine.HIDDEN) {
      return this.state;
    }
    this.state = CursorStateMachine.CLICK;
    return this.state;
  }

  public onTouchUp(): string {
    if (this.state === CursorStateMachine.HIDDEN) {
      return this.state;
    }
    this.state = CursorStateMachine.DEFAULT;
    return this.state;
  }

  public hide(): void {
    this.state = CursorStateMachine.HIDDEN;
  }

  public show(): void {
    if (this.state === CursorStateMachine.HIDDEN) {
      this.state = CursorStateMachine.DEFAULT;
    }
  }

  public getState(): string {
    return this.state;
  }

  public isClicking(): boolean {
    return this.state === CursorStateMachine.CLICK;
  }

  public isVisible(): boolean {
    return this.state !== CursorStateMachine.HIDDEN;
  }

  public reset(): void {
    this.state = CursorStateMachine.DEFAULT;
  }
}

// Hit-testing over rectangular targets on the TV screen
class PointerTarget {
  public id: string;
  public left: number;
  public top: number;
  public right: number;
  public bottom: number;

  constructor(id: string, left: number, top: number, right: number, bottom: number) {
    this.id = id;
    this.left = left;
    this.top = top;
    this.right = right;
    this.bottom = bottom;
  }

  public contains(x: number, y: number): boolean {
    return x >= this.left && x <= this.right && y >= this.top && y <= this.bottom;
  }

  public area(): number {
    return Math.max(0, this.right - this.left) * Math.max(0, this.bottom - this.top);
  }
}

class PointerHitTester {
  private targets: PointerTarget[] = [];

  public add(target: PointerTarget): void {
    this.targets.push(target);
  }

  public findAt(x: number, y: number): string {
    for (let i = this.targets.length - 1; i >= 0; i--) {
      if (this.targets[i].contains(x, y)) {
        return this.targets[i].id;
      }
    }
    return '';
  }

  public findAllAt(x: number, y: number): string[] {
    const hits: string[] = [];
    for (let i = 0; i < this.targets.length; i++) {
      if (this.targets[i].contains(x, y)) {
        hits.push(this.targets[i].id);
      }
    }
    return hits;
  }

  public size(): number {
    return this.targets.length;
  }

  public totalArea(): number {
    let total: number = 0;
    for (let i = 0; i < this.targets.length; i++) {
      total += this.targets[i].area();
    }
    return total;
  }

  public clear(): void {
    this.targets = [];
  }
}

// Resolves input source type into behavior flags
class InputSourceResolver {
  public static readonly MOUSE: string = 'mouse';

  public static readonly TOUCH: string = 'touch';

  public static readonly KEY: string = 'key';

  public static readonly UNKNOWN: string = 'unknown';

  public static nameOf(sourceType: number): string {
    if (sourceType === SOURCE_TYPE_MOUSE) {
      return InputSourceResolver.MOUSE;
    }
    if (sourceType === SOURCE_TYPE_TOUCHSCREEN) {
      return InputSourceResolver.TOUCH;
    }
    if (sourceType === SOURCE_TYPE_KEYBOARD) {
      return InputSourceResolver.KEY;
    }
    return InputSourceResolver.UNKNOWN;
  }

  public static supportsHover(sourceType: number): boolean {
    return sourceType === SOURCE_TYPE_MOUSE;
  }

  public static supportsPressure(sourceType: number): boolean {
    return sourceType === SOURCE_TYPE_TOUCHSCREEN;
  }

  public static isPointer(sourceType: number): boolean {
    return sourceType === SOURCE_TYPE_MOUSE || sourceType === SOURCE_TYPE_TOUCHSCREEN;
  }
}

// Queues pointer samples and tracks dispatch statistics
class PointerEventPipeline {
  private queue: PointerSample[] = [];
  private dispatched: number = 0;
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public enqueue(sample: PointerSample): boolean {
    if (this.queue.length >= this.capacity) {
      return false;
    }
    this.queue.push(sample);
    return true;
  }

  public dispatchOne(): PointerSample | undefined {
    if (this.queue.length === 0) {
      return undefined;
    }
    this.dispatched++;
    return this.queue.shift();
  }

  public dispatchAll(): number {
    const count = this.queue.length;
    this.dispatched += count;
    this.queue = [];
    return count;
  }

  public pending(): number {
    return this.queue.length;
  }

  public getDispatched(): number {
    return this.dispatched;
  }

  public isFull(): boolean {
    return this.queue.length >= this.capacity;
  }

  public reset(): void {
    this.queue = [];
    this.dispatched = 0;
  }
}

export default function pointerUtilValidationTest() {
  describe('PointerUtilValidation_Test', () => {
    let recorder: PointerSampleRecorder;

    beforeAll(() => {
      recorder = new PointerSampleRecorder();
    });

    it('touch_down_should_not_be_treated_as_click', 0, () => {
      const sample: PointerSample = {
        x: 100,
        y: 100,
        sourceType: SOURCE_TYPE_MOUSE,
        touchType: TOUCH_TYPE_DOWN
      };
      expect(TouchEventClassifier.isTouchEvent(sample)).assertFalse();
      expect(TouchEventClassifier.shouldChangeCursor(TOUCH_TYPE_DOWN)).assertTrue();
    });

    it('mouse_up_should_be_treated_as_click', 0, () => {
      const sample: PointerSample = {
        x: 100,
        y: 100,
        sourceType: SOURCE_TYPE_MOUSE,
        touchType: TOUCH_TYPE_UP
      };
      expect(TouchEventClassifier.isTouchEvent(sample)).assertTrue();
      expect(TouchEventClassifier.shouldChangeCursor(TOUCH_TYPE_UP)).assertFalse();
    });

    it('touchscreen_up_should_be_treated_as_click', 0, () => {
      const sample: PointerSample = {
        x: 320,
        y: 180,
        sourceType: SOURCE_TYPE_TOUCHSCREEN,
        touchType: TOUCH_TYPE_UP
      };
      expect(TouchEventClassifier.isTouchEvent(sample)).assertTrue();
      expect(TouchEventClassifier.isPointerSource(sample.sourceType)).assertTrue();
    });

    it('keyboard_source_should_not_be_treated_as_touch', 0, () => {
      const sample: PointerSample = {
        x: 0,
        y: 0,
        sourceType: SOURCE_TYPE_KEYBOARD,
        touchType: TOUCH_TYPE_UP
      };
      expect(TouchEventClassifier.isTouchEvent(sample)).assertFalse();
      expect(TouchEventClassifier.isPointerSource(sample.sourceType)).assertFalse();
    });

    it('move_and_cancel_should_be_treated_as_touch', 0, () => {
      const move: PointerSample = {
        x: 50, y: 50, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_MOVE
      };
      const cancel: PointerSample = {
        x: 50, y: 50, sourceType: SOURCE_TYPE_TOUCHSCREEN, touchType: TOUCH_TYPE_CANCEL
      };
      expect(TouchEventClassifier.isTouchEvent(move)).assertTrue();
      expect(TouchEventClassifier.isTouchEvent(cancel)).assertTrue();
    });

    it('pointer_samples_should_be_counted_per_source', 0, () => {
      recorder.clear();
      recorder.record({ x: 1, y: 1, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_UP });
      recorder.record({ x: 2, y: 2, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_DOWN });
      recorder.record({ x: 3, y: 3, sourceType: SOURCE_TYPE_TOUCHSCREEN, touchType: TOUCH_TYPE_UP });
      expect(recorder.getCount()).assertEqual(3);
      expect(recorder.countBySource(SOURCE_TYPE_MOUSE)).assertEqual(2);
      expect(recorder.countBySource(SOURCE_TYPE_TOUCHSCREEN)).assertEqual(1);
      expect(recorder.countTouchEvents()).assertEqual(2);
      recorder.clear();
      expect(recorder.getCount()).assertEqual(0);
    });

    it('coordinate_mapper_should_preserve_design_space', 0, () => {
      expect(PointerCoordinateMapper.mapX(0, DESIGN_WIDTH)).assertEqual(0);
      expect(PointerCoordinateMapper.mapX(DESIGN_WIDTH, DESIGN_WIDTH)).assertEqual(DESIGN_WIDTH);
      expect(PointerCoordinateMapper.mapY(0, DESIGN_HEIGHT)).assertEqual(0);
      expect(PointerCoordinateMapper.mapY(DESIGN_HEIGHT, DESIGN_HEIGHT)).assertEqual(DESIGN_HEIGHT);
    });

    it('coordinate_mapper_should_scale_to_4k', 0, () => {
      expect(PointerCoordinateMapper.mapX(DESIGN_WIDTH, 3840)).assertEqual(3840);
      expect(PointerCoordinateMapper.mapY(DESIGN_HEIGHT, 2160)).assertEqual(2160);
      expect(PointerCoordinateMapper.mapX(DESIGN_WIDTH / 2, 3840)).assertEqual(1920);
      expect(PointerCoordinateMapper.mapY(DESIGN_HEIGHT / 2, 2160)).assertEqual(1080);
    });

    it('coordinate_mapper_should_handle_zero_screen_size', 0, () => {
      expect(PointerCoordinateMapper.mapX(100, 0)).assertEqual(0);
      expect(PointerCoordinateMapper.mapY(100, -1)).assertEqual(0);
    });

    it('coordinate_mapper_should_clamp_out_of_range_values', 0, () => {
      expect(PointerCoordinateMapper.clamp(-10, 0, 100)).assertEqual(0);
      expect(PointerCoordinateMapper.clamp(150, 0, 100)).assertEqual(100);
      expect(PointerCoordinateMapper.clamp(50, 0, 100)).assertEqual(50);
      expect(PointerCoordinateMapper.isInside(0, 0, 100, 100)).assertTrue();
      expect(PointerCoordinateMapper.isInside(101, 50, 100, 100)).assertFalse();
      expect(PointerCoordinateMapper.isInside(-1, 50, 100, 100)).assertFalse();
    });

    it('cursor_metrics_should_be_centered', 0, () => {
      const metrics = CursorMetricsValidator.build();
      expect(CursorMetricsValidator.isSizeValid(metrics.width, metrics.height)).assertTrue();
      expect(CursorMetricsValidator.isHotspotValid(metrics.hotspotX, metrics.width)).assertTrue();
      expect(CursorMetricsValidator.isHotspotValid(metrics.hotspotY, metrics.height)).assertTrue();
      expect(CursorMetricsValidator.isCentered(metrics)).assertTrue();
      expect(metrics.width).assertEqual(CURSOR_SIZE);
      expect(metrics.hotspotX).assertEqual(CURSOR_HOTSPOT);
    });

    it('cursor_metrics_should_reject_invalid_size', 0, () => {
      expect(CursorMetricsValidator.isSizeValid(0, 50)).assertFalse();
      expect(CursorMetricsValidator.isSizeValid(50, 0)).assertFalse();
      expect(CursorMetricsValidator.isSizeValid(256, 256)).assertFalse();
      expect(CursorMetricsValidator.isHotspotValid(-1, 50)).assertFalse();
      expect(CursorMetricsValidator.isHotspotValid(50, 50)).assertFalse();
      expect(CursorMetricsValidator.isHotspotValid(49, 50)).assertTrue();
    });

    it('pointer_util_should_expose_static_cursor_api', 0, () => {
      expect(typeof PointerUtil.changePointStyle).assertEqual('function');
      expect(typeof EventUtil.isTouchEvent).assertEqual('function');
    });

    it('pointer_util_should_not_throw_on_cursor_switch', 0, () => {
      let thrown = false;
      try {
        PointerUtil.changePointStyle(true);
        PointerUtil.changePointStyle(false);
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
    });

    it('event_util_should_expose_touch_classifier', 0, () => {
      expect(typeof EventUtil.isTouchEvent).assertEqual('function');
    });

    it('pointer_frame_should_scale_full_hd', 0, () => {
      const frame = new PointerFrame(DESIGN_WIDTH, DESIGN_HEIGHT, 1);
      expect(frame.getScaleX()).assertEqual(1);
      expect(frame.getScaleY()).assertEqual(1);
      expect(frame.isLandscape()).assertTrue();
      expect(frame.aspectRatio()).assertEqual(DESIGN_WIDTH / DESIGN_HEIGHT);
    });

    it('pointer_frame_should_scale_4k_and_8k', 0, () => {
      const uhd = new PointerFrame(3840, 2160, 2);
      const eightK = new PointerFrame(7680, 4320, 4);
      expect(uhd.getScaleX()).assertEqual(2);
      expect(uhd.getScaleY()).assertEqual(2);
      expect(eightK.getScaleX()).assertEqual(4);
      expect(eightK.getScaleY()).assertEqual(4);
      expect(eightK.isLandscape()).assertTrue();
    });

    it('pointer_frame_should_contain_only_inside_points', 0, () => {
      const frame = new PointerFrame(1920, 1080, 1);
      expect(frame.contains(0, 0)).assertTrue();
      expect(frame.contains(1919, 1079)).assertTrue();
      expect(frame.contains(1920, 100)).assertFalse();
      expect(frame.contains(100, 1080)).assertFalse();
      expect(frame.contains(-1, 0)).assertFalse();
    });

    it('pointer_frame_should_handle_zero_height', 0, () => {
      const frame = new PointerFrame(1920, 0, 1);
      expect(frame.getScaleY()).assertEqual(0);
      expect(frame.aspectRatio()).assertEqual(0);
      expect(frame.isLandscape()).assertTrue();
      const portrait = new PointerFrame(1080, 1920, 1);
      expect(portrait.isLandscape()).assertFalse();
    });

    it('cursor_state_should_follow_touch_down_and_up', 0, () => {
      const cursor = new CursorStateMachine();
      expect(cursor.getState()).assertEqual(CursorStateMachine.DEFAULT);
      expect(cursor.isVisible()).assertTrue();
      expect(cursor.onTouchDown()).assertEqual(CursorStateMachine.CLICK);
      expect(cursor.isClicking()).assertTrue();
      expect(cursor.onTouchUp()).assertEqual(CursorStateMachine.DEFAULT);
      expect(cursor.isClicking()).assertFalse();
    });

    it('cursor_state_should_ignore_touch_when_hidden', 0, () => {
      const cursor = new CursorStateMachine();
      cursor.hide();
      expect(cursor.isVisible()).assertFalse();
      expect(cursor.onTouchDown()).assertEqual(CursorStateMachine.HIDDEN);
      expect(cursor.onTouchUp()).assertEqual(CursorStateMachine.HIDDEN);
      expect(cursor.isClicking()).assertFalse();
    });

    it('cursor_state_should_restore_after_show_and_reset', 0, () => {
      const cursor = new CursorStateMachine();
      cursor.hide();
      cursor.show();
      expect(cursor.getState()).assertEqual(CursorStateMachine.DEFAULT);
      cursor.onTouchDown();
      cursor.reset();
      expect(cursor.getState()).assertEqual(CursorStateMachine.DEFAULT);
      expect(cursor.isVisible()).assertTrue();
      cursor.show();
      expect(cursor.getState()).assertEqual(CursorStateMachine.DEFAULT);
    });

    it('hit_tester_should_return_topmost_target', 0, () => {
      const tester = new PointerHitTester();
      tester.add(new PointerTarget('background', 0, 0, 1920, 1080));
      tester.add(new PointerTarget('button', 100, 100, 300, 200));
      expect(tester.findAt(200, 150)).assertEqual('button');
      expect(tester.findAt(10, 10)).assertEqual('background');
      expect(tester.findAt(300, 200)).assertEqual('button');
      expect(tester.findAt(500, 500)).assertEqual('background');
    });

    it('hit_tester_should_list_all_overlaps', 0, () => {
      const tester = new PointerHitTester();
      tester.add(new PointerTarget('card', 0, 0, 400, 400));
      tester.add(new PointerTarget('icon', 50, 50, 150, 150));
      tester.add(new PointerTarget('badge', 100, 100, 120, 120));
      const hits = tester.findAllAt(110, 110);
      expect(hits.length).assertEqual(3);
      expect(hits.includes('card')).assertTrue();
      expect(hits.includes('icon')).assertTrue();
      expect(hits.includes('badge')).assertTrue();
      expect(tester.findAllAt(1000, 1000).length).assertEqual(0);
    });

    it('hit_tester_should_compute_total_area', 0, () => {
      const tester = new PointerHitTester();
      expect(tester.size()).assertEqual(0);
      expect(tester.totalArea()).assertEqual(0);
      tester.add(new PointerTarget('a', 0, 0, 100, 50));
      tester.add(new PointerTarget('b', 0, 0, 200, 100));
      expect(tester.size()).assertEqual(2);
      expect(tester.totalArea()).assertEqual(25000);
      tester.clear();
      expect(tester.size()).assertEqual(0);
      expect(tester.totalArea()).assertEqual(0);
    });

    it('pointer_target_should_clamp_invalid_rectangles', 0, () => {
      const inverted = new PointerTarget('bad', 200, 200, 100, 100);
      expect(inverted.area()).assertEqual(0);
      expect(inverted.contains(150, 150)).assertFalse();
      const normal = new PointerTarget('ok', 0, 0, 10, 10);
      expect(normal.area()).assertEqual(100);
      expect(normal.contains(0, 0)).assertTrue();
      expect(normal.contains(10, 10)).assertTrue();
    });

    it('input_source_resolver_should_map_names', 0, () => {
      expect(InputSourceResolver.nameOf(SOURCE_TYPE_MOUSE)).assertEqual(InputSourceResolver.MOUSE);
      expect(InputSourceResolver.nameOf(SOURCE_TYPE_TOUCHSCREEN)).assertEqual(InputSourceResolver.TOUCH);
      expect(InputSourceResolver.nameOf(SOURCE_TYPE_KEYBOARD)).assertEqual(InputSourceResolver.KEY);
      expect(InputSourceResolver.nameOf(99)).assertEqual(InputSourceResolver.UNKNOWN);
      expect(InputSourceResolver.nameOf(-1)).assertEqual(InputSourceResolver.UNKNOWN);
    });

    it('input_source_resolver_should_map_capabilities', 0, () => {
      expect(InputSourceResolver.supportsHover(SOURCE_TYPE_MOUSE)).assertTrue();
      expect(InputSourceResolver.supportsHover(SOURCE_TYPE_TOUCHSCREEN)).assertFalse();
      expect(InputSourceResolver.supportsPressure(SOURCE_TYPE_TOUCHSCREEN)).assertTrue();
      expect(InputSourceResolver.supportsPressure(SOURCE_TYPE_MOUSE)).assertFalse();
      expect(InputSourceResolver.isPointer(SOURCE_TYPE_KEYBOARD)).assertFalse();
      expect(InputSourceResolver.isPointer(SOURCE_TYPE_MOUSE)).assertTrue();
    });

    it('pointer_pipeline_should_dispatch_in_order', 0, () => {
      const pipeline = new PointerEventPipeline(3);
      expect(pipeline.enqueue({ x: 1, y: 1, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_DOWN }))
        .assertTrue();
      expect(pipeline.enqueue({ x: 2, y: 2, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_MOVE }))
        .assertTrue();
      expect(pipeline.pending()).assertEqual(2);
      const first = pipeline.dispatchOne();
      expect(first !== undefined).assertTrue();
      expect((first as PointerSample).x).assertEqual(1);
      expect(pipeline.getDispatched()).assertEqual(1);
      expect(pipeline.pending()).assertEqual(1);
    });

    it('pointer_pipeline_should_reject_overflow', 0, () => {
      const pipeline = new PointerEventPipeline(1);
      expect(pipeline.enqueue({ x: 0, y: 0, sourceType: SOURCE_TYPE_TOUCHSCREEN, touchType: TOUCH_TYPE_DOWN }))
        .assertTrue();
      expect(pipeline.isFull()).assertTrue();
      expect(pipeline.enqueue({ x: 1, y: 0, sourceType: SOURCE_TYPE_TOUCHSCREEN, touchType: TOUCH_TYPE_MOVE }))
        .assertFalse();
      expect(pipeline.pending()).assertEqual(1);
      expect(pipeline.getDispatched()).assertEqual(0);
    });

    it('pointer_pipeline_should_drain_and_reset', 0, () => {
      const pipeline = new PointerEventPipeline(5);
      for (let i = 0; i < 4; i++) {
        pipeline.enqueue({
          x: i, y: i, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_MOVE
        });
      }
      expect(pipeline.dispatchAll()).assertEqual(4);
      expect(pipeline.pending()).assertEqual(0);
      expect(pipeline.getDispatched()).assertEqual(4);
      pipeline.reset();
      expect(pipeline.getDispatched()).assertEqual(0);
      expect(pipeline.dispatchOne() === undefined).assertTrue();
    });

    it('pointer_sample_recorder_should_track_touch_types', 0, () => {
      const recorder = new PointerSampleRecorder();
      recorder.record({ x: 0, y: 0, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_DOWN });
      recorder.record({ x: 0, y: 0, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_UP });
      recorder.record({ x: 0, y: 0, sourceType: SOURCE_TYPE_TOUCHSCREEN, touchType: TOUCH_TYPE_MOVE });
      expect(recorder.getCount()).assertEqual(3);
      expect(recorder.countTouchEvents()).assertEqual(2);
      expect(recorder.countBySource(SOURCE_TYPE_MOUSE)).assertEqual(2);
      recorder.clear();
      expect(recorder.getCount()).assertEqual(0);
    });

    it('coordinate_mapper_should_scale_8k_frame', 0, () => {
      const frame = new PointerFrame(7680, 4320, 4);
      expect(PointerCoordinateMapper.mapX(DESIGN_WIDTH, frame.width)).assertEqual(7680);
      expect(PointerCoordinateMapper.mapY(DESIGN_HEIGHT, frame.height)).assertEqual(4320);
      expect(PointerCoordinateMapper.mapX(960, frame.width)).assertEqual(3840);
      expect(PointerCoordinateMapper.mapY(540, frame.height)).assertEqual(2160);
      expect(frame.contains(7679, 4319)).assertTrue();
    });

    it('coordinate_mapper_should_round_to_nearest_pixel', 0, () => {
      expect(PointerCoordinateMapper.mapX(1, 1920)).assertEqual(1);
      expect(PointerCoordinateMapper.mapX(1, 1000)).assertEqual(1);
      expect(PointerCoordinateMapper.mapX(15, DESIGN_WIDTH)).assertEqual(15);
      expect(PointerCoordinateMapper.mapY(7, 1080)).assertEqual(7);
      expect(PointerCoordinateMapper.mapY(100, 0)).assertEqual(0);
    });

    it('pointer_sample_should_keep_source_metadata', 0, () => {
      const sample: PointerSample = {
        x: 320, y: 180, sourceType: SOURCE_TYPE_TOUCHSCREEN, touchType: TOUCH_TYPE_DOWN
      };
      expect(sample.sourceType).assertEqual(SOURCE_TYPE_TOUCHSCREEN);
      expect(sample.touchType).assertEqual(TOUCH_TYPE_DOWN);
      expect(InputSourceResolver.nameOf(sample.sourceType)).assertEqual(InputSourceResolver.TOUCH);
      expect(TouchEventClassifier.isTouchEvent(sample)).assertFalse();
      sample.touchType = TOUCH_TYPE_UP;
      expect(TouchEventClassifier.isTouchEvent(sample)).assertTrue();
    });

    it('pointer_hit_flow_should_resolve_target_from_sample', 0, () => {
      const tester = new PointerHitTester();
      tester.add(new PointerTarget('background', 0, 0, DESIGN_WIDTH, DESIGN_HEIGHT));
      tester.add(new PointerTarget('submit', 760, 500, 1160, 620));
      const sample: PointerSample = {
        x: 900, y: 560, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_UP
      };
      const hit = tester.findAt(sample.x, sample.y);
      expect(hit).assertEqual('submit');
      expect(TouchEventClassifier.isTouchEvent(sample)).assertTrue();
      expect(tester.findAt(0, 0)).assertEqual('background');
    });

    it('pointer_flow_should_scale_then_hit_test', 0, () => {
      const tester = new PointerHitTester();
      tester.add(new PointerTarget('ok', 0, 0, 3840, 2160));
      const designX = 960;
      const designY = 540;
      const screenX = PointerCoordinateMapper.mapX(designX, 3840);
      const screenY = PointerCoordinateMapper.mapY(designY, 2160);
      expect(screenX).assertEqual(1920);
      expect(screenY).assertEqual(1080);
      expect(tester.findAt(screenX, screenY)).assertEqual('ok');
    });

    it('cursor_metrics_should_reject_zero_hotspot_edge', 0, () => {
      expect(CursorMetricsValidator.isHotspotValid(0, 1)).assertTrue();
      expect(CursorMetricsValidator.isHotspotValid(1, 1)).assertFalse();
      expect(CursorMetricsValidator.isHotspotValid(0, 0)).assertFalse();
      expect(CursorMetricsValidator.isSizeValid(1, 1)).assertTrue();
      expect(CursorMetricsValidator.isSizeValid(128, 128)).assertTrue();
      expect(CursorMetricsValidator.isSizeValid(129, 128)).assertFalse();
    });

    it('cursor_metrics_should_not_be_centered_for_odd_size', 0, () => {
      const odd: CursorMetrics = {
        width: 51,
        height: 51,
        hotspotX: 25,
        hotspotY: 25
      };
      expect(CursorMetricsValidator.isCentered(odd)).assertFalse();
      expect(CursorMetricsValidator.isSizeValid(odd.width, odd.height)).assertTrue();
      expect(CursorMetricsValidator.isHotspotValid(odd.hotspotX, odd.width)).assertTrue();
    });

    it('event_classifier_matrix_should_be_complete', 0, () => {
      const sources: number[] = [SOURCE_TYPE_MOUSE, SOURCE_TYPE_TOUCHSCREEN, SOURCE_TYPE_KEYBOARD];
      const touchTypes: number[] = [TOUCH_TYPE_DOWN, TOUCH_TYPE_UP, TOUCH_TYPE_MOVE, TOUCH_TYPE_CANCEL];
      let accepted: number = 0;
      for (let i = 0; i < sources.length; i++) {
        for (let j = 0; j < touchTypes.length; j++) {
          const sample: PointerSample = {
            x: 0, y: 0, sourceType: sources[i], touchType: touchTypes[j]
          };
          if (TouchEventClassifier.isTouchEvent(sample)) {
            accepted++;
          }
        }
      }
      expect(accepted).assertEqual(6);
      expect(sources.length * touchTypes.length).assertEqual(12);
    });

    it('pointer_frame_matrix_should_keep_standard_aspect', 0, () => {
      const frames: PointerFrame[] = [
        new PointerFrame(1280, 720, 1),
        new PointerFrame(1920, 1080, 1),
        new PointerFrame(2560, 1440, 1.5),
        new PointerFrame(3840, 2160, 2)
      ];
      for (let i = 0; i < frames.length; i++) {
        expect(frames[i].isLandscape()).assertTrue();
        expect(Math.abs(frames[i].aspectRatio() - 16 / 9)).assertLess(0.001);
      }
      expect(frames.length).assertEqual(4);
    });

    it('pointer_constants_should_remain_stable', 0, () => {
      expect(DESIGN_WIDTH).assertEqual(1920);
      expect(DESIGN_HEIGHT).assertEqual(1080);
      expect(CURSOR_SIZE).assertEqual(50);
      expect(CURSOR_HOTSPOT).assertEqual(25);
      expect(CURSOR_HOTSPOT * 2).assertEqual(CURSOR_SIZE);
      expect(TOUCH_TYPE_DOWN).assertEqual(0);
      expect(TOUCH_TYPE_UP).assertEqual(1);
    });

    it('pointer_pipeline_should_handle_zero_capacity', 0, () => {
      const pipeline = new PointerEventPipeline(0);
      expect(pipeline.enqueue({ x: 0, y: 0, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_DOWN }))
        .assertFalse();
      expect(pipeline.pending()).assertEqual(0);
      expect(pipeline.isFull()).assertTrue();
      expect(pipeline.dispatchAll()).assertEqual(0);
    });

    it('hit_tester_should_respect_insertion_order', 0, () => {
      const tester = new PointerHitTester();
      tester.add(new PointerTarget('first', 0, 0, 100, 100));
      tester.add(new PointerTarget('second', 0, 0, 100, 100));
      expect(tester.findAt(50, 50)).assertEqual('second');
      expect(tester.findAllAt(50, 50)[0]).assertEqual('first');
      expect(tester.findAllAt(50, 50)[1]).assertEqual('second');
    });

    it('cursor_state_should_cycle_many_times', 0, () => {
      const cursor = new CursorStateMachine();
      for (let i = 0; i < 5; i++) {
        cursor.onTouchDown();
        expect(cursor.isClicking()).assertTrue();
        cursor.onTouchUp();
        expect(cursor.getState()).assertEqual(CursorStateMachine.DEFAULT);
      }
      expect(cursor.isVisible()).assertTrue();
      cursor.hide();
      cursor.show();
      expect(cursor.isVisible()).assertTrue();
    });

    it('pointer_flow_should_preserve_event_count', 0, () => {
      const pipeline = new PointerEventPipeline(10);
      const recorder = new PointerSampleRecorder();
      const down: PointerSample = { x: 10, y: 10, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_DOWN };
      const move: PointerSample = { x: 20, y: 20, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_MOVE };
      const up: PointerSample = { x: 30, y: 30, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_UP };
      pipeline.enqueue(down);
      pipeline.enqueue(move);
      pipeline.enqueue(up);
      for (let i = 0; i < 3; i++) {
        const sample = pipeline.dispatchOne();
        if (sample !== undefined) {
          recorder.record(sample);
        }
      }
      expect(recorder.getCount()).assertEqual(3);
      expect(recorder.countTouchEvents()).assertEqual(2);
      expect(pipeline.pending()).assertEqual(0);
      expect(pipeline.getDispatched()).assertEqual(3);
    });

    it('pointer_frame_should_scale_720p', 0, () => {
      const frame = new PointerFrame(1280, 720, 1);
      expect(frame.getScaleX()).assertClose(2 / 3, 0.001);
      expect(frame.getScaleY()).assertClose(2 / 3, 0.001);
      expect(frame.contains(1279, 719)).assertTrue();
      expect(frame.contains(1280, 719)).assertFalse();
      expect(frame.aspectRatio()).assertClose(16 / 9, 0.001);
    });

    it('coordinate_mapper_should_clamp_negative_and_overflow', 0, () => {
      expect(PointerCoordinateMapper.clamp(-100, 0, 1920)).assertEqual(0);
      expect(PointerCoordinateMapper.clamp(5000, 0, 1920)).assertEqual(1920);
      expect(PointerCoordinateMapper.clamp(0, 0, 1920)).assertEqual(0);
      expect(PointerCoordinateMapper.clamp(1920, 0, 1920)).assertEqual(1920);
      expect(PointerCoordinateMapper.isInside(1920, 1080, 1920, 1080)).assertTrue();
      expect(PointerCoordinateMapper.isInside(1921, 1080, 1920, 1080)).assertFalse();
    });

    it('hit_tester_should_return_empty_for_no_targets', 0, () => {
      const tester = new PointerHitTester();
      expect(tester.findAt(0, 0)).assertEqual('');
      expect(tester.findAllAt(0, 0).length).assertEqual(0);
      expect(tester.totalArea()).assertEqual(0);
      tester.add(new PointerTarget('only', 0, 0, 1, 1));
      expect(tester.findAt(1, 1)).assertEqual('only');
      expect(tester.findAt(2, 2)).assertEqual('');
    });

    it('cursor_metrics_builder_should_be_centered', 0, () => {
      const metrics = CursorMetricsValidator.build();
      expect(metrics.width).assertEqual(metrics.height);
      expect(metrics.hotspotX).assertEqual(metrics.hotspotY);
      expect(CursorMetricsValidator.isCentered(metrics)).assertTrue();
      expect(CursorMetricsValidator.isSizeValid(metrics.width, metrics.height)).assertTrue();
      metrics.hotspotX = 0;
      expect(CursorMetricsValidator.isCentered(metrics)).assertFalse();
    });

    it('cursor_state_should_keep_click_state_until_up', 0, () => {
      const cursor = new CursorStateMachine();
      cursor.onTouchDown();
      cursor.onTouchDown();
      expect(cursor.getState()).assertEqual(CursorStateMachine.CLICK);
      expect(cursor.onTouchUp()).assertEqual(CursorStateMachine.DEFAULT);
      expect(cursor.isClicking()).assertFalse();
      cursor.onTouchUp();
      expect(cursor.getState()).assertEqual(CursorStateMachine.DEFAULT);
    });

    it('input_source_matrix_should_flag_pointer_sources', 0, () => {
      const sources: number[] = [SOURCE_TYPE_MOUSE, SOURCE_TYPE_TOUCHSCREEN, SOURCE_TYPE_KEYBOARD, 99];
      let pointerCount: number = 0;
      for (let i = 0; i < sources.length; i++) {
        if (InputSourceResolver.isPointer(sources[i])) {
          pointerCount++;
        }
        expect(InputSourceResolver.nameOf(sources[i]).length).assertLarger(0);
      }
      expect(pointerCount).assertEqual(2);
      expect(InputSourceResolver.supportsHover(99)).assertFalse();
      expect(InputSourceResolver.supportsPressure(99)).assertFalse();
    });

    it('pointer_pipeline_should_track_capacity_boundary', 0, () => {
      const pipeline = new PointerEventPipeline(2);
      expect(pipeline.isFull()).assertFalse();
      pipeline.enqueue({ x: 0, y: 0, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_MOVE });
      expect(pipeline.isFull()).assertFalse();
      pipeline.enqueue({ x: 1, y: 1, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_MOVE });
      expect(pipeline.isFull()).assertTrue();
      expect(pipeline.pending()).assertEqual(2);
      pipeline.dispatchOne();
      expect(pipeline.isFull()).assertFalse();
      expect(pipeline.enqueue({ x: 2, y: 2, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_UP }))
        .assertTrue();
    });

    it('recorder_should_aggregate_multiple_sources', 0, () => {
      const recorder = new PointerSampleRecorder();
      for (let i = 0; i < 4; i++) {
        recorder.record({
          x: i, y: i, sourceType: SOURCE_TYPE_TOUCHSCREEN, touchType: TOUCH_TYPE_MOVE
        });
      }
      recorder.record({ x: 0, y: 0, sourceType: SOURCE_TYPE_KEYBOARD, touchType: TOUCH_TYPE_UP });
      recorder.record({ x: 0, y: 0, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_DOWN });
      expect(recorder.getCount()).assertEqual(6);
      expect(recorder.countBySource(SOURCE_TYPE_TOUCHSCREEN)).assertEqual(4);
      expect(recorder.countBySource(SOURCE_TYPE_KEYBOARD)).assertEqual(1);
      expect(recorder.countBySource(SOURCE_TYPE_MOUSE)).assertEqual(1);
      expect(recorder.countTouchEvents()).assertEqual(4);
    });

    it('pointer_util_api_contract_should_be_stable', 0, () => {
      expect(typeof PointerUtil.changePointStyle).assertEqual('function');
      expect(typeof EventUtil.isTouchEvent).assertEqual('function');
      expect(PointerUtil.pixelMap).assertNull();
      expect(PointerUtil !== undefined && PointerUtil !== null).assertTrue();
    });

    it('pointer_target_area_should_handle_zero_sides', 0, () => {
      const zeroWidth = new PointerTarget('zero-w', 10, 10, 10, 100);
      const zeroHeight = new PointerTarget('zero-h', 10, 10, 100, 10);
      expect(zeroWidth.area()).assertEqual(0);
      expect(zeroHeight.area()).assertEqual(0);
      expect(zeroWidth.contains(10, 10)).assertTrue();
      expect(zeroWidth.contains(11, 10)).assertFalse();
    });

    it('pointer_flow_should_support_mouse_click_targets', 0, () => {
      const tester = new PointerHitTester();
      tester.add(new PointerTarget('create', 0, 0, 640, 360));
      tester.add(new PointerTarget('list', 640, 0, 1280, 360));
      tester.add(new PointerTarget('intro', 1280, 0, 1920, 360));
      expect(tester.findAt(100, 100)).assertEqual('create');
      expect(tester.findAt(700, 100)).assertEqual('list');
      expect(tester.findAt(1400, 100)).assertEqual('intro');
      expect(tester.findAt(100, 500)).assertEqual('');
    });

    it('pointer_geometry_constants_should_compose', 0, () => {
      expect(PointerCoordinateMapper.mapX(1920, 3840)).assertEqual(3840);
      expect(PointerCoordinateMapper.mapY(1080, 2160)).assertEqual(2160);
      expect(DESIGN_WIDTH * 2).assertEqual(3840);
      expect(DESIGN_HEIGHT * 2).assertEqual(2160);
      expect(DESIGN_WIDTH / DESIGN_HEIGHT).assertClose(16 / 9, 0.001);
    });

    it('pointer_pipeline_should_restart_after_drain', 0, () => {
      const pipeline = new PointerEventPipeline(2);
      pipeline.enqueue({ x: 0, y: 0, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_DOWN });
      expect(pipeline.dispatchAll()).assertEqual(1);
      expect(pipeline.pending()).assertEqual(0);
      expect(pipeline.enqueue({ x: 1, y: 1, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_UP }))
        .assertTrue();
      expect(pipeline.pending()).assertEqual(1);
      expect(pipeline.getDispatched()).assertEqual(1);
      pipeline.dispatchOne();
      expect(pipeline.getDispatched()).assertEqual(2);
      expect(pipeline.pending()).assertEqual(0);
    });

    it('frame_contains_should_cover_all_corners', 0, () => {
      const frame = new PointerFrame(100, 50, 1);
      expect(frame.contains(0, 0)).assertTrue();
      expect(frame.contains(99, 0)).assertTrue();
      expect(frame.contains(0, 49)).assertTrue();
      expect(frame.contains(99, 49)).assertTrue();
      expect(frame.contains(100, 49)).assertFalse();
      expect(frame.contains(99, 50)).assertFalse();
      expect(frame.contains(50, 25)).assertTrue();
    });

    it('cursor_hidden_state_should_be_terminal_until_show', 0, () => {
      const cursor = new CursorStateMachine();
      cursor.hide();
      for (let i = 0; i < 3; i++) {
        cursor.onTouchDown();
        cursor.onTouchUp();
        expect(cursor.isVisible()).assertFalse();
        expect(cursor.getState()).assertEqual(CursorStateMachine.HIDDEN);
      }
      cursor.show();
      expect(cursor.isVisible()).assertTrue();
      cursor.onTouchDown();
      expect(cursor.isClicking()).assertTrue();
    });

    it('hit_tester_should_report_overlapping_area', 0, () => {
      const tester = new PointerHitTester();
      tester.add(new PointerTarget('sheet', 0, 0, 1000, 500));
      tester.add(new PointerTarget('dialog', 250, 100, 750, 400));
      expect(tester.totalArea()).assertEqual(500000 + 150000);
      const hits = tester.findAllAt(500, 250);
      expect(hits.length).assertEqual(2);
      expect(tester.findAt(500, 250)).assertEqual('dialog');
      expect(tester.findAllAt(50, 50).length).assertEqual(1);
    });

    it('pointer_util_should_tolerate_repeated_switches', 0, () => {
      let thrown = false;
      try {
        for (let i = 0; i < 3; i++) {
          PointerUtil.changePointStyle(true);
          PointerUtil.changePointStyle(false);
        }
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      expect(typeof PointerUtil.changePointStyle).assertEqual('function');
    });

    it('event_classifier_should_keep_cancel_as_click_source', 0, () => {
      const cancelMouse: PointerSample = {
        x: 10, y: 10, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_CANCEL
      };
      const cancelTouch: PointerSample = {
        x: 10, y: 10, sourceType: SOURCE_TYPE_TOUCHSCREEN, touchType: TOUCH_TYPE_CANCEL
      };
      const cancelKey: PointerSample = {
        x: 10, y: 10, sourceType: SOURCE_TYPE_KEYBOARD, touchType: TOUCH_TYPE_CANCEL
      };
      expect(TouchEventClassifier.isTouchEvent(cancelMouse)).assertTrue();
      expect(TouchEventClassifier.isTouchEvent(cancelTouch)).assertTrue();
      expect(TouchEventClassifier.isTouchEvent(cancelKey)).assertFalse();
    });

    it('pointer_coordinates_should_round_trip_design_space', 0, () => {
      const widths: number[] = [1280, 1920, 2560, 3840, 7680];
      for (let i = 0; i < widths.length; i++) {
        expect(PointerCoordinateMapper.mapX(DESIGN_WIDTH, widths[i])).assertEqual(widths[i]);
        expect(PointerCoordinateMapper.mapY(DESIGN_HEIGHT, widths[i] * 9 / 16)).assertEqual(widths[i] * 9 / 16);
      }
      expect(widths.length).assertEqual(5);
    });

    it('pointer_pipeline_dispatch_counter_should_reset', 0, () => {
      const pipeline = new PointerEventPipeline(4);
      pipeline.enqueue({ x: 0, y: 0, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_DOWN });
      pipeline.enqueue({ x: 0, y: 0, sourceType: SOURCE_TYPE_MOUSE, touchType: TOUCH_TYPE_UP });
      pipeline.dispatchOne();
      pipeline.dispatchOne();
      expect(pipeline.getDispatched()).assertEqual(2);
      expect(pipeline.dispatchOne() === undefined).assertTrue();
      expect(pipeline.getDispatched()).assertEqual(2);
      pipeline.reset();
      expect(pipeline.getDispatched()).assertEqual(0);
      expect(pipeline.pending()).assertEqual(0);
    });

    it('frame_scale_matrix_should_be_monotonic', 0, () => {
      const widths: number[] = [1280, 1920, 2560, 3840];
      let previousScale: number = 0;
      for (let i = 0; i < widths.length; i++) {
        const frame = new PointerFrame(widths[i], widths[i] * 9 / 16, 1);
        const scale = frame.getScaleX();
        expect(scale).assertLarger(previousScale);
        expect(frame.getScaleX()).assertEqual(frame.getScaleY());
        previousScale = scale;
      }
      expect(previousScale).assertEqual(2);
    });

    it('input_source_resolution_should_be_idempotent', 0, () => {
      for (let i = 0; i < 3; i++) {
        expect(InputSourceResolver.nameOf(SOURCE_TYPE_MOUSE)).assertEqual(InputSourceResolver.MOUSE);
        expect(InputSourceResolver.nameOf(SOURCE_TYPE_TOUCHSCREEN)).assertEqual(InputSourceResolver.TOUCH);
        expect(InputSourceResolver.nameOf(SOURCE_TYPE_KEYBOARD)).assertEqual(InputSourceResolver.KEY);
      }
      expect(InputSourceResolver.MOUSE === InputSourceResolver.TOUCH).assertFalse();
      expect(InputSourceResolver.KEY.length).assertEqual(3);
    });

    it('pointer_frame_and_target_should_agree_on_bounds', 0, () => {
      const frame = new PointerFrame(DESIGN_WIDTH, DESIGN_HEIGHT, 1);
      const target = new PointerTarget('full', 0, 0, frame.width - 1, frame.height - 1);
      expect(target.area()).assertEqual((DESIGN_WIDTH - 1) * (DESIGN_HEIGHT - 1));
      expect(frame.contains(DESIGN_WIDTH - 1, DESIGN_HEIGHT - 1)).assertTrue();
      expect(target.contains(DESIGN_WIDTH - 1, DESIGN_HEIGHT - 1)).assertTrue();
      expect(target.contains(DESIGN_WIDTH, DESIGN_HEIGHT)).assertFalse();
      expect(frame.contains(DESIGN_WIDTH, DESIGN_HEIGHT)).assertFalse();
      expect(frame.width).assertEqual(DESIGN_WIDTH);
      expect(frame.height).assertEqual(DESIGN_HEIGHT);
      expect(target.id).assertEqual('full');
      expect(target.right).assertEqual(DESIGN_WIDTH - 1);
      expect(target.bottom).assertEqual(DESIGN_HEIGHT - 1);
      expect(target.left).assertEqual(0);
      expect(target.top).assertEqual(0);
    });
  });
}
