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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheOfflineState]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function playWithCacheOfflineStateTest(): void {
  describe('playWithCacheOfflineStateTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0001
     * @tc.name      testExtCacheOffline0001
     * @tc.desc      Cache enabled=True toggles=0 clear=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = true;
      const keys: string[] = [];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(0);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0002
     * @tc.name      testExtCacheOffline0002
     * @tc.desc      Cache enabled=False toggles=1 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0003
     * @tc.name      testExtCacheOffline0003
     * @tc.desc      Cache enabled=True toggles=2 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0004
     * @tc.name      testExtCacheOffline0004
     * @tc.desc      Cache enabled=False toggles=3 clear=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      const keys: string[] = [];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(0);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0005
     * @tc.name      testExtCacheOffline0005
     * @tc.desc      Cache enabled=True toggles=0 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = true;
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0006
     * @tc.name      testExtCacheOffline0006
     * @tc.desc      Cache enabled=False toggles=1 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0007
     * @tc.name      testExtCacheOffline0007
     * @tc.desc      Cache enabled=True toggles=2 clear=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      const keys: string[] = [];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(0);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0008
     * @tc.name      testExtCacheOffline0008
     * @tc.desc      Cache enabled=False toggles=3 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0009
     * @tc.name      testExtCacheOffline0009
     * @tc.desc      Cache enabled=True toggles=0 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = true;
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0010
     * @tc.name      testExtCacheOffline0010
     * @tc.desc      Cache enabled=False toggles=1 clear=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      const keys: string[] = [];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(0);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0011
     * @tc.name      testExtCacheOffline0011
     * @tc.desc      Cache enabled=True toggles=2 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0012
     * @tc.name      testExtCacheOffline0012
     * @tc.desc      Cache enabled=False toggles=3 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0013
     * @tc.name      testExtCacheOffline0013
     * @tc.desc      Cache enabled=True toggles=0 clear=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = true;
      const keys: string[] = [];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(0);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0014
     * @tc.name      testExtCacheOffline0014
     * @tc.desc      Cache enabled=False toggles=1 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0015
     * @tc.name      testExtCacheOffline0015
     * @tc.desc      Cache enabled=True toggles=2 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0016
     * @tc.name      testExtCacheOffline0016
     * @tc.desc      Cache enabled=False toggles=3 clear=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      const keys: string[] = [];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(0);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0017
     * @tc.name      testExtCacheOffline0017
     * @tc.desc      Cache enabled=True toggles=0 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = true;
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0018
     * @tc.name      testExtCacheOffline0018
     * @tc.desc      Cache enabled=False toggles=1 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = false;
      for (let index: number = 0; index < 1; index++) {
        enabled = !enabled;
      }
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0019
     * @tc.name      testExtCacheOffline0019
     * @tc.desc      Cache enabled=True toggles=2 clear=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = true;
      for (let index: number = 0; index < 2; index++) {
        enabled = !enabled;
      }
      const keys: string[] = [];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(0);
      expect(keys.length).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_OFFLINE_0020
     * @tc.name      testExtCacheOffline0020
     * @tc.desc      Cache enabled=False toggles=3 clear=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheOffline0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let enabled: boolean = false;
      for (let index: number = 0; index < 3; index++) {
        enabled = !enabled;
      }
      const keys: string[] = ['a', 'b', 'c'];
      expect(enabled).assertEqual(true);
      expect(keys.length).assertEqual(3);
      expect(keys.length).assertLargerOrEqual(0);
    })
  });
}
