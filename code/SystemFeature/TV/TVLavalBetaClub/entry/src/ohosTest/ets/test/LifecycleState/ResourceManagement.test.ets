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

const TYPE_PIXELMAP: string = 'pixelMap';

const TYPE_FILE: string = 'file';

const TYPE_TIMER: string = 'timer';

const TYPE_CALLBACK: string = 'callback';

const MAX_POOL_SIZE: number = 32;

const MAX_CACHE_BYTES: number = 50 * 1024 * 1024;

const MAX_RESOURCE_AGE_MS: number = 60000;

interface ResourceHandle {
  id: string;
  type: string;
  refCount: number;
  acquiredAt: number;
  sizeBytes: number;
}

interface ResourceReportEntry {
  type: string;
  count: number;
  bytes: number;
}

// Reference-counted pool for runtime resources
class ResourcePool {
  private handles: Map<string, ResourceHandle> = new Map<string, ResourceHandle>();
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public acquire(id: string, type: string, now: number, sizeBytes: number = 0): boolean {
    if (id.length === 0) {
      return false;
    }
    const existing = this.handles.get(id);
    if (existing !== undefined) {
      existing.refCount++;
      return true;
    }
    if (this.handles.size >= this.capacity) {
      return false;
    }
    this.handles.set(id, {
      id: id,
      type: type,
      refCount: 1,
      acquiredAt: now,
      sizeBytes: sizeBytes
    });
    return true;
  }

  public release(id: string): boolean {
    const handle = this.handles.get(id);
    if (handle === undefined) {
      return false;
    }
    handle.refCount--;
    if (handle.refCount <= 0) {
      this.handles.delete(id);
    }
    return true;
  }

  public refCountOf(id: string): number {
    const handle = this.handles.get(id);
    return handle === undefined ? 0 : handle.refCount;
  }

  public contains(id: string): boolean {
    return this.handles.has(id);
  }

  public size(): number {
    return this.handles.size;
  }

  public typeCount(type: string): number {
    let count: number = 0;
    this.handles.forEach((handle: ResourceHandle) => {
      if (handle.type === type) {
        count++;
      }
    });
    return count;
  }

  public totalBytes(): number {
    let total: number = 0;
    this.handles.forEach((handle: ResourceHandle) => {
      total += handle.sizeBytes * handle.refCount;
    });
    return total;
  }

  public expired(now: number, maxAgeMs: number): string[] {
    const result: string[] = [];
    this.handles.forEach((handle: ResourceHandle) => {
      if (now - handle.acquiredAt > maxAgeMs) {
        result.push(handle.id);
      }
    });
    return result;
  }

  public releaseAll(): number {
    const count = this.handles.size;
    this.handles = new Map<string, ResourceHandle>();
    return count;
  }

  public report(): ResourceReportEntry[] {
    const grouped: Map<string, ResourceReportEntry> = new Map<string, ResourceReportEntry>();
    this.handles.forEach((handle: ResourceHandle) => {
      const entry = grouped.get(handle.type);
      if (entry === undefined) {
        grouped.set(handle.type, {
          type: handle.type,
          count: 1,
          bytes: handle.sizeBytes * handle.refCount
        });
      } else {
        entry.count++;
        entry.bytes += handle.sizeBytes * handle.refCount;
      }
    });
    const result: ResourceReportEntry[] = [];
    grouped.forEach((entry: ResourceReportEntry) => {
      result.push(entry);
    });
    return result;
  }
}

// Enforces memory budgets for caches
class ResourceBudget {
  private readonly limitBytes: number;
  private usedBytes: number = 0;

  constructor(limitBytes: number) {
    this.limitBytes = limitBytes;
  }

  public tryReserve(bytes: number): boolean {
    if (bytes < 0 || this.usedBytes + bytes > this.limitBytes) {
      return false;
    }
    this.usedBytes += bytes;
    return true;
  }

  public release(bytes: number): void {
    this.usedBytes -= bytes;
    if (this.usedBytes < 0) {
      this.usedBytes = 0;
    }
  }

  public getUsed(): number {
    return this.usedBytes;
  }

  public getLimit(): number {
    return this.limitBytes;
  }

  public remaining(): number {
    return this.limitBytes - this.usedBytes;
  }

  public usagePercent(): number {
    return this.limitBytes <= 0 ? 0 : this.usedBytes * 100 / this.limitBytes;
  }

  public isFull(): boolean {
    return this.usedBytes >= this.limitBytes;
  }

  public reset(): void {
    this.usedBytes = 0;
  }
}

// Sweeps expired resources and reports leak candidates
class ResourceSweeper {
  private swept: number = 0;

  public sweep(pool: ResourcePool, now: number, maxAgeMs: number): number {
    const expired = pool.expired(now, maxAgeMs);
    for (let i = 0; i < expired.length; i++) {
      pool.release(expired[i]);
      this.swept++;
    }
    return expired.length;
  }

  public getSwept(): number {
    return this.swept;
  }

  public reset(): void {
    this.swept = 0;
  }
}

export default function resourceManagementTest() {
  describe('ResourceManagement_Test', () => {

    it('pool_should_acquire_and_release', 0, () => {
      const pool = new ResourcePool(MAX_POOL_SIZE);
      expect(pool.acquire('pm-1', TYPE_PIXELMAP, 100)).assertTrue();
      expect(pool.contains('pm-1')).assertTrue();
      expect(pool.size()).assertEqual(1);
      expect(pool.refCountOf('pm-1')).assertEqual(1);
      expect(pool.release('pm-1')).assertTrue();
      expect(pool.contains('pm-1')).assertFalse();
      expect(pool.refCountOf('pm-1')).assertEqual(0);
    });

    it('pool_should_reference_count', 0, () => {
      const pool = new ResourcePool(MAX_POOL_SIZE);
      expect(pool.acquire('file-1', TYPE_FILE, 100)).assertTrue();
      expect(pool.acquire('file-1', TYPE_FILE, 200)).assertTrue();
      expect(pool.refCountOf('file-1')).assertEqual(2);
      expect(pool.size()).assertEqual(1);
      expect(pool.release('file-1')).assertTrue();
      expect(pool.refCountOf('file-1')).assertEqual(1);
      expect(pool.contains('file-1')).assertTrue();
      expect(pool.release('file-1')).assertTrue();
      expect(pool.contains('file-1')).assertFalse();
      expect(pool.release('file-1')).assertFalse();
    });

    it('pool_should_reject_invalid_and_overflow', 0, () => {
      const pool = new ResourcePool(2);
      expect(pool.acquire('', TYPE_FILE, 0)).assertFalse();
      expect(pool.acquire('a', TYPE_FILE, 0)).assertTrue();
      expect(pool.acquire('b', TYPE_FILE, 0)).assertTrue();
      expect(pool.acquire('c', TYPE_FILE, 0)).assertFalse();
      expect(pool.size()).assertEqual(2);
      expect(pool.acquire('a', TYPE_FILE, 0)).assertTrue();
      expect(pool.refCountOf('a')).assertEqual(2);
    });

    it('pool_should_count_types_and_bytes', 0, () => {
      const pool = new ResourcePool(MAX_POOL_SIZE);
      pool.acquire('pm-1', TYPE_PIXELMAP, 0, 1024);
      pool.acquire('pm-1', TYPE_PIXELMAP, 0, 1024);
      pool.acquire('t-1', TYPE_TIMER, 0, 0);
      pool.acquire('f-1', TYPE_FILE, 0, 2048);
      expect(pool.typeCount(TYPE_PIXELMAP)).assertEqual(1);
      expect(pool.typeCount(TYPE_FILE)).assertEqual(1);
      expect(pool.typeCount(TYPE_CALLBACK)).assertEqual(0);
      expect(pool.totalBytes()).assertEqual(4096);
      const report = pool.report();
      expect(report.length).assertEqual(3);
    });

    it('pool_should_report_expired_resources', 0, () => {
      const pool = new ResourcePool(MAX_POOL_SIZE);
      pool.acquire('old', TYPE_FILE, 0);
      pool.acquire('fresh', TYPE_FILE, 5000);
      const expired = pool.expired(61000, MAX_RESOURCE_AGE_MS);
      expect(expired.length).assertEqual(1);
      expect(expired[0]).assertEqual('old');
      expect(pool.expired(1000, MAX_RESOURCE_AGE_MS).length).assertEqual(0);
      expect(pool.releaseAll()).assertEqual(2);
      expect(pool.size()).assertEqual(0);
    });

    it('sweeper_should_release_expired_resources', 0, () => {
      const pool = new ResourcePool(MAX_POOL_SIZE);
      const sweeper = new ResourceSweeper();
      pool.acquire('old', TYPE_FILE, 0);
      pool.acquire('fresh', TYPE_FILE, 5000);
      expect(sweeper.sweep(pool, 10000, 1000)).assertEqual(2);
      expect(pool.size()).assertEqual(0);
      expect(sweeper.getSwept()).assertEqual(2);
      sweeper.reset();
      expect(sweeper.getSwept()).assertEqual(0);
    });

    it('sweeper_should_keep_referenced_resources', 0, () => {
      const pool = new ResourcePool(MAX_POOL_SIZE);
      const sweeper = new ResourceSweeper();
      pool.acquire('shared', TYPE_PIXELMAP, 0);
      pool.acquire('shared', TYPE_PIXELMAP, 0);
      sweeper.sweep(pool, 10000, 1000);
      expect(pool.refCountOf('shared')).assertEqual(1);
      expect(pool.contains('shared')).assertTrue();
      expect(sweeper.getSwept()).assertEqual(1);
    });

    it('budget_should_reserve_and_release', 0, () => {
      const budget = new ResourceBudget(MAX_CACHE_BYTES);
      expect(budget.getLimit()).assertEqual(MAX_CACHE_BYTES);
      expect(budget.tryReserve(1024)).assertTrue();
      expect(budget.getUsed()).assertEqual(1024);
      expect(budget.remaining()).assertEqual(MAX_CACHE_BYTES - 1024);
      budget.release(512);
      expect(budget.getUsed()).assertEqual(512);
      budget.release(999999);
      expect(budget.getUsed()).assertEqual(0);
    });

    it('budget_should_reject_over_limit', 0, () => {
      const budget = new ResourceBudget(100);
      expect(budget.tryReserve(60)).assertTrue();
      expect(budget.tryReserve(50)).assertFalse();
      expect(budget.tryReserve(40)).assertTrue();
      expect(budget.isFull()).assertTrue();
      expect(budget.usagePercent()).assertEqual(100);
      expect(budget.tryReserve(-1)).assertFalse();
      budget.reset();
      expect(budget.getUsed()).assertEqual(0);
    });

    it('budget_should_track_usage_percent', 0, () => {
      const budget = new ResourceBudget(1000);
      budget.tryReserve(250);
      expect(budget.usagePercent()).assertEqual(25);
      budget.tryReserve(250);
      expect(budget.usagePercent()).assertEqual(50);
      expect(budget.isFull()).assertFalse();
      const empty = new ResourceBudget(0);
      expect(empty.usagePercent()).assertEqual(0);
      expect(empty.tryReserve(1)).assertFalse();
    });

    it('resource_flow_should_release_all', 0, () => {
      const pool = new ResourcePool(MAX_POOL_SIZE);
      const budget = new ResourceBudget(MAX_CACHE_BYTES);
      const sweeper = new ResourceSweeper();
      const types: string[] = [TYPE_PIXELMAP, TYPE_FILE, TYPE_CALLBACK];
      for (let i = 0; i < types.length; i++) {
        pool.acquire(`res-${i}`, types[i], i * 1000, 1024);
        budget.tryReserve(1024);
      }
      expect(pool.size()).assertEqual(3);
      expect(budget.getUsed()).assertEqual(3072);
      expect(sweeper.sweep(pool, 10000, 5000)).assertEqual(3);
      expect(pool.size()).assertEqual(0);
      expect(pool.releaseAll()).assertEqual(0);
      expect(pool.size()).assertEqual(0);
      budget.reset();
      expect(budget.getUsed()).assertEqual(0);
    });

    it('resource_constants_should_be_stable', 0, () => {
      expect(TYPE_PIXELMAP).assertEqual('pixelMap');
      expect(TYPE_FILE).assertEqual('file');
      expect(TYPE_TIMER).assertEqual('timer');
      expect(TYPE_CALLBACK).assertEqual('callback');
      expect(MAX_POOL_SIZE).assertEqual(32);
      expect(MAX_CACHE_BYTES).assertEqual(52428800);
      expect(MAX_RESOURCE_AGE_MS).assertEqual(60000);
    });

    it('pool_report_should_merge_same_type', 0, () => {
      const pool = new ResourcePool(MAX_POOL_SIZE);
      pool.acquire('a', TYPE_FILE, 0, 100);
      pool.acquire('b', TYPE_FILE, 0, 200);
      const report = pool.report();
      expect(report.length).assertEqual(1);
      expect(report[0].type).assertEqual(TYPE_FILE);
      expect(report[0].count).assertEqual(2);
      expect(report[0].bytes).assertEqual(300);
    });
  });
}

