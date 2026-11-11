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

const TAG: string = '[Sample_MediaSourceRangeTail]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function mediaSourceRangeTailTest(): void {
  describe('mediaSourceRangeTailTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0001
     * @tc.name      testSafeRangeTail0001
     * @tc.desc      Range length 1 at 0 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 0;
      const length: number = 1;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(0);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0002
     * @tc.name      testSafeRangeTail0002
     * @tc.desc      Range length 14 at 37 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 37;
      const length: number = 14;
      const end: number = offset + length - 1;
      expect(length).assertEqual(14);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(50);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0003
     * @tc.name      testSafeRangeTail0003
     * @tc.desc      Range length 27 at 74 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 74;
      const length: number = 27;
      const end: number = offset + length - 1;
      expect(length).assertEqual(27);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(100);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0004
     * @tc.name      testSafeRangeTail0004
     * @tc.desc      Range length 40 at 111 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 111;
      const length: number = 40;
      const end: number = offset + length - 1;
      expect(length).assertEqual(40);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(150);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0005
     * @tc.name      testSafeRangeTail0005
     * @tc.desc      Range length 53 at 148 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 148;
      const length: number = 53;
      const end: number = offset + length - 1;
      expect(length).assertEqual(53);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(200);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0006
     * @tc.name      testSafeRangeTail0006
     * @tc.desc      Range length 66 at 185 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 185;
      const length: number = 66;
      const end: number = offset + length - 1;
      expect(length).assertEqual(66);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(250);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0007
     * @tc.name      testSafeRangeTail0007
     * @tc.desc      Range length 79 at 222 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 222;
      const length: number = 79;
      const end: number = offset + length - 1;
      expect(length).assertEqual(79);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(300);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0008
     * @tc.name      testSafeRangeTail0008
     * @tc.desc      Range length 92 at 259 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 259;
      const length: number = 92;
      const end: number = offset + length - 1;
      expect(length).assertEqual(92);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(350);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0009
     * @tc.name      testSafeRangeTail0009
     * @tc.desc      Range length 105 at 296 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 296;
      const length: number = 105;
      const end: number = offset + length - 1;
      expect(length).assertEqual(105);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(400);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0010
     * @tc.name      testSafeRangeTail0010
     * @tc.desc      Range length 118 at 333 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 333;
      const length: number = 118;
      const end: number = offset + length - 1;
      expect(length).assertEqual(118);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(450);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0011
     * @tc.name      testSafeRangeTail0011
     * @tc.desc      Range length 131 at 370 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 370;
      const length: number = 131;
      const end: number = offset + length - 1;
      expect(length).assertEqual(131);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(500);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0012
     * @tc.name      testSafeRangeTail0012
     * @tc.desc      Range length 144 at 407 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 407;
      const length: number = 144;
      const end: number = offset + length - 1;
      expect(length).assertEqual(144);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(550);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0013
     * @tc.name      testSafeRangeTail0013
     * @tc.desc      Range length 157 at 444 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 444;
      const length: number = 157;
      const end: number = offset + length - 1;
      expect(length).assertEqual(157);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(600);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0014
     * @tc.name      testSafeRangeTail0014
     * @tc.desc      Range length 170 at 481 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 481;
      const length: number = 170;
      const end: number = offset + length - 1;
      expect(length).assertEqual(170);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(650);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0015
     * @tc.name      testSafeRangeTail0015
     * @tc.desc      Range length 183 at 518 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 518;
      const length: number = 183;
      const end: number = offset + length - 1;
      expect(length).assertEqual(183);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(700);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0016
     * @tc.name      testSafeRangeTail0016
     * @tc.desc      Range length 196 at 555 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 555;
      const length: number = 196;
      const end: number = offset + length - 1;
      expect(length).assertEqual(196);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(750);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0017
     * @tc.name      testSafeRangeTail0017
     * @tc.desc      Range length 209 at 592 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 592;
      const length: number = 209;
      const end: number = offset + length - 1;
      expect(length).assertEqual(209);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(800);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0018
     * @tc.name      testSafeRangeTail0018
     * @tc.desc      Range length 222 at 629 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 629;
      const length: number = 222;
      const end: number = offset + length - 1;
      expect(length).assertEqual(222);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(850);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0019
     * @tc.name      testSafeRangeTail0019
     * @tc.desc      Range length 235 at 666 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 666;
      const length: number = 235;
      const end: number = offset + length - 1;
      expect(length).assertEqual(235);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(900);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0020
     * @tc.name      testSafeRangeTail0020
     * @tc.desc      Range length 248 at 703 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 703;
      const length: number = 248;
      const end: number = offset + length - 1;
      expect(length).assertEqual(248);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(950);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0021
     * @tc.name      testSafeRangeTail0021
     * @tc.desc      Range length 261 at 740 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 740;
      const length: number = 261;
      const end: number = offset + length - 1;
      expect(length).assertEqual(261);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1000);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0022
     * @tc.name      testSafeRangeTail0022
     * @tc.desc      Range length 274 at 777 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 777;
      const length: number = 274;
      const end: number = offset + length - 1;
      expect(length).assertEqual(274);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1050);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0023
     * @tc.name      testSafeRangeTail0023
     * @tc.desc      Range length 287 at 814 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 814;
      const length: number = 287;
      const end: number = offset + length - 1;
      expect(length).assertEqual(287);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1100);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0024
     * @tc.name      testSafeRangeTail0024
     * @tc.desc      Range length 300 at 851 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 851;
      const length: number = 300;
      const end: number = offset + length - 1;
      expect(length).assertEqual(300);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1150);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0025
     * @tc.name      testSafeRangeTail0025
     * @tc.desc      Range length 313 at 888 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 888;
      const length: number = 313;
      const end: number = offset + length - 1;
      expect(length).assertEqual(313);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1200);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0026
     * @tc.name      testSafeRangeTail0026
     * @tc.desc      Range length 326 at 925 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 925;
      const length: number = 326;
      const end: number = offset + length - 1;
      expect(length).assertEqual(326);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1250);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0027
     * @tc.name      testSafeRangeTail0027
     * @tc.desc      Range length 339 at 962 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 962;
      const length: number = 339;
      const end: number = offset + length - 1;
      expect(length).assertEqual(339);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1300);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0028
     * @tc.name      testSafeRangeTail0028
     * @tc.desc      Range length 352 at 999 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 999;
      const length: number = 352;
      const end: number = offset + length - 1;
      expect(length).assertEqual(352);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1350);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0029
     * @tc.name      testSafeRangeTail0029
     * @tc.desc      Range length 365 at 1036 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1036;
      const length: number = 365;
      const end: number = offset + length - 1;
      expect(length).assertEqual(365);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1400);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0030
     * @tc.name      testSafeRangeTail0030
     * @tc.desc      Range length 378 at 1073 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1073;
      const length: number = 378;
      const end: number = offset + length - 1;
      expect(length).assertEqual(378);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1450);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0031
     * @tc.name      testSafeRangeTail0031
     * @tc.desc      Range length 391 at 1110 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1110;
      const length: number = 391;
      const end: number = offset + length - 1;
      expect(length).assertEqual(391);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1500);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0032
     * @tc.name      testSafeRangeTail0032
     * @tc.desc      Range length 404 at 1147 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1147;
      const length: number = 404;
      const end: number = offset + length - 1;
      expect(length).assertEqual(404);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1550);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0033
     * @tc.name      testSafeRangeTail0033
     * @tc.desc      Range length 417 at 1184 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1184;
      const length: number = 417;
      const end: number = offset + length - 1;
      expect(length).assertEqual(417);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1600);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0034
     * @tc.name      testSafeRangeTail0034
     * @tc.desc      Range length 430 at 1221 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1221;
      const length: number = 430;
      const end: number = offset + length - 1;
      expect(length).assertEqual(430);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1650);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0035
     * @tc.name      testSafeRangeTail0035
     * @tc.desc      Range length 443 at 1258 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1258;
      const length: number = 443;
      const end: number = offset + length - 1;
      expect(length).assertEqual(443);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1700);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0036
     * @tc.name      testSafeRangeTail0036
     * @tc.desc      Range length 456 at 1295 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1295;
      const length: number = 456;
      const end: number = offset + length - 1;
      expect(length).assertEqual(456);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1750);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0037
     * @tc.name      testSafeRangeTail0037
     * @tc.desc      Range length 469 at 1332 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1332;
      const length: number = 469;
      const end: number = offset + length - 1;
      expect(length).assertEqual(469);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1800);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0038
     * @tc.name      testSafeRangeTail0038
     * @tc.desc      Range length 482 at 1369 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1369;
      const length: number = 482;
      const end: number = offset + length - 1;
      expect(length).assertEqual(482);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1850);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0039
     * @tc.name      testSafeRangeTail0039
     * @tc.desc      Range length 495 at 1406 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1406;
      const length: number = 495;
      const end: number = offset + length - 1;
      expect(length).assertEqual(495);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1900);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0040
     * @tc.name      testSafeRangeTail0040
     * @tc.desc      Range length 508 at 1443 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1443;
      const length: number = 508;
      const end: number = offset + length - 1;
      expect(length).assertEqual(508);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(1950);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0041
     * @tc.name      testSafeRangeTail0041
     * @tc.desc      Range length 521 at 1480 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1480;
      const length: number = 521;
      const end: number = offset + length - 1;
      expect(length).assertEqual(521);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2000);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0042
     * @tc.name      testSafeRangeTail0042
     * @tc.desc      Range length 534 at 1517 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1517;
      const length: number = 534;
      const end: number = offset + length - 1;
      expect(length).assertEqual(534);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2050);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0043
     * @tc.name      testSafeRangeTail0043
     * @tc.desc      Range length 547 at 1554 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1554;
      const length: number = 547;
      const end: number = offset + length - 1;
      expect(length).assertEqual(547);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2100);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0044
     * @tc.name      testSafeRangeTail0044
     * @tc.desc      Range length 560 at 1591 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1591;
      const length: number = 560;
      const end: number = offset + length - 1;
      expect(length).assertEqual(560);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2150);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0045
     * @tc.name      testSafeRangeTail0045
     * @tc.desc      Range length 573 at 1628 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1628;
      const length: number = 573;
      const end: number = offset + length - 1;
      expect(length).assertEqual(573);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2200);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0046
     * @tc.name      testSafeRangeTail0046
     * @tc.desc      Range length 586 at 1665 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1665;
      const length: number = 586;
      const end: number = offset + length - 1;
      expect(length).assertEqual(586);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2250);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0047
     * @tc.name      testSafeRangeTail0047
     * @tc.desc      Range length 599 at 1702 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1702;
      const length: number = 599;
      const end: number = offset + length - 1;
      expect(length).assertEqual(599);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2300);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0048
     * @tc.name      testSafeRangeTail0048
     * @tc.desc      Range length 612 at 1739 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1739;
      const length: number = 612;
      const end: number = offset + length - 1;
      expect(length).assertEqual(612);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2350);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0049
     * @tc.name      testSafeRangeTail0049
     * @tc.desc      Range length 625 at 1776 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1776;
      const length: number = 625;
      const end: number = offset + length - 1;
      expect(length).assertEqual(625);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2400);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0050
     * @tc.name      testSafeRangeTail0050
     * @tc.desc      Range length 638 at 1813 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1813;
      const length: number = 638;
      const end: number = offset + length - 1;
      expect(length).assertEqual(638);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2450);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0051
     * @tc.name      testSafeRangeTail0051
     * @tc.desc      Range length 651 at 1850 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1850;
      const length: number = 651;
      const end: number = offset + length - 1;
      expect(length).assertEqual(651);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2500);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0052
     * @tc.name      testSafeRangeTail0052
     * @tc.desc      Range length 664 at 1887 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1887;
      const length: number = 664;
      const end: number = offset + length - 1;
      expect(length).assertEqual(664);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2550);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0053
     * @tc.name      testSafeRangeTail0053
     * @tc.desc      Range length 677 at 1924 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1924;
      const length: number = 677;
      const end: number = offset + length - 1;
      expect(length).assertEqual(677);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2600);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0054
     * @tc.name      testSafeRangeTail0054
     * @tc.desc      Range length 690 at 1961 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1961;
      const length: number = 690;
      const end: number = offset + length - 1;
      expect(length).assertEqual(690);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2650);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0055
     * @tc.name      testSafeRangeTail0055
     * @tc.desc      Range length 703 at 1998 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 1998;
      const length: number = 703;
      const end: number = offset + length - 1;
      expect(length).assertEqual(703);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2700);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0056
     * @tc.name      testSafeRangeTail0056
     * @tc.desc      Range length 716 at 2035 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2035;
      const length: number = 716;
      const end: number = offset + length - 1;
      expect(length).assertEqual(716);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2750);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0057
     * @tc.name      testSafeRangeTail0057
     * @tc.desc      Range length 729 at 2072 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2072;
      const length: number = 729;
      const end: number = offset + length - 1;
      expect(length).assertEqual(729);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2800);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0058
     * @tc.name      testSafeRangeTail0058
     * @tc.desc      Range length 742 at 2109 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2109;
      const length: number = 742;
      const end: number = offset + length - 1;
      expect(length).assertEqual(742);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2850);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0059
     * @tc.name      testSafeRangeTail0059
     * @tc.desc      Range length 755 at 2146 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2146;
      const length: number = 755;
      const end: number = offset + length - 1;
      expect(length).assertEqual(755);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2900);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0060
     * @tc.name      testSafeRangeTail0060
     * @tc.desc      Range length 768 at 2183 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2183;
      const length: number = 768;
      const end: number = offset + length - 1;
      expect(length).assertEqual(768);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(2950);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0061
     * @tc.name      testSafeRangeTail0061
     * @tc.desc      Range length 781 at 2220 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2220;
      const length: number = 781;
      const end: number = offset + length - 1;
      expect(length).assertEqual(781);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3000);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0062
     * @tc.name      testSafeRangeTail0062
     * @tc.desc      Range length 794 at 2257 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2257;
      const length: number = 794;
      const end: number = offset + length - 1;
      expect(length).assertEqual(794);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3050);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0063
     * @tc.name      testSafeRangeTail0063
     * @tc.desc      Range length 807 at 2294 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2294;
      const length: number = 807;
      const end: number = offset + length - 1;
      expect(length).assertEqual(807);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3100);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0064
     * @tc.name      testSafeRangeTail0064
     * @tc.desc      Range length 820 at 2331 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2331;
      const length: number = 820;
      const end: number = offset + length - 1;
      expect(length).assertEqual(820);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3150);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0065
     * @tc.name      testSafeRangeTail0065
     * @tc.desc      Range length 833 at 2368 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2368;
      const length: number = 833;
      const end: number = offset + length - 1;
      expect(length).assertEqual(833);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3200);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0066
     * @tc.name      testSafeRangeTail0066
     * @tc.desc      Range length 846 at 2405 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2405;
      const length: number = 846;
      const end: number = offset + length - 1;
      expect(length).assertEqual(846);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3250);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0067
     * @tc.name      testSafeRangeTail0067
     * @tc.desc      Range length 859 at 2442 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2442;
      const length: number = 859;
      const end: number = offset + length - 1;
      expect(length).assertEqual(859);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3300);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0068
     * @tc.name      testSafeRangeTail0068
     * @tc.desc      Range length 872 at 2479 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2479;
      const length: number = 872;
      const end: number = offset + length - 1;
      expect(length).assertEqual(872);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3350);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0069
     * @tc.name      testSafeRangeTail0069
     * @tc.desc      Range length 885 at 2516 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2516;
      const length: number = 885;
      const end: number = offset + length - 1;
      expect(length).assertEqual(885);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3400);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0070
     * @tc.name      testSafeRangeTail0070
     * @tc.desc      Range length 898 at 2553 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2553;
      const length: number = 898;
      const end: number = offset + length - 1;
      expect(length).assertEqual(898);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3450);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0071
     * @tc.name      testSafeRangeTail0071
     * @tc.desc      Range length 911 at 2590 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2590;
      const length: number = 911;
      const end: number = offset + length - 1;
      expect(length).assertEqual(911);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3500);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0072
     * @tc.name      testSafeRangeTail0072
     * @tc.desc      Range length 924 at 2627 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2627;
      const length: number = 924;
      const end: number = offset + length - 1;
      expect(length).assertEqual(924);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3550);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0073
     * @tc.name      testSafeRangeTail0073
     * @tc.desc      Range length 937 at 2664 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2664;
      const length: number = 937;
      const end: number = offset + length - 1;
      expect(length).assertEqual(937);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3600);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0074
     * @tc.name      testSafeRangeTail0074
     * @tc.desc      Range length 950 at 2701 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2701;
      const length: number = 950;
      const end: number = offset + length - 1;
      expect(length).assertEqual(950);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3650);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0075
     * @tc.name      testSafeRangeTail0075
     * @tc.desc      Range length 963 at 2738 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2738;
      const length: number = 963;
      const end: number = offset + length - 1;
      expect(length).assertEqual(963);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3700);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0076
     * @tc.name      testSafeRangeTail0076
     * @tc.desc      Range length 976 at 2775 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2775;
      const length: number = 976;
      const end: number = offset + length - 1;
      expect(length).assertEqual(976);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3750);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0077
     * @tc.name      testSafeRangeTail0077
     * @tc.desc      Range length 989 at 2812 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2812;
      const length: number = 989;
      const end: number = offset + length - 1;
      expect(length).assertEqual(989);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3800);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0078
     * @tc.name      testSafeRangeTail0078
     * @tc.desc      Range length 1002 at 2849 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2849;
      const length: number = 1002;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1002);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3850);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0079
     * @tc.name      testSafeRangeTail0079
     * @tc.desc      Range length 1015 at 2886 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2886;
      const length: number = 1015;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1015);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3900);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0080
     * @tc.name      testSafeRangeTail0080
     * @tc.desc      Range length 1028 at 2923 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2923;
      const length: number = 1028;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1028);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(3950);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0081
     * @tc.name      testSafeRangeTail0081
     * @tc.desc      Range length 1041 at 2960 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2960;
      const length: number = 1041;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1041);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4000);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0082
     * @tc.name      testSafeRangeTail0082
     * @tc.desc      Range length 1054 at 2997 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 2997;
      const length: number = 1054;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1054);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4050);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0083
     * @tc.name      testSafeRangeTail0083
     * @tc.desc      Range length 1067 at 3034 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3034;
      const length: number = 1067;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1067);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4100);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0084
     * @tc.name      testSafeRangeTail0084
     * @tc.desc      Range length 1080 at 3071 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3071;
      const length: number = 1080;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1080);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4150);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0085
     * @tc.name      testSafeRangeTail0085
     * @tc.desc      Range length 1093 at 3108 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3108;
      const length: number = 1093;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1093);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4200);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0086
     * @tc.name      testSafeRangeTail0086
     * @tc.desc      Range length 1106 at 3145 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3145;
      const length: number = 1106;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1106);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4250);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0087
     * @tc.name      testSafeRangeTail0087
     * @tc.desc      Range length 1119 at 3182 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3182;
      const length: number = 1119;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1119);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4300);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0088
     * @tc.name      testSafeRangeTail0088
     * @tc.desc      Range length 1132 at 3219 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3219;
      const length: number = 1132;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1132);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4350);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0089
     * @tc.name      testSafeRangeTail0089
     * @tc.desc      Range length 1145 at 3256 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3256;
      const length: number = 1145;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1145);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4400);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0090
     * @tc.name      testSafeRangeTail0090
     * @tc.desc      Range length 1158 at 3293 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3293;
      const length: number = 1158;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1158);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4450);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0091
     * @tc.name      testSafeRangeTail0091
     * @tc.desc      Range length 1171 at 3330 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3330;
      const length: number = 1171;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1171);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4500);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0092
     * @tc.name      testSafeRangeTail0092
     * @tc.desc      Range length 1184 at 3367 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3367;
      const length: number = 1184;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1184);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4550);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0093
     * @tc.name      testSafeRangeTail0093
     * @tc.desc      Range length 1197 at 3404 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3404;
      const length: number = 1197;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1197);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4600);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0094
     * @tc.name      testSafeRangeTail0094
     * @tc.desc      Range length 1210 at 3441 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3441;
      const length: number = 1210;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1210);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4650);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0095
     * @tc.name      testSafeRangeTail0095
     * @tc.desc      Range length 1223 at 3478 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3478;
      const length: number = 1223;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1223);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4700);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0096
     * @tc.name      testSafeRangeTail0096
     * @tc.desc      Range length 1236 at 3515 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3515;
      const length: number = 1236;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1236);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4750);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0097
     * @tc.name      testSafeRangeTail0097
     * @tc.desc      Range length 1249 at 3552 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3552;
      const length: number = 1249;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1249);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4800);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0098
     * @tc.name      testSafeRangeTail0098
     * @tc.desc      Range length 1262 at 3589 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3589;
      const length: number = 1262;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1262);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4850);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0099
     * @tc.name      testSafeRangeTail0099
     * @tc.desc      Range length 1275 at 3626 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3626;
      const length: number = 1275;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1275);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4900);
      expect(offset).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_RGT_0100
     * @tc.name      testSafeRangeTail0100
     * @tc.desc      Range length 1288 at 3663 stays a valid interval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeRangeTail0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const offset: number = 3663;
      const length: number = 1288;
      const end: number = offset + length - 1;
      expect(length).assertEqual(1288);
      expect(end >= offset).assertEqual(true);
      expect(end).assertEqual(4950);
      expect(offset).assertLargerOrEqual(0);
    })
  })
}
