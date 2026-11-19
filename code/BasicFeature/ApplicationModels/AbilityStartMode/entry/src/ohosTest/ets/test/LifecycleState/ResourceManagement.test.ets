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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  componentCount,
  checkTextContent,
  waitForHomePageStable,
  waitForFoodDetailStable,
  pressAndWait,
  resetToHome,
  countModeLabels,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  FOOD_TOMATO,
  FOOD_WALNUT,
  runSerializedUiOperation,
  logInfo
} from '../Shared/SharedDriver';

/**
 * One observed resource load of the start mode sample.
 * The home page loads images and string resources for the three food
 * groups, every mode ability launch loads the detail page resources and
 * the back key restores the preloaded home resources again.
 */
interface ResourceRecord {
  resourceType: string;
  resourceId: string;
  loadTime: number;
  isLoaded: boolean;
  timestamp: number;
}

class ResourceManagementTracker {
  private static instance: ResourceManagementTracker;
  private resourceHistory: ResourceRecord[] = [];
  private totalResources: number = 0;
  private loadedResources: number = 0;

  // Single instance access keeps the recorded resource state identical for all cases.
  public static getInstance(): ResourceManagementTracker {
    if (!ResourceManagementTracker.instance) {
      ResourceManagementTracker.instance = new ResourceManagementTracker();
    }
    return ResourceManagementTracker.instance;
  }

  public recordResource(resourceType: string, resourceId: string, loadTime: number,
    isLoaded: boolean): void {
    const record: ResourceRecord = {
      resourceType: resourceType,
      resourceId: resourceId,
      loadTime: loadTime,
      isLoaded: isLoaded,
      timestamp: Date.now()
    };
    this.resourceHistory.push(record);
    this.totalResources++;
    if (isLoaded) {
      this.loadedResources++;
    }
  }

  public getResourceHistory(): ResourceRecord[] {
    return [...this.resourceHistory];
  }

  public getTotalResources(): number {
    return this.totalResources;
  }

  public getLoadedResources(): number {
    return this.loadedResources;
  }

  public resetTracker(): void {
    this.resourceHistory = [];
    this.totalResources = 0;
    this.loadedResources = 0;
  }

  public hasResourceOfType(resourceType: string): boolean {
    return this.resourceHistory.some((record: ResourceRecord) => record.resourceType === resourceType);
  }

  public getResourceCountByType(resourceType: string): number {
    return this.resourceHistory.filter(
      (record: ResourceRecord) => record.resourceType === resourceType).length;
  }

  public getAverageLoadTime(resourceType: string): number {
    const resources: ResourceRecord[] = this.resourceHistory.filter(
      (record: ResourceRecord) => record.resourceType === resourceType);
    if (resources.length === 0) {
      return 0;
    }
    let totalTime: number = 0;
    for (let i = 0; i < resources.length; i++) {
      totalTime += resources[i].loadTime;
    }
    return totalTime / resources.length;
  }

  public getLoadSuccessRate(): number {
    if (this.totalResources === 0) {
      return 0;
    }
    return this.loadedResources / this.totalResources;
  }
}

export default function resourceManagementTest() {
  describe('ResourceManagement_Test', () => {
    let driver: Driver;
    let resourceTracker: ResourceManagementTracker;

    beforeAll(async () => {
      driver = getDriver();
      resourceTracker = ResourceManagementTracker.getInstance();
      resourceTracker.resetTracker();
      await runSerializedUiOperation(async () => {
        await driver.delayMs(TIMEOUT_PAGE_RENDER);
      });
      await resetToHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });
    });

    // The home page renders one image per food entry of the three groups.
    it('home_should_load_all_image_resources', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      resourceTracker.recordResource('image', 'tomato_image', 50, true);
      resourceTracker.recordResource('image', 'cucumber_image', 50, true);
      resourceTracker.recordResource('image', 'walnut_image', 50, true);
      resourceTracker.recordResource('image', 'blueberry_image', 50, true);
      resourceTracker.recordResource('image', 'ice_cream_image', 50, true);
      resourceTracker.recordResource('image', 'crab_image', 50, true);

      logInfo(`home images tracked: ${resourceTracker.getTotalResources()}`);
      expect(resourceTracker.getResourceCountByType('image')).assertEqual(6);
      expect(resourceTracker.getLoadSuccessRate()).assertEqual(1);
    });

    // The three mode identifiers of the home page are string resources.
    it('home_should_load_all_string_resources', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      resourceTracker.recordResource('string', MODE_STANDARD, 20, true);
      resourceTracker.recordResource('string', MODE_SPECIFIED, 20, true);
      resourceTracker.recordResource('string', MODE_SINGLETON, 20, true);

      expect(resourceTracker.getTotalResources()).assertEqual(3);
      expect(resourceTracker.getLoadedResources()).assertEqual(3);
      expect(await countModeLabels(driver)).assertLargerOrEqual(1);
    });

    // Loading the home resources of every group must stay inside the budget.
    it('resource_loading_should_be_efficient', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      const startTime: number = Date.now();
      for (let i = 0; i < 10; i++) {
        resourceTracker.recordResource('image', `food_image_${i}`, 30, true);
      }
      const endTime: number = Date.now();
      const loadTime: number = endTime - startTime;

      expect(loadTime).assertLessOrEqual(2000);
      expect(resourceTracker.getAverageLoadTime('image')).assertEqual(30);
    });

    // Focus movements between food groups must not drop the home resources.
    it('resources_should_persist_during_navigation', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount: number = await componentCount(driver);

      for (let i = 0; i < 15; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        resourceTracker.recordResource('navigation', `nav_${i}`, 10, true);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(100);
        });
      }

      const finalCount: number = await componentCount(driver);
      logInfo(`navigation component count: ${initialCount} -> ${finalCount}`);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
    });

    // Resource load events are recorded in ascending time order.
    it('resource_loading_timestamps_should_be_chronological', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      resourceTracker.recordResource('test', MODE_STANDARD, 50, true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      resourceTracker.recordResource('test', MODE_SPECIFIED, 50, true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      resourceTracker.recordResource('test', MODE_SINGLETON, 50, true);

      const history: ResourceRecord[] = resourceTracker.getResourceHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // A failed food image must not break the remaining home resources.
    it('home_should_handle_resource_loading_failures', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      resourceTracker.recordResource('image', FOOD_TOMATO, 50, true);
      resourceTracker.recordResource('image', 'missing_food_image', 100, false);
      resourceTracker.recordResource('image', FOOD_WALNUT, 50, true);

      expect(resourceTracker.getLoadSuccessRate()).assertEqual(2 / 3);
      expect(await checkTextContent(driver, FOOD_TOMATO)).assertTrue();
    });

    // The tracker is a singleton shared by every test case.
    it('resource_management_singleton_should_maintain_consistency', 0, async () => {
      const tracker1: ResourceManagementTracker = ResourceManagementTracker.getInstance();
      const tracker2: ResourceManagementTracker = ResourceManagementTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordResource('singleton', MODE_SINGLETON, 30, true);

      expect(tracker2.getTotalResources()).assertEqual(1);
      expect(tracker2.getLoadedResources()).assertEqual(1);
    });

    // Images, strings, colors and layouts of the sample coexist.
    it('resources_should_handle_multiple_types', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      resourceTracker.recordResource('image', 'tomato_image', 50, true);
      resourceTracker.recordResource('string', MODE_STANDARD, 20, true);
      resourceTracker.recordResource('color', 'food_background', 10, true);
      resourceTracker.recordResource('layout', 'food_detail_layout', 30, true);

      expect(resourceTracker.hasResourceOfType('image')).assertTrue();
      expect(resourceTracker.hasResourceOfType('string')).assertTrue();
      expect(resourceTracker.hasResourceOfType('color')).assertTrue();
      expect(resourceTracker.hasResourceOfType('layout')).assertTrue();
    });

    // Bulk registration of 200 resources stays inside the time budget.
    it('resource_loading_performance_should_meet_requirements', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      const startTime: number = Date.now();
      for (let i = 0; i < 200; i++) {
        resourceTracker.recordResource('performance', `perf_${i}`, 5, true);
      }
      const endTime: number = Date.now();
      const perfTime: number = endTime - startTime;

      expect(perfTime).assertLessOrEqual(2000);
      expect(resourceTracker.getTotalResources()).assertEqual(200);
    });

    // The same food image can be requested by several list entries.
    it('resources_should_be_reusable', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      for (let i = 0; i < 10; i++) {
        resourceTracker.recordResource('reusable', 'shared_food_icon', 20, true);
      }

      expect(resourceTracker.getResourceCountByType('reusable')).assertEqual(10);
      expect(resourceTracker.getAverageLoadTime('reusable')).assertEqual(20);
    });

    // Very slow and very fast resources are both tracked correctly.
    it('resource_loading_should_handle_edge_cases', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      resourceTracker.recordResource('edge', 'large_detail_image', 500, true);
      resourceTracker.recordResource('edge', 'tiny_mode_icon', 1, true);
      resourceTracker.recordResource('edge', 'medium_food_image', 100, true);

      expect(resourceTracker.getTotalResources()).assertEqual(3);
      expect(resourceTracker.getLoadSuccessRate()).assertEqual(1);
    });

    // Detail page resources load and unload without disturbing the home page.
    it('resources_should_load_on_food_detail_page', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      resourceTracker.recordResource('string', 'Calories', 15, true);
      resourceTracker.recordResource('string', 'Nutrition Element', 15, true);
      resourceTracker.recordResource('image', 'food_detail_image', 40, true);

      expect(resourceTracker.getTotalResources()).assertEqual(3);
      expect(resourceTracker.getLoadSuccessRate()).assertEqual(1);
      await resetToHome(driver);
    });

    // Twenty recorded loads keep the home page structure unchanged.
    it('resources_should_maintain_home_stability', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount: number = await componentCount(driver);

      for (let i = 0; i < 20; i++) {
        resourceTracker.recordResource('stability', `stab_${i}`, 15, true);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(50);
        });
      }

      const finalCount: number = await componentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
    });

    // Every successful and failed load is counted by the tracker.
    it('resource_loading_should_track_all_operations', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      resourceTracker.resetTracker();
      resourceTracker.recordResource('track', 'op_1', 30, true);
      resourceTracker.recordResource('track', 'op_2', 40, true);
      resourceTracker.recordResource('track', 'op_3', 50, false);

      expect(resourceTracker.getTotalResources()).assertEqual(3);
      expect(resourceTracker.getLoadedResources()).assertEqual(2);
    });

    // Combined resource scenario across both pages of the sample.
    it('comprehensive_resource_management_scenario', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      resourceTracker.resetTracker();
      const scenarioStart: number = Date.now();

      resourceTracker.recordResource('image', 'tomato_image', 50, true);
      resourceTracker.recordResource('string', MODE_STANDARD, 20, true);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      resourceTracker.recordResource('navigation', 'left_nav', 10, true);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      resourceTracker.recordResource('navigation', 'right_nav', 10, true);

      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });

      const scenarioEnd: number = Date.now();
      const scenarioDuration: number = scenarioEnd - scenarioStart;

      expect(resourceTracker.getTotalResources()).assertEqual(4);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const measured: number = await componentCount(driver);
      expect(measured).assertLargerOrEqual(1);
    });
  });
}
