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

const STATE_CREATED: string = 'created';

const STATE_FOREGROUND: string = 'foreground';

const STATE_BACKGROUND: string = 'background';

const STATE_DESTROYED: string = 'destroyed';

const MIN_WIDTH: number = 320;

const MIN_HEIGHT: number = 240;

const MAX_WIDTH: number = 7680;

const MAX_HEIGHT: number = 4320;

interface WindowSize {
  width: number;
  height: number;
}

// Tracks the window lifecycle state machine
class WindowLifecycleManager {
  private state: string = STATE_CREATED;
  private foregroundCount: number = 0;
  private backgroundCount: number = 0;

  public show(): boolean {
    if (this.state !== STATE_CREATED && this.state !== STATE_BACKGROUND) {
      return false;
    }
    this.state = STATE_FOREGROUND;
    this.foregroundCount++;
    return true;
  }

  public hide(): boolean {
    if (this.state !== STATE_FOREGROUND) {
      return false;
    }
    this.state = STATE_BACKGROUND;
    this.backgroundCount++;
    return true;
  }

  public destroy(): boolean {
    if (this.state === STATE_DESTROYED) {
      return false;
    }
    this.state = STATE_DESTROYED;
    return true;
  }

  public getState(): string {
    return this.state;
  }

  public isForeground(): boolean {
    return this.state === STATE_FOREGROUND;
  }

  public isDestroyed(): boolean {
    return this.state === STATE_DESTROYED;
  }

  public getForegroundCount(): number {
    return this.foregroundCount;
  }

  public getBackgroundCount(): number {
    return this.backgroundCount;
  }

  public cycleCount(): number {
    return Math.min(this.foregroundCount, this.backgroundCount);
  }

  public reset(): void {
    this.state = STATE_CREATED;
    this.foregroundCount = 0;
    this.backgroundCount = 0;
  }
}

// Validates and tracks window resize events
class WindowSizeTracker {
  private size: WindowSize = { width: 1920, height: 1080 };
  private resizeCount: number = 0;

  public resize(width: number, height: number): boolean {
    if (!WindowSizeTracker.isSizeValid(width, height)) {
      return false;
    }
    this.size = { width: width, height: height };
    this.resizeCount++;
    return true;
  }

  public static isSizeValid(width: number, height: number): boolean {
    return width >= MIN_WIDTH && width <= MAX_WIDTH &&
      height >= MIN_HEIGHT && height <= MAX_HEIGHT;
  }

  public getSize(): WindowSize {
    return { width: this.size.width, height: this.size.height };
  }

  public getResizeCount(): number {
    return this.resizeCount;
  }

  public isLandscape(): boolean {
    return this.size.width >= this.size.height;
  }

  public aspectRatio(): number {
    return this.size.height === 0 ? 0 : this.size.width / this.size.height;
  }

  public reset(): void {
    this.size = { width: 1920, height: 1080 };
    this.resizeCount = 0;
  }
}

// Tracks focus ownership between windows
class WindowFocusState {
  private focused: boolean = true;
  private focusLossCount: number = 0;

  public loseFocus(): boolean {
    if (!this.focused) {
      return false;
    }
    this.focused = false;
    this.focusLossCount++;
    return true;
  }

  public gainFocus(): boolean {
    if (this.focused) {
      return false;
    }
    this.focused = true;
    return true;
  }

  public hasFocus(): boolean {
    return this.focused;
  }

  public getFocusLossCount(): number {
    return this.focusLossCount;
  }

  public reset(): void {
    this.focused = true;
    this.focusLossCount = 0;
  }
}

// Counts window lifecycle events
class WindowEventLog {
  private events: string[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(event: string): boolean {
    if (event.length === 0 || this.capacity <= 0) {
      return false;
    }
    if (this.events.length >= this.capacity) {
      this.events.shift();
    }
    this.events.push(event);
    return true;
  }

  public count(): number {
    return this.events.length;
  }

  public countOf(event: string): number {
    return this.events.filter((item: string) => item === event).length;
  }

  public latest(): string {
    return this.events.length === 0 ? '' : this.events[this.events.length - 1];
  }

  public clear(): void {
    this.events = [];
  }
}

export default function windowLifecycleTest() {
  describe('WindowLifecycle_Test', () => {

    it('window_should_start_created', 0, () => {
      const manager = new WindowLifecycleManager();
      expect(manager.getState()).assertEqual(STATE_CREATED);
      expect(manager.isForeground()).assertFalse();
      expect(manager.isDestroyed()).assertFalse();
      expect(manager.getForegroundCount()).assertEqual(0);
    });

    it('window_should_show_and_hide', 0, () => {
      const manager = new WindowLifecycleManager();
      expect(manager.show()).assertTrue();
      expect(manager.isForeground()).assertTrue();
      expect(manager.getForegroundCount()).assertEqual(1);
      expect(manager.hide()).assertTrue();
      expect(manager.getState()).assertEqual(STATE_BACKGROUND);
      expect(manager.getBackgroundCount()).assertEqual(1);
      expect(manager.cycleCount()).assertEqual(1);
    });

    it('window_should_reject_invalid_transitions', 0, () => {
      const manager = new WindowLifecycleManager();
      expect(manager.hide()).assertFalse();
      manager.show();
      expect(manager.show()).assertFalse();
      manager.hide();
      manager.hide();
      expect(manager.getBackgroundCount()).assertEqual(1);
    });

    it('window_should_destroy_once', 0, () => {
      const manager = new WindowLifecycleManager();
      manager.show();
      expect(manager.destroy()).assertTrue();
      expect(manager.isDestroyed()).assertTrue();
      expect(manager.destroy()).assertFalse();
      expect(manager.show()).assertFalse();
      expect(manager.hide()).assertFalse();
      manager.reset();
      expect(manager.getState()).assertEqual(STATE_CREATED);
      expect(manager.cycleCount()).assertEqual(0);
    });

    it('window_should_count_cycles', 0, () => {
      const manager = new WindowLifecycleManager();
      for (let i = 0; i < 3; i++) {
        manager.show();
        manager.hide();
      }
      expect(manager.getForegroundCount()).assertEqual(3);
      expect(manager.getBackgroundCount()).assertEqual(3);
      expect(manager.cycleCount()).assertEqual(3);
      expect(manager.getState()).assertEqual(STATE_BACKGROUND);
    });

    it('size_tracker_should_validate_resize', 0, () => {
      const tracker = new WindowSizeTracker();
      expect(tracker.resize(1280, 720)).assertTrue();
      expect(tracker.getResizeCount()).assertEqual(1);
      const size = tracker.getSize();
      expect(size.width).assertEqual(1280);
      expect(size.height).assertEqual(720);
      expect(tracker.resize(MIN_WIDTH - 1, 720)).assertFalse();
      expect(tracker.resize(1280, MIN_HEIGHT - 1)).assertFalse();
      expect(tracker.resize(MAX_WIDTH + 1, 720)).assertFalse();
    });

    it('size_tracker_should_compute_orientation', 0, () => {
      const tracker = new WindowSizeTracker();
      expect(tracker.isLandscape()).assertTrue();
      expect(tracker.aspectRatio()).assertClose(16 / 9, 0.001);
      tracker.resize(1080, 1920);
      expect(tracker.isLandscape()).assertFalse();
      expect(tracker.aspectRatio()).assertClose(9 / 16, 0.001);
      tracker.reset();
      expect(tracker.getResizeCount()).assertEqual(0);
      expect(tracker.getSize().width).assertEqual(1920);
    });

    it('focus_state_should_track_ownership', 0, () => {
      const focus = new WindowFocusState();
      expect(focus.hasFocus()).assertTrue();
      expect(focus.loseFocus()).assertTrue();
      expect(focus.hasFocus()).assertFalse();
      expect(focus.getFocusLossCount()).assertEqual(1);
      expect(focus.loseFocus()).assertFalse();
      expect(focus.gainFocus()).assertTrue();
      expect(focus.hasFocus()).assertTrue();
      expect(focus.gainFocus()).assertFalse();
      focus.reset();
      expect(focus.getFocusLossCount()).assertEqual(0);
    });

    it('event_log_should_be_bounded', 0, () => {
      const log = new WindowEventLog(2);
      expect(log.record('show')).assertTrue();
      log.record('hide');
      log.record('show');
      expect(log.count()).assertEqual(2);
      expect(log.countOf('show')).assertEqual(1);
      expect(log.latest()).assertEqual('show');
      expect(log.record('')).assertFalse();
      log.clear();
      expect(log.count()).assertEqual(0);
    });

    it('window_flow_should_cover_foreground_cycle', 0, () => {
      const manager = new WindowLifecycleManager();
      const focus = new WindowFocusState();
      const log = new WindowEventLog(10);
      const size = new WindowSizeTracker();
      if (manager.show()) {
        log.record('show');
      }
      size.resize(3840, 2160);
      focus.loseFocus();
      log.record('blur');
      focus.gainFocus();
      if (manager.hide()) {
        log.record('hide');
      }
      expect(manager.getState()).assertEqual(STATE_BACKGROUND);
      expect(log.count()).assertEqual(3);
      expect(focus.getFocusLossCount()).assertEqual(1);
      expect(size.getResizeCount()).assertEqual(1);
      expect(manager.cycleCount()).assertEqual(1);
    });

    it('window_constants_should_be_stable', 0, () => {
      expect(STATE_CREATED).assertEqual('created');
      expect(STATE_FOREGROUND).assertEqual('foreground');
      expect(STATE_BACKGROUND).assertEqual('background');
      expect(STATE_DESTROYED).assertEqual('destroyed');
      expect(MIN_WIDTH).assertEqual(320);
      expect(MIN_HEIGHT).assertEqual(240);
      expect(MAX_WIDTH).assertEqual(7680);
      expect(MAX_HEIGHT).assertEqual(4320);
    });
  });
}

