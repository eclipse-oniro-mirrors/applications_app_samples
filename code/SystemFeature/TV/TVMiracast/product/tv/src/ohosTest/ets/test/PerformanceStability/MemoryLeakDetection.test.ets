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
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_BACK, miracastComponentCount,
  waitForPageStable, pressAndWait, triggerMiracastHome, serializedDelay,
  TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP, MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';

enum LeakVerdict { CLEAN = 'clean', SUSPECT = 'suspect', LEAK = 'leak' }

class LeakTracker {
  private capacity: number;
  private players: Map<string, boolean> = new Map<string, boolean>();
  private listeners: number = 0;
  private handlers: number = 0;
  private peak: number = 0;
  private rejected: number = 0;

  constructor(capacity: number) { this.capacity = capacity > 0 ? capacity : MAX_MIRROR_TILES; }

  public register(deviceId: string): boolean {
    if (deviceId.length === 0 || this.players.has(deviceId) || this.players.size >= this.capacity) {
      this.rejected++;
      return false;
    }
    this.players.set(deviceId, true);
    if (this.players.size > this.peak) { this.peak = this.players.size; }
    return true;
  }

  public release(deviceId: string): boolean { return this.players.delete(deviceId); }
  public bindPlayer(deviceId: string): void { this.players.set(deviceId, true); }
  public bindListeners(count: number): void { this.listeners += count; }
  public clearListeners(): void { this.listeners = 0; }
  public bindHandler(deviceId: string): boolean { this.handlers++; this.players.set(deviceId, true); return true; }
  public clearHandlers(): void { this.handlers = 0; }
  public getActiveCount(): number { return this.players.size; }
  public getPeak(): number { return this.peak; }
  public getRejectedCount(): number { return this.rejected; }
  public getListenerCount(): number { return this.listeners; }
  public getHandlerCount(): number { return this.handlers; }
  public hasLeak(): boolean { return this.players.size !== 0 || this.listeners !== 0 || this.handlers !== 0; }
  public snapshot(): Array<number> { return [this.players.size, this.listeners, this.handlers]; }

  public isSameAs(other: Array<number>): boolean {
    const own: Array<number> = this.snapshot();
    return own[0] === other[0] && own[1] === other[1] && own[2] === other[2];
  }

  public classify(tolerance: number): LeakVerdict {
    const total: number = this.players.size + this.listeners + this.handlers;
    if (total === 0) { return LeakVerdict.CLEAN; }
    return total <= tolerance ? LeakVerdict.SUSPECT : LeakVerdict.LEAK;
  }
}

export default function memoryLeakDetectionSuite(): void {
  describe('MemoryLeakDetection_Suite', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('register_should_hold_player_until_release', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      expect(tracker.register('dev_1')).assertTrue();
      expect(tracker.release('dev_1')).assertTrue();
    });

    it('duplicate_register_should_be_rejected', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.register('dev_1');
      expect(tracker.register('dev_1')).assertFalse();
      expect(tracker.getRejectedCount()).assertEqual(1);
    });

    it('empty_device_id_should_be_rejected', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      expect(tracker.register('')).assertFalse();
      expect(tracker.getActiveCount()).assertEqual(0);
    });

    it('capacity_should_limit_nine_players', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      for (let i = 0; i < MAX_MIRROR_TILES; i++) { expect(tracker.register('dev_' + i)).assertTrue(); }
      expect(tracker.register('dev_extra')).assertFalse();
    });

    it('peak_should_track_highest_slot_usage', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.register('dev_1');
      tracker.register('dev_2');
      tracker.release('dev_2');
      expect(tracker.getPeak()).assertEqual(2);
    });

    it('release_unknown_player_should_fail', 0, async () => {
      expect(new LeakTracker(MAX_MIRROR_TILES).release('ghost')).assertFalse();
    });

    it('listeners_should_bind_and_clear', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.bindListeners(3);
      expect(tracker.getListenerCount()).assertEqual(3);
      tracker.clearListeners();
      expect(tracker.getListenerCount()).assertEqual(0);
    });

    it('handlers_should_bind_and_clear', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.bindHandler('dev_1');
      expect(tracker.getHandlerCount()).assertEqual(1);
      tracker.clearHandlers();
      expect(tracker.getHandlerCount()).assertEqual(0);
    });

    it('snapshot_should_capture_three_resource_kinds', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.bindPlayer('dev_1');
      tracker.bindListeners(2);
      expect(tracker.snapshot().length).assertEqual(3);
    });
    it('snapshot_comparison_should_match_equal_state', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.bindPlayer('dev_1');
      expect(tracker.isSameAs(tracker.snapshot())).assertTrue();
    });

    it('snapshot_comparison_should_detect_growth', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      const baseline: Array<number> = tracker.snapshot();
      tracker.bindPlayer('dev_1');
      expect(tracker.isSameAs(baseline)).assertFalse();
    });

    it('tracker_should_report_leak_after_register', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.register('dev_1');
      expect(tracker.hasLeak()).assertTrue();
    });

    it('tracker_should_be_clean_after_full_release', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.register('dev_1');
      tracker.release('dev_1');
      expect(tracker.hasLeak()).assertFalse();
    });

    it('classify_should_report_clean_for_empty_tracker', 0, async () => {
      expect(new LeakTracker(MAX_MIRROR_TILES).classify(1)).assertEqual(LeakVerdict.CLEAN);
    });

    it('classify_should_report_suspect_within_tolerance', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.bindListeners(2);
      expect(tracker.classify(2)).assertEqual(LeakVerdict.SUSPECT);
    });

    it('classify_should_report_leak_over_tolerance', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.bindListeners(4);
      expect(tracker.classify(2)).assertEqual(LeakVerdict.LEAK);
    });

    it('nine_slot_cycle_should_stay_leak_free', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        tracker.register('dev_' + i);
        tracker.release('dev_' + i);
      }
      expect(tracker.hasLeak()).assertFalse();
    });

    it('listener_and_player_cleanup_should_pair', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.bindPlayer('dev_1');
      tracker.bindListeners(1);
      tracker.release('dev_1');
      tracker.clearListeners();
      expect(tracker.snapshot()[1]).assertEqual(0);
    });



    it('repeated_stop_should_be_idempotent', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.register('dev_1');
      tracker.release('dev_1');
      expect(tracker.release('dev_1')).assertFalse();
    });

    it('device_reconnect_cycle_should_not_accumulate', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      for (let i = 0; i < 5; i++) { tracker.register('dev_9'); tracker.release('dev_9'); }
      expect(tracker.getPeak()).assertEqual(1);
    });

    it('full_cleanup_after_stop_should_be_leak_free', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      tracker.register('dev_1');
      tracker.bindListeners(2);
      tracker.clearListeners();
      tracker.release('dev_1');
      expect(tracker.snapshot()).assertDeepEquals([0, 0, 0]);
    });

    it('comprehensive_memory_scenario_should_be_clean', 0, async () => {
      const tracker = new LeakTracker(MAX_MIRROR_TILES);
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        tracker.register('dev_' + i);
        tracker.bindListeners(1);
        tracker.bindHandler('dev_' + i);
      }
      for (let i = 0; i < MAX_MIRROR_TILES; i++) { tracker.release('dev_' + i); }
      tracker.clearListeners();
      tracker.clearHandlers();
      expect(tracker.classify(0)).assertEqual(LeakVerdict.CLEAN);
    });
  });
}
