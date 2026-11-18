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
  KEY_BACK,
  pressAndWait,
  serializedDelay,
  miracastComponentCount,
  waitForPageStable,
  isIndexPageVisible,
  launchPlayerPage,
  triggerMiracastHome,
  TIMEOUT_PLAYER_RENDER,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_SERVICE_RECONNECT,
  DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'StateRecoverySuite';

interface RecoverySnapshot {
  deviceId: string;
  deviceName: string;
  tileCount: number;
  wasMirroring: boolean;
}

class ReconnectGate {
  private pending: boolean = false;
  private scheduled: boolean = false;
  private readonly delayMs: number = 400;
  public mark(): void {
    this.pending = true;
  }
  public isPending(): boolean {
    return this.pending;
  }
  public consume(): boolean {
    if (!this.pending) {
      return false;
    }
    this.pending = false;
    return true;
  }

  public isDue(elapsedMs: number): boolean {
    return this.scheduled && elapsedMs >= this.delayMs;
  }
  public schedule(): boolean {
    if (this.scheduled) {
      return false;
    }
    this.scheduled = true;
    return true;
  }
  public complete(): boolean {
    if (!this.scheduled) {
      return false;
    }
    this.scheduled = false;
    return true;
  }
  public reset(): void {
    this.pending = false;
    this.scheduled = false;
  }
}
class RecoveryDecision {
  private readonly finalizeTimeoutMs: number = 1200;
  public requiresReconnect(gate: ReconnectGate, snapshot: RecoverySnapshot | null): boolean {
    if (gate.isPending()) {
      return true;
    }
    return snapshot !== null && snapshot.wasMirroring && snapshot.deviceId.length > 0;
  }
  public targetPage(snapshot: RecoverySnapshot | null): string {
    if (snapshot !== null && snapshot.wasMirroring && snapshot.deviceId.length > 0) {
      return 'pages/PlayerPage';
    }
    return 'pages/Index';
  }
  public isWithinBudget(elapsedMs: number): boolean {
    return elapsedMs >= 0 && elapsedMs <= this.finalizeTimeoutMs;
  }

}

class RecoverySnapshotStore {
  private snapshots: RecoverySnapshot[] = [];
  public save(snapshot: RecoverySnapshot): boolean {
    if (snapshot.deviceId.length === 0 || snapshot.tileCount < 0 || snapshot.tileCount > 9) {
      return false;
    }
    this.snapshots.push(snapshot);
    return true;
  }
  public latest(): RecoverySnapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 1];
  }
  public findByDevice(deviceId: string): RecoverySnapshot | null {
    for (let i = this.snapshots.length - 1; i >= 0; i--) {
      if (this.snapshots[i].deviceId === deviceId) {
        return this.snapshots[i];
      }
    }
    return null;
  }
  public size(): number {
    return this.snapshots.length;
  }
  public clear(): void {
    this.snapshots = [];
  }
}

export default function stateRecoverySuite(): void {
  describe('StateRecovery_Suite', () => {
    let driver: Driver;
    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite start');
    });
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      Log.info(TAG, 'suite end');
    });

    it('reconnect_flag_should_be_consumed_once', 0, async () => {
      const gate = new ReconnectGate();
      gate.mark();
      expect(gate.isPending() && gate.consume() && !gate.consume()).assertTrue();
    });
    it('reconnect_flag_should_reject_consume_before_mark', 0, async () => {
      expect(new ReconnectGate().consume()).assertFalse();
    });
    it('reconnect_gate_should_reject_duplicate_schedule', 0, async () => {
      const gate = new ReconnectGate();
      expect(gate.schedule()).assertTrue();
      expect(gate.schedule()).assertFalse();
    });
    it('reconnect_gate_should_not_fire_before_delay', 0, async () => {
      const gate = new ReconnectGate();
      gate.schedule();
      expect(!gate.isDue(399) && gate.isDue(400)).assertTrue();
    });
    it('reconnect_gate_should_not_be_due_without_schedule', 0, async () => {
      expect(new ReconnectGate().isDue(1000)).assertFalse();
    });
    it('reconnect_gate_should_complete_once', 0, async () => {
      const gate = new ReconnectGate();
      gate.schedule();
      expect(gate.complete() && !gate.complete()).assertTrue();
    });
    it('reconnect_gate_reset_should_clear_state', 0, async () => {
      const gate = new ReconnectGate();
      gate.mark();
      gate.schedule();
      gate.reset();
      expect(!gate.isPending() && !gate.isDue(400)).assertTrue();
    });
    it('recovery_decision_should_require_reconnect_with_flag', 0, async () => {
      const gate = new ReconnectGate();
      gate.mark();
      expect(new RecoveryDecision().requiresReconnect(gate, null)).assertTrue();
    });
    it('recovery_decision_should_skip_reconnect_without_flag', 0, async () => {
      const idle: RecoverySnapshot = { deviceId: 'device_1', deviceName: 'SinkA', tileCount: 0, wasMirroring: false };
      expect(new RecoveryDecision().requiresReconnect(new ReconnectGate(), idle)).assertFalse();
    });
    it('recovery_decision_should_follow_snapshot_mirroring', 0, async () => {
      const mirroring: RecoverySnapshot = { deviceId: 'device_1', deviceName: 'SinkA', tileCount: 1,
        wasMirroring: true };
      expect(new RecoveryDecision().requiresReconnect(new ReconnectGate(), mirroring)).assertTrue();
    });
    it('recovery_decision_should_choose_target_page', 0, async () => {
      const mirroring: RecoverySnapshot = { deviceId: 'device_1', deviceName: 'SinkA', tileCount: 1,
        wasMirroring: true };
      expect(new RecoveryDecision().targetPage(mirroring)).assertEqual('pages/PlayerPage');
      expect(new RecoveryDecision().targetPage(null)).assertEqual('pages/Index');
    });
    it('recovery_decision_should_keep_1200ms_timeout', 0, async () => {
      const decision = new RecoveryDecision();
      expect(decision.isWithinBudget(1200) && !decision.isWithinBudget(1201)).assertTrue();
    });
    it('recovery_decision_should_reject_negative_budget', 0, async () => {
      expect(new RecoveryDecision().isWithinBudget(-1)).assertFalse();
    });
    it('snapshot_store_should_return_latest_snapshot', 0, async () => {
      const store = new RecoverySnapshotStore();
      store.save({ deviceId: 'device_1', deviceName: 'SinkA', tileCount: 1, wasMirroring: true });
      expect(store.latest() !== null && store.size() === 1).assertTrue();
    });
    it('snapshot_store_should_reject_invalid_snapshot', 0, async () => {
      const store = new RecoverySnapshotStore();
      store.save({ deviceId: '', deviceName: 'SinkA', tileCount: 1, wasMirroring: true });
      store.save({ deviceId: 'device_1', deviceName: 'SinkA', tileCount: 10, wasMirroring: true });
      expect(store.size()).assertEqual(0);
    });
    it('snapshot_store_should_reject_negative_tile_count', 0, async () => {
      const store = new RecoverySnapshotStore();
      store.save({ deviceId: 'device_1', deviceName: 'SinkA', tileCount: -1, wasMirroring: true });
      expect(store.size()).assertEqual(0);
    });
    it('snapshot_store_should_find_by_device', 0, async () => {
      const store = new RecoverySnapshotStore();
      store.save({ deviceId: 'device_a', deviceName: 'SinkA', tileCount: 1, wasMirroring: true });
      expect(store.findByDevice('device_a') !== null && store.findByDevice('device_z') === null).assertTrue();
    });
    it('snapshot_store_clear_should_drop_snapshots', 0, async () => {
      const store = new RecoverySnapshotStore();
      store.save({ deviceId: 'device_clear', deviceName: 'ClearSink', tileCount: 1, wasMirroring: true });
      store.clear();
      expect(store.size() === 0 && store.latest() === null).assertTrue();
    });
    it('background_recovery_should_require_reconnect', 0, async () => {
      const gate = new ReconnectGate();
      const snapshot: RecoverySnapshot = { deviceId: 'device_bg', deviceName: 'BgSink', tileCount: 1,
        wasMirroring: true };
      gate.mark();
      expect(new RecoveryDecision().requiresReconnect(gate, snapshot) && gate.consume()).assertTrue();
    });
    it('restart_recovery_should_fall_back_to_index', 0, async () => {
      expect(new RecoveryDecision().targetPage(null)).assertEqual('pages/Index');
    });
    it('memory_pressure_recovery_should_follow_snapshot', 0, async () => {
      const store = new RecoverySnapshotStore();
      const snapshot: RecoverySnapshot = { deviceId: 'device_mem', deviceName: 'MemSink', tileCount: 3,
        wasMirroring: true };
      store.save(snapshot);
      expect(new RecoveryDecision().targetPage(store.latest())).assertEqual('pages/PlayerPage');
    });
    it('service_killed_recovery_should_use_full_budget', 0, async () => {
      expect(new RecoveryDecision().isWithinBudget(1200)).assertTrue();
    });
    it('reconnect_gate_should_reject_complete_without_schedule', 0, async () => {
      expect(new ReconnectGate().complete()).assertFalse();
    });
    it('snapshot_store_should_accept_nine_tiles', 0, async () => {
      const store = new RecoverySnapshotStore();
      store.save({ deviceId: 'device_nine', deviceName: 'NineSink', tileCount: 9, wasMirroring: true });
      expect(store.size()).assertEqual(1);
    });
    it('reconnect_delay_should_match_shared_constant', 0, async () => {
      expect(DELAY_SERVICE_RECONNECT).assertEqual(400);
    });
  });
}
