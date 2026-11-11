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

const TAG: string = '[Sample_playWithCacheFileRecord]';
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

export default function playWithCacheFileRecordTest(): void {
  describe('playWithCacheFileRecordTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0001
     * @tc.name      testExtCacheRecord0000
     * @tc.desc      1 records remove 0 keeps 1 total 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        records.push([100][index]);
      }
      const before: number = records.length;
      records = records.slice(0);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0002
     * @tc.name      testExtCacheRecord0001
     * @tc.desc      2 records remove 1 keeps 1 total 150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        records.push([100, 150][index]);
      }
      const before: number = records.length;
      records = records.slice(1);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0003
     * @tc.name      testExtCacheRecord0002
     * @tc.desc      3 records remove 2 keeps 1 total 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        records.push([100, 150, 200][index]);
      }
      const before: number = records.length;
      records = records.slice(2);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0004
     * @tc.name      testExtCacheRecord0003
     * @tc.desc      4 records remove 3 keeps 1 total 250.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        records.push([100, 150, 200, 250][index]);
      }
      const before: number = records.length;
      records = records.slice(3);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(250);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0005
     * @tc.name      testExtCacheRecord0004
     * @tc.desc      5 records remove 4 keeps 1 total 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        records.push([100, 150, 200, 250, 100][index]);
      }
      const before: number = records.length;
      records = records.slice(4);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0006
     * @tc.name      testExtCacheRecord0005
     * @tc.desc      6 records remove 5 keeps 1 total 150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        records.push([100, 150, 200, 250, 100, 150][index]);
      }
      const before: number = records.length;
      records = records.slice(5);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0007
     * @tc.name      testExtCacheRecord0006
     * @tc.desc      7 records remove 6 keeps 1 total 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        records.push([100, 150, 200, 250, 100, 150, 200][index]);
      }
      const before: number = records.length;
      records = records.slice(6);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0008
     * @tc.name      testExtCacheRecord0007
     * @tc.desc      8 records remove 7 keeps 1 total 250.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        records.push([100, 150, 200, 250, 100, 150, 200, 250][index]);
      }
      const before: number = records.length;
      records = records.slice(7);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(250);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0009
     * @tc.name      testExtCacheRecord0008
     * @tc.desc      1 records remove 0 keeps 1 total 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        records.push([100][index]);
      }
      const before: number = records.length;
      records = records.slice(0);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0010
     * @tc.name      testExtCacheRecord0009
     * @tc.desc      2 records remove 0 keeps 2 total 250.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        records.push([100, 150][index]);
      }
      const before: number = records.length;
      records = records.slice(0);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(records.length).assertEqual(2);
      expect(total).assertEqual(250);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0011
     * @tc.name      testExtCacheRecord0010
     * @tc.desc      3 records remove 2 keeps 1 total 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        records.push([100, 150, 200][index]);
      }
      const before: number = records.length;
      records = records.slice(2);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0012
     * @tc.name      testExtCacheRecord0011
     * @tc.desc      4 records remove 1 keeps 3 total 600.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        records.push([100, 150, 200, 250][index]);
      }
      const before: number = records.length;
      records = records.slice(1);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(records.length).assertEqual(3);
      expect(total).assertEqual(600);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0013
     * @tc.name      testExtCacheRecord0012
     * @tc.desc      5 records remove 0 keeps 5 total 800.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        records.push([100, 150, 200, 250, 100][index]);
      }
      const before: number = records.length;
      records = records.slice(0);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(records.length).assertEqual(5);
      expect(total).assertEqual(800);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0014
     * @tc.name      testExtCacheRecord0013
     * @tc.desc      6 records remove 6 keeps 0 total 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        records.push([100, 150, 200, 250, 100, 150][index]);
      }
      const before: number = records.length;
      records = records.slice(6);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(records.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0015
     * @tc.name      testExtCacheRecord0014
     * @tc.desc      7 records remove 6 keeps 1 total 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        records.push([100, 150, 200, 250, 100, 150, 200][index]);
      }
      const before: number = records.length;
      records = records.slice(6);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0016
     * @tc.name      testExtCacheRecord0015
     * @tc.desc      8 records remove 6 keeps 2 total 450.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        records.push([100, 150, 200, 250, 100, 150, 200, 250][index]);
      }
      const before: number = records.length;
      records = records.slice(6);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(records.length).assertEqual(2);
      expect(total).assertEqual(450);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0017
     * @tc.name      testExtCacheRecord0016
     * @tc.desc      1 records remove 0 keeps 1 total 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        records.push([100][index]);
      }
      const before: number = records.length;
      records = records.slice(0);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0018
     * @tc.name      testExtCacheRecord0017
     * @tc.desc      2 records remove 2 keeps 0 total 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        records.push([100, 150][index]);
      }
      const before: number = records.length;
      records = records.slice(2);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(records.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0019
     * @tc.name      testExtCacheRecord0018
     * @tc.desc      3 records remove 2 keeps 1 total 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        records.push([100, 150, 200][index]);
      }
      const before: number = records.length;
      records = records.slice(2);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0020
     * @tc.name      testExtCacheRecord0019
     * @tc.desc      4 records remove 4 keeps 0 total 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        records.push([100, 150, 200, 250][index]);
      }
      const before: number = records.length;
      records = records.slice(4);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(records.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0021
     * @tc.name      testExtCacheRecord0020
     * @tc.desc      5 records remove 2 keeps 3 total 550.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        records.push([100, 150, 200, 250, 100][index]);
      }
      const before: number = records.length;
      records = records.slice(2);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(records.length).assertEqual(3);
      expect(total).assertEqual(550);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0022
     * @tc.name      testExtCacheRecord0021
     * @tc.desc      6 records remove 0 keeps 6 total 950.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        records.push([100, 150, 200, 250, 100, 150][index]);
      }
      const before: number = records.length;
      records = records.slice(0);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(records.length).assertEqual(6);
      expect(total).assertEqual(950);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0023
     * @tc.name      testExtCacheRecord0022
     * @tc.desc      7 records remove 6 keeps 1 total 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        records.push([100, 150, 200, 250, 100, 150, 200][index]);
      }
      const before: number = records.length;
      records = records.slice(6);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0024
     * @tc.name      testExtCacheRecord0023
     * @tc.desc      8 records remove 5 keeps 3 total 600.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        records.push([100, 150, 200, 250, 100, 150, 200, 250][index]);
      }
      const before: number = records.length;
      records = records.slice(5);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(records.length).assertEqual(3);
      expect(total).assertEqual(600);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0025
     * @tc.name      testExtCacheRecord0024
     * @tc.desc      1 records remove 0 keeps 1 total 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        records.push([100][index]);
      }
      const before: number = records.length;
      records = records.slice(0);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0026
     * @tc.name      testExtCacheRecord0025
     * @tc.desc      2 records remove 1 keeps 1 total 150.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        records.push([100, 150][index]);
      }
      const before: number = records.length;
      records = records.slice(1);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0027
     * @tc.name      testExtCacheRecord0026
     * @tc.desc      3 records remove 2 keeps 1 total 200.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        records.push([100, 150, 200][index]);
      }
      const before: number = records.length;
      records = records.slice(2);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0028
     * @tc.name      testExtCacheRecord0027
     * @tc.desc      4 records remove 2 keeps 2 total 450.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        records.push([100, 150, 200, 250][index]);
      }
      const before: number = records.length;
      records = records.slice(2);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(records.length).assertEqual(2);
      expect(total).assertEqual(450);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0029
     * @tc.name      testExtCacheRecord0028
     * @tc.desc      5 records remove 4 keeps 1 total 100.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        records.push([100, 150, 200, 250, 100][index]);
      }
      const before: number = records.length;
      records = records.slice(4);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(records.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(records.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_RECORD_0030
     * @tc.name      testExtCacheRecord0029
     * @tc.desc      6 records remove 1 keeps 5 total 850.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheRecord0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let records: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        records.push([100, 150, 200, 250, 100, 150][index]);
      }
      const before: number = records.length;
      records = records.slice(1);
      const total: number = records.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(records.length).assertEqual(5);
      expect(total).assertEqual(850);
      expect(records.length).assertLessOrEqual(before);
    })
  });
}
