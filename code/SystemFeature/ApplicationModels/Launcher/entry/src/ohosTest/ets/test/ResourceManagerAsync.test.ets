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

class FakeResourceManager {
  getMediaBase64(iconId: number): Promise<string> {
    return Promise.resolve('icon-' + iconId);
  }

  getString(labelId: number): Promise<string> {
    return Promise.resolve('name-' + labelId);
  }
}

class FakeBundleContext {
  resourceManager: FakeResourceManager = new FakeResourceManager();
}

class FakeContext {
  resourceManager: FakeResourceManager = new FakeResourceManager();

  createBundleContext(bundleName: string): FakeBundleContext {
    return new FakeBundleContext();
  }
}

class ThrowingContext {
  resourceManager: FakeResourceManager = new FakeResourceManager();

  createBundleContext(bundleName: string): FakeBundleContext {
    throw new Error('no bundle context');
  }
}

class EmptyNameResourceManager {
  getMediaBase64(iconId: number): Promise<string> {
    return Promise.resolve('icon-' + iconId);
  }

  getString(labelId: number): Promise<string> {
    return Promise.resolve('');
  }
}

class EmptyNameBundleContext {
  resourceManager: EmptyNameResourceManager = new EmptyNameResourceManager();
}

class EmptyNameContext {
  resourceManager: EmptyNameResourceManager = new EmptyNameResourceManager();

  createBundleContext(bundleName: string): EmptyNameBundleContext {
    return new EmptyNameBundleContext();
  }
}

export default function resourceManagerAsyncTest() {
  describe('LauncherResourceManagerAsyncTest', () => {

    /**
     * @tc.name   testStringByIdSyncWithContext0001
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_0100
     * @tc.desc   Test that getStringByIdSync reads a resource string from the bundle context.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStringByIdSyncWithContext0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new FakeContext());
      const value: string = await manager.getStringByIdSync(10);
      expect(value).assertEqual('name-10');
    })

    /**
     * @tc.name   testAppNameSyncWithContext0002
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_0200
     * @tc.desc   Test that getAppNameSync returns the resource string for a valid label id.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppNameSyncWithContext0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new FakeContext());
      const value: string = await manager.getAppNameSync(11, 'com.samples.camera', 'Fallback');
      expect(value).assertEqual('name-11');
    })

    /**
     * @tc.name   testStringByIdCallback0003
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_0300
     * @tc.desc   Test the asynchronous getStringById callback with a fake resource manager.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStringByIdCallback0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new FakeContext());
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        manager.getStringById(12, (value: string): void => {
          resolve(value);
        });
      });
      expect(result).assertEqual('name-12');
    })

    /**
     * @tc.name   testIconWithContext0004
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_0400
     * @tc.desc   Test that getAppIconWithCache loads and caches an icon from the bundle context.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIconWithContext0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new FakeContext());
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        manager.getAppIconWithCache(13, 'com.samples.camera', (value: string): void => {
          resolve(value);
        }, 'default-icon');
      });
      expect(result).assertEqual('icon-13');
    })

    /**
     * @tc.name   testNameWithContext0005
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_0500
     * @tc.desc   Test that getAppNameWithCache loads an application name from the bundle context.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNameWithContext0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new FakeContext());
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        manager.getAppNameWithCache(14, 'com.samples.camera', 'Fallback', (value: string): void => {
          resolve(value);
        });
      });
      expect(result).assertEqual('name-14');
    })

    /**
     * @tc.name   testUpdateIconCache0006
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_0600
     * @tc.desc   Test that updateIconCache stores the loaded icon in the memory cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUpdateIconCache0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new FakeContext());
      await manager.updateIconCache(15, 'com.samples.camera');
      expect(manager.getCachedAppIcon(15, 'com.samples.camera')).assertEqual('icon-15');
      manager.deleteAppResourceCache('15com.samples.camera', 'icon');
    })

    /**
     * @tc.name   testIconContextFailure0007
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_0700
     * @tc.desc   Test that a bundle context failure falls back to the default icon.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIconContextFailure0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new ThrowingContext());
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        manager.getAppIconWithCache(16, 'com.samples.broken', (value: string): void => {
          resolve(value);
        }, 'default-icon');
      });
      expect(result).assertEqual('default-icon');
    })

    /**
     * @tc.name   testEmptyNameFallback0008
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_0800
     * @tc.desc   Test that an empty resource name falls back to the application name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmptyNameFallback0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new EmptyNameContext());
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        manager.getAppNameWithCache(17, 'com.samples.empty', 'Fallback', (value: string): void => {
          resolve(value);
        });
      });
      expect(result).assertEqual('Fallback');
    })

    /**
     * @tc.name   testCachedIconHit0009
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_0900
     * @tc.desc   Test that an existing icon cache entry is returned without loading the bundle context.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCachedIconHit0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new FakeContext());
      manager.setAppResourceCache('20com.samples.cached', 'icon', 'cached-icon');
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        manager.getAppIconWithCache(20, 'com.samples.cached', (value: string): void => {
          resolve(value);
        }, 'default-icon');
      });
      expect(result).assertEqual('cached-icon');
      manager.deleteAppResourceCache('20com.samples.cached', 'icon');
    })

    /**
     * @tc.name   testCachedNameHit0010
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_1000
     * @tc.desc   Test that an existing name cache entry is returned by getAppNameWithCache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCachedNameHit0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new FakeContext());
      manager.setAppResourceCache('21com.samples.cached', 'name', 'CachedName');
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        manager.getAppNameWithCache(21, 'com.samples.cached', 'Fallback', (value: string): void => {
          resolve(value);
        });
      });
      expect(result).assertEqual('CachedName');
      manager.deleteAppResourceCache('21com.samples.cached', 'name');
    })
    /**
     * @tc.name   testNegativeIconId0011
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_1100
     * @tc.desc   Test that a negative icon id falls back to the default icon.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNegativeIconId0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new FakeContext());
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        manager.getAppIconWithCache(-1, 'com.samples.camera', (value: string): void => {
          resolve(value);
        }, 'default-icon');
      });
      expect(result).assertEqual('default-icon');
    })

    /**
     * @tc.name   testNegativeLabelId0012
     * @tc.number SUB_LAUNCHER_ENTRY_RESOURCE_ASYNC_1200
     * @tc.desc   Test that a negative label id falls back to the application name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNegativeLabelId0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const manager: ResourceManager = new ResourceManager(new FakeContext());
      const result: string = await new Promise<string>((resolve: (value: string) => void) => {
        manager.getAppNameWithCache(-1, 'com.samples.camera', 'Fallback', (value: string): void => {
          resolve(value);
        });
      });
      expect(result).assertEqual('Fallback');
    })

  })
}
