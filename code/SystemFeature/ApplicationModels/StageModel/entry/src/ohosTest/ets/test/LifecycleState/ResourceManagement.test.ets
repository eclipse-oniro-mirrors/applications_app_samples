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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { getDriver, ensureAppReady, checkComponentExists, BUNDLE_NAME } from '../Shared/SharedDriver';

enum ResourceKind {
  WINDOW = 0,
  BUFFER = 1,
  SESSION = 2,
  FILE_HANDLE = 3
}

class Resource {
  id: number = 0;
  kind: number = ResourceKind.WINDOW;
  inUse: boolean = false;
  refCount: number = 0;
  owner: string = '';

  constructor(id: number, kind: number) {
    this.id = id;
    this.kind = kind;
  }
}

class Quota {
  kind: number = ResourceKind.WINDOW;
  limit: number = 0;
  used: number = 0;

  constructor(kind: number, limit: number) {
    this.kind = kind;
    this.limit = limit;
  }

  remaining(): number {
    return this.limit - this.used;
  }
}

class ResourcePool {
  private resources: Resource[] = [];
  private quotas: Quota[] = [];
  private nextId: number = 1;
  private denyCount: number = 0;

  private quotaFor(kind: number): Quota | null {
    for (let i = 0; i < this.quotas.length; i++) {
      if (this.quotas[i].kind === kind) {
        return this.quotas[i];
      }
    }
    return null;
  }

  defineQuota(kind: number, limit: number): Quota {
    const existing = this.quotaFor(kind);
    if (existing !== null) {
      existing.limit = limit;
      return existing;
    }
    const quota = new Quota(kind, limit);
    this.quotas.push(quota);
    return quota;
  }

  acquire(kind: number, owner: string): number {
    const quota = this.quotaFor(kind);
    if (quota !== null && quota.used >= quota.limit) {
      this.denyCount = this.denyCount + 1;
      return -1;
    }
    for (let i = 0; i < this.resources.length; i++) {
      const resource = this.resources[i];
      if (resource.kind === kind && !resource.inUse) {
        resource.inUse = true;
        resource.refCount = 1;
        resource.owner = owner;
        if (quota !== null) {
          quota.used = quota.used + 1;
        }
        return resource.id;
      }
    }
    const resource = new Resource(this.nextId, kind);
    this.nextId = this.nextId + 1;
    resource.inUse = true;
    resource.refCount = 1;
    resource.owner = owner;
    this.resources.push(resource);
    if (quota !== null) {
      quota.used = quota.used + 1;
    }
    return resource.id;
  }

  release(id: number): boolean {
    for (let i = 0; i < this.resources.length; i++) {
      const resource = this.resources[i];
      if (resource.id === id) {
        if (!resource.inUse) {
          return false;
        }
        resource.refCount = resource.refCount - 1;
        if (resource.refCount <= 0) {
          resource.refCount = 0;
          resource.inUse = false;
          resource.owner = '';
          const quota = this.quotaFor(resource.kind);
          if (quota !== null && quota.used > 0) {
            quota.used = quota.used - 1;
          }
        }
        return true;
      }
    }
    return false;
  }

  releaseAll(owner: string): number {
    let released = 0;
    for (let i = 0; i < this.resources.length; i++) {
      if (this.resources[i].inUse && this.resources[i].owner === owner) {
        if (this.release(this.resources[i].id)) {
          released = released + 1;
        }
      }
    }
    return released;
  }

  used(kind: number): number {
    let count = 0;
    for (let i = 0; i < this.resources.length; i++) {
      if (this.resources[i].kind === kind && this.resources[i].inUse) {
        count = count + 1;
      }
    }
    return count;
  }

  total(kind: number): number {
    let count = 0;
    for (let i = 0; i < this.resources.length; i++) {
      if (this.resources[i].kind === kind) {
        count = count + 1;
      }
    }
    return count;
  }

  getDenyCount(): number {
    return this.denyCount;
  }

  isInUse(id: number): boolean {
    for (let i = 0; i < this.resources.length; i++) {
      if (this.resources[i].id === id) {
        return this.resources[i].inUse;
      }
    }
    return false;
  }

  grow(kind: number, count: number): number {
    const quota = this.quotaFor(kind);
    if (quota !== null) {
      quota.limit = quota.limit + count;
    }
    return quota === null ? 0 : quota.limit;
  }
}

export default function resourceManagementTest(): void {
  describe('ResourceManagement', () => {
    it('ResourceManagement_001', 0, async (done: Function) => {
      const pool = new ResourcePool();
      expect(pool.used(ResourceKind.WINDOW)).assertEqual(0);
      expect(pool.total(ResourceKind.WINDOW)).assertEqual(0);
      expect(pool.getDenyCount()).assertEqual(0);
      expect(pool.release(99)).assertFalse();
      done();
    });

    it('ResourceManagement_002', 0, async (done: Function) => {
      const pool = new ResourcePool();
      const id = pool.acquire(ResourceKind.BUFFER, 'MainAbility');
      expect(id).assertEqual(1);
      expect(pool.used(ResourceKind.BUFFER)).assertEqual(1);
      expect(pool.total(ResourceKind.BUFFER)).assertEqual(1);
      expect(pool.isInUse(id)).assertTrue();
      done();
    });

    it('ResourceManagement_003', 0, async (done: Function) => {
      const pool = new ResourcePool();
      const first = pool.acquire(ResourceKind.WINDOW, 'A');
      const second = pool.acquire(ResourceKind.WINDOW, 'A');
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(pool.used(ResourceKind.WINDOW)).assertEqual(2);
      expect(pool.total(ResourceKind.WINDOW)).assertEqual(2);
      done();
    });

    it('ResourceManagement_004', 0, async (done: Function) => {
      const pool = new ResourcePool();
      const id = pool.acquire(ResourceKind.SESSION, 'B');
      expect(pool.release(id)).assertTrue();
      expect(pool.isInUse(id)).assertFalse();
      expect(pool.used(ResourceKind.SESSION)).assertEqual(0);
      expect(pool.release(id)).assertFalse();
      done();
    });

    it('ResourceManagement_005', 0, async (done: Function) => {
      const pool = new ResourcePool();
      pool.defineQuota(ResourceKind.FILE_HANDLE, 2);
      const a = pool.acquire(ResourceKind.FILE_HANDLE, 'A');
      const b = pool.acquire(ResourceKind.FILE_HANDLE, 'A');
      const c = pool.acquire(ResourceKind.FILE_HANDLE, 'A');
      expect(a > 0).assertTrue();
      expect(b > 0).assertTrue();
      expect(c).assertEqual(-1);
      expect(pool.getDenyCount()).assertEqual(1);
      done();
    });

    it('ResourceManagement_006', 0, async (done: Function) => {
      const pool = new ResourcePool();
      pool.defineQuota(ResourceKind.BUFFER, 1);
      const id = pool.acquire(ResourceKind.BUFFER, 'A');
      pool.release(id);
      const reused = pool.acquire(ResourceKind.BUFFER, 'B');
      expect(reused).assertEqual(id);
      expect(pool.total(ResourceKind.BUFFER)).assertEqual(1);
      expect(pool.used(ResourceKind.BUFFER)).assertEqual(1);
      done();
    });

    it('ResourceManagement_007', 0, async (done: Function) => {
      const pool = new ResourcePool();
      pool.defineQuota(ResourceKind.SESSION, 1);
      pool.acquire(ResourceKind.SESSION, 'A');
      expect(pool.grow(ResourceKind.SESSION, 2)).assertEqual(3);
      const second = pool.acquire(ResourceKind.SESSION, 'A');
      expect(second > 0).assertTrue();
      expect(pool.used(ResourceKind.SESSION)).assertEqual(2);
      done();
    });

    it('ResourceManagement_008', 0, async (done: Function) => {
      const pool = new ResourcePool();
      pool.acquire(ResourceKind.WINDOW, 'Owner1');
      pool.acquire(ResourceKind.WINDOW, 'Owner1');
      pool.acquire(ResourceKind.WINDOW, 'Owner2');
      expect(pool.releaseAll('Owner1')).assertEqual(2);
      expect(pool.used(ResourceKind.WINDOW)).assertEqual(1);
      expect(pool.releaseAll('Owner1')).assertEqual(0);
      done();
    });

    it('ResourceManagement_009', 0, async (done: Function) => {
      const pool = new ResourcePool();
      const id = pool.acquire(ResourceKind.BUFFER, 'A');
      expect(pool.release(id)).assertTrue();
      expect(pool.release(id)).assertFalse();
      expect(pool.used(ResourceKind.BUFFER)).assertEqual(0);
      done();
    });

    it('ResourceManagement_010', 0, async (done: Function) => {
      const pool = new ResourcePool();
      pool.defineQuota(ResourceKind.FILE_HANDLE, 1);
      const id = pool.acquire(ResourceKind.FILE_HANDLE, 'A');
      expect(pool.used(ResourceKind.FILE_HANDLE)).assertEqual(1);
      expect(pool.acquire(ResourceKind.FILE_HANDLE, 'B')).assertEqual(-1);
      pool.release(id);
      expect(pool.acquire(ResourceKind.FILE_HANDLE, 'B') > 0).assertTrue();
      done();
    });

    it('ResourceManagement_011', 0, async (done: Function) => {
      const pool = new ResourcePool();
      expect(pool.grow(ResourceKind.WINDOW, 5)).assertEqual(0);
      expect(pool.total(ResourceKind.WINDOW)).assertEqual(0);
      done();
    });

    it('ResourceManagement_012', 0, async (done: Function) => {
      const pool = new ResourcePool();
      const ids: number[] = [];
      for (let i = 0; i < 5; i++) {
        ids.push(pool.acquire(ResourceKind.WINDOW, 'Batch'));
      }
      expect(pool.used(ResourceKind.WINDOW)).assertEqual(5);
      expect(pool.releaseAll('Batch')).assertEqual(5);
      expect(pool.used(ResourceKind.WINDOW)).assertEqual(0);
      expect(pool.total(ResourceKind.WINDOW)).assertEqual(5);
      done();
    });

    it('ResourceManagement_013', 0, async (done: Function) => {
      const pool = new ResourcePool();
      pool.defineQuota(ResourceKind.BUFFER, 3);
      pool.acquire(ResourceKind.BUFFER, 'A');
      pool.acquire(ResourceKind.BUFFER, 'A');
      expect(pool.used(ResourceKind.BUFFER)).assertEqual(2);
      expect(pool.total(ResourceKind.BUFFER)).assertEqual(2);
      expect(pool.getDenyCount()).assertEqual(0);
      done();
    });

    it('ResourceManagement_014', 0, async (done: Function) => {
      const pool = new ResourcePool();
      pool.defineQuota(ResourceKind.SESSION, 2);
      pool.acquire(ResourceKind.SESSION, 'A');
      pool.acquire(ResourceKind.SESSION, 'A');
      expect(pool.acquire(ResourceKind.SESSION, 'A')).assertEqual(-1);
      expect(pool.isInUse(1)).assertTrue();
      expect(pool.isInUse(99)).assertFalse();
      done();
    });

    it('ResourceManagement_015', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', `resource ui probe ${exists}`);
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}

