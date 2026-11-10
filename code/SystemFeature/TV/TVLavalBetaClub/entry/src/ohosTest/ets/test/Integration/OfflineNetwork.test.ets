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
import UrlConstant from '../../../../main/ets/common/Constants/UrlConstant';

const QUEUE_CAPACITY: number = 10;

const MAX_OFFLINE_RETRIES: number = 3;

const CACHE_TTL_MS: number = 30000;

const NETWORK_TYPE_WIFI: string = 'wifi';

const NETWORK_TYPE_CELLULAR: string = 'cellular';

const NETWORK_TYPE_NONE: string = 'none';

interface QueuedRequest {
  id: string;
  endpoint: string;
  enqueuedAt: number;
}

interface CacheEntry {
  key: string;
  payload: string;
  storedAt: number;
}

// Tracks device connectivity and transitions
class ConnectivityState {
  private online: boolean = true;
  private type: string = NETWORK_TYPE_WIFI;
  private transitions: number = 0;

  public setOnline(online: boolean, type: string = NETWORK_TYPE_WIFI): void {
    if (this.online !== online) {
      this.transitions++;
    }
    this.online = online;
    this.type = online ? type : NETWORK_TYPE_NONE;
  }

  public isOnline(): boolean {
    return this.online;
  }

  public getType(): string {
    return this.type;
  }

  public getTransitions(): number {
    return this.transitions;
  }

  public isMetered(): boolean {
    return this.type === NETWORK_TYPE_CELLULAR;
  }

  public canUploadLargeFile(): boolean {
    return this.online && this.type === NETWORK_TYPE_WIFI;
  }

  public reset(): void {
    this.online = true;
    this.type = NETWORK_TYPE_WIFI;
    this.transitions = 0;
  }
}

// Buffers requests created while offline
class OfflineRequestQueue {
  private queue: QueuedRequest[] = [];
  private readonly capacity: number;
  private dropped: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public enqueue(id: string, endpoint: string, now: number): boolean {
    if (id.length === 0 || endpoint.length === 0) {
      return false;
    }
    if (this.queue.length >= this.capacity) {
      this.dropped++;
      return false;
    }
    this.queue.push({ id: id, endpoint: endpoint, enqueuedAt: now });
    return true;
  }

  public size(): number {
    return this.queue.length;
  }

  public getDropped(): number {
    return this.dropped;
  }

  public peek(): QueuedRequest | undefined {
    return this.queue.length === 0 ? undefined : this.queue[0];
  }

  public flush(): QueuedRequest[] {
    const items = [...this.queue];
    this.queue = [];
    return items;
  }

  public flushUntil(now: number, maxAgeMs: number): QueuedRequest[] {
    const items: QueuedRequest[] = [];
    for (let i = 0; i < this.queue.length; i++) {
      if (now - this.queue[i].enqueuedAt <= maxAgeMs) {
        items.push(this.queue[i]);
      } else {
        // Entries older than the allowed age are dropped during the flush.
        this.dropped++;
      }
    }
    this.queue = [];
    return items;
  }

  public clear(): void {
    this.queue = [];
    this.dropped = 0;
  }
}

// Schedules reconnect retries with capped backoff
class RetryScheduler {
  private failures: number = 0;
  private readonly maxRetries: number;

  constructor(maxRetries: number) {
    this.maxRetries = maxRetries;
  }

  public onFailure(): boolean {
    this.failures++;
    return this.failures <= this.maxRetries;
  }

  public onSuccess(): void {
    this.failures = 0;
  }

  public getFailures(): number {
    return this.failures;
  }

  public isExhausted(): boolean {
    return this.failures > this.maxRetries;
  }

  public nextDelayMs(baseMs: number): number {
    if (this.failures <= 0) {
      return 0;
    }
    let delay = baseMs;
    for (let i = 1; i < this.failures; i++) {
      delay = delay * 2;
    }
    return delay;
  }

  public reset(): void {
    this.failures = 0;
  }
}

// Caches issue list responses for offline fallback
class OfflineCache {
  private entries: Map<string, CacheEntry> = new Map<string, CacheEntry>();
  private readonly ttlMs: number;

  constructor(ttlMs: number) {
    this.ttlMs = ttlMs;
  }

  public put(key: string, payload: string, now: number): boolean {
    if (key.length === 0) {
      return false;
    }
    this.entries.set(key, { key: key, payload: payload, storedAt: now });
    return true;
  }

  public get(key: string, now: number): string {
    const entry = this.entries.get(key);
    if (entry === undefined) {
      return '';
    }
    if (now - entry.storedAt > this.ttlMs) {
      this.entries.delete(key);
      return '';
    }
    return entry.payload;
  }

  public has(key: string): boolean {
    return this.entries.has(key);
  }

  public isFresh(key: string, now: number): boolean {
    const entry = this.entries.get(key);
    return entry !== undefined && now - entry.storedAt <= this.ttlMs;
  }

  public invalidate(key: string): boolean {
    return this.entries.delete(key);
  }

  public size(): number {
    return this.entries.size;
  }

  public clear(): void {
    this.entries = new Map<string, CacheEntry>();
  }
}

export default function offlineNetworkTest() {
  describe('OfflineNetwork_Test', () => {

    it('connectivity_should_track_transitions', 0, () => {
      const state = new ConnectivityState();
      expect(state.isOnline()).assertTrue();
      expect(state.getType()).assertEqual(NETWORK_TYPE_WIFI);
      state.setOnline(false);
      expect(state.isOnline()).assertFalse();
      expect(state.getType()).assertEqual(NETWORK_TYPE_NONE);
      expect(state.getTransitions()).assertEqual(1);
      state.setOnline(false);
      expect(state.getTransitions()).assertEqual(1);
      state.setOnline(true, NETWORK_TYPE_CELLULAR);
      expect(state.getTransitions()).assertEqual(2);
    });

    it('connectivity_should_gate_large_uploads', 0, () => {
      const state = new ConnectivityState();
      expect(state.canUploadLargeFile()).assertTrue();
      state.setOnline(true, NETWORK_TYPE_CELLULAR);
      expect(state.isMetered()).assertTrue();
      expect(state.canUploadLargeFile()).assertFalse();
      state.setOnline(false);
      expect(state.canUploadLargeFile()).assertFalse();
      expect(state.isMetered()).assertFalse();
      state.reset();
      expect(state.isOnline()).assertTrue();
      expect(state.getTransitions()).assertEqual(0);
    });

    it('offline_queue_should_buffer_requests', 0, () => {
      const queue = new OfflineRequestQueue(QUEUE_CAPACITY);
      expect(queue.enqueue('req-1', UrlConstant.ISSUE_REPORT, 100)).assertTrue();
      expect(queue.enqueue('req-2', UrlConstant.ISSUE_LIST, 200)).assertTrue();
      expect(queue.size()).assertEqual(2);
      expect(queue.peek() !== undefined).assertTrue();
      expect((queue.peek() as QueuedRequest).id).assertEqual('req-1');
      const flushed = queue.flush();
      expect(flushed.length).assertEqual(2);
      expect(queue.size()).assertEqual(0);
      expect(queue.peek() === undefined).assertTrue();
    });

    it('offline_queue_should_reject_invalid_requests', 0, () => {
      const queue = new OfflineRequestQueue(2);
      expect(queue.enqueue('', UrlConstant.ISSUE_REPORT, 0)).assertFalse();
      expect(queue.enqueue('id', '', 0)).assertFalse();
      expect(queue.size()).assertEqual(0);
      queue.enqueue('a', UrlConstant.ISSUE_REPORT, 0);
      queue.enqueue('b', UrlConstant.ISSUE_LIST, 0);
      expect(queue.enqueue('c', UrlConstant.ISSUE_DETAIL, 0)).assertFalse();
      expect(queue.getDropped()).assertEqual(1);
      expect(queue.size()).assertEqual(2);
    });

    it('offline_queue_should_drop_stale_entries_on_flush', 0, () => {
      const queue = new OfflineRequestQueue(QUEUE_CAPACITY);
      queue.enqueue('fresh', UrlConstant.ISSUE_REPORT, 1800);
      queue.enqueue('stale', UrlConstant.ISSUE_LIST, 100);
      const fresh = queue.flushUntil(2000, 500);
      expect(fresh.length).assertEqual(1);
      expect(fresh[0].id).assertEqual('fresh');
      expect(queue.size()).assertEqual(0);
      expect(queue.peek() === undefined).assertTrue();
      expect(queue.getDropped()).assertEqual(1);
      queue.clear();
      expect(queue.size()).assertEqual(0);
      expect(queue.getDropped()).assertEqual(0);
    });

    it('retry_scheduler_should_bound_attempts', 0, () => {
      const scheduler = new RetryScheduler(MAX_OFFLINE_RETRIES);
      expect(scheduler.onFailure()).assertTrue();
      expect(scheduler.onFailure()).assertTrue();
      expect(scheduler.onFailure()).assertTrue();
      expect(scheduler.onFailure()).assertFalse();
      expect(scheduler.isExhausted()).assertTrue();
      expect(scheduler.getFailures()).assertEqual(4);
      scheduler.reset();
      expect(scheduler.isExhausted()).assertFalse();
      expect(scheduler.getFailures()).assertEqual(0);
    });

    it('retry_scheduler_should_reset_on_success', 0, () => {
      const scheduler = new RetryScheduler(3);
      scheduler.onFailure();
      scheduler.onFailure();
      expect(scheduler.getFailures()).assertEqual(2);
      scheduler.onSuccess();
      expect(scheduler.getFailures()).assertEqual(0);
      expect(scheduler.nextDelayMs(500)).assertEqual(0);
      scheduler.onFailure();
      expect(scheduler.nextDelayMs(500)).assertEqual(500);
    });

    it('retry_scheduler_should_compute_backoff', 0, () => {
      const scheduler = new RetryScheduler(4);
      scheduler.onFailure();
      expect(scheduler.nextDelayMs(500)).assertEqual(500);
      scheduler.onFailure();
      expect(scheduler.nextDelayMs(500)).assertEqual(1000);
      scheduler.onFailure();
      expect(scheduler.nextDelayMs(500)).assertEqual(2000);
      scheduler.onFailure();
      expect(scheduler.nextDelayMs(500)).assertEqual(4000);
    });

    it('offline_cache_should_serve_fresh_values', 0, () => {
      const cache = new OfflineCache(CACHE_TTL_MS);
      expect(cache.put('list', 'cached-list', 1000)).assertTrue();
      expect(cache.get('list', 2000)).assertEqual('cached-list');
      expect(cache.isFresh('list', 2000)).assertTrue();
      expect(cache.has('list')).assertTrue();
      expect(cache.size()).assertEqual(1);
    });

    it('offline_cache_should_expire_values', 0, () => {
      const cache = new OfflineCache(CACHE_TTL_MS);
      cache.put('list', 'cached-list', 1000);
      expect(cache.get('list', 1000 + CACHE_TTL_MS)).assertEqual('cached-list');
      expect(cache.get('list', 1000 + CACHE_TTL_MS + 1)).assertEqual('');
      expect(cache.has('list')).assertFalse();
      expect(cache.isFresh('list', 1000)).assertFalse();
      expect(cache.get('missing', 1000)).assertEqual('');
    });

    it('offline_cache_should_invalidate_and_clear', 0, () => {
      const cache = new OfflineCache(CACHE_TTL_MS);
      cache.put('list', 'list', 0);
      cache.put('detail', 'detail', 0);
      expect(cache.size()).assertEqual(2);
      expect(cache.invalidate('list')).assertTrue();
      expect(cache.invalidate('list')).assertFalse();
      expect(cache.size()).assertEqual(1);
      cache.clear();
      expect(cache.size()).assertEqual(0);
      expect(cache.put('', 'value', 0)).assertFalse();
    });

    it('offline_flow_should_queue_then_flush_on_reconnect', 0, () => {
      const state = new ConnectivityState();
      const queue = new OfflineRequestQueue(QUEUE_CAPACITY);
      const cache = new OfflineCache(CACHE_TTL_MS);
      cache.put('list', 'cached', 0);
      state.setOnline(false);
      expect(state.isOnline()).assertFalse();
      expect(cache.get('list', 100)).assertEqual('cached');
      queue.enqueue('submit-1', UrlConstant.ISSUE_REPORT, 100);
      queue.enqueue('submit-2', UrlConstant.ISSUE_REPORT, 200);
      expect(queue.size()).assertEqual(2);
      state.setOnline(true);
      const flushed = queue.flush();
      expect(flushed.length).assertEqual(2);
      expect(flushed[0].endpoint).assertEqual(UrlConstant.ISSUE_REPORT);
      expect(state.isOnline()).assertTrue();
      expect(state.getTransitions()).assertEqual(2);
    });

    it('offline_constants_should_be_stable', 0, () => {
      expect(QUEUE_CAPACITY).assertEqual(10);
      expect(MAX_OFFLINE_RETRIES).assertEqual(3);
      expect(CACHE_TTL_MS).assertEqual(30000);
      expect(NETWORK_TYPE_NONE).assertEqual('none');
      expect(NETWORK_TYPE_WIFI === NETWORK_TYPE_CELLULAR).assertFalse();
    });
  });
}

