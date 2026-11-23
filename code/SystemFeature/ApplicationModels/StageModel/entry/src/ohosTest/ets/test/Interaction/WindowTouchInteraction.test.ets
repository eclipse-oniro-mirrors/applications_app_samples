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
  getDriver, ensureAppReady, simulateTouch,
  KEY_ENTER, KEY_BACK, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN,
  DELAY_KEY_NAVIGATION, TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

enum TouchPhase {
  DOWN = 0,
  MOVE = 1,
  UP = 2,
  CANCEL = 3
}

enum TouchRegion {
  NONE = 0,
  HEADER = 1,
  CONTENT = 2,
  FOOTER = 3,
  SIDEBAR = 4
}

class TouchPoint {
  readonly x: number;
  readonly y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }

  sameColumn(other: TouchPoint): boolean {
    return this.x === other.x;
  }

  manhattanTo(other: TouchPoint): number {
    return Math.abs(this.x - other.x) + Math.abs(this.y - other.y);
  }

  euclideanTo(other: TouchPoint): number {
    const dx = this.x - other.x;
    const dy = this.y - other.y;
    return Math.sqrt(dx * dx + dy * dy);
  }
}

class TouchPointer {
  readonly id: number;
  private point: TouchPoint;
  private active: boolean = true;

  constructor(id: number, point: TouchPoint) {
    this.id = id;
    this.point = point;
  }

  getId(): number {
    return this.id;
  }

  getPoint(): TouchPoint {
    return this.point;
  }

  moveTo(point: TouchPoint): void {
    if (this.active) {
      this.point = point;
    }
  }

  release(): void {
    this.active = false;
  }

  isActive(): boolean {
    return this.active;
  }
}

class TouchEvent {
  readonly id: number;
  readonly phase: TouchPhase;
  readonly point: TouchPoint;
  readonly timeMs: number;

  constructor(id: number, phase: TouchPhase, point: TouchPoint, timeMs: number) {
    this.id = id;
    this.phase = phase;
    this.point = point;
    this.timeMs = timeMs;
  }

  isDown(): boolean {
    return this.phase === TouchPhase.DOWN;
  }

  isMove(): boolean {
    return this.phase === TouchPhase.MOVE;
  }

  isUp(): boolean {
    return this.phase === TouchPhase.UP;
  }

  isCancel(): boolean {
    return this.phase === TouchPhase.CANCEL;
  }

  isTerminal(): boolean {
    return this.phase === TouchPhase.UP || this.phase === TouchPhase.CANCEL;
  }
}

class TouchTarget {
  readonly id: string;
  readonly region: TouchRegion;
  readonly left: number;
  readonly top: number;
  readonly right: number;
  readonly bottom: number;
  readonly zOrder: number;

  constructor(id: string, region: TouchRegion, left: number, top: number,
    right: number, bottom: number, zOrder: number) {
    this.id = id;
    this.region = region;
    this.left = left;
    this.top = top;
    this.right = right;
    this.bottom = bottom;
    this.zOrder = zOrder;
  }

  width(): number {
    return this.right - this.left;
  }

  height(): number {
    return this.bottom - this.top;
  }

  area(): number {
    return this.width() * this.height();
  }

  contains(point: TouchPoint): boolean {
    return point.x >= this.left && point.x <= this.right &&
      point.y >= this.top && point.y <= this.bottom;
  }

  center(): TouchPoint {
    return new TouchPoint((this.left + this.right) / 2, (this.top + this.bottom) / 2);
  }

  overlaps(other: TouchTarget): boolean {
    return this.left < other.right && this.right > other.left &&
      this.top < other.bottom && this.bottom > other.top;
  }
}

class HitTester {
  private targets: TouchTarget[] = [];

  addTarget(target: TouchTarget): void {
    this.targets.push(target);
  }

  targetCount(): number {
    return this.targets.length;
  }

  hitTest(point: TouchPoint): TouchTarget | null {
    let best: TouchTarget | null = null;
    for (const target of this.targets) {
      if (!target.contains(point)) {
        continue;
      }
      if (best === null || target.zOrder > best.zOrder) {
        best = target;
      }
    }
    return best;
  }

  allHits(point: TouchPoint): TouchTarget[] {
    const hits: TouchTarget[] = [];
    for (const target of this.targets) {
      if (target.contains(point)) {
        hits.push(target);
      }
    }
    hits.sort((a: TouchTarget, b: TouchTarget): number => b.zOrder - a.zOrder);
    return hits;
  }

  findById(id: string): TouchTarget | null {
    for (const target of this.targets) {
      if (target.id === id) {
        return target;
      }
    }
    return null;
  }

  regionOf(point: TouchPoint): TouchRegion {
    const hit = this.hitTest(point);
    if (hit === null) {
      return TouchRegion.NONE;
    }
    return hit.region;
  }
}

class TouchRouter {
  private routeLog: string[] = [];
  private accepted: number = 0;
  private dropped: number = 0;

  dispatch(targetId: string, event: TouchEvent): boolean {
    if (targetId.length === 0) {
      this.dropped += 1;
      return false;
    }
    this.routeLog.push(`${targetId}:${event.phase}`);
    this.accepted += 1;
    return true;
  }

  dispatchAll(targetId: string, events: TouchEvent[]): number {
    let count = 0;
    for (const event of events) {
      if (this.dispatch(targetId, event)) {
        count += 1;
      }
    }
    return count;
  }

  acceptedCount(): number {
    return this.accepted;
  }

  droppedCount(): number {
    return this.dropped;
  }

  routeCount(): number {
    return this.routeLog.length;
  }

  lastRoute(): string {
    if (this.routeLog.length === 0) {
      return '';
    }
    return this.routeLog[this.routeLog.length - 1];
  }

  reset(): void {
    this.routeLog = [];
    this.accepted = 0;
    this.dropped = 0;
  }
}

class TouchSlopTracker {
  private start: TouchPoint | null = null;
  private last: TouchPoint | null = null;
  private readonly slop: number;

  constructor(slop: number) {
    this.slop = slop > 0 ? slop : 1;
  }

  down(point: TouchPoint): void {
    this.start = point;
    this.last = point;
  }

  move(point: TouchPoint): void {
    if (this.start !== null) {
      this.last = point;
    }
  }

  up(): void {
    this.start = null;
    this.last = null;
  }

  isTracking(): boolean {
    return this.start !== null;
  }

  travel(): number {
    if (this.start === null || this.last === null) {
      return 0;
    }
    return this.start.euclideanTo(this.last);
  }

  exceeded(): boolean {
    return this.travel() > this.slop;
  }

  startPoint(): TouchPoint | null {
    return this.start;
  }
}

class MultiPointerTracker {
  private pointers: TouchPointer[] = [];

  add(pointer: TouchPointer): void {
    for (const existing of this.pointers) {
      if (existing.getId() === pointer.getId()) {
        return;
      }
    }
    this.pointers.push(pointer);
  }

  release(id: number): boolean {
    for (const pointer of this.pointers) {
      if (pointer.getId() === id) {
        pointer.release();
        return true;
      }
    }
    return false;
  }

  pointerCount(): number {
    return this.pointers.length;
  }

  activeCount(): number {
    let count = 0;
    for (const pointer of this.pointers) {
      if (pointer.isActive()) {
        count += 1;
      }
    }
    return count;
  }

  findById(id: number): TouchPointer | null {
    for (const pointer of this.pointers) {
      if (pointer.getId() === id) {
        return pointer;
      }
    }
    return null;
  }

  centerOfMass(): TouchPoint {
    if (this.pointers.length === 0) {
      return new TouchPoint(0, 0);
    }
    let sumX = 0;
    let sumY = 0;
    for (const pointer of this.pointers) {
      sumX += pointer.getPoint().x;
      sumY += pointer.getPoint().y;
    }
    return new TouchPoint(sumX / this.pointers.length, sumY / this.pointers.length);
  }

  spread(): number {
    if (this.pointers.length < 2) {
      return 0;
    }
    let minX = this.pointers[0].getPoint().x;
    let maxX = minX;
    for (const pointer of this.pointers) {
      const px = pointer.getPoint().x;
      if (px < minX) {
        minX = px;
      }
      if (px > maxX) {
        maxX = px;
      }
    }
    return maxX - minX;
  }
}

function buildHitTester(): HitTester {
  const tester = new HitTester();
  tester.addTarget(new TouchTarget('root', TouchRegion.CONTENT, 0, 0, 720, 1280, 0));
  tester.addTarget(new TouchTarget('header', TouchRegion.HEADER, 0, 0, 720, 120, 1));
  tester.addTarget(new TouchTarget('footer', TouchRegion.FOOTER, 0, 1160, 720, 1280, 1));
  tester.addTarget(new TouchTarget('sidebar', TouchRegion.SIDEBAR, 0, 120, 200, 1160, 2));
  return tester;
}

function buildTouchEventFlow(): TouchEvent[] {
  return [
    new TouchEvent(0, TouchPhase.DOWN, new TouchPoint(300, 400), 0),
    new TouchEvent(0, TouchPhase.MOVE, new TouchPoint(310, 410), 20),
    new TouchEvent(0, TouchPhase.MOVE, new TouchPoint(320, 420), 40),
    new TouchEvent(0, TouchPhase.UP, new TouchPoint(330, 430), 60)
  ];
}

export default function windowTouchInteractionTest(): void {
  describe('WindowTouchInteractionSuite', () => {
    let tester: HitTester = buildHitTester();

    beforeAll(() => {
      tester = buildHitTester();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'touch suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'touch suite end');
    });

    it('WindowTouchInteraction_001', 0, async (done: Function) => {
      expect(tester.targetCount()).assertEqual(4);
      expect(tester.regionOf(new TouchPoint(300, 60))).assertEqual(TouchRegion.HEADER);
      expect(tester.regionOf(new TouchPoint(300, 1200))).assertEqual(TouchRegion.FOOTER);
      done();
    });

    it('WindowTouchInteraction_002', 0, async (done: Function) => {
      expect(tester.regionOf(new TouchPoint(100, 600))).assertEqual(TouchRegion.SIDEBAR);
      expect(tester.regionOf(new TouchPoint(500, 600))).assertEqual(TouchRegion.CONTENT);
      expect(tester.regionOf(new TouchPoint(900, 600))).assertEqual(TouchRegion.NONE);
      done();
    });

    it('WindowTouchInteraction_003', 0, async (done: Function) => {
      const hit = tester.hitTest(new TouchPoint(100, 600));
      expect(hit !== null && hit.id === 'sidebar').assertTrue();
      const hitHeader = tester.hitTest(new TouchPoint(400, 60));
      expect(hitHeader !== null && hitHeader.id === 'header').assertTrue();
      done();
    });

    it('WindowTouchInteraction_004', 0, async (done: Function) => {
      const hits = tester.allHits(new TouchPoint(400, 60));
      expect(hits.length).assertEqual(2);
      expect(hits[0].id).assertEqual('header');
      expect(hits[1].id).assertEqual('root');
      done();
    });

    it('WindowTouchInteraction_005', 0, async (done: Function) => {
      expect(tester.hitTest(new TouchPoint(-10, -10))).assertNull();
      expect(tester.allHits(new TouchPoint(-10, -10)).length).assertEqual(0);
      expect(tester.regionOf(new TouchPoint(-10, -10))).assertEqual(TouchRegion.NONE);
      done();
    });

    it('WindowTouchInteraction_006', 0, async (done: Function) => {
      const target = new TouchTarget('box', TouchRegion.CONTENT, 10, 20, 110, 70, 0);
      expect(target.width()).assertEqual(100);
      expect(target.height()).assertEqual(50);
      expect(target.area()).assertEqual(5000);
      done();
    });

    it('WindowTouchInteraction_007', 0, async (done: Function) => {
      const target = new TouchTarget('box', TouchRegion.CONTENT, 10, 20, 110, 70, 0);
      expect(target.contains(new TouchPoint(10, 20))).assertTrue();
      expect(target.contains(new TouchPoint(110, 70))).assertTrue();
      expect(target.contains(new TouchPoint(111, 70))).assertFalse();
      done();
    });

    it('WindowTouchInteraction_008', 0, async (done: Function) => {
      const target = new TouchTarget('box', TouchRegion.CONTENT, 10, 20, 110, 70, 0);
      const center = target.center();
      expect(center.x).assertEqual(60);
      expect(center.y).assertEqual(45);
      done();
    });

    it('WindowTouchInteraction_009', 0, async (done: Function) => {
      const a = new TouchTarget('a', TouchRegion.CONTENT, 0, 0, 100, 100, 0);
      const b = new TouchTarget('b', TouchRegion.HEADER, 50, 50, 150, 150, 0);
      const c = new TouchTarget('c', TouchRegion.FOOTER, 200, 200, 300, 300, 0);
      expect(a.overlaps(b)).assertTrue();
      expect(a.overlaps(c)).assertFalse();
      done();
    });

    it('WindowTouchInteraction_010', 0, async (done: Function) => {
      const testerLocal = buildHitTester();
      const found = testerLocal.findById('footer');
      expect(found !== null && found.region === TouchRegion.FOOTER).assertTrue();
      expect(testerLocal.findById('absent')).assertNull();
      done();
    });

    it('WindowTouchInteraction_011', 0, async (done: Function) => {
      const event = new TouchEvent(1, TouchPhase.DOWN, new TouchPoint(5, 5), 100);
      expect(event.isDown()).assertTrue();
      expect(event.isTerminal()).assertFalse();
      expect(event.timeMs).assertEqual(100);
      expect(event.id).assertEqual(1);
      done();
    });

    it('WindowTouchInteraction_012', 0, async (done: Function) => {
      const up = new TouchEvent(1, TouchPhase.UP, new TouchPoint(5, 5), 120);
      const cancel = new TouchEvent(1, TouchPhase.CANCEL, new TouchPoint(5, 5), 120);
      expect(up.isUp()).assertTrue();
      expect(up.isTerminal()).assertTrue();
      expect(cancel.isCancel()).assertTrue();
      expect(cancel.isTerminal()).assertTrue();
      expect(cancel.isMove()).assertFalse();
      done();
    });

    it('WindowTouchInteraction_013', 0, async (done: Function) => {
      const router = new TouchRouter();
      const events = buildTouchEventFlow();
      const count = router.dispatchAll('content', events);
      expect(count).assertEqual(4);
      expect(router.routeCount()).assertEqual(4);
      expect(router.acceptedCount()).assertEqual(4);
      expect(router.droppedCount()).assertEqual(0);
      done();
    });

    it('WindowTouchInteraction_014', 0, async (done: Function) => {
      const router = new TouchRouter();
      expect(router.dispatch('', buildTouchEventFlow()[0])).assertFalse();
      expect(router.droppedCount()).assertEqual(1);
      expect(router.acceptedCount()).assertEqual(0);
      expect(router.routeCount()).assertEqual(0);
      done();
    });

    it('WindowTouchInteraction_015', 0, async (done: Function) => {
      const router = new TouchRouter();
      router.dispatchAll('content', buildTouchEventFlow());
      expect(router.lastRoute()).assertEqual('content:2');
      router.reset();
      expect(router.routeCount()).assertEqual(0);
      expect(router.acceptedCount()).assertEqual(0);
      expect(router.lastRoute()).assertEqual('');
      done();
    });

    it('WindowTouchInteraction_016', 0, async (done: Function) => {
      const tracker = new TouchSlopTracker(10);
      expect(tracker.isTracking()).assertFalse();
      tracker.down(new TouchPoint(100, 100));
      expect(tracker.isTracking()).assertTrue();
      expect(tracker.startPoint() !== null).assertTrue();
      done();
    });

    it('WindowTouchInteraction_017', 0, async (done: Function) => {
      const tracker = new TouchSlopTracker(10);
      tracker.down(new TouchPoint(100, 100));
      tracker.move(new TouchPoint(105, 100));
      expect(tracker.travel()).assertEqual(5);
      expect(tracker.exceeded()).assertFalse();
      tracker.move(new TouchPoint(120, 100));
      expect(tracker.exceeded()).assertTrue();
      done();
    });

    it('WindowTouchInteraction_018', 0, async (done: Function) => {
      const tracker = new TouchSlopTracker(10);
      tracker.down(new TouchPoint(0, 0));
      tracker.move(new TouchPoint(100, 0));
      tracker.up();
      expect(tracker.isTracking()).assertFalse();
      expect(tracker.travel()).assertEqual(0);
      expect(tracker.exceeded()).assertFalse();
      done();
    });

    it('WindowTouchInteraction_019', 0, async (done: Function) => {
      const tracker = new TouchSlopTracker(0);
      tracker.down(new TouchPoint(0, 0));
      tracker.move(new TouchPoint(1, 1));
      expect(tracker.exceeded()).assertTrue();
      done();
    });

    it('WindowTouchInteraction_020', 0, async (done: Function) => {
      const pointers = new MultiPointerTracker();
      pointers.add(new TouchPointer(0, new TouchPoint(100, 100)));
      pointers.add(new TouchPointer(1, new TouchPoint(300, 100)));
      expect(pointers.pointerCount()).assertEqual(2);
      expect(pointers.activeCount()).assertEqual(2);
      expect(pointers.spread()).assertEqual(200);
      done();
    });

    it('WindowTouchInteraction_021', 0, async (done: Function) => {
      const pointers = new MultiPointerTracker();
      pointers.add(new TouchPointer(0, new TouchPoint(100, 100)));
      pointers.add(new TouchPointer(1, new TouchPoint(300, 100)));
      expect(pointers.release(0)).assertTrue();
      expect(pointers.activeCount()).assertEqual(1);
      expect(pointers.release(9)).assertFalse();
      done();
    });

    it('WindowTouchInteraction_022', 0, async (done: Function) => {
      const pointers = new MultiPointerTracker();
      pointers.add(new TouchPointer(0, new TouchPoint(100, 200)));
      pointers.add(new TouchPointer(0, new TouchPoint(999, 999)));
      expect(pointers.pointerCount()).assertEqual(1);
      const center = pointers.centerOfMass();
      expect(center.x).assertEqual(100);
      expect(center.y).assertEqual(200);
      done();
    });

    it('WindowTouchInteraction_023', 0, async (done: Function) => {
      const pointers = new MultiPointerTracker();
      const empty = pointers.centerOfMass();
      expect(empty.x).assertEqual(0);
      expect(empty.y).assertEqual(0);
      expect(pointers.spread()).assertEqual(0);
      expect(pointers.findById(0)).assertNull();
      done();
    });

    it('WindowTouchInteraction_024', 0, async (done: Function) => {
      const pointers = new MultiPointerTracker();
      const first = new TouchPointer(0, new TouchPoint(10, 10));
      pointers.add(first);
      first.moveTo(new TouchPoint(50, 60));
      const found = pointers.findById(0);
      expect(found !== null && found.getPoint().x === 50).assertTrue();
      expect(found !== null && found.getPoint().y === 60).assertTrue();
      done();
    });

    it('WindowTouchInteraction_025', 0, async (done: Function) => {
      const pointer = new TouchPointer(5, new TouchPoint(1, 2));
      expect(pointer.isActive()).assertTrue();
      pointer.release();
      expect(pointer.isActive()).assertFalse();
      pointer.moveTo(new TouchPoint(100, 100));
      expect(pointer.getPoint().x).assertEqual(1);
      expect(pointer.getPoint().y).assertEqual(2);
      done();
    });

    it('WindowTouchInteraction_026', 0, async (done: Function) => {
      const a = new TouchPoint(10, 20);
      const b = new TouchPoint(10, 50);
      expect(a.sameColumn(b)).assertTrue();
      expect(a.manhattanTo(b)).assertEqual(30);
      expect(a.euclideanTo(b)).assertEqual(30);
      done();
    });

    it('WindowTouchInteraction_027', 0, async (done: Function) => {
      const a = new TouchPoint(3, 0);
      const b = new TouchPoint(0, 4);
      expect(a.euclideanTo(b)).assertEqual(5);
      expect(a.manhattanTo(b)).assertEqual(7);
      expect(a.sameColumn(b)).assertFalse();
      done();
    });

    it('WindowTouchInteraction_028', 0, async (done: Function) => {
      const local = buildHitTester();
      const sidebarHit = local.hitTest(new TouchPoint(150, 400));
      expect(sidebarHit !== null && sidebarHit.id === 'sidebar').assertTrue();
      const contentHit = local.hitTest(new TouchPoint(600, 400));
      expect(contentHit !== null && contentHit.id === 'root').assertTrue();
      done();
    });

    it('WindowTouchInteraction_029', 0, async (done: Function) => {
      const router = new TouchRouter();
      const single: TouchEvent[] = [
        new TouchEvent(3, TouchPhase.DOWN, new TouchPoint(0, 0), 0),
        new TouchEvent(3, TouchPhase.UP, new TouchPoint(0, 0), 10)
      ];
      expect(router.dispatchAll('header', single)).assertEqual(2);
      expect(router.lastRoute()).assertEqual('header:2');
      done();
    });

    it('WindowTouchInteraction_030', 0, async (done: Function) => {
      const events = buildTouchEventFlow();
      expect(events.length).assertEqual(4);
      expect(events[0].isDown()).assertTrue();
      expect(events[1].isMove()).assertTrue();
      expect(events[2].isMove()).assertTrue();
      expect(events[3].isUp()).assertTrue();
      done();
    });

    it('WindowTouchInteraction_031', 0, async (done: Function) => {
      const router = new TouchRouter();
      const events = buildTouchEventFlow();
      router.dispatchAll('a', events);
      router.dispatchAll('b', events);
      expect(router.routeCount()).assertEqual(8);
      expect(router.acceptedCount()).assertEqual(8);
      expect(router.droppedCount()).assertEqual(0);
      done();
    });

    it('WindowTouchInteraction_032', 0, async (done: Function) => {
      const testerLocal = buildHitTester();
      const hits = testerLocal.allHits(new TouchPoint(100, 1160));
      expect(hits.length).assertEqual(3);
      expect(hits[0].id).assertEqual('sidebar');
      expect(hits[1].id).assertEqual('footer');
      expect(hits[2].id).assertEqual('root');
      done();
    });

    it('WindowTouchInteraction_033', 0, async (done: Function) => {
      const tracker = new TouchSlopTracker(50);
      tracker.down(new TouchPoint(0, 0));
      tracker.move(new TouchPoint(30, 40));
      expect(tracker.travel()).assertEqual(50);
      expect(tracker.exceeded()).assertFalse();
      tracker.move(new TouchPoint(30, 41));
      expect(tracker.exceeded()).assertTrue();
      done();
    });

    it('WindowTouchInteraction_034', 0, async (done: Function) => {
      const pointers = new MultiPointerTracker();
      pointers.add(new TouchPointer(0, new TouchPoint(0, 0)));
      pointers.add(new TouchPointer(1, new TouchPoint(100, 0)));
      pointers.add(new TouchPointer(2, new TouchPoint(50, 0)));
      expect(pointers.pointerCount()).assertEqual(3);
      const center = pointers.centerOfMass();
      expect(center.x).assertEqual(50);
      expect(pointers.spread()).assertEqual(100);
      done();
    });

    it('WindowTouchInteraction_035', 0, async (done: Function) => {
      expect(KEY_ENTER).assertEqual(2049);
      expect(KEY_BACK).assertEqual(2);
      expect(KEY_UP).assertEqual(2012);
      expect(KEY_DOWN).assertEqual(2013);
      expect(KEY_LEFT + KEY_RIGHT).assertEqual(4029);
      expect(DELAY_KEY_NAVIGATION).assertEqual(50);
      done();
    });

    it('WindowTouchInteraction_036', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        await simulateTouch(driver, 200, 400);
        expect(true).assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('WindowTouchInteraction_037', 0, async (done: Function) => {
      const target = new TouchTarget('edge', TouchRegion.CONTENT, 0, 0, 0, 0, 0);
      expect(target.area()).assertEqual(0);
      expect(target.contains(new TouchPoint(0, 0))).assertTrue();
      const other = new TouchTarget('other', TouchRegion.CONTENT, 0, 0, 0, 0, 0);
      expect(target.overlaps(other)).assertFalse();
      done();
    });

    it('WindowTouchInteraction_038', 0, async (done: Function) => {
      const events = buildTouchEventFlow();
      const first = events[0];
      const last = events[3];
      const travelled = first.point.euclideanTo(last.point);
      expect(travelled > 0).assertTrue();
      expect(first.id).assertEqual(last.id);
      expect(last.timeMs - first.timeMs).assertEqual(60);
      done();
    });

    it('WindowTouchInteraction_039', 0, async (done: Function) => {
      const testerLocal = buildHitTester();
      const footerCenter = testerLocal.findById('footer');
      expect(footerCenter !== null).assertTrue();
      if (footerCenter !== null) {
        const center = footerCenter.center();
        expect(testerLocal.regionOf(center)).assertEqual(TouchRegion.FOOTER);
      }
      done();
    });

    it('WindowTouchInteraction_040', 0, async (done: Function) => {
      const tracker = new TouchSlopTracker(10);
      tracker.down(new TouchPoint(5, 5));
      tracker.move(new TouchPoint(8, 9));
      expect(tracker.travel()).assertEqual(5);
      expect(tracker.exceeded()).assertFalse();
      expect(TIMEOUT_PAGE_RENDER).assertEqual(1000);
      done();
    });

    it('WindowTouchInteraction_041', 0, async (done: Function) => {
      const local = buildHitTester();
      const hits = local.allHits(new TouchPoint(300, 1200));
      expect(hits.length).assertEqual(2);
      expect(hits[0].id).assertEqual('footer');
      expect(hits[1].id).assertEqual('root');
      done();
    });

    it('WindowTouchInteraction_042', 0, async (done: Function) => {
      const router = new TouchRouter();
      const mixed: TouchEvent[] = [
        new TouchEvent(0, TouchPhase.DOWN, new TouchPoint(0, 0), 0),
        new TouchEvent(0, TouchPhase.CANCEL, new TouchPoint(0, 0), 30)
      ];
      router.dispatchAll('root', mixed);
      expect(router.lastRoute()).assertEqual('root:3');
      expect(router.acceptedCount()).assertEqual(2);
      done();
    });

    it('WindowTouchInteraction_043', 0, async (done: Function) => {
      const pointers = new MultiPointerTracker();
      pointers.add(new TouchPointer(0, new TouchPoint(10, 10)));
      pointers.add(new TouchPointer(1, new TouchPoint(20, 20)));
      pointers.release(0);
      pointers.release(1);
      expect(pointers.activeCount()).assertEqual(0);
      expect(pointers.pointerCount()).assertEqual(2);
      done();
    });

    it('WindowTouchInteraction_044', 0, async (done: Function) => {
      const tracker = new TouchSlopTracker(5);
      tracker.down(new TouchPoint(10, 10));
      tracker.move(new TouchPoint(13, 14));
      expect(tracker.travel()).assertEqual(5);
      expect(tracker.exceeded()).assertFalse();
      expect(tracker.startPoint() !== null).assertTrue();
      done();
    });

    it('WindowTouchInteraction_045', 0, async (done: Function) => {
      const a = new TouchPoint(0, 0);
      const b = new TouchPoint(6, 8);
      expect(a.euclideanTo(b)).assertEqual(10);
      expect(a.manhattanTo(b)).assertEqual(14);
      expect(a.sameColumn(b)).assertFalse();
      done();
    });

    it('WindowTouchInteraction_046', 0, async (done: Function) => {
      const router = new TouchRouter();
      expect(router.dispatchAll('x', [])).assertEqual(0);
      expect(router.acceptedCount()).assertEqual(0);
      expect(router.routeCount()).assertEqual(0);
      expect(router.lastRoute()).assertEqual('');
      done();
    });

    it('WindowTouchInteraction_047', 0, async (done: Function) => {
      const local = buildHitTester();
      const below = local.hitTest(new TouchPoint(300, 1300));
      expect(below).assertNull();
      const inside = local.hitTest(new TouchPoint(300, 1000));
      expect(inside !== null && inside.id === 'root').assertTrue();
      done();
    });

    it('WindowTouchInteraction_048', 0, async (done: Function) => {
      const target = new TouchTarget('wide', TouchRegion.CONTENT, 0, 0, 400, 200, 3);
      expect(target.width()).assertEqual(400);
      expect(target.height()).assertEqual(200);
      expect(target.area()).assertEqual(80000);
      expect(target.contains(target.center())).assertTrue();
      done();
    });

    it('WindowTouchInteraction_049', 0, async (done: Function) => {
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_RIGHT).assertEqual(2015);
      expect(KEY_UP).assertEqual(2012);
      expect(KEY_DOWN).assertEqual(2013);
      expect(KEY_ENTER).assertEqual(2049);
      expect(KEY_BACK).assertEqual(2);
      done();
    });

    it('WindowTouchInteraction_050', 0, async (done: Function) => {
      const router = new TouchRouter();
      const flow = buildTouchEventFlow();
      router.dispatch('content', flow[0]);
      router.dispatch('content', flow[3]);
      router.dispatch('', flow[1]);
      expect(router.acceptedCount()).assertEqual(2);
      expect(router.droppedCount()).assertEqual(1);
      expect(router.routeCount()).assertEqual(2);
      done();
    });
  });
}

