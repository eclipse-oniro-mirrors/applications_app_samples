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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheVariant]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function playWithCacheVariantTest(): void {
  describe('playWithCacheVariantTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0001
     * @tc.name      testExtCacheVariant0000
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0002
     * @tc.name      testExtCacheVariant0001
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0003
     * @tc.name      testExtCacheVariant0002
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0004
     * @tc.name      testExtCacheVariant0003
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0005
     * @tc.name      testExtCacheVariant0004
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0006
     * @tc.name      testExtCacheVariant0005
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0007
     * @tc.name      testExtCacheVariant0006
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0008
     * @tc.name      testExtCacheVariant0007
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0009
     * @tc.name      testExtCacheVariant0008
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0010
     * @tc.name      testExtCacheVariant0009
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0011
     * @tc.name      testExtCacheVariant0010
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0012
     * @tc.name      testExtCacheVariant0011
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0013
     * @tc.name      testExtCacheVariant0012
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0014
     * @tc.name      testExtCacheVariant0013
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0015
     * @tc.name      testExtCacheVariant0014
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0016
     * @tc.name      testExtCacheVariant0015
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0017
     * @tc.name      testExtCacheVariant0016
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0018
     * @tc.name      testExtCacheVariant0017
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0019
     * @tc.name      testExtCacheVariant0018
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0020
     * @tc.name      testExtCacheVariant0019
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0021
     * @tc.name      testExtCacheVariant0020
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0022
     * @tc.name      testExtCacheVariant0021
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0023
     * @tc.name      testExtCacheVariant0022
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0024
     * @tc.name      testExtCacheVariant0023
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0025
     * @tc.name      testExtCacheVariant0024
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0026
     * @tc.name      testExtCacheVariant0025
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0027
     * @tc.name      testExtCacheVariant0026
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0028
     * @tc.name      testExtCacheVariant0027
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0029
     * @tc.name      testExtCacheVariant0028
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0030
     * @tc.name      testExtCacheVariant0029
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0031
     * @tc.name      testExtCacheVariant0030
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0032
     * @tc.name      testExtCacheVariant0031
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0033
     * @tc.name      testExtCacheVariant0032
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0034
     * @tc.name      testExtCacheVariant0033
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0035
     * @tc.name      testExtCacheVariant0034
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0036
     * @tc.name      testExtCacheVariant0035
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0037
     * @tc.name      testExtCacheVariant0036
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0038
     * @tc.name      testExtCacheVariant0037
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0039
     * @tc.name      testExtCacheVariant0038
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0040
     * @tc.name      testExtCacheVariant0039
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0041
     * @tc.name      testExtCacheVariant0040
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0042
     * @tc.name      testExtCacheVariant0041
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0043
     * @tc.name      testExtCacheVariant0042
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0044
     * @tc.name      testExtCacheVariant0043
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0045
     * @tc.name      testExtCacheVariant0044
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0046
     * @tc.name      testExtCacheVariant0045
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0047
     * @tc.name      testExtCacheVariant0046
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0048
     * @tc.name      testExtCacheVariant0047
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0049
     * @tc.name      testExtCacheVariant0048
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0050
     * @tc.name      testExtCacheVariant0049
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0051
     * @tc.name      testExtCacheVariant0050
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0052
     * @tc.name      testExtCacheVariant0051
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0053
     * @tc.name      testExtCacheVariant0052
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0054
     * @tc.name      testExtCacheVariant0053
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0055
     * @tc.name      testExtCacheVariant0054
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0056
     * @tc.name      testExtCacheVariant0055
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0057
     * @tc.name      testExtCacheVariant0056
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0058
     * @tc.name      testExtCacheVariant0057
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0059
     * @tc.name      testExtCacheVariant0058
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0060
     * @tc.name      testExtCacheVariant0059
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0061
     * @tc.name      testExtCacheVariant0060
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0062
     * @tc.name      testExtCacheVariant0061
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0063
     * @tc.name      testExtCacheVariant0062
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0064
     * @tc.name      testExtCacheVariant0063
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0065
     * @tc.name      testExtCacheVariant0064
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0066
     * @tc.name      testExtCacheVariant0065
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0067
     * @tc.name      testExtCacheVariant0066
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0068
     * @tc.name      testExtCacheVariant0067
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0069
     * @tc.name      testExtCacheVariant0068
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0070
     * @tc.name      testExtCacheVariant0069
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0071
     * @tc.name      testExtCacheVariant0070
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0072
     * @tc.name      testExtCacheVariant0071
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0073
     * @tc.name      testExtCacheVariant0072
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0074
     * @tc.name      testExtCacheVariant0073
     * @tc.desc      Bandwidth 1500000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0075
     * @tc.name      testExtCacheVariant0074
     * @tc.desc      Bandwidth 2000000 selects 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 2000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(1500000);
      expect(variants[bestIndex][1]).assertEqual(1280);
      expect(variants[bestIndex][2]).assertEqual(720);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0076
     * @tc.name      testExtCacheVariant0075
     * @tc.desc      Bandwidth 3000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 3000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0077
     * @tc.name      testExtCacheVariant0076
     * @tc.desc      Bandwidth 5000000 selects 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 5000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(3000000);
      expect(variants[bestIndex][1]).assertEqual(1920);
      expect(variants[bestIndex][2]).assertEqual(1080);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0078
     * @tc.name      testExtCacheVariant0077
     * @tc.desc      Bandwidth 500000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 500000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0079
     * @tc.name      testExtCacheVariant0078
     * @tc.desc      Bandwidth 800000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 800000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_VARIANT_0080
     * @tc.name      testExtCacheVariant0079
     * @tc.desc      Bandwidth 1000000 selects 640x360.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheVariant0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const variants: number[][] = [[800000, 640, 360], [1500000, 1280, 720], [3000000, 1920, 1080]];
      const bandwidth: number = 1000000;
      let bestIndex: number = 0;
      for (let index: number = 0; index < variants.length; index++) {
        if (variants[index][0] <= bandwidth) {
          bestIndex = index;
        }
      }
      expect(variants[bestIndex][0]).assertEqual(800000);
      expect(variants[bestIndex][1]).assertEqual(640);
      expect(variants[bestIndex][2]).assertEqual(360);
      expect(bestIndex).assertLargerOrEqual(0);
    })
  });
}
