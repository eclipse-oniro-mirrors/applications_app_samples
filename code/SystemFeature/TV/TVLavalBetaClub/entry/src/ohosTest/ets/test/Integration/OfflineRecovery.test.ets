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

const STATE_ONLINE: string = 'online';

const STATE_OFFLINE: string = 'offline';

const STATE_RECOVERING: string = 'recovering';

const MAX_QUEUE: number = 20;

const MAX_RETRIES: number = 3;

const CACHE_TTL_MS: number = 60000;

interface PendingAction {
  id: string;
  operation: string;
  createdAt: number;
  attempts: number;
}

// Recovers pending work after connectivity returns
class OfflineRecoveryManager {
  private state: string = STATE_ONLINE;
  private queue: PendingAction[] = [];
  private readonly capacity: number;
  private replayed: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public goOffline(): boolean {
    if (this.state === STATE_OFFLINE) {
      return false;
    }
    this.state = STATE_OFFLINE;
    return true;
  }

  public beginRecovery(): boolean {
    if (this.state !== STATE_OFFLINE) {
      return false;
    }
    this.state = STATE_RECOVERING;
    return true;
  }

  public completeRecovery(): boolean {
    if (this.state !== STATE_RECOVERING) {
      return false;
    }
    this.state = STATE_ONLINE;
    return true;
  }

  public getState(): string {
    return this.state;
  }

  public isOffline(): boolean {
    return this.state === STATE_OFFLINE;
  }

  public enqueue(id: string, operation: string, now: number): boolean {
    if (id.length === 0 || operation.length === 0 || this.queue.length >= this.capacity) {
      return false;
    }
    if (this.has(id)) {
      return false;
    }
    this.queue.push({ id: id, operation: operation, createdAt: now, attempts: 0 });
    return true;
  }

  public has(id: string): boolean {
    return this.queue.some((action: PendingAction) => action.id === id);
  }

  public pendingCount(): number {
    return this.queue.length;
  }

  public replay(handler: (action: PendingAction) => boolean): number {
    if (this.state !== STATE_RECOVERING) {
      return 0;
    }
    const remaining: PendingAction[] = [];
    let replayed: number = 0;
    for (let i = 0; i < this.queue.length; i++) {
      const action = this.queue[i];
      action.attempts++;
      if (handler(action)) {
        replayed++;
        this.replayed++;
      } else if (action.attempts < MAX_RETRIES) {
        remaining.push(action);
      }
    }
    this.queue = remaining;
    return replayed;
  }

  public dropStale(now: number, ttlMs: number): number {
    const keep: PendingAction[] = [];
    let dropped: number = 0;
    for (let i = 0; i < this.queue.length; i++) {
      if (now - this.queue[i].createdAt > ttlMs) {
        dropped++;
      } else {
        keep.push(this.queue[i]);
      }
    }
    this.queue = keep;
    return dropped;
  }

  public getReplayed(): number {
    return this.replayed;
  }

  public reset(): void {
    this.state = STATE_ONLINE;
    this.queue = [];
    this.replayed = 0;
  }
}

// Caches read results for offline fallback
class OfflineReadCache {
  private entries: Map<string, string> = new Map<string, string>();
  private timestamps: Map<string, number> = new Map<string, number>();

  public put(key: string, value: string, now: number): boolean {
    if (key.length === 0) {
      return false;
    }
    this.entries.set(key, value);
    this.timestamps.set(key, now);
    return true;
  }

  public get(key: string, now: number): string {
    const value = this.entries.get(key);
    const timestamp = this.timestamps.get(key);
    if (value === undefined || timestamp === undefined) {
      return '';
    }
    if (now - timestamp > CACHE_TTL_MS) {
      this.entries.delete(key);
      this.timestamps.delete(key);
      return '';
    }
    return value;
  }

  public size(): number {
    return this.entries.size;
  }

  public invalidate(key: string): boolean {
    const removed = this.entries.delete(key);
    this.timestamps.delete(key);
    return removed;
  }

  public clear(): void {
    this.entries = new Map<string, string>();
    this.timestamps = new Map<string, number>();
  }
}

// Aggregates recovery checks
class RecoveryReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function offlineRecoveryTest() {
  describe('OfflineRecovery_Test', () => {

    it('manager_should_switch_offline', 0, () => {
      const manager = new OfflineRecoveryManager(MAX_QUEUE);
      expect(manager.getState()).assertEqual(STATE_ONLINE);
      expect(manager.isOffline()).assertFalse();
      expect(manager.goOffline()).assertTrue();
      expect(manager.isOffline()).assertTrue();
      expect(manager.goOffline()).assertFalse();
    });

    it('manager_should_recover_online', 0, () => {
      const manager = new OfflineRecoveryManager(MAX_QUEUE);
      expect(manager.beginRecovery()).assertFalse();
      manager.goOffline();
      expect(manager.beginRecovery()).assertTrue();
      expect(manager.getState()).assertEqual(STATE_RECOVERING);
      expect(manager.completeRecovery()).assertTrue();
      expect(manager.getState()).assertEqual(STATE_ONLINE);
      expect(manager.completeRecovery()).assertFalse();
    });

    it('manager_should_enqueue_pending_actions', 0, () => {
      const manager = new OfflineRecoveryManager(MAX_QUEUE);
      manager.goOffline();
      expect(manager.enqueue('a1', 'submit', 100)).assertTrue();
      expect(manager.enqueue('a1', 'submit', 200)).assertFalse();
      expect(manager.enqueue('', 'submit', 100)).assertFalse();
      expect(manager.enqueue('a2', '', 100)).assertFalse();
      expect(manager.pendingCount()).assertEqual(1);
      expect(manager.has('a1')).assertTrue();
    });

    it('manager_should_enforce_queue_capacity', 0, () => {
      const manager = new OfflineRecoveryManager(2);
      manager.goOffline();
      expect(manager.enqueue('a', 'submit', 0)).assertTrue();
      expect(manager.enqueue('b', 'upload', 0)).assertTrue();
      expect(manager.enqueue('c', 'view', 0)).assertFalse();
      expect(manager.pendingCount()).assertEqual(2);
    });

    it('manager_should_replay_successfully', 0, () => {
      const manager = new OfflineRecoveryManager(MAX_QUEUE);
      manager.goOffline();
      manager.enqueue('a', 'submit', 100);
      manager.enqueue('b', 'upload', 200);
      expect(manager.replay(() => true)).assertEqual(0);
      manager.beginRecovery();
      expect(manager.replay(() => true)).assertEqual(2);
      expect(manager.pendingCount()).assertEqual(0);
      expect(manager.getReplayed()).assertEqual(2);
    });

    it('manager_should_retry_failed_actions', 0, () => {
      const manager = new OfflineRecoveryManager(MAX_QUEUE);
      manager.goOffline();
      manager.enqueue('a', 'submit', 0);
      manager.beginRecovery();
      expect(manager.replay(() => false)).assertEqual(0);
      expect(manager.pendingCount()).assertEqual(1);
      expect(manager.replay(() => false)).assertEqual(0);
      expect(manager.pendingCount()).assertEqual(1);
      expect(manager.replay(() => false)).assertEqual(0);
      expect(manager.pendingCount()).assertEqual(0);
      expect(manager.getReplayed()).assertEqual(0);
    });

    it('manager_should_drop_stale_actions', 0, () => {
      const manager = new OfflineRecoveryManager(MAX_QUEUE);
      manager.goOffline();
      manager.enqueue('old', 'submit', 0);
      manager.enqueue('fresh', 'submit', CACHE_TTL_MS);
      expect(manager.dropStale(CACHE_TTL_MS + 1, CACHE_TTL_MS)).assertEqual(1);
      expect(manager.pendingCount()).assertEqual(1);
      expect(manager.has('fresh')).assertTrue();
      expect(manager.has('old')).assertFalse();
    });

    it('manager_should_reset_state', 0, () => {
      const manager = new OfflineRecoveryManager(MAX_QUEUE);
      manager.goOffline();
      manager.enqueue('a', 'submit', 0);
      manager.beginRecovery();
      manager.replay(() => true);
      manager.reset();
      expect(manager.getState()).assertEqual(STATE_ONLINE);
      expect(manager.pendingCount()).assertEqual(0);
      expect(manager.getReplayed()).assertEqual(0);
    });

    it('cache_should_store_fresh_values', 0, () => {
      const cache = new OfflineReadCache();
      expect(cache.put('list', 'cached', 1000)).assertTrue();
      expect(cache.get('list', 2000)).assertEqual('cached');
      expect(cache.size()).assertEqual(1);
      expect(cache.get('missing', 2000)).assertEqual('');
      expect(cache.put('', 'x', 0)).assertFalse();
    });

    it('cache_should_expire_values', 0, () => {
      const cache = new OfflineReadCache();
      cache.put('list', 'cached', 0);
      expect(cache.get('list', CACHE_TTL_MS)).assertEqual('cached');
      expect(cache.get('list', CACHE_TTL_MS + 1)).assertEqual('');
      expect(cache.size()).assertEqual(0);
    });

    it('cache_should_invalidate', 0, () => {
      const cache = new OfflineReadCache();
      cache.put('a', '1', 0);
      cache.put('b', '2', 0);
      expect(cache.invalidate('a')).assertTrue();
      expect(cache.invalidate('a')).assertFalse();
      expect(cache.size()).assertEqual(1);
      cache.clear();
      expect(cache.size()).assertEqual(0);
    });

    it('report_should_aggregate_recovery_checks', 0, () => {
      const report = new RecoveryReport();
      report.check('queue', true);
      report.check('replay', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('stale', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['stale']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('offline_flow_should_replay_after_reconnect', 0, () => {
      const manager = new OfflineRecoveryManager(MAX_QUEUE);
      const cache = new OfflineReadCache();
      const report = new RecoveryReport();
      cache.put('list', 'cached-list', 0);
      manager.goOffline();
      manager.enqueue('submit', 'submit', 100);
      report.check('offlineCache', cache.get('list', 1000) === 'cached-list');
      manager.beginRecovery();
      expect(manager.replay(() => true)).assertEqual(1);
      manager.completeRecovery();
      report.check('online', manager.getState() === STATE_ONLINE);
      report.check('replayed', manager.getReplayed() === 1);
      expect(report.isPassed()).assertTrue();
      expect(manager.pendingCount()).assertEqual(0);
    });

    it('offline_constants_should_be_stable', 0, () => {
      expect(STATE_ONLINE).assertEqual('online');
      expect(STATE_OFFLINE).assertEqual('offline');
      expect(STATE_RECOVERING).assertEqual('recovering');
      expect(MAX_QUEUE).assertEqual(20);
      expect(MAX_RETRIES).assertEqual(3);
      expect(CACHE_TTL_MS).assertEqual(60000);
    });
  });
}

