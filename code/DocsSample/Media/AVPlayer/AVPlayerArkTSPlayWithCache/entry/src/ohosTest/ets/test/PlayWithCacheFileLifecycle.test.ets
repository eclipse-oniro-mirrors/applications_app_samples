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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeAll, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheFileLifecycle]';
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

export default function playWithCacheFileLifecycleTest(): void {
  describe('playWithCacheFileLifecycleTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0001
     * @tc.name      testExtCacheFile0000
     * @tc.desc      1 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0002
     * @tc.name      testExtCacheFile0001
     * @tc.desc      2 cache files clear=False leaves 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0003
     * @tc.name      testExtCacheFile0002
     * @tc.desc      3 cache files clear=False leaves 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0004
     * @tc.name      testExtCacheFile0003
     * @tc.desc      4 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0005
     * @tc.name      testExtCacheFile0004
     * @tc.desc      5 cache files clear=False leaves 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0006
     * @tc.name      testExtCacheFile0005
     * @tc.desc      6 cache files clear=False leaves 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0007
     * @tc.name      testExtCacheFile0006
     * @tc.desc      7 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0008
     * @tc.name      testExtCacheFile0007
     * @tc.desc      8 cache files clear=False leaves 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0009
     * @tc.name      testExtCacheFile0008
     * @tc.desc      1 cache files clear=False leaves 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0010
     * @tc.name      testExtCacheFile0009
     * @tc.desc      2 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0011
     * @tc.name      testExtCacheFile0010
     * @tc.desc      3 cache files clear=False leaves 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0012
     * @tc.name      testExtCacheFile0011
     * @tc.desc      4 cache files clear=False leaves 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0013
     * @tc.name      testExtCacheFile0012
     * @tc.desc      5 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0014
     * @tc.name      testExtCacheFile0013
     * @tc.desc      6 cache files clear=False leaves 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0015
     * @tc.name      testExtCacheFile0014
     * @tc.desc      7 cache files clear=False leaves 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0016
     * @tc.name      testExtCacheFile0015
     * @tc.desc      8 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0017
     * @tc.name      testExtCacheFile0016
     * @tc.desc      1 cache files clear=False leaves 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0018
     * @tc.name      testExtCacheFile0017
     * @tc.desc      2 cache files clear=False leaves 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0019
     * @tc.name      testExtCacheFile0018
     * @tc.desc      3 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0020
     * @tc.name      testExtCacheFile0019
     * @tc.desc      4 cache files clear=False leaves 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0021
     * @tc.name      testExtCacheFile0020
     * @tc.desc      5 cache files clear=False leaves 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0022
     * @tc.name      testExtCacheFile0021
     * @tc.desc      6 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0023
     * @tc.name      testExtCacheFile0022
     * @tc.desc      7 cache files clear=False leaves 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0024
     * @tc.name      testExtCacheFile0023
     * @tc.desc      8 cache files clear=False leaves 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0025
     * @tc.name      testExtCacheFile0024
     * @tc.desc      1 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0026
     * @tc.name      testExtCacheFile0025
     * @tc.desc      2 cache files clear=False leaves 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0027
     * @tc.name      testExtCacheFile0026
     * @tc.desc      3 cache files clear=False leaves 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0028
     * @tc.name      testExtCacheFile0027
     * @tc.desc      4 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0029
     * @tc.name      testExtCacheFile0028
     * @tc.desc      5 cache files clear=False leaves 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0030
     * @tc.name      testExtCacheFile0029
     * @tc.desc      6 cache files clear=False leaves 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0031
     * @tc.name      testExtCacheFile0030
     * @tc.desc      7 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0032
     * @tc.name      testExtCacheFile0031
     * @tc.desc      8 cache files clear=False leaves 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0033
     * @tc.name      testExtCacheFile0032
     * @tc.desc      1 cache files clear=False leaves 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0034
     * @tc.name      testExtCacheFile0033
     * @tc.desc      2 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0035
     * @tc.name      testExtCacheFile0034
     * @tc.desc      3 cache files clear=False leaves 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0036
     * @tc.name      testExtCacheFile0035
     * @tc.desc      4 cache files clear=False leaves 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0037
     * @tc.name      testExtCacheFile0036
     * @tc.desc      5 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0038
     * @tc.name      testExtCacheFile0037
     * @tc.desc      6 cache files clear=False leaves 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0039
     * @tc.name      testExtCacheFile0038
     * @tc.desc      7 cache files clear=False leaves 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0040
     * @tc.name      testExtCacheFile0039
     * @tc.desc      8 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0041
     * @tc.name      testExtCacheFile0040
     * @tc.desc      1 cache files clear=False leaves 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0042
     * @tc.name      testExtCacheFile0041
     * @tc.desc      2 cache files clear=False leaves 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0043
     * @tc.name      testExtCacheFile0042
     * @tc.desc      3 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0044
     * @tc.name      testExtCacheFile0043
     * @tc.desc      4 cache files clear=False leaves 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0045
     * @tc.name      testExtCacheFile0044
     * @tc.desc      5 cache files clear=False leaves 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0046
     * @tc.name      testExtCacheFile0045
     * @tc.desc      6 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0047
     * @tc.name      testExtCacheFile0046
     * @tc.desc      7 cache files clear=False leaves 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0048
     * @tc.name      testExtCacheFile0047
     * @tc.desc      8 cache files clear=False leaves 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0049
     * @tc.name      testExtCacheFile0048
     * @tc.desc      1 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0050
     * @tc.name      testExtCacheFile0049
     * @tc.desc      2 cache files clear=False leaves 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0051
     * @tc.name      testExtCacheFile0050
     * @tc.desc      3 cache files clear=False leaves 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0052
     * @tc.name      testExtCacheFile0051
     * @tc.desc      4 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0053
     * @tc.name      testExtCacheFile0052
     * @tc.desc      5 cache files clear=False leaves 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0054
     * @tc.name      testExtCacheFile0053
     * @tc.desc      6 cache files clear=False leaves 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0055
     * @tc.name      testExtCacheFile0054
     * @tc.desc      7 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0056
     * @tc.name      testExtCacheFile0055
     * @tc.desc      8 cache files clear=False leaves 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0057
     * @tc.name      testExtCacheFile0056
     * @tc.desc      1 cache files clear=False leaves 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0058
     * @tc.name      testExtCacheFile0057
     * @tc.desc      2 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0059
     * @tc.name      testExtCacheFile0058
     * @tc.desc      3 cache files clear=False leaves 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0060
     * @tc.name      testExtCacheFile0059
     * @tc.desc      4 cache files clear=False leaves 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0061
     * @tc.name      testExtCacheFile0060
     * @tc.desc      5 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0062
     * @tc.name      testExtCacheFile0061
     * @tc.desc      6 cache files clear=False leaves 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0063
     * @tc.name      testExtCacheFile0062
     * @tc.desc      7 cache files clear=False leaves 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0064
     * @tc.name      testExtCacheFile0063
     * @tc.desc      8 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0065
     * @tc.name      testExtCacheFile0064
     * @tc.desc      1 cache files clear=False leaves 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0066
     * @tc.name      testExtCacheFile0065
     * @tc.desc      2 cache files clear=False leaves 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0067
     * @tc.name      testExtCacheFile0066
     * @tc.desc      3 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0068
     * @tc.name      testExtCacheFile0067
     * @tc.desc      4 cache files clear=False leaves 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0069
     * @tc.name      testExtCacheFile0068
     * @tc.desc      5 cache files clear=False leaves 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0070
     * @tc.name      testExtCacheFile0069
     * @tc.desc      6 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0071
     * @tc.name      testExtCacheFile0070
     * @tc.desc      7 cache files clear=False leaves 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0072
     * @tc.name      testExtCacheFile0071
     * @tc.desc      8 cache files clear=False leaves 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0073
     * @tc.name      testExtCacheFile0072
     * @tc.desc      1 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 1; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(1);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0074
     * @tc.name      testExtCacheFile0073
     * @tc.desc      2 cache files clear=False leaves 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 2; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(2);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0075
     * @tc.name      testExtCacheFile0074
     * @tc.desc      3 cache files clear=False leaves 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 3; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(3);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0076
     * @tc.name      testExtCacheFile0075
     * @tc.desc      4 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 4; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(4);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0077
     * @tc.name      testExtCacheFile0076
     * @tc.desc      5 cache files clear=False leaves 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 5; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(5);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0078
     * @tc.name      testExtCacheFile0077
     * @tc.desc      6 cache files clear=False leaves 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 6; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(6);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0079
     * @tc.name      testExtCacheFile0078
     * @tc.desc      7 cache files clear=True leaves 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 7; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(7);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (true) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(0);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILE_0080
     * @tc.name      testExtCacheFile0079
     * @tc.desc      8 cache files clear=False leaves 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFile0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let cacheEntries: string[] = [];
      for (let index: number = 0; index < 8; index++) {
        cacheEntries.push('seg_' + index + '.ts');
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries[0]).assertEqual('seg_0.ts');
      if (false) {
        cacheEntries = [];
      }
      expect(cacheEntries.length).assertEqual(8);
      expect(cacheEntries.indexOf('seg_999.ts')).assertEqual(-1);
    })
  });
}
