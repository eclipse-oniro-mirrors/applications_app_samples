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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { nativeAdd } from 'library';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function nativeAddBasicMatrixTest() {
  describe('NativeAddBasicMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0001
     * @tc.name      testNativeBasic0001
     * @tc.desc      Add 1000 and 1 through the HAR NAPI add and expect 1001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1000, 1);
      logCase('testNativeBasic0001', `sum=${sum}`);
      expect(sum).assertEqual(1001);
      expect(nativeAdd(1, 1000)).assertEqual(1001);
      expect(nativeAdd(1001, -(1))).assertEqual(1000);
      expect(nativeAdd(1001, -(1000))).assertEqual(1);
      expect(nativeAdd(1001, -(1001))).assertEqual(0);
      expect(Math.abs(nativeAdd(1000, 1)) % 2).assertEqual(1);
      expect(nativeAdd(1000, 1) > 1000).assertTrue();
      expect(nativeAdd(1000, 0)).assertEqual(1000);
      expect(nativeAdd(1000, 1) - 1).assertEqual(1000);
      expect(sum - 1000).assertEqual(1);
      {
      const sum: number = nativeAdd(1037, 54);
      logCase('testNativeBasic0002', `sum=${sum}`);
      expect(sum).assertEqual(1091);
      expect(nativeAdd(54, 1037)).assertEqual(1091);
      expect(nativeAdd(1091, -(54))).assertEqual(1037);
      expect(nativeAdd(1091, -(1037))).assertEqual(54);
      expect(nativeAdd(1091, -(1091))).assertEqual(0);
      expect(nativeAdd(1037, 54) > 1037).assertTrue();
      expect(nativeAdd(1037, 0)).assertEqual(1037);
      expect(nativeAdd(1037, 54) - 54).assertEqual(1037);
      expect(sum - 1037).assertEqual(54);
      }
      {
      const sum: number = nativeAdd(1074, 107);
      logCase('testNativeBasic0003', `sum=${sum}`);
      expect(sum).assertEqual(1181);
      expect(nativeAdd(107, 1074)).assertEqual(1181);
      expect(nativeAdd(1181, -(107))).assertEqual(1074);
      expect(nativeAdd(1181, -(1074))).assertEqual(107);
      expect(nativeAdd(1181, -(1181))).assertEqual(0);
      expect(Math.abs(nativeAdd(1074, 107)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(1074, 107) % 3)).assertEqual(2);
      expect(nativeAdd(1074, 107) > 1074).assertTrue();
      expect(nativeAdd(1074, 0)).assertEqual(1074);
      expect(nativeAdd(1074, 107) - 107).assertEqual(1074);
      expect(sum - 1074).assertEqual(107);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0004
     * @tc.name      testNativeBasic0004
     * @tc.desc      Add 1111 and 160 through the HAR NAPI add and expect 1271
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1111, 160);
      logCase('testNativeBasic0004', `sum=${sum}`);
      expect(sum).assertEqual(1271);
      expect(nativeAdd(160, 1111)).assertEqual(1271);
      expect(nativeAdd(1271, -(160))).assertEqual(1111);
      expect(nativeAdd(1271, -(1111))).assertEqual(160);
      expect(nativeAdd(1271, -(1271))).assertEqual(0);
      expect(nativeAdd(1111, 160) > 1111).assertTrue();
      expect(nativeAdd(1111, 0)).assertEqual(1111);
      expect(nativeAdd(1111, 160) - 160).assertEqual(1111);
      expect(sum - 1111).assertEqual(160);
      {
      const sum: number = nativeAdd(1148, 213);
      logCase('testNativeBasic0005', `sum=${sum}`);
      expect(sum).assertEqual(1361);
      expect(nativeAdd(213, 1148)).assertEqual(1361);
      expect(nativeAdd(1361, -(213))).assertEqual(1148);
      expect(nativeAdd(1361, -(1148))).assertEqual(213);
      expect(nativeAdd(1361, -(1361))).assertEqual(0);
      expect(Math.abs(nativeAdd(1148, 213)) % 2).assertEqual(1);
      expect(nativeAdd(1148, 213) > 1148).assertTrue();
      expect(nativeAdd(1148, 0)).assertEqual(1148);
      expect(nativeAdd(1148, 213) - 213).assertEqual(1148);
      expect(sum - 1148).assertEqual(213);
      }
      {
      const sum: number = nativeAdd(1185, 266);
      logCase('testNativeBasic0006', `sum=${sum}`);
      expect(sum).assertEqual(1451);
      expect(nativeAdd(266, 1185)).assertEqual(1451);
      expect(nativeAdd(1451, -(266))).assertEqual(1185);
      expect(nativeAdd(1451, -(1185))).assertEqual(266);
      expect(nativeAdd(1451, -(1451))).assertEqual(0);
      expect(Math.abs(nativeAdd(1185, 266) % 3)).assertEqual(2);
      expect(nativeAdd(1185, 266) > 1185).assertTrue();
      expect(nativeAdd(1185, 0)).assertEqual(1185);
      expect(nativeAdd(1185, 266) - 266).assertEqual(1185);
      expect(sum - 1185).assertEqual(266);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0007
     * @tc.name      testNativeBasic0007
     * @tc.desc      Add 1222 and 319 through the HAR NAPI add and expect 1541
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1222, 319);
      logCase('testNativeBasic0007', `sum=${sum}`);
      expect(sum).assertEqual(1541);
      expect(nativeAdd(319, 1222)).assertEqual(1541);
      expect(nativeAdd(1541, -(319))).assertEqual(1222);
      expect(nativeAdd(1541, -(1222))).assertEqual(319);
      expect(nativeAdd(1541, -(1541))).assertEqual(0);
      expect(Math.abs(nativeAdd(1222, 319)) % 2).assertEqual(1);
      expect(nativeAdd(1222, 319) > 1222).assertTrue();
      expect(nativeAdd(1222, 0)).assertEqual(1222);
      expect(nativeAdd(1222, 319) - 319).assertEqual(1222);
      expect(sum - 1222).assertEqual(319);
      {
      const sum: number = nativeAdd(1259, 372);
      logCase('testNativeBasic0008', `sum=${sum}`);
      expect(sum).assertEqual(1631);
      expect(nativeAdd(372, 1259)).assertEqual(1631);
      expect(nativeAdd(1631, -(372))).assertEqual(1259);
      expect(nativeAdd(1631, -(1259))).assertEqual(372);
      expect(nativeAdd(1631, -(1631))).assertEqual(0);
      expect(nativeAdd(1259, 372) > 1259).assertTrue();
      expect(nativeAdd(1259, 0)).assertEqual(1259);
      expect(nativeAdd(1259, 372) - 372).assertEqual(1259);
      expect(sum - 1259).assertEqual(372);
      }
      {
      const sum: number = nativeAdd(1296, 425);
      logCase('testNativeBasic0009', `sum=${sum}`);
      expect(sum).assertEqual(1721);
      expect(nativeAdd(425, 1296)).assertEqual(1721);
      expect(nativeAdd(1721, -(425))).assertEqual(1296);
      expect(nativeAdd(1721, -(1296))).assertEqual(425);
      expect(nativeAdd(1721, -(1721))).assertEqual(0);
      expect(Math.abs(nativeAdd(1296, 425)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(1296, 425) % 3)).assertEqual(2);
      expect(nativeAdd(1296, 425) > 1296).assertTrue();
      expect(nativeAdd(1296, 0)).assertEqual(1296);
      expect(nativeAdd(1296, 425) - 425).assertEqual(1296);
      expect(sum - 1296).assertEqual(425);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0010
     * @tc.name      testNativeBasic0010
     * @tc.desc      Add 1333 and 478 through the HAR NAPI add and expect 1811
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1333, 478);
      logCase('testNativeBasic0010', `sum=${sum}`);
      expect(sum).assertEqual(1811);
      expect(nativeAdd(478, 1333)).assertEqual(1811);
      expect(nativeAdd(1811, -(478))).assertEqual(1333);
      expect(nativeAdd(1811, -(1333))).assertEqual(478);
      expect(nativeAdd(1811, -(1811))).assertEqual(0);
      expect(nativeAdd(1333, 478) > 1333).assertTrue();
      expect(nativeAdd(1333, 0)).assertEqual(1333);
      expect(nativeAdd(1333, 478) - 478).assertEqual(1333);
      expect(sum - 1333).assertEqual(478);
      {
      const sum: number = nativeAdd(1370, 531);
      logCase('testNativeBasic0011', `sum=${sum}`);
      expect(sum).assertEqual(1901);
      expect(nativeAdd(531, 1370)).assertEqual(1901);
      expect(nativeAdd(1901, -(531))).assertEqual(1370);
      expect(nativeAdd(1901, -(1370))).assertEqual(531);
      expect(nativeAdd(1901, -(1901))).assertEqual(0);
      expect(Math.abs(nativeAdd(1370, 531)) % 2).assertEqual(1);
      expect(nativeAdd(1370, 531) > 1370).assertTrue();
      expect(nativeAdd(1370, 0)).assertEqual(1370);
      expect(nativeAdd(1370, 531) - 531).assertEqual(1370);
      expect(sum - 1370).assertEqual(531);
      }
      {
      const sum: number = nativeAdd(1407, 584);
      logCase('testNativeBasic0012', `sum=${sum}`);
      expect(sum).assertEqual(1991);
      expect(nativeAdd(584, 1407)).assertEqual(1991);
      expect(nativeAdd(1991, -(584))).assertEqual(1407);
      expect(nativeAdd(1991, -(1407))).assertEqual(584);
      expect(nativeAdd(1991, -(1991))).assertEqual(0);
      expect(Math.abs(nativeAdd(1407, 584) % 3)).assertEqual(2);
      expect(nativeAdd(1407, 584) > 1407).assertTrue();
      expect(nativeAdd(1407, 0)).assertEqual(1407);
      expect(nativeAdd(1407, 584) - 584).assertEqual(1407);
      expect(sum - 1407).assertEqual(584);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0013
     * @tc.name      testNativeBasic0013
     * @tc.desc      Add 1444 and 637 through the HAR NAPI add and expect 2081
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1444, 637);
      logCase('testNativeBasic0013', `sum=${sum}`);
      expect(sum).assertEqual(2081);
      expect(nativeAdd(637, 1444)).assertEqual(2081);
      expect(nativeAdd(2081, -(637))).assertEqual(1444);
      expect(nativeAdd(2081, -(1444))).assertEqual(637);
      expect(nativeAdd(2081, -(2081))).assertEqual(0);
      expect(Math.abs(nativeAdd(1444, 637)) % 2).assertEqual(1);
      expect(nativeAdd(1444, 637) > 1444).assertTrue();
      expect(nativeAdd(1444, 0)).assertEqual(1444);
      expect(nativeAdd(1444, 637) - 637).assertEqual(1444);
      expect(sum - 1444).assertEqual(637);
      {
      const sum: number = nativeAdd(1481, 690);
      logCase('testNativeBasic0014', `sum=${sum}`);
      expect(sum).assertEqual(2171);
      expect(nativeAdd(690, 1481)).assertEqual(2171);
      expect(nativeAdd(2171, -(690))).assertEqual(1481);
      expect(nativeAdd(2171, -(1481))).assertEqual(690);
      expect(nativeAdd(2171, -(2171))).assertEqual(0);
      expect(nativeAdd(1481, 690) > 1481).assertTrue();
      expect(nativeAdd(1481, 0)).assertEqual(1481);
      expect(nativeAdd(1481, 690) - 690).assertEqual(1481);
      expect(sum - 1481).assertEqual(690);
      }
      {
      const sum: number = nativeAdd(1518, 743);
      logCase('testNativeBasic0015', `sum=${sum}`);
      expect(sum).assertEqual(2261);
      expect(nativeAdd(743, 1518)).assertEqual(2261);
      expect(nativeAdd(2261, -(743))).assertEqual(1518);
      expect(nativeAdd(2261, -(1518))).assertEqual(743);
      expect(nativeAdd(2261, -(2261))).assertEqual(0);
      expect(Math.abs(nativeAdd(1518, 743)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(1518, 743) % 3)).assertEqual(2);
      expect(nativeAdd(1518, 743) > 1518).assertTrue();
      expect(nativeAdd(1518, 0)).assertEqual(1518);
      expect(nativeAdd(1518, 743) - 743).assertEqual(1518);
      expect(sum - 1518).assertEqual(743);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0016
     * @tc.name      testNativeBasic0016
     * @tc.desc      Add 1555 and 796 through the HAR NAPI add and expect 2351
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1555, 796);
      logCase('testNativeBasic0016', `sum=${sum}`);
      expect(sum).assertEqual(2351);
      expect(nativeAdd(796, 1555)).assertEqual(2351);
      expect(nativeAdd(2351, -(796))).assertEqual(1555);
      expect(nativeAdd(2351, -(1555))).assertEqual(796);
      expect(nativeAdd(2351, -(2351))).assertEqual(0);
      expect(nativeAdd(1555, 796) > 1555).assertTrue();
      expect(nativeAdd(1555, 0)).assertEqual(1555);
      expect(nativeAdd(1555, 796) - 796).assertEqual(1555);
      expect(sum - 1555).assertEqual(796);
      {
      const sum: number = nativeAdd(1592, 849);
      logCase('testNativeBasic0017', `sum=${sum}`);
      expect(sum).assertEqual(2441);
      expect(nativeAdd(849, 1592)).assertEqual(2441);
      expect(nativeAdd(2441, -(849))).assertEqual(1592);
      expect(nativeAdd(2441, -(1592))).assertEqual(849);
      expect(nativeAdd(2441, -(2441))).assertEqual(0);
      expect(Math.abs(nativeAdd(1592, 849)) % 2).assertEqual(1);
      expect(nativeAdd(1592, 849) > 1592).assertTrue();
      expect(nativeAdd(1592, 0)).assertEqual(1592);
      expect(nativeAdd(1592, 849) - 849).assertEqual(1592);
      expect(sum - 1592).assertEqual(849);
      }
      {
      const sum: number = nativeAdd(1629, 902);
      logCase('testNativeBasic0018', `sum=${sum}`);
      expect(sum).assertEqual(2531);
      expect(nativeAdd(902, 1629)).assertEqual(2531);
      expect(nativeAdd(2531, -(902))).assertEqual(1629);
      expect(nativeAdd(2531, -(1629))).assertEqual(902);
      expect(nativeAdd(2531, -(2531))).assertEqual(0);
      expect(Math.abs(nativeAdd(1629, 902) % 3)).assertEqual(2);
      expect(nativeAdd(1629, 902) > 1629).assertTrue();
      expect(nativeAdd(1629, 0)).assertEqual(1629);
      expect(nativeAdd(1629, 902) - 902).assertEqual(1629);
      expect(sum - 1629).assertEqual(902);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0019
     * @tc.name      testNativeBasic0019
     * @tc.desc      Add 1666 and 955 through the HAR NAPI add and expect 2621
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1666, 955);
      logCase('testNativeBasic0019', `sum=${sum}`);
      expect(sum).assertEqual(2621);
      expect(nativeAdd(955, 1666)).assertEqual(2621);
      expect(nativeAdd(2621, -(955))).assertEqual(1666);
      expect(nativeAdd(2621, -(1666))).assertEqual(955);
      expect(nativeAdd(2621, -(2621))).assertEqual(0);
      expect(Math.abs(nativeAdd(1666, 955)) % 2).assertEqual(1);
      expect(nativeAdd(1666, 955) > 1666).assertTrue();
      expect(nativeAdd(1666, 0)).assertEqual(1666);
      expect(nativeAdd(1666, 955) - 955).assertEqual(1666);
      expect(sum - 1666).assertEqual(955);
      {
      const sum: number = nativeAdd(1703, 11);
      logCase('testNativeBasic0020', `sum=${sum}`);
      expect(sum).assertEqual(1714);
      expect(nativeAdd(11, 1703)).assertEqual(1714);
      expect(nativeAdd(1714, -(11))).assertEqual(1703);
      expect(nativeAdd(1714, -(1703))).assertEqual(11);
      expect(nativeAdd(1714, -(1714))).assertEqual(0);
      expect(nativeAdd(1703, 11) > 1703).assertTrue();
      expect(nativeAdd(1703, 0)).assertEqual(1703);
      expect(nativeAdd(1703, 11) - 11).assertEqual(1703);
      expect(sum - 1703).assertEqual(11);
      }
      {
      const sum: number = nativeAdd(1740, 64);
      logCase('testNativeBasic0021', `sum=${sum}`);
      expect(sum).assertEqual(1804);
      expect(nativeAdd(64, 1740)).assertEqual(1804);
      expect(nativeAdd(1804, -(64))).assertEqual(1740);
      expect(nativeAdd(1804, -(1740))).assertEqual(64);
      expect(nativeAdd(1804, -(1804))).assertEqual(0);
      expect(Math.abs(nativeAdd(1740, 64)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(1740, 64) % 3)).assertEqual(1);
      expect(nativeAdd(1740, 64) > 1740).assertTrue();
      expect(nativeAdd(1740, 0)).assertEqual(1740);
      expect(nativeAdd(1740, 64) - 64).assertEqual(1740);
      expect(sum - 1740).assertEqual(64);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0022
     * @tc.name      testNativeBasic0022
     * @tc.desc      Add 1777 and 117 through the HAR NAPI add and expect 1894
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1777, 117);
      logCase('testNativeBasic0022', `sum=${sum}`);
      expect(sum).assertEqual(1894);
      expect(nativeAdd(117, 1777)).assertEqual(1894);
      expect(nativeAdd(1894, -(117))).assertEqual(1777);
      expect(nativeAdd(1894, -(1777))).assertEqual(117);
      expect(nativeAdd(1894, -(1894))).assertEqual(0);
      expect(nativeAdd(1777, 117) > 1777).assertTrue();
      expect(nativeAdd(1777, 0)).assertEqual(1777);
      expect(nativeAdd(1777, 117) - 117).assertEqual(1777);
      expect(sum - 1777).assertEqual(117);
      {
      const sum: number = nativeAdd(1814, 170);
      logCase('testNativeBasic0023', `sum=${sum}`);
      expect(sum).assertEqual(1984);
      expect(nativeAdd(170, 1814)).assertEqual(1984);
      expect(nativeAdd(1984, -(170))).assertEqual(1814);
      expect(nativeAdd(1984, -(1814))).assertEqual(170);
      expect(nativeAdd(1984, -(1984))).assertEqual(0);
      expect(Math.abs(nativeAdd(1814, 170)) % 2).assertEqual(0);
      expect(nativeAdd(1814, 170) > 1814).assertTrue();
      expect(nativeAdd(1814, 0)).assertEqual(1814);
      expect(nativeAdd(1814, 170) - 170).assertEqual(1814);
      expect(sum - 1814).assertEqual(170);
      }
      {
      const sum: number = nativeAdd(1851, 223);
      logCase('testNativeBasic0024', `sum=${sum}`);
      expect(sum).assertEqual(2074);
      expect(nativeAdd(223, 1851)).assertEqual(2074);
      expect(nativeAdd(2074, -(223))).assertEqual(1851);
      expect(nativeAdd(2074, -(1851))).assertEqual(223);
      expect(nativeAdd(2074, -(2074))).assertEqual(0);
      expect(Math.abs(nativeAdd(1851, 223) % 3)).assertEqual(1);
      expect(nativeAdd(1851, 223) > 1851).assertTrue();
      expect(nativeAdd(1851, 0)).assertEqual(1851);
      expect(nativeAdd(1851, 223) - 223).assertEqual(1851);
      expect(sum - 1851).assertEqual(223);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0025
     * @tc.name      testNativeBasic0025
     * @tc.desc      Add 1888 and 276 through the HAR NAPI add and expect 2164
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1888, 276);
      logCase('testNativeBasic0025', `sum=${sum}`);
      expect(sum).assertEqual(2164);
      expect(nativeAdd(276, 1888)).assertEqual(2164);
      expect(nativeAdd(2164, -(276))).assertEqual(1888);
      expect(nativeAdd(2164, -(1888))).assertEqual(276);
      expect(nativeAdd(2164, -(2164))).assertEqual(0);
      expect(Math.abs(nativeAdd(1888, 276)) % 2).assertEqual(0);
      expect(nativeAdd(1888, 276) > 1888).assertTrue();
      expect(nativeAdd(1888, 0)).assertEqual(1888);
      expect(nativeAdd(1888, 276) - 276).assertEqual(1888);
      expect(sum - 1888).assertEqual(276);
      {
      const sum: number = nativeAdd(1925, 329);
      logCase('testNativeBasic0026', `sum=${sum}`);
      expect(sum).assertEqual(2254);
      expect(nativeAdd(329, 1925)).assertEqual(2254);
      expect(nativeAdd(2254, -(329))).assertEqual(1925);
      expect(nativeAdd(2254, -(1925))).assertEqual(329);
      expect(nativeAdd(2254, -(2254))).assertEqual(0);
      expect(nativeAdd(1925, 329) > 1925).assertTrue();
      expect(nativeAdd(1925, 0)).assertEqual(1925);
      expect(nativeAdd(1925, 329) - 329).assertEqual(1925);
      expect(sum - 1925).assertEqual(329);
      }
      {
      const sum: number = nativeAdd(1962, 382);
      logCase('testNativeBasic0027', `sum=${sum}`);
      expect(sum).assertEqual(2344);
      expect(nativeAdd(382, 1962)).assertEqual(2344);
      expect(nativeAdd(2344, -(382))).assertEqual(1962);
      expect(nativeAdd(2344, -(1962))).assertEqual(382);
      expect(nativeAdd(2344, -(2344))).assertEqual(0);
      expect(Math.abs(nativeAdd(1962, 382)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(1962, 382) % 3)).assertEqual(1);
      expect(nativeAdd(1962, 382) > 1962).assertTrue();
      expect(nativeAdd(1962, 0)).assertEqual(1962);
      expect(nativeAdd(1962, 382) - 382).assertEqual(1962);
      expect(sum - 1962).assertEqual(382);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0028
     * @tc.name      testNativeBasic0028
     * @tc.desc      Add 1999 and 435 through the HAR NAPI add and expect 2434
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(1999, 435);
      logCase('testNativeBasic0028', `sum=${sum}`);
      expect(sum).assertEqual(2434);
      expect(nativeAdd(435, 1999)).assertEqual(2434);
      expect(nativeAdd(2434, -(435))).assertEqual(1999);
      expect(nativeAdd(2434, -(1999))).assertEqual(435);
      expect(nativeAdd(2434, -(2434))).assertEqual(0);
      expect(nativeAdd(1999, 435) > 1999).assertTrue();
      expect(nativeAdd(1999, 0)).assertEqual(1999);
      expect(nativeAdd(1999, 435) - 435).assertEqual(1999);
      expect(sum - 1999).assertEqual(435);
      {
      const sum: number = nativeAdd(2036, 488);
      logCase('testNativeBasic0029', `sum=${sum}`);
      expect(sum).assertEqual(2524);
      expect(nativeAdd(488, 2036)).assertEqual(2524);
      expect(nativeAdd(2524, -(488))).assertEqual(2036);
      expect(nativeAdd(2524, -(2036))).assertEqual(488);
      expect(nativeAdd(2524, -(2524))).assertEqual(0);
      expect(Math.abs(nativeAdd(2036, 488)) % 2).assertEqual(0);
      expect(nativeAdd(2036, 488) > 2036).assertTrue();
      expect(nativeAdd(2036, 0)).assertEqual(2036);
      expect(nativeAdd(2036, 488) - 488).assertEqual(2036);
      expect(sum - 2036).assertEqual(488);
      }
      {
      const sum: number = nativeAdd(2073, 541);
      logCase('testNativeBasic0030', `sum=${sum}`);
      expect(sum).assertEqual(2614);
      expect(nativeAdd(541, 2073)).assertEqual(2614);
      expect(nativeAdd(2614, -(541))).assertEqual(2073);
      expect(nativeAdd(2614, -(2073))).assertEqual(541);
      expect(nativeAdd(2614, -(2614))).assertEqual(0);
      expect(Math.abs(nativeAdd(2073, 541) % 3)).assertEqual(1);
      expect(nativeAdd(2073, 541) > 2073).assertTrue();
      expect(nativeAdd(2073, 0)).assertEqual(2073);
      expect(nativeAdd(2073, 541) - 541).assertEqual(2073);
      expect(sum - 2073).assertEqual(541);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0031
     * @tc.name      testNativeBasic0031
     * @tc.desc      Add 2110 and 594 through the HAR NAPI add and expect 2704
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(2110, 594);
      logCase('testNativeBasic0031', `sum=${sum}`);
      expect(sum).assertEqual(2704);
      expect(nativeAdd(594, 2110)).assertEqual(2704);
      expect(nativeAdd(2704, -(594))).assertEqual(2110);
      expect(nativeAdd(2704, -(2110))).assertEqual(594);
      expect(nativeAdd(2704, -(2704))).assertEqual(0);
      expect(Math.abs(nativeAdd(2110, 594)) % 2).assertEqual(0);
      expect(nativeAdd(2110, 594) > 2110).assertTrue();
      expect(nativeAdd(2110, 0)).assertEqual(2110);
      expect(nativeAdd(2110, 594) - 594).assertEqual(2110);
      expect(sum - 2110).assertEqual(594);
      {
      const sum: number = nativeAdd(2147, 647);
      logCase('testNativeBasic0032', `sum=${sum}`);
      expect(sum).assertEqual(2794);
      expect(nativeAdd(647, 2147)).assertEqual(2794);
      expect(nativeAdd(2794, -(647))).assertEqual(2147);
      expect(nativeAdd(2794, -(2147))).assertEqual(647);
      expect(nativeAdd(2794, -(2794))).assertEqual(0);
      expect(nativeAdd(2147, 647) > 2147).assertTrue();
      expect(nativeAdd(2147, 0)).assertEqual(2147);
      expect(nativeAdd(2147, 647) - 647).assertEqual(2147);
      expect(sum - 2147).assertEqual(647);
      }
      {
      const sum: number = nativeAdd(2184, 700);
      logCase('testNativeBasic0033', `sum=${sum}`);
      expect(sum).assertEqual(2884);
      expect(nativeAdd(700, 2184)).assertEqual(2884);
      expect(nativeAdd(2884, -(700))).assertEqual(2184);
      expect(nativeAdd(2884, -(2184))).assertEqual(700);
      expect(nativeAdd(2884, -(2884))).assertEqual(0);
      expect(Math.abs(nativeAdd(2184, 700)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(2184, 700) % 3)).assertEqual(1);
      expect(nativeAdd(2184, 700) > 2184).assertTrue();
      expect(nativeAdd(2184, 0)).assertEqual(2184);
      expect(nativeAdd(2184, 700) - 700).assertEqual(2184);
      expect(sum - 2184).assertEqual(700);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0034
     * @tc.name      testNativeBasic0034
     * @tc.desc      Add 2221 and 753 through the HAR NAPI add and expect 2974
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(2221, 753);
      logCase('testNativeBasic0034', `sum=${sum}`);
      expect(sum).assertEqual(2974);
      expect(nativeAdd(753, 2221)).assertEqual(2974);
      expect(nativeAdd(2974, -(753))).assertEqual(2221);
      expect(nativeAdd(2974, -(2221))).assertEqual(753);
      expect(nativeAdd(2974, -(2974))).assertEqual(0);
      expect(nativeAdd(2221, 753) > 2221).assertTrue();
      expect(nativeAdd(2221, 0)).assertEqual(2221);
      expect(nativeAdd(2221, 753) - 753).assertEqual(2221);
      expect(sum - 2221).assertEqual(753);
      {
      const sum: number = nativeAdd(2258, 806);
      logCase('testNativeBasic0035', `sum=${sum}`);
      expect(sum).assertEqual(3064);
      expect(nativeAdd(806, 2258)).assertEqual(3064);
      expect(nativeAdd(3064, -(806))).assertEqual(2258);
      expect(nativeAdd(3064, -(2258))).assertEqual(806);
      expect(nativeAdd(3064, -(3064))).assertEqual(0);
      expect(Math.abs(nativeAdd(2258, 806)) % 2).assertEqual(0);
      expect(nativeAdd(2258, 806) > 2258).assertTrue();
      expect(nativeAdd(2258, 0)).assertEqual(2258);
      expect(nativeAdd(2258, 806) - 806).assertEqual(2258);
      expect(sum - 2258).assertEqual(806);
      }
      {
      const sum: number = nativeAdd(2295, 859);
      logCase('testNativeBasic0036', `sum=${sum}`);
      expect(sum).assertEqual(3154);
      expect(nativeAdd(859, 2295)).assertEqual(3154);
      expect(nativeAdd(3154, -(859))).assertEqual(2295);
      expect(nativeAdd(3154, -(2295))).assertEqual(859);
      expect(nativeAdd(3154, -(3154))).assertEqual(0);
      expect(Math.abs(nativeAdd(2295, 859) % 3)).assertEqual(1);
      expect(nativeAdd(2295, 859) > 2295).assertTrue();
      expect(nativeAdd(2295, 0)).assertEqual(2295);
      expect(nativeAdd(2295, 859) - 859).assertEqual(2295);
      expect(sum - 2295).assertEqual(859);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0037
     * @tc.name      testNativeBasic0037
     * @tc.desc      Add 2332 and 912 through the HAR NAPI add and expect 3244
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(2332, 912);
      logCase('testNativeBasic0037', `sum=${sum}`);
      expect(sum).assertEqual(3244);
      expect(nativeAdd(912, 2332)).assertEqual(3244);
      expect(nativeAdd(3244, -(912))).assertEqual(2332);
      expect(nativeAdd(3244, -(2332))).assertEqual(912);
      expect(nativeAdd(3244, -(3244))).assertEqual(0);
      expect(Math.abs(nativeAdd(2332, 912)) % 2).assertEqual(0);
      expect(nativeAdd(2332, 912) > 2332).assertTrue();
      expect(nativeAdd(2332, 0)).assertEqual(2332);
      expect(nativeAdd(2332, 912) - 912).assertEqual(2332);
      expect(sum - 2332).assertEqual(912);
      {
      const sum: number = nativeAdd(2369, 965);
      logCase('testNativeBasic0038', `sum=${sum}`);
      expect(sum).assertEqual(3334);
      expect(nativeAdd(965, 2369)).assertEqual(3334);
      expect(nativeAdd(3334, -(965))).assertEqual(2369);
      expect(nativeAdd(3334, -(2369))).assertEqual(965);
      expect(nativeAdd(3334, -(3334))).assertEqual(0);
      expect(nativeAdd(2369, 965) > 2369).assertTrue();
      expect(nativeAdd(2369, 0)).assertEqual(2369);
      expect(nativeAdd(2369, 965) - 965).assertEqual(2369);
      expect(sum - 2369).assertEqual(965);
      }
      {
      const sum: number = nativeAdd(2406, 21);
      logCase('testNativeBasic0039', `sum=${sum}`);
      expect(sum).assertEqual(2427);
      expect(nativeAdd(21, 2406)).assertEqual(2427);
      expect(nativeAdd(2427, -(21))).assertEqual(2406);
      expect(nativeAdd(2427, -(2406))).assertEqual(21);
      expect(nativeAdd(2427, -(2427))).assertEqual(0);
      expect(Math.abs(nativeAdd(2406, 21)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(2406, 21) % 3)).assertEqual(0);
      expect(nativeAdd(2406, 21) > 2406).assertTrue();
      expect(nativeAdd(2406, 0)).assertEqual(2406);
      expect(nativeAdd(2406, 21) - 21).assertEqual(2406);
      expect(sum - 2406).assertEqual(21);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0040
     * @tc.name      testNativeBasic0040
     * @tc.desc      Add 2443 and 74 through the HAR NAPI add and expect 2517
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(2443, 74);
      logCase('testNativeBasic0040', `sum=${sum}`);
      expect(sum).assertEqual(2517);
      expect(nativeAdd(74, 2443)).assertEqual(2517);
      expect(nativeAdd(2517, -(74))).assertEqual(2443);
      expect(nativeAdd(2517, -(2443))).assertEqual(74);
      expect(nativeAdd(2517, -(2517))).assertEqual(0);
      expect(nativeAdd(2443, 74) > 2443).assertTrue();
      expect(nativeAdd(2443, 0)).assertEqual(2443);
      expect(nativeAdd(2443, 74) - 74).assertEqual(2443);
      expect(sum - 2443).assertEqual(74);
      {
      const sum: number = nativeAdd(2480, 127);
      logCase('testNativeBasic0041', `sum=${sum}`);
      expect(sum).assertEqual(2607);
      expect(nativeAdd(127, 2480)).assertEqual(2607);
      expect(nativeAdd(2607, -(127))).assertEqual(2480);
      expect(nativeAdd(2607, -(2480))).assertEqual(127);
      expect(nativeAdd(2607, -(2607))).assertEqual(0);
      expect(Math.abs(nativeAdd(2480, 127)) % 2).assertEqual(1);
      expect(nativeAdd(2480, 127) > 2480).assertTrue();
      expect(nativeAdd(2480, 0)).assertEqual(2480);
      expect(nativeAdd(2480, 127) - 127).assertEqual(2480);
      expect(sum - 2480).assertEqual(127);
      }
      {
      const sum: number = nativeAdd(2517, 180);
      logCase('testNativeBasic0042', `sum=${sum}`);
      expect(sum).assertEqual(2697);
      expect(nativeAdd(180, 2517)).assertEqual(2697);
      expect(nativeAdd(2697, -(180))).assertEqual(2517);
      expect(nativeAdd(2697, -(2517))).assertEqual(180);
      expect(nativeAdd(2697, -(2697))).assertEqual(0);
      expect(Math.abs(nativeAdd(2517, 180) % 3)).assertEqual(0);
      expect(nativeAdd(2517, 180) > 2517).assertTrue();
      expect(nativeAdd(2517, 0)).assertEqual(2517);
      expect(nativeAdd(2517, 180) - 180).assertEqual(2517);
      expect(sum - 2517).assertEqual(180);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0043
     * @tc.name      testNativeBasic0043
     * @tc.desc      Add 2554 and 233 through the HAR NAPI add and expect 2787
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeBasic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(2554, 233);
      logCase('testNativeBasic0043', `sum=${sum}`);
      expect(sum).assertEqual(2787);
      expect(nativeAdd(233, 2554)).assertEqual(2787);
      expect(nativeAdd(2787, -(233))).assertEqual(2554);
      expect(nativeAdd(2787, -(2554))).assertEqual(233);
      expect(nativeAdd(2787, -(2787))).assertEqual(0);
      expect(Math.abs(nativeAdd(2554, 233)) % 2).assertEqual(1);
      expect(nativeAdd(2554, 233) > 2554).assertTrue();
      expect(nativeAdd(2554, 0)).assertEqual(2554);
      expect(nativeAdd(2554, 233) - 233).assertEqual(2554);
      expect(sum - 2554).assertEqual(233);
      {
      const sum: number = nativeAdd(2591, 286);
      logCase('testNativeBasic0044', `sum=${sum}`);
      expect(sum).assertEqual(2877);
      expect(nativeAdd(286, 2591)).assertEqual(2877);
      expect(nativeAdd(2877, -(286))).assertEqual(2591);
      expect(nativeAdd(2877, -(2591))).assertEqual(286);
      expect(nativeAdd(2877, -(2877))).assertEqual(0);
      expect(nativeAdd(2591, 286) > 2591).assertTrue();
      expect(nativeAdd(2591, 0)).assertEqual(2591);
      expect(nativeAdd(2591, 286) - 286).assertEqual(2591);
      expect(sum - 2591).assertEqual(286);
      }
      {
      const sum: number = nativeAdd(2628, 339);
      logCase('testNativeBasic0045', `sum=${sum}`);
      expect(sum).assertEqual(2967);
      expect(nativeAdd(339, 2628)).assertEqual(2967);
      expect(nativeAdd(2967, -(339))).assertEqual(2628);
      expect(nativeAdd(2967, -(2628))).assertEqual(339);
      expect(nativeAdd(2967, -(2967))).assertEqual(0);
      expect(Math.abs(nativeAdd(2628, 339)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(2628, 339) % 3)).assertEqual(0);
      expect(nativeAdd(2628, 339) > 2628).assertTrue();
      expect(nativeAdd(2628, 0)).assertEqual(2628);
      expect(nativeAdd(2628, 339) - 339).assertEqual(2628);
      expect(sum - 2628).assertEqual(339);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0046
     * @tc.name      testNativeBasic0046
     * @tc.desc      Add 2665 and 392 through the HAR NAPI add and expect 3057
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2665, 392);
      logCase('testNativeBasic0046', `sum=${sum}`);
      expect(sum).assertEqual(3057);
      expect(nativeAdd(392, 2665)).assertEqual(3057);
      expect(nativeAdd(3057, -(392))).assertEqual(2665);
      expect(nativeAdd(3057, -(2665))).assertEqual(392);
      expect(nativeAdd(3057, -(3057))).assertEqual(0);
      expect(nativeAdd(2665, 392) > 2665).assertTrue();
      expect(nativeAdd(2665, 0)).assertEqual(2665);
      expect(nativeAdd(2665, 392) - 392).assertEqual(2665);
      expect(sum - 2665).assertEqual(392);
      {
      const sum: number = nativeAdd(2702, 445);
      logCase('testNativeBasic0047', `sum=${sum}`);
      expect(sum).assertEqual(3147);
      expect(nativeAdd(445, 2702)).assertEqual(3147);
      expect(nativeAdd(3147, -(445))).assertEqual(2702);
      expect(nativeAdd(3147, -(2702))).assertEqual(445);
      expect(nativeAdd(3147, -(3147))).assertEqual(0);
      expect(Math.abs(nativeAdd(2702, 445)) % 2).assertEqual(1);
      expect(nativeAdd(2702, 445) > 2702).assertTrue();
      expect(nativeAdd(2702, 0)).assertEqual(2702);
      expect(nativeAdd(2702, 445) - 445).assertEqual(2702);
      expect(sum - 2702).assertEqual(445);
      }
      {
      const sum: number = nativeAdd(2739, 498);
      logCase('testNativeBasic0048', `sum=${sum}`);
      expect(sum).assertEqual(3237);
      expect(nativeAdd(498, 2739)).assertEqual(3237);
      expect(nativeAdd(3237, -(498))).assertEqual(2739);
      expect(nativeAdd(3237, -(2739))).assertEqual(498);
      expect(nativeAdd(3237, -(3237))).assertEqual(0);
      expect(Math.abs(nativeAdd(2739, 498) % 3)).assertEqual(0);
      expect(nativeAdd(2739, 498) > 2739).assertTrue();
      expect(nativeAdd(2739, 0)).assertEqual(2739);
      expect(nativeAdd(2739, 498) - 498).assertEqual(2739);
      expect(sum - 2739).assertEqual(498);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0049
     * @tc.name      testNativeBasic0049
     * @tc.desc      Add 2776 and 551 through the HAR NAPI add and expect 3327
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2776, 551);
      logCase('testNativeBasic0049', `sum=${sum}`);
      expect(sum).assertEqual(3327);
      expect(nativeAdd(551, 2776)).assertEqual(3327);
      expect(nativeAdd(3327, -(551))).assertEqual(2776);
      expect(nativeAdd(3327, -(2776))).assertEqual(551);
      expect(nativeAdd(3327, -(3327))).assertEqual(0);
      expect(Math.abs(nativeAdd(2776, 551)) % 2).assertEqual(1);
      expect(nativeAdd(2776, 551) > 2776).assertTrue();
      expect(nativeAdd(2776, 0)).assertEqual(2776);
      expect(nativeAdd(2776, 551) - 551).assertEqual(2776);
      expect(sum - 2776).assertEqual(551);
      {
      const sum: number = nativeAdd(2813, 604);
      logCase('testNativeBasic0050', `sum=${sum}`);
      expect(sum).assertEqual(3417);
      expect(nativeAdd(604, 2813)).assertEqual(3417);
      expect(nativeAdd(3417, -(604))).assertEqual(2813);
      expect(nativeAdd(3417, -(2813))).assertEqual(604);
      expect(nativeAdd(3417, -(3417))).assertEqual(0);
      expect(nativeAdd(2813, 604) > 2813).assertTrue();
      expect(nativeAdd(2813, 0)).assertEqual(2813);
      expect(nativeAdd(2813, 604) - 604).assertEqual(2813);
      expect(sum - 2813).assertEqual(604);
      }
      {
      const sum: number = nativeAdd(2850, 657);
      logCase('testNativeBasic0051', `sum=${sum}`);
      expect(sum).assertEqual(3507);
      expect(nativeAdd(657, 2850)).assertEqual(3507);
      expect(nativeAdd(3507, -(657))).assertEqual(2850);
      expect(nativeAdd(3507, -(2850))).assertEqual(657);
      expect(nativeAdd(3507, -(3507))).assertEqual(0);
      expect(Math.abs(nativeAdd(2850, 657)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(2850, 657) % 3)).assertEqual(0);
      expect(nativeAdd(2850, 657) > 2850).assertTrue();
      expect(nativeAdd(2850, 0)).assertEqual(2850);
      expect(nativeAdd(2850, 657) - 657).assertEqual(2850);
      expect(sum - 2850).assertEqual(657);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0052
     * @tc.name      testNativeBasic0052
     * @tc.desc      Add 2887 and 710 through the HAR NAPI add and expect 3597
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2887, 710);
      logCase('testNativeBasic0052', `sum=${sum}`);
      expect(sum).assertEqual(3597);
      expect(nativeAdd(710, 2887)).assertEqual(3597);
      expect(nativeAdd(3597, -(710))).assertEqual(2887);
      expect(nativeAdd(3597, -(2887))).assertEqual(710);
      expect(nativeAdd(3597, -(3597))).assertEqual(0);
      expect(nativeAdd(2887, 710) > 2887).assertTrue();
      expect(nativeAdd(2887, 0)).assertEqual(2887);
      expect(nativeAdd(2887, 710) - 710).assertEqual(2887);
      expect(sum - 2887).assertEqual(710);
      {
      const sum: number = nativeAdd(2924, 763);
      logCase('testNativeBasic0053', `sum=${sum}`);
      expect(sum).assertEqual(3687);
      expect(nativeAdd(763, 2924)).assertEqual(3687);
      expect(nativeAdd(3687, -(763))).assertEqual(2924);
      expect(nativeAdd(3687, -(2924))).assertEqual(763);
      expect(nativeAdd(3687, -(3687))).assertEqual(0);
      expect(Math.abs(nativeAdd(2924, 763)) % 2).assertEqual(1);
      expect(nativeAdd(2924, 763) > 2924).assertTrue();
      expect(nativeAdd(2924, 0)).assertEqual(2924);
      expect(nativeAdd(2924, 763) - 763).assertEqual(2924);
      expect(sum - 2924).assertEqual(763);
      }
      {
      const sum: number = nativeAdd(2961, 816);
      logCase('testNativeBasic0054', `sum=${sum}`);
      expect(sum).assertEqual(3777);
      expect(nativeAdd(816, 2961)).assertEqual(3777);
      expect(nativeAdd(3777, -(816))).assertEqual(2961);
      expect(nativeAdd(3777, -(2961))).assertEqual(816);
      expect(nativeAdd(3777, -(3777))).assertEqual(0);
      expect(Math.abs(nativeAdd(2961, 816) % 3)).assertEqual(0);
      expect(nativeAdd(2961, 816) > 2961).assertTrue();
      expect(nativeAdd(2961, 0)).assertEqual(2961);
      expect(nativeAdd(2961, 816) - 816).assertEqual(2961);
      expect(sum - 2961).assertEqual(816);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0055
     * @tc.name      testNativeBasic0055
     * @tc.desc      Add 2998 and 869 through the HAR NAPI add and expect 3867
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(2998, 869);
      logCase('testNativeBasic0055', `sum=${sum}`);
      expect(sum).assertEqual(3867);
      expect(nativeAdd(869, 2998)).assertEqual(3867);
      expect(nativeAdd(3867, -(869))).assertEqual(2998);
      expect(nativeAdd(3867, -(2998))).assertEqual(869);
      expect(nativeAdd(3867, -(3867))).assertEqual(0);
      expect(Math.abs(nativeAdd(2998, 869)) % 2).assertEqual(1);
      expect(nativeAdd(2998, 869) > 2998).assertTrue();
      expect(nativeAdd(2998, 0)).assertEqual(2998);
      expect(nativeAdd(2998, 869) - 869).assertEqual(2998);
      expect(sum - 2998).assertEqual(869);
      {
      const sum: number = nativeAdd(3035, 922);
      logCase('testNativeBasic0056', `sum=${sum}`);
      expect(sum).assertEqual(3957);
      expect(nativeAdd(922, 3035)).assertEqual(3957);
      expect(nativeAdd(3957, -(922))).assertEqual(3035);
      expect(nativeAdd(3957, -(3035))).assertEqual(922);
      expect(nativeAdd(3957, -(3957))).assertEqual(0);
      expect(nativeAdd(3035, 922) > 3035).assertTrue();
      expect(nativeAdd(3035, 0)).assertEqual(3035);
      expect(nativeAdd(3035, 922) - 922).assertEqual(3035);
      expect(sum - 3035).assertEqual(922);
      }
      {
      const sum: number = nativeAdd(3072, 975);
      logCase('testNativeBasic0057', `sum=${sum}`);
      expect(sum).assertEqual(4047);
      expect(nativeAdd(975, 3072)).assertEqual(4047);
      expect(nativeAdd(4047, -(975))).assertEqual(3072);
      expect(nativeAdd(4047, -(3072))).assertEqual(975);
      expect(nativeAdd(4047, -(4047))).assertEqual(0);
      expect(Math.abs(nativeAdd(3072, 975)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(3072, 975) % 3)).assertEqual(0);
      expect(nativeAdd(3072, 975) > 3072).assertTrue();
      expect(nativeAdd(3072, 0)).assertEqual(3072);
      expect(nativeAdd(3072, 975) - 975).assertEqual(3072);
      expect(sum - 3072).assertEqual(975);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0058
     * @tc.name      testNativeBasic0058
     * @tc.desc      Add 3109 and 31 through the HAR NAPI add and expect 3140
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(3109, 31);
      logCase('testNativeBasic0058', `sum=${sum}`);
      expect(sum).assertEqual(3140);
      expect(nativeAdd(31, 3109)).assertEqual(3140);
      expect(nativeAdd(3140, -(31))).assertEqual(3109);
      expect(nativeAdd(3140, -(3109))).assertEqual(31);
      expect(nativeAdd(3140, -(3140))).assertEqual(0);
      expect(nativeAdd(3109, 31) > 3109).assertTrue();
      expect(nativeAdd(3109, 0)).assertEqual(3109);
      expect(nativeAdd(3109, 31) - 31).assertEqual(3109);
      expect(sum - 3109).assertEqual(31);
      {
      const sum: number = nativeAdd(3146, 84);
      logCase('testNativeBasic0059', `sum=${sum}`);
      expect(sum).assertEqual(3230);
      expect(nativeAdd(84, 3146)).assertEqual(3230);
      expect(nativeAdd(3230, -(84))).assertEqual(3146);
      expect(nativeAdd(3230, -(3146))).assertEqual(84);
      expect(nativeAdd(3230, -(3230))).assertEqual(0);
      expect(Math.abs(nativeAdd(3146, 84)) % 2).assertEqual(0);
      expect(nativeAdd(3146, 84) > 3146).assertTrue();
      expect(nativeAdd(3146, 0)).assertEqual(3146);
      expect(nativeAdd(3146, 84) - 84).assertEqual(3146);
      expect(sum - 3146).assertEqual(84);
      }
      {
      const sum: number = nativeAdd(3183, 137);
      logCase('testNativeBasic0060', `sum=${sum}`);
      expect(sum).assertEqual(3320);
      expect(nativeAdd(137, 3183)).assertEqual(3320);
      expect(nativeAdd(3320, -(137))).assertEqual(3183);
      expect(nativeAdd(3320, -(3183))).assertEqual(137);
      expect(nativeAdd(3320, -(3320))).assertEqual(0);
      expect(Math.abs(nativeAdd(3183, 137) % 3)).assertEqual(2);
      expect(nativeAdd(3183, 137) > 3183).assertTrue();
      expect(nativeAdd(3183, 0)).assertEqual(3183);
      expect(nativeAdd(3183, 137) - 137).assertEqual(3183);
      expect(sum - 3183).assertEqual(137);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0061
     * @tc.name      testNativeBasic0061
     * @tc.desc      Add 3220 and 190 through the HAR NAPI add and expect 3410
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(3220, 190);
      logCase('testNativeBasic0061', `sum=${sum}`);
      expect(sum).assertEqual(3410);
      expect(nativeAdd(190, 3220)).assertEqual(3410);
      expect(nativeAdd(3410, -(190))).assertEqual(3220);
      expect(nativeAdd(3410, -(3220))).assertEqual(190);
      expect(nativeAdd(3410, -(3410))).assertEqual(0);
      expect(Math.abs(nativeAdd(3220, 190)) % 2).assertEqual(0);
      expect(nativeAdd(3220, 190) > 3220).assertTrue();
      expect(nativeAdd(3220, 0)).assertEqual(3220);
      expect(nativeAdd(3220, 190) - 190).assertEqual(3220);
      expect(sum - 3220).assertEqual(190);
      {
      const sum: number = nativeAdd(3257, 243);
      logCase('testNativeBasic0062', `sum=${sum}`);
      expect(sum).assertEqual(3500);
      expect(nativeAdd(243, 3257)).assertEqual(3500);
      expect(nativeAdd(3500, -(243))).assertEqual(3257);
      expect(nativeAdd(3500, -(3257))).assertEqual(243);
      expect(nativeAdd(3500, -(3500))).assertEqual(0);
      expect(nativeAdd(3257, 243) > 3257).assertTrue();
      expect(nativeAdd(3257, 0)).assertEqual(3257);
      expect(nativeAdd(3257, 243) - 243).assertEqual(3257);
      expect(sum - 3257).assertEqual(243);
      }
      {
      const sum: number = nativeAdd(3294, 296);
      logCase('testNativeBasic0063', `sum=${sum}`);
      expect(sum).assertEqual(3590);
      expect(nativeAdd(296, 3294)).assertEqual(3590);
      expect(nativeAdd(3590, -(296))).assertEqual(3294);
      expect(nativeAdd(3590, -(3294))).assertEqual(296);
      expect(nativeAdd(3590, -(3590))).assertEqual(0);
      expect(Math.abs(nativeAdd(3294, 296)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(3294, 296) % 3)).assertEqual(2);
      expect(nativeAdd(3294, 296) > 3294).assertTrue();
      expect(nativeAdd(3294, 0)).assertEqual(3294);
      expect(nativeAdd(3294, 296) - 296).assertEqual(3294);
      expect(sum - 3294).assertEqual(296);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0064
     * @tc.name      testNativeBasic0064
     * @tc.desc      Add 3331 and 349 through the HAR NAPI add and expect 3680
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(3331, 349);
      logCase('testNativeBasic0064', `sum=${sum}`);
      expect(sum).assertEqual(3680);
      expect(nativeAdd(349, 3331)).assertEqual(3680);
      expect(nativeAdd(3680, -(349))).assertEqual(3331);
      expect(nativeAdd(3680, -(3331))).assertEqual(349);
      expect(nativeAdd(3680, -(3680))).assertEqual(0);
      expect(nativeAdd(3331, 349) > 3331).assertTrue();
      expect(nativeAdd(3331, 0)).assertEqual(3331);
      expect(nativeAdd(3331, 349) - 349).assertEqual(3331);
      expect(sum - 3331).assertEqual(349);
      {
      const sum: number = nativeAdd(3368, 402);
      logCase('testNativeBasic0065', `sum=${sum}`);
      expect(sum).assertEqual(3770);
      expect(nativeAdd(402, 3368)).assertEqual(3770);
      expect(nativeAdd(3770, -(402))).assertEqual(3368);
      expect(nativeAdd(3770, -(3368))).assertEqual(402);
      expect(nativeAdd(3770, -(3770))).assertEqual(0);
      expect(Math.abs(nativeAdd(3368, 402)) % 2).assertEqual(0);
      expect(nativeAdd(3368, 402) > 3368).assertTrue();
      expect(nativeAdd(3368, 0)).assertEqual(3368);
      expect(nativeAdd(3368, 402) - 402).assertEqual(3368);
      expect(sum - 3368).assertEqual(402);
      }
      {
      const sum: number = nativeAdd(3405, 455);
      logCase('testNativeBasic0066', `sum=${sum}`);
      expect(sum).assertEqual(3860);
      expect(nativeAdd(455, 3405)).assertEqual(3860);
      expect(nativeAdd(3860, -(455))).assertEqual(3405);
      expect(nativeAdd(3860, -(3405))).assertEqual(455);
      expect(nativeAdd(3860, -(3860))).assertEqual(0);
      expect(Math.abs(nativeAdd(3405, 455) % 3)).assertEqual(2);
      expect(nativeAdd(3405, 455) > 3405).assertTrue();
      expect(nativeAdd(3405, 0)).assertEqual(3405);
      expect(nativeAdd(3405, 455) - 455).assertEqual(3405);
      expect(sum - 3405).assertEqual(455);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0067
     * @tc.name      testNativeBasic0067
     * @tc.desc      Add 3442 and 508 through the HAR NAPI add and expect 3950
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(3442, 508);
      logCase('testNativeBasic0067', `sum=${sum}`);
      expect(sum).assertEqual(3950);
      expect(nativeAdd(508, 3442)).assertEqual(3950);
      expect(nativeAdd(3950, -(508))).assertEqual(3442);
      expect(nativeAdd(3950, -(3442))).assertEqual(508);
      expect(nativeAdd(3950, -(3950))).assertEqual(0);
      expect(Math.abs(nativeAdd(3442, 508)) % 2).assertEqual(0);
      expect(nativeAdd(3442, 508) > 3442).assertTrue();
      expect(nativeAdd(3442, 0)).assertEqual(3442);
      expect(nativeAdd(3442, 508) - 508).assertEqual(3442);
      expect(sum - 3442).assertEqual(508);
      {
      const sum: number = nativeAdd(3479, 561);
      logCase('testNativeBasic0068', `sum=${sum}`);
      expect(sum).assertEqual(4040);
      expect(nativeAdd(561, 3479)).assertEqual(4040);
      expect(nativeAdd(4040, -(561))).assertEqual(3479);
      expect(nativeAdd(4040, -(3479))).assertEqual(561);
      expect(nativeAdd(4040, -(4040))).assertEqual(0);
      expect(nativeAdd(3479, 561) > 3479).assertTrue();
      expect(nativeAdd(3479, 0)).assertEqual(3479);
      expect(nativeAdd(3479, 561) - 561).assertEqual(3479);
      expect(sum - 3479).assertEqual(561);
      }
      {
      const sum: number = nativeAdd(3516, 614);
      logCase('testNativeBasic0069', `sum=${sum}`);
      expect(sum).assertEqual(4130);
      expect(nativeAdd(614, 3516)).assertEqual(4130);
      expect(nativeAdd(4130, -(614))).assertEqual(3516);
      expect(nativeAdd(4130, -(3516))).assertEqual(614);
      expect(nativeAdd(4130, -(4130))).assertEqual(0);
      expect(Math.abs(nativeAdd(3516, 614)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(3516, 614) % 3)).assertEqual(2);
      expect(nativeAdd(3516, 614) > 3516).assertTrue();
      expect(nativeAdd(3516, 0)).assertEqual(3516);
      expect(nativeAdd(3516, 614) - 614).assertEqual(3516);
      expect(sum - 3516).assertEqual(614);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0070
     * @tc.name      testNativeBasic0070
     * @tc.desc      Add 3553 and 667 through the HAR NAPI add and expect 4220
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(3553, 667);
      logCase('testNativeBasic0070', `sum=${sum}`);
      expect(sum).assertEqual(4220);
      expect(nativeAdd(667, 3553)).assertEqual(4220);
      expect(nativeAdd(4220, -(667))).assertEqual(3553);
      expect(nativeAdd(4220, -(3553))).assertEqual(667);
      expect(nativeAdd(4220, -(4220))).assertEqual(0);
      expect(nativeAdd(3553, 667) > 3553).assertTrue();
      expect(nativeAdd(3553, 0)).assertEqual(3553);
      expect(nativeAdd(3553, 667) - 667).assertEqual(3553);
      expect(sum - 3553).assertEqual(667);
      {
      const sum: number = nativeAdd(3590, 720);
      logCase('testNativeBasic0071', `sum=${sum}`);
      expect(sum).assertEqual(4310);
      expect(nativeAdd(720, 3590)).assertEqual(4310);
      expect(nativeAdd(4310, -(720))).assertEqual(3590);
      expect(nativeAdd(4310, -(3590))).assertEqual(720);
      expect(nativeAdd(4310, -(4310))).assertEqual(0);
      expect(Math.abs(nativeAdd(3590, 720)) % 2).assertEqual(0);
      expect(nativeAdd(3590, 720) > 3590).assertTrue();
      expect(nativeAdd(3590, 0)).assertEqual(3590);
      expect(nativeAdd(3590, 720) - 720).assertEqual(3590);
      expect(sum - 3590).assertEqual(720);
      }
      {
      const sum: number = nativeAdd(3627, 773);
      logCase('testNativeBasic0072', `sum=${sum}`);
      expect(sum).assertEqual(4400);
      expect(nativeAdd(773, 3627)).assertEqual(4400);
      expect(nativeAdd(4400, -(773))).assertEqual(3627);
      expect(nativeAdd(4400, -(3627))).assertEqual(773);
      expect(nativeAdd(4400, -(4400))).assertEqual(0);
      expect(Math.abs(nativeAdd(3627, 773) % 3)).assertEqual(2);
      expect(nativeAdd(3627, 773) > 3627).assertTrue();
      expect(nativeAdd(3627, 0)).assertEqual(3627);
      expect(nativeAdd(3627, 773) - 773).assertEqual(3627);
      expect(sum - 3627).assertEqual(773);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0073
     * @tc.name      testNativeBasic0073
     * @tc.desc      Add 3664 and 826 through the HAR NAPI add and expect 4490
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(3664, 826);
      logCase('testNativeBasic0073', `sum=${sum}`);
      expect(sum).assertEqual(4490);
      expect(nativeAdd(826, 3664)).assertEqual(4490);
      expect(nativeAdd(4490, -(826))).assertEqual(3664);
      expect(nativeAdd(4490, -(3664))).assertEqual(826);
      expect(nativeAdd(4490, -(4490))).assertEqual(0);
      expect(Math.abs(nativeAdd(3664, 826)) % 2).assertEqual(0);
      expect(nativeAdd(3664, 826) > 3664).assertTrue();
      expect(nativeAdd(3664, 0)).assertEqual(3664);
      expect(nativeAdd(3664, 826) - 826).assertEqual(3664);
      expect(sum - 3664).assertEqual(826);
      {
      const sum: number = nativeAdd(3701, 879);
      logCase('testNativeBasic0074', `sum=${sum}`);
      expect(sum).assertEqual(4580);
      expect(nativeAdd(879, 3701)).assertEqual(4580);
      expect(nativeAdd(4580, -(879))).assertEqual(3701);
      expect(nativeAdd(4580, -(3701))).assertEqual(879);
      expect(nativeAdd(4580, -(4580))).assertEqual(0);
      expect(nativeAdd(3701, 879) > 3701).assertTrue();
      expect(nativeAdd(3701, 0)).assertEqual(3701);
      expect(nativeAdd(3701, 879) - 879).assertEqual(3701);
      expect(sum - 3701).assertEqual(879);
      }
      {
      const sum: number = nativeAdd(3738, 932);
      logCase('testNativeBasic0075', `sum=${sum}`);
      expect(sum).assertEqual(4670);
      expect(nativeAdd(932, 3738)).assertEqual(4670);
      expect(nativeAdd(4670, -(932))).assertEqual(3738);
      expect(nativeAdd(4670, -(3738))).assertEqual(932);
      expect(nativeAdd(4670, -(4670))).assertEqual(0);
      expect(Math.abs(nativeAdd(3738, 932)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(3738, 932) % 3)).assertEqual(2);
      expect(nativeAdd(3738, 932) > 3738).assertTrue();
      expect(nativeAdd(3738, 0)).assertEqual(3738);
      expect(nativeAdd(3738, 932) - 932).assertEqual(3738);
      expect(sum - 3738).assertEqual(932);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0076
     * @tc.name      testNativeBasic0076
     * @tc.desc      Add 3775 and 985 through the HAR NAPI add and expect 4760
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(3775, 985);
      logCase('testNativeBasic0076', `sum=${sum}`);
      expect(sum).assertEqual(4760);
      expect(nativeAdd(985, 3775)).assertEqual(4760);
      expect(nativeAdd(4760, -(985))).assertEqual(3775);
      expect(nativeAdd(4760, -(3775))).assertEqual(985);
      expect(nativeAdd(4760, -(4760))).assertEqual(0);
      expect(nativeAdd(3775, 985) > 3775).assertTrue();
      expect(nativeAdd(3775, 0)).assertEqual(3775);
      expect(nativeAdd(3775, 985) - 985).assertEqual(3775);
      expect(sum - 3775).assertEqual(985);
      {
      const sum: number = nativeAdd(3812, 41);
      logCase('testNativeBasic0077', `sum=${sum}`);
      expect(sum).assertEqual(3853);
      expect(nativeAdd(41, 3812)).assertEqual(3853);
      expect(nativeAdd(3853, -(41))).assertEqual(3812);
      expect(nativeAdd(3853, -(3812))).assertEqual(41);
      expect(nativeAdd(3853, -(3853))).assertEqual(0);
      expect(Math.abs(nativeAdd(3812, 41)) % 2).assertEqual(1);
      expect(nativeAdd(3812, 41) > 3812).assertTrue();
      expect(nativeAdd(3812, 0)).assertEqual(3812);
      expect(nativeAdd(3812, 41) - 41).assertEqual(3812);
      expect(sum - 3812).assertEqual(41);
      }
      {
      const sum: number = nativeAdd(3849, 94);
      logCase('testNativeBasic0078', `sum=${sum}`);
      expect(sum).assertEqual(3943);
      expect(nativeAdd(94, 3849)).assertEqual(3943);
      expect(nativeAdd(3943, -(94))).assertEqual(3849);
      expect(nativeAdd(3943, -(3849))).assertEqual(94);
      expect(nativeAdd(3943, -(3943))).assertEqual(0);
      expect(Math.abs(nativeAdd(3849, 94) % 3)).assertEqual(1);
      expect(nativeAdd(3849, 94) > 3849).assertTrue();
      expect(nativeAdd(3849, 0)).assertEqual(3849);
      expect(nativeAdd(3849, 94) - 94).assertEqual(3849);
      expect(sum - 3849).assertEqual(94);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0079
     * @tc.name      testNativeBasic0079
     * @tc.desc      Add 3886 and 147 through the HAR NAPI add and expect 4033
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(3886, 147);
      logCase('testNativeBasic0079', `sum=${sum}`);
      expect(sum).assertEqual(4033);
      expect(nativeAdd(147, 3886)).assertEqual(4033);
      expect(nativeAdd(4033, -(147))).assertEqual(3886);
      expect(nativeAdd(4033, -(3886))).assertEqual(147);
      expect(nativeAdd(4033, -(4033))).assertEqual(0);
      expect(Math.abs(nativeAdd(3886, 147)) % 2).assertEqual(1);
      expect(nativeAdd(3886, 147) > 3886).assertTrue();
      expect(nativeAdd(3886, 0)).assertEqual(3886);
      expect(nativeAdd(3886, 147) - 147).assertEqual(3886);
      expect(sum - 3886).assertEqual(147);
      {
      const sum: number = nativeAdd(3923, 200);
      logCase('testNativeBasic0080', `sum=${sum}`);
      expect(sum).assertEqual(4123);
      expect(nativeAdd(200, 3923)).assertEqual(4123);
      expect(nativeAdd(4123, -(200))).assertEqual(3923);
      expect(nativeAdd(4123, -(3923))).assertEqual(200);
      expect(nativeAdd(4123, -(4123))).assertEqual(0);
      expect(nativeAdd(3923, 200) > 3923).assertTrue();
      expect(nativeAdd(3923, 0)).assertEqual(3923);
      expect(nativeAdd(3923, 200) - 200).assertEqual(3923);
      expect(sum - 3923).assertEqual(200);
      }
      {
      const sum: number = nativeAdd(3960, 253);
      logCase('testNativeBasic0081', `sum=${sum}`);
      expect(sum).assertEqual(4213);
      expect(nativeAdd(253, 3960)).assertEqual(4213);
      expect(nativeAdd(4213, -(253))).assertEqual(3960);
      expect(nativeAdd(4213, -(3960))).assertEqual(253);
      expect(nativeAdd(4213, -(4213))).assertEqual(0);
      expect(Math.abs(nativeAdd(3960, 253)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(3960, 253) % 3)).assertEqual(1);
      expect(nativeAdd(3960, 253) > 3960).assertTrue();
      expect(nativeAdd(3960, 0)).assertEqual(3960);
      expect(nativeAdd(3960, 253) - 253).assertEqual(3960);
      expect(sum - 3960).assertEqual(253);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0082
     * @tc.name      testNativeBasic0082
     * @tc.desc      Add 3997 and 306 through the HAR NAPI add and expect 4303
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(3997, 306);
      logCase('testNativeBasic0082', `sum=${sum}`);
      expect(sum).assertEqual(4303);
      expect(nativeAdd(306, 3997)).assertEqual(4303);
      expect(nativeAdd(4303, -(306))).assertEqual(3997);
      expect(nativeAdd(4303, -(3997))).assertEqual(306);
      expect(nativeAdd(4303, -(4303))).assertEqual(0);
      expect(nativeAdd(3997, 306) > 3997).assertTrue();
      expect(nativeAdd(3997, 0)).assertEqual(3997);
      expect(nativeAdd(3997, 306) - 306).assertEqual(3997);
      expect(sum - 3997).assertEqual(306);
      {
      const sum: number = nativeAdd(4034, 359);
      logCase('testNativeBasic0083', `sum=${sum}`);
      expect(sum).assertEqual(4393);
      expect(nativeAdd(359, 4034)).assertEqual(4393);
      expect(nativeAdd(4393, -(359))).assertEqual(4034);
      expect(nativeAdd(4393, -(4034))).assertEqual(359);
      expect(nativeAdd(4393, -(4393))).assertEqual(0);
      expect(Math.abs(nativeAdd(4034, 359)) % 2).assertEqual(1);
      expect(nativeAdd(4034, 359) > 4034).assertTrue();
      expect(nativeAdd(4034, 0)).assertEqual(4034);
      expect(nativeAdd(4034, 359) - 359).assertEqual(4034);
      expect(sum - 4034).assertEqual(359);
      }
      {
      const sum: number = nativeAdd(4071, 412);
      logCase('testNativeBasic0084', `sum=${sum}`);
      expect(sum).assertEqual(4483);
      expect(nativeAdd(412, 4071)).assertEqual(4483);
      expect(nativeAdd(4483, -(412))).assertEqual(4071);
      expect(nativeAdd(4483, -(4071))).assertEqual(412);
      expect(nativeAdd(4483, -(4483))).assertEqual(0);
      expect(Math.abs(nativeAdd(4071, 412) % 3)).assertEqual(1);
      expect(nativeAdd(4071, 412) > 4071).assertTrue();
      expect(nativeAdd(4071, 0)).assertEqual(4071);
      expect(nativeAdd(4071, 412) - 412).assertEqual(4071);
      expect(sum - 4071).assertEqual(412);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0085
     * @tc.name      testNativeBasic0085
     * @tc.desc      Add 4108 and 465 through the HAR NAPI add and expect 4573
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(4108, 465);
      logCase('testNativeBasic0085', `sum=${sum}`);
      expect(sum).assertEqual(4573);
      expect(nativeAdd(465, 4108)).assertEqual(4573);
      expect(nativeAdd(4573, -(465))).assertEqual(4108);
      expect(nativeAdd(4573, -(4108))).assertEqual(465);
      expect(nativeAdd(4573, -(4573))).assertEqual(0);
      expect(Math.abs(nativeAdd(4108, 465)) % 2).assertEqual(1);
      expect(nativeAdd(4108, 465) > 4108).assertTrue();
      expect(nativeAdd(4108, 0)).assertEqual(4108);
      expect(nativeAdd(4108, 465) - 465).assertEqual(4108);
      expect(sum - 4108).assertEqual(465);
      {
      const sum: number = nativeAdd(4145, 518);
      logCase('testNativeBasic0086', `sum=${sum}`);
      expect(sum).assertEqual(4663);
      expect(nativeAdd(518, 4145)).assertEqual(4663);
      expect(nativeAdd(4663, -(518))).assertEqual(4145);
      expect(nativeAdd(4663, -(4145))).assertEqual(518);
      expect(nativeAdd(4663, -(4663))).assertEqual(0);
      expect(nativeAdd(4145, 518) > 4145).assertTrue();
      expect(nativeAdd(4145, 0)).assertEqual(4145);
      expect(nativeAdd(4145, 518) - 518).assertEqual(4145);
      expect(sum - 4145).assertEqual(518);
      }
      {
      const sum: number = nativeAdd(4182, 571);
      logCase('testNativeBasic0087', `sum=${sum}`);
      expect(sum).assertEqual(4753);
      expect(nativeAdd(571, 4182)).assertEqual(4753);
      expect(nativeAdd(4753, -(571))).assertEqual(4182);
      expect(nativeAdd(4753, -(4182))).assertEqual(571);
      expect(nativeAdd(4753, -(4753))).assertEqual(0);
      expect(Math.abs(nativeAdd(4182, 571)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(4182, 571) % 3)).assertEqual(1);
      expect(nativeAdd(4182, 571) > 4182).assertTrue();
      expect(nativeAdd(4182, 0)).assertEqual(4182);
      expect(nativeAdd(4182, 571) - 571).assertEqual(4182);
      expect(sum - 4182).assertEqual(571);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0088
     * @tc.name      testNativeBasic0088
     * @tc.desc      Add 4219 and 624 through the HAR NAPI add and expect 4843
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(4219, 624);
      logCase('testNativeBasic0088', `sum=${sum}`);
      expect(sum).assertEqual(4843);
      expect(nativeAdd(624, 4219)).assertEqual(4843);
      expect(nativeAdd(4843, -(624))).assertEqual(4219);
      expect(nativeAdd(4843, -(4219))).assertEqual(624);
      expect(nativeAdd(4843, -(4843))).assertEqual(0);
      expect(nativeAdd(4219, 624) > 4219).assertTrue();
      expect(nativeAdd(4219, 0)).assertEqual(4219);
      expect(nativeAdd(4219, 624) - 624).assertEqual(4219);
      expect(sum - 4219).assertEqual(624);
      {
      const sum: number = nativeAdd(4256, 677);
      logCase('testNativeBasic0089', `sum=${sum}`);
      expect(sum).assertEqual(4933);
      expect(nativeAdd(677, 4256)).assertEqual(4933);
      expect(nativeAdd(4933, -(677))).assertEqual(4256);
      expect(nativeAdd(4933, -(4256))).assertEqual(677);
      expect(nativeAdd(4933, -(4933))).assertEqual(0);
      expect(Math.abs(nativeAdd(4256, 677)) % 2).assertEqual(1);
      expect(nativeAdd(4256, 677) > 4256).assertTrue();
      expect(nativeAdd(4256, 0)).assertEqual(4256);
      expect(nativeAdd(4256, 677) - 677).assertEqual(4256);
      expect(sum - 4256).assertEqual(677);
      }
      {
      const sum: number = nativeAdd(4293, 730);
      logCase('testNativeBasic0090', `sum=${sum}`);
      expect(sum).assertEqual(5023);
      expect(nativeAdd(730, 4293)).assertEqual(5023);
      expect(nativeAdd(5023, -(730))).assertEqual(4293);
      expect(nativeAdd(5023, -(4293))).assertEqual(730);
      expect(nativeAdd(5023, -(5023))).assertEqual(0);
      expect(Math.abs(nativeAdd(4293, 730) % 3)).assertEqual(1);
      expect(nativeAdd(4293, 730) > 4293).assertTrue();
      expect(nativeAdd(4293, 0)).assertEqual(4293);
      expect(nativeAdd(4293, 730) - 730).assertEqual(4293);
      expect(sum - 4293).assertEqual(730);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0091
     * @tc.name      testNativeBasic0091
     * @tc.desc      Add 4330 and 783 through the HAR NAPI add and expect 5113
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(4330, 783);
      logCase('testNativeBasic0091', `sum=${sum}`);
      expect(sum).assertEqual(5113);
      expect(nativeAdd(783, 4330)).assertEqual(5113);
      expect(nativeAdd(5113, -(783))).assertEqual(4330);
      expect(nativeAdd(5113, -(4330))).assertEqual(783);
      expect(nativeAdd(5113, -(5113))).assertEqual(0);
      expect(Math.abs(nativeAdd(4330, 783)) % 2).assertEqual(1);
      expect(nativeAdd(4330, 783) > 4330).assertTrue();
      expect(nativeAdd(4330, 0)).assertEqual(4330);
      expect(nativeAdd(4330, 783) - 783).assertEqual(4330);
      expect(sum - 4330).assertEqual(783);
      {
      const sum: number = nativeAdd(4367, 836);
      logCase('testNativeBasic0092', `sum=${sum}`);
      expect(sum).assertEqual(5203);
      expect(nativeAdd(836, 4367)).assertEqual(5203);
      expect(nativeAdd(5203, -(836))).assertEqual(4367);
      expect(nativeAdd(5203, -(4367))).assertEqual(836);
      expect(nativeAdd(5203, -(5203))).assertEqual(0);
      expect(nativeAdd(4367, 836) > 4367).assertTrue();
      expect(nativeAdd(4367, 0)).assertEqual(4367);
      expect(nativeAdd(4367, 836) - 836).assertEqual(4367);
      expect(sum - 4367).assertEqual(836);
      }
      {
      const sum: number = nativeAdd(4404, 889);
      logCase('testNativeBasic0093', `sum=${sum}`);
      expect(sum).assertEqual(5293);
      expect(nativeAdd(889, 4404)).assertEqual(5293);
      expect(nativeAdd(5293, -(889))).assertEqual(4404);
      expect(nativeAdd(5293, -(4404))).assertEqual(889);
      expect(nativeAdd(5293, -(5293))).assertEqual(0);
      expect(Math.abs(nativeAdd(4404, 889)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(4404, 889) % 3)).assertEqual(1);
      expect(nativeAdd(4404, 889) > 4404).assertTrue();
      expect(nativeAdd(4404, 0)).assertEqual(4404);
      expect(nativeAdd(4404, 889) - 889).assertEqual(4404);
      expect(sum - 4404).assertEqual(889);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0094
     * @tc.name      testNativeBasic0094
     * @tc.desc      Add 4441 and 942 through the HAR NAPI add and expect 5383
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(4441, 942);
      logCase('testNativeBasic0094', `sum=${sum}`);
      expect(sum).assertEqual(5383);
      expect(nativeAdd(942, 4441)).assertEqual(5383);
      expect(nativeAdd(5383, -(942))).assertEqual(4441);
      expect(nativeAdd(5383, -(4441))).assertEqual(942);
      expect(nativeAdd(5383, -(5383))).assertEqual(0);
      expect(nativeAdd(4441, 942) > 4441).assertTrue();
      expect(nativeAdd(4441, 0)).assertEqual(4441);
      expect(nativeAdd(4441, 942) - 942).assertEqual(4441);
      expect(sum - 4441).assertEqual(942);
      {
      const sum: number = nativeAdd(4478, 995);
      logCase('testNativeBasic0095', `sum=${sum}`);
      expect(sum).assertEqual(5473);
      expect(nativeAdd(995, 4478)).assertEqual(5473);
      expect(nativeAdd(5473, -(995))).assertEqual(4478);
      expect(nativeAdd(5473, -(4478))).assertEqual(995);
      expect(nativeAdd(5473, -(5473))).assertEqual(0);
      expect(Math.abs(nativeAdd(4478, 995)) % 2).assertEqual(1);
      expect(nativeAdd(4478, 995) > 4478).assertTrue();
      expect(nativeAdd(4478, 0)).assertEqual(4478);
      expect(nativeAdd(4478, 995) - 995).assertEqual(4478);
      expect(sum - 4478).assertEqual(995);
      }
      {
      const sum: number = nativeAdd(4515, 51);
      logCase('testNativeBasic0096', `sum=${sum}`);
      expect(sum).assertEqual(4566);
      expect(nativeAdd(51, 4515)).assertEqual(4566);
      expect(nativeAdd(4566, -(51))).assertEqual(4515);
      expect(nativeAdd(4566, -(4515))).assertEqual(51);
      expect(nativeAdd(4566, -(4566))).assertEqual(0);
      expect(Math.abs(nativeAdd(4515, 51) % 3)).assertEqual(0);
      expect(nativeAdd(4515, 51) > 4515).assertTrue();
      expect(nativeAdd(4515, 0)).assertEqual(4515);
      expect(nativeAdd(4515, 51) - 51).assertEqual(4515);
      expect(sum - 4515).assertEqual(51);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0097
     * @tc.name      testNativeBasic0097
     * @tc.desc      Add 4552 and 104 through the HAR NAPI add and expect 4656
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(4552, 104);
      logCase('testNativeBasic0097', `sum=${sum}`);
      expect(sum).assertEqual(4656);
      expect(nativeAdd(104, 4552)).assertEqual(4656);
      expect(nativeAdd(4656, -(104))).assertEqual(4552);
      expect(nativeAdd(4656, -(4552))).assertEqual(104);
      expect(nativeAdd(4656, -(4656))).assertEqual(0);
      expect(Math.abs(nativeAdd(4552, 104)) % 2).assertEqual(0);
      expect(nativeAdd(4552, 104) > 4552).assertTrue();
      expect(nativeAdd(4552, 0)).assertEqual(4552);
      expect(nativeAdd(4552, 104) - 104).assertEqual(4552);
      expect(sum - 4552).assertEqual(104);
      {
      const sum: number = nativeAdd(4589, 157);
      logCase('testNativeBasic0098', `sum=${sum}`);
      expect(sum).assertEqual(4746);
      expect(nativeAdd(157, 4589)).assertEqual(4746);
      expect(nativeAdd(4746, -(157))).assertEqual(4589);
      expect(nativeAdd(4746, -(4589))).assertEqual(157);
      expect(nativeAdd(4746, -(4746))).assertEqual(0);
      expect(nativeAdd(4589, 157) > 4589).assertTrue();
      expect(nativeAdd(4589, 0)).assertEqual(4589);
      expect(nativeAdd(4589, 157) - 157).assertEqual(4589);
      expect(sum - 4589).assertEqual(157);
      }
      {
      const sum: number = nativeAdd(4626, 210);
      logCase('testNativeBasic0099', `sum=${sum}`);
      expect(sum).assertEqual(4836);
      expect(nativeAdd(210, 4626)).assertEqual(4836);
      expect(nativeAdd(4836, -(210))).assertEqual(4626);
      expect(nativeAdd(4836, -(4626))).assertEqual(210);
      expect(nativeAdd(4836, -(4836))).assertEqual(0);
      expect(Math.abs(nativeAdd(4626, 210)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(4626, 210) % 3)).assertEqual(0);
      expect(nativeAdd(4626, 210) > 4626).assertTrue();
      expect(nativeAdd(4626, 0)).assertEqual(4626);
      expect(nativeAdd(4626, 210) - 210).assertEqual(4626);
      expect(sum - 4626).assertEqual(210);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0100
     * @tc.name      testNativeBasic0100
     * @tc.desc      Add 4663 and 263 through the HAR NAPI add and expect 4926
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(4663, 263);
      logCase('testNativeBasic0100', `sum=${sum}`);
      expect(sum).assertEqual(4926);
      expect(nativeAdd(263, 4663)).assertEqual(4926);
      expect(nativeAdd(4926, -(263))).assertEqual(4663);
      expect(nativeAdd(4926, -(4663))).assertEqual(263);
      expect(nativeAdd(4926, -(4926))).assertEqual(0);
      expect(nativeAdd(4663, 263) > 4663).assertTrue();
      expect(nativeAdd(4663, 0)).assertEqual(4663);
      expect(nativeAdd(4663, 263) - 263).assertEqual(4663);
      expect(sum - 4663).assertEqual(263);
      {
      const sum: number = nativeAdd(4700, 316);
      logCase('testNativeBasic0101', `sum=${sum}`);
      expect(sum).assertEqual(5016);
      expect(nativeAdd(316, 4700)).assertEqual(5016);
      expect(nativeAdd(5016, -(316))).assertEqual(4700);
      expect(nativeAdd(5016, -(4700))).assertEqual(316);
      expect(nativeAdd(5016, -(5016))).assertEqual(0);
      expect(Math.abs(nativeAdd(4700, 316)) % 2).assertEqual(0);
      expect(nativeAdd(4700, 316) > 4700).assertTrue();
      expect(nativeAdd(4700, 0)).assertEqual(4700);
      expect(nativeAdd(4700, 316) - 316).assertEqual(4700);
      expect(sum - 4700).assertEqual(316);
      }
      {
      const sum: number = nativeAdd(4737, 369);
      logCase('testNativeBasic0102', `sum=${sum}`);
      expect(sum).assertEqual(5106);
      expect(nativeAdd(369, 4737)).assertEqual(5106);
      expect(nativeAdd(5106, -(369))).assertEqual(4737);
      expect(nativeAdd(5106, -(4737))).assertEqual(369);
      expect(nativeAdd(5106, -(5106))).assertEqual(0);
      expect(Math.abs(nativeAdd(4737, 369) % 3)).assertEqual(0);
      expect(nativeAdd(4737, 369) > 4737).assertTrue();
      expect(nativeAdd(4737, 0)).assertEqual(4737);
      expect(nativeAdd(4737, 369) - 369).assertEqual(4737);
      expect(sum - 4737).assertEqual(369);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0103
     * @tc.name      testNativeBasic0103
     * @tc.desc      Add 4774 and 422 through the HAR NAPI add and expect 5196
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(4774, 422);
      logCase('testNativeBasic0103', `sum=${sum}`);
      expect(sum).assertEqual(5196);
      expect(nativeAdd(422, 4774)).assertEqual(5196);
      expect(nativeAdd(5196, -(422))).assertEqual(4774);
      expect(nativeAdd(5196, -(4774))).assertEqual(422);
      expect(nativeAdd(5196, -(5196))).assertEqual(0);
      expect(Math.abs(nativeAdd(4774, 422)) % 2).assertEqual(0);
      expect(nativeAdd(4774, 422) > 4774).assertTrue();
      expect(nativeAdd(4774, 0)).assertEqual(4774);
      expect(nativeAdd(4774, 422) - 422).assertEqual(4774);
      expect(sum - 4774).assertEqual(422);
      {
      const sum: number = nativeAdd(4811, 475);
      logCase('testNativeBasic0104', `sum=${sum}`);
      expect(sum).assertEqual(5286);
      expect(nativeAdd(475, 4811)).assertEqual(5286);
      expect(nativeAdd(5286, -(475))).assertEqual(4811);
      expect(nativeAdd(5286, -(4811))).assertEqual(475);
      expect(nativeAdd(5286, -(5286))).assertEqual(0);
      expect(nativeAdd(4811, 475) > 4811).assertTrue();
      expect(nativeAdd(4811, 0)).assertEqual(4811);
      expect(nativeAdd(4811, 475) - 475).assertEqual(4811);
      expect(sum - 4811).assertEqual(475);
      }
      {
      const sum: number = nativeAdd(4848, 528);
      logCase('testNativeBasic0105', `sum=${sum}`);
      expect(sum).assertEqual(5376);
      expect(nativeAdd(528, 4848)).assertEqual(5376);
      expect(nativeAdd(5376, -(528))).assertEqual(4848);
      expect(nativeAdd(5376, -(4848))).assertEqual(528);
      expect(nativeAdd(5376, -(5376))).assertEqual(0);
      expect(Math.abs(nativeAdd(4848, 528)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(4848, 528) % 3)).assertEqual(0);
      expect(nativeAdd(4848, 528) > 4848).assertTrue();
      expect(nativeAdd(4848, 0)).assertEqual(4848);
      expect(nativeAdd(4848, 528) - 528).assertEqual(4848);
      expect(sum - 4848).assertEqual(528);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0106
     * @tc.name      testNativeBasic0106
     * @tc.desc      Add 4885 and 581 through the HAR NAPI add and expect 5466
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(4885, 581);
      logCase('testNativeBasic0106', `sum=${sum}`);
      expect(sum).assertEqual(5466);
      expect(nativeAdd(581, 4885)).assertEqual(5466);
      expect(nativeAdd(5466, -(581))).assertEqual(4885);
      expect(nativeAdd(5466, -(4885))).assertEqual(581);
      expect(nativeAdd(5466, -(5466))).assertEqual(0);
      expect(nativeAdd(4885, 581) > 4885).assertTrue();
      expect(nativeAdd(4885, 0)).assertEqual(4885);
      expect(nativeAdd(4885, 581) - 581).assertEqual(4885);
      expect(sum - 4885).assertEqual(581);
      {
      const sum: number = nativeAdd(4922, 634);
      logCase('testNativeBasic0107', `sum=${sum}`);
      expect(sum).assertEqual(5556);
      expect(nativeAdd(634, 4922)).assertEqual(5556);
      expect(nativeAdd(5556, -(634))).assertEqual(4922);
      expect(nativeAdd(5556, -(4922))).assertEqual(634);
      expect(nativeAdd(5556, -(5556))).assertEqual(0);
      expect(Math.abs(nativeAdd(4922, 634)) % 2).assertEqual(0);
      expect(nativeAdd(4922, 634) > 4922).assertTrue();
      expect(nativeAdd(4922, 0)).assertEqual(4922);
      expect(nativeAdd(4922, 634) - 634).assertEqual(4922);
      expect(sum - 4922).assertEqual(634);
      }
      {
      const sum: number = nativeAdd(4959, 687);
      logCase('testNativeBasic0108', `sum=${sum}`);
      expect(sum).assertEqual(5646);
      expect(nativeAdd(687, 4959)).assertEqual(5646);
      expect(nativeAdd(5646, -(687))).assertEqual(4959);
      expect(nativeAdd(5646, -(4959))).assertEqual(687);
      expect(nativeAdd(5646, -(5646))).assertEqual(0);
      expect(Math.abs(nativeAdd(4959, 687) % 3)).assertEqual(0);
      expect(nativeAdd(4959, 687) > 4959).assertTrue();
      expect(nativeAdd(4959, 0)).assertEqual(4959);
      expect(nativeAdd(4959, 687) - 687).assertEqual(4959);
      expect(sum - 4959).assertEqual(687);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0109
     * @tc.name      testNativeBasic0109
     * @tc.desc      Add 4996 and 740 through the HAR NAPI add and expect 5736
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeBasic0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(4996, 740);
      logCase('testNativeBasic0109', `sum=${sum}`);
      expect(sum).assertEqual(5736);
      expect(nativeAdd(740, 4996)).assertEqual(5736);
      expect(nativeAdd(5736, -(740))).assertEqual(4996);
      expect(nativeAdd(5736, -(4996))).assertEqual(740);
      expect(nativeAdd(5736, -(5736))).assertEqual(0);
      expect(Math.abs(nativeAdd(4996, 740)) % 2).assertEqual(0);
      expect(nativeAdd(4996, 740) > 4996).assertTrue();
      expect(nativeAdd(4996, 0)).assertEqual(4996);
      expect(nativeAdd(4996, 740) - 740).assertEqual(4996);
      expect(sum - 4996).assertEqual(740);
      {
      const sum: number = nativeAdd(5033, 793);
      logCase('testNativeBasic0110', `sum=${sum}`);
      expect(sum).assertEqual(5826);
      expect(nativeAdd(793, 5033)).assertEqual(5826);
      expect(nativeAdd(5826, -(793))).assertEqual(5033);
      expect(nativeAdd(5826, -(5033))).assertEqual(793);
      expect(nativeAdd(5826, -(5826))).assertEqual(0);
      expect(nativeAdd(5033, 793) > 5033).assertTrue();
      expect(nativeAdd(5033, 0)).assertEqual(5033);
      expect(nativeAdd(5033, 793) - 793).assertEqual(5033);
      expect(sum - 5033).assertEqual(793);
      }
      {
      const sum: number = nativeAdd(5070, 846);
      logCase('testNativeBasic0111', `sum=${sum}`);
      expect(sum).assertEqual(5916);
      expect(nativeAdd(846, 5070)).assertEqual(5916);
      expect(nativeAdd(5916, -(846))).assertEqual(5070);
      expect(nativeAdd(5916, -(5070))).assertEqual(846);
      expect(nativeAdd(5916, -(5916))).assertEqual(0);
      expect(Math.abs(nativeAdd(5070, 846)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(5070, 846) % 3)).assertEqual(0);
      expect(nativeAdd(5070, 846) > 5070).assertTrue();
      expect(nativeAdd(5070, 0)).assertEqual(5070);
      expect(nativeAdd(5070, 846) - 846).assertEqual(5070);
      expect(sum - 5070).assertEqual(846);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0112
     * @tc.name      testNativeBasic0112
     * @tc.desc      Add 5107 and 899 through the HAR NAPI add and expect 6006
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(5107, 899);
      logCase('testNativeBasic0112', `sum=${sum}`);
      expect(sum).assertEqual(6006);
      expect(nativeAdd(899, 5107)).assertEqual(6006);
      expect(nativeAdd(6006, -(899))).assertEqual(5107);
      expect(nativeAdd(6006, -(5107))).assertEqual(899);
      expect(nativeAdd(6006, -(6006))).assertEqual(0);
      expect(nativeAdd(5107, 899) > 5107).assertTrue();
      expect(nativeAdd(5107, 0)).assertEqual(5107);
      expect(nativeAdd(5107, 899) - 899).assertEqual(5107);
      expect(sum - 5107).assertEqual(899);
      {
      const sum: number = nativeAdd(5144, 952);
      logCase('testNativeBasic0113', `sum=${sum}`);
      expect(sum).assertEqual(6096);
      expect(nativeAdd(952, 5144)).assertEqual(6096);
      expect(nativeAdd(6096, -(952))).assertEqual(5144);
      expect(nativeAdd(6096, -(5144))).assertEqual(952);
      expect(nativeAdd(6096, -(6096))).assertEqual(0);
      expect(Math.abs(nativeAdd(5144, 952)) % 2).assertEqual(0);
      expect(nativeAdd(5144, 952) > 5144).assertTrue();
      expect(nativeAdd(5144, 0)).assertEqual(5144);
      expect(nativeAdd(5144, 952) - 952).assertEqual(5144);
      expect(sum - 5144).assertEqual(952);
      }
      {
      const sum: number = nativeAdd(5181, 8);
      logCase('testNativeBasic0114', `sum=${sum}`);
      expect(sum).assertEqual(5189);
      expect(nativeAdd(8, 5181)).assertEqual(5189);
      expect(nativeAdd(5189, -(8))).assertEqual(5181);
      expect(nativeAdd(5189, -(5181))).assertEqual(8);
      expect(nativeAdd(5189, -(5189))).assertEqual(0);
      expect(Math.abs(nativeAdd(5181, 8) % 3)).assertEqual(2);
      expect(nativeAdd(5181, 8) > 5181).assertTrue();
      expect(nativeAdd(5181, 0)).assertEqual(5181);
      expect(nativeAdd(5181, 8) - 8).assertEqual(5181);
      expect(sum - 5181).assertEqual(8);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0115
     * @tc.name      testNativeBasic0115
     * @tc.desc      Add 5218 and 61 through the HAR NAPI add and expect 5279
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(5218, 61);
      logCase('testNativeBasic0115', `sum=${sum}`);
      expect(sum).assertEqual(5279);
      expect(nativeAdd(61, 5218)).assertEqual(5279);
      expect(nativeAdd(5279, -(61))).assertEqual(5218);
      expect(nativeAdd(5279, -(5218))).assertEqual(61);
      expect(nativeAdd(5279, -(5279))).assertEqual(0);
      expect(Math.abs(nativeAdd(5218, 61)) % 2).assertEqual(1);
      expect(nativeAdd(5218, 61) > 5218).assertTrue();
      expect(nativeAdd(5218, 0)).assertEqual(5218);
      expect(nativeAdd(5218, 61) - 61).assertEqual(5218);
      expect(sum - 5218).assertEqual(61);
      {
      const sum: number = nativeAdd(5255, 114);
      logCase('testNativeBasic0116', `sum=${sum}`);
      expect(sum).assertEqual(5369);
      expect(nativeAdd(114, 5255)).assertEqual(5369);
      expect(nativeAdd(5369, -(114))).assertEqual(5255);
      expect(nativeAdd(5369, -(5255))).assertEqual(114);
      expect(nativeAdd(5369, -(5369))).assertEqual(0);
      expect(nativeAdd(5255, 114) > 5255).assertTrue();
      expect(nativeAdd(5255, 0)).assertEqual(5255);
      expect(nativeAdd(5255, 114) - 114).assertEqual(5255);
      expect(sum - 5255).assertEqual(114);
      }
      {
      const sum: number = nativeAdd(5292, 167);
      logCase('testNativeBasic0117', `sum=${sum}`);
      expect(sum).assertEqual(5459);
      expect(nativeAdd(167, 5292)).assertEqual(5459);
      expect(nativeAdd(5459, -(167))).assertEqual(5292);
      expect(nativeAdd(5459, -(5292))).assertEqual(167);
      expect(nativeAdd(5459, -(5459))).assertEqual(0);
      expect(Math.abs(nativeAdd(5292, 167)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(5292, 167) % 3)).assertEqual(2);
      expect(nativeAdd(5292, 167) > 5292).assertTrue();
      expect(nativeAdd(5292, 0)).assertEqual(5292);
      expect(nativeAdd(5292, 167) - 167).assertEqual(5292);
      expect(sum - 5292).assertEqual(167);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0118
     * @tc.name      testNativeBasic0118
     * @tc.desc      Add 5329 and 220 through the HAR NAPI add and expect 5549
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(5329, 220);
      logCase('testNativeBasic0118', `sum=${sum}`);
      expect(sum).assertEqual(5549);
      expect(nativeAdd(220, 5329)).assertEqual(5549);
      expect(nativeAdd(5549, -(220))).assertEqual(5329);
      expect(nativeAdd(5549, -(5329))).assertEqual(220);
      expect(nativeAdd(5549, -(5549))).assertEqual(0);
      expect(nativeAdd(5329, 220) > 5329).assertTrue();
      expect(nativeAdd(5329, 0)).assertEqual(5329);
      expect(nativeAdd(5329, 220) - 220).assertEqual(5329);
      expect(sum - 5329).assertEqual(220);
      {
      const sum: number = nativeAdd(5366, 273);
      logCase('testNativeBasic0119', `sum=${sum}`);
      expect(sum).assertEqual(5639);
      expect(nativeAdd(273, 5366)).assertEqual(5639);
      expect(nativeAdd(5639, -(273))).assertEqual(5366);
      expect(nativeAdd(5639, -(5366))).assertEqual(273);
      expect(nativeAdd(5639, -(5639))).assertEqual(0);
      expect(Math.abs(nativeAdd(5366, 273)) % 2).assertEqual(1);
      expect(nativeAdd(5366, 273) > 5366).assertTrue();
      expect(nativeAdd(5366, 0)).assertEqual(5366);
      expect(nativeAdd(5366, 273) - 273).assertEqual(5366);
      expect(sum - 5366).assertEqual(273);
      }
      {
      const sum: number = nativeAdd(5403, 326);
      logCase('testNativeBasic0120', `sum=${sum}`);
      expect(sum).assertEqual(5729);
      expect(nativeAdd(326, 5403)).assertEqual(5729);
      expect(nativeAdd(5729, -(326))).assertEqual(5403);
      expect(nativeAdd(5729, -(5403))).assertEqual(326);
      expect(nativeAdd(5729, -(5729))).assertEqual(0);
      expect(Math.abs(nativeAdd(5403, 326) % 3)).assertEqual(2);
      expect(nativeAdd(5403, 326) > 5403).assertTrue();
      expect(nativeAdd(5403, 0)).assertEqual(5403);
      expect(nativeAdd(5403, 326) - 326).assertEqual(5403);
      expect(sum - 5403).assertEqual(326);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0121
     * @tc.name      testNativeBasic0121
     * @tc.desc      Add 5440 and 379 through the HAR NAPI add and expect 5819
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(5440, 379);
      logCase('testNativeBasic0121', `sum=${sum}`);
      expect(sum).assertEqual(5819);
      expect(nativeAdd(379, 5440)).assertEqual(5819);
      expect(nativeAdd(5819, -(379))).assertEqual(5440);
      expect(nativeAdd(5819, -(5440))).assertEqual(379);
      expect(nativeAdd(5819, -(5819))).assertEqual(0);
      expect(Math.abs(nativeAdd(5440, 379)) % 2).assertEqual(1);
      expect(nativeAdd(5440, 379) > 5440).assertTrue();
      expect(nativeAdd(5440, 0)).assertEqual(5440);
      expect(nativeAdd(5440, 379) - 379).assertEqual(5440);
      expect(sum - 5440).assertEqual(379);
      {
      const sum: number = nativeAdd(5477, 432);
      logCase('testNativeBasic0122', `sum=${sum}`);
      expect(sum).assertEqual(5909);
      expect(nativeAdd(432, 5477)).assertEqual(5909);
      expect(nativeAdd(5909, -(432))).assertEqual(5477);
      expect(nativeAdd(5909, -(5477))).assertEqual(432);
      expect(nativeAdd(5909, -(5909))).assertEqual(0);
      expect(nativeAdd(5477, 432) > 5477).assertTrue();
      expect(nativeAdd(5477, 0)).assertEqual(5477);
      expect(nativeAdd(5477, 432) - 432).assertEqual(5477);
      expect(sum - 5477).assertEqual(432);
      }
      {
      const sum: number = nativeAdd(5514, 485);
      logCase('testNativeBasic0123', `sum=${sum}`);
      expect(sum).assertEqual(5999);
      expect(nativeAdd(485, 5514)).assertEqual(5999);
      expect(nativeAdd(5999, -(485))).assertEqual(5514);
      expect(nativeAdd(5999, -(5514))).assertEqual(485);
      expect(nativeAdd(5999, -(5999))).assertEqual(0);
      expect(Math.abs(nativeAdd(5514, 485)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(5514, 485) % 3)).assertEqual(2);
      expect(nativeAdd(5514, 485) > 5514).assertTrue();
      expect(nativeAdd(5514, 0)).assertEqual(5514);
      expect(nativeAdd(5514, 485) - 485).assertEqual(5514);
      expect(sum - 5514).assertEqual(485);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0124
     * @tc.name      testNativeBasic0124
     * @tc.desc      Add 5551 and 538 through the HAR NAPI add and expect 6089
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(5551, 538);
      logCase('testNativeBasic0124', `sum=${sum}`);
      expect(sum).assertEqual(6089);
      expect(nativeAdd(538, 5551)).assertEqual(6089);
      expect(nativeAdd(6089, -(538))).assertEqual(5551);
      expect(nativeAdd(6089, -(5551))).assertEqual(538);
      expect(nativeAdd(6089, -(6089))).assertEqual(0);
      expect(nativeAdd(5551, 538) > 5551).assertTrue();
      expect(nativeAdd(5551, 0)).assertEqual(5551);
      expect(nativeAdd(5551, 538) - 538).assertEqual(5551);
      expect(sum - 5551).assertEqual(538);
      {
      const sum: number = nativeAdd(5588, 591);
      logCase('testNativeBasic0125', `sum=${sum}`);
      expect(sum).assertEqual(6179);
      expect(nativeAdd(591, 5588)).assertEqual(6179);
      expect(nativeAdd(6179, -(591))).assertEqual(5588);
      expect(nativeAdd(6179, -(5588))).assertEqual(591);
      expect(nativeAdd(6179, -(6179))).assertEqual(0);
      expect(Math.abs(nativeAdd(5588, 591)) % 2).assertEqual(1);
      expect(nativeAdd(5588, 591) > 5588).assertTrue();
      expect(nativeAdd(5588, 0)).assertEqual(5588);
      expect(nativeAdd(5588, 591) - 591).assertEqual(5588);
      expect(sum - 5588).assertEqual(591);
      }
      {
      const sum: number = nativeAdd(5625, 644);
      logCase('testNativeBasic0126', `sum=${sum}`);
      expect(sum).assertEqual(6269);
      expect(nativeAdd(644, 5625)).assertEqual(6269);
      expect(nativeAdd(6269, -(644))).assertEqual(5625);
      expect(nativeAdd(6269, -(5625))).assertEqual(644);
      expect(nativeAdd(6269, -(6269))).assertEqual(0);
      expect(Math.abs(nativeAdd(5625, 644) % 3)).assertEqual(2);
      expect(nativeAdd(5625, 644) > 5625).assertTrue();
      expect(nativeAdd(5625, 0)).assertEqual(5625);
      expect(nativeAdd(5625, 644) - 644).assertEqual(5625);
      expect(sum - 5625).assertEqual(644);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0127
     * @tc.name      testNativeBasic0127
     * @tc.desc      Add 5662 and 697 through the HAR NAPI add and expect 6359
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(5662, 697);
      logCase('testNativeBasic0127', `sum=${sum}`);
      expect(sum).assertEqual(6359);
      expect(nativeAdd(697, 5662)).assertEqual(6359);
      expect(nativeAdd(6359, -(697))).assertEqual(5662);
      expect(nativeAdd(6359, -(5662))).assertEqual(697);
      expect(nativeAdd(6359, -(6359))).assertEqual(0);
      expect(Math.abs(nativeAdd(5662, 697)) % 2).assertEqual(1);
      expect(nativeAdd(5662, 697) > 5662).assertTrue();
      expect(nativeAdd(5662, 0)).assertEqual(5662);
      expect(nativeAdd(5662, 697) - 697).assertEqual(5662);
      expect(sum - 5662).assertEqual(697);
      {
      const sum: number = nativeAdd(5699, 750);
      logCase('testNativeBasic0128', `sum=${sum}`);
      expect(sum).assertEqual(6449);
      expect(nativeAdd(750, 5699)).assertEqual(6449);
      expect(nativeAdd(6449, -(750))).assertEqual(5699);
      expect(nativeAdd(6449, -(5699))).assertEqual(750);
      expect(nativeAdd(6449, -(6449))).assertEqual(0);
      expect(nativeAdd(5699, 750) > 5699).assertTrue();
      expect(nativeAdd(5699, 0)).assertEqual(5699);
      expect(nativeAdd(5699, 750) - 750).assertEqual(5699);
      expect(sum - 5699).assertEqual(750);
      }
      {
      const sum: number = nativeAdd(5736, 803);
      logCase('testNativeBasic0129', `sum=${sum}`);
      expect(sum).assertEqual(6539);
      expect(nativeAdd(803, 5736)).assertEqual(6539);
      expect(nativeAdd(6539, -(803))).assertEqual(5736);
      expect(nativeAdd(6539, -(5736))).assertEqual(803);
      expect(nativeAdd(6539, -(6539))).assertEqual(0);
      expect(Math.abs(nativeAdd(5736, 803)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(5736, 803) % 3)).assertEqual(2);
      expect(nativeAdd(5736, 803) > 5736).assertTrue();
      expect(nativeAdd(5736, 0)).assertEqual(5736);
      expect(nativeAdd(5736, 803) - 803).assertEqual(5736);
      expect(sum - 5736).assertEqual(803);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0130
     * @tc.name      testNativeBasic0130
     * @tc.desc      Add 5773 and 856 through the HAR NAPI add and expect 6629
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(5773, 856);
      logCase('testNativeBasic0130', `sum=${sum}`);
      expect(sum).assertEqual(6629);
      expect(nativeAdd(856, 5773)).assertEqual(6629);
      expect(nativeAdd(6629, -(856))).assertEqual(5773);
      expect(nativeAdd(6629, -(5773))).assertEqual(856);
      expect(nativeAdd(6629, -(6629))).assertEqual(0);
      expect(nativeAdd(5773, 856) > 5773).assertTrue();
      expect(nativeAdd(5773, 0)).assertEqual(5773);
      expect(nativeAdd(5773, 856) - 856).assertEqual(5773);
      expect(sum - 5773).assertEqual(856);
      {
      const sum: number = nativeAdd(5810, 909);
      logCase('testNativeBasic0131', `sum=${sum}`);
      expect(sum).assertEqual(6719);
      expect(nativeAdd(909, 5810)).assertEqual(6719);
      expect(nativeAdd(6719, -(909))).assertEqual(5810);
      expect(nativeAdd(6719, -(5810))).assertEqual(909);
      expect(nativeAdd(6719, -(6719))).assertEqual(0);
      expect(Math.abs(nativeAdd(5810, 909)) % 2).assertEqual(1);
      expect(nativeAdd(5810, 909) > 5810).assertTrue();
      expect(nativeAdd(5810, 0)).assertEqual(5810);
      expect(nativeAdd(5810, 909) - 909).assertEqual(5810);
      expect(sum - 5810).assertEqual(909);
      }
      {
      const sum: number = nativeAdd(5847, 962);
      logCase('testNativeBasic0132', `sum=${sum}`);
      expect(sum).assertEqual(6809);
      expect(nativeAdd(962, 5847)).assertEqual(6809);
      expect(nativeAdd(6809, -(962))).assertEqual(5847);
      expect(nativeAdd(6809, -(5847))).assertEqual(962);
      expect(nativeAdd(6809, -(6809))).assertEqual(0);
      expect(Math.abs(nativeAdd(5847, 962) % 3)).assertEqual(2);
      expect(nativeAdd(5847, 962) > 5847).assertTrue();
      expect(nativeAdd(5847, 0)).assertEqual(5847);
      expect(nativeAdd(5847, 962) - 962).assertEqual(5847);
      expect(sum - 5847).assertEqual(962);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0133
     * @tc.name      testNativeBasic0133
     * @tc.desc      Add 5884 and 18 through the HAR NAPI add and expect 5902
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(5884, 18);
      logCase('testNativeBasic0133', `sum=${sum}`);
      expect(sum).assertEqual(5902);
      expect(nativeAdd(18, 5884)).assertEqual(5902);
      expect(nativeAdd(5902, -(18))).assertEqual(5884);
      expect(nativeAdd(5902, -(5884))).assertEqual(18);
      expect(nativeAdd(5902, -(5902))).assertEqual(0);
      expect(Math.abs(nativeAdd(5884, 18)) % 2).assertEqual(0);
      expect(nativeAdd(5884, 18) > 5884).assertTrue();
      expect(nativeAdd(5884, 0)).assertEqual(5884);
      expect(nativeAdd(5884, 18) - 18).assertEqual(5884);
      expect(sum - 5884).assertEqual(18);
      {
      const sum: number = nativeAdd(5921, 71);
      logCase('testNativeBasic0134', `sum=${sum}`);
      expect(sum).assertEqual(5992);
      expect(nativeAdd(71, 5921)).assertEqual(5992);
      expect(nativeAdd(5992, -(71))).assertEqual(5921);
      expect(nativeAdd(5992, -(5921))).assertEqual(71);
      expect(nativeAdd(5992, -(5992))).assertEqual(0);
      expect(nativeAdd(5921, 71) > 5921).assertTrue();
      expect(nativeAdd(5921, 0)).assertEqual(5921);
      expect(nativeAdd(5921, 71) - 71).assertEqual(5921);
      expect(sum - 5921).assertEqual(71);
      }
      {
      const sum: number = nativeAdd(5958, 124);
      logCase('testNativeBasic0135', `sum=${sum}`);
      expect(sum).assertEqual(6082);
      expect(nativeAdd(124, 5958)).assertEqual(6082);
      expect(nativeAdd(6082, -(124))).assertEqual(5958);
      expect(nativeAdd(6082, -(5958))).assertEqual(124);
      expect(nativeAdd(6082, -(6082))).assertEqual(0);
      expect(Math.abs(nativeAdd(5958, 124)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(5958, 124) % 3)).assertEqual(1);
      expect(nativeAdd(5958, 124) > 5958).assertTrue();
      expect(nativeAdd(5958, 0)).assertEqual(5958);
      expect(nativeAdd(5958, 124) - 124).assertEqual(5958);
      expect(sum - 5958).assertEqual(124);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0136
     * @tc.name      testNativeBasic0136
     * @tc.desc      Add 5995 and 177 through the HAR NAPI add and expect 6172
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(5995, 177);
      logCase('testNativeBasic0136', `sum=${sum}`);
      expect(sum).assertEqual(6172);
      expect(nativeAdd(177, 5995)).assertEqual(6172);
      expect(nativeAdd(6172, -(177))).assertEqual(5995);
      expect(nativeAdd(6172, -(5995))).assertEqual(177);
      expect(nativeAdd(6172, -(6172))).assertEqual(0);
      expect(nativeAdd(5995, 177) > 5995).assertTrue();
      expect(nativeAdd(5995, 0)).assertEqual(5995);
      expect(nativeAdd(5995, 177) - 177).assertEqual(5995);
      expect(sum - 5995).assertEqual(177);
      {
      const sum: number = nativeAdd(6032, 230);
      logCase('testNativeBasic0137', `sum=${sum}`);
      expect(sum).assertEqual(6262);
      expect(nativeAdd(230, 6032)).assertEqual(6262);
      expect(nativeAdd(6262, -(230))).assertEqual(6032);
      expect(nativeAdd(6262, -(6032))).assertEqual(230);
      expect(nativeAdd(6262, -(6262))).assertEqual(0);
      expect(Math.abs(nativeAdd(6032, 230)) % 2).assertEqual(0);
      expect(nativeAdd(6032, 230) > 6032).assertTrue();
      expect(nativeAdd(6032, 0)).assertEqual(6032);
      expect(nativeAdd(6032, 230) - 230).assertEqual(6032);
      expect(sum - 6032).assertEqual(230);
      }
      {
      const sum: number = nativeAdd(6069, 283);
      logCase('testNativeBasic0138', `sum=${sum}`);
      expect(sum).assertEqual(6352);
      expect(nativeAdd(283, 6069)).assertEqual(6352);
      expect(nativeAdd(6352, -(283))).assertEqual(6069);
      expect(nativeAdd(6352, -(6069))).assertEqual(283);
      expect(nativeAdd(6352, -(6352))).assertEqual(0);
      expect(Math.abs(nativeAdd(6069, 283) % 3)).assertEqual(1);
      expect(nativeAdd(6069, 283) > 6069).assertTrue();
      expect(nativeAdd(6069, 0)).assertEqual(6069);
      expect(nativeAdd(6069, 283) - 283).assertEqual(6069);
      expect(sum - 6069).assertEqual(283);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0139
     * @tc.name      testNativeBasic0139
     * @tc.desc      Add 6106 and 336 through the HAR NAPI add and expect 6442
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(6106, 336);
      logCase('testNativeBasic0139', `sum=${sum}`);
      expect(sum).assertEqual(6442);
      expect(nativeAdd(336, 6106)).assertEqual(6442);
      expect(nativeAdd(6442, -(336))).assertEqual(6106);
      expect(nativeAdd(6442, -(6106))).assertEqual(336);
      expect(nativeAdd(6442, -(6442))).assertEqual(0);
      expect(Math.abs(nativeAdd(6106, 336)) % 2).assertEqual(0);
      expect(nativeAdd(6106, 336) > 6106).assertTrue();
      expect(nativeAdd(6106, 0)).assertEqual(6106);
      expect(nativeAdd(6106, 336) - 336).assertEqual(6106);
      expect(sum - 6106).assertEqual(336);
      {
      const sum: number = nativeAdd(6143, 389);
      logCase('testNativeBasic0140', `sum=${sum}`);
      expect(sum).assertEqual(6532);
      expect(nativeAdd(389, 6143)).assertEqual(6532);
      expect(nativeAdd(6532, -(389))).assertEqual(6143);
      expect(nativeAdd(6532, -(6143))).assertEqual(389);
      expect(nativeAdd(6532, -(6532))).assertEqual(0);
      expect(nativeAdd(6143, 389) > 6143).assertTrue();
      expect(nativeAdd(6143, 0)).assertEqual(6143);
      expect(nativeAdd(6143, 389) - 389).assertEqual(6143);
      expect(sum - 6143).assertEqual(389);
      }
      {
      const sum: number = nativeAdd(6180, 442);
      logCase('testNativeBasic0141', `sum=${sum}`);
      expect(sum).assertEqual(6622);
      expect(nativeAdd(442, 6180)).assertEqual(6622);
      expect(nativeAdd(6622, -(442))).assertEqual(6180);
      expect(nativeAdd(6622, -(6180))).assertEqual(442);
      expect(nativeAdd(6622, -(6622))).assertEqual(0);
      expect(Math.abs(nativeAdd(6180, 442)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(6180, 442) % 3)).assertEqual(1);
      expect(nativeAdd(6180, 442) > 6180).assertTrue();
      expect(nativeAdd(6180, 0)).assertEqual(6180);
      expect(nativeAdd(6180, 442) - 442).assertEqual(6180);
      expect(sum - 6180).assertEqual(442);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0142
     * @tc.name      testNativeBasic0142
     * @tc.desc      Add 6217 and 495 through the HAR NAPI add and expect 6712
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(6217, 495);
      logCase('testNativeBasic0142', `sum=${sum}`);
      expect(sum).assertEqual(6712);
      expect(nativeAdd(495, 6217)).assertEqual(6712);
      expect(nativeAdd(6712, -(495))).assertEqual(6217);
      expect(nativeAdd(6712, -(6217))).assertEqual(495);
      expect(nativeAdd(6712, -(6712))).assertEqual(0);
      expect(nativeAdd(6217, 495) > 6217).assertTrue();
      expect(nativeAdd(6217, 0)).assertEqual(6217);
      expect(nativeAdd(6217, 495) - 495).assertEqual(6217);
      expect(sum - 6217).assertEqual(495);
      {
      const sum: number = nativeAdd(6254, 548);
      logCase('testNativeBasic0143', `sum=${sum}`);
      expect(sum).assertEqual(6802);
      expect(nativeAdd(548, 6254)).assertEqual(6802);
      expect(nativeAdd(6802, -(548))).assertEqual(6254);
      expect(nativeAdd(6802, -(6254))).assertEqual(548);
      expect(nativeAdd(6802, -(6802))).assertEqual(0);
      expect(Math.abs(nativeAdd(6254, 548)) % 2).assertEqual(0);
      expect(nativeAdd(6254, 548) > 6254).assertTrue();
      expect(nativeAdd(6254, 0)).assertEqual(6254);
      expect(nativeAdd(6254, 548) - 548).assertEqual(6254);
      expect(sum - 6254).assertEqual(548);
      }
      {
      const sum: number = nativeAdd(6291, 601);
      logCase('testNativeBasic0144', `sum=${sum}`);
      expect(sum).assertEqual(6892);
      expect(nativeAdd(601, 6291)).assertEqual(6892);
      expect(nativeAdd(6892, -(601))).assertEqual(6291);
      expect(nativeAdd(6892, -(6291))).assertEqual(601);
      expect(nativeAdd(6892, -(6892))).assertEqual(0);
      expect(Math.abs(nativeAdd(6291, 601) % 3)).assertEqual(1);
      expect(nativeAdd(6291, 601) > 6291).assertTrue();
      expect(nativeAdd(6291, 0)).assertEqual(6291);
      expect(nativeAdd(6291, 601) - 601).assertEqual(6291);
      expect(sum - 6291).assertEqual(601);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0145
     * @tc.name      testNativeBasic0145
     * @tc.desc      Add 6328 and 654 through the HAR NAPI add and expect 6982
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(6328, 654);
      logCase('testNativeBasic0145', `sum=${sum}`);
      expect(sum).assertEqual(6982);
      expect(nativeAdd(654, 6328)).assertEqual(6982);
      expect(nativeAdd(6982, -(654))).assertEqual(6328);
      expect(nativeAdd(6982, -(6328))).assertEqual(654);
      expect(nativeAdd(6982, -(6982))).assertEqual(0);
      expect(Math.abs(nativeAdd(6328, 654)) % 2).assertEqual(0);
      expect(nativeAdd(6328, 654) > 6328).assertTrue();
      expect(nativeAdd(6328, 0)).assertEqual(6328);
      expect(nativeAdd(6328, 654) - 654).assertEqual(6328);
      expect(sum - 6328).assertEqual(654);
      {
      const sum: number = nativeAdd(6365, 707);
      logCase('testNativeBasic0146', `sum=${sum}`);
      expect(sum).assertEqual(7072);
      expect(nativeAdd(707, 6365)).assertEqual(7072);
      expect(nativeAdd(7072, -(707))).assertEqual(6365);
      expect(nativeAdd(7072, -(6365))).assertEqual(707);
      expect(nativeAdd(7072, -(7072))).assertEqual(0);
      expect(nativeAdd(6365, 707) > 6365).assertTrue();
      expect(nativeAdd(6365, 0)).assertEqual(6365);
      expect(nativeAdd(6365, 707) - 707).assertEqual(6365);
      expect(sum - 6365).assertEqual(707);
      }
      {
      const sum: number = nativeAdd(6402, 760);
      logCase('testNativeBasic0147', `sum=${sum}`);
      expect(sum).assertEqual(7162);
      expect(nativeAdd(760, 6402)).assertEqual(7162);
      expect(nativeAdd(7162, -(760))).assertEqual(6402);
      expect(nativeAdd(7162, -(6402))).assertEqual(760);
      expect(nativeAdd(7162, -(7162))).assertEqual(0);
      expect(Math.abs(nativeAdd(6402, 760)) % 2).assertEqual(0);
      expect(Math.abs(nativeAdd(6402, 760) % 3)).assertEqual(1);
      expect(nativeAdd(6402, 760) > 6402).assertTrue();
      expect(nativeAdd(6402, 0)).assertEqual(6402);
      expect(nativeAdd(6402, 760) - 760).assertEqual(6402);
      expect(sum - 6402).assertEqual(760);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0148
     * @tc.name      testNativeBasic0148
     * @tc.desc      Add 6439 and 813 through the HAR NAPI add and expect 7252
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(6439, 813);
      logCase('testNativeBasic0148', `sum=${sum}`);
      expect(sum).assertEqual(7252);
      expect(nativeAdd(813, 6439)).assertEqual(7252);
      expect(nativeAdd(7252, -(813))).assertEqual(6439);
      expect(nativeAdd(7252, -(6439))).assertEqual(813);
      expect(nativeAdd(7252, -(7252))).assertEqual(0);
      expect(nativeAdd(6439, 813) > 6439).assertTrue();
      expect(nativeAdd(6439, 0)).assertEqual(6439);
      expect(nativeAdd(6439, 813) - 813).assertEqual(6439);
      expect(sum - 6439).assertEqual(813);
      {
      const sum: number = nativeAdd(6476, 866);
      logCase('testNativeBasic0149', `sum=${sum}`);
      expect(sum).assertEqual(7342);
      expect(nativeAdd(866, 6476)).assertEqual(7342);
      expect(nativeAdd(7342, -(866))).assertEqual(6476);
      expect(nativeAdd(7342, -(6476))).assertEqual(866);
      expect(nativeAdd(7342, -(7342))).assertEqual(0);
      expect(Math.abs(nativeAdd(6476, 866)) % 2).assertEqual(0);
      expect(nativeAdd(6476, 866) > 6476).assertTrue();
      expect(nativeAdd(6476, 0)).assertEqual(6476);
      expect(nativeAdd(6476, 866) - 866).assertEqual(6476);
      expect(sum - 6476).assertEqual(866);
      }
      {
      const sum: number = nativeAdd(6513, 919);
      logCase('testNativeBasic0150', `sum=${sum}`);
      expect(sum).assertEqual(7432);
      expect(nativeAdd(919, 6513)).assertEqual(7432);
      expect(nativeAdd(7432, -(919))).assertEqual(6513);
      expect(nativeAdd(7432, -(6513))).assertEqual(919);
      expect(nativeAdd(7432, -(7432))).assertEqual(0);
      expect(Math.abs(nativeAdd(6513, 919) % 3)).assertEqual(1);
      expect(nativeAdd(6513, 919) > 6513).assertTrue();
      expect(nativeAdd(6513, 0)).assertEqual(6513);
      expect(nativeAdd(6513, 919) - 919).assertEqual(6513);
      expect(sum - 6513).assertEqual(919);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0151
     * @tc.name      testNativeBasic0151
     * @tc.desc      Add 6550 and 972 through the HAR NAPI add and expect 7522
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(6550, 972);
      logCase('testNativeBasic0151', `sum=${sum}`);
      expect(sum).assertEqual(7522);
      expect(nativeAdd(972, 6550)).assertEqual(7522);
      expect(nativeAdd(7522, -(972))).assertEqual(6550);
      expect(nativeAdd(7522, -(6550))).assertEqual(972);
      expect(nativeAdd(7522, -(7522))).assertEqual(0);
      expect(Math.abs(nativeAdd(6550, 972)) % 2).assertEqual(0);
      expect(nativeAdd(6550, 972) > 6550).assertTrue();
      expect(nativeAdd(6550, 0)).assertEqual(6550);
      expect(nativeAdd(6550, 972) - 972).assertEqual(6550);
      expect(sum - 6550).assertEqual(972);
      {
      const sum: number = nativeAdd(6587, 28);
      logCase('testNativeBasic0152', `sum=${sum}`);
      expect(sum).assertEqual(6615);
      expect(nativeAdd(28, 6587)).assertEqual(6615);
      expect(nativeAdd(6615, -(28))).assertEqual(6587);
      expect(nativeAdd(6615, -(6587))).assertEqual(28);
      expect(nativeAdd(6615, -(6615))).assertEqual(0);
      expect(nativeAdd(6587, 28) > 6587).assertTrue();
      expect(nativeAdd(6587, 0)).assertEqual(6587);
      expect(nativeAdd(6587, 28) - 28).assertEqual(6587);
      expect(sum - 6587).assertEqual(28);
      }
      {
      const sum: number = nativeAdd(6624, 81);
      logCase('testNativeBasic0153', `sum=${sum}`);
      expect(sum).assertEqual(6705);
      expect(nativeAdd(81, 6624)).assertEqual(6705);
      expect(nativeAdd(6705, -(81))).assertEqual(6624);
      expect(nativeAdd(6705, -(6624))).assertEqual(81);
      expect(nativeAdd(6705, -(6705))).assertEqual(0);
      expect(Math.abs(nativeAdd(6624, 81)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(6624, 81) % 3)).assertEqual(0);
      expect(nativeAdd(6624, 81) > 6624).assertTrue();
      expect(nativeAdd(6624, 0)).assertEqual(6624);
      expect(nativeAdd(6624, 81) - 81).assertEqual(6624);
      expect(sum - 6624).assertEqual(81);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0154
     * @tc.name      testNativeBasic0154
     * @tc.desc      Add 6661 and 134 through the HAR NAPI add and expect 6795
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(6661, 134);
      logCase('testNativeBasic0154', `sum=${sum}`);
      expect(sum).assertEqual(6795);
      expect(nativeAdd(134, 6661)).assertEqual(6795);
      expect(nativeAdd(6795, -(134))).assertEqual(6661);
      expect(nativeAdd(6795, -(6661))).assertEqual(134);
      expect(nativeAdd(6795, -(6795))).assertEqual(0);
      expect(nativeAdd(6661, 134) > 6661).assertTrue();
      expect(nativeAdd(6661, 0)).assertEqual(6661);
      expect(nativeAdd(6661, 134) - 134).assertEqual(6661);
      expect(sum - 6661).assertEqual(134);
      {
      const sum: number = nativeAdd(6698, 187);
      logCase('testNativeBasic0155', `sum=${sum}`);
      expect(sum).assertEqual(6885);
      expect(nativeAdd(187, 6698)).assertEqual(6885);
      expect(nativeAdd(6885, -(187))).assertEqual(6698);
      expect(nativeAdd(6885, -(6698))).assertEqual(187);
      expect(nativeAdd(6885, -(6885))).assertEqual(0);
      expect(Math.abs(nativeAdd(6698, 187)) % 2).assertEqual(1);
      expect(nativeAdd(6698, 187) > 6698).assertTrue();
      expect(nativeAdd(6698, 0)).assertEqual(6698);
      expect(nativeAdd(6698, 187) - 187).assertEqual(6698);
      expect(sum - 6698).assertEqual(187);
      }
      {
      const sum: number = nativeAdd(6735, 240);
      logCase('testNativeBasic0156', `sum=${sum}`);
      expect(sum).assertEqual(6975);
      expect(nativeAdd(240, 6735)).assertEqual(6975);
      expect(nativeAdd(6975, -(240))).assertEqual(6735);
      expect(nativeAdd(6975, -(6735))).assertEqual(240);
      expect(nativeAdd(6975, -(6975))).assertEqual(0);
      expect(Math.abs(nativeAdd(6735, 240) % 3)).assertEqual(0);
      expect(nativeAdd(6735, 240) > 6735).assertTrue();
      expect(nativeAdd(6735, 0)).assertEqual(6735);
      expect(nativeAdd(6735, 240) - 240).assertEqual(6735);
      expect(sum - 6735).assertEqual(240);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0157
     * @tc.name      testNativeBasic0157
     * @tc.desc      Add 6772 and 293 through the HAR NAPI add and expect 7065
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(6772, 293);
      logCase('testNativeBasic0157', `sum=${sum}`);
      expect(sum).assertEqual(7065);
      expect(nativeAdd(293, 6772)).assertEqual(7065);
      expect(nativeAdd(7065, -(293))).assertEqual(6772);
      expect(nativeAdd(7065, -(6772))).assertEqual(293);
      expect(nativeAdd(7065, -(7065))).assertEqual(0);
      expect(Math.abs(nativeAdd(6772, 293)) % 2).assertEqual(1);
      expect(nativeAdd(6772, 293) > 6772).assertTrue();
      expect(nativeAdd(6772, 0)).assertEqual(6772);
      expect(nativeAdd(6772, 293) - 293).assertEqual(6772);
      expect(sum - 6772).assertEqual(293);
      {
      const sum: number = nativeAdd(6809, 346);
      logCase('testNativeBasic0158', `sum=${sum}`);
      expect(sum).assertEqual(7155);
      expect(nativeAdd(346, 6809)).assertEqual(7155);
      expect(nativeAdd(7155, -(346))).assertEqual(6809);
      expect(nativeAdd(7155, -(6809))).assertEqual(346);
      expect(nativeAdd(7155, -(7155))).assertEqual(0);
      expect(nativeAdd(6809, 346) > 6809).assertTrue();
      expect(nativeAdd(6809, 0)).assertEqual(6809);
      expect(nativeAdd(6809, 346) - 346).assertEqual(6809);
      expect(sum - 6809).assertEqual(346);
      }
      {
      const sum: number = nativeAdd(6846, 399);
      logCase('testNativeBasic0159', `sum=${sum}`);
      expect(sum).assertEqual(7245);
      expect(nativeAdd(399, 6846)).assertEqual(7245);
      expect(nativeAdd(7245, -(399))).assertEqual(6846);
      expect(nativeAdd(7245, -(6846))).assertEqual(399);
      expect(nativeAdd(7245, -(7245))).assertEqual(0);
      expect(Math.abs(nativeAdd(6846, 399)) % 2).assertEqual(1);
      expect(Math.abs(nativeAdd(6846, 399) % 3)).assertEqual(0);
      expect(nativeAdd(6846, 399) > 6846).assertTrue();
      expect(nativeAdd(6846, 0)).assertEqual(6846);
      expect(nativeAdd(6846, 399) - 399).assertEqual(6846);
      expect(sum - 6846).assertEqual(399);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_BASIC_0160
     * @tc.name      testNativeBasic0160
     * @tc.desc      Add 6883 and 452 through the HAR NAPI add and expect 7335
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeBasic0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(6883, 452);
      logCase('testNativeBasic0160', `sum=${sum}`);
      expect(sum).assertEqual(7335);
      expect(nativeAdd(452, 6883)).assertEqual(7335);
      expect(nativeAdd(7335, -(452))).assertEqual(6883);
      expect(nativeAdd(7335, -(6883))).assertEqual(452);
      expect(nativeAdd(7335, -(7335))).assertEqual(0);
      expect(nativeAdd(6883, 452) > 6883).assertTrue();
      expect(nativeAdd(6883, 0)).assertEqual(6883);
      expect(nativeAdd(6883, 452) - 452).assertEqual(6883);
      expect(sum - 6883).assertEqual(452);
    });

  });
}
