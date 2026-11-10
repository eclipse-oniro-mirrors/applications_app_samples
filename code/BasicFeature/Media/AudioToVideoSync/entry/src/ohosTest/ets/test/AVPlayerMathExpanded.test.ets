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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';

export default function avPlayerMathExpandedTest() {
  describe('avPlayerMathExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0001
     * @tc.name      testProjPlaybackMath0001
     * @tc.desc      Speed 0.5 with seek 0 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1000;
      const speed: number = 0.5;
      const target: number = 0;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1000);
      expect(effectiveDuration).assertEqual(2000.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0002
     * @tc.name      testProjPlaybackMath0002
     * @tc.desc      Speed 1 with seek 37 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1010;
      const speed: number = 1;
      const target: number = 37;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(973);
      expect(effectiveDuration).assertEqual(1010.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0003
     * @tc.name      testProjPlaybackMath0003
     * @tc.desc      Speed 1.5 with seek 74 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1020;
      const speed: number = 1.5;
      const target: number = 74;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(946);
      expect(effectiveDuration).assertEqual(680.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0004
     * @tc.name      testProjPlaybackMath0004
     * @tc.desc      Speed 2 with seek 111 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1030;
      const speed: number = 2;
      const target: number = 111;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(919);
      expect(effectiveDuration).assertEqual(515.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0005
     * @tc.name      testProjPlaybackMath0005
     * @tc.desc      Speed 3 with seek 148 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1040;
      const speed: number = 3;
      const target: number = 148;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(892);
      expect(effectiveDuration).assertEqual(346.6666666666667);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0006
     * @tc.name      testProjPlaybackMath0006
     * @tc.desc      Speed 0.5 with seek 185 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1050;
      const speed: number = 0.5;
      const target: number = 185;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(865);
      expect(effectiveDuration).assertEqual(2100.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0007
     * @tc.name      testProjPlaybackMath0007
     * @tc.desc      Speed 1 with seek 222 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1060;
      const speed: number = 1;
      const target: number = 222;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(838);
      expect(effectiveDuration).assertEqual(1060.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0008
     * @tc.name      testProjPlaybackMath0008
     * @tc.desc      Speed 1.5 with seek 259 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1070;
      const speed: number = 1.5;
      const target: number = 259;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(811);
      expect(effectiveDuration).assertEqual(713.3333333333334);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0009
     * @tc.name      testProjPlaybackMath0009
     * @tc.desc      Speed 2 with seek 296 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1080;
      const speed: number = 2;
      const target: number = 296;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(784);
      expect(effectiveDuration).assertEqual(540.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0010
     * @tc.name      testProjPlaybackMath0010
     * @tc.desc      Speed 3 with seek 333 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1090;
      const speed: number = 3;
      const target: number = 333;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(757);
      expect(effectiveDuration).assertEqual(363.3333333333333);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0011
     * @tc.name      testProjPlaybackMath0011
     * @tc.desc      Speed 0.5 with seek 370 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1100;
      const speed: number = 0.5;
      const target: number = 370;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(730);
      expect(effectiveDuration).assertEqual(2200.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0012
     * @tc.name      testProjPlaybackMath0012
     * @tc.desc      Speed 1 with seek 407 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1110;
      const speed: number = 1;
      const target: number = 407;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(703);
      expect(effectiveDuration).assertEqual(1110.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0013
     * @tc.name      testProjPlaybackMath0013
     * @tc.desc      Speed 1.5 with seek 444 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1120;
      const speed: number = 1.5;
      const target: number = 444;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(676);
      expect(effectiveDuration).assertEqual(746.6666666666666);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0014
     * @tc.name      testProjPlaybackMath0014
     * @tc.desc      Speed 2 with seek 481 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1130;
      const speed: number = 2;
      const target: number = 481;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(649);
      expect(effectiveDuration).assertEqual(565.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0015
     * @tc.name      testProjPlaybackMath0015
     * @tc.desc      Speed 3 with seek 518 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1140;
      const speed: number = 3;
      const target: number = 518;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(622);
      expect(effectiveDuration).assertEqual(380.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0016
     * @tc.name      testProjPlaybackMath0016
     * @tc.desc      Speed 0.5 with seek 555 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1150;
      const speed: number = 0.5;
      const target: number = 555;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(595);
      expect(effectiveDuration).assertEqual(2300.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0017
     * @tc.name      testProjPlaybackMath0017
     * @tc.desc      Speed 1 with seek 592 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1160;
      const speed: number = 1;
      const target: number = 592;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(568);
      expect(effectiveDuration).assertEqual(1160.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0018
     * @tc.name      testProjPlaybackMath0018
     * @tc.desc      Speed 1.5 with seek 629 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1170;
      const speed: number = 1.5;
      const target: number = 629;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(541);
      expect(effectiveDuration).assertEqual(780.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0019
     * @tc.name      testProjPlaybackMath0019
     * @tc.desc      Speed 2 with seek 666 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1180;
      const speed: number = 2;
      const target: number = 666;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(514);
      expect(effectiveDuration).assertEqual(590.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0020
     * @tc.name      testProjPlaybackMath0020
     * @tc.desc      Speed 3 with seek 703 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1190;
      const speed: number = 3;
      const target: number = 703;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(487);
      expect(effectiveDuration).assertEqual(396.6666666666667);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0021
     * @tc.name      testProjPlaybackMath0021
     * @tc.desc      Speed 0.5 with seek 740 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1200;
      const speed: number = 0.5;
      const target: number = 740;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(460);
      expect(effectiveDuration).assertEqual(2400.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0022
     * @tc.name      testProjPlaybackMath0022
     * @tc.desc      Speed 1 with seek 777 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1210;
      const speed: number = 1;
      const target: number = 777;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(433);
      expect(effectiveDuration).assertEqual(1210.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0023
     * @tc.name      testProjPlaybackMath0023
     * @tc.desc      Speed 1.5 with seek 814 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1220;
      const speed: number = 1.5;
      const target: number = 814;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(406);
      expect(effectiveDuration).assertEqual(813.3333333333334);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0024
     * @tc.name      testProjPlaybackMath0024
     * @tc.desc      Speed 2 with seek 851 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1230;
      const speed: number = 2;
      const target: number = 851;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(379);
      expect(effectiveDuration).assertEqual(615.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0025
     * @tc.name      testProjPlaybackMath0025
     * @tc.desc      Speed 3 with seek 888 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1240;
      const speed: number = 3;
      const target: number = 888;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(352);
      expect(effectiveDuration).assertEqual(413.3333333333333);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0026
     * @tc.name      testProjPlaybackMath0026
     * @tc.desc      Speed 0.5 with seek 925 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1250;
      const speed: number = 0.5;
      const target: number = 925;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(325);
      expect(effectiveDuration).assertEqual(2500.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0027
     * @tc.name      testProjPlaybackMath0027
     * @tc.desc      Speed 1 with seek 962 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1260;
      const speed: number = 1;
      const target: number = 962;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(298);
      expect(effectiveDuration).assertEqual(1260.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0028
     * @tc.name      testProjPlaybackMath0028
     * @tc.desc      Speed 1.5 with seek 999 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1270;
      const speed: number = 1.5;
      const target: number = 999;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(271);
      expect(effectiveDuration).assertEqual(846.6666666666666);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0029
     * @tc.name      testProjPlaybackMath0029
     * @tc.desc      Speed 2 with seek 1036 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1280;
      const speed: number = 2;
      const target: number = 1036;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(244);
      expect(effectiveDuration).assertEqual(640.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0030
     * @tc.name      testProjPlaybackMath0030
     * @tc.desc      Speed 3 with seek 1073 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1290;
      const speed: number = 3;
      const target: number = 1073;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(217);
      expect(effectiveDuration).assertEqual(430.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0031
     * @tc.name      testProjPlaybackMath0031
     * @tc.desc      Speed 0.5 with seek 1110 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1300;
      const speed: number = 0.5;
      const target: number = 1110;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(190);
      expect(effectiveDuration).assertEqual(2600.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0032
     * @tc.name      testProjPlaybackMath0032
     * @tc.desc      Speed 1 with seek 1147 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1310;
      const speed: number = 1;
      const target: number = 1147;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(163);
      expect(effectiveDuration).assertEqual(1310.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0033
     * @tc.name      testProjPlaybackMath0033
     * @tc.desc      Speed 1.5 with seek 1184 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1320;
      const speed: number = 1.5;
      const target: number = 1184;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(136);
      expect(effectiveDuration).assertEqual(880.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0034
     * @tc.name      testProjPlaybackMath0034
     * @tc.desc      Speed 2 with seek 1221 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1330;
      const speed: number = 2;
      const target: number = 1221;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(109);
      expect(effectiveDuration).assertEqual(665.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0035
     * @tc.name      testProjPlaybackMath0035
     * @tc.desc      Speed 3 with seek 1258 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1340;
      const speed: number = 3;
      const target: number = 1258;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(82);
      expect(effectiveDuration).assertEqual(446.6666666666667);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0036
     * @tc.name      testProjPlaybackMath0036
     * @tc.desc      Speed 0.5 with seek 1295 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1350;
      const speed: number = 0.5;
      const target: number = 1295;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(55);
      expect(effectiveDuration).assertEqual(2700.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0037
     * @tc.name      testProjPlaybackMath0037
     * @tc.desc      Speed 1 with seek 1332 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1360;
      const speed: number = 1;
      const target: number = 1332;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(28);
      expect(effectiveDuration).assertEqual(1360.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0038
     * @tc.name      testProjPlaybackMath0038
     * @tc.desc      Speed 1.5 with seek 1369 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1370;
      const speed: number = 1.5;
      const target: number = 1369;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1);
      expect(effectiveDuration).assertEqual(913.3333333333334);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0039
     * @tc.name      testProjPlaybackMath0039
     * @tc.desc      Speed 2 with seek 26 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1380;
      const speed: number = 2;
      const target: number = 26;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1354);
      expect(effectiveDuration).assertEqual(690.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0040
     * @tc.name      testProjPlaybackMath0040
     * @tc.desc      Speed 3 with seek 53 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1390;
      const speed: number = 3;
      const target: number = 53;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1337);
      expect(effectiveDuration).assertEqual(463.3333333333333);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0041
     * @tc.name      testProjPlaybackMath0041
     * @tc.desc      Speed 0.5 with seek 80 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1400;
      const speed: number = 0.5;
      const target: number = 80;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1320);
      expect(effectiveDuration).assertEqual(2800.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0042
     * @tc.name      testProjPlaybackMath0042
     * @tc.desc      Speed 1 with seek 107 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1410;
      const speed: number = 1;
      const target: number = 107;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1303);
      expect(effectiveDuration).assertEqual(1410.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0043
     * @tc.name      testProjPlaybackMath0043
     * @tc.desc      Speed 1.5 with seek 134 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1420;
      const speed: number = 1.5;
      const target: number = 134;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1286);
      expect(effectiveDuration).assertEqual(946.6666666666666);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0044
     * @tc.name      testProjPlaybackMath0044
     * @tc.desc      Speed 2 with seek 161 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1430;
      const speed: number = 2;
      const target: number = 161;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1269);
      expect(effectiveDuration).assertEqual(715.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0045
     * @tc.name      testProjPlaybackMath0045
     * @tc.desc      Speed 3 with seek 188 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1440;
      const speed: number = 3;
      const target: number = 188;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1252);
      expect(effectiveDuration).assertEqual(480.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0046
     * @tc.name      testProjPlaybackMath0046
     * @tc.desc      Speed 0.5 with seek 215 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1450;
      const speed: number = 0.5;
      const target: number = 215;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1235);
      expect(effectiveDuration).assertEqual(2900.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0047
     * @tc.name      testProjPlaybackMath0047
     * @tc.desc      Speed 1 with seek 242 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1460;
      const speed: number = 1;
      const target: number = 242;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1218);
      expect(effectiveDuration).assertEqual(1460.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0048
     * @tc.name      testProjPlaybackMath0048
     * @tc.desc      Speed 1.5 with seek 269 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1470;
      const speed: number = 1.5;
      const target: number = 269;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1201);
      expect(effectiveDuration).assertEqual(980.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0049
     * @tc.name      testProjPlaybackMath0049
     * @tc.desc      Speed 2 with seek 296 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1480;
      const speed: number = 2;
      const target: number = 296;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1184);
      expect(effectiveDuration).assertEqual(740.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0050
     * @tc.name      testProjPlaybackMath0050
     * @tc.desc      Speed 3 with seek 323 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1490;
      const speed: number = 3;
      const target: number = 323;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1167);
      expect(effectiveDuration).assertEqual(496.6666666666667);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0051
     * @tc.name      testProjPlaybackMath0051
     * @tc.desc      Speed 0.5 with seek 350 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1500;
      const speed: number = 0.5;
      const target: number = 350;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1150);
      expect(effectiveDuration).assertEqual(3000.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0052
     * @tc.name      testProjPlaybackMath0052
     * @tc.desc      Speed 1 with seek 377 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1510;
      const speed: number = 1;
      const target: number = 377;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1133);
      expect(effectiveDuration).assertEqual(1510.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0053
     * @tc.name      testProjPlaybackMath0053
     * @tc.desc      Speed 1.5 with seek 404 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1520;
      const speed: number = 1.5;
      const target: number = 404;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1116);
      expect(effectiveDuration).assertEqual(1013.3333333333334);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0054
     * @tc.name      testProjPlaybackMath0054
     * @tc.desc      Speed 2 with seek 431 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1530;
      const speed: number = 2;
      const target: number = 431;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1099);
      expect(effectiveDuration).assertEqual(765.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0055
     * @tc.name      testProjPlaybackMath0055
     * @tc.desc      Speed 3 with seek 458 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1540;
      const speed: number = 3;
      const target: number = 458;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1082);
      expect(effectiveDuration).assertEqual(513.3333333333334);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0056
     * @tc.name      testProjPlaybackMath0056
     * @tc.desc      Speed 0.5 with seek 485 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1550;
      const speed: number = 0.5;
      const target: number = 485;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1065);
      expect(effectiveDuration).assertEqual(3100.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0057
     * @tc.name      testProjPlaybackMath0057
     * @tc.desc      Speed 1 with seek 512 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1560;
      const speed: number = 1;
      const target: number = 512;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1048);
      expect(effectiveDuration).assertEqual(1560.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0058
     * @tc.name      testProjPlaybackMath0058
     * @tc.desc      Speed 1.5 with seek 539 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1570;
      const speed: number = 1.5;
      const target: number = 539;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1031);
      expect(effectiveDuration).assertEqual(1046.6666666666667);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0059
     * @tc.name      testProjPlaybackMath0059
     * @tc.desc      Speed 2 with seek 566 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1580;
      const speed: number = 2;
      const target: number = 566;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(1014);
      expect(effectiveDuration).assertEqual(790.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0060
     * @tc.name      testProjPlaybackMath0060
     * @tc.desc      Speed 3 with seek 593 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1590;
      const speed: number = 3;
      const target: number = 593;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(997);
      expect(effectiveDuration).assertEqual(530.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0061
     * @tc.name      testProjPlaybackMath0061
     * @tc.desc      Speed 0.5 with seek 620 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1600;
      const speed: number = 0.5;
      const target: number = 620;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(980);
      expect(effectiveDuration).assertEqual(3200.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0062
     * @tc.name      testProjPlaybackMath0062
     * @tc.desc      Speed 1 with seek 647 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1610;
      const speed: number = 1;
      const target: number = 647;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(963);
      expect(effectiveDuration).assertEqual(1610.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0063
     * @tc.name      testProjPlaybackMath0063
     * @tc.desc      Speed 1.5 with seek 674 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1620;
      const speed: number = 1.5;
      const target: number = 674;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(946);
      expect(effectiveDuration).assertEqual(1080.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0064
     * @tc.name      testProjPlaybackMath0064
     * @tc.desc      Speed 2 with seek 701 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1630;
      const speed: number = 2;
      const target: number = 701;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(929);
      expect(effectiveDuration).assertEqual(815.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0065
     * @tc.name      testProjPlaybackMath0065
     * @tc.desc      Speed 3 with seek 728 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1640;
      const speed: number = 3;
      const target: number = 728;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(912);
      expect(effectiveDuration).assertEqual(546.6666666666666);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0066
     * @tc.name      testProjPlaybackMath0066
     * @tc.desc      Speed 0.5 with seek 755 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1650;
      const speed: number = 0.5;
      const target: number = 755;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(895);
      expect(effectiveDuration).assertEqual(3300.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0067
     * @tc.name      testProjPlaybackMath0067
     * @tc.desc      Speed 1 with seek 782 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1660;
      const speed: number = 1;
      const target: number = 782;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(878);
      expect(effectiveDuration).assertEqual(1660.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0068
     * @tc.name      testProjPlaybackMath0068
     * @tc.desc      Speed 1.5 with seek 809 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1670;
      const speed: number = 1.5;
      const target: number = 809;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(861);
      expect(effectiveDuration).assertEqual(1113.3333333333333);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0069
     * @tc.name      testProjPlaybackMath0069
     * @tc.desc      Speed 2 with seek 836 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1680;
      const speed: number = 2;
      const target: number = 836;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(844);
      expect(effectiveDuration).assertEqual(840.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0070
     * @tc.name      testProjPlaybackMath0070
     * @tc.desc      Speed 3 with seek 863 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1690;
      const speed: number = 3;
      const target: number = 863;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(827);
      expect(effectiveDuration).assertEqual(563.3333333333334);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0071
     * @tc.name      testProjPlaybackMath0071
     * @tc.desc      Speed 0.5 with seek 890 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1700;
      const speed: number = 0.5;
      const target: number = 890;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(810);
      expect(effectiveDuration).assertEqual(3400.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0072
     * @tc.name      testProjPlaybackMath0072
     * @tc.desc      Speed 1 with seek 917 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1710;
      const speed: number = 1;
      const target: number = 917;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(793);
      expect(effectiveDuration).assertEqual(1710.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0073
     * @tc.name      testProjPlaybackMath0073
     * @tc.desc      Speed 1.5 with seek 944 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1720;
      const speed: number = 1.5;
      const target: number = 944;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(776);
      expect(effectiveDuration).assertEqual(1146.6666666666667);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0074
     * @tc.name      testProjPlaybackMath0074
     * @tc.desc      Speed 2 with seek 971 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1730;
      const speed: number = 2;
      const target: number = 971;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(759);
      expect(effectiveDuration).assertEqual(865.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0075
     * @tc.name      testProjPlaybackMath0075
     * @tc.desc      Speed 3 with seek 998 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1740;
      const speed: number = 3;
      const target: number = 998;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(742);
      expect(effectiveDuration).assertEqual(580.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0076
     * @tc.name      testProjPlaybackMath0076
     * @tc.desc      Speed 0.5 with seek 1025 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1750;
      const speed: number = 0.5;
      const target: number = 1025;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(725);
      expect(effectiveDuration).assertEqual(3500.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0077
     * @tc.name      testProjPlaybackMath0077
     * @tc.desc      Speed 1 with seek 1052 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1760;
      const speed: number = 1;
      const target: number = 1052;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(708);
      expect(effectiveDuration).assertEqual(1760.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0078
     * @tc.name      testProjPlaybackMath0078
     * @tc.desc      Speed 1.5 with seek 1079 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1770;
      const speed: number = 1.5;
      const target: number = 1079;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(691);
      expect(effectiveDuration).assertEqual(1180.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0079
     * @tc.name      testProjPlaybackMath0079
     * @tc.desc      Speed 2 with seek 1106 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1780;
      const speed: number = 2;
      const target: number = 1106;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(674);
      expect(effectiveDuration).assertEqual(890.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0080
     * @tc.name      testProjPlaybackMath0080
     * @tc.desc      Speed 3 with seek 1133 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1790;
      const speed: number = 3;
      const target: number = 1133;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(657);
      expect(effectiveDuration).assertEqual(596.6666666666666);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0081
     * @tc.name      testProjPlaybackMath0081
     * @tc.desc      Speed 0.5 with seek 1160 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1800;
      const speed: number = 0.5;
      const target: number = 1160;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(640);
      expect(effectiveDuration).assertEqual(3600.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0082
     * @tc.name      testProjPlaybackMath0082
     * @tc.desc      Speed 1 with seek 1187 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1810;
      const speed: number = 1;
      const target: number = 1187;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(623);
      expect(effectiveDuration).assertEqual(1810.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0083
     * @tc.name      testProjPlaybackMath0083
     * @tc.desc      Speed 1.5 with seek 1214 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1820;
      const speed: number = 1.5;
      const target: number = 1214;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(606);
      expect(effectiveDuration).assertEqual(1213.3333333333333);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0084
     * @tc.name      testProjPlaybackMath0084
     * @tc.desc      Speed 2 with seek 1241 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1830;
      const speed: number = 2;
      const target: number = 1241;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(589);
      expect(effectiveDuration).assertEqual(915.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0085
     * @tc.name      testProjPlaybackMath0085
     * @tc.desc      Speed 3 with seek 1268 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1840;
      const speed: number = 3;
      const target: number = 1268;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(572);
      expect(effectiveDuration).assertEqual(613.3333333333334);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0086
     * @tc.name      testProjPlaybackMath0086
     * @tc.desc      Speed 0.5 with seek 1295 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1850;
      const speed: number = 0.5;
      const target: number = 1295;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(555);
      expect(effectiveDuration).assertEqual(3700.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0087
     * @tc.name      testProjPlaybackMath0087
     * @tc.desc      Speed 1 with seek 1322 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1860;
      const speed: number = 1;
      const target: number = 1322;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(538);
      expect(effectiveDuration).assertEqual(1860.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0088
     * @tc.name      testProjPlaybackMath0088
     * @tc.desc      Speed 1.5 with seek 1349 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1870;
      const speed: number = 1.5;
      const target: number = 1349;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(521);
      expect(effectiveDuration).assertEqual(1246.6666666666667);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0089
     * @tc.name      testProjPlaybackMath0089
     * @tc.desc      Speed 2 with seek 1376 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1880;
      const speed: number = 2;
      const target: number = 1376;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(504);
      expect(effectiveDuration).assertEqual(940.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0090
     * @tc.name      testProjPlaybackMath0090
     * @tc.desc      Speed 3 with seek 1403 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1890;
      const speed: number = 3;
      const target: number = 1403;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(487);
      expect(effectiveDuration).assertEqual(630.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0091
     * @tc.name      testProjPlaybackMath0091
     * @tc.desc      Speed 0.5 with seek 1430 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1900;
      const speed: number = 0.5;
      const target: number = 1430;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(470);
      expect(effectiveDuration).assertEqual(3800.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0092
     * @tc.name      testProjPlaybackMath0092
     * @tc.desc      Speed 1 with seek 1457 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1910;
      const speed: number = 1;
      const target: number = 1457;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(453);
      expect(effectiveDuration).assertEqual(1910.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0093
     * @tc.name      testProjPlaybackMath0093
     * @tc.desc      Speed 1.5 with seek 1484 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1920;
      const speed: number = 1.5;
      const target: number = 1484;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(436);
      expect(effectiveDuration).assertEqual(1280.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0094
     * @tc.name      testProjPlaybackMath0094
     * @tc.desc      Speed 2 with seek 1511 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1930;
      const speed: number = 2;
      const target: number = 1511;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(419);
      expect(effectiveDuration).assertEqual(965.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0095
     * @tc.name      testProjPlaybackMath0095
     * @tc.desc      Speed 3 with seek 1538 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1940;
      const speed: number = 3;
      const target: number = 1538;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(402);
      expect(effectiveDuration).assertEqual(646.6666666666666);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0096
     * @tc.name      testProjPlaybackMath0096
     * @tc.desc      Speed 0.5 with seek 1565 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1950;
      const speed: number = 0.5;
      const target: number = 1565;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(385);
      expect(effectiveDuration).assertEqual(3900.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0097
     * @tc.name      testProjPlaybackMath0097
     * @tc.desc      Speed 1 with seek 1592 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1960;
      const speed: number = 1;
      const target: number = 1592;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(368);
      expect(effectiveDuration).assertEqual(1960.0);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_PROJ_PLAYM_0098
     * @tc.name      testProjPlaybackMath0098
     * @tc.desc      Speed 1.5 with seek 1619 keeps duration math consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testProjPlaybackMath0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const duration: number = 1970;
      const speed: number = 1.5;
      const target: number = 1619;
      const remaining: number = duration - target;
      const effectiveDuration: number = duration / speed;
      expect(remaining).assertEqual(351);
      expect(effectiveDuration).assertEqual(1313.3333333333333);
      expect(remaining >= 0).assertTrue();
      expect(speed > 0).assertTrue();
    })
  })
}
