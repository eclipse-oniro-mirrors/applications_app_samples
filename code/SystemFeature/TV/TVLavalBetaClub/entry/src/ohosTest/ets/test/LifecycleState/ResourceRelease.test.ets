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
const TYPE_CALLBACK: string = 'callback';
const TYPE_TIMER: string = 'timer';
const TYPE_LISTENER: string = 'listener';

const MAX_RESOURCES: number = 64;

interface Disposable {
  id: string;
  type: string;
  released: boolean;
}

// Releases resources in reverse acquisition order
class ReleaseRegistry {
  private resources: Disposable[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public register(id: string, type: string): boolean {
    if (id.length === 0 || this.has(id) || this.resources.length >= this.capacity) {
      return false;
    }
    this.resources.push({ id: id, type: type, released: false });
    return true;
  }

  public has(id: string): boolean {
    for (let i = 0; i < this.resources.length; i++) {
      if (this.resources[i].id === id) {
        return true;
      }
    }
    return false;
  }

  public release(id: string): boolean {
    for (let i = 0; i < this.resources.length; i++) {
      if (this.resources[i].id === id && !this.resources[i].released) {
        this.resources[i].released = true;
        return true;
      }
    }
    return false;
  }

  public releaseLast(): string {
    for (let i = this.resources.length - 1; i >= 0; i--) {
      if (!this.resources[i].released) {
        this.resources[i].released = true;
        return this.resources[i].id;
      }
    }
    return '';
  }

  public releaseAll(): number {
    let count: number = 0;
    for (let i = this.resources.length - 1; i >= 0; i--) {
      if (!this.resources[i].released) {
        this.resources[i].released = true;
        count++;
      }
    }
    return count;
  }

  public unreleasedCount(): number {
    return this.resources.filter((resource: Disposable) => !resource.released).length;
  }

  public releasedCount(): number {
    return this.resources.filter((resource: Disposable) => resource.released).length;
  }

  public hasLeak(): boolean {
    return this.unreleasedCount() > 0;
  }

  public unreleasedOfType(type: string): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.resources.length; i++) {
      if (this.resources[i].type === type && !this.resources[i].released) {
        result.push(this.resources[i].id);
      }
    }
    return result;
  }

  public size(): number {
    return this.resources.length;
  }

  public clear(): void {
    this.resources = [];
  }
}

// Tracks release callbacks and failures
class ReleaseAuditor {
  private attempted: number = 0;
  private succeeded: number = 0;
  private failed: number = 0;

  public onSuccess(): void {
    this.attempted++;
    this.succeeded++;
  }

  public onFailure(): void {
    this.attempted++;
    this.failed++;
  }

  public getAttempted(): number {
    return this.attempted;
  }

  public getSucceeded(): number {
    return this.succeeded;
  }

  public getFailed(): number {
    return this.failed;
  }

  public successRate(): number {
    return this.attempted === 0 ? 0 : this.succeeded * 100 / this.attempted;
  }

  public reset(): void {
    this.attempted = 0;
    this.succeeded = 0;
    this.failed = 0;
  }
}

// Aggregates page-level release results
class PageReleaseReport {
  private pages: Map<string, number> = new Map<string, number>();

  public add(page: string, released: number): void {
    if (page.length === 0) {
      return;
    }
    this.pages.set(page, (this.pages.get(page) ?? 0) + released);
  }

  public countOf(page: string): number {
    const value = this.pages.get(page);
    return value === undefined ? 0 : value;
  }

  public total(): number {
    let total: number = 0;
    this.pages.forEach((count: number) => {
      total += count;
    });
    return total;
  }

  public pagesTouched(): number {
    return this.pages.size;
  }

  public reset(): void {
    this.pages = new Map<string, number>();
  }
}

export default function resourceReleaseTest() {
  describe('ResourceReleaseTest', () => {

    it('registry_should_register_and_release', 0, () => {
      const registry = new ReleaseRegistry(MAX_RESOURCES);
      expect(registry.register('pm-1', TYPE_PIXELMAP)).assertTrue();
      expect(registry.register('pm-1', TYPE_PIXELMAP)).assertFalse();
      expect(registry.register('', TYPE_PIXELMAP)).assertFalse();
      expect(registry.size()).assertEqual(1);
      expect(registry.has('pm-1')).assertTrue();
      expect(registry.release('pm-1')).assertTrue();
      expect(registry.release('pm-1')).assertFalse();
      expect(registry.releasedCount()).assertEqual(1);
      expect(registry.unreleasedCount()).assertEqual(0);
    });

    it('registry_should_release_in_lifo_order', 0, () => {
      const registry = new ReleaseRegistry(MAX_RESOURCES);
      registry.register('a', TYPE_TIMER);
      registry.register('b', TYPE_CALLBACK);
      registry.register('c', TYPE_LISTENER);
      expect(registry.releaseLast()).assertEqual('c');
      expect(registry.releaseLast()).assertEqual('b');
      expect(registry.releaseLast()).assertEqual('a');
      expect(registry.releaseLast()).assertEqual('');
      expect(registry.hasLeak()).assertFalse();
    });

    it('registry_should_release_all', 0, () => {
      const registry = new ReleaseRegistry(MAX_RESOURCES);
      registry.register('a', TYPE_TIMER);
      registry.register('b', TYPE_CALLBACK);
      registry.register('c', TYPE_LISTENER);
      expect(registry.releaseAll()).assertEqual(3);
      expect(registry.unreleasedCount()).assertEqual(0);
      expect(registry.releaseAll()).assertEqual(0);
      registry.clear();
      expect(registry.size()).assertEqual(0);
    });

    it('registry_should_detect_leaks_by_type', 0, () => {
      const registry = new ReleaseRegistry(MAX_RESOURCES);
      registry.register('pm-1', TYPE_PIXELMAP);
      registry.register('pm-2', TYPE_PIXELMAP);
      registry.register('cb-1', TYPE_CALLBACK);
      registry.release('pm-1');
      expect(registry.unreleasedCount()).assertEqual(2);
      expect(registry.hasLeak()).assertTrue();
      expect(registry.unreleasedOfType(TYPE_PIXELMAP)).assertDeepEquals(['pm-2']);
      expect(registry.unreleasedOfType(TYPE_CALLBACK)).assertDeepEquals(['cb-1']);
      expect(registry.unreleasedOfType(TYPE_TIMER).length).assertEqual(0);
    });

    it('registry_should_enforce_capacity', 0, () => {
      const registry = new ReleaseRegistry(2);
      expect(registry.register('a', TYPE_TIMER)).assertTrue();
      expect(registry.register('b', TYPE_TIMER)).assertTrue();
      expect(registry.register('c', TYPE_TIMER)).assertFalse();
      expect(registry.size()).assertEqual(2);
      expect(registry.release('missing')).assertFalse();
    });

    it('auditor_should_track_release_results', 0, () => {
      const auditor = new ReleaseAuditor();
      auditor.onSuccess();
      auditor.onSuccess();
      auditor.onFailure();
      expect(auditor.getAttempted()).assertEqual(3);
      expect(auditor.getSucceeded()).assertEqual(2);
      expect(auditor.getFailed()).assertEqual(1);
      expect(auditor.successRate()).assertLarger(66);
      auditor.reset();
      expect(auditor.getAttempted()).assertEqual(0);
      expect(auditor.successRate()).assertEqual(0);
    });

    it('report_should_aggregate_pages', 0, () => {
      const report = new PageReleaseReport();
      report.add('home', 2);
      report.add('home', 1);
      report.add('list', 3);
      report.add('', 5);
      expect(report.countOf('home')).assertEqual(3);
      expect(report.countOf('list')).assertEqual(3);
      expect(report.countOf('missing')).assertEqual(0);
      expect(report.total()).assertEqual(6);
      expect(report.pagesTouched()).assertEqual(2);
      report.reset();
      expect(report.total()).assertEqual(0);
    });

    it('release_flow_should_leave_no_leak', 0, () => {
      const registry = new ReleaseRegistry(MAX_RESOURCES);
      const auditor = new ReleaseAuditor();
      const report = new PageReleaseReport();
      const resources: string[] = ['pm-1', 'pm-2', 'cb-1', 'timer-1'];
      for (let i = 0; i < resources.length; i++) {
        registry.register(resources[i], i % 2 === 0 ? TYPE_PIXELMAP : TYPE_CALLBACK);
      }
      while (registry.releaseLast() !== '') {
        auditor.onSuccess();
      }
      report.add('home', auditor.getSucceeded());
      expect(registry.hasLeak()).assertFalse();
      expect(auditor.getSucceeded()).assertEqual(4);
      expect(report.countOf('home')).assertEqual(4);
      expect(registry.unreleasedOfType(TYPE_PIXELMAP).length).assertEqual(0);
    });

    it('release_flow_should_handle_partial_failure', 0, () => {
      const registry = new ReleaseRegistry(MAX_RESOURCES);
      const auditor = new ReleaseAuditor();
      registry.register('a', TYPE_TIMER);
      registry.register('b', TYPE_CALLBACK);
      if (registry.release('a')) {
        auditor.onSuccess();
      }
      auditor.onFailure();
      expect(registry.unreleasedCount()).assertEqual(1);
      expect(registry.hasLeak()).assertTrue();
      expect(auditor.successRate()).assertEqual(50);
      registry.releaseAll();
      expect(registry.hasLeak()).assertFalse();
    });

    it('resource_release_constants_should_be_stable', 0, () => {
      expect(TYPE_PIXELMAP).assertEqual('pixelMap');
      expect(TYPE_CALLBACK).assertEqual('callback');
      expect(TYPE_TIMER).assertEqual('timer');
      expect(TYPE_LISTENER).assertEqual('listener');
      expect(MAX_RESOURCES).assertEqual(64);
    });
  });
}

