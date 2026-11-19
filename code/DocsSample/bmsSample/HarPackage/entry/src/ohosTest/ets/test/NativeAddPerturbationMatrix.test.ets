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
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0057', `sum=${sum}`);
      expect(sum).assertEqual(711);
      expect(nativeAdd(b, a)).assertEqual(711);
      expect(nativeAdd(sum, 34)).assertEqual(745);
      expect(nativeAdd(a, 0)).assertEqual(745);
      expect(sum - b).assertEqual(745);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(727);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(727);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0058
     * @tc.name      testNativePerturb0058
     * @tc.desc      Native add perturbation 58 over 673 and -27
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 673;
      const b: number = -27;
      const c: number = 27;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0058', `sum=${sum}`);
      expect(sum).assertEqual(646);
      expect(nativeAdd(b, a)).assertEqual(646);
      expect(nativeAdd(sum, 27)).assertEqual(673);
      expect(nativeAdd(a, 0)).assertEqual(673);
      expect(sum - b).assertEqual(673);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(673);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(673);
      {
      const a: number = 829;
      const b: number = -20;
      const c: number = -15;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0059', `sum=${sum}`);
      expect(sum).assertEqual(809);
      expect(nativeAdd(b, a)).assertEqual(809);
      expect(nativeAdd(sum, 20)).assertEqual(829);
      expect(nativeAdd(a, 0)).assertEqual(829);
      expect(sum - b).assertEqual(829);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(794);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(794);
      }
      {
      const a: number = 871.5;
      const b: number = -13.5;
      const c: number = -4;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0060', `sum=${sum}`);
      expect(sum).assertEqual(858.0);
      expect(nativeAdd(b, a)).assertEqual(858.0);
      expect(nativeAdd(sum, 13.5)).assertEqual(871.5);
      expect(Math.abs(sum - 858.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(885.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0061
     * @tc.name      testNativePerturb0061
     * @tc.desc      Native add perturbation 61 over 793 and -6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 793;
      const b: number = -6;
      const c: number = 7;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0061', `sum=${sum}`);
      expect(sum).assertEqual(787);
      expect(nativeAdd(b, a)).assertEqual(787);
      expect(nativeAdd(sum, 6)).assertEqual(793);
      expect(nativeAdd(a, 0)).assertEqual(793);
      expect(sum - b).assertEqual(793);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(794);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(794);
      expect(nativeAdd(a, a)).assertEqual(1586);
      expect(nativeAdd(-a, -b)).assertEqual(-787);
      {
      const a: number = 955;
      const b: number = 1;
      const c: number = 18;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0062', `sum=${sum}`);
      expect(sum).assertEqual(956);
      expect(nativeAdd(b, a)).assertEqual(956);
      expect(nativeAdd(sum, -1)).assertEqual(955);
      expect(nativeAdd(a, 0)).assertEqual(955);
      expect(sum - b).assertEqual(955);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(974);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(974);
      }
      {
      const a: number = 997;
      const b: number = 8;
      const c: number = 29.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0063', `sum=${sum}`);
      expect(sum).assertEqual(1005);
      expect(nativeAdd(b, a)).assertEqual(1005);
      expect(nativeAdd(sum, -8)).assertEqual(997);
      expect(nativeAdd(a, 0)).assertEqual(997);
      expect(sum - b).assertEqual(997);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1034.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1034.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0064
     * @tc.name      testNativePerturb0064
     * @tc.desc      Native add perturbation 64 over 710.5 and 14.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 710.5;
      const b: number = 14.5;
      const c: number = -13;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0064', `sum=${sum}`);
      expect(sum).assertEqual(725.0);
      expect(nativeAdd(b, a)).assertEqual(725.0);
      expect(nativeAdd(sum, -14.5)).assertEqual(710.5);
      expect(Math.abs(sum - 725.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(696.0);
      {
      const a: number = 878;
      const b: number = 22;
      const c: number = -2;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0065', `sum=${sum}`);
      expect(sum).assertEqual(900);
      expect(nativeAdd(b, a)).assertEqual(900);
      expect(nativeAdd(sum, -22)).assertEqual(878);
      expect(nativeAdd(a, 0)).assertEqual(878);
      expect(sum - b).assertEqual(878);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(898);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(898);
      }
      {
      const a: number = 920;
      const b: number = 29;
      const c: number = 9;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0066', `sum=${sum}`);
      expect(sum).assertEqual(949);
      expect(nativeAdd(b, a)).assertEqual(949);
      expect(nativeAdd(sum, -29)).assertEqual(920);
      expect(nativeAdd(a, 0)).assertEqual(920);
      expect(sum - b).assertEqual(920);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(958);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(958);
      expect(nativeAdd(a, a)).assertEqual(1840);
      expect(nativeAdd(-a, -b)).assertEqual(-949);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0067
     * @tc.name      testNativePerturb0067
     * @tc.desc      Native add perturbation 67 over 830 and 36
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 830;
      const b: number = 36;
      const c: number = 20;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0067', `sum=${sum}`);
      expect(sum).assertEqual(866);
      expect(nativeAdd(b, a)).assertEqual(866);
      expect(nativeAdd(sum, -36)).assertEqual(830);
      expect(nativeAdd(a, 0)).assertEqual(830);
      expect(sum - b).assertEqual(830);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(886);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(886);
      {
      const a: number = 1004.5;
      const b: number = 42.5;
      const c: number = 31;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0068', `sum=${sum}`);
      expect(sum).assertEqual(1047.0);
      expect(nativeAdd(b, a)).assertEqual(1047.0);
      expect(nativeAdd(sum, -42.5)).assertEqual(1004.5);
      expect(Math.abs(sum - 1047.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(962.0);
      }
      {
      const a: number = 1046;
      const b: number = 50;
      const c: number = -11;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0069', `sum=${sum}`);
      expect(sum).assertEqual(1096);
      expect(nativeAdd(b, a)).assertEqual(1096);
      expect(nativeAdd(sum, -50)).assertEqual(1046);
      expect(nativeAdd(a, 0)).assertEqual(1046);
      expect(sum - b).assertEqual(1046);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1085);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1085);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0070
     * @tc.name      testNativePerturb0070
     * @tc.desc      Native add perturbation 70 over 950 and 57
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 950;
      const b: number = 57;
      const c: number = 0;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0070', `sum=${sum}`);
      expect(sum).assertEqual(1007);
      expect(nativeAdd(b, a)).assertEqual(1007);
      expect(nativeAdd(sum, -57)).assertEqual(950);
      expect(nativeAdd(a, 0)).assertEqual(950);
      expect(sum - b).assertEqual(950);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1007);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1007);
      {
      const a: number = 927;
      const b: number = -33;
      const c: number = 11;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0071', `sum=${sum}`);
      expect(sum).assertEqual(894);
      expect(nativeAdd(b, a)).assertEqual(894);
      expect(nativeAdd(sum, 33)).assertEqual(927);
      expect(nativeAdd(a, 0)).assertEqual(927);
      expect(sum - b).assertEqual(927);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(905);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(905);
      expect(sum % 9).assertEqual(3);
      expect(nativeAdd(a, a)).assertEqual(1854);
      expect(nativeAdd(-a, -b)).assertEqual(-894);
      }
      {
      const a: number = 969.5;
      const b: number = -26.5;
      const c: number = 22.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0072', `sum=${sum}`);
      expect(sum).assertEqual(943.0);
      expect(nativeAdd(b, a)).assertEqual(943.0);
      expect(nativeAdd(sum, 26.5)).assertEqual(969.5);
      expect(Math.abs(sum - 943.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(996.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0073
     * @tc.name      testNativePerturb0073
     * @tc.desc      Native add perturbation 73 over 867 and -19
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 867;
      const b: number = -19;
      const c: number = 33;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0073', `sum=${sum}`);
      expect(sum).assertEqual(848);
      expect(nativeAdd(b, a)).assertEqual(848);
      expect(nativeAdd(sum, 19)).assertEqual(867);
      expect(nativeAdd(a, 0)).assertEqual(867);
      expect(sum - b).assertEqual(867);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(881);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(881);
      {
      const a: number = 1053;
      const b: number = -12;
      const c: number = -9;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0074', `sum=${sum}`);
      expect(sum).assertEqual(1041);
      expect(nativeAdd(b, a)).assertEqual(1041);
      expect(nativeAdd(sum, 12)).assertEqual(1053);
      expect(nativeAdd(a, 0)).assertEqual(1053);
      expect(sum - b).assertEqual(1053);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1032);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1032);
      expect(sum % 9).assertEqual(6);
      }
      {
      const a: number = 1095;
      const b: number = -5;
      const c: number = 2;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0075', `sum=${sum}`);
      expect(sum).assertEqual(1090);
      expect(nativeAdd(b, a)).assertEqual(1090);
      expect(nativeAdd(sum, 5)).assertEqual(1095);
      expect(nativeAdd(a, 0)).assertEqual(1095);
      expect(sum - b).assertEqual(1095);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1092);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1092);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0076
     * @tc.name      testNativePerturb0076
     * @tc.desc      Native add perturbation 76 over 987.5 and 1.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 987.5;
      const b: number = 1.5;
      const c: number = 13;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0076', `sum=${sum}`);
      expect(sum).assertEqual(989.0);
      expect(nativeAdd(b, a)).assertEqual(989.0);
      expect(nativeAdd(sum, -1.5)).assertEqual(987.5);
      expect(Math.abs(sum - 989.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(986.0);
      {
      const a: number = 1179;
      const b: number = 9;
      const c: number = 24;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0077', `sum=${sum}`);
      expect(sum).assertEqual(1188);
      expect(nativeAdd(b, a)).assertEqual(1188);
      expect(nativeAdd(sum, -9)).assertEqual(1179);
      expect(nativeAdd(a, 0)).assertEqual(1179);
      expect(sum - b).assertEqual(1179);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1212);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1212);
      expect(sum % 9).assertEqual(0);
      }
      {
      const a: number = 1018;
      const b: number = 16;
      const c: number = 35;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0078', `sum=${sum}`);
      expect(sum).assertEqual(1034);
      expect(nativeAdd(b, a)).assertEqual(1034);
      expect(nativeAdd(sum, -16)).assertEqual(1018);
      expect(nativeAdd(a, 0)).assertEqual(1018);
      expect(sum - b).assertEqual(1018);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1069);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1069);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0079
     * @tc.name      testNativePerturb0079
     * @tc.desc      Native add perturbation 79 over 904 and 23
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 904;
      const b: number = 23;
      const c: number = -7;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0079', `sum=${sum}`);
      expect(sum).assertEqual(927);
      expect(nativeAdd(b, a)).assertEqual(927);
      expect(nativeAdd(sum, -23)).assertEqual(904);
      expect(nativeAdd(a, 0)).assertEqual(904);
      expect(sum - b).assertEqual(904);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(920);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(920);
      {
      const a: number = 1102.5;
      const b: number = 29.5;
      const c: number = 4;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0080', `sum=${sum}`);
      expect(sum).assertEqual(1132.0);
      expect(nativeAdd(b, a)).assertEqual(1132.0);
      expect(nativeAdd(sum, -29.5)).assertEqual(1102.5);
      expect(Math.abs(sum - 1132.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1073.0);
      }
      {
      const a: number = 1144;
      const b: number = 37;
      const c: number = 15.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0081', `sum=${sum}`);
      expect(sum).assertEqual(1181);
      expect(nativeAdd(b, a)).assertEqual(1181);
      expect(nativeAdd(sum, -37)).assertEqual(1144);
      expect(nativeAdd(a, 0)).assertEqual(1144);
      expect(sum - b).assertEqual(1144);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1196.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1196.5);
      expect(nativeAdd(a, a)).assertEqual(2288);
      expect(nativeAdd(-a, -b)).assertEqual(-1181);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0082
     * @tc.name      testNativePerturb0082
     * @tc.desc      Native add perturbation 82 over 1024 and 44
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1024;
      const b: number = 44;
      const c: number = 26;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0082', `sum=${sum}`);
      expect(sum).assertEqual(1068);
      expect(nativeAdd(b, a)).assertEqual(1068);
      expect(nativeAdd(sum, -44)).assertEqual(1024);
      expect(nativeAdd(a, 0)).assertEqual(1024);
      expect(sum - b).assertEqual(1024);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1094);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1094);
      {
      const a: number = 1228;
      const b: number = 51;
      const c: number = -16;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0083', `sum=${sum}`);
      expect(sum).assertEqual(1279);
      expect(nativeAdd(b, a)).assertEqual(1279);
      expect(nativeAdd(sum, -51)).assertEqual(1228);
      expect(nativeAdd(a, 0)).assertEqual(1228);
      expect(sum - b).assertEqual(1228);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1263);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1263);
      }
      {
      const a: number = 1270.5;
      const b: number = 57.5;
      const c: number = -5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0084', `sum=${sum}`);
      expect(sum).assertEqual(1328.0);
      expect(nativeAdd(b, a)).assertEqual(1328.0);
      expect(nativeAdd(sum, -57.5)).assertEqual(1270.5);
      expect(Math.abs(sum - 1328.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1213.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0085
     * @tc.name      testNativePerturb0085
     * @tc.desc      Native add perturbation 85 over 941 and -32
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 941;
      const b: number = -32;
      const c: number = 6;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0085', `sum=${sum}`);
      expect(sum).assertEqual(909);
      expect(nativeAdd(b, a)).assertEqual(909);
      expect(nativeAdd(sum, 32)).assertEqual(941);
      expect(nativeAdd(a, 0)).assertEqual(941);
      expect(sum - b).assertEqual(941);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(915);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(915);
      {
      const a: number = 1151;
      const b: number = -25;
      const c: number = 17;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0086', `sum=${sum}`);
      expect(sum).assertEqual(1126);
      expect(nativeAdd(b, a)).assertEqual(1126);
      expect(nativeAdd(sum, 25)).assertEqual(1151);
      expect(nativeAdd(a, 0)).assertEqual(1151);
      expect(sum - b).assertEqual(1151);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1143);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1143);
      expect(nativeAdd(a, a)).assertEqual(2302);
      expect(nativeAdd(-a, -b)).assertEqual(-1126);
      }
      {
      const a: number = 1193;
      const b: number = -18;
      const c: number = 28;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0087', `sum=${sum}`);
      expect(sum).assertEqual(1175);
      expect(nativeAdd(b, a)).assertEqual(1175);
      expect(nativeAdd(sum, 18)).assertEqual(1193);
      expect(nativeAdd(a, 0)).assertEqual(1193);
      expect(sum - b).assertEqual(1193);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1203);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1203);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0088
     * @tc.name      testNativePerturb0088
     * @tc.desc      Native add perturbation 88 over 1061.5 and -11.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1061.5;
      const b: number = -11.5;
      const c: number = -14;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0088', `sum=${sum}`);
      expect(sum).assertEqual(1050.0);
      expect(nativeAdd(b, a)).assertEqual(1050.0);
      expect(nativeAdd(sum, 11.5)).assertEqual(1061.5);
      expect(Math.abs(sum - 1050.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1073.0);
      {
      const a: number = 1277;
      const b: number = -4;
      const c: number = -3;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0089', `sum=${sum}`);
      expect(sum).assertEqual(1273);
      expect(nativeAdd(b, a)).assertEqual(1273);
      expect(nativeAdd(sum, 4)).assertEqual(1277);
      expect(nativeAdd(a, 0)).assertEqual(1277);
      expect(sum - b).assertEqual(1277);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1270);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1270);
      }
      {
      const a: number = 1319;
      const b: number = 3;
      const c: number = 8.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0090', `sum=${sum}`);
      expect(sum).assertEqual(1322);
      expect(nativeAdd(b, a)).assertEqual(1322);
      expect(nativeAdd(sum, -3)).assertEqual(1319);
      expect(nativeAdd(a, 0)).assertEqual(1319);
      expect(sum - b).assertEqual(1319);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1330.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1330.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0091
     * @tc.name      testNativePerturb0091
     * @tc.desc      Native add perturbation 91 over 1181 and 10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1181;
      const b: number = 10;
      const c: number = 19;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0091', `sum=${sum}`);
      expect(sum).assertEqual(1191);
      expect(nativeAdd(b, a)).assertEqual(1191);
      expect(nativeAdd(sum, -10)).assertEqual(1181);
      expect(nativeAdd(a, 0)).assertEqual(1181);
      expect(sum - b).assertEqual(1181);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1210);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1210);
      expect(nativeAdd(a, a)).assertEqual(2362);
      expect(nativeAdd(-a, -b)).assertEqual(-1191);
      {
      const a: number = 1200.5;
      const b: number = 16.5;
      const c: number = 30;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0092', `sum=${sum}`);
      expect(sum).assertEqual(1217.0);
      expect(nativeAdd(b, a)).assertEqual(1217.0);
      expect(nativeAdd(sum, -16.5)).assertEqual(1200.5);
      expect(Math.abs(sum - 1217.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1184.0);
      }
      {
      const a: number = 1242;
      const b: number = 24;
      const c: number = -12;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0093', `sum=${sum}`);
      expect(sum).assertEqual(1266);
      expect(nativeAdd(b, a)).assertEqual(1266);
      expect(nativeAdd(sum, -24)).assertEqual(1242);
      expect(nativeAdd(a, 0)).assertEqual(1242);
      expect(sum - b).assertEqual(1242);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1254);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1254);
      expect(sum % 9).assertEqual(6);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0094
     * @tc.name      testNativePerturb0094
     * @tc.desc      Native add perturbation 94 over 1098 and 31
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1098;
      const b: number = 31;
      const c: number = -1;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0094', `sum=${sum}`);
      expect(sum).assertEqual(1129);
      expect(nativeAdd(b, a)).assertEqual(1129);
      expect(nativeAdd(sum, -31)).assertEqual(1098);
      expect(nativeAdd(a, 0)).assertEqual(1098);
      expect(sum - b).assertEqual(1098);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1128);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1128);
      expect(sum % 9).assertEqual(4);
      {
      const a: number = 1326;
      const b: number = 38;
      const c: number = 10;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0095', `sum=${sum}`);
      expect(sum).assertEqual(1364);
      expect(nativeAdd(b, a)).assertEqual(1364);
      expect(nativeAdd(sum, -38)).assertEqual(1326);
      expect(nativeAdd(a, 0)).assertEqual(1326);
      expect(sum - b).assertEqual(1326);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1374);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1374);
      }
      {
      const a: number = 1368.5;
      const b: number = 44.5;
      const c: number = 21;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0096', `sum=${sum}`);
      expect(sum).assertEqual(1413.0);
      expect(nativeAdd(b, a)).assertEqual(1413.0);
      expect(nativeAdd(sum, -44.5)).assertEqual(1368.5);
      expect(Math.abs(sum - 1413.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1324.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0097
     * @tc.name      testNativePerturb0097
     * @tc.desc      Native add perturbation 97 over 1218 and 52
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1218;
      const b: number = 52;
      const c: number = 32;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0097', `sum=${sum}`);
      expect(sum).assertEqual(1270);
      expect(nativeAdd(b, a)).assertEqual(1270);
      expect(nativeAdd(sum, -52)).assertEqual(1218);
      expect(nativeAdd(a, 0)).assertEqual(1218);
      expect(sum - b).assertEqual(1218);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1302);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1302);
      {
      const a: number = 1452;
      const b: number = -38;
      const c: number = -10;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0098', `sum=${sum}`);
      expect(sum).assertEqual(1414);
      expect(nativeAdd(b, a)).assertEqual(1414);
      expect(nativeAdd(sum, 38)).assertEqual(1452);
      expect(nativeAdd(a, 0)).assertEqual(1452);
      expect(sum - b).assertEqual(1452);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1404);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1404);
      }
      {
      const a: number = 1291;
      const b: number = -31;
      const c: number = 1.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0099', `sum=${sum}`);
      expect(sum).assertEqual(1260);
      expect(nativeAdd(b, a)).assertEqual(1260);
      expect(nativeAdd(sum, 31)).assertEqual(1291);
      expect(nativeAdd(a, 0)).assertEqual(1291);
      expect(sum - b).assertEqual(1291);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1261.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1261.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0100
     * @tc.name      testNativePerturb0100
     * @tc.desc      Native add perturbation 100 over 1135.5 and -24.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1135.5;
      const b: number = -24.5;
      const c: number = 12;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0100', `sum=${sum}`);
      expect(sum).assertEqual(1111.0);
      expect(nativeAdd(b, a)).assertEqual(1111.0);
      expect(nativeAdd(sum, 24.5)).assertEqual(1135.5);
      expect(Math.abs(sum - 1111.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1160.0);
      {
      const a: number = 1375;
      const b: number = -17;
      const c: number = 23;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0101', `sum=${sum}`);
      expect(sum).assertEqual(1358);
      expect(nativeAdd(b, a)).assertEqual(1358);
      expect(nativeAdd(sum, 17)).assertEqual(1375);
      expect(nativeAdd(a, 0)).assertEqual(1375);
      expect(sum - b).assertEqual(1375);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1381);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1381);
      expect(nativeAdd(a, a)).assertEqual(2750);
      expect(nativeAdd(-a, -b)).assertEqual(-1358);
      }
      {
      const a: number = 1417;
      const b: number = -10;
      const c: number = 34;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0102', `sum=${sum}`);
      expect(sum).assertEqual(1407);
      expect(nativeAdd(b, a)).assertEqual(1407);
      expect(nativeAdd(sum, 10)).assertEqual(1417);
      expect(nativeAdd(a, 0)).assertEqual(1417);
      expect(sum - b).assertEqual(1417);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1441);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1441);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0103
     * @tc.name      testNativePerturb0103
     * @tc.desc      Native add perturbation 103 over 1255 and -3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1255;
      const b: number = -3;
      const c: number = -8;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0103', `sum=${sum}`);
      expect(sum).assertEqual(1252);
      expect(nativeAdd(b, a)).assertEqual(1252);
      expect(nativeAdd(sum, 3)).assertEqual(1255);
      expect(nativeAdd(a, 0)).assertEqual(1255);
      expect(sum - b).assertEqual(1255);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1244);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1244);
      {
      const a: number = 1501.5;
      const b: number = 3.5;
      const c: number = 3;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0104', `sum=${sum}`);
      expect(sum).assertEqual(1505.0);
      expect(nativeAdd(b, a)).assertEqual(1505.0);
      expect(nativeAdd(sum, -3.5)).assertEqual(1501.5);
      expect(Math.abs(sum - 1505.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1498.0);
      }
      {
      const a: number = 1543;
      const b: number = 11;
      const c: number = 14;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0105', `sum=${sum}`);
      expect(sum).assertEqual(1554);
      expect(nativeAdd(b, a)).assertEqual(1554);
      expect(nativeAdd(sum, -11)).assertEqual(1543);
      expect(nativeAdd(a, 0)).assertEqual(1543);
      expect(sum - b).assertEqual(1543);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1568);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1568);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0106
     * @tc.name      testNativePerturb0106
     * @tc.desc      Native add perturbation 106 over 1172 and 18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1172;
      const b: number = 18;
      const c: number = 25;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0106', `sum=${sum}`);
      expect(sum).assertEqual(1190);
      expect(nativeAdd(b, a)).assertEqual(1190);
      expect(nativeAdd(sum, -18)).assertEqual(1172);
      expect(nativeAdd(a, 0)).assertEqual(1172);
      expect(sum - b).assertEqual(1172);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1215);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1215);
      expect(nativeAdd(a, a)).assertEqual(2344);
      expect(nativeAdd(-a, -b)).assertEqual(-1190);
      {
      const a: number = 1424;
      const b: number = 25;
      const c: number = -17;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0107', `sum=${sum}`);
      expect(sum).assertEqual(1449);
      expect(nativeAdd(b, a)).assertEqual(1449);
      expect(nativeAdd(sum, -25)).assertEqual(1424);
      expect(nativeAdd(a, 0)).assertEqual(1424);
      expect(sum - b).assertEqual(1424);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1432);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1432);
      }
      {
      const a: number = 1466.5;
      const b: number = 31.5;
      const c: number = -5.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0108', `sum=${sum}`);
      expect(sum).assertEqual(1498.0);
      expect(nativeAdd(b, a)).assertEqual(1498.0);
      expect(nativeAdd(sum, -31.5)).assertEqual(1466.5);
      expect(Math.abs(sum - 1498.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1435.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0109
     * @tc.name      testNativePerturb0109
     * @tc.desc      Native add perturbation 109 over 1292 and 39
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1292;
      const b: number = 39;
      const c: number = 5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0109', `sum=${sum}`);
      expect(sum).assertEqual(1331);
      expect(nativeAdd(b, a)).assertEqual(1331);
      expect(nativeAdd(sum, -39)).assertEqual(1292);
      expect(nativeAdd(a, 0)).assertEqual(1292);
      expect(sum - b).assertEqual(1292);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1336);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1336);
      {
      const a: number = 1550;
      const b: number = 46;
      const c: number = 16;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0110', `sum=${sum}`);
      expect(sum).assertEqual(1596);
      expect(nativeAdd(b, a)).assertEqual(1596);
      expect(nativeAdd(sum, -46)).assertEqual(1550);
      expect(nativeAdd(a, 0)).assertEqual(1550);
      expect(sum - b).assertEqual(1550);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1612);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1612);
      }
      {
      const a: number = 1592;
      const b: number = 53;
      const c: number = 27;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0111', `sum=${sum}`);
      expect(sum).assertEqual(1645);
      expect(nativeAdd(b, a)).assertEqual(1645);
      expect(nativeAdd(sum, -53)).assertEqual(1592);
      expect(nativeAdd(a, 0)).assertEqual(1592);
      expect(sum - b).assertEqual(1592);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1672);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1672);
      expect(nativeAdd(a, a)).assertEqual(3184);
      expect(nativeAdd(-a, -b)).assertEqual(-1645);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0112
     * @tc.name      testNativePerturb0112
     * @tc.desc      Native add perturbation 112 over 1412.5 and -37.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1412.5;
      const b: number = -37.5;
      const c: number = -15;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0112', `sum=${sum}`);
      expect(sum).assertEqual(1375.0);
      expect(nativeAdd(b, a)).assertEqual(1375.0);
      expect(nativeAdd(sum, 37.5)).assertEqual(1412.5);
      expect(Math.abs(sum - 1375.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1450.0);
      {
      const a: number = 1473;
      const b: number = -30;
      const c: number = -4;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0113', `sum=${sum}`);
      expect(sum).assertEqual(1443);
      expect(nativeAdd(b, a)).assertEqual(1443);
      expect(nativeAdd(sum, 30)).assertEqual(1473);
      expect(nativeAdd(a, 0)).assertEqual(1473);
      expect(sum - b).assertEqual(1473);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1439);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1439);
      }
      {
      const a: number = 1515;
      const b: number = -23;
      const c: number = 7;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0114', `sum=${sum}`);
      expect(sum).assertEqual(1492);
      expect(nativeAdd(b, a)).assertEqual(1492);
      expect(nativeAdd(sum, 23)).assertEqual(1515);
      expect(nativeAdd(a, 0)).assertEqual(1515);
      expect(sum - b).assertEqual(1515);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1499);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1499);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0115
     * @tc.name      testNativePerturb0115
     * @tc.desc      Native add perturbation 115 over 1329 and -16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1329;
      const b: number = -16;
      const c: number = 18;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0115', `sum=${sum}`);
      expect(sum).assertEqual(1313);
      expect(nativeAdd(b, a)).assertEqual(1313);
      expect(nativeAdd(sum, 16)).assertEqual(1329);
      expect(nativeAdd(a, 0)).assertEqual(1329);
      expect(sum - b).assertEqual(1329);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1331);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1331);
      {
      const a: number = 1599.5;
      const b: number = -9.5;
      const c: number = 29;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0116', `sum=${sum}`);
      expect(sum).assertEqual(1590.0);
      expect(nativeAdd(b, a)).assertEqual(1590.0);
      expect(nativeAdd(sum, 9.5)).assertEqual(1599.5);
      expect(Math.abs(sum - 1590.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1609.0);
      }
      {
      const a: number = 1641;
      const b: number = -2;
      const c: number = -12.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0117', `sum=${sum}`);
      expect(sum).assertEqual(1639);
      expect(nativeAdd(b, a)).assertEqual(1639);
      expect(nativeAdd(sum, 2)).assertEqual(1641);
      expect(nativeAdd(a, 0)).assertEqual(1641);
      expect(sum - b).assertEqual(1641);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1626.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1626.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0118
     * @tc.name      testNativePerturb0118
     * @tc.desc      Native add perturbation 118 over 1449 and 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1449;
      const b: number = 5;
      const c: number = -2;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0118', `sum=${sum}`);
      expect(sum).assertEqual(1454);
      expect(nativeAdd(b, a)).assertEqual(1454);
      expect(nativeAdd(sum, -5)).assertEqual(1449);
      expect(nativeAdd(a, 0)).assertEqual(1449);
      expect(sum - b).assertEqual(1449);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1452);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1452);
      expect(sum % 9).assertEqual(5);
      {
      const a: number = 1725;
      const b: number = 12;
      const c: number = 9;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0119', `sum=${sum}`);
      expect(sum).assertEqual(1737);
      expect(nativeAdd(b, a)).assertEqual(1737);
      expect(nativeAdd(sum, -12)).assertEqual(1725);
      expect(nativeAdd(a, 0)).assertEqual(1725);
      expect(sum - b).assertEqual(1725);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1746);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1746);
      }
      {
      const a: number = 1564.5;
      const b: number = 18.5;
      const c: number = 20;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0120', `sum=${sum}`);
      expect(sum).assertEqual(1583.0);
      expect(nativeAdd(b, a)).assertEqual(1583.0);
      expect(nativeAdd(sum, -18.5)).assertEqual(1564.5);
      expect(Math.abs(sum - 1583.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1546.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0121
     * @tc.name      testNativePerturb0121
     * @tc.desc      Native add perturbation 121 over 1366 and 26
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1366;
      const b: number = 26;
      const c: number = 31;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0121', `sum=${sum}`);
      expect(sum).assertEqual(1392);
      expect(nativeAdd(b, a)).assertEqual(1392);
      expect(nativeAdd(sum, -26)).assertEqual(1366);
      expect(nativeAdd(a, 0)).assertEqual(1366);
      expect(sum - b).assertEqual(1366);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1423);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1423);
      expect(nativeAdd(a, a)).assertEqual(2732);
      expect(nativeAdd(-a, -b)).assertEqual(-1392);
      {
      const a: number = 1648;
      const b: number = 33;
      const c: number = -11;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0122', `sum=${sum}`);
      expect(sum).assertEqual(1681);
      expect(nativeAdd(b, a)).assertEqual(1681);
      expect(nativeAdd(sum, -33)).assertEqual(1648);
      expect(nativeAdd(a, 0)).assertEqual(1648);
      expect(sum - b).assertEqual(1648);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1670);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1670);
      }
      {
      const a: number = 1690;
      const b: number = 40;
      const c: number = 0;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0123', `sum=${sum}`);
      expect(sum).assertEqual(1730);
      expect(nativeAdd(b, a)).assertEqual(1730);
      expect(nativeAdd(sum, -40)).assertEqual(1690);
      expect(nativeAdd(a, 0)).assertEqual(1690);
      expect(sum - b).assertEqual(1690);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1730);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1730);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0124
     * @tc.name      testNativePerturb0124
     * @tc.desc      Native add perturbation 124 over 1486.5 and 46.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1486.5;
      const b: number = 46.5;
      const c: number = 11;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0124', `sum=${sum}`);
      expect(sum).assertEqual(1533.0);
      expect(nativeAdd(b, a)).assertEqual(1533.0);
      expect(nativeAdd(sum, -46.5)).assertEqual(1486.5);
      expect(Math.abs(sum - 1533.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1440.0);
      {
      const a: number = 1774;
      const b: number = 54;
      const c: number = 22;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0125', `sum=${sum}`);
      expect(sum).assertEqual(1828);
      expect(nativeAdd(b, a)).assertEqual(1828);
      expect(nativeAdd(sum, -54)).assertEqual(1774);
      expect(nativeAdd(a, 0)).assertEqual(1774);
      expect(sum - b).assertEqual(1774);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1850);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1850);
      }
      {
      const a: number = 1816;
      const b: number = -36;
      const c: number = 33.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0126', `sum=${sum}`);
      expect(sum).assertEqual(1780);
      expect(nativeAdd(b, a)).assertEqual(1780);
      expect(nativeAdd(sum, 36)).assertEqual(1816);
      expect(nativeAdd(a, 0)).assertEqual(1816);
      expect(sum - b).assertEqual(1816);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1813.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1813.5);
      expect(nativeAdd(a, a)).assertEqual(3632);
      expect(nativeAdd(-a, -b)).assertEqual(-1780);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0127
     * @tc.name      testNativePerturb0127
     * @tc.desc      Native add perturbation 127 over 1403 and -29
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1403;
      const b: number = -29;
      const c: number = -9;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0127', `sum=${sum}`);
      expect(sum).assertEqual(1374);
      expect(nativeAdd(b, a)).assertEqual(1374);
      expect(nativeAdd(sum, 29)).assertEqual(1403);
      expect(nativeAdd(a, 0)).assertEqual(1403);
      expect(sum - b).assertEqual(1403);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1365);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1365);
      {
      const a: number = 1697.5;
      const b: number = -22.5;
      const c: number = 2;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0128', `sum=${sum}`);
      expect(sum).assertEqual(1675.0);
      expect(nativeAdd(b, a)).assertEqual(1675.0);
      expect(nativeAdd(sum, 22.5)).assertEqual(1697.5);
      expect(Math.abs(sum - 1675.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1720.0);
      }
      {
      const a: number = 1739;
      const b: number = -15;
      const c: number = 13;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0129', `sum=${sum}`);
      expect(sum).assertEqual(1724);
      expect(nativeAdd(b, a)).assertEqual(1724);
      expect(nativeAdd(sum, 15)).assertEqual(1739);
      expect(nativeAdd(a, 0)).assertEqual(1739);
      expect(sum - b).assertEqual(1739);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1737);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1737);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0130
     * @tc.name      testNativePerturb0130
     * @tc.desc      Native add perturbation 130 over 1523 and -8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1523;
      const b: number = -8;
      const c: number = 24;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0130', `sum=${sum}`);
      expect(sum).assertEqual(1515);
      expect(nativeAdd(b, a)).assertEqual(1515);
      expect(nativeAdd(sum, 8)).assertEqual(1523);
      expect(nativeAdd(a, 0)).assertEqual(1523);
      expect(sum - b).assertEqual(1523);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1539);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1539);
      {
      const a: number = 1823;
      const b: number = -1;
      const c: number = 35;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0131', `sum=${sum}`);
      expect(sum).assertEqual(1822);
      expect(nativeAdd(b, a)).assertEqual(1822);
      expect(nativeAdd(sum, 1)).assertEqual(1823);
      expect(nativeAdd(a, 0)).assertEqual(1823);
      expect(sum - b).assertEqual(1823);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1857);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1857);
      expect(nativeAdd(a, a)).assertEqual(3646);
      expect(nativeAdd(-a, -b)).assertEqual(-1822);
      }
      {
      const a: number = 1865.5;
      const b: number = 5.5;
      const c: number = -7;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0132', `sum=${sum}`);
      expect(sum).assertEqual(1871.0);
      expect(nativeAdd(b, a)).assertEqual(1871.0);
      expect(nativeAdd(sum, -5.5)).assertEqual(1865.5);
      expect(Math.abs(sum - 1871.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1860.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0133
     * @tc.name      testNativePerturb0133
     * @tc.desc      Native add perturbation 133 over 1643 and 13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1643;
      const b: number = 13;
      const c: number = 4;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0133', `sum=${sum}`);
      expect(sum).assertEqual(1656);
      expect(nativeAdd(b, a)).assertEqual(1656);
      expect(nativeAdd(sum, -13)).assertEqual(1643);
      expect(nativeAdd(a, 0)).assertEqual(1643);
      expect(sum - b).assertEqual(1643);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1660);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1660);
      {
      const a: number = 1746;
      const b: number = 20;
      const c: number = 15;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0134', `sum=${sum}`);
      expect(sum).assertEqual(1766);
      expect(nativeAdd(b, a)).assertEqual(1766);
      expect(nativeAdd(sum, -20)).assertEqual(1746);
      expect(nativeAdd(a, 0)).assertEqual(1746);
      expect(sum - b).assertEqual(1746);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1781);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1781);
      expect(sum % 9).assertEqual(2);
      }
      {
      const a: number = 1788;
      const b: number = 27;
      const c: number = 26.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0135', `sum=${sum}`);
      expect(sum).assertEqual(1815);
      expect(nativeAdd(b, a)).assertEqual(1815);
      expect(nativeAdd(sum, -27)).assertEqual(1788);
      expect(nativeAdd(a, 0)).assertEqual(1788);
      expect(sum - b).assertEqual(1788);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1841.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1841.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0136
     * @tc.name      testNativePerturb0136
     * @tc.desc      Native add perturbation 136 over 1560.5 and 33.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1560.5;
      const b: number = 33.5;
      const c: number = -16;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0136', `sum=${sum}`);
      expect(sum).assertEqual(1594.0);
      expect(nativeAdd(b, a)).assertEqual(1594.0);
      expect(nativeAdd(sum, -33.5)).assertEqual(1560.5);
      expect(Math.abs(sum - 1594.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1527.0);
      {
      const a: number = 1872;
      const b: number = 41;
      const c: number = -5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0137', `sum=${sum}`);
      expect(sum).assertEqual(1913);
      expect(nativeAdd(b, a)).assertEqual(1913);
      expect(nativeAdd(sum, -41)).assertEqual(1872);
      expect(nativeAdd(a, 0)).assertEqual(1872);
      expect(sum - b).assertEqual(1872);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1908);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1908);
      expect(sum % 9).assertEqual(5);
      }
      {
      const a: number = 1914;
      const b: number = 48;
      const c: number = 6;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0138', `sum=${sum}`);
      expect(sum).assertEqual(1962);
      expect(nativeAdd(b, a)).assertEqual(1962);
      expect(nativeAdd(sum, -48)).assertEqual(1914);
      expect(nativeAdd(a, 0)).assertEqual(1914);
      expect(sum - b).assertEqual(1914);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1968);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1968);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0139
     * @tc.name      testNativePerturb0139
     * @tc.desc      Native add perturbation 139 over 1680 and 55
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1680;
      const b: number = 55;
      const c: number = 17;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0139', `sum=${sum}`);
      expect(sum).assertEqual(1735);
      expect(nativeAdd(b, a)).assertEqual(1735);
      expect(nativeAdd(sum, -55)).assertEqual(1680);
      expect(nativeAdd(a, 0)).assertEqual(1680);
      expect(sum - b).assertEqual(1680);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1752);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1752);
      {
      const a: number = 1998.5;
      const b: number = -35.5;
      const c: number = 28;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0140', `sum=${sum}`);
      expect(sum).assertEqual(1963.0);
      expect(nativeAdd(b, a)).assertEqual(1963.0);
      expect(nativeAdd(sum, 35.5)).assertEqual(1998.5);
      expect(Math.abs(sum - 1963.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2034.0);
      }
      {
      const a: number = 1837;
      const b: number = -28;
      const c: number = -14;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0141', `sum=${sum}`);
      expect(sum).assertEqual(1809);
      expect(nativeAdd(b, a)).assertEqual(1809);
      expect(nativeAdd(sum, 28)).assertEqual(1837);
      expect(nativeAdd(a, 0)).assertEqual(1837);
      expect(sum - b).assertEqual(1837);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1795);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1795);
      expect(nativeAdd(a, a)).assertEqual(3674);
      expect(nativeAdd(-a, -b)).assertEqual(-1809);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0142
     * @tc.name      testNativePerturb0142
     * @tc.desc      Native add perturbation 142 over 1597 and -21
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1597;
      const b: number = -21;
      const c: number = -3;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0142', `sum=${sum}`);
      expect(sum).assertEqual(1576);
      expect(nativeAdd(b, a)).assertEqual(1576);
      expect(nativeAdd(sum, 21)).assertEqual(1597);
      expect(nativeAdd(a, 0)).assertEqual(1597);
      expect(sum - b).assertEqual(1597);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1573);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1573);
      {
      const a: number = 1921;
      const b: number = -14;
      const c: number = 8;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0143', `sum=${sum}`);
      expect(sum).assertEqual(1907);
      expect(nativeAdd(b, a)).assertEqual(1907);
      expect(nativeAdd(sum, 14)).assertEqual(1921);
      expect(nativeAdd(a, 0)).assertEqual(1921);
      expect(sum - b).assertEqual(1921);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1915);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1915);
      }
      {
      const a: number = 1963.5;
      const b: number = -7.5;
      const c: number = 19.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0144', `sum=${sum}`);
      expect(sum).assertEqual(1956.0);
      expect(nativeAdd(b, a)).assertEqual(1956.0);
      expect(nativeAdd(sum, 7.5)).assertEqual(1963.5);
      expect(Math.abs(sum - 1956.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1971.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0145
     * @tc.name      testNativePerturb0145
     * @tc.desc      Native add perturbation 145 over 1717 and 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1717;
      const b: number = 0;
      const c: number = 30;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0145', `sum=${sum}`);
      expect(sum).assertEqual(1717);
      expect(nativeAdd(b, a)).assertEqual(1717);
      expect(nativeAdd(sum, 0)).assertEqual(1717);
      expect(nativeAdd(a, 0)).assertEqual(1717);
      expect(sum - b).assertEqual(1717);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1747);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1747);
      {
      const a: number = 2047;
      const b: number = 7;
      const c: number = -12;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0146', `sum=${sum}`);
      expect(sum).assertEqual(2054);
      expect(nativeAdd(b, a)).assertEqual(2054);
      expect(nativeAdd(sum, -7)).assertEqual(2047);
      expect(nativeAdd(a, 0)).assertEqual(2047);
      expect(sum - b).assertEqual(2047);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2042);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2042);
      expect(nativeAdd(a, a)).assertEqual(4094);
      expect(nativeAdd(-a, -b)).assertEqual(-2054);
      }
      {
      const a: number = 2089;
      const b: number = 14;
      const c: number = -1;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0147', `sum=${sum}`);
      expect(sum).assertEqual(2103);
      expect(nativeAdd(b, a)).assertEqual(2103);
      expect(nativeAdd(sum, -14)).assertEqual(2089);
      expect(nativeAdd(a, 0)).assertEqual(2089);
      expect(sum - b).assertEqual(2089);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2102);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2102);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0148
     * @tc.name      testNativePerturb0148
     * @tc.desc      Native add perturbation 148 over 1634.5 and 20.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1634.5;
      const b: number = 20.5;
      const c: number = 10;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0148', `sum=${sum}`);
      expect(sum).assertEqual(1655.0);
      expect(nativeAdd(b, a)).assertEqual(1655.0);
      expect(nativeAdd(sum, -20.5)).assertEqual(1634.5);
      expect(Math.abs(sum - 1655.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1614.0);
      {
      const a: number = 1970;
      const b: number = 28;
      const c: number = 21;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0149', `sum=${sum}`);
      expect(sum).assertEqual(1998);
      expect(nativeAdd(b, a)).assertEqual(1998);
      expect(nativeAdd(sum, -28)).assertEqual(1970);
      expect(nativeAdd(a, 0)).assertEqual(1970);
      expect(sum - b).assertEqual(1970);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2019);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2019);
      }
      {
      const a: number = 2012;
      const b: number = 35;
      const c: number = 32;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0150', `sum=${sum}`);
      expect(sum).assertEqual(2047);
      expect(nativeAdd(b, a)).assertEqual(2047);
      expect(nativeAdd(sum, -35)).assertEqual(2012);
      expect(nativeAdd(a, 0)).assertEqual(2012);
      expect(sum - b).assertEqual(2012);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2079);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2079);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0151
     * @tc.name      testNativePerturb0151
     * @tc.desc      Native add perturbation 151 over 1754 and 42
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1754;
      const b: number = 42;
      const c: number = -10;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0151', `sum=${sum}`);
      expect(sum).assertEqual(1796);
      expect(nativeAdd(b, a)).assertEqual(1796);
      expect(nativeAdd(sum, -42)).assertEqual(1754);
      expect(nativeAdd(a, 0)).assertEqual(1754);
      expect(sum - b).assertEqual(1754);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1786);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1786);
      expect(nativeAdd(a, a)).assertEqual(3508);
      expect(nativeAdd(-a, -b)).assertEqual(-1796);
      {
      const a: number = 2096.5;
      const b: number = 48.5;
      const c: number = 1;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0152', `sum=${sum}`);
      expect(sum).assertEqual(2145.0);
      expect(nativeAdd(b, a)).assertEqual(2145.0);
      expect(nativeAdd(sum, -48.5)).assertEqual(2096.5);
      expect(Math.abs(sum - 2145.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2048.0);
      }
      {
      const a: number = 2138;
      const b: number = 56;
      const c: number = 12.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0153', `sum=${sum}`);
      expect(sum).assertEqual(2194);
      expect(nativeAdd(b, a)).assertEqual(2194);
      expect(nativeAdd(sum, -56)).assertEqual(2138);
      expect(nativeAdd(a, 0)).assertEqual(2138);
      expect(sum - b).assertEqual(2138);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2206.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2206.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0154
     * @tc.name      testNativePerturb0154
     * @tc.desc      Native add perturbation 154 over 1874 and -34
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1874;
      const b: number = -34;
      const c: number = 23;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0154', `sum=${sum}`);
      expect(sum).assertEqual(1840);
      expect(nativeAdd(b, a)).assertEqual(1840);
      expect(nativeAdd(sum, 34)).assertEqual(1874);
      expect(nativeAdd(a, 0)).assertEqual(1874);
      expect(sum - b).assertEqual(1874);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1863);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1863);
      {
      const a: number = 2019;
      const b: number = -27;
      const c: number = 34;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0155', `sum=${sum}`);
      expect(sum).assertEqual(1992);
      expect(nativeAdd(b, a)).assertEqual(1992);
      expect(nativeAdd(sum, 27)).assertEqual(2019);
      expect(nativeAdd(a, 0)).assertEqual(2019);
      expect(sum - b).assertEqual(2019);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2026);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2026);
      }
      {
      const a: number = 2061.5;
      const b: number = -20.5;
      const c: number = -8;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0156', `sum=${sum}`);
      expect(sum).assertEqual(2041.0);
      expect(nativeAdd(b, a)).assertEqual(2041.0);
      expect(nativeAdd(sum, 20.5)).assertEqual(2061.5);
      expect(Math.abs(sum - 2041.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2082.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0157
     * @tc.name      testNativePerturb0157
     * @tc.desc      Native add perturbation 157 over 1791 and -13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1791;
      const b: number = -13;
      const c: number = 3;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0157', `sum=${sum}`);
      expect(sum).assertEqual(1778);
      expect(nativeAdd(b, a)).assertEqual(1778);
      expect(nativeAdd(sum, 13)).assertEqual(1791);
      expect(nativeAdd(a, 0)).assertEqual(1791);
      expect(sum - b).assertEqual(1791);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1781);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1781);
      expect(sum % 9).assertEqual(5);
      {
      const a: number = 2145;
      const b: number = -6;
      const c: number = 14;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0158', `sum=${sum}`);
      expect(sum).assertEqual(2139);
      expect(nativeAdd(b, a)).assertEqual(2139);
      expect(nativeAdd(sum, 6)).assertEqual(2145);
      expect(nativeAdd(a, 0)).assertEqual(2145);
      expect(sum - b).assertEqual(2145);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2153);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2153);
      }
      {
      const a: number = 2187;
      const b: number = 1;
      const c: number = 25;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0159', `sum=${sum}`);
      expect(sum).assertEqual(2188);
      expect(nativeAdd(b, a)).assertEqual(2188);
      expect(nativeAdd(sum, -1)).assertEqual(2187);
      expect(nativeAdd(a, 0)).assertEqual(2187);
      expect(sum - b).assertEqual(2187);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2213);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2213);
      expect(sum % 9).assertEqual(1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0160
     * @tc.name      testNativePerturb0160
     * @tc.desc      Native add perturbation 160 over 1911.5 and 7.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1911.5;
      const b: number = 7.5;
      const c: number = -17;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0160', `sum=${sum}`);
      expect(sum).assertEqual(1919.0);
      expect(nativeAdd(b, a)).assertEqual(1919.0);
      expect(nativeAdd(sum, -7.5)).assertEqual(1911.5);
      expect(Math.abs(sum - 1919.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1904.0);
      {
      const a: number = 2271;
      const b: number = 15;
      const c: number = -6;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0161', `sum=${sum}`);
      expect(sum).assertEqual(2286);
      expect(nativeAdd(b, a)).assertEqual(2286);
      expect(nativeAdd(sum, -15)).assertEqual(2271);
      expect(nativeAdd(a, 0)).assertEqual(2271);
      expect(sum - b).assertEqual(2271);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2280);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2280);
      expect(nativeAdd(a, a)).assertEqual(4542);
      expect(nativeAdd(-a, -b)).assertEqual(-2286);
      }
      {
      const a: number = 2110;
      const b: number = 22;
      const c: number = 5.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0162', `sum=${sum}`);
      expect(sum).assertEqual(2132);
      expect(nativeAdd(b, a)).assertEqual(2132);
      expect(nativeAdd(sum, -22)).assertEqual(2110);
      expect(nativeAdd(a, 0)).assertEqual(2110);
      expect(sum - b).assertEqual(2110);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2137.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2137.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0163
     * @tc.name      testNativePerturb0163
     * @tc.desc      Native add perturbation 163 over 1828 and 29
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1828;
      const b: number = 29;
      const c: number = 16;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0163', `sum=${sum}`);
      expect(sum).assertEqual(1857);
      expect(nativeAdd(b, a)).assertEqual(1857);
      expect(nativeAdd(sum, -29)).assertEqual(1828);
      expect(nativeAdd(a, 0)).assertEqual(1828);
      expect(sum - b).assertEqual(1828);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1873);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1873);
      {
      const a: number = 2194.5;
      const b: number = 35.5;
      const c: number = 27;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0164', `sum=${sum}`);
      expect(sum).assertEqual(2230.0);
      expect(nativeAdd(b, a)).assertEqual(2230.0);
      expect(nativeAdd(sum, -35.5)).assertEqual(2194.5);
      expect(Math.abs(sum - 2230.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2159.0);
      }
      {
      const a: number = 2236;
      const b: number = 43;
      const c: number = -15;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0165', `sum=${sum}`);
      expect(sum).assertEqual(2279);
      expect(nativeAdd(b, a)).assertEqual(2279);
      expect(nativeAdd(sum, -43)).assertEqual(2236);
      expect(nativeAdd(a, 0)).assertEqual(2236);
      expect(sum - b).assertEqual(2236);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2264);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2264);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0166
     * @tc.name      testNativePerturb0166
     * @tc.desc      Native add perturbation 166 over 1948 and 50
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1948;
      const b: number = 50;
      const c: number = -4;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0166', `sum=${sum}`);
      expect(sum).assertEqual(1998);
      expect(nativeAdd(b, a)).assertEqual(1998);
      expect(nativeAdd(sum, -50)).assertEqual(1948);
      expect(nativeAdd(a, 0)).assertEqual(1948);
      expect(sum - b).assertEqual(1948);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1994);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1994);
      expect(nativeAdd(a, a)).assertEqual(3896);
      expect(nativeAdd(-a, -b)).assertEqual(-1998);
      {
      const a: number = 2320;
      const b: number = 57;
      const c: number = 7;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0167', `sum=${sum}`);
      expect(sum).assertEqual(2377);
      expect(nativeAdd(b, a)).assertEqual(2377);
      expect(nativeAdd(sum, -57)).assertEqual(2320);
      expect(nativeAdd(a, 0)).assertEqual(2320);
      expect(sum - b).assertEqual(2320);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2384);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2384);
      }
      {
      const a: number = 2362.5;
      const b: number = -33.5;
      const c: number = 18;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0168', `sum=${sum}`);
      expect(sum).assertEqual(2329.0);
      expect(nativeAdd(b, a)).assertEqual(2329.0);
      expect(nativeAdd(sum, 33.5)).assertEqual(2362.5);
      expect(Math.abs(sum - 2329.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2396.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0169
     * @tc.name      testNativePerturb0169
     * @tc.desc      Native add perturbation 169 over 1865 and -26
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1865;
      const b: number = -26;
      const c: number = 29;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0169', `sum=${sum}`);
      expect(sum).assertEqual(1839);
      expect(nativeAdd(b, a)).assertEqual(1839);
      expect(nativeAdd(sum, 26)).assertEqual(1865);
      expect(nativeAdd(a, 0)).assertEqual(1865);
      expect(sum - b).assertEqual(1865);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(1868);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(1868);
      {
      const a: number = 2243;
      const b: number = -19;
      const c: number = -13;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0170', `sum=${sum}`);
      expect(sum).assertEqual(2224);
      expect(nativeAdd(b, a)).assertEqual(2224);
      expect(nativeAdd(sum, 19)).assertEqual(2243);
      expect(nativeAdd(a, 0)).assertEqual(2243);
      expect(sum - b).assertEqual(2243);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2211);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2211);
      }
      {
      const a: number = 2285;
      const b: number = -12;
      const c: number = -1.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0171', `sum=${sum}`);
      expect(sum).assertEqual(2273);
      expect(nativeAdd(b, a)).assertEqual(2273);
      expect(nativeAdd(sum, 12)).assertEqual(2285);
      expect(nativeAdd(a, 0)).assertEqual(2285);
      expect(sum - b).assertEqual(2285);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2271.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2271.5);
      expect(nativeAdd(a, a)).assertEqual(4570);
      expect(nativeAdd(-a, -b)).assertEqual(-2273);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0172
     * @tc.name      testNativePerturb0172
     * @tc.desc      Native add perturbation 172 over 1985.5 and -5.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 1985.5;
      const b: number = -5.5;
      const c: number = 9;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0172', `sum=${sum}`);
      expect(sum).assertEqual(1980.0);
      expect(nativeAdd(b, a)).assertEqual(1980.0);
      expect(nativeAdd(sum, 5.5)).assertEqual(1985.5);
      expect(Math.abs(sum - 1980.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(1991.0);
      {
      const a: number = 2369;
      const b: number = 2;
      const c: number = 20;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0173', `sum=${sum}`);
      expect(sum).assertEqual(2371);
      expect(nativeAdd(b, a)).assertEqual(2371);
      expect(nativeAdd(sum, -2)).assertEqual(2369);
      expect(nativeAdd(a, 0)).assertEqual(2369);
      expect(sum - b).assertEqual(2369);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2391);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2391);
      }
      {
      const a: number = 2411;
      const b: number = 9;
      const c: number = 31;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0174', `sum=${sum}`);
      expect(sum).assertEqual(2420);
      expect(nativeAdd(b, a)).assertEqual(2420);
      expect(nativeAdd(sum, -9)).assertEqual(2411);
      expect(nativeAdd(a, 0)).assertEqual(2411);
      expect(sum - b).assertEqual(2411);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2451);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2451);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0175
     * @tc.name      testNativePerturb0175
     * @tc.desc      Native add perturbation 175 over 2105 and 16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2105;
      const b: number = 16;
      const c: number = -11;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0175', `sum=${sum}`);
      expect(sum).assertEqual(2121);
      expect(nativeAdd(b, a)).assertEqual(2121);
      expect(nativeAdd(sum, -16)).assertEqual(2105);
      expect(nativeAdd(a, 0)).assertEqual(2105);
      expect(sum - b).assertEqual(2105);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2110);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2110);
      {
      const a: number = 2292.5;
      const b: number = 22.5;
      const c: number = 0;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0176', `sum=${sum}`);
      expect(sum).assertEqual(2315.0);
      expect(nativeAdd(b, a)).assertEqual(2315.0);
      expect(nativeAdd(sum, -22.5)).assertEqual(2292.5);
      expect(Math.abs(sum - 2315.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2270.0);
      }
      {
      const a: number = 2334;
      const b: number = 30;
      const c: number = 11;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0177', `sum=${sum}`);
      expect(sum).assertEqual(2364);
      expect(nativeAdd(b, a)).assertEqual(2364);
      expect(nativeAdd(sum, -30)).assertEqual(2334);
      expect(nativeAdd(a, 0)).assertEqual(2334);
      expect(sum - b).assertEqual(2334);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2375);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2375);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0178
     * @tc.name      testNativePerturb0178
     * @tc.desc      Native add perturbation 178 over 2022 and 37
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2022;
      const b: number = 37;
      const c: number = 22;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0178', `sum=${sum}`);
      expect(sum).assertEqual(2059);
      expect(nativeAdd(b, a)).assertEqual(2059);
      expect(nativeAdd(sum, -37)).assertEqual(2022);
      expect(nativeAdd(a, 0)).assertEqual(2022);
      expect(sum - b).assertEqual(2022);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2081);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2081);
      {
      const a: number = 2418;
      const b: number = 44;
      const c: number = 33;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0179', `sum=${sum}`);
      expect(sum).assertEqual(2462);
      expect(nativeAdd(b, a)).assertEqual(2462);
      expect(nativeAdd(sum, -44)).assertEqual(2418);
      expect(nativeAdd(a, 0)).assertEqual(2418);
      expect(sum - b).assertEqual(2418);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2495);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2495);
      }
      {
      const a: number = 2460.5;
      const b: number = 50.5;
      const c: number = -8.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0180', `sum=${sum}`);
      expect(sum).assertEqual(2511.0);
      expect(nativeAdd(b, a)).assertEqual(2511.0);
      expect(nativeAdd(sum, -50.5)).assertEqual(2460.5);
      expect(Math.abs(sum - 2511.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2410.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0181
     * @tc.name      testNativePerturb0181
     * @tc.desc      Native add perturbation 181 over 2142 and 58
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2142;
      const b: number = 58;
      const c: number = 2;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0181', `sum=${sum}`);
      expect(sum).assertEqual(2200);
      expect(nativeAdd(b, a)).assertEqual(2200);
      expect(nativeAdd(sum, -58)).assertEqual(2142);
      expect(nativeAdd(a, 0)).assertEqual(2142);
      expect(sum - b).assertEqual(2142);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2202);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2202);
      expect(sum % 9).assertEqual(4);
      expect(nativeAdd(a, a)).assertEqual(4284);
      expect(nativeAdd(-a, -b)).assertEqual(-2200);
      {
      const a: number = 2544;
      const b: number = -32;
      const c: number = 13;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0182', `sum=${sum}`);
      expect(sum).assertEqual(2512);
      expect(nativeAdd(b, a)).assertEqual(2512);
      expect(nativeAdd(sum, 32)).assertEqual(2544);
      expect(nativeAdd(a, 0)).assertEqual(2544);
      expect(sum - b).assertEqual(2544);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2525);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2525);
      }
      {
      const a: number = 2383;
      const b: number = -25;
      const c: number = 24;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0183', `sum=${sum}`);
      expect(sum).assertEqual(2358);
      expect(nativeAdd(b, a)).assertEqual(2358);
      expect(nativeAdd(sum, 25)).assertEqual(2383);
      expect(nativeAdd(a, 0)).assertEqual(2383);
      expect(sum - b).assertEqual(2383);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2382);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2382);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0184
     * @tc.name      testNativePerturb0184
     * @tc.desc      Native add perturbation 184 over 2059.5 and -18.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2059.5;
      const b: number = -18.5;
      const c: number = 35;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0184', `sum=${sum}`);
      expect(sum).assertEqual(2041.0);
      expect(nativeAdd(b, a)).assertEqual(2041.0);
      expect(nativeAdd(sum, 18.5)).assertEqual(2059.5);
      expect(Math.abs(sum - 2041.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2078.0);
      {
      const a: number = 2467;
      const b: number = -11;
      const c: number = -7;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0185', `sum=${sum}`);
      expect(sum).assertEqual(2456);
      expect(nativeAdd(b, a)).assertEqual(2456);
      expect(nativeAdd(sum, 11)).assertEqual(2467);
      expect(nativeAdd(a, 0)).assertEqual(2467);
      expect(sum - b).assertEqual(2467);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2449);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2449);
      }
      {
      const a: number = 2509;
      const b: number = -4;
      const c: number = 4;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0186', `sum=${sum}`);
      expect(sum).assertEqual(2505);
      expect(nativeAdd(b, a)).assertEqual(2505);
      expect(nativeAdd(sum, 4)).assertEqual(2509);
      expect(nativeAdd(a, 0)).assertEqual(2509);
      expect(sum - b).assertEqual(2509);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2509);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2509);
      expect(nativeAdd(a, a)).assertEqual(5018);
      expect(nativeAdd(-a, -b)).assertEqual(-2505);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0187
     * @tc.name      testNativePerturb0187
     * @tc.desc      Native add perturbation 187 over 2179 and 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2179;
      const b: number = 3;
      const c: number = 15;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0187', `sum=${sum}`);
      expect(sum).assertEqual(2182);
      expect(nativeAdd(b, a)).assertEqual(2182);
      expect(nativeAdd(sum, -3)).assertEqual(2179);
      expect(nativeAdd(a, 0)).assertEqual(2179);
      expect(sum - b).assertEqual(2179);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2197);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2197);
      {
      const a: number = 2593.5;
      const b: number = 9.5;
      const c: number = 26;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0188', `sum=${sum}`);
      expect(sum).assertEqual(2603.0);
      expect(nativeAdd(b, a)).assertEqual(2603.0);
      expect(nativeAdd(sum, -9.5)).assertEqual(2593.5);
      expect(Math.abs(sum - 2603.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2584.0);
      }
      {
      const a: number = 2635;
      const b: number = 17;
      const c: number = -15.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0189', `sum=${sum}`);
      expect(sum).assertEqual(2652);
      expect(nativeAdd(b, a)).assertEqual(2652);
      expect(nativeAdd(sum, -17)).assertEqual(2635);
      expect(nativeAdd(a, 0)).assertEqual(2635);
      expect(sum - b).assertEqual(2635);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2636.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2636.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0190
     * @tc.name      testNativePerturb0190
     * @tc.desc      Native add perturbation 190 over 2096 and 24
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2096;
      const b: number = 24;
      const c: number = -5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0190', `sum=${sum}`);
      expect(sum).assertEqual(2120);
      expect(nativeAdd(b, a)).assertEqual(2120);
      expect(nativeAdd(sum, -24)).assertEqual(2096);
      expect(nativeAdd(a, 0)).assertEqual(2096);
      expect(sum - b).assertEqual(2096);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2115);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2115);
      {
      const a: number = 2516;
      const b: number = 31;
      const c: number = 6;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0191', `sum=${sum}`);
      expect(sum).assertEqual(2547);
      expect(nativeAdd(b, a)).assertEqual(2547);
      expect(nativeAdd(sum, -31)).assertEqual(2516);
      expect(nativeAdd(a, 0)).assertEqual(2516);
      expect(sum - b).assertEqual(2516);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2553);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2553);
      expect(nativeAdd(a, a)).assertEqual(5032);
      expect(nativeAdd(-a, -b)).assertEqual(-2547);
      }
      {
      const a: number = 2558.5;
      const b: number = 37.5;
      const c: number = 17;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0192', `sum=${sum}`);
      expect(sum).assertEqual(2596.0);
      expect(nativeAdd(b, a)).assertEqual(2596.0);
      expect(nativeAdd(sum, -37.5)).assertEqual(2558.5);
      expect(Math.abs(sum - 2596.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2521.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0193
     * @tc.name      testNativePerturb0193
     * @tc.desc      Native add perturbation 193 over 2216 and 45
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2216;
      const b: number = 45;
      const c: number = 28;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0193', `sum=${sum}`);
      expect(sum).assertEqual(2261);
      expect(nativeAdd(b, a)).assertEqual(2261);
      expect(nativeAdd(sum, -45)).assertEqual(2216);
      expect(nativeAdd(a, 0)).assertEqual(2216);
      expect(sum - b).assertEqual(2216);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2289);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2289);
      {
      const a: number = 2642;
      const b: number = 52;
      const c: number = -14;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0194', `sum=${sum}`);
      expect(sum).assertEqual(2694);
      expect(nativeAdd(b, a)).assertEqual(2694);
      expect(nativeAdd(sum, -52)).assertEqual(2642);
      expect(nativeAdd(a, 0)).assertEqual(2642);
      expect(sum - b).assertEqual(2642);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2680);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2680);
      }
      {
      const a: number = 2684;
      const b: number = -38;
      const c: number = -3;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0195', `sum=${sum}`);
      expect(sum).assertEqual(2646);
      expect(nativeAdd(b, a)).assertEqual(2646);
      expect(nativeAdd(sum, 38)).assertEqual(2684);
      expect(nativeAdd(a, 0)).assertEqual(2684);
      expect(sum - b).assertEqual(2684);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2643);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2643);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0196
     * @tc.name      testNativePerturb0196
     * @tc.desc      Native add perturbation 196 over 2336.5 and -31.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2336.5;
      const b: number = -31.5;
      const c: number = 8;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0196', `sum=${sum}`);
      expect(sum).assertEqual(2305.0);
      expect(nativeAdd(b, a)).assertEqual(2305.0);
      expect(nativeAdd(sum, 31.5)).assertEqual(2336.5);
      expect(Math.abs(sum - 2305.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2368.0);
      {
      const a: number = 2565;
      const b: number = -24;
      const c: number = 19;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0197', `sum=${sum}`);
      expect(sum).assertEqual(2541);
      expect(nativeAdd(b, a)).assertEqual(2541);
      expect(nativeAdd(sum, 24)).assertEqual(2565);
      expect(nativeAdd(a, 0)).assertEqual(2565);
      expect(sum - b).assertEqual(2565);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2560);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2560);
      expect(sum % 9).assertEqual(3);
      }
      {
      const a: number = 2607;
      const b: number = -17;
      const c: number = 30.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0198', `sum=${sum}`);
      expect(sum).assertEqual(2590);
      expect(nativeAdd(b, a)).assertEqual(2590);
      expect(nativeAdd(sum, 17)).assertEqual(2607);
      expect(nativeAdd(a, 0)).assertEqual(2607);
      expect(sum - b).assertEqual(2607);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2620.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2620.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0199
     * @tc.name      testNativePerturb0199
     * @tc.desc      Native add perturbation 199 over 2253 and -10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2253;
      const b: number = -10;
      const c: number = -12;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0199', `sum=${sum}`);
      expect(sum).assertEqual(2243);
      expect(nativeAdd(b, a)).assertEqual(2243);
      expect(nativeAdd(sum, 10)).assertEqual(2253);
      expect(nativeAdd(a, 0)).assertEqual(2253);
      expect(sum - b).assertEqual(2253);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2231);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2231);
      {
      const a: number = 2691.5;
      const b: number = -3.5;
      const c: number = -1;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0200', `sum=${sum}`);
      expect(sum).assertEqual(2688.0);
      expect(nativeAdd(b, a)).assertEqual(2688.0);
      expect(nativeAdd(sum, 3.5)).assertEqual(2691.5);
      expect(Math.abs(sum - 2688.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2695.0);
      }
      {
      const a: number = 2733;
      const b: number = 4;
      const c: number = 10;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0201', `sum=${sum}`);
      expect(sum).assertEqual(2737);
      expect(nativeAdd(b, a)).assertEqual(2737);
      expect(nativeAdd(sum, -4)).assertEqual(2733);
      expect(nativeAdd(a, 0)).assertEqual(2733);
      expect(sum - b).assertEqual(2733);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2747);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2747);
      expect(nativeAdd(a, a)).assertEqual(5466);
      expect(nativeAdd(-a, -b)).assertEqual(-2737);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0202
     * @tc.name      testNativePerturb0202
     * @tc.desc      Native add perturbation 202 over 2373 and 11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2373;
      const b: number = 11;
      const c: number = 21;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0202', `sum=${sum}`);
      expect(sum).assertEqual(2384);
      expect(nativeAdd(b, a)).assertEqual(2384);
      expect(nativeAdd(sum, -11)).assertEqual(2373);
      expect(nativeAdd(a, 0)).assertEqual(2373);
      expect(sum - b).assertEqual(2373);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2405);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2405);
      {
      const a: number = 2817;
      const b: number = 18;
      const c: number = 32;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0203', `sum=${sum}`);
      expect(sum).assertEqual(2835);
      expect(nativeAdd(b, a)).assertEqual(2835);
      expect(nativeAdd(sum, -18)).assertEqual(2817);
      expect(nativeAdd(a, 0)).assertEqual(2817);
      expect(sum - b).assertEqual(2817);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2867);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2867);
      expect(sum % 9).assertEqual(0);
      }
      {
      const a: number = 2656.5;
      const b: number = 24.5;
      const c: number = -10;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0204', `sum=${sum}`);
      expect(sum).assertEqual(2681.0);
      expect(nativeAdd(b, a)).assertEqual(2681.0);
      expect(nativeAdd(sum, -24.5)).assertEqual(2656.5);
      expect(Math.abs(sum - 2681.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2632.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0205
     * @tc.name      testNativePerturb0205
     * @tc.desc      Native add perturbation 205 over 2290 and 32
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2290;
      const b: number = 32;
      const c: number = 1;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0205', `sum=${sum}`);
      expect(sum).assertEqual(2322);
      expect(nativeAdd(b, a)).assertEqual(2322);
      expect(nativeAdd(sum, -32)).assertEqual(2290);
      expect(nativeAdd(a, 0)).assertEqual(2290);
      expect(sum - b).assertEqual(2290);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2323);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2323);
      {
      const a: number = 2740;
      const b: number = 39;
      const c: number = 12;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0206', `sum=${sum}`);
      expect(sum).assertEqual(2779);
      expect(nativeAdd(b, a)).assertEqual(2779);
      expect(nativeAdd(sum, -39)).assertEqual(2740);
      expect(nativeAdd(a, 0)).assertEqual(2740);
      expect(sum - b).assertEqual(2740);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2791);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2791);
      expect(nativeAdd(a, a)).assertEqual(5480);
      expect(nativeAdd(-a, -b)).assertEqual(-2779);
      }
      {
      const a: number = 2782;
      const b: number = 46;
      const c: number = 23.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0207', `sum=${sum}`);
      expect(sum).assertEqual(2828);
      expect(nativeAdd(b, a)).assertEqual(2828);
      expect(nativeAdd(sum, -46)).assertEqual(2782);
      expect(nativeAdd(a, 0)).assertEqual(2782);
      expect(sum - b).assertEqual(2782);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2851.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2851.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0208
     * @tc.name      testNativePerturb0208
     * @tc.desc      Native add perturbation 208 over 2410.5 and 52.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2410.5;
      const b: number = 52.5;
      const c: number = 34;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0208', `sum=${sum}`);
      expect(sum).assertEqual(2463.0);
      expect(nativeAdd(b, a)).assertEqual(2463.0);
      expect(nativeAdd(sum, -52.5)).assertEqual(2410.5);
      expect(Math.abs(sum - 2463.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2358.0);
      {
      const a: number = 2866;
      const b: number = -37;
      const c: number = -8;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0209', `sum=${sum}`);
      expect(sum).assertEqual(2829);
      expect(nativeAdd(b, a)).assertEqual(2829);
      expect(nativeAdd(sum, 37)).assertEqual(2866);
      expect(nativeAdd(a, 0)).assertEqual(2866);
      expect(sum - b).assertEqual(2866);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2821);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2821);
      }
      {
      const a: number = 2908;
      const b: number = -30;
      const c: number = 3;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0210', `sum=${sum}`);
      expect(sum).assertEqual(2878);
      expect(nativeAdd(b, a)).assertEqual(2878);
      expect(nativeAdd(sum, 30)).assertEqual(2908);
      expect(nativeAdd(a, 0)).assertEqual(2908);
      expect(sum - b).assertEqual(2908);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2881);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2881);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0211
     * @tc.name      testNativePerturb0211
     * @tc.desc      Native add perturbation 211 over 2327 and -23
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2327;
      const b: number = -23;
      const c: number = 14;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0211', `sum=${sum}`);
      expect(sum).assertEqual(2304);
      expect(nativeAdd(b, a)).assertEqual(2304);
      expect(nativeAdd(sum, 23)).assertEqual(2327);
      expect(nativeAdd(a, 0)).assertEqual(2327);
      expect(sum - b).assertEqual(2327);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2318);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2318);
      expect(nativeAdd(a, a)).assertEqual(4654);
      expect(nativeAdd(-a, -b)).assertEqual(-2304);
      {
      const a: number = 2789.5;
      const b: number = -16.5;
      const c: number = 25;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0212', `sum=${sum}`);
      expect(sum).assertEqual(2773.0);
      expect(nativeAdd(b, a)).assertEqual(2773.0);
      expect(nativeAdd(sum, 16.5)).assertEqual(2789.5);
      expect(Math.abs(sum - 2773.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2806.0);
      }
      {
      const a: number = 2831;
      const b: number = -9;
      const c: number = -17;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0213', `sum=${sum}`);
      expect(sum).assertEqual(2822);
      expect(nativeAdd(b, a)).assertEqual(2822);
      expect(nativeAdd(sum, 9)).assertEqual(2831);
      expect(nativeAdd(a, 0)).assertEqual(2831);
      expect(sum - b).assertEqual(2831);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2805);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2805);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0214
     * @tc.name      testNativePerturb0214
     * @tc.desc      Native add perturbation 214 over 2447 and -2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2447;
      const b: number = -2;
      const c: number = -6;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0214', `sum=${sum}`);
      expect(sum).assertEqual(2445);
      expect(nativeAdd(b, a)).assertEqual(2445);
      expect(nativeAdd(sum, 2)).assertEqual(2447);
      expect(nativeAdd(a, 0)).assertEqual(2447);
      expect(sum - b).assertEqual(2447);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2439);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2439);
      {
      const a: number = 2915;
      const b: number = 5;
      const c: number = 5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0215', `sum=${sum}`);
      expect(sum).assertEqual(2920);
      expect(nativeAdd(b, a)).assertEqual(2920);
      expect(nativeAdd(sum, -5)).assertEqual(2915);
      expect(nativeAdd(a, 0)).assertEqual(2915);
      expect(sum - b).assertEqual(2915);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2925);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2925);
      }
      {
      const a: number = 2957.5;
      const b: number = 11.5;
      const c: number = 16.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0216', `sum=${sum}`);
      expect(sum).assertEqual(2969.0);
      expect(nativeAdd(b, a)).assertEqual(2969.0);
      expect(nativeAdd(sum, -11.5)).assertEqual(2957.5);
      expect(Math.abs(sum - 2969.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2946.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0217
     * @tc.name      testNativePerturb0217
     * @tc.desc      Native add perturbation 217 over 2567 and 19
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2567;
      const b: number = 19;
      const c: number = 27;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0217', `sum=${sum}`);
      expect(sum).assertEqual(2586);
      expect(nativeAdd(b, a)).assertEqual(2586);
      expect(nativeAdd(sum, -19)).assertEqual(2567);
      expect(nativeAdd(a, 0)).assertEqual(2567);
      expect(sum - b).assertEqual(2567);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2613);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2613);
      {
      const a: number = 2838;
      const b: number = 26;
      const c: number = -15;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0218', `sum=${sum}`);
      expect(sum).assertEqual(2864);
      expect(nativeAdd(b, a)).assertEqual(2864);
      expect(nativeAdd(sum, -26)).assertEqual(2838);
      expect(nativeAdd(a, 0)).assertEqual(2838);
      expect(sum - b).assertEqual(2838);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2849);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2849);
      }
      {
      const a: number = 2880;
      const b: number = 33;
      const c: number = -4;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0219', `sum=${sum}`);
      expect(sum).assertEqual(2913);
      expect(nativeAdd(b, a)).assertEqual(2913);
      expect(nativeAdd(sum, -33)).assertEqual(2880);
      expect(nativeAdd(a, 0)).assertEqual(2880);
      expect(sum - b).assertEqual(2880);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2909);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2909);
      expect(sum % 9).assertEqual(6);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0220
     * @tc.name      testNativePerturb0220
     * @tc.desc      Native add perturbation 220 over 2484.5 and 39.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2484.5;
      const b: number = 39.5;
      const c: number = 7;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0220', `sum=${sum}`);
      expect(sum).assertEqual(2524.0);
      expect(nativeAdd(b, a)).assertEqual(2524.0);
      expect(nativeAdd(sum, -39.5)).assertEqual(2484.5);
      expect(Math.abs(sum - 2524.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2445.0);
      {
      const a: number = 2964;
      const b: number = 47;
      const c: number = 18;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0221', `sum=${sum}`);
      expect(sum).assertEqual(3011);
      expect(nativeAdd(b, a)).assertEqual(3011);
      expect(nativeAdd(sum, -47)).assertEqual(2964);
      expect(nativeAdd(a, 0)).assertEqual(2964);
      expect(sum - b).assertEqual(2964);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3029);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3029);
      expect(nativeAdd(a, a)).assertEqual(5928);
      expect(nativeAdd(-a, -b)).assertEqual(-3011);
      }
      {
      const a: number = 3006;
      const b: number = 54;
      const c: number = 29;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0222', `sum=${sum}`);
      expect(sum).assertEqual(3060);
      expect(nativeAdd(b, a)).assertEqual(3060);
      expect(nativeAdd(sum, -54)).assertEqual(3006);
      expect(nativeAdd(a, 0)).assertEqual(3006);
      expect(sum - b).assertEqual(3006);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3089);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3089);
      expect(sum % 9).assertEqual(0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0223
     * @tc.name      testNativePerturb0223
     * @tc.desc      Native add perturbation 223 over 2604 and -36
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2604;
      const b: number = -36;
      const c: number = -13;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0223', `sum=${sum}`);
      expect(sum).assertEqual(2568);
      expect(nativeAdd(b, a)).assertEqual(2568);
      expect(nativeAdd(sum, 36)).assertEqual(2604);
      expect(nativeAdd(a, 0)).assertEqual(2604);
      expect(sum - b).assertEqual(2604);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2555);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2555);
      {
      const a: number = 3090.5;
      const b: number = -29.5;
      const c: number = -2;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0224', `sum=${sum}`);
      expect(sum).assertEqual(3061.0);
      expect(nativeAdd(b, a)).assertEqual(3061.0);
      expect(nativeAdd(sum, 29.5)).assertEqual(3090.5);
      expect(Math.abs(sum - 3061.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(3120.0);
      }
      {
      const a: number = 2929;
      const b: number = -22;
      const c: number = 9.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0225', `sum=${sum}`);
      expect(sum).assertEqual(2907);
      expect(nativeAdd(b, a)).assertEqual(2907);
      expect(nativeAdd(sum, 22)).assertEqual(2929);
      expect(nativeAdd(a, 0)).assertEqual(2929);
      expect(sum - b).assertEqual(2929);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2916.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2916.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0226
     * @tc.name      testNativePerturb0226
     * @tc.desc      Native add perturbation 226 over 2521 and -15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2521;
      const b: number = -15;
      const c: number = 20;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0226', `sum=${sum}`);
      expect(sum).assertEqual(2506);
      expect(nativeAdd(b, a)).assertEqual(2506);
      expect(nativeAdd(sum, 15)).assertEqual(2521);
      expect(nativeAdd(a, 0)).assertEqual(2521);
      expect(sum - b).assertEqual(2521);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2526);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2526);
      expect(nativeAdd(a, a)).assertEqual(5042);
      expect(nativeAdd(-a, -b)).assertEqual(-2506);
      {
      const a: number = 3013;
      const b: number = -8;
      const c: number = 31;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0227', `sum=${sum}`);
      expect(sum).assertEqual(3005);
      expect(nativeAdd(b, a)).assertEqual(3005);
      expect(nativeAdd(sum, 8)).assertEqual(3013);
      expect(nativeAdd(a, 0)).assertEqual(3013);
      expect(sum - b).assertEqual(3013);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3036);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3036);
      }
      {
      const a: number = 3055.5;
      const b: number = -1.5;
      const c: number = -11;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0228', `sum=${sum}`);
      expect(sum).assertEqual(3054.0);
      expect(nativeAdd(b, a)).assertEqual(3054.0);
      expect(nativeAdd(sum, 1.5)).assertEqual(3055.5);
      expect(Math.abs(sum - 3054.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(3057.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0229
     * @tc.name      testNativePerturb0229
     * @tc.desc      Native add perturbation 229 over 2641 and 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2641;
      const b: number = 6;
      const c: number = 0;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0229', `sum=${sum}`);
      expect(sum).assertEqual(2647);
      expect(nativeAdd(b, a)).assertEqual(2647);
      expect(nativeAdd(sum, -6)).assertEqual(2641);
      expect(nativeAdd(a, 0)).assertEqual(2641);
      expect(sum - b).assertEqual(2641);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2647);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2647);
      {
      const a: number = 3139;
      const b: number = 13;
      const c: number = 11;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0230', `sum=${sum}`);
      expect(sum).assertEqual(3152);
      expect(nativeAdd(b, a)).assertEqual(3152);
      expect(nativeAdd(sum, -13)).assertEqual(3139);
      expect(nativeAdd(a, 0)).assertEqual(3139);
      expect(sum - b).assertEqual(3139);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3163);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3163);
      }
      {
      const a: number = 3181;
      const b: number = 20;
      const c: number = 22;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0231', `sum=${sum}`);
      expect(sum).assertEqual(3201);
      expect(nativeAdd(b, a)).assertEqual(3201);
      expect(nativeAdd(sum, -20)).assertEqual(3181);
      expect(nativeAdd(a, 0)).assertEqual(3181);
      expect(sum - b).assertEqual(3181);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3223);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3223);
      expect(nativeAdd(a, a)).assertEqual(6362);
      expect(nativeAdd(-a, -b)).assertEqual(-3201);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0232
     * @tc.name      testNativePerturb0232
     * @tc.desc      Native add perturbation 232 over 2558.5 and 26.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2558.5;
      const b: number = 26.5;
      const c: number = 33;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0232', `sum=${sum}`);
      expect(sum).assertEqual(2585.0);
      expect(nativeAdd(b, a)).assertEqual(2585.0);
      expect(nativeAdd(sum, -26.5)).assertEqual(2558.5);
      expect(Math.abs(sum - 2585.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2532.0);
      {
      const a: number = 3062;
      const b: number = 34;
      const c: number = -9;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0233', `sum=${sum}`);
      expect(sum).assertEqual(3096);
      expect(nativeAdd(b, a)).assertEqual(3096);
      expect(nativeAdd(sum, -34)).assertEqual(3062);
      expect(nativeAdd(a, 0)).assertEqual(3062);
      expect(sum - b).assertEqual(3062);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3087);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3087);
      }
      {
      const a: number = 3104;
      const b: number = 41;
      const c: number = 2.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0234', `sum=${sum}`);
      expect(sum).assertEqual(3145);
      expect(nativeAdd(b, a)).assertEqual(3145);
      expect(nativeAdd(sum, -41)).assertEqual(3104);
      expect(nativeAdd(a, 0)).assertEqual(3104);
      expect(sum - b).assertEqual(3104);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3147.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3147.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0235
     * @tc.name      testNativePerturb0235
     * @tc.desc      Native add perturbation 235 over 2678 and 48
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2678;
      const b: number = 48;
      const c: number = 13;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0235', `sum=${sum}`);
      expect(sum).assertEqual(2726);
      expect(nativeAdd(b, a)).assertEqual(2726);
      expect(nativeAdd(sum, -48)).assertEqual(2678);
      expect(nativeAdd(a, 0)).assertEqual(2678);
      expect(sum - b).assertEqual(2678);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2739);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2739);
      {
      const a: number = 3188.5;
      const b: number = 54.5;
      const c: number = 24;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0236', `sum=${sum}`);
      expect(sum).assertEqual(3243.0);
      expect(nativeAdd(b, a)).assertEqual(3243.0);
      expect(nativeAdd(sum, -54.5)).assertEqual(3188.5);
      expect(Math.abs(sum - 3243.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(3134.0);
      }
      {
      const a: number = 3230;
      const b: number = -35;
      const c: number = 35;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0237', `sum=${sum}`);
      expect(sum).assertEqual(3195);
      expect(nativeAdd(b, a)).assertEqual(3195);
      expect(nativeAdd(sum, 35)).assertEqual(3230);
      expect(nativeAdd(a, 0)).assertEqual(3230);
      expect(sum - b).assertEqual(3230);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3230);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3230);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0238
     * @tc.name      testNativePerturb0238
     * @tc.desc      Native add perturbation 238 over 2798 and -28
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2798;
      const b: number = -28;
      const c: number = -7;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0238', `sum=${sum}`);
      expect(sum).assertEqual(2770);
      expect(nativeAdd(b, a)).assertEqual(2770);
      expect(nativeAdd(sum, 28)).assertEqual(2798);
      expect(nativeAdd(a, 0)).assertEqual(2798);
      expect(sum - b).assertEqual(2798);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2763);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2763);
      {
      const a: number = 3111;
      const b: number = -21;
      const c: number = 4;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0239', `sum=${sum}`);
      expect(sum).assertEqual(3090);
      expect(nativeAdd(b, a)).assertEqual(3090);
      expect(nativeAdd(sum, 21)).assertEqual(3111);
      expect(nativeAdd(a, 0)).assertEqual(3111);
      expect(sum - b).assertEqual(3111);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3094);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3094);
      }
      {
      const a: number = 3153.5;
      const b: number = -14.5;
      const c: number = 15;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0240', `sum=${sum}`);
      expect(sum).assertEqual(3139.0);
      expect(nativeAdd(b, a)).assertEqual(3139.0);
      expect(nativeAdd(sum, 14.5)).assertEqual(3153.5);
      expect(Math.abs(sum - 3139.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(3168.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0241
     * @tc.name      testNativePerturb0241
     * @tc.desc      Native add perturbation 241 over 2715 and -7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2715;
      const b: number = -7;
      const c: number = 26;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0241', `sum=${sum}`);
      expect(sum).assertEqual(2708);
      expect(nativeAdd(b, a)).assertEqual(2708);
      expect(nativeAdd(sum, 7)).assertEqual(2715);
      expect(nativeAdd(a, 0)).assertEqual(2715);
      expect(sum - b).assertEqual(2715);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2734);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2734);
      expect(nativeAdd(a, a)).assertEqual(5430);
      expect(nativeAdd(-a, -b)).assertEqual(-2708);
      {
      const a: number = 3237;
      const b: number = 0;
      const c: number = -16;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0242', `sum=${sum}`);
      expect(sum).assertEqual(3237);
      expect(nativeAdd(b, a)).assertEqual(3237);
      expect(nativeAdd(sum, 0)).assertEqual(3237);
      expect(nativeAdd(a, 0)).assertEqual(3237);
      expect(sum - b).assertEqual(3237);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3221);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3221);
      }
      {
      const a: number = 3279;
      const b: number = 7;
      const c: number = -4.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0243', `sum=${sum}`);
      expect(sum).assertEqual(3286);
      expect(nativeAdd(b, a)).assertEqual(3286);
      expect(nativeAdd(sum, -7)).assertEqual(3279);
      expect(nativeAdd(a, 0)).assertEqual(3279);
      expect(sum - b).assertEqual(3279);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3281.5);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3281.5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0244
     * @tc.name      testNativePerturb0244
     * @tc.desc      Native add perturbation 244 over 2835.5 and 13.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2835.5;
      const b: number = 13.5;
      const c: number = 6;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0244', `sum=${sum}`);
      expect(sum).assertEqual(2849.0);
      expect(nativeAdd(b, a)).assertEqual(2849.0);
      expect(nativeAdd(sum, -13.5)).assertEqual(2835.5);
      expect(Math.abs(sum - 2849.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2822.0);
      {
      const a: number = 3363;
      const b: number = 21;
      const c: number = 17;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0245', `sum=${sum}`);
      expect(sum).assertEqual(3384);
      expect(nativeAdd(b, a)).assertEqual(3384);
      expect(nativeAdd(sum, -21)).assertEqual(3363);
      expect(nativeAdd(a, 0)).assertEqual(3363);
      expect(sum - b).assertEqual(3363);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3401);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3401);
      }
      {
      const a: number = 3202;
      const b: number = 28;
      const c: number = 28;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0246', `sum=${sum}`);
      expect(sum).assertEqual(3230);
      expect(nativeAdd(b, a)).assertEqual(3230);
      expect(nativeAdd(sum, -28)).assertEqual(3202);
      expect(nativeAdd(a, 0)).assertEqual(3202);
      expect(sum - b).assertEqual(3202);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3258);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3258);
      expect(nativeAdd(a, a)).assertEqual(6404);
      expect(nativeAdd(-a, -b)).assertEqual(-3230);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0247
     * @tc.name      testNativePerturb0247
     * @tc.desc      Native add perturbation 247 over 2752 and 35
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2752;
      const b: number = 35;
      const c: number = -14;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0247', `sum=${sum}`);
      expect(sum).assertEqual(2787);
      expect(nativeAdd(b, a)).assertEqual(2787);
      expect(nativeAdd(sum, -35)).assertEqual(2752);
      expect(nativeAdd(a, 0)).assertEqual(2752);
      expect(sum - b).assertEqual(2752);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2773);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2773);
      {
      const a: number = 3286.5;
      const b: number = 41.5;
      const c: number = -3;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0248', `sum=${sum}`);
      expect(sum).assertEqual(3328.0);
      expect(nativeAdd(b, a)).assertEqual(3328.0);
      expect(nativeAdd(sum, -41.5)).assertEqual(3286.5);
      expect(Math.abs(sum - 3328.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(3245.0);
      }
      {
      const a: number = 3328;
      const b: number = 49;
      const c: number = 8;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0249', `sum=${sum}`);
      expect(sum).assertEqual(3377);
      expect(nativeAdd(b, a)).assertEqual(3377);
      expect(nativeAdd(sum, -49)).assertEqual(3328);
      expect(nativeAdd(a, 0)).assertEqual(3328);
      expect(sum - b).assertEqual(3328);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3385);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3385);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0250
     * @tc.name      testNativePerturb0250
     * @tc.desc      Native add perturbation 250 over 2872 and 56
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2872;
      const b: number = 56;
      const c: number = 19;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0250', `sum=${sum}`);
      expect(sum).assertEqual(2928);
      expect(nativeAdd(b, a)).assertEqual(2928);
      expect(nativeAdd(sum, -56)).assertEqual(2872);
      expect(nativeAdd(a, 0)).assertEqual(2872);
      expect(sum - b).assertEqual(2872);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2947);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2947);
      {
      const a: number = 3412;
      const b: number = -34;
      const c: number = 30;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0251', `sum=${sum}`);
      expect(sum).assertEqual(3378);
      expect(nativeAdd(b, a)).assertEqual(3378);
      expect(nativeAdd(sum, 34)).assertEqual(3412);
      expect(nativeAdd(a, 0)).assertEqual(3412);
      expect(sum - b).assertEqual(3412);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3408);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3408);
      expect(nativeAdd(a, a)).assertEqual(6824);
      expect(nativeAdd(-a, -b)).assertEqual(-3378);
      }
      {
      const a: number = 3454.5;
      const b: number = -27.5;
      const c: number = -11.5;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0252', `sum=${sum}`);
      expect(sum).assertEqual(3427.0);
      expect(nativeAdd(b, a)).assertEqual(3427.0);
      expect(nativeAdd(sum, 27.5)).assertEqual(3454.5);
      expect(Math.abs(sum - 3427.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(3482.0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0253
     * @tc.name      testNativePerturb0253
     * @tc.desc      Native add perturbation 253 over 2789 and -20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2789;
      const b: number = -20;
      const c: number = -1;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0253', `sum=${sum}`);
      expect(sum).assertEqual(2769);
      expect(nativeAdd(b, a)).assertEqual(2769);
      expect(nativeAdd(sum, 20)).assertEqual(2789);
      expect(nativeAdd(a, 0)).assertEqual(2789);
      expect(sum - b).assertEqual(2789);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(2768);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(2768);
      {
      const a: number = 3335;
      const b: number = -13;
      const c: number = 10;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0254', `sum=${sum}`);
      expect(sum).assertEqual(3322);
      expect(nativeAdd(b, a)).assertEqual(3322);
      expect(nativeAdd(sum, 13)).assertEqual(3335);
      expect(nativeAdd(a, 0)).assertEqual(3335);
      expect(sum - b).assertEqual(3335);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3332);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3332);
      }
      {
      const a: number = 3377;
      const b: number = -6;
      const c: number = 21;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0255', `sum=${sum}`);
      expect(sum).assertEqual(3371);
      expect(nativeAdd(b, a)).assertEqual(3371);
      expect(nativeAdd(sum, 6)).assertEqual(3377);
      expect(nativeAdd(a, 0)).assertEqual(3377);
      expect(sum - b).assertEqual(3377);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3392);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3392);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0256
     * @tc.name      testNativePerturb0256
     * @tc.desc      Native add perturbation 256 over 2909.5 and 0.5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 2909.5;
      const b: number = 0.5;
      const c: number = 32;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0256', `sum=${sum}`);
      expect(sum).assertEqual(2910.0);
      expect(nativeAdd(b, a)).assertEqual(2910.0);
      expect(nativeAdd(sum, -0.5)).assertEqual(2909.5);
      expect(Math.abs(sum - 2910.0) < 1e-9).assertTrue();
      expect(nativeAdd(a, -b)).assertEqual(2909.0);
      {
      const a: number = 3461;
      const b: number = 8;
      const c: number = -10;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0257', `sum=${sum}`);
      expect(sum).assertEqual(3469);
      expect(nativeAdd(b, a)).assertEqual(3469);
      expect(nativeAdd(sum, -8)).assertEqual(3461);
      expect(nativeAdd(a, 0)).assertEqual(3461);
      expect(sum - b).assertEqual(3461);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3459);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3459);
      }
      {
      const a: number = 3503;
      const b: number = 15;
      const c: number = 1;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0258', `sum=${sum}`);
      expect(sum).assertEqual(3518);
      expect(nativeAdd(b, a)).assertEqual(3518);
      expect(nativeAdd(sum, -15)).assertEqual(3503);
      expect(nativeAdd(a, 0)).assertEqual(3503);
      expect(sum - b).assertEqual(3503);
      expect(nativeAdd(nativeAdd(a, b), c)).assertEqual(3519);
      expect(nativeAdd(a, nativeAdd(b, c))).assertEqual(3519);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_PERTURB_0259
     * @tc.name      testNativePerturb0259
     * @tc.desc      Native add perturbation 259 over 3029 and 22
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativePerturb0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const a: number = 3029;
      const b: number = 22;
      const c: number = 12;
      const sum: number = nativeAdd(a, b);
      logCase('testNativePerturb0259', `sum=${sum}`);
      expect(sum).assertEqual(3051);
      expect(nativeAdd(b, a)).assertEqual(3051);
      expect(nativeAdd(sum, -22)).assertEqual(3029);
      expect(nativeAdd(a, 0)).assertEqual(3029);
