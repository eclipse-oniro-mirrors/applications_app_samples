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
  getPlayerTileCount,
  getDeviceIdList,
  launchPlayerPage,
  triggerMiracastHome,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'SessionManagementSuite';

enum DeviceSessionState {
  REGISTERED = 'registered',
  CONNECTING = 'connecting',
  CONNECTED = 'connected',
  MIRRORING = 'mirroring',
  DISCONNECTED = 'disconnected'
}

class DeviceSessionRegistry {
  private static instance: DeviceSessionRegistry | null = null;
  private states: Map<string, DeviceSessionState> = new Map<string, DeviceSessionState>();
  private tiles: Map<string, number> = new Map<string, number>();
  public static getInstance(): DeviceSessionRegistry {
    if (DeviceSessionRegistry.instance === null) {
      DeviceSessionRegistry.instance = new DeviceSessionRegistry();
    }
    return DeviceSessionRegistry.instance;
  }
  public register(deviceId: string, deviceName: string, tileIndex: number): boolean {
    if (deviceId.length === 0 || deviceName.length === 0 || this.states.has(deviceId)) {
      return false;
    }
    if (tileIndex < 0 || tileIndex >= MAX_MIRROR_TILES || this.isTileIndexTaken(tileIndex)) {
      return false;
    }
    this.states.set(deviceId, DeviceSessionState.REGISTERED);
    this.tiles.set(deviceId, tileIndex);
    return true;
  }
  public has(deviceId: string): boolean {
    return this.states.has(deviceId);
  }
  public getState(deviceId: string): DeviceSessionState | null {
    const state = this.states.get(deviceId);
    if (state === undefined) {
      return null;
    }
    return state;
  }
  public getTileIndex(deviceId: string): number {
    const tile = this.tiles.get(deviceId);
    if (tile === undefined) {
      return -1;
    }
    return tile;
  }
  public isTileIndexTaken(tileIndex: number): boolean {
    const keys = this.tiles.keys();
    for (const key of keys) {
      if (this.tiles.get(key) === tileIndex) {
        return true;
      }
    }
    return false;
  }
  public updateState(deviceId: string, state: DeviceSessionState): boolean {
    const current = this.states.get(deviceId);
    if (current === undefined || !this.isTransitionAllowed(current, state)) {
      return false;
    }
    this.states.set(deviceId, state);
    return true;
  }
  public isTransitionAllowed(from: DeviceSessionState, to: DeviceSessionState): boolean {
    if (from === to) {
      return false;
    }
    if (from === DeviceSessionState.REGISTERED) {
      return to === DeviceSessionState.CONNECTING || to === DeviceSessionState.DISCONNECTED;
    }
    if (from === DeviceSessionState.CONNECTING) {
      return to === DeviceSessionState.CONNECTED || to === DeviceSessionState.DISCONNECTED;
    }
    if (from === DeviceSessionState.CONNECTED) {
      return to === DeviceSessionState.MIRRORING || to === DeviceSessionState.DISCONNECTED;
    }
    if (from === DeviceSessionState.MIRRORING) {
      return to === DeviceSessionState.DISCONNECTED;
    }
    return to === DeviceSessionState.CONNECTING;
  }
  public remove(deviceId: string): boolean {
    if (!this.states.has(deviceId)) {
      return false;
    }
    this.states.delete(deviceId);
    this.tiles.delete(deviceId);
    return true;
  }
  public size(): number {
    return this.states.size;
  }
  public isFull(): boolean {
    return this.states.size >= MAX_MIRROR_TILES;
  }
  public getDeviceIds(): string[] {
    const ids: string[] = [];
    const keys = this.states.keys();
    for (const key of keys) {
      ids.push(key);
    }
    return ids;
  }
  public countByState(state: DeviceSessionState): number {
    let count: number = 0;
    const keys = this.states.keys();
    for (const key of keys) {
      if (this.states.get(key) === state) {
        count++;
      }
    }
    return count;
  }
  public clear(): number {
    const removed: number = this.states.size;
    this.states.clear();
    this.tiles.clear();
    return removed;
  }
}

class TileIndexAllocator {
  private usedIndexes: number[] = [];
  public allocate(): number {
    for (let i = 0; i < MAX_MIRROR_TILES; i++) {
      if (this.usedIndexes.indexOf(i) < 0) {
        this.usedIndexes.push(i);
        return i;
      }
    }
    return -1;
  }
  public release(index: number): boolean {
    const position: number = this.usedIndexes.indexOf(index);
    if (position < 0) {
      return false;
    }
    this.usedIndexes.splice(position, 1);
    return true;
  }
  public isUsed(index: number): boolean {
    return this.usedIndexes.indexOf(index) >= 0;
  }
  public getUsedCount(): number {
    return this.usedIndexes.length;
  }
  public isExhausted(): boolean {
    return this.usedIndexes.length >= MAX_MIRROR_TILES;
  }
  public reset(): void {
    this.usedIndexes = [];
  }
}
interface DeviceSessionEvent {
  deviceId: string;
  toState: DeviceSessionState;
}

class DeviceSessionKeyEvents {
  private events: DeviceSessionEvent[] = [];
  public record(deviceId: string, to: DeviceSessionState): void {
    const event: DeviceSessionEvent = { deviceId: deviceId, toState: to };
    this.events.push(event);
  }
  public countFor(deviceId: string): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].deviceId === deviceId) {
        count++;
      }
    }
    return count;
  }
  public lastFor(deviceId: string): DeviceSessionEvent | null {
    for (let i = this.events.length - 1; i >= 0; i--) {
      if (this.events[i].deviceId === deviceId) {
        return this.events[i];
      }
    }
    return null;
  }
  public countTransitionsTo(state: DeviceSessionState): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].toState === state) {
        count++;
      }
    }
    return count;
  }
  public clear(): void {
    this.events = [];
  }
}

class DeviceSessionSummary {
  private registered: number = 0;
  private mirroring: number = 0;
  private disconnected: number = 0;
  public analyze(registry: DeviceSessionRegistry): void {
    this.registered = registry.countByState(DeviceSessionState.REGISTERED);
    this.mirroring = registry.countByState(DeviceSessionState.MIRRORING);
    this.disconnected = registry.countByState(DeviceSessionState.DISCONNECTED);
  }
  public getRegistered(): number {
    return this.registered;
  }
  public getMirroring(): number {
    return this.mirroring;
  }
  public getDisconnected(): number {
    return this.disconnected;
  }
  public getActive(): number {
    return this.registered + this.mirroring;
  }
  public isIdle(): boolean {
    return this.getActive() === 0;
  }
}
export default function sessionManagementSuite(): void {
  describe('SessionManagement_Suite', () => {
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

    it('registry_should_reject_empty_identity', 0, async () => {
      const registry = new DeviceSessionRegistry();
      expect(registry.register('', 'Sink', 0)).assertFalse();
      expect(registry.register('device_1', '', 0)).assertFalse();
      expect(registry.size()).assertEqual(0);
    });
    it('registry_should_reject_duplicate_device', 0, async () => {
      const registry = new DeviceSessionRegistry();
      expect(registry.register('device_1', 'SinkA', 0)).assertTrue();
      expect(registry.register('device_1', 'SinkB', 1)).assertFalse();
      expect(registry.size()).assertEqual(1);
    });
    it('registry_entry_should_start_as_registered', 0, async () => {
      const registry = new DeviceSessionRegistry();
      registry.register('device_1', 'SinkA', 2);
      expect(registry.getState('device_1')).assertEqual(DeviceSessionState.REGISTERED);
      expect(registry.getTileIndex('device_1')).assertEqual(2);
    });
    it('registry_should_reject_out_of_range_tile_index', 0, async () => {
      const registry = new DeviceSessionRegistry();
      expect(registry.register('device_1', 'SinkA', -1)).assertFalse();
      expect(registry.register('device_2', 'SinkB', MAX_MIRROR_TILES)).assertFalse();
      expect(registry.register('device_3', 'SinkC', MAX_MIRROR_TILES - 1)).assertTrue();
    });
    it('registry_should_reject_taken_tile_index', 0, async () => {
      const registry = new DeviceSessionRegistry();
      registry.register('device_1', 'SinkA', 0);
      expect(registry.isTileIndexTaken(0)).assertTrue();
      expect(registry.register('device_2', 'SinkB', 0)).assertFalse();
      expect(registry.register('device_2', 'SinkB', 1)).assertTrue();
    });
    it('registry_should_accept_forward_state_chain', 0, async () => {
      const registry = new DeviceSessionRegistry();
      registry.register('device_1', 'SinkA', 0);
      expect(registry.updateState('device_1', DeviceSessionState.CONNECTING)).assertTrue();
      expect(registry.updateState('device_1', DeviceSessionState.CONNECTED)).assertTrue();
      expect(registry.updateState('device_1', DeviceSessionState.MIRRORING)).assertTrue();
      expect(registry.getState('device_1')).assertEqual(DeviceSessionState.MIRRORING);
    });
    it('registry_should_reject_illegal_state_jump', 0, async () => {
      const registry = new DeviceSessionRegistry();
      registry.register('device_1', 'SinkA', 0);
      expect(registry.updateState('device_1', DeviceSessionState.MIRRORING)).assertFalse();
      expect(registry.updateState('device_1', DeviceSessionState.CONNECTED)).assertFalse();
      expect(registry.updateState('device_1', DeviceSessionState.CONNECTING)).assertTrue();
    });
    it('registry_should_reject_same_state_update', 0, async () => {
      const registry = new DeviceSessionRegistry();
      registry.register('device_1', 'SinkA', 0);
      expect(registry.updateState('device_1', DeviceSessionState.REGISTERED)).assertFalse();
      expect(registry.isTransitionAllowed(DeviceSessionState.CONNECTED, DeviceSessionState.CONNECTED)).assertFalse();
    });
    it('registry_should_reject_update_of_unknown_device', 0, async () => {
      const registry = new DeviceSessionRegistry();
      expect(registry.updateState('ghost', DeviceSessionState.CONNECTING)).assertFalse();
      expect(registry.remove('ghost')).assertFalse();
      expect(registry.has('ghost')).assertFalse();
    });
    it('registry_should_allow_reconnect_after_disconnect', 0, async () => {
      const registry = new DeviceSessionRegistry();
      registry.register('device_1', 'SinkA', 0);
      registry.updateState('device_1', DeviceSessionState.CONNECTING);
      registry.updateState('device_1', DeviceSessionState.DISCONNECTED);
      expect(registry.updateState('device_1', DeviceSessionState.CONNECTING)).assertTrue();
      expect(registry.countByState(DeviceSessionState.CONNECTING)).assertEqual(1);
    });
    it('registry_should_remove_device_entry', 0, async () => {
      const registry = new DeviceSessionRegistry();
      registry.register('device_1', 'SinkA', 0);
      expect(registry.remove('device_1')).assertTrue();
      expect(registry.remove('device_1')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });
    it('registry_should_be_full_at_max_tiles', 0, async () => {
      const registry = new DeviceSessionRegistry();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        expect(registry.register('device_' + i, 'Sink' + i, i)).assertTrue();
      }
      expect(registry.isFull()).assertTrue();
      expect(registry.getDeviceIds().length).assertEqual(MAX_MIRROR_TILES);
    });
    it('registry_singleton_should_share_entries', 0, async () => {
      const first: DeviceSessionRegistry = DeviceSessionRegistry.getInstance();
      first.clear();
      first.register('device_shared', 'SharedSink', 0);
      expect(DeviceSessionRegistry.getInstance().has('device_shared')).assertTrue();
      first.clear();
    });
    it('index_allocator_should_assign_smallest_free_index', 0, async () => {
      const allocator = new TileIndexAllocator();
      expect(allocator.allocate()).assertEqual(0);
      expect(allocator.allocate()).assertEqual(1);
      expect(allocator.release(0)).assertTrue();
      expect(allocator.allocate()).assertEqual(0);
      expect(allocator.isUsed(1)).assertTrue();
    });
    it('index_allocator_should_return_minus_one_when_exhausted', 0, async () => {
      const allocator = new TileIndexAllocator();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        expect(allocator.allocate()).assertEqual(i);
      }
      expect(allocator.isExhausted()).assertTrue();
      expect(allocator.allocate()).assertEqual(-1);
    });
    it('index_allocator_should_reject_double_release', 0, async () => {
      const allocator = new TileIndexAllocator();
      allocator.allocate();
      expect(allocator.release(0)).assertTrue();
      expect(allocator.release(0)).assertFalse();
      allocator.reset();
      expect(allocator.getUsedCount()).assertEqual(0);
    });
    it('event_log_should_count_per_device', 0, async () => {
      const log = new DeviceSessionKeyEvents();
      log.record('device_1', DeviceSessionState.CONNECTING);
      log.record('device_1', DeviceSessionState.CONNECTED);
      log.record('device_2', DeviceSessionState.CONNECTING);
      expect(log.countFor('device_1')).assertEqual(2);
      expect(log.countFor('device_3')).assertEqual(0);
    });
    it('event_log_should_return_last_event_per_device', 0, async () => {
      const log = new DeviceSessionKeyEvents();
      log.record('device_1', DeviceSessionState.CONNECTING);
      log.record('device_1', DeviceSessionState.MIRRORING);
      const last: DeviceSessionEvent | null = log.lastFor('device_1');
      expect(last !== null && last.toState === DeviceSessionState.MIRRORING).assertTrue();
      expect(log.lastFor('device_9')).assertNull();
    });
    it('event_log_clear_should_empty_events', 0, async () => {
      const log = new DeviceSessionKeyEvents();
      log.record('device_1', DeviceSessionState.CONNECTING);
      log.clear();
      expect(log.countFor('device_1')).assertEqual(0);
      expect(log.countTransitionsTo(DeviceSessionState.CONNECTING)).assertEqual(0);
    });
    it('summary_should_count_states', 0, async () => {
      const registry = new DeviceSessionRegistry();
      registry.register('device_1', 'SinkA', 0);
      registry.register('device_2', 'SinkB', 1);
      registry.updateState('device_1', DeviceSessionState.CONNECTING);
      registry.updateState('device_1', DeviceSessionState.CONNECTED);
      registry.updateState('device_1', DeviceSessionState.MIRRORING);
      const summary = new DeviceSessionSummary();
      summary.analyze(registry);
      expect(summary.getMirroring()).assertEqual(1);
      expect(summary.getRegistered()).assertEqual(1);
      expect(summary.isIdle()).assertFalse();
    });
    it('summary_should_exclude_disconnected_from_active', 0, async () => {
      const registry = new DeviceSessionRegistry();
      registry.register('device_1', 'SinkA', 0);
      registry.updateState('device_1', DeviceSessionState.DISCONNECTED);
      const summary = new DeviceSessionSummary();
      summary.analyze(registry);
      expect(summary.getDisconnected()).assertEqual(1);
      expect(summary.getActive()).assertEqual(0);
    });
    it('real_device_list_should_respect_tile_limit', 0, async () => {
      const ids: string[] = await getDeviceIdList(driver);
      expect(ids.length).assertLessOrEqual(MAX_MIRROR_TILES);
      expect(ids.length).assertLargerOrEqual(0);
    });
    it('real_player_tiles_should_not_exceed_shared_limit', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const tiles: number = await getPlayerTileCount(driver);
      expect(tiles).assertLessOrEqual(MAX_MIRROR_TILES);
      expect(tiles).assertLargerOrEqual(0);
    });
  });
}




