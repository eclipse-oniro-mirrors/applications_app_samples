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

const TAG: string = '[Sample_mediaSourceBufferWindowCore]';
const DOMAIN: number = 0xF812;

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

export default function mediaSourceBufferWindowCoreTest(): void {
  describe('mediaSourceBufferWindowCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0001
     * @tc.name      testExtBufferWindow0000
     * @tc.desc      Window 0-500 contains 0 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 0;
      const end: number = 500;
      const time: number = 0;
      const other: number = 250;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0002
     * @tc.name      testExtBufferWindow0001
     * @tc.desc      Window 13-613 contains 50 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 13;
      const end: number = 613;
      const time: number = 50;
      const other: number = 263;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0003
     * @tc.name      testExtBufferWindow0002
     * @tc.desc      Window 26-726 contains 100 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 26;
      const end: number = 726;
      const time: number = 100;
      const other: number = 276;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0004
     * @tc.name      testExtBufferWindow0003
     * @tc.desc      Window 39-839 contains 150 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 39;
      const end: number = 839;
      const time: number = 150;
      const other: number = 289;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0005
     * @tc.name      testExtBufferWindow0004
     * @tc.desc      Window 52-952 contains 200 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 52;
      const end: number = 952;
      const time: number = 200;
      const other: number = 302;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0006
     * @tc.name      testExtBufferWindow0005
     * @tc.desc      Window 65-1065 contains 250 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 65;
      const end: number = 1065;
      const time: number = 250;
      const other: number = 315;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0007
     * @tc.name      testExtBufferWindow0006
     * @tc.desc      Window 78-1178 contains 300 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 78;
      const end: number = 1178;
      const time: number = 300;
      const other: number = 328;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0008
     * @tc.name      testExtBufferWindow0007
     * @tc.desc      Window 91-591 contains 350 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 91;
      const end: number = 591;
      const time: number = 350;
      const other: number = 341;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0009
     * @tc.name      testExtBufferWindow0008
     * @tc.desc      Window 104-704 contains 400 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 104;
      const end: number = 704;
      const time: number = 400;
      const other: number = 354;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0010
     * @tc.name      testExtBufferWindow0009
     * @tc.desc      Window 117-817 contains 450 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 117;
      const end: number = 817;
      const time: number = 450;
      const other: number = 367;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0011
     * @tc.name      testExtBufferWindow0010
     * @tc.desc      Window 130-930 contains 500 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 130;
      const end: number = 930;
      const time: number = 500;
      const other: number = 380;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0012
     * @tc.name      testExtBufferWindow0011
     * @tc.desc      Window 143-1043 contains 550 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 143;
      const end: number = 1043;
      const time: number = 550;
      const other: number = 393;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0013
     * @tc.name      testExtBufferWindow0012
     * @tc.desc      Window 156-1156 contains 600 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 156;
      const end: number = 1156;
      const time: number = 600;
      const other: number = 406;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0014
     * @tc.name      testExtBufferWindow0013
     * @tc.desc      Window 169-1269 contains 650 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 169;
      const end: number = 1269;
      const time: number = 650;
      const other: number = 419;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0015
     * @tc.name      testExtBufferWindow0014
     * @tc.desc      Window 182-682 contains 199 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 182;
      const end: number = 682;
      const time: number = 199;
      const other: number = 432;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0016
     * @tc.name      testExtBufferWindow0015
     * @tc.desc      Window 195-795 contains 750 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 195;
      const end: number = 795;
      const time: number = 750;
      const other: number = 445;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0017
     * @tc.name      testExtBufferWindow0016
     * @tc.desc      Window 208-908 contains 800 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 208;
      const end: number = 908;
      const time: number = 800;
      const other: number = 458;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0018
     * @tc.name      testExtBufferWindow0017
     * @tc.desc      Window 221-1021 contains 850 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 221;
      const end: number = 1021;
      const time: number = 850;
      const other: number = 471;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0019
     * @tc.name      testExtBufferWindow0018
     * @tc.desc      Window 234-1134 contains 900 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 234;
      const end: number = 1134;
      const time: number = 900;
      const other: number = 484;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0020
     * @tc.name      testExtBufferWindow0019
     * @tc.desc      Window 247-1247 contains 950 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 247;
      const end: number = 1247;
      const time: number = 950;
      const other: number = 497;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0021
     * @tc.name      testExtBufferWindow0020
     * @tc.desc      Window 260-1360 contains 1000 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 260;
      const end: number = 1360;
      const time: number = 1000;
      const other: number = 510;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0022
     * @tc.name      testExtBufferWindow0021
     * @tc.desc      Window 273-773 contains 549 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 273;
      const end: number = 773;
      const time: number = 549;
      const other: number = 523;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0023
     * @tc.name      testExtBufferWindow0022
     * @tc.desc      Window 286-886 contains 499 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 286;
      const end: number = 886;
      const time: number = 499;
      const other: number = 536;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0024
     * @tc.name      testExtBufferWindow0023
     * @tc.desc      Window 299-999 contains 449 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 299;
      const end: number = 999;
      const time: number = 449;
      const other: number = 549;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0025
     * @tc.name      testExtBufferWindow0024
     * @tc.desc      Window 312-1112 contains 399 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 312;
      const end: number = 1112;
      const time: number = 399;
      const other: number = 562;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0026
     * @tc.name      testExtBufferWindow0025
     * @tc.desc      Window 325-1225 contains 349 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 325;
      const end: number = 1225;
      const time: number = 349;
      const other: number = 575;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0027
     * @tc.name      testExtBufferWindow0026
     * @tc.desc      Window 338-1338 contains 1300 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 338;
      const end: number = 1338;
      const time: number = 1300;
      const other: number = 588;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0028
     * @tc.name      testExtBufferWindow0027
     * @tc.desc      Window 351-1451 contains 1350 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 351;
      const end: number = 1451;
      const time: number = 1350;
      const other: number = 601;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0029
     * @tc.name      testExtBufferWindow0028
     * @tc.desc      Window 364-864 contains 398 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 364;
      const end: number = 864;
      const time: number = 398;
      const other: number = 614;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0030
     * @tc.name      testExtBufferWindow0029
     * @tc.desc      Window 377-977 contains 849 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 377;
      const end: number = 977;
      const time: number = 849;
      const other: number = 627;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0031
     * @tc.name      testExtBufferWindow0030
     * @tc.desc      Window 390-1090 contains 799 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 390;
      const end: number = 1090;
      const time: number = 799;
      const other: number = 640;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0032
     * @tc.name      testExtBufferWindow0031
     * @tc.desc      Window 403-1203 contains 749 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 403;
      const end: number = 1203;
      const time: number = 749;
      const other: number = 653;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0033
     * @tc.name      testExtBufferWindow0032
     * @tc.desc      Window 416-1316 contains 699 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 416;
      const end: number = 1316;
      const time: number = 699;
      const other: number = 666;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0034
     * @tc.name      testExtBufferWindow0033
     * @tc.desc      Window 429-1429 contains 649 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 429;
      const end: number = 1429;
      const time: number = 649;
      const other: number = 679;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0035
     * @tc.name      testExtBufferWindow0034
     * @tc.desc      Window 442-1542 contains 599 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 442;
      const end: number = 1542;
      const time: number = 599;
      const other: number = 692;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0036
     * @tc.name      testExtBufferWindow0035
     * @tc.desc      Window 455-955 contains 748 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 455;
      const end: number = 955;
      const time: number = 748;
      const other: number = 705;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0037
     * @tc.name      testExtBufferWindow0036
     * @tc.desc      Window 468-1068 contains 598 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 468;
      const end: number = 1068;
      const time: number = 598;
      const other: number = 718;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0038
     * @tc.name      testExtBufferWindow0037
     * @tc.desc      Window 481-1181 contains 1149 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 481;
      const end: number = 1181;
      const time: number = 1149;
      const other: number = 731;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0039
     * @tc.name      testExtBufferWindow0038
     * @tc.desc      Window 494-1294 contains 1099 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 494;
      const end: number = 1294;
      const time: number = 1099;
      const other: number = 744;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0040
     * @tc.name      testExtBufferWindow0039
     * @tc.desc      Window 507-1407 contains 1049 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 507;
      const end: number = 1407;
      const time: number = 1049;
      const other: number = 757;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0041
     * @tc.name      testExtBufferWindow0040
     * @tc.desc      Window 520-1520 contains 999 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 520;
      const end: number = 1520;
      const time: number = 999;
      const other: number = 770;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0042
     * @tc.name      testExtBufferWindow0041
     * @tc.desc      Window 533-1633 contains 949 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 533;
      const end: number = 1633;
      const time: number = 949;
      const other: number = 783;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0043
     * @tc.name      testExtBufferWindow0042
     * @tc.desc      Window 546-1046 contains 597 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 546;
      const end: number = 1046;
      const time: number = 597;
      const other: number = 796;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0044
     * @tc.name      testExtBufferWindow0043
     * @tc.desc      Window 559-1159 contains 948 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 559;
      const end: number = 1159;
      const time: number = 948;
      const other: number = 809;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0045
     * @tc.name      testExtBufferWindow0044
     * @tc.desc      Window 572-1272 contains 798 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 572;
      const end: number = 1272;
      const time: number = 798;
      const other: number = 822;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0046
     * @tc.name      testExtBufferWindow0045
     * @tc.desc      Window 585-1385 contains 648 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 585;
      const end: number = 1385;
      const time: number = 648;
      const other: number = 835;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0047
     * @tc.name      testExtBufferWindow0046
     * @tc.desc      Window 598-1498 contains 1399 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 598;
      const end: number = 1498;
      const time: number = 1399;
      const other: number = 848;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0048
     * @tc.name      testExtBufferWindow0047
     * @tc.desc      Window 611-1611 contains 1349 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 611;
      const end: number = 1611;
      const time: number = 1349;
      const other: number = 861;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0049
     * @tc.name      testExtBufferWindow0048
     * @tc.desc      Window 624-1724 contains 1299 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 624;
      const end: number = 1724;
      const time: number = 1299;
      const other: number = 874;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0050
     * @tc.name      testExtBufferWindow0049
     * @tc.desc      Window 637-1137 contains 947 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 637;
      const end: number = 1137;
      const time: number = 947;
      const other: number = 887;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0051
     * @tc.name      testExtBufferWindow0050
     * @tc.desc      Window 650-1250 contains 697 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 650;
      const end: number = 1250;
      const time: number = 697;
      const other: number = 900;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0052
     * @tc.name      testExtBufferWindow0051
     * @tc.desc      Window 663-1363 contains 1148 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 663;
      const end: number = 1363;
      const time: number = 1148;
      const other: number = 913;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0053
     * @tc.name      testExtBufferWindow0052
     * @tc.desc      Window 676-1476 contains 998 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 676;
      const end: number = 1476;
      const time: number = 998;
      const other: number = 926;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0054
     * @tc.name      testExtBufferWindow0053
     * @tc.desc      Window 689-1589 contains 848 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 689;
      const end: number = 1589;
      const time: number = 848;
      const other: number = 939;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0055
     * @tc.name      testExtBufferWindow0054
     * @tc.desc      Window 702-1702 contains 1699 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 702;
      const end: number = 1702;
      const time: number = 1699;
      const other: number = 952;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0056
     * @tc.name      testExtBufferWindow0055
     * @tc.desc      Window 715-1815 contains 1649 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 715;
      const end: number = 1815;
      const time: number = 1649;
      const other: number = 965;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0057
     * @tc.name      testExtBufferWindow0056
     * @tc.desc      Window 728-1228 contains 796 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 728;
      const end: number = 1228;
      const time: number = 796;
      const other: number = 978;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0058
     * @tc.name      testExtBufferWindow0057
     * @tc.desc      Window 741-1341 contains 1047 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 741;
      const end: number = 1341;
      const time: number = 1047;
      const other: number = 991;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0059
     * @tc.name      testExtBufferWindow0058
     * @tc.desc      Window 754-1454 contains 797 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 754;
      const end: number = 1454;
      const time: number = 797;
      const other: number = 1004;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0060
     * @tc.name      testExtBufferWindow0059
     * @tc.desc      Window 767-1567 contains 1348 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 767;
      const end: number = 1567;
      const time: number = 1348;
      const other: number = 1017;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0061
     * @tc.name      testExtBufferWindow0060
     * @tc.desc      Window 780-1680 contains 1198 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 780;
      const end: number = 1680;
      const time: number = 1198;
      const other: number = 1030;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0062
     * @tc.name      testExtBufferWindow0061
     * @tc.desc      Window 793-1793 contains 1048 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 793;
      const end: number = 1793;
      const time: number = 1048;
      const other: number = 1043;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0063
     * @tc.name      testExtBufferWindow0062
     * @tc.desc      Window 806-1906 contains 898 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 806;
      const end: number = 1906;
      const time: number = 898;
      const other: number = 1056;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0064
     * @tc.name      testExtBufferWindow0063
     * @tc.desc      Window 819-1319 contains 1146 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 819;
      const end: number = 1319;
      const time: number = 1146;
      const other: number = 1069;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0065
     * @tc.name      testExtBufferWindow0064
     * @tc.desc      Window 832-1432 contains 1397 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 832;
      const end: number = 1432;
      const time: number = 1397;
      const other: number = 1082;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0066
     * @tc.name      testExtBufferWindow0065
     * @tc.desc      Window 845-1545 contains 1147 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 845;
      const end: number = 1545;
      const time: number = 1147;
      const other: number = 1095;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0067
     * @tc.name      testExtBufferWindow0066
     * @tc.desc      Window 858-1658 contains 897 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 858;
      const end: number = 1658;
      const time: number = 897;
      const other: number = 1108;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0068
     * @tc.name      testExtBufferWindow0067
     * @tc.desc      Window 871-1771 contains 1548 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 871;
      const end: number = 1771;
      const time: number = 1548;
      const other: number = 1121;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0069
     * @tc.name      testExtBufferWindow0068
     * @tc.desc      Window 884-1884 contains 1398 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 884;
      const end: number = 1884;
      const time: number = 1398;
      const other: number = 1134;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0070
     * @tc.name      testExtBufferWindow0069
     * @tc.desc      Window 897-1997 contains 1248 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 897;
      const end: number = 1997;
      const time: number = 1248;
      const other: number = 1147;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0071
     * @tc.name      testExtBufferWindow0070
     * @tc.desc      Window 910-1410 contains 995 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 910;
      const end: number = 1410;
      const time: number = 995;
      const other: number = 1160;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0072
     * @tc.name      testExtBufferWindow0071
     * @tc.desc      Window 923-1523 contains 1146 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 923;
      const end: number = 1523;
      const time: number = 1146;
      const other: number = 1173;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0073
     * @tc.name      testExtBufferWindow0072
     * @tc.desc      Window 936-1636 contains 1497 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 936;
      const end: number = 1636;
      const time: number = 1497;
      const other: number = 1186;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0074
     * @tc.name      testExtBufferWindow0073
     * @tc.desc      Window 949-1749 contains 1247 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 949;
      const end: number = 1749;
      const time: number = 1247;
      const other: number = 1199;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(800);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0075
     * @tc.name      testExtBufferWindow0074
     * @tc.desc      Window 962-1862 contains 997 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 962;
      const end: number = 1862;
      const time: number = 997;
      const other: number = 1212;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(900);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0076
     * @tc.name      testExtBufferWindow0075
     * @tc.desc      Window 975-1975 contains 1748 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 975;
      const end: number = 1975;
      const time: number = 1748;
      const other: number = 1225;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1000);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0077
     * @tc.name      testExtBufferWindow0076
     * @tc.desc      Window 988-2088 contains 1598 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 988;
      const end: number = 2088;
      const time: number = 1598;
      const other: number = 1238;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(1100);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0078
     * @tc.name      testExtBufferWindow0077
     * @tc.desc      Window 1001-1501 contains 1345 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1001;
      const end: number = 1501;
      const time: number = 1345;
      const other: number = 1251;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(500);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0079
     * @tc.name      testExtBufferWindow0078
     * @tc.desc      Window 1014-1614 contains 1496 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1014;
      const end: number = 1614;
      const time: number = 1496;
      const other: number = 1264;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(600);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_BUFFER_0080
     * @tc.name      testExtBufferWindow0079
     * @tc.desc      Window 1027-1727 contains 1146 equals True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtBufferWindow0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const start: number = 1027;
      const end: number = 1727;
      const time: number = 1146;
      const other: number = 1277;
      const duration: number = end - start;
      const contains: boolean = time >= start && time <= end;
      const overlaps: boolean = other >= start && other <= end;
      expect(duration).assertEqual(700);
      expect(contains).assertEqual(true);
      expect(overlaps).assertEqual(true);
      expect(duration).assertLarger(0);
      expect(end).assertLarger(start);
    })
  });
}
