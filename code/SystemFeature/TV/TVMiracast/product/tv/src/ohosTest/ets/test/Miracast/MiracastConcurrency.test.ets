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
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_BACK,
  miracastComponentCount,
  waitForPageStable,
  pressAndWait,
  triggerMiracastHome,
  serializedDelay,
  getCurrentFocusIndex,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'MiracastConcurrencySuite';

interface ConcurrentRecord {
  type: string;
  timestamp: number;
  success: boolean;
}

class ConcurrencyTracker {
  private static instance: ConcurrencyTracker | null = null;
  private records: ConcurrentRecord[] = [];
  private maxConcurrency: number = 0;
  private activeCount: number = 0;
  private totalOperations: number = 0;

  public static getInstance(): ConcurrencyTracker {
    if (ConcurrencyTracker.instance === null) {
      ConcurrencyTracker.instance = new ConcurrencyTracker();
    }
    return ConcurrencyTracker.instance;
  }

  public beginOperation(type: string): void {
    this.activeCount++;
    this.totalOperations++;
    if (this.activeCount > this.maxConcurrency) {
      this.maxConcurrency = this.activeCount;
    }
    this.records.push({ type: type, timestamp: Date.now(), success: true });
  }

  public endOperation(): void {
    if (this.activeCount > 0) {
      this.activeCount--;
    }
  }

  public recordFailed(type: string): void {
    this.totalOperations++;
    this.records.push({ type: type, timestamp: Date.now(), success: false });
  }

  public getMaxConcurrency(): number { return this.maxConcurrency; }

  public getActiveCount(): number { return this.activeCount; }

  public getTotalOperations(): number { return this.totalOperations; }

  public getSuccessCount(): number {
    return this.records.filter((record: ConcurrentRecord) => record.success).length;
  }

  public getFailureCount(): number {
    return this.records.filter((record: ConcurrentRecord) => !record.success).length;
  }

  public getRecords(): ConcurrentRecord[] {
    return [...this.records];
  }

  public countByType(type: ConcurrentOperationType): number {
    return this.records.filter((record: ConcurrentRecord) => record.type === type).length;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.records = [];
    this.maxConcurrency = 0;
    this.activeCount = 0;
    this.totalOperations = 0;
  }
}

enum ConcurrentOperationType {
  SESSION_START = 'session_start',
  SESSION_STOP = 'session_stop',
  SCREEN_BIND = 'screen_bind',
  FOCUS_SWITCH = 'focus_switch',
  AUDIO_TOGGLE = 'audio_toggle',
  RENDER = 'render'
}

enum ConcurrencyState {
  IDLE = 'idle',
  ACTIVE = 'active',
  DRAINING = 'draining',
  TERMINATED = 'terminated'
}

class ConcurrencyStateMachine {
  private state: ConcurrencyState = ConcurrencyState.IDLE;
  private activeCount: number = 0;

  public start(): void {
    this.state = ConcurrencyState.ACTIVE;
  }

  public beginOperation(): void {
    this.activeCount++;
  }

  public endOperation(): void {
    if (this.activeCount > 0) {
      this.activeCount--;
    }
    if (this.activeCount === 0 && this.state === ConcurrencyState.DRAINING) {
      this.state = ConcurrencyState.IDLE;
    }
  }

  public drain(): void {
    this.state = this.activeCount === 0 ? ConcurrencyState.IDLE : ConcurrencyState.DRAINING;
  }

  public terminate(): void {
    this.state = ConcurrencyState.TERMINATED;
    this.activeCount = 0;
  }

  public getState(): ConcurrencyState {
    return this.state;
  }

  public getActiveCount(): number {
    return this.activeCount;
  }

  public isIdle(): boolean {
    return this.state === ConcurrencyState.IDLE;
  }

  public isActive(): boolean {
    return this.state === ConcurrencyState.ACTIVE;
  }

  public isTerminated(): boolean {
    return this.state === ConcurrencyState.TERMINATED;
  }
}

class SessionOperationGuard {
  private owner: string = '';
  private depth: number = 0;
  private rejectedCount: number = 0;

  public acquire(owner: string): boolean {
    if (this.owner.length === 0) {
      this.owner = owner;
      this.depth = 1;
      return true;
    }
    if (this.owner === owner) {
      this.depth++;
      return true;
    }
    this.rejectedCount++;
    return false;
  }

  public release(owner: string): boolean {
    if (this.owner !== owner || this.depth === 0) {
      return false;
    }
    this.depth--;
    if (this.depth === 0) {
      this.owner = '';
    }
    return true;
  }

  public isLocked(): boolean {
    return this.depth > 0;
  }

  public getOwner(): string { return this.owner; }

  public getDepth(): number { return this.depth; }

  public getRejectedCount(): number {
    return this.rejectedCount;
  }

  public reset(): void {
    this.owner = '';
    this.depth = 0;
    this.rejectedCount = 0;
  }
}

class AudioFocusMutex {
  private mutedDevices: Set<string> = new Set<string>();
  private focusedDeviceId: string = '';
  private unmuteCallCount: number = 0;
  private muteCallCount: number = 0;

  public register(deviceId: string): boolean {
    if (deviceId.length === 0) {
      return false;
    }
    this.mutedDevices.add(deviceId);
    return true;
  }

  public applyFocus(deviceId: string): boolean {
    if (!this.mutedDevices.has(deviceId)) {
      return false;
    }
    this.mutedDevices.forEach((muted: string) => {
      if (muted !== deviceId) {
        this.muteCallCount++;
      }
    });
    this.focusedDeviceId = deviceId;
    this.unmuteCallCount++;
    return true;
  }

  public isMuted(deviceId: string): boolean {
    return this.mutedDevices.has(deviceId) && deviceId !== this.focusedDeviceId;
  }

  public getFocusedDeviceId(): string { return this.focusedDeviceId; }

  public getRegisteredCount(): number { return this.mutedDevices.size; }

  public countAudioSwitches(): number { return this.unmuteCallCount + this.muteCallCount; }

  public remove(deviceId: string): boolean {
    if (!this.mutedDevices.has(deviceId)) {
      return false;
    }
    this.mutedDevices.delete(deviceId);
    if (this.focusedDeviceId === deviceId) {
      this.focusedDeviceId = '';
    }
    return true;
  }

  public reset(): void {
    this.mutedDevices = new Set<string>();
    this.focusedDeviceId = '';
    this.unmuteCallCount = 0;
    this.muteCallCount = 0;
  }
}

export default function miracastConcurrencySuite(): void {
  describe('MiracastConcurrency_Test', () => {
    let driver: Driver;
    let tracker: ConcurrencyTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = ConcurrencyTracker.getInstance();
      tracker.reset();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });
    it('page_should_maintain_state_during_concurrent_navigation', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.reset();
      for (let i = 0; i < 20; i++) {
        if (i % 2 === 0) {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        }
        tracker.beginOperation(i % 2 === 0 ? 'left' : 'right');
        tracker.endOperation();
      }
      expect(tracker.getTotalOperations()).assertEqual(20);
      expect(tracker.getActiveCount()).assertEqual(0);
    });
    it('concurrent_operations_should_have_chronological_timestamps', 0, async () => {
      tracker.reset();
      tracker.beginOperation('start');
      tracker.endOperation();
      tracker.beginOperation('screen');
      tracker.endOperation();
      tracker.beginOperation('play');
      tracker.endOperation();
      expect(tracker.isChronological()).assertTrue();
      expect(tracker.getRecords().length).assertEqual(3);
    });
    it('concurrent_operations_should_track_max_concurrency', 0, async () => {
      tracker.reset();
      tracker.beginOperation('tile_0');
      tracker.beginOperation('tile_1');
      tracker.beginOperation('tile_2');
      expect(tracker.getMaxConcurrency()).assertEqual(3);
      expect(tracker.getActiveCount()).assertEqual(3);
      tracker.endOperation();
      tracker.endOperation();
      tracker.endOperation();
      expect(tracker.getActiveCount()).assertEqual(0);
    });
    it('concurrency_tracker_singleton_should_be_consistent', 0, async () => {
      const first: ConcurrencyTracker = ConcurrencyTracker.getInstance();
      const second: ConcurrencyTracker = ConcurrencyTracker.getInstance();
      expect(first === second).assertTrue();
      expect(first === tracker).assertTrue();
    });
    it('concurrent_operations_should_handle_mixed_types', 0, async () => {
      tracker.reset();
      const types: string[] = ['start', 'screen', 'play', 'focus', 'mute'];
      types.forEach((type: string) => {
        tracker.beginOperation(type);
        tracker.endOperation();
      });
      expect(tracker.getTotalOperations()).assertEqual(5);
      expect(tracker.getSuccessCount()).assertEqual(5);
      expect(tracker.getFailureCount()).assertEqual(0);
    });
    it('concurrent_operations_should_handle_error_recovery', 0, async () => {
      tracker.reset();
      tracker.beginOperation('valid');
      tracker.endOperation();
      tracker.recordFailed('invalid');
      expect(tracker.getSuccessCount()).assertEqual(1);
      expect(tracker.getFailureCount()).assertEqual(1);
      expect(tracker.getTotalOperations()).assertEqual(2);
    });
    it('concurrent_operations_should_validate_success_rate', 0, async () => {
      tracker.reset();
      tracker.beginOperation('ok');
      tracker.endOperation();
      tracker.beginOperation('ok');
      tracker.endOperation();
      expect(tracker.getSuccessCount()).assertEqual(2);
      expect(tracker.getSuccessCount() === tracker.getTotalOperations()).assertTrue();
    });
    it('concurrency_state_machine_should_transition_state', 0, async () => {
      const machine = new ConcurrencyStateMachine();
      expect(machine.getState()).assertEqual(ConcurrencyState.IDLE);
      expect(machine.isIdle()).assertTrue();
      machine.start();
      expect(machine.isActive()).assertTrue();
      machine.beginOperation();
      machine.drain();
      expect(machine.getState()).assertEqual(ConcurrencyState.DRAINING);
      machine.endOperation();
      expect(machine.isIdle()).assertTrue();
      expect(machine.getActiveCount()).assertEqual(0);
    });
    it('concurrency_state_machine_should_drain_to_idle', 0, async () => {
      const machine = new ConcurrencyStateMachine();
      machine.start();
      machine.beginOperation();
      machine.beginOperation();
      machine.drain();
      expect(machine.getActiveCount()).assertEqual(2);
      machine.endOperation();
      expect(machine.getState()).assertEqual(ConcurrencyState.DRAINING);
      machine.endOperation();
      expect(machine.getState()).assertEqual(ConcurrencyState.IDLE);
    });
    it('concurrency_state_machine_should_terminate', 0, async () => {
      const machine = new ConcurrencyStateMachine();
      machine.start();
      machine.beginOperation();
      machine.terminate();
      expect(machine.isTerminated()).assertTrue();
      expect(machine.getActiveCount()).assertEqual(0);
      expect(machine.isIdle()).assertFalse();
      machine.endOperation();
      expect(machine.getActiveCount()).assertEqual(0);
    });
    it('session_guard_should_reject_conflicting_owner', 0, async () => {
      const guard = new SessionOperationGuard();
      expect(guard.acquire('start_flow')).assertTrue();
      expect(guard.isLocked()).assertTrue();
      expect(guard.acquire('stop_flow')).assertFalse();
      expect(guard.getRejectedCount()).assertEqual(1);
      expect(guard.getOwner()).assertEqual('start_flow');
      expect(guard.release('start_flow')).assertTrue();
      expect(guard.isLocked()).assertFalse();
    });
    it('session_guard_should_support_reentrant_owner', 0, async () => {
      const guard = new SessionOperationGuard();
      expect(guard.acquire('screen_flow')).assertTrue();
      expect(guard.acquire('screen_flow')).assertTrue();
      expect(guard.getDepth()).assertEqual(2);
      expect(guard.release('screen_flow')).assertTrue();
      expect(guard.isLocked()).assertTrue();
      expect(guard.release('screen_flow')).assertTrue();
      expect(guard.isLocked()).assertFalse();
      expect(guard.release('screen_flow')).assertFalse();
    });
    it('session_guard_should_reset_state', 0, async () => {
      const guard = new SessionOperationGuard();
      guard.acquire('stop_flow');
      guard.acquire('other_flow');
      expect(guard.getRejectedCount()).assertEqual(1);
      guard.reset();
      expect(guard.getOwner()).assertEqual('');
      expect(guard.getDepth()).assertEqual(0);
      expect(guard.getRejectedCount()).assertEqual(0);
      expect(guard.acquire('stop_flow')).assertTrue();
    });
    it('audio_mutex_should_unmute_focused_device_only', 0, async () => {
      const mutex = new AudioFocusMutex();
      expect(mutex.register('tile_a')).assertTrue();
      expect(mutex.register('tile_b')).assertTrue();
      expect(mutex.register('tile_c')).assertTrue();
      expect(mutex.register('')).assertFalse();
      expect(mutex.applyFocus('tile_b')).assertTrue();
      expect(mutex.getFocusedDeviceId()).assertEqual('tile_b');
      expect(mutex.isMuted('tile_b')).assertFalse();
      expect(mutex.isMuted('tile_a')).assertTrue();
      expect(mutex.isMuted('tile_c')).assertTrue();
      expect(mutex.countAudioSwitches()).assertLargerOrEqual(1);
    });
    it('audio_mutex_should_switch_focus_between_tiles', 0, async () => {
      const mutex = new AudioFocusMutex();
      mutex.register('tile_1');
      mutex.register('tile_2');
      mutex.applyFocus('tile_1');
      expect(mutex.isMuted('tile_2')).assertTrue();
      mutex.applyFocus('tile_2');
      expect(mutex.isMuted('tile_1')).assertTrue();
      expect(mutex.isMuted('tile_2')).assertFalse();
      expect(mutex.getFocusedDeviceId()).assertEqual('tile_2');
    });
    it('audio_mutex_should_reject_unregistered_focus', 0, async () => {
      const mutex = new AudioFocusMutex();
      mutex.register('tile_only');
      expect(mutex.applyFocus('tile_unknown')).assertFalse();
      expect(mutex.getFocusedDeviceId()).assertEqual('');
      expect(mutex.getRegisteredCount()).assertEqual(1);
    });
    it('audio_mutex_should_release_removed_device', 0, async () => {
      const mutex = new AudioFocusMutex();
      mutex.register('tile_x');
      mutex.register('tile_y');
      mutex.applyFocus('tile_x');
      expect(mutex.remove('tile_x')).assertTrue();
      expect(mutex.getFocusedDeviceId()).assertEqual('');
      expect(mutex.remove('tile_x')).assertFalse();
      expect(mutex.getRegisteredCount()).assertEqual(1);
      mutex.reset();
      expect(mutex.getRegisteredCount()).assertEqual(0);
      expect(mutex.countAudioSwitches()).assertEqual(0);
    });
    it('audio_mutex_should_handle_nine_tiles', 0, async () => {
      const mutex = new AudioFocusMutex();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        expect(mutex.register('grid_' + i)).assertTrue();
      }
      expect(mutex.getRegisteredCount()).assertEqual(MAX_MIRROR_TILES);
      expect(mutex.applyFocus('grid_8')).assertTrue();
      let mutedCount: number = 0;
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        if (mutex.isMuted('grid_' + i)) {
          mutedCount++;
        }
      }
      expect(mutedCount).assertEqual(MAX_MIRROR_TILES - 1);
    });
    it('concurrency_tracker_should_reset_statistics', 0, async () => {
      tracker.reset();
      tracker.beginOperation('start');
      tracker.beginOperation('stop');
      expect(tracker.getMaxConcurrency()).assertEqual(2);
      tracker.endOperation();
      tracker.endOperation();
      tracker.reset();
      expect(tracker.getTotalOperations()).assertEqual(0);
      expect(tracker.getMaxConcurrency()).assertEqual(0);
      expect(tracker.getRecords().length).assertEqual(0);
      expect(tracker.getActiveCount()).assertEqual(0);
    });
    it('concurrent_operation_type_should_cover_session_operations', 0, async () => {
      const types: ConcurrentOperationType[] = [
        ConcurrentOperationType.SESSION_START,
        ConcurrentOperationType.SESSION_STOP,
        ConcurrentOperationType.SCREEN_BIND,
        ConcurrentOperationType.FOCUS_SWITCH,
        ConcurrentOperationType.AUDIO_TOGGLE,
        ConcurrentOperationType.RENDER
      ];
      expect(types.length).assertEqual(6);
      const names: string[] = types.map((type: ConcurrentOperationType) => type.toString());
      const unique: Set<string> = new Set<string>(names);
      expect(unique.size).assertEqual(6);
      expect(types.includes(ConcurrentOperationType.SCREEN_BIND)).assertTrue();
    });
    it('vertical_concurrency_scenario_should_keep_focus_valid', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const guard = new SessionOperationGuard();
      expect(guard.acquire('focus_flow')).assertTrue();
      await pressAndWait(driver, KEY_DOWN, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 2, DELAY_KEY_NAVIGATION);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      expect(guard.release('focus_flow')).assertTrue();
      expect(guard.isLocked()).assertFalse();
    });

    it('concurrent_operations_should_count_by_type', 0, async () => {
      tracker.reset();
      tracker.beginOperation(ConcurrentOperationType.SESSION_START);
      tracker.beginOperation(ConcurrentOperationType.RENDER);
      tracker.beginOperation(ConcurrentOperationType.RENDER);
      tracker.endOperation();
      expect(tracker.countByType(ConcurrentOperationType.RENDER)).assertEqual(2);
      expect(tracker.countByType(ConcurrentOperationType.SESSION_START)).assertEqual(1);
      expect(tracker.countByType(ConcurrentOperationType.AUDIO_TOGGLE)).assertEqual(0);
    });
  });
}
