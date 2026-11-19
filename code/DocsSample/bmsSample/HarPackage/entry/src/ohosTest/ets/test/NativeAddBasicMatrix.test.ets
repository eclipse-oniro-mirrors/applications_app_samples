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
