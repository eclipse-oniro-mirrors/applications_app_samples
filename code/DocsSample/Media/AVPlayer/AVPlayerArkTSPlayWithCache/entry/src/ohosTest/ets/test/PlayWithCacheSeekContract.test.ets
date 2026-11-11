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

const TAG: string = '[Sample_playWithCacheSeekContract]';
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

export default function playWithCacheSeekContractTest(): void {
  describe('playWithCacheSeekContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0001
     * @tc.name      testExtCacheSeek0000
     * @tc.desc      Slider 0 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0002
     * @tc.name      testExtCacheSeek0001
     * @tc.desc      Slider 0.4 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0003
     * @tc.name      testExtCacheSeek0002
     * @tc.desc      Slider 0.6 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0004
     * @tc.name      testExtCacheSeek0003
     * @tc.desc      Slider 1.4 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0005
     * @tc.name      testExtCacheSeek0004
     * @tc.desc      Slider 1.6 seeks to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(2);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0006
     * @tc.name      testExtCacheSeek0005
     * @tc.desc      Slider 59.6 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0007
     * @tc.name      testExtCacheSeek0006
     * @tc.desc      Slider 60.4 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0008
     * @tc.name      testExtCacheSeek0007
     * @tc.desc      Slider 999.6 seeks to 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 999.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1000);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0009
     * @tc.name      testExtCacheSeek0008
     * @tc.desc      Slider 0 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0010
     * @tc.name      testExtCacheSeek0009
     * @tc.desc      Slider 0.4 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0011
     * @tc.name      testExtCacheSeek0010
     * @tc.desc      Slider 0.6 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0012
     * @tc.name      testExtCacheSeek0011
     * @tc.desc      Slider 1.4 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0013
     * @tc.name      testExtCacheSeek0012
     * @tc.desc      Slider 1.6 seeks to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(2);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0014
     * @tc.name      testExtCacheSeek0013
     * @tc.desc      Slider 59.6 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0015
     * @tc.name      testExtCacheSeek0014
     * @tc.desc      Slider 60.4 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0016
     * @tc.name      testExtCacheSeek0015
     * @tc.desc      Slider 999.6 seeks to 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 999.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1000);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0017
     * @tc.name      testExtCacheSeek0016
     * @tc.desc      Slider 0 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0018
     * @tc.name      testExtCacheSeek0017
     * @tc.desc      Slider 0.4 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0019
     * @tc.name      testExtCacheSeek0018
     * @tc.desc      Slider 0.6 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0020
     * @tc.name      testExtCacheSeek0019
     * @tc.desc      Slider 1.4 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0021
     * @tc.name      testExtCacheSeek0020
     * @tc.desc      Slider 1.6 seeks to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(2);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0022
     * @tc.name      testExtCacheSeek0021
     * @tc.desc      Slider 59.6 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0023
     * @tc.name      testExtCacheSeek0022
     * @tc.desc      Slider 60.4 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0024
     * @tc.name      testExtCacheSeek0023
     * @tc.desc      Slider 999.6 seeks to 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 999.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1000);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0025
     * @tc.name      testExtCacheSeek0024
     * @tc.desc      Slider 0 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0026
     * @tc.name      testExtCacheSeek0025
     * @tc.desc      Slider 0.4 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0027
     * @tc.name      testExtCacheSeek0026
     * @tc.desc      Slider 0.6 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0028
     * @tc.name      testExtCacheSeek0027
     * @tc.desc      Slider 1.4 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0029
     * @tc.name      testExtCacheSeek0028
     * @tc.desc      Slider 1.6 seeks to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(2);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0030
     * @tc.name      testExtCacheSeek0029
     * @tc.desc      Slider 59.6 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0031
     * @tc.name      testExtCacheSeek0030
     * @tc.desc      Slider 60.4 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0032
     * @tc.name      testExtCacheSeek0031
     * @tc.desc      Slider 999.6 seeks to 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 999.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1000);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0033
     * @tc.name      testExtCacheSeek0032
     * @tc.desc      Slider 0 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0034
     * @tc.name      testExtCacheSeek0033
     * @tc.desc      Slider 0.4 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0035
     * @tc.name      testExtCacheSeek0034
     * @tc.desc      Slider 0.6 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0036
     * @tc.name      testExtCacheSeek0035
     * @tc.desc      Slider 1.4 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0037
     * @tc.name      testExtCacheSeek0036
     * @tc.desc      Slider 1.6 seeks to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(2);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0038
     * @tc.name      testExtCacheSeek0037
     * @tc.desc      Slider 59.6 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0039
     * @tc.name      testExtCacheSeek0038
     * @tc.desc      Slider 60.4 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0040
     * @tc.name      testExtCacheSeek0039
     * @tc.desc      Slider 999.6 seeks to 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 999.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1000);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0041
     * @tc.name      testExtCacheSeek0040
     * @tc.desc      Slider 0 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0042
     * @tc.name      testExtCacheSeek0041
     * @tc.desc      Slider 0.4 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0043
     * @tc.name      testExtCacheSeek0042
     * @tc.desc      Slider 0.6 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0044
     * @tc.name      testExtCacheSeek0043
     * @tc.desc      Slider 1.4 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0045
     * @tc.name      testExtCacheSeek0044
     * @tc.desc      Slider 1.6 seeks to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(2);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0046
     * @tc.name      testExtCacheSeek0045
     * @tc.desc      Slider 59.6 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0047
     * @tc.name      testExtCacheSeek0046
     * @tc.desc      Slider 60.4 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0048
     * @tc.name      testExtCacheSeek0047
     * @tc.desc      Slider 999.6 seeks to 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 999.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1000);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0049
     * @tc.name      testExtCacheSeek0048
     * @tc.desc      Slider 0 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0050
     * @tc.name      testExtCacheSeek0049
     * @tc.desc      Slider 0.4 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0051
     * @tc.name      testExtCacheSeek0050
     * @tc.desc      Slider 0.6 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0052
     * @tc.name      testExtCacheSeek0051
     * @tc.desc      Slider 1.4 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0053
     * @tc.name      testExtCacheSeek0052
     * @tc.desc      Slider 1.6 seeks to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(2);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0054
     * @tc.name      testExtCacheSeek0053
     * @tc.desc      Slider 59.6 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0055
     * @tc.name      testExtCacheSeek0054
     * @tc.desc      Slider 60.4 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0056
     * @tc.name      testExtCacheSeek0055
     * @tc.desc      Slider 999.6 seeks to 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 999.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1000);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0057
     * @tc.name      testExtCacheSeek0056
     * @tc.desc      Slider 0 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0058
     * @tc.name      testExtCacheSeek0057
     * @tc.desc      Slider 0.4 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0059
     * @tc.name      testExtCacheSeek0058
     * @tc.desc      Slider 0.6 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0060
     * @tc.name      testExtCacheSeek0059
     * @tc.desc      Slider 1.4 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0061
     * @tc.name      testExtCacheSeek0060
     * @tc.desc      Slider 1.6 seeks to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(2);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0062
     * @tc.name      testExtCacheSeek0061
     * @tc.desc      Slider 59.6 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0063
     * @tc.name      testExtCacheSeek0062
     * @tc.desc      Slider 60.4 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0064
     * @tc.name      testExtCacheSeek0063
     * @tc.desc      Slider 999.6 seeks to 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 999.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1000);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0065
     * @tc.name      testExtCacheSeek0064
     * @tc.desc      Slider 0 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0066
     * @tc.name      testExtCacheSeek0065
     * @tc.desc      Slider 0.4 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0067
     * @tc.name      testExtCacheSeek0066
     * @tc.desc      Slider 0.6 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0068
     * @tc.name      testExtCacheSeek0067
     * @tc.desc      Slider 1.4 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0069
     * @tc.name      testExtCacheSeek0068
     * @tc.desc      Slider 1.6 seeks to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(2);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0070
     * @tc.name      testExtCacheSeek0069
     * @tc.desc      Slider 59.6 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0071
     * @tc.name      testExtCacheSeek0070
     * @tc.desc      Slider 60.4 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0072
     * @tc.name      testExtCacheSeek0071
     * @tc.desc      Slider 999.6 seeks to 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 999.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1000);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0073
     * @tc.name      testExtCacheSeek0072
     * @tc.desc      Slider 0 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0074
     * @tc.name      testExtCacheSeek0073
     * @tc.desc      Slider 0.4 seeks to 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.4;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(0);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0075
     * @tc.name      testExtCacheSeek0074
     * @tc.desc      Slider 0.6 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 0.6;
      const previousSeek: number = 1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0076
     * @tc.name      testExtCacheSeek0075
     * @tc.desc      Slider 1.4 seeks to 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.4;
      const previousSeek: number = 1.4;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0077
     * @tc.name      testExtCacheSeek0076
     * @tc.desc      Slider 1.6 seeks to 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 1.6;
      const previousSeek: number = -1;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(2);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0078
     * @tc.name      testExtCacheSeek0077
     * @tc.desc      Slider 59.6 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 59.6;
      const previousSeek: number = 0;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0079
     * @tc.name      testExtCacheSeek0078
     * @tc.desc      Slider 60.4 seeks to 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 60.4;
      const previousSeek: number = 60;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(60);
      expect(previousSeek !== value).assertEqual(true);
      expect(seekTime).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_SEEK_0080
     * @tc.name      testExtCacheSeek0079
     * @tc.desc      Slider 999.6 seeks to 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheSeek0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const value: number = 999.6;
      const previousSeek: number = 999.6;
      const seekTime: number = Number.parseInt(value.toFixed(0));
      expect(seekTime).assertEqual(1000);
      expect(previousSeek !== value).assertEqual(false);
      expect(seekTime).assertLargerOrEqual(0);
    })
  });
}
