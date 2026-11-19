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

export default function nativeAddPerturbationMatrixTest() {
  describe('NativeAddPerturbationMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0001
     * @tc.name      testNativePerturb0001
     * @tc.desc      Native add perturbation 1 over 17 and -38
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 17;
      const b: number = -38;
      const c: number = -17;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0001', `sum=${sum}`);
      expect(sum).assertEqual(-21);
      expect(nativeAdd(b, a)).assertEqual(-21);
      expect(nativeAdd(sum, 38)).assertEqual(17);
      expect(nativeAdd(a, 0)).assertEqual(17);
      expect(sum - b).assertEqual(17);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(-38);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(-38);
      expect(nativeAdd(a, a)).assertEqual(34);
      expect(nativeAdd(-a, -b)).assertEqual(21);
      {
      const a: number = 59;
      const b: number = -31;
      const c: number = -6;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0002', `sum=${sum}`);
      expect(sum).assertEqual(28);
      expect(nativeAdd(b, a)).assertEqual(28);
      expect(nativeAdd(sum, 31)).assertEqual(59);
      expect(nativeAdd(a, 0)).assertEqual(59);
      expect(sum - b).assertEqual(59);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(22);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(22);
      }
      {
      const a: number = 101;
      const b: number = -24;
      const c: number = 5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0003', `sum=${sum}`);
      expect(sum).assertEqual(77);
      expect(nativeAdd(b, a)).assertEqual(77);
      expect(nativeAdd(sum, 24)).assertEqual(101);
      expect(nativeAdd(a, 0)).assertEqual(101);
      expect(sum - b).assertEqual(101);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(82);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(82);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0004
     * @tc.name      testNativePerturb0004
     * @tc.desc      Native add perturbation 4 over 137.5 and -17.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 137.5;
      const b: number = -17.5;
      const c: number = 16;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0004', `sum=${sum}`);
      expect(sum).assertEqual(120.0);
      expect(nativeAdd(b, a)).assertEqual(120.0);
      expect(nativeAdd(sum, 17.5)).assertEqual(137.5);
      expect(Math.abs(sum - 120.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(155.0);
      {
      const a: number = 185;
      const b: number = -10;
      const c: number = 27;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0005', `sum=${sum}`);
      expect(sum).assertEqual(175);
      expect(nativeAdd(b, a)).assertEqual(175);
      expect(nativeAdd(sum, 10)).assertEqual(185);
      expect(nativeAdd(a, 0)).assertEqual(185);
      expect(sum - b).assertEqual(185);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(202);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(202);
      }
      {
      const a: number = 227;
      const b: number = -3;
      const c: number = -15;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0006', `sum=${sum}`);
      expect(sum).assertEqual(224);
      expect(nativeAdd(b, a)).assertEqual(224);
      expect(nativeAdd(sum, 3)).assertEqual(227);
      expect(nativeAdd(a, 0)).assertEqual(227);
      expect(sum - b).assertEqual(227);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(209);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(209);
      expect(nativeAdd(a, a)).assertEqual(454);
      expect(nativeAdd(-a, -b)).assertEqual(-224);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0007
     * @tc.name      testNativePerturb0007
     * @tc.desc      Native add perturbation 7 over 257 and 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 257;
      const b: number = 4;
      const c: number = -4;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0007', `sum=${sum}`);
      expect(sum).assertEqual(261);
      expect(nativeAdd(b, a)).assertEqual(261);
      expect(nativeAdd(sum, -4)).assertEqual(257);
      expect(nativeAdd(a, 0)).assertEqual(257);
      expect(sum - b).assertEqual(257);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(257);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(257);
      {
      const a: number = 108.5;
      const b: number = 10.5;
      const c: number = 7;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0008', `sum=${sum}`);
      expect(sum).assertEqual(119.0);
      expect(nativeAdd(b, a)).assertEqual(119.0);
      expect(nativeAdd(sum, -10.5)).assertEqual(108.5);
      expect(Math.abs(sum - 119.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(98.0);
      }
      {
      const a: number = 150;
      const b: number = 18;
      const c: number = 18.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0009', `sum=${sum}`);
      expect(sum).assertEqual(168);
      expect(nativeAdd(b, a)).assertEqual(168);
      expect(nativeAdd(sum, -18)).assertEqual(150);
      expect(nativeAdd(a, 0)).assertEqual(150);
      expect(sum - b).assertEqual(150);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(186.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(186.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0010
     * @tc.name      testNativePerturb0010
     * @tc.desc      Native add perturbation 10 over 174 and 25
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 174;
      const b: number = 25;
      const c: number = 29;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0010', `sum=${sum}`);
      expect(sum).assertEqual(199);
      expect(nativeAdd(b, a)).assertEqual(199);
      expect(nativeAdd(sum, -25)).assertEqual(174);
      expect(nativeAdd(a, 0)).assertEqual(174);
      expect(sum - b).assertEqual(174);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(228);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(228);
      {
      const a: number = 234;
      const b: number = 32;
      const c: number = -13;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0011', `sum=${sum}`);
      expect(sum).assertEqual(266);
      expect(nativeAdd(b, a)).assertEqual(266);
      expect(nativeAdd(sum, -32)).assertEqual(234);
      expect(nativeAdd(a, 0)).assertEqual(234);
      expect(sum - b).assertEqual(234);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(253);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(253);
      expect(sum % 9).assertEqual(5);
      expect(nativeAdd(a, a)).assertEqual(468);
      expect(nativeAdd(-a, -b)).assertEqual(-266);
      }
      {
      const a: number = 276.5;
      const b: number = 38.5;
      const c: number = -2;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0012', `sum=${sum}`);
      expect(sum).assertEqual(315.0);
      expect(nativeAdd(b, a)).assertEqual(315.0);
      expect(nativeAdd(sum, -38.5)).assertEqual(276.5);
      expect(Math.abs(sum - 315.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(238.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0013
     * @tc.name      testNativePerturb0013
     * @tc.desc      Native add perturbation 13 over 294 and 46
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 294;
      const b: number = 46;
      const c: number = 9;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0013', `sum=${sum}`);
      expect(sum).assertEqual(340);
      expect(nativeAdd(b, a)).assertEqual(340);
      expect(nativeAdd(sum, -46)).assertEqual(294);
      expect(nativeAdd(a, 0)).assertEqual(294);
      expect(sum - b).assertEqual(294);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(349);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(349);
      {
      const a: number = 360;
      const b: number = 53;
      const c: number = 20;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0014', `sum=${sum}`);
      expect(sum).assertEqual(413);
      expect(nativeAdd(b, a)).assertEqual(413);
      expect(nativeAdd(sum, -53)).assertEqual(360);
      expect(nativeAdd(a, 0)).assertEqual(360);
      expect(sum - b).assertEqual(360);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(433);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(433);
      expect(sum % 9).assertEqual(8);
      }
      {
      const a: number = 199;
      const b: number = -37;
      const c: number = 31;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0015', `sum=${sum}`);
      expect(sum).assertEqual(162);
      expect(nativeAdd(b, a)).assertEqual(162);
      expect(nativeAdd(sum, 37)).assertEqual(199);
      expect(nativeAdd(a, 0)).assertEqual(199);
      expect(sum - b).assertEqual(199);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(193);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(193);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0016
     * @tc.name      testNativePerturb0016
     * @tc.desc      Native add perturbation 16 over 211.5 and -30.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 211.5;
      const b: number = -30.5;
      const c: number = -11;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0016', `sum=${sum}`);
      expect(sum).assertEqual(181.0);
      expect(nativeAdd(b, a)).assertEqual(181.0);
      expect(nativeAdd(sum, 30.5)).assertEqual(211.5);
      expect(Math.abs(sum - 181.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(242.0);
      {
      const a: number = 283;
      const b: number = -23;
      const c: number = 0;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0017', `sum=${sum}`);
      expect(sum).assertEqual(260);
      expect(nativeAdd(b, a)).assertEqual(260);
      expect(nativeAdd(sum, 23)).assertEqual(283);
      expect(nativeAdd(a, 0)).assertEqual(283);
      expect(sum - b).assertEqual(283);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(260);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(260);
      }
      {
      const a: number = 325;
      const b: number = -16;
      const c: number = 11.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0018', `sum=${sum}`);
      expect(sum).assertEqual(309);
      expect(nativeAdd(b, a)).assertEqual(309);
      expect(nativeAdd(sum, 16)).assertEqual(325);
      expect(nativeAdd(a, 0)).assertEqual(325);
      expect(sum - b).assertEqual(325);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(320.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(320.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0019
     * @tc.name      testNativePerturb0019
     * @tc.desc      Native add perturbation 19 over 331 and -9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 331;
      const b: number = -9;
      const c: number = 22;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0019', `sum=${sum}`);
      expect(sum).assertEqual(322);
      expect(nativeAdd(b, a)).assertEqual(322);
      expect(nativeAdd(sum, 9)).assertEqual(331);
      expect(nativeAdd(a, 0)).assertEqual(331);
      expect(sum - b).assertEqual(331);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(344);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(344);
      {
      const a: number = 409.5;
      const b: number = -2.5;
      const c: number = 33;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0020', `sum=${sum}`);
      expect(sum).assertEqual(407.0);
      expect(nativeAdd(b, a)).assertEqual(407.0);
      expect(nativeAdd(sum, 2.5)).assertEqual(409.5);
      expect(Math.abs(sum - 407.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(412.0);
      }
      {
      const a: number = 451;
      const b: number = 5;
      const c: number = -9;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0021', `sum=${sum}`);
      expect(sum).assertEqual(456);
      expect(nativeAdd(b, a)).assertEqual(456);
      expect(nativeAdd(sum, -5)).assertEqual(451);
      expect(nativeAdd(a, 0)).assertEqual(451);
      expect(sum - b).assertEqual(451);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(447);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(447);
      expect(nativeAdd(a, a)).assertEqual(902);
      expect(nativeAdd(-a, -b)).assertEqual(-456);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0022
     * @tc.name      testNativePerturb0022
     * @tc.desc      Native add perturbation 22 over 248 and 12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 248;
      const b: number = 12;
      const c: number = 2;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0022', `sum=${sum}`);
      expect(sum).assertEqual(260);
      expect(nativeAdd(b, a)).assertEqual(260);
      expect(nativeAdd(sum, -12)).assertEqual(248);
      expect(nativeAdd(a, 0)).assertEqual(248);
      expect(sum - b).assertEqual(248);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(262);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(262);
      {
      const a: number = 332;
      const b: number = 19;
      const c: number = 13;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0023', `sum=${sum}`);
      expect(sum).assertEqual(351);
      expect(nativeAdd(b, a)).assertEqual(351);
      expect(nativeAdd(sum, -19)).assertEqual(332);
      expect(nativeAdd(a, 0)).assertEqual(332);
      expect(sum - b).assertEqual(332);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(364);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(364);
      }
      {
      const a: number = 374.5;
      const b: number = 25.5;
      const c: number = 24;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0024', `sum=${sum}`);
      expect(sum).assertEqual(400.0);
      expect(nativeAdd(b, a)).assertEqual(400.0);
      expect(nativeAdd(sum, -25.5)).assertEqual(374.5);
      expect(Math.abs(sum - 400.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(349.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0025
     * @tc.name      testNativePerturb0025
     * @tc.desc      Native add perturbation 25 over 368 and 33
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 368;
      const b: number = 33;
      const c: number = 35;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0025', `sum=${sum}`);
      expect(sum).assertEqual(401);
      expect(nativeAdd(b, a)).assertEqual(401);
      expect(nativeAdd(sum, -33)).assertEqual(368);
      expect(nativeAdd(a, 0)).assertEqual(368);
      expect(sum - b).assertEqual(368);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(436);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(436);
      {
      const a: number = 458;
      const b: number = 40;
      const c: number = -7;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0026', `sum=${sum}`);
      expect(sum).assertEqual(498);
      expect(nativeAdd(b, a)).assertEqual(498);
      expect(nativeAdd(sum, -40)).assertEqual(458);
      expect(nativeAdd(a, 0)).assertEqual(458);
      expect(sum - b).assertEqual(458);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(491);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(491);
      expect(nativeAdd(a, a)).assertEqual(916);
      expect(nativeAdd(-a, -b)).assertEqual(-498);
      }
      {
      const a: number = 500;
      const b: number = 47;
      const c: number = 4.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0027', `sum=${sum}`);
      expect(sum).assertEqual(547);
      expect(nativeAdd(b, a)).assertEqual(547);
      expect(nativeAdd(sum, -47)).assertEqual(500);
      expect(nativeAdd(a, 0)).assertEqual(500);
      expect(sum - b).assertEqual(500);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(551.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(551.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0028
     * @tc.name      testNativePerturb0028
     * @tc.desc      Native add perturbation 28 over 488.5 and 53.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 488.5;
      const b: number = 53.5;
      const c: number = 15;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0028', `sum=${sum}`);
      expect(sum).assertEqual(542.0);
      expect(nativeAdd(b, a)).assertEqual(542.0);
      expect(nativeAdd(sum, -53.5)).assertEqual(488.5);
      expect(Math.abs(sum - 542.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(435.0);
      {
      const a: number = 381;
      const b: number = -36;
      const c: number = 26;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0029', `sum=${sum}`);
      expect(sum).assertEqual(345);
      expect(nativeAdd(b, a)).assertEqual(345);
      expect(nativeAdd(sum, 36)).assertEqual(381);
      expect(nativeAdd(a, 0)).assertEqual(381);
      expect(sum - b).assertEqual(381);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(371);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(371);
      }
      {
      const a: number = 423;
      const b: number = -29;
      const c: number = -16;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0030', `sum=${sum}`);
      expect(sum).assertEqual(394);
      expect(nativeAdd(b, a)).assertEqual(394);
      expect(nativeAdd(sum, 29)).assertEqual(423);
      expect(nativeAdd(a, 0)).assertEqual(423);
      expect(sum - b).assertEqual(423);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(378);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(378);
      expect(sum % 9).assertEqual(7);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0031
     * @tc.name      testNativePerturb0031
     * @tc.desc      Native add perturbation 31 over 405 and -22
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 405;
      const b: number = -22;
      const c: number = -5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0031', `sum=${sum}`);
      expect(sum).assertEqual(383);
      expect(nativeAdd(b, a)).assertEqual(383);
      expect(nativeAdd(sum, 22)).assertEqual(405);
      expect(nativeAdd(a, 0)).assertEqual(405);
      expect(sum - b).assertEqual(405);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(378);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(378);
      expect(sum % 9).assertEqual(5);
      expect(nativeAdd(a, a)).assertEqual(810);
      expect(nativeAdd(-a, -b)).assertEqual(-383);
      {
      const a: number = 507.5;
      const b: number = -15.5;
      const c: number = 6;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0032', `sum=${sum}`);
      expect(sum).assertEqual(492.0);
      expect(nativeAdd(b, a)).assertEqual(492.0);
      expect(nativeAdd(sum, 15.5)).assertEqual(507.5);
      expect(Math.abs(sum - 492.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(523.0);
      }
      {
      const a: number = 549;
      const b: number = -8;
      const c: number = 17;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0033', `sum=${sum}`);
      expect(sum).assertEqual(541);
      expect(nativeAdd(b, a)).assertEqual(541);
      expect(nativeAdd(sum, 8)).assertEqual(549);
      expect(nativeAdd(a, 0)).assertEqual(549);
      expect(sum - b).assertEqual(549);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(558);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(558);
      expect(sum % 9).assertEqual(1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0034
     * @tc.name      testNativePerturb0034
     * @tc.desc      Native add perturbation 34 over 525 and -1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 525;
      const b: number = -1;
      const c: number = 28;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0034', `sum=${sum}`);
      expect(sum).assertEqual(524);
      expect(nativeAdd(b, a)).assertEqual(524);
      expect(nativeAdd(sum, 1)).assertEqual(525);
      expect(nativeAdd(a, 0)).assertEqual(525);
      expect(sum - b).assertEqual(525);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(552);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(552);
      {
      const a: number = 633;
      const b: number = 6;
      const c: number = -14;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0035', `sum=${sum}`);
      expect(sum).assertEqual(639);
      expect(nativeAdd(b, a)).assertEqual(639);
      expect(nativeAdd(sum, -6)).assertEqual(633);
      expect(nativeAdd(a, 0)).assertEqual(633);
      expect(sum - b).assertEqual(633);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(625);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(625);
      }
      {
      const a: number = 472.5;
      const b: number = 12.5;
      const c: number = -2.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0036', `sum=${sum}`);
      expect(sum).assertEqual(485.0);
      expect(nativeAdd(b, a)).assertEqual(485.0);
      expect(nativeAdd(sum, -12.5)).assertEqual(472.5);
      expect(Math.abs(sum - 485.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(460.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0037
     * @tc.name      testNativePerturb0037
     * @tc.desc      Native add perturbation 37 over 442 and 20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 442;
      const b: number = 20;
      const c: number = 8;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0037', `sum=${sum}`);
      expect(sum).assertEqual(462);
      expect(nativeAdd(b, a)).assertEqual(462);
      expect(nativeAdd(sum, -20)).assertEqual(442);
      expect(nativeAdd(a, 0)).assertEqual(442);
      expect(sum - b).assertEqual(442);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(470);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(470);
      {
      const a: number = 556;
      const b: number = 27;
      const c: number = 19;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0038', `sum=${sum}`);
      expect(sum).assertEqual(583);
      expect(nativeAdd(b, a)).assertEqual(583);
      expect(nativeAdd(sum, -27)).assertEqual(556);
      expect(nativeAdd(a, 0)).assertEqual(556);
      expect(sum - b).assertEqual(556);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(602);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(602);
      }
      {
      const a: number = 598;
      const b: number = 34;
      const c: number = 30;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0039', `sum=${sum}`);
      expect(sum).assertEqual(632);
      expect(nativeAdd(b, a)).assertEqual(632);
      expect(nativeAdd(sum, -34)).assertEqual(598);
      expect(nativeAdd(a, 0)).assertEqual(598);
      expect(sum - b).assertEqual(598);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(662);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(662);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0040
     * @tc.name      testNativePerturb0040
     * @tc.desc      Native add perturbation 40 over 562.5 and 40.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 562.5;
      const b: number = 40.5;
      const c: number = -12;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0040', `sum=${sum}`);
      expect(sum).assertEqual(603.0);
      expect(nativeAdd(b, a)).assertEqual(603.0);
      expect(nativeAdd(sum, -40.5)).assertEqual(562.5);
      expect(Math.abs(sum - 603.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(522.0);
      {
      const a: number = 682;
      const b: number = 48;
      const c: number = -1;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0041', `sum=${sum}`);
      expect(sum).assertEqual(730);
      expect(nativeAdd(b, a)).assertEqual(730);
      expect(nativeAdd(sum, -48)).assertEqual(682);
      expect(nativeAdd(a, 0)).assertEqual(682);
      expect(sum - b).assertEqual(682);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(729);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(729);
      expect(nativeAdd(a, a)).assertEqual(1364);
      expect(nativeAdd(-a, -b)).assertEqual(-730);
      }
      {
      const a: number = 724;
      const b: number = 55;
      const c: number = 10;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0042', `sum=${sum}`);
      expect(sum).assertEqual(779);
      expect(nativeAdd(b, a)).assertEqual(779);
      expect(nativeAdd(sum, -55)).assertEqual(724);
      expect(nativeAdd(a, 0)).assertEqual(724);
      expect(sum - b).assertEqual(724);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(789);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(789);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0043
     * @tc.name      testNativePerturb0043
     * @tc.desc      Native add perturbation 43 over 479 and -35
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 479;
      const b: number = -35;
      const c: number = 21;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0043', `sum=${sum}`);
      expect(sum).assertEqual(444);
      expect(nativeAdd(b, a)).assertEqual(444);
      expect(nativeAdd(sum, 35)).assertEqual(479);
      expect(nativeAdd(a, 0)).assertEqual(479);
      expect(sum - b).assertEqual(479);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(465);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(465);
      {
      const a: number = 605.5;
      const b: number = -28.5;
      const c: number = 32;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0044', `sum=${sum}`);
      expect(sum).assertEqual(577.0);
      expect(nativeAdd(b, a)).assertEqual(577.0);
      expect(nativeAdd(sum, 28.5)).assertEqual(605.5);
      expect(Math.abs(sum - 577.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(634.0);
      }
      {
      const a: number = 647;
      const b: number = -21;
      const c: number = -9.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0045', `sum=${sum}`);
      expect(sum).assertEqual(626);
      expect(nativeAdd(b, a)).assertEqual(626);
      expect(nativeAdd(sum, 21)).assertEqual(647);
      expect(nativeAdd(a, 0)).assertEqual(647);
      expect(sum - b).assertEqual(647);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(616.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(616.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0046
     * @tc.name      testNativePerturb0046
     * @tc.desc      Native add perturbation 46 over 599 and -14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 599;
      const b: number = -14;
      const c: number = 1;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0046', `sum=${sum}`);
      expect(sum).assertEqual(585);
      expect(nativeAdd(b, a)).assertEqual(585);
      expect(nativeAdd(sum, 14)).assertEqual(599);
      expect(nativeAdd(a, 0)).assertEqual(599);
      expect(sum - b).assertEqual(599);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(586);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(586);
      expect(nativeAdd(a, a)).assertEqual(1198);
      expect(nativeAdd(-a, -b)).assertEqual(-585);
      {
      const a: number = 731;
      const b: number = -7;
      const c: number = 12;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0047', `sum=${sum}`);
      expect(sum).assertEqual(724);
      expect(nativeAdd(b, a)).assertEqual(724);
      expect(nativeAdd(sum, 7)).assertEqual(731);
      expect(nativeAdd(a, 0)).assertEqual(731);
      expect(sum - b).assertEqual(731);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(736);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(736);
      }
      {
      const a: number = 773.5;
      const b: number = -0.5;
      const c: number = 23;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0048', `sum=${sum}`);
      expect(sum).assertEqual(773.0);
      expect(nativeAdd(b, a)).assertEqual(773.0);
      expect(nativeAdd(sum, 0.5)).assertEqual(773.5);
      expect(Math.abs(sum - 773.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(774.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0049
     * @tc.name      testNativePerturb0049
     * @tc.desc      Native add perturbation 49 over 719 and 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 719;
      const b: number = 7;
      const c: number = 34;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0049', `sum=${sum}`);
      expect(sum).assertEqual(726);
      expect(nativeAdd(b, a)).assertEqual(726);
      expect(nativeAdd(sum, -7)).assertEqual(719);
      expect(nativeAdd(a, 0)).assertEqual(719);
      expect(sum - b).assertEqual(719);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(760);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(760);
      {
      const a: number = 654;
      const b: number = 14;
      const c: number = -8;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0050', `sum=${sum}`);
      expect(sum).assertEqual(668);
      expect(nativeAdd(b, a)).assertEqual(668);
      expect(nativeAdd(sum, -14)).assertEqual(654);
      expect(nativeAdd(a, 0)).assertEqual(654);
      expect(sum - b).assertEqual(654);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(660);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(660);
      }
      {
      const a: number = 696;
      const b: number = 21;
      const c: number = 3;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0051', `sum=${sum}`);
      expect(sum).assertEqual(717);
      expect(nativeAdd(b, a)).assertEqual(717);
      expect(nativeAdd(sum, -21)).assertEqual(696);
      expect(nativeAdd(a, 0)).assertEqual(696);
      expect(sum - b).assertEqual(696);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(720);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(720);
      expect(nativeAdd(a, a)).assertEqual(1392);
      expect(nativeAdd(-a, -b)).assertEqual(-717);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0052
     * @tc.name      testNativePerturb0052
     * @tc.desc      Native add perturbation 52 over 636.5 and 27.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 636.5;
      const b: number = 27.5;
      const c: number = 14;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0052', `sum=${sum}`);
      expect(sum).assertEqual(664.0);
      expect(nativeAdd(b, a)).assertEqual(664.0);
      expect(nativeAdd(sum, -27.5)).assertEqual(636.5);
      expect(Math.abs(sum - 664.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(609.0);
      {
      const a: number = 780;
      const b: number = 35;
      const c: number = 25;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0053', `sum=${sum}`);
      expect(sum).assertEqual(815);
      expect(nativeAdd(b, a)).assertEqual(815);
      expect(nativeAdd(sum, -35)).assertEqual(780);
      expect(nativeAdd(a, 0)).assertEqual(780);
      expect(sum - b).assertEqual(780);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(840);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(840);
      }
      {
      const a: number = 822;
      const b: number = 42;
      const c: number = -16.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0054', `sum=${sum}`);
      expect(sum).assertEqual(864);
      expect(nativeAdd(b, a)).assertEqual(864);
      expect(nativeAdd(sum, -42)).assertEqual(822);
      expect(nativeAdd(a, 0)).assertEqual(822);
      expect(sum - b).assertEqual(822);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(847.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(847.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0055
     * @tc.name      testNativePerturb0055
     * @tc.desc      Native add perturbation 55 over 756 and 49
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 756;
      const b: number = 49;
      const c: number = -6;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0055', `sum=${sum}`);
      expect(sum).assertEqual(805);
      expect(nativeAdd(b, a)).assertEqual(805);
      expect(nativeAdd(sum, -49)).assertEqual(756);
      expect(nativeAdd(a, 0)).assertEqual(756);
      expect(sum - b).assertEqual(756);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(799);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(799);
      expect(sum % 9).assertEqual(4);
      {
      const a: number = 906.5;
      const b: number = 55.5;
      const c: number = 5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0056', `sum=${sum}`);
      expect(sum).assertEqual(962.0);
      expect(nativeAdd(b, a)).assertEqual(962.0);
      expect(nativeAdd(sum, -55.5)).assertEqual(906.5);
      expect(Math.abs(sum - 962.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(851.0);
      }
      {
      const a: number = 745;
      const b: number = -34;
      const c: number = 16;
