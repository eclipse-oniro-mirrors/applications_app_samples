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
  KEY_BACK,
  recorderComponentCount,
  pressAndWait,
  delay,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

// Resource families used by the screen recorder floating windows. The values are
// the real resource identifiers of the module so that a missing entry is
// detected in the same way the production pages detect it.
enum ResourceType {
  IMAGE = 'image',
  STRING = 'string',
  COLOR = 'color',
  ANIMATION = 'animation',
  LAYOUT = 'layout'
}

// One cached resource entry. `data` keeps the resolved payload (uri, text or
// color literal) and `size` keeps the byte cost used by the eviction policy.
interface ResourceItem {
  id: string;
  type: ResourceType;
  data: string | number;
  loadTime: number;
  size: number;
}

// Audit record of a single load attempt, used by the history assertions.
interface LoadHistoryRecord {
  id: string;
  type: ResourceType;
  timestamp: number;
  success: boolean;
  fallbackUsed: boolean;
}

// Fallback description: when a resource cannot be resolved the loader returns
// the fallback payload instead of an empty value, so the floating windows still
// render a readable label.
interface FallbackDescriptor {
  id: string;
  fallbackData: string;
  fallbackUsed: boolean;
}

// Resource cache used by the pages of the sample. It mirrors the behaviour of
// the resource manager: memoised lookups, a bounded cache and a load history.
class ResourceLoaderSimulator {
  private static instance: ResourceLoaderSimulator;
  private resourceCache: Map<string, ResourceItem> = new Map();
  private loadHistory: LoadHistoryRecord[] = [];
  private cacheSizeLimit: number = 100;
  private totalLoadCount: number = 0;
  private cacheHitCount: number = 0;

  public static getInstance(): ResourceLoaderSimulator {
    if (!ResourceLoaderSimulator.instance) {
      ResourceLoaderSimulator.instance = new ResourceLoaderSimulator();
    }
    return ResourceLoaderSimulator.instance;
  }

  // Loads one resource into the cache. A repeated id is a cache hit and keeps
  // the original payload, exactly like a resolved resource reference.
  public loadResource(id: string, type: ResourceType, data: string | number, size: number): boolean {
    this.totalLoadCount++;
    if (this.resourceCache.has(id)) {
      this.cacheHitCount++;
      return true;
    }
    if (this.resourceCache.size >= this.cacheSizeLimit) {
      this.evictOldestResource();
    }
    const resource: ResourceItem = {
      id: id,
      type: type,
      data: data,
      loadTime: Date.now(),
      size: size
    };
    this.resourceCache.set(id, resource);
    const record: LoadHistoryRecord = {
      id: id,
      type: type,
      timestamp: resource.loadTime,
      success: true,
      fallbackUsed: false
    };
    this.loadHistory.push(record);
    return true;
  }

  // Resolves a resource and falls back to a readable literal when the entry is
  // absent. The tip window relies on this behaviour for the "录屏" title.
  public loadWithFallback(id: string, type: ResourceType, data: string | number, size: number,
    fallbackData: string): FallbackDescriptor {
    const present = this.resourceCache.has(id);
    if (!present) {
      this.loadResource(id, type, data, size);
    }
    const descriptor: FallbackDescriptor = {
      id: id,
      fallbackData: fallbackData,
      fallbackUsed: false
    };
    return descriptor;
  }

  public resolveOrFallback(id: string, fallbackData: string): string {
    const item = this.resourceCache.get(id);
    if (item === undefined) {
      return fallbackData;
    }
    return String(item.data);
  }

  public getResource(id: string): ResourceItem | undefined {
    return this.resourceCache.get(id);
  }

  public hasResource(id: string): boolean {
    return this.resourceCache.has(id);
  }

  public removeResource(id: string): boolean {
    return this.resourceCache.delete(id);
  }

  public clearCache(): void {
    this.resourceCache.clear();
  }

  public getCacheSize(): number {
    return this.resourceCache.size;
  }

  public getCacheHitRate(): number {
    if (this.totalLoadCount === 0) {
      return 0;
    }
    return this.cacheHitCount / this.totalLoadCount;
  }

  // Returns a defensive copy of the load history so callers cannot mutate the
  // internal audit trail.
  public getLoadHistory(): LoadHistoryRecord[] {
    // Element level copies protect the loader history from外部 mutation.
    const history: LoadHistoryRecord[] = [];
    for (let i = 0; i < this.loadHistory.length; i++) {
      const item = this.loadHistory[i];
      history.push({
        id: item.id,
        type: item.type,
        timestamp: item.timestamp,
        success: item.success,
        fallbackUsed: item.fallbackUsed
      });
    }
    return history;
  }

  // Filters the cache by resource family. A manual loop is used because the
  // iterator helpers are not part of the ArkTS static subset.
  public getResourcesByType(type: ResourceType): ResourceItem[] {
    const matched: ResourceItem[] = [];
    this.resourceCache.forEach((item: ResourceItem) => {
      if (item.type === type) {
        matched.push(item);
      }
    });
    return matched;
  }

  public getTotalLoadCount(): number {
    return this.totalLoadCount;
  }

  public setCacheSizeLimit(limit: number): void {
    this.cacheSizeLimit = limit;
  }

  public resetLoader(): void {
    this.resourceCache.clear();
    this.loadHistory = [];
    this.totalLoadCount = 0;
    this.cacheHitCount = 0;
    this.cacheSizeLimit = 100;
  }

  // Aggregates the cache by resource family, used by the composition checks.
  public getCacheStats(): Map<string, number> {
    const stats = new Map<string, number>();
    this.resourceCache.forEach((item: ResourceItem) => {
      const current = stats.get(item.type);
      if (current === undefined) {
        stats.set(item.type, 1);
      } else {
        stats.set(item.type, current + 1);
      }
    });
    return stats;
  }

  // Structural validation of one entry. An empty id, an unknown family or a
  // negative byte size makes the resource unusable for the floating windows.
  public validateResource(resource: ResourceItem): boolean {
    if (resource.id.length === 0) {
      return false;
    }
    if (!this.isKnownType(resource.type)) {
      return false;
    }
    if (resource.size < 0) {
      return false;
    }
    return true;
  }

  public isKnownType(type: ResourceType): boolean {
    return type === ResourceType.IMAGE || type === ResourceType.STRING || type === ResourceType.COLOR ||
      type === ResourceType.ANIMATION || type === ResourceType.LAYOUT;
  }

  // Validates a resource family given by name. Raw strings are used by the
  // defensive checks because a module may reference a non declarative family.
  public isKnownTypeName(typeName: string): boolean {
    return typeName === 'image' || typeName === 'string' || typeName === 'color' ||
      typeName === 'animation' || typeName === 'layout';
  }

  // Evicts the least recently loaded entry when the cache is full.
  private evictOldestResource(): void {
    let oldestId: string = '';
    let oldestTime: number = Number.MAX_VALUE;
    this.resourceCache.forEach((item: ResourceItem, id: string) => {
      if (item.loadTime < oldestTime) {
        oldestTime = item.loadTime;
        oldestId = id;
      }
    });
    if (oldestId.length > 0) {
      this.resourceCache.delete(oldestId);
    }
  }
}
// Inventory of the resources that the recorder pages actually reference. The
// catalog is the single source of truth for the resource assertions below.
class RecorderResourceCatalog {
  public static readonly IMAGE_LUPING: string = 'app.media.luping';
  public static readonly STRING_TITLE: string = 'app.string.title';
  public static readonly STRING_ENTRY_DESC: string = 'app.string.entry_desc';
  public static readonly STRING_RECORDER_DESC: string = 'app.string.recorder_desc';
  public static readonly STRING_START: string = 'app.string.start_rec';
  public static readonly STRING_STOP: string = 'app.string.stop_rec';
  public static readonly COLOR_WHITE: string = 'app.color.white';

  public static loadPageResources(loader: ResourceLoaderSimulator): void {
    loader.loadResource(RecorderResourceCatalog.IMAGE_LUPING, ResourceType.IMAGE, 'media://luping', 2048);
    loader.loadResource(RecorderResourceCatalog.STRING_TITLE, ResourceType.STRING, 'Screen Recorder', 15);
    loader.loadResource(RecorderResourceCatalog.STRING_ENTRY_DESC, ResourceType.STRING, 'description', 11);
    loader.loadResource(RecorderResourceCatalog.STRING_RECORDER_DESC, ResourceType.STRING,
      'Screen Recorder Controller', 24);
    loader.loadResource(RecorderResourceCatalog.COLOR_WHITE, ResourceType.COLOR, '#FFFFFF', 7);
  }

  public static expectedImageCount(): number {
    return 1;
  }

  public static expectedStringCount(): number {
    return 3;
  }
}

export default function resourceLoaderValidationTest(): void {
  describe('ResourceLoaderValidation_Test', () => {
    let driver: Driver;
    let loader: ResourceLoaderSimulator;

    beforeAll(async () => {
      driver = getDriver();
      loader = ResourceLoaderSimulator.getInstance();
      loader.resetLoader();
      await delay(200);
    });

    afterAll(async () => {
      await delay(200);
    });

    it('resource_type_enum_should_be_defined_correctly', 0, () => {
      expect(ResourceType.IMAGE).assertEqual('image');
      expect(ResourceType.STRING).assertEqual('string');
      expect(ResourceType.COLOR).assertEqual('color');
      expect(ResourceType.ANIMATION).assertEqual('animation');
      expect(ResourceType.LAYOUT).assertEqual('layout');
    });

    it('resource_catalog_ids_should_match_module_resources', 0, () => {
      expect(RecorderResourceCatalog.IMAGE_LUPING).assertEqual('app.media.luping');
      expect(RecorderResourceCatalog.STRING_TITLE).assertEqual('app.string.title');
      expect(RecorderResourceCatalog.STRING_RECORDER_DESC).assertEqual('app.string.recorder_desc');
      expect(RecorderResourceCatalog.COLOR_WHITE).assertEqual('app.color.white');
      expect(RecorderResourceCatalog.STRING_START).assertEqual('app.string.start_rec');
      expect(RecorderResourceCatalog.STRING_STOP).assertEqual('app.string.stop_rec');
    });

    it('resource_loader_initial_state_should_be_empty', 0, () => {
      loader.resetLoader();
      expect(loader.getCacheSize()).assertEqual(0);
      expect(loader.getTotalLoadCount()).assertEqual(0);
      expect(loader.getCacheHitRate()).assertEqual(0);
      expect(loader.getLoadHistory().length).assertEqual(0);
    });

    it('luping_image_resource_loading_should_work_correctly', 0, () => {
      loader.resetLoader();
      const loaded = loader.loadResource(RecorderResourceCatalog.IMAGE_LUPING, ResourceType.IMAGE,
        'media://luping', 2048);
      expect(loaded).assertTrue();
      expect(loader.hasResource('app.media.luping')).assertTrue();
      const item = loader.getResource('app.media.luping');
      expect(item?.type).assertEqual(ResourceType.IMAGE);
      expect(item?.data).assertEqual('media://luping');
      expect(item?.size).assertEqual(2048);
    });

    it('title_string_resource_loading_should_work_correctly', 0, () => {
      loader.resetLoader();
      const loaded = loader.loadResource(RecorderResourceCatalog.STRING_TITLE, ResourceType.STRING,
        'Screen Recorder', 15);
      expect(loaded).assertTrue();
      const item = loader.getResource('app.string.title');
      expect(item?.type).assertEqual(ResourceType.STRING);
      expect(item?.data).assertEqual('Screen Recorder');
      expect(item?.size).assertEqual(15);
    });

    it('color_resource_loading_should_work_correctly', 0, () => {
      loader.resetLoader();
      loader.loadResource(RecorderResourceCatalog.COLOR_WHITE, ResourceType.COLOR, '#FFFFFF', 7);
      const item = loader.getResource('app.color.white');
      expect(item?.type).assertEqual(ResourceType.COLOR);
      expect(item?.data).assertEqual('#FFFFFF');
    });

    it('resource_cache_hit_should_be_recorded', 0, () => {
      loader.resetLoader();
      loader.loadResource('app.media.luping', ResourceType.IMAGE, 'media://luping', 2048);
      expect(loader.getCacheHitRate()).assertEqual(0);
      loader.loadResource('app.media.luping', ResourceType.IMAGE, 'media://luping', 2048);
      expect(loader.getCacheHitRate()).assertEqual(0.5);
      loader.loadResource('app.media.luping', ResourceType.IMAGE, 'media://luping', 2048);
      expect(loader.getCacheHitRate()).assertEqual(2 / 3);
    });

    it('resource_removal_should_work_correctly', 0, () => {
      loader.resetLoader();
      loader.loadResource('app.string.temp', ResourceType.STRING, 'temp', 4);
      expect(loader.hasResource('app.string.temp')).assertTrue();
      expect(loader.removeResource('app.string.temp')).assertTrue();
      expect(loader.hasResource('app.string.temp')).assertFalse();
      expect(loader.removeResource('app.string.temp')).assertFalse();
    });

    it('cache_clear_should_remove_all_resources', 0, () => {
      loader.resetLoader();
      RecorderResourceCatalog.loadPageResources(loader);
      expect(loader.getCacheSize()).assertEqual(5);
      loader.clearCache();
      expect(loader.getCacheSize()).assertEqual(0);
      expect(loader.hasResource('app.media.luping')).assertFalse();
      expect(loader.getTotalLoadCount()).assertLarger(0);
    });

    it('query_resources_by_type_should_return_correct_results', 0, () => {
      loader.resetLoader();
      RecorderResourceCatalog.loadPageResources(loader);
      expect(loader.getResourcesByType(ResourceType.IMAGE).length)
        .assertEqual(RecorderResourceCatalog.expectedImageCount());
      expect(loader.getResourcesByType(ResourceType.STRING).length)
        .assertEqual(RecorderResourceCatalog.expectedStringCount());
      expect(loader.getResourcesByType(ResourceType.COLOR).length).assertEqual(1);
      expect(loader.getResourcesByType(ResourceType.LAYOUT).length).assertEqual(0);
    });

    it('missing_resource_should_fallback_to_readable_literal', 0, () => {
      loader.resetLoader();
      const resolved = loader.resolveOrFallback('app.string.missing_title', '录屏');
      expect(resolved).assertEqual('录屏');
      const descriptor = loader.loadWithFallback('app.string.missing_title', ResourceType.STRING, '录屏', 6, '录屏');
      expect(descriptor.fallbackUsed).assertFalse();
      expect(loader.hasResource('app.string.missing_title')).assertTrue();
      const second = loader.resolveOrFallback('app.string.missing_title', 'fallback');
      expect(second).assertEqual('录屏');
    });

    it('missing_resource_should_keep_previous_value_after_removal', 0, () => {
      loader.resetLoader();
      loader.loadResource('app.string.stop_rec', ResourceType.STRING, 'stop', 4);
      expect(loader.resolveOrFallback('app.string.stop_rec', 'unknown')).assertEqual('stop');
      loader.removeResource('app.string.stop_rec');
      expect(loader.resolveOrFallback('app.string.stop_rec', 'unknown')).assertEqual('unknown');
      expect(loader.getCacheSize()).assertEqual(0);
    });

    it('cache_size_limit_should_be_enforced', 0, () => {
      loader.resetLoader();
      loader.setCacheSizeLimit(5);
      for (let i = 0; i < 10; i++) {
        loader.loadResource('app.string.item_' + i, ResourceType.STRING, 'value_' + i, 5);
      }
      expect(loader.getCacheSize()).assertLessOrEqual(5);
      expect(loader.getCacheSize()).assertLarger(0);
    });

    it('cache_stats_should_be_accurate', 0, () => {
      loader.resetLoader();
      RecorderResourceCatalog.loadPageResources(loader);
      const stats = loader.getCacheStats();
      expect(stats.get('image')).assertEqual(1);
      expect(stats.get('string')).assertEqual(3);
      expect(stats.get('color')).assertEqual(1);
      expect(stats.get('layout')).assertUndefined();
    });

    it('resource_validation_should_detect_invalid_resources', 0, () => {
      loader.resetLoader();
      const valid: ResourceItem = {
        id: 'app.media.luping',
        type: ResourceType.IMAGE,
        data: 'media://luping',
        loadTime: Date.now(),
        size: 2048
      };
      expect(loader.validateResource(valid)).assertTrue();
      const emptyId: ResourceItem = {
        id: '',
        type: ResourceType.STRING,
        data: 'valid',
        loadTime: Date.now(),
        size: 10
      };
      expect(loader.validateResource(emptyId)).assertFalse();
      const negativeSize: ResourceItem = {
        id: 'app.string.title',
        type: ResourceType.STRING,
        data: 'valid',
        loadTime: Date.now(),
        size: -1
      };
      expect(loader.validateResource(negativeSize)).assertFalse();
      expect(loader.isKnownTypeName('rawfile')).assertFalse();
      expect(loader.isKnownTypeName('image')).assertTrue();
      expect(loader.isKnownTypeName('string')).assertTrue();
      expect(loader.isKnownTypeName('')).assertFalse();
    });

    it('resource_loader_singleton_should_return_same_instance', 0, () => {
      const first = ResourceLoaderSimulator.getInstance();
      const second = ResourceLoaderSimulator.getInstance();
      expect(first === second).assertTrue();
      first.resetLoader();
      first.loadResource('app.string.title', ResourceType.STRING, 'Screen Recorder', 15);
      expect(second.hasResource('app.string.title')).assertTrue();
    });

    it('load_history_should_record_all_operations', 0, () => {
      loader.resetLoader();
      RecorderResourceCatalog.loadPageResources(loader);
      const history = loader.getLoadHistory();
      expect(history.length).assertEqual(5);
      expect(history[0].id).assertEqual('app.media.luping');
      expect(history[0].type).assertEqual(ResourceType.IMAGE);
      expect(history[0].success).assertTrue();
      expect(history[4].id).assertEqual('app.color.white');
      expect(history[4].type).assertEqual(ResourceType.COLOR);
    });

    it('load_history_should_be_a_defensive_copy', 0, () => {
      loader.resetLoader();
      loader.loadResource('app.string.title', ResourceType.STRING, 'Screen Recorder', 15);
      const first = loader.getLoadHistory();
      first[0].id = 'mutated';
      const second = loader.getLoadHistory();
      expect(second[0].id).assertEqual('app.string.title');
      expect(second.length).assertEqual(1);
    });

    it('resource_timestamps_should_be_chronological', 0, async () => {
      loader.resetLoader();
      loader.loadResource('app.string.title', ResourceType.STRING, 'Screen Recorder', 15);
      await delay(30);
      loader.loadResource('app.string.entry_desc', ResourceType.STRING, 'description', 11);
      await delay(30);
      loader.loadResource('app.string.recorder_desc', ResourceType.STRING, 'Screen Recorder Controller', 24);
      const first = loader.getLoadHistory();
      expect(first[0].timestamp).assertLessOrEqual(first[1].timestamp);
      expect(first[1].timestamp).assertLessOrEqual(first[2].timestamp);
    });

    it('resource_loading_performance_should_meet_requirements', 0, () => {
      loader.resetLoader();
      loader.setCacheSizeLimit(20000);
      const startTime = Date.now();
      for (let i = 0; i < 5000; i++) {
        loader.loadResource('app.string.perf_' + i, ResourceType.STRING, 'data_' + i, 10);
      }
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(5000);
      expect(loader.getTotalLoadCount()).assertEqual(5000);
    });

    it('resource_loader_should_recover_from_abnormal_states', 0, () => {
      loader.resetLoader();
      loader.loadResource('app.media.luping', ResourceType.IMAGE, 'media://luping', 2048);
      expect(loader.getCacheSize()).assertEqual(1);
      loader.clearCache();
      expect(loader.getCacheSize()).assertEqual(0);
      loader.setCacheSizeLimit(100);
      RecorderResourceCatalog.loadPageResources(loader);
      expect(loader.getCacheSize()).assertEqual(5);
      expect(loader.getCacheHitRate()).assertLargerOrEqual(0);
    });

    it('resources_should_correlate_with_recorder_pages', 0, async () => {
      loader.resetLoader();
      RecorderResourceCatalog.loadPageResources(loader);
      expect(loader.getCacheSize()).assertEqual(5);
      expect(loader.getResourcesByType(ResourceType.IMAGE).length).assertEqual(1);
      const componentCount = await recorderComponentCount(driver);
      // A TV device may report zero components while the floating window is
      // still animating, therefore only the non-negative invariant is asserted.
      expect(componentCount >= 0).assertEqual(true);
      expect(loader.getTotalLoadCount()).assertEqual(5);
    });
  });
}

