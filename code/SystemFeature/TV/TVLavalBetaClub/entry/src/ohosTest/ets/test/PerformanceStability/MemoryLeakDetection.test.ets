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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  serializedDelay,
  ensureHomePage,
  backToHome,
  openIntroductionPage,
  openIssueListPage,
  componentCount,
  pressAndWait,
  KEY_BACK,
  DELAY_PAGE_SWITCH,
  TIMEOUT_PAGE_RENDER,
  TOLERANCE_COMPONENT_COUNT,
  TEXT_CREATE_ISSUE_CANDIDATES
} from '../Shared/BetaClubDriver';

const CACHE_CAPACITY: number = 8;

const SAMPLING_ROUNDS: number = 5;

const GROWTH_THRESHOLD_KB: number = 512;

const PAGE_LEAK_THRESHOLD: number = 0;

interface MemorySample {
  round: number;
  usedKb: number;
}

// Tracks object references to detect retained instances
class ReferenceTracker {
  private live: Set<string> = new Set<string>();
  private peak: number = 0;
  private released: number = 0;

  public acquire(id: string): boolean {
    if (id.length === 0 || this.live.has(id)) {
      return false;
    }
    this.live.add(id);
    if (this.live.size > this.peak) {
      this.peak = this.live.size;
    }
    return true;
  }

  public release(id: string): boolean {
    if (!this.live.has(id)) {
      return false;
    }
    this.live.delete(id);
    this.released++;
    return true;
  }

  public liveCount(): number {
    return this.live.size;
  }

  public getPeak(): number {
    return this.peak;
  }

  public getReleased(): number {
    return this.released;
  }

  public has(id: string): boolean {
    return this.live.has(id);
  }

  public releaseAll(): number {
    const count = this.live.size;
    this.released += count;
    this.live = new Set<string>();
    return count;
  }
}

// Bounded cache with least-recently-used eviction
class CacheEvictor {
  private entries: Map<string, number> = new Map<string, number>();
  private readonly capacity: number;
  private hits: number = 0;
  private misses: number = 0;
  private evictions: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public put(key: string, value: number): boolean {
    if (key.length === 0) {
      return false;
    }
    if (this.entries.has(key)) {
      this.entries.delete(key);
    } else if (this.entries.size >= this.capacity) {
      const oldest = this.firstKey();
      if (oldest !== '') {
        this.entries.delete(oldest);
        this.evictions++;
      }
    }
    this.entries.set(key, value);
    return true;
  }

  public get(key: string): number {
    const value = this.entries.get(key);
    if (value === undefined) {
      this.misses++;
      return -1;
    }
    this.entries.delete(key);
    this.entries.set(key, value);
    this.hits++;
    return value;
  }

  public size(): number {
    return this.entries.size;
  }

  public getHits(): number {
    return this.hits;
  }

  public getMisses(): number {
    return this.misses;
  }

  public getEvictions(): number {
    return this.evictions;
  }

  public firstKey(): string {
    let first: string = '';
    this.entries.forEach((value: number, key: string) => {
      if (first === '') {
        first = key;
      }
    });
    return first;
  }

  public clear(): void {
    this.entries.clear();
    this.hits = 0;
    this.misses = 0;
    this.evictions = 0;
  }
}

// Detects resources not released when leaving a page
class PageResourceRegistry {
  private owned: Map<string, string[]> = new Map<string, string[]>();

  public acquire(page: string, resource: string): void {
    let resources = this.owned.get(page);
    if (resources === undefined) {
      resources = [];
      this.owned.set(page, resources);
    }
    if (!resources.includes(resource)) {
      resources.push(resource);
    }
  }

  public release(page: string, resource: string): boolean {
    const resources = this.owned.get(page);
    if (resources === undefined) {
      return false;
    }
    const index = resources.indexOf(resource);
    if (index < 0) {
      return false;
    }
    resources.splice(index, 1);
    if (resources.length === 0) {
      this.owned.delete(page);
    }
    return true;
  }

  public releasePage(page: string): number {
    const resources = this.owned.get(page);
    if (resources === undefined) {
      return 0;
    }
    const count = resources.length;
    this.owned.delete(page);
    return count;
  }

  public leakedCount(page: string): number {
    const resources = this.owned.get(page);
    return resources === undefined ? 0 : resources.length;
  }

  public hasLeak(page: string): boolean {
    return this.leakedCount(page) > PAGE_LEAK_THRESHOLD;
  }

  public totalAcquired(): number {
    let total: number = 0;
    this.owned.forEach((resources: string[]) => {
      total += resources.length;
    });
    return total;
  }
}

// Samples memory usage and evaluates growth over rounds
class MemorySampler {
  private samples: MemorySample[] = [];

  public record(round: number, usedKb: number): void {
    this.samples.push({ round: round, usedKb: usedKb });
  }

  public count(): number {
    return this.samples.length;
  }

  public getFirst(): number {
    return this.samples.length === 0 ? 0 : this.samples[0].usedKb;
  }

  public getLast(): number {
    return this.samples.length === 0 ? 0 : this.samples[this.samples.length - 1].usedKb;
  }

  public getGrowth(): number {
    return this.getLast() - this.getFirst();
  }

  public getMax(): number {
    let max: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].usedKb > max) {
        max = this.samples[i].usedKb;
      }
    }
    return max;
  }

  public isGrowthAcceptable(thresholdKb: number): boolean {
    return this.getGrowth() <= thresholdKb;
  }

  public isMonotonicGrowth(): boolean {
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i].usedKb < this.samples[i - 1].usedKb) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.samples = [];
  }
}

// Tracks listener registrations and detects leaks
class ListenerRegistry {
  private listeners: Map<string, number> = new Map<string, number>();

  public register(owner: string): number {
    const current = this.listeners.get(owner) ?? 0;
    this.listeners.set(owner, current + 1);
    return current + 1;
  }

  public unregister(owner: string): boolean {
    const current = this.listeners.get(owner) ?? 0;
    if (current <= 0) {
      return false;
    }
    if (current === 1) {
      this.listeners.delete(owner);
    } else {
      this.listeners.set(owner, current - 1);
    }
    return true;
  }

  public countOf(owner: string): number {
    const value = this.listeners.get(owner);
    return value === undefined ? 0 : value;
  }

  public hasLeak(owner: string): boolean {
    return this.countOf(owner) > 0;
  }

  public size(): number {
    return this.listeners.size;
  }

  public clear(): void {
    this.listeners = new Map<string, number>();
  }
}

export default function memoryLeakDetectionTest() {
  describe('MemoryLeakDetection_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 300);
      await ensureHomePage(driver);
    });

    afterAll(async () => {
      await backToHome(driver, 3);
    });

    it('reference_tracker_should_count_live_objects', 0, () => {
      const tracker = new ReferenceTracker();
      expect(tracker.acquire('a')).assertTrue();
      expect(tracker.acquire('b')).assertTrue();
      expect(tracker.acquire('a')).assertFalse();
      expect(tracker.acquire('')).assertFalse();
      expect(tracker.liveCount()).assertEqual(2);
      expect(tracker.getPeak()).assertEqual(2);
      expect(tracker.has('a')).assertTrue();
    });

    it('reference_tracker_should_release_objects', 0, () => {
      const tracker = new ReferenceTracker();
      tracker.acquire('a');
      tracker.acquire('b');
      expect(tracker.release('a')).assertTrue();
      expect(tracker.release('a')).assertFalse();
      expect(tracker.liveCount()).assertEqual(1);
      expect(tracker.getReleased()).assertEqual(1);
      expect(tracker.has('a')).assertFalse();
      expect(tracker.releaseAll()).assertEqual(1);
      expect(tracker.liveCount()).assertEqual(0);
    });

    it('cache_evictor_should_evict_oldest_entry', 0, () => {
      const cache = new CacheEvictor(2);
      cache.put('a', 1);
      cache.put('b', 2);
      expect(cache.size()).assertEqual(2);
      cache.put('c', 3);
      expect(cache.size()).assertEqual(2);
      expect(cache.getEvictions()).assertEqual(1);
      expect(cache.firstKey()).assertEqual('b');
      expect(cache.get('a')).assertEqual(-1);
      expect(cache.getMisses()).assertEqual(1);
    });

    it('cache_evictor_should_refresh_lru_on_hit', 0, () => {
      const cache = new CacheEvictor(2);
      cache.put('a', 1);
      cache.put('b', 2);
      expect(cache.get('a')).assertEqual(1);
      expect(cache.getHits()).assertEqual(1);
      cache.put('c', 3);
      expect(cache.size()).assertEqual(2);
      expect(cache.get('b')).assertEqual(-1);
      expect(cache.get('a')).assertEqual(1);
    });

    it('cache_evictor_should_handle_zero_capacity', 0, () => {
      const cache = new CacheEvictor(0);
      cache.put('a', 1);
      expect(cache.size()).assertEqual(1);
      expect(cache.getEvictions()).assertEqual(0);
      cache.put('b', 2);
      expect(cache.size()).assertEqual(1);
      expect(cache.getEvictions()).assertEqual(1);
      expect(cache.firstKey()).assertEqual('b');
    });

    it('page_resource_registry_should_detect_leaks', 0, () => {
      const registry = new PageResourceRegistry();
      registry.acquire('home', 'callback');
      registry.acquire('home', 'timer');
      expect(registry.leakedCount('home')).assertEqual(2);
      expect(registry.hasLeak('home')).assertTrue();
      expect(registry.release('home', 'timer')).assertTrue();
      expect(registry.leakedCount('home')).assertEqual(1);
      expect(registry.releasePage('home')).assertEqual(1);
      expect(registry.hasLeak('home')).assertFalse();
      expect(registry.totalAcquired()).assertEqual(0);
    });

    it('page_resource_registry_should_ignore_duplicates', 0, () => {
      const registry = new PageResourceRegistry();
      registry.acquire('list', 'observer');
      registry.acquire('list', 'observer');
      expect(registry.leakedCount('list')).assertEqual(1);
      expect(registry.release('list', 'missing')).assertFalse();
      expect(registry.release('unknown', 'observer')).assertFalse();
      expect(registry.releasePage('unknown')).assertEqual(0);
      expect(registry.totalAcquired()).assertEqual(1);
    });

    it('memory_sampler_should_compute_growth', 0, () => {
      const sampler = new MemorySampler();
      sampler.record(1, 1000);
      sampler.record(2, 1100);
      sampler.record(3, 1200);
      expect(sampler.count()).assertEqual(3);
      expect(sampler.getFirst()).assertEqual(1000);
      expect(sampler.getLast()).assertEqual(1200);
      expect(sampler.getGrowth()).assertEqual(200);
      expect(sampler.getMax()).assertEqual(1200);
      expect(sampler.isGrowthAcceptable(GROWTH_THRESHOLD_KB)).assertTrue();
    });

    it('memory_sampler_should_flag_excessive_growth', 0, () => {
      const sampler = new MemorySampler();
      sampler.record(1, 1000);
      sampler.record(2, 2000);
      expect(sampler.getGrowth()).assertEqual(1000);
      expect(sampler.isGrowthAcceptable(GROWTH_THRESHOLD_KB)).assertFalse();
      expect(sampler.isMonotonicGrowth()).assertTrue();
      sampler.record(3, 1500);
      expect(sampler.isMonotonicGrowth()).assertFalse();
      sampler.clear();
      expect(sampler.count()).assertEqual(0);
      expect(sampler.getGrowth()).assertEqual(0);
    });

    it('listener_registry_should_detect_leaks', 0, () => {
      const registry = new ListenerRegistry();
      expect(registry.register('index')).assertEqual(1);
      expect(registry.register('index')).assertEqual(2);
      expect(registry.countOf('index')).assertEqual(2);
      expect(registry.hasLeak('index')).assertTrue();
      expect(registry.unregister('index')).assertTrue();
      expect(registry.unregister('index')).assertTrue();
      expect(registry.unregister('index')).assertFalse();
      expect(registry.hasLeak('index')).assertFalse();
      expect(registry.size()).assertEqual(0);
    });

    it('listener_registry_should_clear_all', 0, () => {
      const registry = new ListenerRegistry();
      registry.register('home');
      registry.register('list');
      registry.register('detail');
      expect(registry.size()).assertEqual(3);
      registry.clear();
      expect(registry.size()).assertEqual(0);
      expect(registry.countOf('home')).assertEqual(0);
      expect(registry.hasLeak('list')).assertFalse();
    });

    it('repeated_page_visits_should_not_grow_component_count', 0, async () => {
      await ensureHomePage(driver);
      const before = await componentCount(driver);
      for (let i = 0; i < 2; i++) {
        await openIntroductionPage(driver);
        await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
        await ensureHomePage(driver);
      }
      const after = await componentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    it('page_resource_lifecycle_should_release_everything', 0, () => {
      const registry = new PageResourceRegistry();
      const pages: string[] = ['home', 'list', 'detail'];
      for (let i = 0; i < pages.length; i++) {
        registry.acquire(pages[i], 'observer');
        registry.acquire(pages[i], 'timer');
      }
      expect(registry.totalAcquired()).assertEqual(6);
      for (let i = 0; i < pages.length; i++) {
        expect(registry.releasePage(pages[i])).assertEqual(2);
      }
      expect(registry.totalAcquired()).assertEqual(0);
      for (let i = 0; i < pages.length; i++) {
        expect(registry.hasLeak(pages[i])).assertFalse();
      }
    });

    it('memory_sampling_should_handle_empty_and_single', 0, () => {
      const sampler = new MemorySampler();
      expect(sampler.getFirst()).assertEqual(0);
      expect(sampler.getLast()).assertEqual(0);
      expect(sampler.getMax()).assertEqual(0);
      expect(sampler.isMonotonicGrowth()).assertTrue();
      expect(sampler.isGrowthAcceptable(0)).assertTrue();
      sampler.record(1, 2048);
      expect(sampler.getFirst()).assertEqual(2048);
      expect(sampler.getGrowth()).assertEqual(0);
      expect(sampler.count()).assertEqual(1);
    });

    it('sampling_constants_should_be_consistent', 0, () => {
      expect(CACHE_CAPACITY).assertEqual(8);
      expect(SAMPLING_ROUNDS).assertEqual(5);
      expect(GROWTH_THRESHOLD_KB).assertEqual(512);
      expect(PAGE_LEAK_THRESHOLD).assertEqual(0);
      expect(SAMPLING_ROUNDS).assertLarger(1);
    });
  });
}

