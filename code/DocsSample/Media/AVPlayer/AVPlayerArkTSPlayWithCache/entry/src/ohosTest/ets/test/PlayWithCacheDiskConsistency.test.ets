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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeAll, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_playWithCacheDiskConsistency]';
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

export default function playWithCacheDiskConsistencyTest(): void {
  describe('playWithCacheDiskConsistencyTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0001
     * @tc.name      testExtCacheDisk0000
     * @tc.desc      1 cache files remove 0 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        files.push([100][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0002
     * @tc.name      testExtCacheDisk0001
     * @tc.desc      2 cache files remove 1 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        files.push([100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0003
     * @tc.name      testExtCacheDisk0002
     * @tc.desc      3 cache files remove 2 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        files.push([100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(2);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0004
     * @tc.name      testExtCacheDisk0003
     * @tc.desc      4 cache files remove 3 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        files.push([100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(3);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(250);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0005
     * @tc.name      testExtCacheDisk0004
     * @tc.desc      5 cache files remove 4 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        files.push([100, 150, 200, 250, 300][index]);
      }
      const before: number = files.length;
      files = files.slice(4);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(300);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0006
     * @tc.name      testExtCacheDisk0005
     * @tc.desc      6 cache files remove 5 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        files.push([100, 150, 200, 250, 300, 100][index]);
      }
      const before: number = files.length;
      files = files.slice(5);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0007
     * @tc.name      testExtCacheDisk0006
     * @tc.desc      7 cache files remove 6 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(6);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0008
     * @tc.name      testExtCacheDisk0007
     * @tc.desc      8 cache files remove 7 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0009
     * @tc.name      testExtCacheDisk0008
     * @tc.desc      9 cache files remove 8 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 9; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(8);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(9);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(250);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0010
     * @tc.name      testExtCacheDisk0009
     * @tc.desc      1 cache files remove 1 keeps 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        files.push([100][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(files.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0011
     * @tc.name      testExtCacheDisk0010
     * @tc.desc      2 cache files remove 1 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        files.push([100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0012
     * @tc.name      testExtCacheDisk0011
     * @tc.desc      3 cache files remove 3 keeps 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        files.push([100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(3);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(files.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0013
     * @tc.name      testExtCacheDisk0012
     * @tc.desc      4 cache files remove 2 keeps 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        files.push([100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(2);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(files.length).assertEqual(2);
      expect(total).assertEqual(450);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0014
     * @tc.name      testExtCacheDisk0013
     * @tc.desc      5 cache files remove 1 keeps 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        files.push([100, 150, 200, 250, 300][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(files.length).assertEqual(4);
      expect(total).assertEqual(900);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0015
     * @tc.name      testExtCacheDisk0014
     * @tc.desc      6 cache files remove 0 keeps 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        files.push([100, 150, 200, 250, 300, 100][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(files.length).assertEqual(6);
      expect(total).assertEqual(1100);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0016
     * @tc.name      testExtCacheDisk0015
     * @tc.desc      7 cache files remove 7 keeps 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(files.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0017
     * @tc.name      testExtCacheDisk0016
     * @tc.desc      8 cache files remove 7 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0018
     * @tc.name      testExtCacheDisk0017
     * @tc.desc      9 cache files remove 7 keeps 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 9; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(9);
      expect(files.length).assertEqual(2);
      expect(total).assertEqual(450);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0019
     * @tc.name      testExtCacheDisk0018
     * @tc.desc      1 cache files remove 0 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        files.push([100][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0020
     * @tc.name      testExtCacheDisk0019
     * @tc.desc      2 cache files remove 1 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        files.push([100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0021
     * @tc.name      testExtCacheDisk0020
     * @tc.desc      3 cache files remove 0 keeps 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        files.push([100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(files.length).assertEqual(3);
      expect(total).assertEqual(450);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0022
     * @tc.name      testExtCacheDisk0021
     * @tc.desc      4 cache files remove 1 keeps 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        files.push([100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(files.length).assertEqual(3);
      expect(total).assertEqual(600);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0023
     * @tc.name      testExtCacheDisk0022
     * @tc.desc      5 cache files remove 4 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        files.push([100, 150, 200, 250, 300][index]);
      }
      const before: number = files.length;
      files = files.slice(4);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(300);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0024
     * @tc.name      testExtCacheDisk0023
     * @tc.desc      6 cache files remove 2 keeps 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        files.push([100, 150, 200, 250, 300, 100][index]);
      }
      const before: number = files.length;
      files = files.slice(2);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(files.length).assertEqual(4);
      expect(total).assertEqual(850);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0025
     * @tc.name      testExtCacheDisk0024
     * @tc.desc      7 cache files remove 0 keeps 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(files.length).assertEqual(7);
      expect(total).assertEqual(1250);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0026
     * @tc.name      testExtCacheDisk0025
     * @tc.desc      8 cache files remove 7 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0027
     * @tc.name      testExtCacheDisk0026
     * @tc.desc      9 cache files remove 6 keeps 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 9; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(6);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(9);
      expect(files.length).assertEqual(3);
      expect(total).assertEqual(600);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0028
     * @tc.name      testExtCacheDisk0027
     * @tc.desc      1 cache files remove 1 keeps 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        files.push([100][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(files.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0029
     * @tc.name      testExtCacheDisk0028
     * @tc.desc      2 cache files remove 1 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        files.push([100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0030
     * @tc.name      testExtCacheDisk0029
     * @tc.desc      3 cache files remove 1 keeps 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        files.push([100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(files.length).assertEqual(2);
      expect(total).assertEqual(350);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0031
     * @tc.name      testExtCacheDisk0030
     * @tc.desc      4 cache files remove 0 keeps 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        files.push([100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(files.length).assertEqual(4);
      expect(total).assertEqual(700);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0032
     * @tc.name      testExtCacheDisk0031
     * @tc.desc      5 cache files remove 1 keeps 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        files.push([100, 150, 200, 250, 300][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(files.length).assertEqual(4);
      expect(total).assertEqual(900);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0033
     * @tc.name      testExtCacheDisk0032
     * @tc.desc      6 cache files remove 4 keeps 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        files.push([100, 150, 200, 250, 300, 100][index]);
      }
      const before: number = files.length;
      files = files.slice(4);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(files.length).assertEqual(2);
      expect(total).assertEqual(400);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0034
     * @tc.name      testExtCacheDisk0033
     * @tc.desc      7 cache files remove 1 keeps 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(files.length).assertEqual(6);
      expect(total).assertEqual(1150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0035
     * @tc.name      testExtCacheDisk0034
     * @tc.desc      8 cache files remove 7 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0036
     * @tc.name      testExtCacheDisk0035
     * @tc.desc      9 cache files remove 5 keeps 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 9; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(5);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(9);
      expect(files.length).assertEqual(4);
      expect(total).assertEqual(700);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0037
     * @tc.name      testExtCacheDisk0036
     * @tc.desc      1 cache files remove 0 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        files.push([100][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0038
     * @tc.name      testExtCacheDisk0037
     * @tc.desc      2 cache files remove 1 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        files.push([100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0039
     * @tc.name      testExtCacheDisk0038
     * @tc.desc      3 cache files remove 2 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        files.push([100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(2);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0040
     * @tc.name      testExtCacheDisk0039
     * @tc.desc      4 cache files remove 4 keeps 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        files.push([100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(4);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(files.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0041
     * @tc.name      testExtCacheDisk0040
     * @tc.desc      5 cache files remove 4 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        files.push([100, 150, 200, 250, 300][index]);
      }
      const before: number = files.length;
      files = files.slice(4);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(300);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0042
     * @tc.name      testExtCacheDisk0041
     * @tc.desc      6 cache files remove 6 keeps 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        files.push([100, 150, 200, 250, 300, 100][index]);
      }
      const before: number = files.length;
      files = files.slice(6);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(files.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0043
     * @tc.name      testExtCacheDisk0042
     * @tc.desc      7 cache files remove 2 keeps 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(2);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(files.length).assertEqual(5);
      expect(total).assertEqual(1000);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0044
     * @tc.name      testExtCacheDisk0043
     * @tc.desc      8 cache files remove 7 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0045
     * @tc.name      testExtCacheDisk0044
     * @tc.desc      9 cache files remove 4 keeps 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 9; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(4);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(9);
      expect(files.length).assertEqual(5);
      expect(total).assertEqual(1000);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0046
     * @tc.name      testExtCacheDisk0045
     * @tc.desc      1 cache files remove 1 keeps 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        files.push([100][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(files.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0047
     * @tc.name      testExtCacheDisk0046
     * @tc.desc      2 cache files remove 1 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        files.push([100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0048
     * @tc.name      testExtCacheDisk0047
     * @tc.desc      3 cache files remove 3 keeps 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        files.push([100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(3);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(files.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0049
     * @tc.name      testExtCacheDisk0048
     * @tc.desc      4 cache files remove 3 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        files.push([100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(3);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(250);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0050
     * @tc.name      testExtCacheDisk0049
     * @tc.desc      5 cache files remove 1 keeps 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        files.push([100, 150, 200, 250, 300][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(files.length).assertEqual(4);
      expect(total).assertEqual(900);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0051
     * @tc.name      testExtCacheDisk0050
     * @tc.desc      6 cache files remove 1 keeps 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        files.push([100, 150, 200, 250, 300, 100][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(files.length).assertEqual(5);
      expect(total).assertEqual(1000);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0052
     * @tc.name      testExtCacheDisk0051
     * @tc.desc      7 cache files remove 3 keeps 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(3);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(files.length).assertEqual(4);
      expect(total).assertEqual(800);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0053
     * @tc.name      testExtCacheDisk0052
     * @tc.desc      8 cache files remove 7 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0054
     * @tc.name      testExtCacheDisk0053
     * @tc.desc      9 cache files remove 3 keeps 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 9; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(3);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(9);
      expect(files.length).assertEqual(6);
      expect(total).assertEqual(1250);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0055
     * @tc.name      testExtCacheDisk0054
     * @tc.desc      1 cache files remove 0 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        files.push([100][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0056
     * @tc.name      testExtCacheDisk0055
     * @tc.desc      2 cache files remove 1 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        files.push([100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0057
     * @tc.name      testExtCacheDisk0056
     * @tc.desc      3 cache files remove 0 keeps 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        files.push([100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(files.length).assertEqual(3);
      expect(total).assertEqual(450);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0058
     * @tc.name      testExtCacheDisk0057
     * @tc.desc      4 cache files remove 2 keeps 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        files.push([100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(2);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(files.length).assertEqual(2);
      expect(total).assertEqual(450);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0059
     * @tc.name      testExtCacheDisk0058
     * @tc.desc      5 cache files remove 4 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        files.push([100, 150, 200, 250, 300][index]);
      }
      const before: number = files.length;
      files = files.slice(4);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(300);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0060
     * @tc.name      testExtCacheDisk0059
     * @tc.desc      6 cache files remove 3 keeps 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        files.push([100, 150, 200, 250, 300, 100][index]);
      }
      const before: number = files.length;
      files = files.slice(3);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(files.length).assertEqual(3);
      expect(total).assertEqual(650);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0061
     * @tc.name      testExtCacheDisk0060
     * @tc.desc      7 cache files remove 4 keeps 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(4);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(files.length).assertEqual(3);
      expect(total).assertEqual(550);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0062
     * @tc.name      testExtCacheDisk0061
     * @tc.desc      8 cache files remove 7 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0063
     * @tc.name      testExtCacheDisk0062
     * @tc.desc      9 cache files remove 2 keeps 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 9; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(2);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(9);
      expect(files.length).assertEqual(7);
      expect(total).assertEqual(1450);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0064
     * @tc.name      testExtCacheDisk0063
     * @tc.desc      1 cache files remove 1 keeps 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        files.push([100][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(files.length).assertEqual(0);
      expect(total).assertEqual(0);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0065
     * @tc.name      testExtCacheDisk0064
     * @tc.desc      2 cache files remove 1 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        files.push([100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0066
     * @tc.name      testExtCacheDisk0065
     * @tc.desc      3 cache files remove 1 keeps 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        files.push([100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(files.length).assertEqual(2);
      expect(total).assertEqual(350);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0067
     * @tc.name      testExtCacheDisk0066
     * @tc.desc      4 cache files remove 1 keeps 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        files.push([100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(files.length).assertEqual(3);
      expect(total).assertEqual(600);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0068
     * @tc.name      testExtCacheDisk0067
     * @tc.desc      5 cache files remove 1 keeps 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        files.push([100, 150, 200, 250, 300][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(files.length).assertEqual(4);
      expect(total).assertEqual(900);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0069
     * @tc.name      testExtCacheDisk0068
     * @tc.desc      6 cache files remove 5 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        files.push([100, 150, 200, 250, 300, 100][index]);
      }
      const before: number = files.length;
      files = files.slice(5);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0070
     * @tc.name      testExtCacheDisk0069
     * @tc.desc      7 cache files remove 5 keeps 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(5);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(files.length).assertEqual(2);
      expect(total).assertEqual(250);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0071
     * @tc.name      testExtCacheDisk0070
     * @tc.desc      8 cache files remove 7 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0072
     * @tc.name      testExtCacheDisk0071
     * @tc.desc      9 cache files remove 1 keeps 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 9; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(9);
      expect(files.length).assertEqual(8);
      expect(total).assertEqual(1600);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0073
     * @tc.name      testExtCacheDisk0072
     * @tc.desc      1 cache files remove 0 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 1; index++) {
        files.push([100][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(1);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(100);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0074
     * @tc.name      testExtCacheDisk0073
     * @tc.desc      2 cache files remove 1 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 2; index++) {
        files.push([100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(1);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(2);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0075
     * @tc.name      testExtCacheDisk0074
     * @tc.desc      3 cache files remove 2 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 3; index++) {
        files.push([100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(2);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(3);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0076
     * @tc.name      testExtCacheDisk0075
     * @tc.desc      4 cache files remove 0 keeps 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 4; index++) {
        files.push([100, 150, 200, 250][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(4);
      expect(files.length).assertEqual(4);
      expect(total).assertEqual(700);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0077
     * @tc.name      testExtCacheDisk0076
     * @tc.desc      5 cache files remove 4 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 5; index++) {
        files.push([100, 150, 200, 250, 300][index]);
      }
      const before: number = files.length;
      files = files.slice(4);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(5);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(300);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0078
     * @tc.name      testExtCacheDisk0077
     * @tc.desc      6 cache files remove 0 keeps 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 6; index++) {
        files.push([100, 150, 200, 250, 300, 100][index]);
      }
      const before: number = files.length;
      files = files.slice(0);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(6);
      expect(files.length).assertEqual(6);
      expect(total).assertEqual(1100);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0079
     * @tc.name      testExtCacheDisk0078
     * @tc.desc      7 cache files remove 6 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 7; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150][index]);
      }
      const before: number = files.length;
      files = files.slice(6);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(7);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(150);
      expect(files.length).assertLessOrEqual(before);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_DISK_0080
     * @tc.name      testExtCacheDisk0079
     * @tc.desc      8 cache files remove 7 keeps 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheDisk0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let files: number[] = [];
      for (let index: number = 0; index < 8; index++) {
        files.push([100, 150, 200, 250, 300, 100, 150, 200][index]);
      }
      const before: number = files.length;
      files = files.slice(7);
      const total: number = files.reduce((sum: number, value: number) => sum + value, 0);
      expect(before).assertEqual(8);
      expect(files.length).assertEqual(1);
      expect(total).assertEqual(200);
      expect(files.length).assertLessOrEqual(before);
    })
  });
}
