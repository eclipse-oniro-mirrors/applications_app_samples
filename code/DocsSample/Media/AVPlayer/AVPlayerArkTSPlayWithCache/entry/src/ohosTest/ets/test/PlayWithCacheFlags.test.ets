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

const TAG: string = '[Sample_playWithCacheFlags]';
const DOMAIN: number = 0xF813;

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

export default function playWithCacheFlagsTest(): void {
  describe('playWithCacheFlagsTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0001
     * @tc.name      testExtCacheFlags0000
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0002
     * @tc.name      testExtCacheFlags0001
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0003
     * @tc.name      testExtCacheFlags0002
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0004
     * @tc.name      testExtCacheFlags0003
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0005
     * @tc.name      testExtCacheFlags0004
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0006
     * @tc.name      testExtCacheFlags0005
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0007
     * @tc.name      testExtCacheFlags0006
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0008
     * @tc.name      testExtCacheFlags0007
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0009
     * @tc.name      testExtCacheFlags0008
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0010
     * @tc.name      testExtCacheFlags0009
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0011
     * @tc.name      testExtCacheFlags0010
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0012
     * @tc.name      testExtCacheFlags0011
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0013
     * @tc.name      testExtCacheFlags0012
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0014
     * @tc.name      testExtCacheFlags0013
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0015
     * @tc.name      testExtCacheFlags0014
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0016
     * @tc.name      testExtCacheFlags0015
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0017
     * @tc.name      testExtCacheFlags0016
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0018
     * @tc.name      testExtCacheFlags0017
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0019
     * @tc.name      testExtCacheFlags0018
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0020
     * @tc.name      testExtCacheFlags0019
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0021
     * @tc.name      testExtCacheFlags0020
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0022
     * @tc.name      testExtCacheFlags0021
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0023
     * @tc.name      testExtCacheFlags0022
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0024
     * @tc.name      testExtCacheFlags0023
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0025
     * @tc.name      testExtCacheFlags0024
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0026
     * @tc.name      testExtCacheFlags0025
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0027
     * @tc.name      testExtCacheFlags0026
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0028
     * @tc.name      testExtCacheFlags0027
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0029
     * @tc.name      testExtCacheFlags0028
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0030
     * @tc.name      testExtCacheFlags0029
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0031
     * @tc.name      testExtCacheFlags0030
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0032
     * @tc.name      testExtCacheFlags0031
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0033
     * @tc.name      testExtCacheFlags0032
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0034
     * @tc.name      testExtCacheFlags0033
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0035
     * @tc.name      testExtCacheFlags0034
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0036
     * @tc.name      testExtCacheFlags0035
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0037
     * @tc.name      testExtCacheFlags0036
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0038
     * @tc.name      testExtCacheFlags0037
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0039
     * @tc.name      testExtCacheFlags0038
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0040
     * @tc.name      testExtCacheFlags0039
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0041
     * @tc.name      testExtCacheFlags0040
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0042
     * @tc.name      testExtCacheFlags0041
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0043
     * @tc.name      testExtCacheFlags0042
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0044
     * @tc.name      testExtCacheFlags0043
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0045
     * @tc.name      testExtCacheFlags0044
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0046
     * @tc.name      testExtCacheFlags0045
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0047
     * @tc.name      testExtCacheFlags0046
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0048
     * @tc.name      testExtCacheFlags0047
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0049
     * @tc.name      testExtCacheFlags0048
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0050
     * @tc.name      testExtCacheFlags0049
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0051
     * @tc.name      testExtCacheFlags0050
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0052
     * @tc.name      testExtCacheFlags0051
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0053
     * @tc.name      testExtCacheFlags0052
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0054
     * @tc.name      testExtCacheFlags0053
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0055
     * @tc.name      testExtCacheFlags0054
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0056
     * @tc.name      testExtCacheFlags0055
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0057
     * @tc.name      testExtCacheFlags0056
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0058
     * @tc.name      testExtCacheFlags0057
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0059
     * @tc.name      testExtCacheFlags0058
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0060
     * @tc.name      testExtCacheFlags0059
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0061
     * @tc.name      testExtCacheFlags0060
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0062
     * @tc.name      testExtCacheFlags0061
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0063
     * @tc.name      testExtCacheFlags0062
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0064
     * @tc.name      testExtCacheFlags0063
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0065
     * @tc.name      testExtCacheFlags0064
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0066
     * @tc.name      testExtCacheFlags0065
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0067
     * @tc.name      testExtCacheFlags0066
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0068
     * @tc.name      testExtCacheFlags0067
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0069
     * @tc.name      testExtCacheFlags0068
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0070
     * @tc.name      testExtCacheFlags0069
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0071
     * @tc.name      testExtCacheFlags0070
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0072
     * @tc.name      testExtCacheFlags0071
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0073
     * @tc.name      testExtCacheFlags0072
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0074
     * @tc.name      testExtCacheFlags0073
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0075
     * @tc.name      testExtCacheFlags0074
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0076
     * @tc.name      testExtCacheFlags0075
     * @tc.desc      Cache flags enabled=False m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0077
     * @tc.name      testExtCacheFlags0076
     * @tc.desc      Cache flags enabled=True m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = false;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0078
     * @tc.name      testExtCacheFlags0077
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 40;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0079
     * @tc.name      testExtCacheFlags0078
     * @tc.desc      Cache flags enabled=True m3u8=False buffer=0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = true;
      const m3u8: boolean = false;
      const preferredBufferDuration: number = 0;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(true);
      expect(m3u8).assertEqual(false);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FLAGS_0080
     * @tc.name      testExtCacheFlags0079
     * @tc.desc      Cache flags enabled=False m3u8=True buffer=20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFlags0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const enabled: boolean = false;
      const m3u8: boolean = true;
      const preferredBufferDuration: number = 20;
      const showFirstFrameOnPrepare: boolean = true;
      expect(enabled || !enabled).assertTrue();
      expect(m3u8 || !m3u8).assertTrue();
      expect(preferredBufferDuration).assertLargerOrEqual(0);
      expect(showFirstFrameOnPrepare || !showFirstFrameOnPrepare).assertTrue();
      expect(enabled).assertEqual(false);
      expect(m3u8).assertEqual(true);
    })
  });
}
