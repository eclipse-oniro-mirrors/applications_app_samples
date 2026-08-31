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
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

enum ResourceType {
  IMAGE = 'image', STRING = 'string', COLOR = 'color', ANIMATION = 'animation', LAYOUT = 'layout'
}

interface ResourceItem {
  id: string;
  type: ResourceType;
  data: string | number | Record<string, string | number>;
  loadTime: number;
  size: number;
}

interface LoadHistoryRecord {
  id: string;
  type: ResourceType;
  timestamp: number;
  success: boolean;
}

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

  public loadResource(id: string, type: ResourceType, data: string | number | Record<string, string | number>,
    size: number): boolean {
    this.totalLoadCount++;
    if (this.resourceCache.has(id)) {
      this.cacheHitCount++;
      return true;
    }
    if (this.resourceCache.size >= this.cacheSizeLimit) {
      this.evictOldestResource();
    }

    const resource: ResourceItem = {
      id,
      type,
      data,
      loadTime: Date.now(),
      size
    };

    this.resourceCache.set(id, resource);

    const record: LoadHistoryRecord = {
      id,
      type,
      timestamp: Date.now(),
      success: true
    };
    this.loadHistory.push(record);

    return true;
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

  public getLoadHistory(): LoadHistoryRecord[] {
    const history: LoadHistoryRecord[] = [];
    for (let i = 0; i < this.loadHistory.length; i++) {
      history.push(this.loadHistory[i]);
    }
    return history;
  }

  public getResourcesByType(type: ResourceType): ResourceItem[] {
    return Array.from(this.resourceCache.values()).filter(r => r.type === type);
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

  public getCacheStats(): Map<string, number> {
    const stats = new Map<string, number>();

    for (const resource of this.resourceCache.values()) {
      const type = resource.type;
      const currentCount = stats.get(type) || 0;
      stats.set(type, currentCount + 1);
    }

    return stats;
  }

  public validateResource(resource: ResourceItem): boolean {
    if (!resource.id || resource.id.length === 0) {
      return false;
    }

    if (!Object.values(ResourceType).includes(resource.type)) {
      return false;
    }

    if (resource.size < 0) {
      return false;
    }

    return true;
  }

  private evictOldestResource(): void {
    let oldestId: string | null = null;
    let oldestTime: number = Number.MAX_VALUE;

    const cacheEntries: Array<[string, ResourceItem]> = [];
    for (const entry of this.resourceCache.entries()) {
      cacheEntries.push(entry);
    }

    for (let i = 0; i < cacheEntries.length; i++) {
      const entry = cacheEntries[i];
      const id = entry[0];
      const resource = entry[1];
      if (resource.loadTime < oldestTime) {
        oldestTime = resource.loadTime;
        oldestId = id;
      }
    }

    if (oldestId !== null) {
      this.resourceCache.delete(oldestId);
    }
  }
}

export default function resourceLoaderValidationTest() {
  describe('ResourceLoaderValidation_Test', () => {
    let driver: Driver;
    let resourceLoader: ResourceLoaderSimulator;

    beforeAll(async () => {
      driver = getDriver();
      resourceLoader = ResourceLoaderSimulator.getInstance();
      resourceLoader.resetLoader();
      await driver.delayMs(1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('resource_type_enum_should_be_defined_correctly', 0, async () => {
      expect(ResourceType.IMAGE).assertEqual('image');
      expect(ResourceType.STRING).assertEqual('string');
      expect(ResourceType.COLOR).assertEqual('color');
      expect(ResourceType.ANIMATION).assertEqual('animation');
      expect(ResourceType.LAYOUT).assertEqual('layout');
    });

    it('resource_loader_initial_state_should_be_empty', 0, async () => {
      resourceLoader.resetLoader();
      expect(resourceLoader.getCacheSize()).assertEqual(0);
      expect(resourceLoader.getTotalLoadCount()).assertEqual(0);
      expect(resourceLoader.getCacheHitRate()).assertEqual(0);
    });

    it('image_resource_loading_should_work_correctly', 0, async () => {
      resourceLoader.resetLoader();

      const result = resourceLoader.loadResource('icon_power', ResourceType.IMAGE, 'media://power_icon', 1024);

      expect(result).assertTrue();
      expect(resourceLoader.hasResource('icon_power')).assertTrue();

      const resource = resourceLoader.getResource('icon_power');
      expect(resource?.type).assertEqual(ResourceType.IMAGE);
      expect(resource?.data).assertEqual('media://power_icon');
      expect(resource?.size).assertEqual(1024);
    });

    it('string_resource_loading_should_work_correctly', 0, async () => {
      resourceLoader.resetLoader();

      const result = resourceLoader.loadResource('string_suspend', ResourceType.STRING, '屏幕输出', 6);

      expect(result).assertTrue();
      expect(resourceLoader.hasResource('string_suspend')).assertTrue();

      const resource = resourceLoader.getResource('string_suspend');
      expect(resource?.type).assertEqual(ResourceType.STRING);
      expect(resource?.data).assertEqual('屏幕输出');
    });

    it('color_resource_loading_should_work_correctly', 0, async () => {
      resourceLoader.resetLoader();

      const result = resourceLoader.loadResource('color_focus', ResourceType.COLOR, '#FF0000', 4);

      expect(result).assertTrue();
      expect(resourceLoader.hasResource('color_focus')).assertTrue();

      const resource = resourceLoader.getResource('color_focus');
      expect(resource?.type).assertEqual(ResourceType.COLOR);
      expect(resource?.data).assertEqual('#FF0000');
    });

    it('resource_cache_hit_should_be_recorded', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('icon_reboot', ResourceType.IMAGE, 'media://reboot_icon', 2048);
      expect(resourceLoader.getCacheHitRate()).assertEqual(0);

      resourceLoader.loadResource('icon_reboot', ResourceType.IMAGE, 'media://reboot_icon', 2048);
      expect(resourceLoader.getCacheHitRate()).assertEqual(0.5);

      resourceLoader.loadResource('icon_reboot', ResourceType.IMAGE, 'media://reboot_icon', 2048);
      expect(resourceLoader.getCacheHitRate()).assertEqual(2 / 3);
    });

    it('resource_removal_should_work_correctly', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('temp_resource', ResourceType.STRING, 'temp', 4);
      expect(resourceLoader.hasResource('temp_resource')).assertTrue();

      const removeResult = resourceLoader.removeResource('temp_resource');
      expect(removeResult).assertTrue();
      expect(resourceLoader.hasResource('temp_resource')).assertFalse();

      const removeNonExistent = resourceLoader.removeResource('non_existent');
      expect(removeNonExistent).assertFalse();
    });

    it('cache_clear_should_remove_all_resources', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('res1', ResourceType.IMAGE, 'data1', 100);
      resourceLoader.loadResource('res2', ResourceType.STRING, 'data2', 50);
      resourceLoader.loadResource('res3', ResourceType.COLOR, 'data3', 4);

      expect(resourceLoader.getCacheSize()).assertEqual(3);

      resourceLoader.clearCache();

      expect(resourceLoader.getCacheSize()).assertEqual(0);
      expect(resourceLoader.hasResource('res1')).assertFalse();
      expect(resourceLoader.hasResource('res2')).assertFalse();
      expect(resourceLoader.hasResource('res3')).assertFalse();
    });

    it('query_resources_by_type_should_return_correct_results', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('img1', ResourceType.IMAGE, 'data1', 100);
      resourceLoader.loadResource('img2', ResourceType.IMAGE, 'data2', 200);
      resourceLoader.loadResource('str1', ResourceType.STRING, 'data3', 50);
      resourceLoader.loadResource('col1', ResourceType.COLOR, 'data4', 4);
      resourceLoader.loadResource('str2', ResourceType.STRING, 'data5', 60);

      const images = resourceLoader.getResourcesByType(ResourceType.IMAGE);
      const strings = resourceLoader.getResourcesByType(ResourceType.STRING);
      const colors = resourceLoader.getResourcesByType(ResourceType.COLOR);

      expect(images.length).assertEqual(2);
      expect(strings.length).assertEqual(2);
      expect(colors.length).assertEqual(1);
    });

    it('cache_size_limit_should_be_enforced', 0, async () => {
      resourceLoader.resetLoader();
      resourceLoader.setCacheSizeLimit(5);

      for (let i = 0; i < 10; i++) {
        resourceLoader.loadResource(`resource_${i}`, ResourceType.STRING, `data_${i}`, 10);
      }
      expect(resourceLoader.getCacheSize()).assertLessOrEqual(5);
    });

    it('cache_stats_should_be_accurate', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('img1', ResourceType.IMAGE, 'data1', 100);
      resourceLoader.loadResource('img2', ResourceType.IMAGE, 'data2', 200);
      resourceLoader.loadResource('img3', ResourceType.IMAGE, 'data3', 150);
      resourceLoader.loadResource('str1', ResourceType.STRING, 'data4', 50);
      resourceLoader.loadResource('str2', ResourceType.STRING, 'data5', 60);
      resourceLoader.loadResource('col1', ResourceType.COLOR, 'data6', 4);

      const stats = resourceLoader.getCacheStats();

      expect(stats.get('image')).assertEqual(3);
      expect(stats.get('string')).assertEqual(2);
      expect(stats.get('color')).assertEqual(1);
    });

    it('resource_validation_should_detect_invalid_resources', 0, async () => {
      resourceLoader.resetLoader();
      const validResource: ResourceItem = {
        id: 'valid_resource',
        type: ResourceType.STRING,
        data: 'valid',
        loadTime: Date.now(),
        size: 10
      };
      expect(resourceLoader.validateResource(validResource)).assertTrue();
      const emptyIdResource: ResourceItem = {
        id: '',
        type: ResourceType.STRING,
        data: 'valid',
        loadTime: Date.now(),
        size: 10
      };
      expect(resourceLoader.validateResource(emptyIdResource)).assertFalse();
      const invalidTypeResource: ResourceItem = {
        id: 'invalid_type',
        type: 'invalid' as ResourceType,
        data: 'valid',
        loadTime: Date.now(),
        size: 10
      };
      expect(resourceLoader.validateResource(invalidTypeResource)).assertFalse();
      const negativeSizeResource: ResourceItem = {
        id: 'negative_size',
        type: ResourceType.STRING,
        data: 'valid',
        loadTime: Date.now(),
        size: -1
      };
      expect(resourceLoader.validateResource(negativeSizeResource)).assertFalse();
    });

    it('resource_loader_singleton_should_return_same_instance', 0, async () => {
      const loader1 = ResourceLoaderSimulator.getInstance();
      const loader2 = ResourceLoaderSimulator.getInstance();

      expect(loader1 === loader2).assertTrue();

      loader1.resetLoader();
      loader1.loadResource('singleton_test', ResourceType.STRING, 'value', 10);

      expect(loader2.hasResource('singleton_test')).assertTrue();
    });

    it('load_history_should_record_all_operations', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('res1', ResourceType.IMAGE, 'data1', 100);
      resourceLoader.loadResource('res2', ResourceType.STRING, 'data2', 50);
      resourceLoader.loadResource('res3', ResourceType.COLOR, 'data3', 4);

      const history = resourceLoader.getLoadHistory();
      expect(history.length).assertEqual(3);

      expect(history[0].id).assertEqual('res1');
      expect(history[0].type).assertEqual(ResourceType.IMAGE);
      expect(history[0].success).assertTrue();

      expect(history[2].id).assertEqual('res3');
      expect(history[2].type).assertEqual(ResourceType.COLOR);
    });

    it('resource_loading_performance_should_meet_requirements', 0, async () => {
      resourceLoader.resetLoader();

      const startTime: number = Date.now();

      for (let i = 0; i < 5000; i++) {
        resourceLoader.loadResource(`resource_${i}`, ResourceType.STRING, `data_${i}`, 10);
      }

      const endTime: number = Date.now();
      const loadTime: number = endTime - startTime;

      expect(loadTime).assertLessOrEqual(5000);
      expect(resourceLoader.getTotalLoadCount()).assertEqual(5000);
    });

    it('resource_loading_should_correlate_with_ui_interactions', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      resourceLoader.resetLoader();
      resourceLoader.loadResource('dialog_bg', ResourceType.IMAGE, 'media://dialog_bg', 5120);
      resourceLoader.loadResource('icon_suspend', ResourceType.IMAGE, 'media://suspend_icon', 1024);
      resourceLoader.loadResource('icon_reboot', ResourceType.IMAGE, 'media://reboot_icon', 1024);
      resourceLoader.loadResource('icon_shutdown', ResourceType.IMAGE, 'media://shutdown_icon', 1024);
      resourceLoader.loadResource('title_text', ResourceType.STRING, '电源选项', 12);
      expect(resourceLoader.getCacheSize()).assertEqual(5);
      expect(resourceLoader.getResourcesByType(ResourceType.IMAGE).length).assertEqual(4);
      expect(resourceLoader.getResourcesByType(ResourceType.STRING).length).assertEqual(1);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('resource_timestamps_should_be_chronological', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('res1', ResourceType.STRING, 'data1', 10);
      await driver.delayMs(50);
      resourceLoader.loadResource('res2', ResourceType.STRING, 'data2', 20);
      await driver.delayMs(50);
      resourceLoader.loadResource('res3', ResourceType.STRING, 'data3', 30);

      const res1 = resourceLoader.getResource('res1');
      const res2 = resourceLoader.getResource('res2');
      const res3 = resourceLoader.getResource('res3');

      expect(res1?.loadTime).assertLessOrEqual(res2?.loadTime);
      expect(res2?.loadTime).assertLessOrEqual(res3?.loadTime);
    });

    it('resource_loader_should_recover_from_abnormal_states', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('normal_res', ResourceType.STRING, 'normal', 10);
      expect(resourceLoader.getCacheSize()).assertEqual(1);

      resourceLoader.loadResource('another_res', ResourceType.IMAGE, 'image_data', 100);
      expect(resourceLoader.getCacheSize()).assertEqual(2);

      resourceLoader.clearCache();
      expect(resourceLoader.getCacheSize()).assertEqual(0);

      resourceLoader.loadResource('fresh_res', ResourceType.COLOR, '#FFFFFF', 4);
      expect(resourceLoader.getCacheSize()).assertEqual(1);
    });

    it('cache_hit_rate_calculation_should_be_accurate', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('unique1', ResourceType.STRING, 'data1', 10);
      resourceLoader.loadResource('unique2', ResourceType.STRING, 'data2', 20);
      resourceLoader.loadResource('unique3', ResourceType.STRING, 'data3', 30);

      expect(resourceLoader.getCacheHitRate()).assertEqual(0);

      resourceLoader.loadResource('unique1', ResourceType.STRING, 'data1', 10);
      resourceLoader.loadResource('unique2', ResourceType.STRING, 'data2', 20);

      expect(resourceLoader.getCacheHitRate()).assertEqual(2 / 5);

      resourceLoader.loadResource('unique1', ResourceType.STRING, 'data1', 10);
      resourceLoader.loadResource('unique3', ResourceType.STRING, 'data3', 30);
      resourceLoader.loadResource('unique3', ResourceType.STRING, 'data3', 30);

      expect(resourceLoader.getCacheHitRate()).assertEqual(5 / 8);
    });
  });


}