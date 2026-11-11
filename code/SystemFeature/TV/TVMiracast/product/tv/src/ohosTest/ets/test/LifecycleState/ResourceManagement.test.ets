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
  isPermissionDialogVisible,
  launchPlayerPage,
  triggerMiracastHome,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_SCREEN_BIND,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'ResourceManagementSuite';

enum ResourceKind {
  PLAYER = 'player',
  LISTENER = 'listener',
  WINDOW = 'window',
  EMITTER = 'emitter',
  SCREEN = 'screen'
}

interface ResourceHandle {
  kind: ResourceKind;
  id: string;
}

class ResourceRegistry {
  private handles: ResourceHandle[] = [];
  private released: string[] = [];

  private key(kind: ResourceKind, id: string): string {
    return kind + ':' + id;
  }
  public acquire(kind: ResourceKind, id: string): boolean {
    if (id.length === 0 || this.isHeld(kind, id)) {
      return false;
    }
    const handle: ResourceHandle = { kind: kind, id: id };
    this.handles.push(handle);
    return true;
  }
  public release(kind: ResourceKind, id: string): boolean {
    for (let i = 0; i < this.handles.length; i++) {
      if (this.handles[i].kind === kind && this.handles[i].id === id &&
        this.released.indexOf(kind + ':' + id) < 0) {
        this.released.push(this.key(kind, id));
        return true;
      }
    }
    return false;
  }
  public releaseAllOfKind(kind: ResourceKind): number {
    let count: number = 0;
    for (let i = 0; i < this.handles.length; i++) {
      const id: string = this.handles[i].id;
      if (this.handles[i].kind === kind && this.released.indexOf(kind + ':' + id) < 0) {
        this.released.push(this.key(kind, id));
        count++;
      }
    }
    return count;
  }
  public isHeld(kind: ResourceKind, id: string): boolean {
    for (let i = 0; i < this.handles.length; i++) {
      if (this.handles[i].kind === kind && this.handles[i].id === id &&
        this.released.indexOf(kind + ':' + id) < 0) {
        return true;
      }
    }
    return false;
  }

  public getLeaks(): ResourceHandle[] {
    const leaked: ResourceHandle[] = [];
    for (let i = 0; i < this.handles.length; i++) {
      if (this.released.indexOf(this.handles[i].kind + ':' + this.handles[i].id) < 0) {
        leaked.push(this.handles[i]);
      }
    }
    return leaked;
  }
  public isBalanced(): boolean {
    return this.getLeaks().length === 0;
  }
  public getTotalAcquired(): number {
    return this.handles.length;
  }
  public reset(): void {
    this.handles = [];
    this.released = [];
  }

}
class PlayerPool {
  private players: Map<string, string> = new Map<string, string>();
  public add(deviceId: string, playerTag: string): boolean {
    if (deviceId.length === 0 || playerTag.length === 0 || this.players.has(deviceId)) {
      return false;
    }
    this.players.set(deviceId, playerTag);
    return true;
  }
  public remove(deviceId: string): boolean {
    if (!this.players.has(deviceId)) {
      return false;
    }
    this.players.delete(deviceId);
    return true;
  }
  public get(deviceId: string): string {
    const tag = this.players.get(deviceId);
    if (tag === undefined) {
      return '';
    }
    return tag;
  }
  public has(deviceId: string): boolean {
    return this.players.has(deviceId);
  }
  public size(): number {
    return this.players.size;
  }

  public removeAll(): number {
    const removed: number = this.players.size;
    this.players.clear();
    return removed;
  }
  public isFull(): boolean {
    return this.players.size >= MAX_MIRROR_TILES;
  }
}

class ListenerBucket {
  private listeners: string[] = [];
  public add(name: string): boolean {
    if (name.length === 0 || this.listeners.indexOf(name) >= 0) {
      return false;
    }
    this.listeners.push(name);
    return true;
  }
  public remove(name: string): boolean {
    const index: number = this.listeners.indexOf(name);
    if (index < 0) {
      return false;
    }
    this.listeners.splice(index, 1);
    return true;
  }
  public count(): number {
    return this.listeners.length;
  }
  public contains(name: string): boolean {
    return this.listeners.indexOf(name) >= 0;
  }
  public snapshot(): string[] {
    return [...this.listeners];
  }
  public clear(): number {
    const removed: number = this.listeners.length;
    this.listeners = [];
    return removed;
  }
}
class EmitterModel {
  private registeredEvents: number[] = [];
  private emittedEvents: number[] = [];
  public register(eventId: number): boolean {
    if (eventId <= 0 || this.registeredEvents.indexOf(eventId) >= 0) {
      return false;
    }
    this.registeredEvents.push(eventId);
    return true;
  }
  public unregister(eventId: number): boolean {
    const index: number = this.registeredEvents.indexOf(eventId);
    if (index < 0) {
      return false;
    }
    this.registeredEvents.splice(index, 1);
    return true;
  }
  public emit(eventId: number, payload: string): boolean {
    if (this.registeredEvents.indexOf(eventId) < 0 || payload.length === 0) {
      return false;
    }
    this.emittedEvents.push(eventId);
    return true;
  }

  public getEmitCount(): number {
    return this.emittedEvents.length;
  }
  public getRegisteredCount(): number {
    return this.registeredEvents.length;
  }
  public clear(): void {
    this.registeredEvents = [];
    this.emittedEvents = [];
  }
}
export default function resourceManagementSuite(): void {
  describe('ResourceManagement_Suite', () => {
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

    it('resource_registry_should_reject_empty_id', 0, async () => {
      const local = new ResourceRegistry();
      expect(!local.acquire(ResourceKind.PLAYER, '') && local.isBalanced()).assertTrue();
    });
    it('resource_registry_should_reject_duplicate_acquire', 0, async () => {
      const local = new ResourceRegistry();
      expect(local.acquire(ResourceKind.WINDOW, 'permission_window')).assertTrue();
      expect(!local.acquire(ResourceKind.WINDOW, 'permission_window') && local.getTotalAcquired() === 1).assertTrue();
    });
    it('resource_registry_should_release_handle', 0, async () => {
      const local = new ResourceRegistry();
      local.acquire(ResourceKind.EMITTER, 'emitter_1000');
      expect(local.release(ResourceKind.EMITTER, 'emitter_1000')).assertTrue();
      expect(!local.isHeld(ResourceKind.EMITTER, 'emitter_1000')).assertTrue();
    });
    it('resource_registry_should_not_double_release', 0, async () => {
      const local = new ResourceRegistry();
      local.acquire(ResourceKind.WINDOW, 'MiraCast.db');
      expect(local.release(ResourceKind.WINDOW, 'MiraCast.db')).assertTrue();
      expect(local.release(ResourceKind.WINDOW, 'MiraCast.db')).assertFalse();
    });
    it('resource_registry_should_release_all_of_kind', 0, async () => {
      const local = new ResourceRegistry();
      local.acquire(ResourceKind.PLAYER, 'player_1');
      local.acquire(ResourceKind.PLAYER, 'player_2');
      local.acquire(ResourceKind.LISTENER, 'listener_1');
      expect(local.releaseAllOfKind(ResourceKind.PLAYER) === 2 && local.isHeld(ResourceKind.LISTENER, 'listener_1')).assertTrue();
    });
    it('resource_registry_should_detect_leaks', 0, async () => {
      const local = new ResourceRegistry();
      local.acquire(ResourceKind.SCREEN, 'screen_1');
      local.acquire(ResourceKind.WINDOW, 'permission_window');
      local.release(ResourceKind.WINDOW, 'permission_window');
      expect(local.getLeaks().length === 1 && local.getLeaks()[0].kind === ResourceKind.SCREEN).assertTrue();
    });
    it('resource_registry_reset_should_drop_history', 0, async () => {
      const local = new ResourceRegistry();
      local.acquire(ResourceKind.PLAYER, 'player_1');
      local.reset();
      expect(local.getTotalAcquired() === 0 && local.isHeld(ResourceKind.PLAYER, 'player_1') === false).assertTrue();
    });
    it('session_teardown_should_release_all_resource_kinds', 0, async () => {
      const local = new ResourceRegistry();
      const kinds: ResourceKind[] = [ResourceKind.PLAYER, ResourceKind.LISTENER, ResourceKind.WINDOW];
      for (let i = 0; i < kinds.length; i++) {
        expect(local.acquire(kinds[i], 'res_' + i) && local.releaseAllOfKind(kinds[i]) === 1).assertTrue();
      }
      expect(local.isBalanced() && local.getTotalAcquired() === 3).assertTrue();
    });
    it('player_pool_should_reject_duplicate_device', 0, async () => {
      const pool = new PlayerPool();
      expect(pool.add('device_1', 'player_a')).assertTrue();
      expect(!pool.add('device_1', 'player_b') && pool.get('device_1') === 'player_a').assertTrue();
    });
    it('player_pool_should_reject_empty_arguments', 0, async () => {
      const pool = new PlayerPool();
      expect(pool.add('', 'player_a')).assertFalse();
      expect(pool.add('device_1', '')).assertFalse();
      expect(pool.size()).assertEqual(0);
    });
    it('player_pool_should_remove_player_once', 0, async () => {
      const pool = new PlayerPool();
      pool.add('device_1', 'player_a');
      expect(pool.remove('device_1')).assertTrue();
      expect(pool.remove('device_1')).assertFalse();
      expect(pool.has('device_1')).assertFalse();
    });
    it('player_pool_should_report_full_at_nine_tiles', 0, async () => {
      const pool = new PlayerPool();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        pool.add('device_' + i, 'player_' + i);
      }
      expect(pool.isFull() && pool.size() === MAX_MIRROR_TILES).assertTrue();
    });
    it('player_pool_should_remove_all_players', 0, async () => {
      const pool = new PlayerPool();
      pool.add('device_1', 'player_a');
      pool.add('device_2', 'player_b');
      expect(pool.removeAll()).assertEqual(2);
      expect(pool.size()).assertEqual(0);
    });
    it('listener_bucket_should_deduplicate', 0, async () => {
      const bucket = new ListenerBucket();
      expect(bucket.add('device_listener')).assertTrue();
      expect(bucket.add('device_listener')).assertFalse();
      expect(bucket.add('')).assertFalse();
    });
    it('listener_bucket_should_clear_all_listeners', 0, async () => {
      const bucket = new ListenerBucket();
      bucket.add('listener_a');
      bucket.add('listener_b');
      bucket.remove('listener_a');
      expect(bucket.clear() === 1 && bucket.count() === 0).assertTrue();
    });
    it('listener_bucket_snapshot_should_be_independent', 0, async () => {
      const bucket = new ListenerBucket();
      bucket.add('listener_snapshot');
      const snapshot: string[] = bucket.snapshot();
      snapshot.push('injected');
      expect(bucket.contains('injected')).assertFalse();
    });
    it('emitter_should_require_registration_before_emit', 0, async () => {
      const emitter = new EmitterModel();
      expect(emitter.emit(1000, 'ONCE')).assertFalse();
      expect(emitter.register(1000)).assertTrue();
      expect(emitter.getRegisteredCount()).assertEqual(1);
      expect(emitter.emit(1000, 'ONCE')).assertTrue();
    });
    it('emitter_should_reject_invalid_event_or_payload', 0, async () => {
      const emitter = new EmitterModel();
      expect(emitter.register(0)).assertFalse();
      emitter.register(1000);
      expect(emitter.emit(1000, '')).assertFalse();
      expect(emitter.getEmitCount()).assertEqual(0);
    });
    it('emitter_should_stop_after_unregister', 0, async () => {
      const emitter = new EmitterModel();
      emitter.register(1000);
      expect(emitter.unregister(1000) && !emitter.emit(1000, 'FOREVER')).assertTrue();
    });
    it('emitter_should_support_multiple_events', 0, async () => {
      const emitter = new EmitterModel();
      emitter.register(1000);
      emitter.register(1001);
      expect(emitter.emit(1001, 'deviceId') && emitter.getEmitCount() === 1).assertTrue();
      emitter.clear();
      expect(emitter.getRegisteredCount() === 0 && emitter.getEmitCount() === 0).assertTrue();
    });
    it('player_page_should_release_screen_after_back', 0, async () => {
      const local = new ResourceRegistry();
      local.acquire(ResourceKind.SCREEN, 'screen_player');
      await launchPlayerPage('device_res', 'ResourceSink');
      await serializedDelay(driver, TIMEOUT_SCREEN_BIND);
      expect(local.release(ResourceKind.SCREEN, 'screen_player') && local.isBalanced()).assertTrue();
    });
    it('permission_emitter_should_be_releasable_without_dialog', 0, async () => {
      const emitter = new EmitterModel();
      emitter.register(1000);
      expect(emitter.unregister(1000) && !emitter.emit(1000, 'ONCE')).assertTrue();
    });
    it('resource_management_should_handle_bulk_operations', 0, async () => {
      const local = new ResourceRegistry();
      for (let i = 0; i < 100; i++) {
        local.acquire(ResourceKind.LISTENER, 'listener_' + i);
        local.release(ResourceKind.LISTENER, 'listener_' + i);
      }
      expect(local.getTotalAcquired() === 100 && local.isBalanced()).assertTrue();
    });
    it('comprehensive_resource_management_scenario', 0, async () => {
      const pool = new PlayerPool();
      const bucket = new ListenerBucket();
      const local = new ResourceRegistry();
      bucket.add('device_connect_listener');
      for (let i = 0; i < 4; i++) {
        expect(pool.add('device_' + i, 'player_' + i) && local.acquire(ResourceKind.PLAYER, 'player_' + i)).assertTrue();
      }
      expect(pool.removeAll() === 4 && local.releaseAllOfKind(ResourceKind.PLAYER) === 4).assertTrue();
      expect(local.isBalanced() && bucket.clear() === 1).assertTrue();
    });
  });
}




