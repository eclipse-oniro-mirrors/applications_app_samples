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

/**
 * Leak detection model of the TV screen recorder.
 * SRManager opens one photo asset file descriptor per recording, WindowManager
 * caches the floating windows by name and ScreenRecorderAbility registers a
 * state callback. All three resources are tracked so that a repeated
 * start / stop cycle must end with zero live resources.
 */

/** One file descriptor entry of the asset registry. */
interface AssetHandle {
  fd: number;
  uri: string;
  open: boolean;
}

/** One callback entry of the state registry. */
interface StateCallback {
  callbackId: string;
  registered: boolean;
}

/** Heap sample of one recording cycle. */
interface HeapSample {
  cycle: number;
  heapKb: number;
}

/** Tracks the photo asset file descriptors opened by the recorder. */
class AssetHandleRegistry {
  private handles: AssetHandle[] = [];
  private nextFd: number = 100;

  public open(uri: string): number {
    const fd = this.nextFd;
    this.nextFd++;
    const handle: AssetHandle = { fd: fd, uri: uri, open: true };
    this.handles.push(handle);
    return fd;
  }

  public close(fd: number): boolean {
    for (let index = 0; index < this.handles.length; index++) {
      if (this.handles[index].fd === fd && this.handles[index].open) {
        this.handles[index].open = false;
        return true;
      }
    }
    return false;
  }

  public closeAll(): number {
    let closed = 0;
    for (let index = 0; index < this.handles.length; index++) {
      if (this.handles[index].open) {
        this.handles[index].open = false;
        closed++;
      }
    }
    return closed;
  }

  public liveCount(): number {
    let count = 0;
    for (let index = 0; index < this.handles.length; index++) {
      if (this.handles[index].open) {
        count++;
      }
    }
    return count;
  }

  public totalOpened(): number {
    return this.handles.length;
  }

  public hasFd(fd: number): boolean {
    for (let index = 0; index < this.handles.length; index++) {
      if (this.handles[index].fd === fd) {
        return true;
      }
    }
    return false;
  }

  public liveFds(): number[] {
    const result: number[] = [];
    for (let index = 0; index < this.handles.length; index++) {
      if (this.handles[index].open) {
        result.push(this.handles[index].fd);
      }
    }
    return result;
  }
}

/** Cache of the floating windows managed by WindowManager. */
class WindowMapRegistry {
  private windows: Map<string, number> = new Map<string, number>();
  private created: number = 0;
  private destroyed: number = 0;

  public set(windowName: string): boolean {
    if (this.windows.has(windowName)) {
      return false;
    }
    this.windows.set(windowName, this.created);
    this.created++;
    return true;
  }

  public get(windowName: string): boolean {
    return this.windows.has(windowName);
  }

  public release(windowName: string): boolean {
    if (!this.windows.has(windowName)) {
      return false;
    }
    this.windows.delete(windowName);
    this.destroyed++;
    return true;
  }

  public releaseAll(): number {
    let count = 0;
    this.windows.forEach((value: number) => {
      count++;
    });
    this.destroyed += count;
    this.windows.clear();
    return count;
  }

  public size(): number {
    return this.windows.size;
  }

  public getCreated(): number {
    return this.created;
  }

  public getDestroyed(): number {
    return this.destroyed;
  }

  public names(): string[] {
    const result: string[] = [];
    this.windows.forEach((value: number, key: string) => result.push(key));
    return result;
  }
}

/** Registry of the onStateChange callbacks. */
class CallbackRegistry {
  private callbacks: StateCallback[] = [];
  private registrations: number = 0;

  public register(callbackId: string): void {
    for (let index = 0; index < this.callbacks.length; index++) {
      if (this.callbacks[index].callbackId === callbackId && this.callbacks[index].registered) {
        return;
      }
    }
    const entry: StateCallback = { callbackId: callbackId, registered: true };
    this.callbacks.push(entry);
    this.registrations++;
  }

  public unregister(callbackId: string): boolean {
    for (let index = 0; index < this.callbacks.length; index++) {
      if (this.callbacks[index].callbackId === callbackId && this.callbacks[index].registered) {
        this.callbacks[index].registered = false;
        return true;
      }
    }
    return false;
  }

  public unregisterAll(): number {
    let count = 0;
    for (let index = 0; index < this.callbacks.length; index++) {
      if (this.callbacks[index].registered) {
        this.callbacks[index].registered = false;
        count++;
      }
    }
    return count;
  }

  public activeCount(): number {
    let count = 0;
    for (let index = 0; index < this.callbacks.length; index++) {
      if (this.callbacks[index].registered) {
        count++;
      }
    }
    return count;
  }

  public totalRegistrations(): number {
    return this.registrations;
  }

  public isActive(callbackId: string): boolean {
    for (let index = 0; index < this.callbacks.length; index++) {
      if (this.callbacks[index].callbackId === callbackId) {
        return this.callbacks[index].registered;
      }
    }
    return false;
  }
}

/**
 * One recording cycle that acquires and releases every resource.
 * The cycle mirrors SRManager.startRecording followed by stopRecording plus the
 * ScreenRecorderAbility destruction path.
 */
class RecordingLeakCycle {
  private assets: AssetHandleRegistry;
  private windows: WindowMapRegistry;
  private callbacks: CallbackRegistry;
  private activeFd: number = -1;
  private cycleCount: number = 0;

  constructor(assets: AssetHandleRegistry, windows: WindowMapRegistry, callbacks: CallbackRegistry) {
    this.assets = assets;
    this.windows = windows;
    this.callbacks = callbacks;
  }

  public start(): void {
    this.callbacks.register('state_callback');
    this.activeFd = this.assets.open('fd://asset');
    this.windows.set('timer');
    this.windows.set('tip');
    this.cycleCount++;
  }

  public stop(): void {
    if (this.activeFd >= 0) {
      this.assets.close(this.activeFd);
      this.activeFd = -1;
    }
    this.windows.release('timer');
    this.windows.release('tip');
    this.callbacks.unregister('state_callback');
  }

  public destroy(): void {
    this.assets.closeAll();
    this.windows.releaseAll();
    this.callbacks.unregisterAll();
    this.activeFd = -1;
  }

  public getCycleCount(): number {
    return this.cycleCount;
  }

  public hasActiveAsset(): boolean {
    return this.activeFd >= 0;
  }
}

/** Tracks heap samples and reports the growth between cycles. */
class HeapGrowthTracker {
  private samples: HeapSample[] = [];

  public record(cycle: number, heapKb: number): void {
    const sample: HeapSample = { cycle: cycle, heapKb: heapKb };
    this.samples.push(sample);
  }

  public count(): number {
    return this.samples.length;
  }

  public first(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.samples[0].heapKb;
  }

  public last(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.samples[this.samples.length - 1].heapKb;
  }

  public growth(): number {
    return this.last() - this.first();
  }

  public isBounded(limitKb: number): boolean {
    return Math.abs(this.growth()) <= limitKb;
  }

  public max(): number {
    let peak = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].heapKb > peak) {
        peak = this.samples[index].heapKb;
      }
    }
    return peak;
  }

  public clear(): void {
    this.samples = [];
  }
}

export default function memoryLeakDetectionTest(): void {
  describe('MemoryLeakDetection_Test', () => {
    it('asset_fd_should_be_released_after_stop', 0, () => {
      const assets = new AssetHandleRegistry();
      const windows = new WindowMapRegistry();
      const callbacks = new CallbackRegistry();
      const cycle = new RecordingLeakCycle(assets, windows, callbacks);
      cycle.start();
      expect(assets.liveCount()).assertEqual(1);
      expect(cycle.hasActiveAsset()).assertTrue();
      cycle.stop();
      expect(assets.liveCount()).assertEqual(0);
      expect(cycle.hasActiveAsset()).assertFalse();
      expect(assets.totalOpened()).assertEqual(1);
    });

    it('close_of_unknown_fd_should_be_rejected', 0, () => {
      const assets = new AssetHandleRegistry();
      const fd = assets.open('fd://1');
      expect(assets.hasFd(fd)).assertTrue();
      expect(assets.close(fd)).assertTrue();
      expect(assets.close(fd)).assertFalse();
      expect(assets.close(9999)).assertFalse();
      expect(assets.liveFds().length).assertEqual(0);
    });

    it('window_map_should_release_every_entry', 0, () => {
      const windows = new WindowMapRegistry();
      expect(windows.set('timer')).assertTrue();
      expect(windows.set('tip')).assertTrue();
      expect(windows.set('timer')).assertFalse();
      expect(windows.size()).assertEqual(2);
      expect(windows.get('timer')).assertTrue();
      expect(windows.release('timer')).assertTrue();
      expect(windows.release('timer')).assertFalse();
      expect(windows.releaseAll()).assertEqual(1);
      expect(windows.size()).assertEqual(0);
      expect(windows.getCreated()).assertEqual(2);
      expect(windows.getDestroyed()).assertEqual(2);
    });

    it('window_names_should_follow_insertion_order', 0, () => {
      const windows = new WindowMapRegistry();
      windows.set('timer');
      windows.set('tip');
      const names = windows.names();
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('timer');
      expect(names[1]).assertEqual('tip');
    });

    it('callback_should_be_registered_once', 0, () => {
      const callbacks = new CallbackRegistry();
      callbacks.register('state_callback');
      callbacks.register('state_callback');
      expect(callbacks.activeCount()).assertEqual(1);
      expect(callbacks.totalRegistrations()).assertEqual(1);
      expect(callbacks.isActive('state_callback')).assertTrue();
    });

    it('callback_should_be_deregistered', 0, () => {
      const callbacks = new CallbackRegistry();
      callbacks.register('state_callback');
      expect(callbacks.unregister('state_callback')).assertTrue();
      expect(callbacks.unregister('state_callback')).assertFalse();
      expect(callbacks.activeCount()).assertEqual(0);
      expect(callbacks.unregisterAll()).assertEqual(0);
    });

    it('destroy_should_release_every_resource', 0, () => {
      const assets = new AssetHandleRegistry();
      const windows = new WindowMapRegistry();
      const callbacks = new CallbackRegistry();
      const cycle = new RecordingLeakCycle(assets, windows, callbacks);
      cycle.start();
      cycle.destroy();
      expect(assets.liveCount()).assertEqual(0);
      expect(windows.size()).assertEqual(0);
      expect(callbacks.activeCount()).assertEqual(0);
      expect(cycle.hasActiveAsset()).assertFalse();
    });

    it('repeated_cycles_should_not_accumulate_fds', 0, () => {
      const assets = new AssetHandleRegistry();
      const windows = new WindowMapRegistry();
      const callbacks = new CallbackRegistry();
      const cycle = new RecordingLeakCycle(assets, windows, callbacks);
      for (let round = 0; round < 200; round++) {
        cycle.start();
        expect(assets.liveCount()).assertEqual(1);
        cycle.stop();
        expect(assets.liveCount()).assertEqual(0);
      }
      expect(cycle.getCycleCount()).assertEqual(200);
      expect(assets.totalOpened()).assertEqual(200);
      expect(windows.size()).assertEqual(0);
      expect(callbacks.activeCount()).assertEqual(0);
    });

    it('repeated_cycles_should_keep_window_counts_balanced', 0, () => {
      const windows = new WindowMapRegistry();
      const callbacks = new CallbackRegistry();
      for (let round = 0; round < 50; round++) {
        windows.set('timer');
        windows.set('tip');
        callbacks.register(`callback_${round}`);
        callbacks.unregister(`callback_${round}`);
        windows.releaseAll();
        expect(windows.size()).assertEqual(0);
      }
      expect(windows.getCreated()).assertEqual(100);
      expect(windows.getDestroyed()).assertEqual(100);
      expect(windows.getCreated()).assertEqual(windows.getDestroyed());
      expect(callbacks.activeCount()).assertEqual(0);
      expect(callbacks.totalRegistrations()).assertEqual(50);
    });

    it('heap_growth_should_stay_bounded', 0, () => {
      const tracker = new HeapGrowthTracker();
      tracker.record(0, 12000);
      tracker.record(1, 12040);
      tracker.record(2, 12010);
      tracker.record(3, 12030);
      expect(tracker.count()).assertEqual(4);
      expect(tracker.first()).assertEqual(12000);
      expect(tracker.last()).assertEqual(12030);
      expect(tracker.growth()).assertEqual(30);
      expect(tracker.isBounded(100)).assertTrue();
      expect(tracker.max()).assertEqual(12040);
    });

    it('heap_growth_should_detect_a_leak', 0, () => {
      const tracker = new HeapGrowthTracker();
      tracker.record(0, 10000);
      tracker.record(1, 14000);
      expect(tracker.growth()).assertEqual(4000);
      expect(tracker.isBounded(500)).assertFalse();
      tracker.clear();
      expect(tracker.count()).assertEqual(0);
      expect(tracker.growth()).assertEqual(0);
    });

    it('empty_growth_tracker_should_report_zero', 0, () => {
      const tracker = new HeapGrowthTracker();
      expect(tracker.first()).assertEqual(0);
      expect(tracker.last()).assertEqual(0);
      expect(tracker.max()).assertEqual(0);
      expect(tracker.isBounded(0)).assertTrue();
    });

    it('comprehensive_leak_scenario_should_release_all', 0, () => {
      const assets = new AssetHandleRegistry();
      const windows = new WindowMapRegistry();
      const callbacks = new CallbackRegistry();
      const cycle = new RecordingLeakCycle(assets, windows, callbacks);
      const tracker = new HeapGrowthTracker();
      for (let round = 0; round < 30; round++) {
        cycle.start();
        cycle.stop();
        tracker.record(round, 20000 + round);
      }
      cycle.start();
      cycle.destroy();
      expect(assets.liveCount()).assertEqual(0);
      expect(windows.size()).assertEqual(0);
      expect(callbacks.activeCount()).assertEqual(0);
      expect(tracker.growth()).assertEqual(29);
      expect(tracker.isBounded(64)).assertTrue();
      expect(cycle.getCycleCount()).assertEqual(31);
    });

    it('asset_open_should_allocate_unique_fd', 0, () => {
      const assets = new AssetHandleRegistry();
      const first = assets.open('fd://a');
      const second = assets.open('fd://b');
      expect(first === second).assertFalse();
      expect(assets.liveFds().length).assertEqual(2);
      expect(assets.closeAll()).assertEqual(2);
      expect(assets.liveCount()).assertEqual(0);
    });
  });
}

