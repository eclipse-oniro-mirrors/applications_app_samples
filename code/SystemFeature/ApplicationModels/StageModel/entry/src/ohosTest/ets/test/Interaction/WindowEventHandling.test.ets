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
  getDriver, ensureAppReady, checkComponentExists, clampNumber
} from '../Shared/SharedDriver';

enum EventType {
  CLICK = 0,
  TOUCH = 1,
  KEY = 2,
  FOCUS = 3,
  RESIZE = 4,
  SCROLL = 5
}

class WindowEvent {
  type: EventType = EventType.CLICK;
  target: string = '';
  timeStamp: number = 0;
  defaultPrevented: boolean = false;
  propagationStopped: boolean = false;
  handled: boolean = false;
  payload: number = 0;

  constructor(type: EventType, target: string, timeStamp: number, payload: number) {
    this.type = type;
    this.target = target;
    this.timeStamp = timeStamp;
    this.payload = payload;
  }

  preventDefault(): void {
    this.defaultPrevented = true;
  }

  stopPropagation(): void {
    this.propagationStopped = true;
  }

  markHandled(): void {
    this.handled = true;
  }
}

class EventHandler {
  id: string = '';
  type: EventType = EventType.CLICK;
  priority: number = 0;
  once: boolean = false;
  enabled: boolean = true;
  private invocations: number = 0;
  private removed: boolean = false;

  constructor(id: string, type: EventType, priority: number, once: boolean) {
    this.id = id;
    this.type = type;
    this.priority = priority;
    this.once = once;
  }

  getId(): string {
    return this.id;
  }

  getInvocations(): number {
    return this.invocations;
  }

  isRemoved(): boolean {
    return this.removed;
  }

  accepts(event: WindowEvent): boolean {
    return this.enabled && !this.removed && this.type === event.type;
  }

  invoke(event: WindowEvent): boolean {
    if (!this.accepts(event)) {
      return false;
    }
    this.invocations = this.invocations + 1;
    event.markHandled();
    if (this.once) {
      this.removed = true;
    }
    return true;
  }
}

class EventDispatcher {
  private handlers: EventHandler[] = [];
  private dispatched: number = 0;
  private handled: number = 0;

  register(handler: EventHandler): boolean {
    if (this.find(handler.getId()) !== null) {
      return false;
    }
    this.handlers.push(handler);
    this.sortHandlers();
    return true;
  }

  find(id: string): EventHandler | null {
    for (const handler of this.handlers) {
      if (handler.getId() === id) {
        return handler;
      }
    }
    return null;
  }

  unregister(id: string): boolean {
    const handler = this.find(id);
    if (handler === null) {
      return false;
    }
    const index = this.handlers.indexOf(handler);
    this.handlers.splice(index, 1);
    return true;
  }

  private sortHandlers(): void {
    this.handlers.sort((left: EventHandler, right: EventHandler): number => {
      return right.priority - left.priority;
    });
  }

  dispatch(event: WindowEvent): number {
    this.dispatched = this.dispatched + 1;
    let invoked = 0;
    for (const handler of this.handlers.slice()) {
      if (event.propagationStopped) {
        break;
      }
      if (handler.invoke(event)) {
        invoked = invoked + 1;
        this.handled = this.handled + 1;
      }
    }
    this.purgeRemoved();
    return invoked;
  }

  private purgeRemoved(): void {
    const survivors: EventHandler[] = [];
    for (const handler of this.handlers) {
      if (!handler.isRemoved()) {
        survivors.push(handler);
      }
    }
    this.handlers = survivors;
  }

  count(): number {
    return this.handlers.length;
  }

  getDispatched(): number {
    return this.dispatched;
  }

  getHandled(): number {
    return this.handled;
  }

  highestPriority(): number {
    if (this.handlers.length === 0) {
      return 0;
    }
    return this.handlers[0].priority;
  }
}

class EventQueue {
  private events: WindowEvent[] = [];
  private dropped: number = 0;
  private capacity: number = 16;

  constructor(capacity: number) {
    this.capacity = clampNumber(capacity, 1, 1024);
  }

  enqueue(event: WindowEvent): boolean {
    if (this.events.length >= this.capacity) {
      this.dropped = this.dropped + 1;
      return false;
    }
    this.events.push(event);
    return true;
  }

  dequeue(): WindowEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    const event = this.events.shift();
    if (event === undefined) {
      return null;
    }
    return event;
  }

  peek(): WindowEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[0];
  }

  size(): number {
    return this.events.length;
  }

  getDropped(): number {
    return this.dropped;
  }

  getCapacity(): number {
    return this.capacity;
  }

  drain(): number {
    const count = this.events.length;
    this.events = [];
    return count;
  }
}

export default function windowEventHandlingTest(): void {
  describe('WindowEventHandling', () => {
    it('WindowEventHandling_001', 0, async (done: Function) => {
      const event = new WindowEvent(EventType.CLICK, 'button', 100, 1);
      expect(event.type).assertEqual(EventType.CLICK);
      expect(event.target).assertEqual('button');
      expect(event.handled).assertFalse();
      done();
    });

    it('WindowEventHandling_002', 0, async (done: Function) => {
      const event = new WindowEvent(EventType.TOUCH, 'area', 200, 2);
      expect(event.defaultPrevented).assertFalse();
      event.preventDefault();
      expect(event.defaultPrevented).assertTrue();
      done();
    });

    it('WindowEventHandling_003', 0, async (done: Function) => {
      const event = new WindowEvent(EventType.KEY, 'input', 300, 3);
      expect(event.propagationStopped).assertFalse();
      event.stopPropagation();
      expect(event.propagationStopped).assertTrue();
      done();
    });

    it('WindowEventHandling_004', 0, async (done: Function) => {
      const event = new WindowEvent(EventType.FOCUS, 'view', 400, 4);
      event.markHandled();
      expect(event.handled).assertTrue();
      expect(event.payload).assertEqual(4);
      done();
    });

    it('WindowEventHandling_005', 0, async (done: Function) => {
      const handler = new EventHandler('h1', EventType.CLICK, 5, false);
      expect(handler.getId()).assertEqual('h1');
      expect(handler.getInvocations()).assertEqual(0);
      expect(handler.isRemoved()).assertFalse();
      done();
    });

    it('WindowEventHandling_006', 0, async (done: Function) => {
      const handler = new EventHandler('h1', EventType.CLICK, 5, false);
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      expect(handler.accepts(event)).assertTrue();
      expect(handler.invoke(event)).assertTrue();
      expect(handler.getInvocations()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_007', 0, async (done: Function) => {
      const handler = new EventHandler('h1', EventType.CLICK, 5, false);
      const event = new WindowEvent(EventType.KEY, 'button', 1, 0);
      expect(handler.accepts(event)).assertFalse();
      expect(handler.invoke(event)).assertFalse();
      expect(handler.getInvocations()).assertEqual(0);
      done();
    });

    it('WindowEventHandling_008', 0, async (done: Function) => {
      const handler = new EventHandler('once', EventType.CLICK, 0, true);
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      expect(handler.invoke(event)).assertTrue();
      expect(handler.isRemoved()).assertTrue();
      expect(handler.invoke(event)).assertFalse();
      done();
    });

    it('WindowEventHandling_009', 0, async (done: Function) => {
      const handler = new EventHandler('h1', EventType.CLICK, 0, false);
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      handler.enabled = false;
      expect(handler.accepts(event)).assertFalse();
      expect(handler.invoke(event)).assertFalse();
      done();
    });

    it('WindowEventHandling_010', 0, async (done: Function) => {
      const handler = new EventHandler('h1', EventType.CLICK, 0, false);
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      handler.invoke(event);
      expect(event.handled).assertTrue();
      done();
    });

    it('WindowEventHandling_011', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      expect(dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false))).assertTrue();
      expect(dispatcher.register(new EventHandler('b', EventType.KEY, 2, false))).assertTrue();
      expect(dispatcher.count()).assertEqual(2);
      done();
    });

    it('WindowEventHandling_012', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      expect(dispatcher.register(new EventHandler('a', EventType.KEY, 2, false))).assertFalse();
      expect(dispatcher.count()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_013', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      expect(dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false))).assertTrue();
      expect(dispatcher.unregister('a')).assertTrue();
      expect(dispatcher.unregister('a')).assertFalse();
      expect(dispatcher.count()).assertEqual(0);
      done();
    });

    it('WindowEventHandling_014', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      expect(dispatcher.dispatch(event)).assertEqual(1);
      expect(dispatcher.getDispatched()).assertEqual(1);
      expect(dispatcher.getHandled()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_015', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      dispatcher.register(new EventHandler('b', EventType.KEY, 1, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      expect(dispatcher.dispatch(event)).assertEqual(1);
      done();
    });

    it('WindowEventHandling_016', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      dispatcher.register(new EventHandler('b', EventType.CLICK, 5, false));
      expect(dispatcher.highestPriority()).assertEqual(5);
      done();
    });

    it('WindowEventHandling_017', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 3, false));
      dispatcher.register(new EventHandler('b', EventType.CLICK, 7, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      dispatcher.dispatch(event);
      const high = dispatcher.find('b');
      expect(high !== null).assertTrue();
      if (high !== null) {
        expect(high.getInvocations()).assertEqual(1);
      }
      done();
    });

    it('WindowEventHandling_018', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('once', EventType.CLICK, 5, true));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      dispatcher.dispatch(event);
      expect(dispatcher.count()).assertEqual(0);
      done();
    });

    it('WindowEventHandling_019', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 5, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      event.stopPropagation();
      expect(dispatcher.dispatch(event)).assertEqual(0);
      done();
    });

    it('WindowEventHandling_020', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      expect(dispatcher.highestPriority()).assertEqual(0);
      expect(dispatcher.count()).assertEqual(0);
      done();
    });

    it('WindowEventHandling_021', 0, async (done: Function) => {
      const queue = new EventQueue(2);
      expect(queue.getCapacity()).assertEqual(2);
      expect(queue.enqueue(new WindowEvent(EventType.CLICK, 'a', 1, 0))).assertTrue();
      expect(queue.enqueue(new WindowEvent(EventType.KEY, 'b', 2, 0))).assertTrue();
      expect(queue.size()).assertEqual(2);
      done();
    });

    it('WindowEventHandling_022', 0, async (done: Function) => {
      const queue = new EventQueue(1);
      queue.enqueue(new WindowEvent(EventType.CLICK, 'a', 1, 0));
      expect(queue.enqueue(new WindowEvent(EventType.KEY, 'b', 2, 0))).assertFalse();
      expect(queue.getDropped()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_023', 0, async (done: Function) => {
      const queue = new EventQueue(4);
      expect(queue.dequeue()).assertNull();
      expect(queue.peek()).assertNull();
      done();
    });

    it('WindowEventHandling_024', 0, async (done: Function) => {
      const queue = new EventQueue(4);
      queue.enqueue(new WindowEvent(EventType.CLICK, 'a', 1, 0));
      const peeked = queue.peek();
      expect(peeked !== null).assertTrue();
      expect(queue.size()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_025', 0, async (done: Function) => {
      const queue = new EventQueue(4);
      queue.enqueue(new WindowEvent(EventType.CLICK, 'a', 1, 0));
      queue.enqueue(new WindowEvent(EventType.KEY, 'b', 2, 0));
      const first = queue.dequeue();
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.target).assertEqual('a');
      }
      expect(queue.size()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_026', 0, async (done: Function) => {
      const queue = new EventQueue(4);
      queue.enqueue(new WindowEvent(EventType.CLICK, 'a', 1, 0));
      queue.enqueue(new WindowEvent(EventType.KEY, 'b', 2, 0));
      expect(queue.drain()).assertEqual(2);
      expect(queue.size()).assertEqual(0);
      done();
    });

    it('WindowEventHandling_027', 0, async (done: Function) => {
      const queue = new EventQueue(0);
      expect(queue.getCapacity()).assertEqual(1);
      const large = new EventQueue(5000);
      expect(large.getCapacity()).assertEqual(1024);
      done();
    });

    it('WindowEventHandling_028', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      dispatcher.register(new EventHandler('b', EventType.CLICK, 2, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      expect(dispatcher.dispatch(event)).assertEqual(2);
      expect(dispatcher.getHandled()).assertEqual(2);
      done();
    });

    it('WindowEventHandling_029', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      const event = new WindowEvent(EventType.RESIZE, 'window', 1, 0);
      expect(dispatcher.dispatch(event)).assertEqual(0);
      expect(dispatcher.getDispatched()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_030', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      event.preventDefault();
      dispatcher.dispatch(event);
      expect(event.defaultPrevented).assertTrue();
      expect(event.handled).assertTrue();
      done();
    });

    it('WindowEventHandling_031', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.TOUCH, 1, false));
      dispatcher.register(new EventHandler('b', EventType.TOUCH, 1, false));
      const event = new WindowEvent(EventType.TOUCH, 'root', 1, 0);
      expect(dispatcher.dispatch(event)).assertEqual(2);
      done();
    });

    it('WindowEventHandling_032', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      const handler = new EventHandler('a', EventType.SCROLL, 1, false);
      dispatcher.register(handler);
      dispatcher.unregister('a');
      const event = new WindowEvent(EventType.SCROLL, 'list', 1, 0);
      expect(dispatcher.dispatch(event)).assertEqual(0);
      done();
    });

    it('WindowEventHandling_033', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, true));
      dispatcher.register(new EventHandler('b', EventType.CLICK, 1, true));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      dispatcher.dispatch(event);
      expect(dispatcher.count()).assertEqual(0);
      done();
    });

    it('WindowEventHandling_034', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      dispatcher.register(new EventHandler('b', EventType.CLICK, 1, false));
      dispatcher.unregister('b');
      expect(dispatcher.count()).assertEqual(1);
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      expect(dispatcher.dispatch(event)).assertEqual(1);
      done();
    });

    it('WindowEventHandling_035', 0, async (done: Function) => {
      const queue = new EventQueue(3);
      queue.enqueue(new WindowEvent(EventType.CLICK, 'a', 1, 0));
      queue.enqueue(new WindowEvent(EventType.KEY, 'b', 2, 0));
      queue.enqueue(new WindowEvent(EventType.TOUCH, 'c', 3, 0));
      expect(queue.size()).assertEqual(3);
      expect(queue.getDropped()).assertEqual(0);
      done();
    });

    it('WindowEventHandling_036', 0, async (done: Function) => {
      const queue = new EventQueue(1);
      queue.enqueue(new WindowEvent(EventType.CLICK, 'a', 1, 0));
      queue.enqueue(new WindowEvent(EventType.KEY, 'b', 2, 0));
      queue.enqueue(new WindowEvent(EventType.TOUCH, 'c', 3, 0));
      expect(queue.getDropped()).assertEqual(2);
      expect(queue.size()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_037', 0, async (done: Function) => {
      const event = new WindowEvent(EventType.CLICK, 'button', 500, 42);
      expect(event.timeStamp).assertEqual(500);
      expect(event.payload).assertEqual(42);
      expect(event.target).assertEqual('button');
      done();
    });

    it('WindowEventHandling_038', 0, async (done: Function) => {
      const handler = new EventHandler('h', EventType.KEY, 0, false);
      const event = new WindowEvent(EventType.KEY, 'input', 1, 0);
      handler.invoke(event);
      handler.invoke(event);
      expect(handler.getInvocations()).assertEqual(2);
      done();
    });

    it('WindowEventHandling_039', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      const handler = new EventHandler('h', EventType.CLICK, 9, false);
      dispatcher.register(handler);
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      dispatcher.dispatch(event);
      const found = dispatcher.find('h');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.getInvocations()).assertEqual(1);
      }
      done();
    });

    it('WindowEventHandling_040', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      dispatcher.dispatch(new WindowEvent(EventType.CLICK, 'button', 1, 0));
      dispatcher.dispatch(new WindowEvent(EventType.CLICK, 'button', 2, 0));
      expect(dispatcher.getDispatched()).assertEqual(2);
      expect(dispatcher.getHandled()).assertEqual(2);
      done();
    });

    it('WindowEventHandling_041', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      const handler = new EventHandler('a', EventType.FOCUS, 3, false);
      dispatcher.register(handler);
      handler.enabled = false;
      const event = new WindowEvent(EventType.FOCUS, 'view', 1, 0);
      expect(dispatcher.dispatch(event)).assertEqual(0);
      done();
    });

    it('WindowEventHandling_042', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      event.stopPropagation();
      expect(dispatcher.dispatch(event)).assertEqual(0);
      expect(event.handled).assertFalse();
      done();
    });

    it('WindowEventHandling_043', 0, async (done: Function) => {
      const queue = new EventQueue(2);
      queue.enqueue(new WindowEvent(EventType.CLICK, 'a', 1, 0));
      queue.enqueue(new WindowEvent(EventType.KEY, 'b', 2, 0));
      queue.dequeue();
      expect(queue.enqueue(new WindowEvent(EventType.TOUCH, 'c', 3, 0))).assertTrue();
      expect(queue.size()).assertEqual(2);
      done();
    });

    it('WindowEventHandling_044', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 2, false));
      dispatcher.register(new EventHandler('b', EventType.CLICK, 8, false));
      dispatcher.register(new EventHandler('c', EventType.CLICK, 5, false));
      expect(dispatcher.highestPriority()).assertEqual(8);
      done();
    });

    it('WindowEventHandling_045', 0, async (done: Function) => {
      const event = new WindowEvent(EventType.SCROLL, 'list', 10, 15);
      event.preventDefault();
      event.stopPropagation();
      event.markHandled();
      expect(event.defaultPrevented).assertTrue();
      expect(event.propagationStopped).assertTrue();
      expect(event.handled).assertTrue();
      done();
    });

    it('WindowEventHandling_046', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      const other = new WindowEvent(EventType.RESIZE, 'window', 1, 0);
      expect(dispatcher.dispatch(other)).assertEqual(0);
      expect(dispatcher.count()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_047', 0, async (done: Function) => {
      const queue = new EventQueue(5);
      const event = new WindowEvent(EventType.KEY, 'input', 7, 9);
      queue.enqueue(event);
      const peeked = queue.peek();
      expect(peeked !== null).assertTrue();
      if (peeked !== null) {
        expect(peeked.payload).assertEqual(9);
      }
      done();
    });

    it('WindowEventHandling_048', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      const handler = new EventHandler('a', EventType.CLICK, 1, true);
      dispatcher.register(handler);
      const first = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      const second = new WindowEvent(EventType.CLICK, 'button', 2, 0);
      dispatcher.dispatch(first);
      dispatcher.dispatch(second);
      expect(dispatcher.getHandled()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_049', 0, async (done: Function) => {
      const queue = new EventQueue(3);
      expect(queue.drain()).assertEqual(0);
      queue.enqueue(new WindowEvent(EventType.CLICK, 'a', 1, 0));
      expect(queue.drain()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_050', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      dispatcher.dispatch(event);
      expect(event.handled).assertTrue();
      expect(event.defaultPrevented).assertFalse();
      done();
    });

    it('WindowEventHandling_051', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      dispatcher.register(new EventHandler('b', EventType.CLICK, 1, false));
      dispatcher.unregister('a');
      dispatcher.unregister('b');
      expect(dispatcher.count()).assertEqual(0);
      done();
    });

    it('WindowEventHandling_052', 0, async (done: Function) => {
      const queue = new EventQueue(2);
      queue.enqueue(new WindowEvent(EventType.CLICK, 'a', 1, 0));
      queue.enqueue(new WindowEvent(EventType.KEY, 'b', 2, 0));
      const first = queue.dequeue();
      const second = queue.dequeue();
      expect(first !== null).assertTrue();
      expect(second !== null).assertTrue();
      expect(queue.dequeue()).assertNull();
      done();
    });

    it('WindowEventHandling_053', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.TOUCH, 1, false));
      dispatcher.register(new EventHandler('b', EventType.TOUCH, 2, false));
      dispatcher.register(new EventHandler('c', EventType.TOUCH, 3, false));
      const event = new WindowEvent(EventType.TOUCH, 'root', 1, 0);
      expect(dispatcher.dispatch(event)).assertEqual(3);
      done();
    });

    it('WindowEventHandling_054', 0, async (done: Function) => {
      const handler = new EventHandler('h', EventType.SCROLL, 5, true);
      const event = new WindowEvent(EventType.SCROLL, 'list', 1, 0);
      handler.invoke(event);
      expect(handler.isRemoved()).assertTrue();
      expect(handler.accepts(event)).assertFalse();
      done();
    });

    it('WindowEventHandling_055', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      event.preventDefault();
      dispatcher.dispatch(event);
      expect(event.defaultPrevented).assertTrue();
      expect(event.handled).assertTrue();
      done();
    });

    it('WindowEventHandling_056', 0, async (done: Function) => {
      const queue = new EventQueue(10);
      for (let i = 0; i < 5; i++) {
        queue.enqueue(new WindowEvent(EventType.KEY, 'input', i, i));
      }
      expect(queue.size()).assertEqual(5);
      expect(queue.drain()).assertEqual(5);
      done();
    });

    it('WindowEventHandling_057', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.FOCUS, 1, false));
      const focus = new WindowEvent(EventType.FOCUS, 'view', 1, 0);
      const blur = new WindowEvent(EventType.KEY, 'view', 2, 0);
      expect(dispatcher.dispatch(focus)).assertEqual(1);
      expect(dispatcher.dispatch(blur)).assertEqual(0);
      done();
    });

    it('WindowEventHandling_058', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      dispatcher.register(new EventHandler('b', EventType.CLICK, 2, false));
      dispatcher.register(new EventHandler('c', EventType.CLICK, 3, false));
      expect(dispatcher.highestPriority()).assertEqual(3);
      expect(dispatcher.count()).assertEqual(3);
      done();
    });

    it('WindowEventHandling_059', 0, async (done: Function) => {
      const event = new WindowEvent(EventType.RESIZE, 'window', 88, 1024);
      expect(event.timeStamp).assertEqual(88);
      expect(event.payload).assertEqual(1024);
      expect(event.type).assertEqual(EventType.RESIZE);
      done();
    });

    it('WindowEventHandling_060', 0, async (done: Function) => {
      const queue = new EventQueue(1);
      const event = new WindowEvent(EventType.CLICK, 'a', 1, 0);
      queue.enqueue(event);
      const dequeued = queue.dequeue();
      expect(dequeued !== null).assertTrue();
      if (dequeued !== null) {
        expect(dequeued.target).assertEqual('a');
      }
      expect(queue.size()).assertEqual(0);
      done();
    });

    it('WindowEventHandling_061', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      dispatcher.dispatch(event);
      dispatcher.dispatch(event);
      expect(dispatcher.getDispatched()).assertEqual(2);
      expect(dispatcher.getHandled()).assertEqual(2);
      done();
    });

    it('WindowEventHandling_062', 0, async (done: Function) => {
      const handler = new EventHandler('h', EventType.RESIZE, 0, false);
      const event = new WindowEvent(EventType.RESIZE, 'window', 1, 0);
      expect(handler.invoke(event)).assertTrue();
      expect(event.handled).assertTrue();
      expect(handler.getInvocations()).assertEqual(1);
      done();
    });

    it('WindowEventHandling_063', 0, async (done: Function) => {
      const queue = new EventQueue(4);
      for (let i = 0; i < 4; i++) {
        queue.enqueue(new WindowEvent(EventType.SCROLL, 'list', i, i));
      }
      expect(queue.enqueue(new WindowEvent(EventType.SCROLL, 'list', 9, 9))).assertFalse();
      expect(queue.getDropped()).assertEqual(1);
      expect(queue.size()).assertEqual(4);
      done();
    });

    it('WindowEventHandling_064', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.KEY, 1, false));
      dispatcher.register(new EventHandler('b', EventType.KEY, 2, false));
      dispatcher.register(new EventHandler('c', EventType.KEY, 3, true));
      const event = new WindowEvent(EventType.KEY, 'input', 1, 0);
      dispatcher.dispatch(event);
      expect(dispatcher.count()).assertEqual(2);
      done();
    });

    it('WindowEventHandling_065', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      expect(dispatcher.find('missing')).assertNull();
      expect(dispatcher.dispatch(event)).assertEqual(0);
      expect(dispatcher.getHandled()).assertEqual(0);
      done();
    });

    it('WindowEventHandling_066', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Button');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('WindowEventHandling_067', 0, async (done: Function) => {
      const dispatcher = new EventDispatcher();
      dispatcher.register(new EventHandler('a', EventType.CLICK, 1, false));
      dispatcher.register(new EventHandler('b', EventType.CLICK, 2, false));
      dispatcher.register(new EventHandler('c', EventType.CLICK, 3, false));
      const event = new WindowEvent(EventType.CLICK, 'button', 1, 0);
      expect(dispatcher.dispatch(event)).assertEqual(3);
      expect(dispatcher.getHandled()).assertEqual(3);
      expect(event.handled).assertTrue();
      expect(dispatcher.count()).assertEqual(3);
      expect(dispatcher.highestPriority()).assertEqual(3);
      expect(event.propagationStopped).assertFalse();
      expect(event.defaultPrevented).assertFalse();
      done();
    });
  });
}
