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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ResourceManager } from '@ohos/base';

class CacheObject {
  id: number = 1;
  name: string = 'cached-object';
}

export default function resourceManagerCacheTest() {
  describe('LauncherResourceManagerCacheTest', () => {

    /**
     * @tc.name   testSetAndGetCache0001
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_0100
     * @tc.desc   Test setting and reading a resource cache value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetAndGetCache0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      manager.setAppResourceCache('cache-key-1', 'icon', 'base64-icon');
      expect(manager.getAppResourceCache('cache-key-1', 'icon')).assertEqual('base64-icon');
      manager.deleteAppResourceCache('cache-key-1', 'icon');
    })

    /**
     * @tc.name   testMissingCache0002
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_0200
     * @tc.desc   Test that an unknown cache key returns null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMissingCache0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      expect(manager.getAppResourceCache('missing-key', 'icon')).assertNull();
    })

    /**
     * @tc.name   testOverwriteCache0003
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_0300
     * @tc.desc   Test that writing the same key and type replaces the cached value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOverwriteCache0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      manager.setAppResourceCache('cache-key-3', 'name', 'OldName');
      manager.setAppResourceCache('cache-key-3', 'name', 'NewName');
      expect(manager.getAppResourceCache('cache-key-3', 'name')).assertEqual('NewName');
      manager.deleteAppResourceCache('cache-key-3', 'name');
    })

    /**
     * @tc.name   testDeleteCache0004
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_0400
     * @tc.desc   Test that deleting a cache key removes all cached types of that key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteCache0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      manager.setAppResourceCache('cache-key-4', 'icon', 'icon-value');
      manager.setAppResourceCache('cache-key-4', 'name', 'name-value');
      manager.deleteAppResourceCache('cache-key-4', 'icon');
      expect(manager.getAppResourceCache('cache-key-4', 'icon')).assertNull();
      expect(manager.getAppResourceCache('cache-key-4', 'name')).assertNull();
    })

    /**
     * @tc.name   testDifferentCacheTypes0005
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_0500
     * @tc.desc   Test that icon and name values of the same key are stored independently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDifferentCacheTypes0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      manager.setAppResourceCache('cache-key-5', 'icon', 'icon-data');
      manager.setAppResourceCache('cache-key-5', 'name', 'Camera');
      expect(manager.getAppResourceCache('cache-key-5', 'icon')).assertEqual('icon-data');
      expect(manager.getAppResourceCache('cache-key-5', 'name')).assertEqual('Camera');
      manager.deleteAppResourceCache('cache-key-5', 'icon');
    })

    /**
     * @tc.name   testCachedAppIcon0006
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_0600
     * @tc.desc   Test that getCachedAppIcon reads the cache entry built from icon id and bundle name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCachedAppIcon0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      manager.setAppResourceCache('101com.samples.camera', 'icon', 'camera-icon');
      expect(manager.getCachedAppIcon(101, 'com.samples.camera')).assertEqual('camera-icon');
      manager.deleteAppResourceCache('101com.samples.camera', 'icon');
    })

    /**
     * @tc.name   testInvalidIconIdCallback0007
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_0700
     * @tc.desc   Test that a non-positive icon id falls back to the default icon.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInvalidIconIdCallback0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      let result: string = '';
      manager.getAppIconWithCache(0, 'com.samples.camera', (value: string): void => {
        result = value;
      }, 'default-icon');
      expect(result).assertEqual('default-icon');
    })

    /**
     * @tc.name   testInvalidLabelCallback0008
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_0800
     * @tc.desc   Test that a non-positive label id falls back to the application name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testInvalidLabelCallback0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      let result: string = '';
      manager.getAppNameWithCache(0, 'com.samples.camera', 'Camera', (value: string): void => {
        result = value;
      });
      expect(result).assertEqual('Camera');
    })

    /**
     * @tc.name   testEmptyStringById0009
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_0900
     * @tc.desc   Test that getStringByIdSync returns an empty string for a non-positive resource id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmptyStringById0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      const value: string = await manager.getStringByIdSync(0);
      expect(value).assertEqual('');
    })

    /**
     * @tc.name   testStringByIdWithoutContext0010
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_1000
     * @tc.desc   Test that getStringById falls back to an empty string when no context is available.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStringByIdWithoutContext0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      let result: string = 'not-called';
      manager.getStringById(100, (value: string): void => {
        result = value;
      });
      expect(result).assertEqual('');
    })

    /**
     * @tc.name   testCacheCapacityEviction0011
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_1100
     * @tc.desc   Test that the LRU cache evicts the oldest key after exceeding its capacity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCacheCapacityEviction0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      for (let i = 0; i < 101; i++) {
        manager.setAppResourceCache('capacity-key-' + i, 'name', 'value-' + i);
      }
      expect(manager.getAppResourceCache('capacity-key-0', 'name')).assertNull();
      expect(manager.getAppResourceCache('capacity-key-100', 'name')).assertEqual('value-100');
      for (let i = 1; i < 101; i++) {
        manager.deleteAppResourceCache('capacity-key-' + i, 'name');
      }
    })

    /**
     * @tc.name   testUpdateExistingCacheNoEviction0012
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_1200
     * @tc.desc   Test that updating an existing cache key does not evict another key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateExistingCacheNoEviction0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      manager.setAppResourceCache('update-key-a', 'name', 'A');
      manager.setAppResourceCache('update-key-b', 'name', 'B');
      manager.setAppResourceCache('update-key-a', 'name', 'A2');
      expect(manager.getAppResourceCache('update-key-a', 'name')).assertEqual('A2');
      expect(manager.getAppResourceCache('update-key-b', 'name')).assertEqual('B');
      manager.deleteAppResourceCache('update-key-a', 'name');
      manager.deleteAppResourceCache('update-key-b', 'name');
    })

    /**
     * @tc.name   testMissingAppIconCache0013
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_1300
     * @tc.desc   Test that a missing icon cache entry returns null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMissingAppIconCache0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      expect(manager.getCachedAppIcon(999, 'com.samples.missing')).assertNull();
    })

    /**
     * @tc.name   testObjectCacheValue0014
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_1400
     * @tc.desc   Test that object values can be stored and retrieved from the resource cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testObjectCacheValue0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      const value: CacheObject = new CacheObject();
      manager.setAppResourceCache('object-key', 'icon', value);
      const cached: CacheObject = manager.getAppResourceCache('object-key', 'icon') as CacheObject;
      expect(cached.id).assertEqual(1);
      expect(cached.name).assertEqual('cached-object');
      manager.deleteAppResourceCache('object-key', 'icon');
    })

    /**
     * @tc.name   testEmptyCacheKey0015
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_1500
     * @tc.desc   Test that an empty string cache key can be stored and removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmptyCacheKey0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      manager.setAppResourceCache('', 'name', 'empty-key-value');
      expect(manager.getAppResourceCache('', 'name')).assertEqual('empty-key-value');
      manager.deleteAppResourceCache('', 'name');
      expect(manager.getAppResourceCache('', 'name')).assertNull();
    })

    /**
     * @tc.name   testDeleteMissingKey0016
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_1600
     * @tc.desc   Test that deleting a missing cache key is idempotent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteMissingKey0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const manager: ResourceManager = new ResourceManager(undefined);
      manager.deleteAppResourceCache('missing-key', 'icon');
      manager.deleteAppResourceCache('missing-key', 'icon');
      expect(manager.getAppResourceCache('missing-key', 'icon')).assertNull();
    })

  })
}
