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
import hilog from '@ohos.hilog';
import {
  KEY_ENTER, KEY_BACK, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

enum InteractionType {
  CLICK = 0,
  LONG_PRESS = 1,
  SWIPE = 2,
  KEY = 3,
  TOUCH = 4
}

enum SwipeDirection {
  NONE = 0,
  LEFT = 1,
  RIGHT = 2,
  UP = 3,
  DOWN = 4
}

class Point {
  readonly x: number;
  readonly y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

class InteractionEvent {
  readonly seq: number;
  readonly type: InteractionType;
  readonly targetId: string;
  readonly keyCode: number;
  readonly point: Point;

  constructor(seq: number, type: InteractionType, targetId: string, keyCode: number, point: Point) {
    this.seq = seq;
    this.type = type;
    this.targetId = targetId;
    this.keyCode = keyCode;
    this.point = point;
  }

  isKeyEvent(): boolean {
    return this.type === InteractionType.KEY;
  }

  isPointerEvent(): boolean {
    return this.type === InteractionType.CLICK || this.type === InteractionType.TOUCH ||
      this.type === InteractionType.LONG_PRESS || this.type === InteractionType.SWIPE;
  }

  describe(): string {
    return `${this.seq}:${this.type}:${this.targetId}:${this.keyCode}`;
  }
}

class InteractionQueue {
  private items: InteractionEvent[] = [];

  enqueue(event: InteractionEvent): void {
    this.items.push(event);
  }

  size(): number {
    return this.items.length;
  }

  isEmpty(): boolean {
    return this.items.length === 0;
  }

  dequeue(): InteractionEvent | null {
    if (this.items.length === 0) {
      return null;
    }
    const first: InteractionEvent | undefined = this.items.shift();
    if (first === undefined) {
      return null;
    }
    return first;
  }

  peek(): InteractionEvent | null {
    if (this.items.length === 0) {
      return null;
    }
    return this.items[0];
  }

  clear(): void {
    this.items = [];
  }

  countByType(type: InteractionType): number {
    let count = 0;
    for (const item of this.items) {
      if (item.type === type) {
        count += 1;
      }
    }
    return count;
  }

  keyCodes(): number[] {
    const codes: number[] = [];
    for (const item of this.items) {
      if (item.isKeyEvent()) {
        codes.push(item.keyCode);
      }
    }
    return codes;
  }
}

class InteractionDispatcher {
  private targets: string[] = [];
  private accepted: number = 0;
  private rejected: number = 0;
  private lastTarget: string = '';

  registerTarget(id: string): void {
    if (this.targets.indexOf(id) < 0) {
      this.targets.push(id);
    }
  }

  isRegistered(id: string): boolean {
    return this.targets.indexOf(id) >= 0;
  }

  dispatch(event: InteractionEvent): boolean {
    if (event.type === InteractionType.KEY) {
      this.accepted += 1;
      this.lastTarget = 'keyboard';
      return true;
    }
    if (this.isRegistered(event.targetId)) {
      this.accepted += 1;
      this.lastTarget = event.targetId;
      return true;
    }
    this.rejected += 1;
    return false;
  }

  dispatchAll(events: InteractionEvent[]): number {
    let accepted = 0;
    for (const event of events) {
      if (this.dispatch(event)) {
        accepted += 1;
      }
    }
    return accepted;
  }

  acceptedCount(): number {
    return this.accepted;
  }

  rejectedCount(): number {
    return this.rejected;
  }

  lastAcceptedTarget(): string {
    return this.lastTarget;
  }

  targetCount(): number {
    return this.targets.length;
  }
}

class GestureRecognizer {
  private points: Point[] = [];
  private threshold: number;

  constructor(threshold: number) {
    this.threshold = threshold;
  }

  addPoint(point: Point): void {
    this.points.push(point);
  }

  pointCount(): number {
    return this.points.length;
  }

  reset(): void {
    this.points = [];
  }

  dx(): number {
    if (this.points.length < 2) {
      return 0;
    }
    return this.points[this.points.length - 1].x - this.points[0].x;
  }

  dy(): number {
    if (this.points.length < 2) {
      return 0;
    }
    return this.points[this.points.length - 1].y - this.points[0].y;
  }

  distance(): number {
    const deltaX = this.dx();
    const deltaY = this.dy();
    return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
  }

  direction(): SwipeDirection {
    if (this.points.length < 2 || this.distance() < this.threshold) {
      return SwipeDirection.NONE;
    }
    const deltaX = this.dx();
    const deltaY = this.dy();
    if (Math.abs(deltaX) >= Math.abs(deltaY)) {
      return deltaX >= 0 ? SwipeDirection.RIGHT : SwipeDirection.LEFT;
    }
    return deltaY >= 0 ? SwipeDirection.DOWN : SwipeDirection.UP;
  }
}

class KeySequence {
  private keys: number[] = [];

  push(keyCode: number): void {
    this.keys.push(keyCode);
  }

  size(): number {
    return this.keys.length;
  }

  contains(keyCode: number): boolean {
    return this.keys.indexOf(keyCode) >= 0;
  }

  countOf(keyCode: number): number {
    let count = 0;
    for (const key of this.keys) {
      if (key === keyCode) {
        count += 1;
      }
    }
    return count;
  }

  last(): number {
    if (this.keys.length === 0) {
      return -1;
    }
    return this.keys[this.keys.length - 1];
  }

  reversed(): number[] {
    const result: number[] = [];
    for (let i = this.keys.length - 1; i >= 0; i--) {
      result.push(this.keys[i]);
    }
    return result;
  }

  reset(): void {
    this.keys = [];
  }
}

class InteractionRecorder {
  private history: InteractionEvent[] = [];

  record(event: InteractionEvent): void {
    this.history.push(event);
  }

  count(): number {
    return this.history.length;
  }

  countByType(type: InteractionType): number {
    let count = 0;
    for (const event of this.history) {
      if (event.type === type) {
        count += 1;
      }
    }
    return count;
  }

  lastTarget(): string {
    if (this.history.length === 0) {
      return '';
    }
    return this.history[this.history.length - 1].targetId;
  }

  targets(): string[] {
    const result: string[] = [];
    for (const event of this.history) {
      result.push(event.targetId);
    }
    return result;
  }

  reset(): void {
    this.history = [];
  }
}

function makeEvent(seq: number, type: InteractionType, targetId: string,
  keyCode: number, x: number, y: number): InteractionEvent {
  return new InteractionEvent(seq, type, targetId, keyCode, new Point(x, y));
}

function buildQueue(): InteractionQueue {
  const queue = new InteractionQueue();
  queue.enqueue(makeEvent(1, InteractionType.CLICK, 'entryAbilityContext', 0, 100, 200));
  queue.enqueue(makeEvent(2, InteractionType.CLICK, 'startAbility', 0, 100, 300));
  queue.enqueue(makeEvent(3, InteractionType.KEY, 'scroll', KEY_DOWN, 0, 0));
  queue.enqueue(makeEvent(4, InteractionType.SWIPE, 'scroll', 0, 100, 400));
  queue.enqueue(makeEvent(5, InteractionType.KEY, 'scroll', KEY_ENTER, 0, 0));
  return queue;
}

export default function abilityContextInteractionTest(): void {
  describe('AbilityContextInteractionSuite', () => {
    let queue: InteractionQueue = buildQueue();

    beforeAll(() => {
      queue = buildQueue();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'interaction suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'interaction suite end');
    });

    it('AbilityContextInteraction_001', 0, async (done: Function) => {
      expect(queue.size()).assertEqual(5);
      expect(queue.isEmpty()).assertFalse();
      expect(queue.countByType(InteractionType.CLICK)).assertEqual(2);
      expect(queue.countByType(InteractionType.KEY)).assertEqual(2);
      done();
    });

    it('AbilityContextInteraction_002', 0, async (done: Function) => {
      const first = queue.peek();
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.seq).assertEqual(1);
        expect(first.targetId).assertEqual('entryAbilityContext');
        expect(first.isPointerEvent()).assertTrue();
      }
      expect(queue.size()).assertEqual(5);
      done();
    });

    it('AbilityContextInteraction_003', 0, async (done: Function) => {
      const first = queue.dequeue();
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.seq).assertEqual(1);
      }
      expect(queue.size()).assertEqual(4);
      const second = queue.dequeue();
      expect(second !== null && second.seq === 2).assertTrue();
      done();
    });

    it('AbilityContextInteraction_004', 0, async (done: Function) => {
      const codes = queue.keyCodes();
      expect(codes.length).assertEqual(2);
      expect(codes[0]).assertEqual(KEY_DOWN);
      expect(codes[1]).assertEqual(KEY_ENTER);
      done();
    });

    it('AbilityContextInteraction_005', 0, async (done: Function) => {
      const local = buildQueue();
      local.clear();
      expect(local.size()).assertEqual(0);
      expect(local.isEmpty()).assertTrue();
      expect(local.dequeue()).assertNull();
      expect(local.peek()).assertNull();
      done();
    });

    it('AbilityContextInteraction_006', 0, async (done: Function) => {
      const event = makeEvent(9, InteractionType.KEY, 'scroll', KEY_BACK, 0, 0);
      expect(event.isKeyEvent()).assertTrue();
      expect(event.isPointerEvent()).assertFalse();
      expect(event.describe()).assertEqual('9:3:scroll:2');
      done();
    });

    it('AbilityContextInteraction_007', 0, async (done: Function) => {
      const click = makeEvent(1, InteractionType.CLICK, 'entryBundle', 0, 10, 20);
      const touch = makeEvent(2, InteractionType.TOUCH, 'entryBundle', 0, 10, 20);
      const press = makeEvent(3, InteractionType.LONG_PRESS, 'entryBundle', 0, 10, 20);
      expect(click.isPointerEvent()).assertTrue();
      expect(touch.isPointerEvent()).assertTrue();
      expect(press.isPointerEvent()).assertTrue();
      expect(click.isKeyEvent()).assertFalse();
      done();
    });

    it('AbilityContextInteraction_008', 0, async (done: Function) => {
      const dispatcher = new InteractionDispatcher();
      dispatcher.registerTarget('startAbility');
      dispatcher.registerTarget('startServiceExtAbility');
      expect(dispatcher.targetCount()).assertEqual(2);
      expect(dispatcher.isRegistered('startAbility')).assertTrue();
      expect(dispatcher.isRegistered('missing')).assertFalse();
      done();
    });

    it('AbilityContextInteraction_009', 0, async (done: Function) => {
      const dispatcher = new InteractionDispatcher();
      dispatcher.registerTarget('startAbility');
      const accepted = dispatcher.dispatch(makeEvent(1, InteractionType.CLICK, 'startAbility', 0, 1, 1));
      expect(accepted).assertTrue();
      expect(dispatcher.acceptedCount()).assertEqual(1);
      expect(dispatcher.rejectedCount()).assertEqual(0);
      expect(dispatcher.lastAcceptedTarget()).assertEqual('startAbility');
      done();
    });

    it('AbilityContextInteraction_010', 0, async (done: Function) => {
      const dispatcher = new InteractionDispatcher();
      dispatcher.registerTarget('startAbility');
      const rejected = dispatcher.dispatch(makeEvent(1, InteractionType.CLICK, 'unknown', 0, 1, 1));
      expect(rejected).assertFalse();
      expect(dispatcher.acceptedCount()).assertEqual(0);
      expect(dispatcher.rejectedCount()).assertEqual(1);
      done();
    });

    it('AbilityContextInteraction_011', 0, async (done: Function) => {
      const dispatcher = new InteractionDispatcher();
      const keyAccepted = dispatcher.dispatch(makeEvent(1, InteractionType.KEY, 'none', KEY_ENTER, 0, 0));
      expect(keyAccepted).assertTrue();
      expect(dispatcher.lastAcceptedTarget()).assertEqual('keyboard');
      expect(dispatcher.acceptedCount()).assertEqual(1);
      done();
    });

    it('AbilityContextInteraction_012', 0, async (done: Function) => {
      const dispatcher = new InteractionDispatcher();
      dispatcher.registerTarget('a');
      const events: InteractionEvent[] = [
        makeEvent(1, InteractionType.CLICK, 'a', 0, 1, 1),
        makeEvent(2, InteractionType.CLICK, 'b', 0, 1, 1),
        makeEvent(3, InteractionType.KEY, 'a', KEY_ENTER, 0, 0)
      ];
      const accepted = dispatcher.dispatchAll(events);
      expect(accepted).assertEqual(2);
      expect(dispatcher.rejectedCount()).assertEqual(1);
      done();
    });

    it('AbilityContextInteraction_013', 0, async (done: Function) => {
      const recognizer = new GestureRecognizer(10);
      recognizer.addPoint(new Point(100, 100));
      recognizer.addPoint(new Point(200, 100));
      expect(recognizer.pointCount()).assertEqual(2);
      expect(recognizer.dx()).assertEqual(100);
      expect(recognizer.dy()).assertEqual(0);
      expect(recognizer.direction()).assertEqual(SwipeDirection.RIGHT);
      done();
    });

    it('AbilityContextInteraction_014', 0, async (done: Function) => {
      const recognizer = new GestureRecognizer(10);
      recognizer.addPoint(new Point(200, 100));
      recognizer.addPoint(new Point(100, 100));
      expect(recognizer.direction()).assertEqual(SwipeDirection.LEFT);
      expect(recognizer.distance()).assertEqual(100);
      done();
    });

    it('AbilityContextInteraction_015', 0, async (done: Function) => {
      const recognizer = new GestureRecognizer(10);
      recognizer.addPoint(new Point(100, 300));
      recognizer.addPoint(new Point(100, 100));
      expect(recognizer.direction()).assertEqual(SwipeDirection.UP);
      expect(recognizer.dy()).assertEqual(-200);
      done();
    });

    it('AbilityContextInteraction_016', 0, async (done: Function) => {
      const recognizer = new GestureRecognizer(10);
      recognizer.addPoint(new Point(100, 100));
      recognizer.addPoint(new Point(100, 300));
      expect(recognizer.direction()).assertEqual(SwipeDirection.DOWN);
      expect(recognizer.dy()).assertEqual(200);
      done();
    });

    it('AbilityContextInteraction_017', 0, async (done: Function) => {
      const recognizer = new GestureRecognizer(20);
      recognizer.addPoint(new Point(100, 100));
      recognizer.addPoint(new Point(105, 105));
      expect(recognizer.direction()).assertEqual(SwipeDirection.NONE);
      expect(recognizer.distance() < 20).assertTrue();
      done();
    });

    it('AbilityContextInteraction_018', 0, async (done: Function) => {
      const recognizer = new GestureRecognizer(10);
      recognizer.addPoint(new Point(10, 10));
      recognizer.addPoint(new Point(90, 10));
      expect(recognizer.direction()).assertEqual(SwipeDirection.RIGHT);
      recognizer.reset();
      expect(recognizer.pointCount()).assertEqual(0);
      expect(recognizer.dx()).assertEqual(0);
      expect(recognizer.direction()).assertEqual(SwipeDirection.NONE);
      done();
    });

    it('AbilityContextInteraction_019', 0, async (done: Function) => {
      const sequence = new KeySequence();
      sequence.push(KEY_DOWN);
      sequence.push(KEY_ENTER);
      sequence.push(KEY_BACK);
      expect(sequence.size()).assertEqual(3);
      expect(sequence.contains(KEY_ENTER)).assertTrue();
      expect(sequence.contains(KEY_LEFT)).assertFalse();
      done();
    });

    it('AbilityContextInteraction_020', 0, async (done: Function) => {
      const sequence = new KeySequence();
      sequence.push(KEY_DOWN);
      sequence.push(KEY_DOWN);
      sequence.push(KEY_ENTER);
      expect(sequence.countOf(KEY_DOWN)).assertEqual(2);
      expect(sequence.countOf(KEY_ENTER)).assertEqual(1);
      expect(sequence.last()).assertEqual(KEY_ENTER);
      done();
    });

    it('AbilityContextInteraction_021', 0, async (done: Function) => {
      const sequence = new KeySequence();
      sequence.push(KEY_UP);
      sequence.push(KEY_RIGHT);
      sequence.push(KEY_DOWN);
      const reversed = sequence.reversed();
      expect(reversed.length).assertEqual(3);
      expect(reversed[0]).assertEqual(KEY_DOWN);
      expect(reversed[1]).assertEqual(KEY_RIGHT);
      expect(reversed[2]).assertEqual(KEY_UP);
      done();
    });

    it('AbilityContextInteraction_022', 0, async (done: Function) => {
      const sequence = new KeySequence();
      expect(sequence.last()).assertEqual(-1);
      sequence.push(KEY_LEFT);
      sequence.reset();
      expect(sequence.size()).assertEqual(0);
      expect(sequence.last()).assertEqual(-1);
      done();
    });

    it('AbilityContextInteraction_023', 0, async (done: Function) => {
      const recorder = new InteractionRecorder();
      recorder.record(makeEvent(1, InteractionType.CLICK, 'entryWindow', 0, 1, 1));
      recorder.record(makeEvent(2, InteractionType.KEY, 'scroll', KEY_ENTER, 0, 0));
      expect(recorder.count()).assertEqual(2);
      expect(recorder.countByType(InteractionType.CLICK)).assertEqual(1);
      expect(recorder.countByType(InteractionType.KEY)).assertEqual(1);
      done();
    });

    it('AbilityContextInteraction_024', 0, async (done: Function) => {
      const recorder = new InteractionRecorder();
      recorder.record(makeEvent(1, InteractionType.CLICK, 'a', 0, 1, 1));
      recorder.record(makeEvent(2, InteractionType.CLICK, 'b', 0, 1, 1));
      recorder.record(makeEvent(3, InteractionType.TOUCH, 'c', 0, 1, 1));
      expect(recorder.countByType(InteractionType.CLICK)).assertEqual(2);
      expect(recorder.countByType(InteractionType.TOUCH)).assertEqual(1);
      expect(recorder.countByType(InteractionType.SWIPE)).assertEqual(0);
      done();
    });

    it('AbilityContextInteraction_025', 0, async (done: Function) => {
      const recorder = new InteractionRecorder();
      expect(recorder.lastTarget()).assertEqual('');
      recorder.record(makeEvent(1, InteractionType.CLICK, 'first', 0, 1, 1));
      recorder.record(makeEvent(2, InteractionType.CLICK, 'second', 0, 1, 1));
      expect(recorder.lastTarget()).assertEqual('second');
      done();
    });

    it('AbilityContextInteraction_026', 0, async (done: Function) => {
      const recorder = new InteractionRecorder();
      recorder.record(makeEvent(1, InteractionType.CLICK, 'a', 0, 1, 1));
      recorder.record(makeEvent(2, InteractionType.KEY, 'b', KEY_ENTER, 0, 0));
      const targets = recorder.targets();
      expect(targets.length).assertEqual(2);
      expect(targets[0]).assertEqual('a');
      expect(targets[1]).assertEqual('b');
      done();
    });

    it('AbilityContextInteraction_027', 0, async (done: Function) => {
      const recorder = new InteractionRecorder();
      recorder.record(makeEvent(1, InteractionType.CLICK, 'a', 0, 1, 1));
      recorder.reset();
      expect(recorder.count()).assertEqual(0);
      expect(recorder.lastTarget()).assertEqual('');
      expect(recorder.targets().length).assertEqual(0);
      done();
    });

    it('AbilityContextInteraction_028', 0, async (done: Function) => {
      const local = buildQueue();
      local.dequeue();
      const next = local.peek();
      expect(next !== null).assertTrue();
      if (next !== null) {
        expect(next.seq).assertEqual(2);
      }
      expect(local.size()).assertEqual(4);
      done();
    });

    it('AbilityContextInteraction_029', 0, async (done: Function) => {
      const dispatcher = new InteractionDispatcher();
      const accepted = dispatcher.dispatchAll([]);
      expect(accepted).assertEqual(0);
      expect(dispatcher.acceptedCount()).assertEqual(0);
      expect(dispatcher.rejectedCount()).assertEqual(0);
      done();
    });

    it('AbilityContextInteraction_030', 0, async (done: Function) => {
      const local = buildQueue();
      local.clear();
      local.enqueue(makeEvent(6, InteractionType.CLICK, 'entryFormExt', 0, 5, 5));
      expect(local.size()).assertEqual(1);
      const event = local.peek();
      expect(event !== null && event.seq === 6).assertTrue();
      done();
    });

    it('AbilityContextInteraction_031', 0, async (done: Function) => {
      const dispatcher = new InteractionDispatcher();
      dispatcher.registerTarget('startAbility');
      expect(dispatcher.dispatch(makeEvent(1, InteractionType.CLICK, 'startAbility', 0, 1, 1))).assertTrue();
      expect(dispatcher.dispatch(makeEvent(2, InteractionType.CLICK, 'startAbility', 0, 1, 1))).assertTrue();
      expect(dispatcher.acceptedCount()).assertEqual(2);
      expect(dispatcher.targetCount()).assertEqual(1);
      done();
    });

    it('AbilityContextInteraction_032', 0, async (done: Function) => {
      expect(DELAY_KEY_NAVIGATION).assertEqual(50);
      expect(DELAY_KEY_NAVIGATION * 2).assertEqual(100);
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_RIGHT).assertEqual(2015);
      const sum = KEY_UP + KEY_DOWN;
      expect(sum).assertEqual(4025);
      done();
    });
  });
}


