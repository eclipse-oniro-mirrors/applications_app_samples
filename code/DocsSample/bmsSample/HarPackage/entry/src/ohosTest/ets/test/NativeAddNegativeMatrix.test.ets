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

export default function nativeAddNegativeMatrixTest() {
  describe('NativeAddNegativeMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0001
     * @tc.name      testNativeSigned0001
     * @tc.desc      Add signed values -7 and -250 and expect -257
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-7, -250);
      logCase('testNativeSigned0001', `sum=${sum}`);
      expect(sum).assertEqual(-257);
      expect(nativeAdd(-250, -7)).assertEqual(-257);
      expect(nativeAdd(-257, -(-250))).assertEqual(-7);
      expect(nativeAdd(-257, -(-7))).assertEqual(-250);
      expect(nativeAdd(-257, -(-257))).assertEqual(0);
      expect(nativeAdd(-7, -250) < -7).assertTrue();
      expect(nativeAdd(-7, 0)).assertEqual(-7);
      expect(nativeAdd(-7, -250) - -250).assertEqual(-7);
      expect(sum - -7).assertEqual(-250);
      {
      const sum: number = nativeAdd(-48, -221);
      logCase('testNativeSigned0002', `sum=${sum}`);
      expect(sum).assertEqual(-269);
      expect(nativeAdd(-221, -48)).assertEqual(-269);
      expect(nativeAdd(-269, -(-221))).assertEqual(-48);
      expect(nativeAdd(-269, -(-48))).assertEqual(-221);
      expect(nativeAdd(-269, -(-269))).assertEqual(0);
      expect(nativeAdd(-48, -221) < -48).assertTrue();
      expect(nativeAdd(-48, 0)).assertEqual(-48);
      expect(nativeAdd(-48, -221) - -221).assertEqual(-48);
      expect(sum - -48).assertEqual(-221);
      }
      {
      const sum: number = nativeAdd(-89, -192);
      logCase('testNativeSigned0003', `sum=${sum}`);
      expect(sum).assertEqual(-281);
      expect(nativeAdd(-192, -89)).assertEqual(-281);
      expect(nativeAdd(-281, -(-192))).assertEqual(-89);
      expect(nativeAdd(-281, -(-89))).assertEqual(-192);
      expect(nativeAdd(-281, -(-281))).assertEqual(0);
      expect(nativeAdd(-89, -192) < -89).assertTrue();
      expect(nativeAdd(-89, 0)).assertEqual(-89);
      expect(nativeAdd(-89, -192) - -192).assertEqual(-89);
      expect(sum - -89).assertEqual(-192);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0004
     * @tc.name      testNativeSigned0004
     * @tc.desc      Add signed values -130 and -163 and expect -293
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-130, -163);
      logCase('testNativeSigned0004', `sum=${sum}`);
      expect(sum).assertEqual(-293);
      expect(nativeAdd(-163, -130)).assertEqual(-293);
      expect(nativeAdd(-293, -(-163))).assertEqual(-130);
      expect(nativeAdd(-293, -(-130))).assertEqual(-163);
      expect(nativeAdd(-293, -(-293))).assertEqual(0);
      expect(nativeAdd(-130, -163) < -130).assertTrue();
      expect(nativeAdd(-130, 0)).assertEqual(-130);
      expect(nativeAdd(-130, -163) - -163).assertEqual(-130);
      expect(sum - -130).assertEqual(-163);
      {
      const sum: number = nativeAdd(-171, -134);
      logCase('testNativeSigned0005', `sum=${sum}`);
      expect(sum).assertEqual(-305);
      expect(nativeAdd(-134, -171)).assertEqual(-305);
      expect(nativeAdd(-305, -(-134))).assertEqual(-171);
      expect(nativeAdd(-305, -(-171))).assertEqual(-134);
      expect(nativeAdd(-305, -(-305))).assertEqual(0);
      expect(nativeAdd(-171, -134) < -134).assertTrue();
      expect(nativeAdd(-171, 0)).assertEqual(-171);
      expect(nativeAdd(-171, -134) - -134).assertEqual(-171);
      expect(sum - -171).assertEqual(-134);
      }
      {
      const sum: number = nativeAdd(-212, -105);
      logCase('testNativeSigned0006', `sum=${sum}`);
      expect(sum).assertEqual(-317);
      expect(nativeAdd(-105, -212)).assertEqual(-317);
      expect(nativeAdd(-317, -(-105))).assertEqual(-212);
      expect(nativeAdd(-317, -(-212))).assertEqual(-105);
      expect(nativeAdd(-317, -(-317))).assertEqual(0);
      expect(nativeAdd(-212, -105) < -105).assertTrue();
      expect(nativeAdd(-212, 0)).assertEqual(-212);
      expect(nativeAdd(-212, -105) - -105).assertEqual(-212);
      expect(sum - -212).assertEqual(-105);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0007
     * @tc.name      testNativeSigned0007
     * @tc.desc      Add signed values -253 and -76 and expect -329
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-253, -76);
      logCase('testNativeSigned0007', `sum=${sum}`);
      expect(sum).assertEqual(-329);
      expect(nativeAdd(-76, -253)).assertEqual(-329);
      expect(nativeAdd(-329, -(-76))).assertEqual(-253);
      expect(nativeAdd(-329, -(-253))).assertEqual(-76);
      expect(nativeAdd(-329, -(-329))).assertEqual(0);
      expect(nativeAdd(-253, -76) < -76).assertTrue();
      expect(nativeAdd(-253, 0)).assertEqual(-253);
      expect(nativeAdd(-253, -76) - -76).assertEqual(-253);
      expect(sum - -253).assertEqual(-76);
      {
      const sum: number = nativeAdd(-294, -47);
      logCase('testNativeSigned0008', `sum=${sum}`);
      expect(sum).assertEqual(-341);
      expect(nativeAdd(-47, -294)).assertEqual(-341);
      expect(nativeAdd(-341, -(-47))).assertEqual(-294);
      expect(nativeAdd(-341, -(-294))).assertEqual(-47);
      expect(nativeAdd(-341, -(-341))).assertEqual(0);
      expect(nativeAdd(-294, -47) < -47).assertTrue();
      expect(nativeAdd(-294, 0)).assertEqual(-294);
      expect(nativeAdd(-294, -47) - -47).assertEqual(-294);
      expect(sum - -294).assertEqual(-47);
      }
      {
      const sum: number = nativeAdd(-335, -18);
      logCase('testNativeSigned0009', `sum=${sum}`);
      expect(sum).assertEqual(-353);
      expect(nativeAdd(-18, -335)).assertEqual(-353);
      expect(nativeAdd(-353, -(-18))).assertEqual(-335);
      expect(nativeAdd(-353, -(-335))).assertEqual(-18);
      expect(nativeAdd(-353, -(-353))).assertEqual(0);
      expect(nativeAdd(-335, -18) < -18).assertTrue();
      expect(nativeAdd(-335, 0)).assertEqual(-335);
      expect(nativeAdd(-335, -18) - -18).assertEqual(-335);
      expect(sum - -335).assertEqual(-18);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0010
     * @tc.name      testNativeSigned0010
     * @tc.desc      Add signed values -376 and 11 and expect -365
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-376, 11);
      logCase('testNativeSigned0010', `sum=${sum}`);
      expect(sum).assertEqual(-365);
      expect(nativeAdd(11, -376)).assertEqual(-365);
      expect(nativeAdd(-365, -(11))).assertEqual(-376);
      expect(nativeAdd(-365, -(-376))).assertEqual(11);
      expect(nativeAdd(-365, -(-365))).assertEqual(0);
      expect(nativeAdd(-376, 11) < 11).assertTrue();
      expect(nativeAdd(-376, 0)).assertEqual(-376);
      expect(nativeAdd(-376, 11) - 11).assertEqual(-376);
      expect(sum - -376).assertEqual(11);
      {
      const sum: number = nativeAdd(-417, 40);
      logCase('testNativeSigned0011', `sum=${sum}`);
      expect(sum).assertEqual(-377);
      expect(nativeAdd(40, -417)).assertEqual(-377);
      expect(nativeAdd(-377, -(40))).assertEqual(-417);
      expect(nativeAdd(-377, -(-417))).assertEqual(40);
      expect(nativeAdd(-377, -(-377))).assertEqual(0);
      expect(nativeAdd(-417, 40) < 40).assertTrue();
      expect(nativeAdd(-417, 0)).assertEqual(-417);
      expect(nativeAdd(-417, 40) - 40).assertEqual(-417);
      expect(sum - -417).assertEqual(40);
      }
      {
      const sum: number = nativeAdd(-458, 69);
      logCase('testNativeSigned0012', `sum=${sum}`);
      expect(sum).assertEqual(-389);
      expect(nativeAdd(69, -458)).assertEqual(-389);
      expect(nativeAdd(-389, -(69))).assertEqual(-458);
      expect(nativeAdd(-389, -(-458))).assertEqual(69);
      expect(nativeAdd(-389, -(-389))).assertEqual(0);
      expect(nativeAdd(-458, 69) < 69).assertTrue();
      expect(nativeAdd(-458, 0)).assertEqual(-458);
      expect(nativeAdd(-458, 69) - 69).assertEqual(-458);
      expect(sum - -458).assertEqual(69);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0013
     * @tc.name      testNativeSigned0013
     * @tc.desc      Add signed values -499 and 98 and expect -401
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-499, 98);
      logCase('testNativeSigned0013', `sum=${sum}`);
      expect(sum).assertEqual(-401);
      expect(nativeAdd(98, -499)).assertEqual(-401);
      expect(nativeAdd(-401, -(98))).assertEqual(-499);
      expect(nativeAdd(-401, -(-499))).assertEqual(98);
      expect(nativeAdd(-401, -(-401))).assertEqual(0);
      expect(nativeAdd(-499, 98) < 98).assertTrue();
      expect(nativeAdd(-499, 0)).assertEqual(-499);
      expect(nativeAdd(-499, 98) - 98).assertEqual(-499);
      expect(sum - -499).assertEqual(98);
      {
      const sum: number = nativeAdd(-540, 127);
      logCase('testNativeSigned0014', `sum=${sum}`);
      expect(sum).assertEqual(-413);
      expect(nativeAdd(127, -540)).assertEqual(-413);
      expect(nativeAdd(-413, -(127))).assertEqual(-540);
      expect(nativeAdd(-413, -(-540))).assertEqual(127);
      expect(nativeAdd(-413, -(-413))).assertEqual(0);
      expect(nativeAdd(-540, 127) < 127).assertTrue();
      expect(nativeAdd(-540, 0)).assertEqual(-540);
      expect(nativeAdd(-540, 127) - 127).assertEqual(-540);
      expect(sum - -540).assertEqual(127);
      }
      {
      const sum: number = nativeAdd(-581, 156);
      logCase('testNativeSigned0015', `sum=${sum}`);
      expect(sum).assertEqual(-425);
      expect(nativeAdd(156, -581)).assertEqual(-425);
      expect(nativeAdd(-425, -(156))).assertEqual(-581);
      expect(nativeAdd(-425, -(-581))).assertEqual(156);
      expect(nativeAdd(-425, -(-425))).assertEqual(0);
      expect(nativeAdd(-581, 156) < 156).assertTrue();
      expect(nativeAdd(-581, 0)).assertEqual(-581);
      expect(nativeAdd(-581, 156) - 156).assertEqual(-581);
      expect(sum - -581).assertEqual(156);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0016
     * @tc.name      testNativeSigned0016
     * @tc.desc      Add signed values -622 and 185 and expect -437
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-622, 185);
      logCase('testNativeSigned0016', `sum=${sum}`);
      expect(sum).assertEqual(-437);
      expect(nativeAdd(185, -622)).assertEqual(-437);
      expect(nativeAdd(-437, -(185))).assertEqual(-622);
      expect(nativeAdd(-437, -(-622))).assertEqual(185);
      expect(nativeAdd(-437, -(-437))).assertEqual(0);
      expect(nativeAdd(-622, 185) < 185).assertTrue();
      expect(nativeAdd(-622, 0)).assertEqual(-622);
      expect(nativeAdd(-622, 185) - 185).assertEqual(-622);
      expect(sum - -622).assertEqual(185);
      {
      const sum: number = nativeAdd(-663, 214);
      logCase('testNativeSigned0017', `sum=${sum}`);
      expect(sum).assertEqual(-449);
      expect(nativeAdd(214, -663)).assertEqual(-449);
      expect(nativeAdd(-449, -(214))).assertEqual(-663);
      expect(nativeAdd(-449, -(-663))).assertEqual(214);
      expect(nativeAdd(-449, -(-449))).assertEqual(0);
      expect(nativeAdd(-663, 214) < 214).assertTrue();
      expect(nativeAdd(-663, 0)).assertEqual(-663);
      expect(nativeAdd(-663, 214) - 214).assertEqual(-663);
      expect(sum - -663).assertEqual(214);
      }
      {
      const sum: number = nativeAdd(-704, 243);
      logCase('testNativeSigned0018', `sum=${sum}`);
      expect(sum).assertEqual(-461);
      expect(nativeAdd(243, -704)).assertEqual(-461);
      expect(nativeAdd(-461, -(243))).assertEqual(-704);
      expect(nativeAdd(-461, -(-704))).assertEqual(243);
      expect(nativeAdd(-461, -(-461))).assertEqual(0);
      expect(nativeAdd(-704, 243) < 243).assertTrue();
      expect(nativeAdd(-704, 0)).assertEqual(-704);
      expect(nativeAdd(-704, 243) - 243).assertEqual(-704);
      expect(sum - -704).assertEqual(243);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0019
     * @tc.name      testNativeSigned0019
     * @tc.desc      Add signed values -745 and -228 and expect -973
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-745, -228);
      logCase('testNativeSigned0019', `sum=${sum}`);
      expect(sum).assertEqual(-973);
      expect(nativeAdd(-228, -745)).assertEqual(-973);
      expect(nativeAdd(-973, -(-228))).assertEqual(-745);
      expect(nativeAdd(-973, -(-745))).assertEqual(-228);
      expect(nativeAdd(-973, -(-973))).assertEqual(0);
      expect(nativeAdd(-745, -228) < -228).assertTrue();
      expect(nativeAdd(-745, 0)).assertEqual(-745);
      expect(nativeAdd(-745, -228) - -228).assertEqual(-745);
      expect(sum - -745).assertEqual(-228);
      {
      const sum: number = nativeAdd(-786, -199);
      logCase('testNativeSigned0020', `sum=${sum}`);
      expect(sum).assertEqual(-985);
      expect(nativeAdd(-199, -786)).assertEqual(-985);
      expect(nativeAdd(-985, -(-199))).assertEqual(-786);
      expect(nativeAdd(-985, -(-786))).assertEqual(-199);
      expect(nativeAdd(-985, -(-985))).assertEqual(0);
      expect(nativeAdd(-786, -199) < -199).assertTrue();
      expect(nativeAdd(-786, 0)).assertEqual(-786);
      expect(nativeAdd(-786, -199) - -199).assertEqual(-786);
      expect(sum - -786).assertEqual(-199);
      }
      {
      const sum: number = nativeAdd(-827, -170);
      logCase('testNativeSigned0021', `sum=${sum}`);
      expect(sum).assertEqual(-997);
      expect(nativeAdd(-170, -827)).assertEqual(-997);
      expect(nativeAdd(-997, -(-170))).assertEqual(-827);
      expect(nativeAdd(-997, -(-827))).assertEqual(-170);
      expect(nativeAdd(-997, -(-997))).assertEqual(0);
      expect(nativeAdd(-827, -170) < -170).assertTrue();
      expect(nativeAdd(-827, 0)).assertEqual(-827);
      expect(nativeAdd(-827, -170) - -170).assertEqual(-827);
      expect(sum - -827).assertEqual(-170);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0022
     * @tc.name      testNativeSigned0022
     * @tc.desc      Add signed values -868 and -141 and expect -1009
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-868, -141);
      logCase('testNativeSigned0022', `sum=${sum}`);
      expect(sum).assertEqual(-1009);
      expect(nativeAdd(-141, -868)).assertEqual(-1009);
      expect(nativeAdd(-1009, -(-141))).assertEqual(-868);
      expect(nativeAdd(-1009, -(-868))).assertEqual(-141);
      expect(nativeAdd(-1009, -(-1009))).assertEqual(0);
      expect(nativeAdd(-868, -141) < -141).assertTrue();
      expect(nativeAdd(-868, 0)).assertEqual(-868);
      expect(nativeAdd(-868, -141) - -141).assertEqual(-868);
      expect(sum - -868).assertEqual(-141);
      {
      const sum: number = nativeAdd(-909, -112);
      logCase('testNativeSigned0023', `sum=${sum}`);
      expect(sum).assertEqual(-1021);
      expect(nativeAdd(-112, -909)).assertEqual(-1021);
      expect(nativeAdd(-1021, -(-112))).assertEqual(-909);
      expect(nativeAdd(-1021, -(-909))).assertEqual(-112);
      expect(nativeAdd(-1021, -(-1021))).assertEqual(0);
      expect(nativeAdd(-909, -112) < -112).assertTrue();
      expect(nativeAdd(-909, 0)).assertEqual(-909);
      expect(nativeAdd(-909, -112) - -112).assertEqual(-909);
      expect(sum - -909).assertEqual(-112);
      }
      {
      const sum: number = nativeAdd(-950, -83);
      logCase('testNativeSigned0024', `sum=${sum}`);
      expect(sum).assertEqual(-1033);
      expect(nativeAdd(-83, -950)).assertEqual(-1033);
      expect(nativeAdd(-1033, -(-83))).assertEqual(-950);
      expect(nativeAdd(-1033, -(-950))).assertEqual(-83);
      expect(nativeAdd(-1033, -(-1033))).assertEqual(0);
      expect(nativeAdd(-950, -83) < -83).assertTrue();
      expect(nativeAdd(-950, 0)).assertEqual(-950);
      expect(nativeAdd(-950, -83) - -83).assertEqual(-950);
      expect(sum - -950).assertEqual(-83);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0025
     * @tc.name      testNativeSigned0025
     * @tc.desc      Add signed values -991 and -54 and expect -1045
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-991, -54);
      logCase('testNativeSigned0025', `sum=${sum}`);
      expect(sum).assertEqual(-1045);
      expect(nativeAdd(-54, -991)).assertEqual(-1045);
      expect(nativeAdd(-1045, -(-54))).assertEqual(-991);
      expect(nativeAdd(-1045, -(-991))).assertEqual(-54);
      expect(nativeAdd(-1045, -(-1045))).assertEqual(0);
      expect(nativeAdd(-991, -54) < -54).assertTrue();
      expect(nativeAdd(-991, 0)).assertEqual(-991);
      expect(nativeAdd(-991, -54) - -54).assertEqual(-991);
      expect(sum - -991).assertEqual(-54);
      {
      const sum: number = nativeAdd(-1032, -25);
      logCase('testNativeSigned0026', `sum=${sum}`);
      expect(sum).assertEqual(-1057);
      expect(nativeAdd(-25, -1032)).assertEqual(-1057);
      expect(nativeAdd(-1057, -(-25))).assertEqual(-1032);
      expect(nativeAdd(-1057, -(-1032))).assertEqual(-25);
      expect(nativeAdd(-1057, -(-1057))).assertEqual(0);
      expect(nativeAdd(-1032, -25) < -25).assertTrue();
      expect(nativeAdd(-1032, 0)).assertEqual(-1032);
      expect(nativeAdd(-1032, -25) - -25).assertEqual(-1032);
      expect(sum - -1032).assertEqual(-25);
      }
      {
      const sum: number = nativeAdd(-1073, 4);
      logCase('testNativeSigned0027', `sum=${sum}`);
      expect(sum).assertEqual(-1069);
      expect(nativeAdd(4, -1073)).assertEqual(-1069);
      expect(nativeAdd(-1069, -(4))).assertEqual(-1073);
      expect(nativeAdd(-1069, -(-1073))).assertEqual(4);
      expect(nativeAdd(-1069, -(-1069))).assertEqual(0);
      expect(nativeAdd(-1073, 4) < 4).assertTrue();
      expect(nativeAdd(-1073, 0)).assertEqual(-1073);
      expect(nativeAdd(-1073, 4) - 4).assertEqual(-1073);
      expect(sum - -1073).assertEqual(4);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0028
     * @tc.name      testNativeSigned0028
     * @tc.desc      Add signed values -1114 and 33 and expect -1081
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-1114, 33);
      logCase('testNativeSigned0028', `sum=${sum}`);
      expect(sum).assertEqual(-1081);
      expect(nativeAdd(33, -1114)).assertEqual(-1081);
      expect(nativeAdd(-1081, -(33))).assertEqual(-1114);
      expect(nativeAdd(-1081, -(-1114))).assertEqual(33);
      expect(nativeAdd(-1081, -(-1081))).assertEqual(0);
      expect(nativeAdd(-1114, 33) < 33).assertTrue();
      expect(nativeAdd(-1114, 0)).assertEqual(-1114);
      expect(nativeAdd(-1114, 33) - 33).assertEqual(-1114);
      expect(sum - -1114).assertEqual(33);
      {
      const sum: number = nativeAdd(-1155, 62);
      logCase('testNativeSigned0029', `sum=${sum}`);
      expect(sum).assertEqual(-1093);
      expect(nativeAdd(62, -1155)).assertEqual(-1093);
      expect(nativeAdd(-1093, -(62))).assertEqual(-1155);
      expect(nativeAdd(-1093, -(-1155))).assertEqual(62);
      expect(nativeAdd(-1093, -(-1093))).assertEqual(0);
      expect(nativeAdd(-1155, 62) < 62).assertTrue();
      expect(nativeAdd(-1155, 0)).assertEqual(-1155);
      expect(nativeAdd(-1155, 62) - 62).assertEqual(-1155);
      expect(sum - -1155).assertEqual(62);
      }
      {
      const sum: number = nativeAdd(-1196, 91);
      logCase('testNativeSigned0030', `sum=${sum}`);
      expect(sum).assertEqual(-1105);
      expect(nativeAdd(91, -1196)).assertEqual(-1105);
      expect(nativeAdd(-1105, -(91))).assertEqual(-1196);
      expect(nativeAdd(-1105, -(-1196))).assertEqual(91);
      expect(nativeAdd(-1105, -(-1105))).assertEqual(0);
      expect(nativeAdd(-1196, 91) < 91).assertTrue();
      expect(nativeAdd(-1196, 0)).assertEqual(-1196);
      expect(nativeAdd(-1196, 91) - 91).assertEqual(-1196);
      expect(sum - -1196).assertEqual(91);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0031
     * @tc.name      testNativeSigned0031
     * @tc.desc      Add signed values -1237 and 120 and expect -1117
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-1237, 120);
      logCase('testNativeSigned0031', `sum=${sum}`);
      expect(sum).assertEqual(-1117);
      expect(nativeAdd(120, -1237)).assertEqual(-1117);
      expect(nativeAdd(-1117, -(120))).assertEqual(-1237);
      expect(nativeAdd(-1117, -(-1237))).assertEqual(120);
      expect(nativeAdd(-1117, -(-1117))).assertEqual(0);
      expect(nativeAdd(-1237, 120) < 120).assertTrue();
      expect(nativeAdd(-1237, 0)).assertEqual(-1237);
      expect(nativeAdd(-1237, 120) - 120).assertEqual(-1237);
      expect(sum - -1237).assertEqual(120);
      {
      const sum: number = nativeAdd(-1278, 149);
      logCase('testNativeSigned0032', `sum=${sum}`);
      expect(sum).assertEqual(-1129);
      expect(nativeAdd(149, -1278)).assertEqual(-1129);
      expect(nativeAdd(-1129, -(149))).assertEqual(-1278);
      expect(nativeAdd(-1129, -(-1278))).assertEqual(149);
      expect(nativeAdd(-1129, -(-1129))).assertEqual(0);
      expect(nativeAdd(-1278, 149) < 149).assertTrue();
      expect(nativeAdd(-1278, 0)).assertEqual(-1278);
      expect(nativeAdd(-1278, 149) - 149).assertEqual(-1278);
      expect(sum - -1278).assertEqual(149);
      }
      {
      const sum: number = nativeAdd(-1319, 178);
      logCase('testNativeSigned0033', `sum=${sum}`);
      expect(sum).assertEqual(-1141);
      expect(nativeAdd(178, -1319)).assertEqual(-1141);
      expect(nativeAdd(-1141, -(178))).assertEqual(-1319);
      expect(nativeAdd(-1141, -(-1319))).assertEqual(178);
      expect(nativeAdd(-1141, -(-1141))).assertEqual(0);
      expect(nativeAdd(-1319, 178) < 178).assertTrue();
      expect(nativeAdd(-1319, 0)).assertEqual(-1319);
      expect(nativeAdd(-1319, 178) - 178).assertEqual(-1319);
      expect(sum - -1319).assertEqual(178);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0034
     * @tc.name      testNativeSigned0034
     * @tc.desc      Add signed values -1360 and 207 and expect -1153
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-1360, 207);
      logCase('testNativeSigned0034', `sum=${sum}`);
      expect(sum).assertEqual(-1153);
      expect(nativeAdd(207, -1360)).assertEqual(-1153);
      expect(nativeAdd(-1153, -(207))).assertEqual(-1360);
      expect(nativeAdd(-1153, -(-1360))).assertEqual(207);
      expect(nativeAdd(-1153, -(-1153))).assertEqual(0);
      expect(nativeAdd(-1360, 207) < 207).assertTrue();
      expect(nativeAdd(-1360, 0)).assertEqual(-1360);
      expect(nativeAdd(-1360, 207) - 207).assertEqual(-1360);
      expect(sum - -1360).assertEqual(207);
      {
      const sum: number = nativeAdd(-1401, 236);
      logCase('testNativeSigned0035', `sum=${sum}`);
      expect(sum).assertEqual(-1165);
      expect(nativeAdd(236, -1401)).assertEqual(-1165);
      expect(nativeAdd(-1165, -(236))).assertEqual(-1401);
      expect(nativeAdd(-1165, -(-1401))).assertEqual(236);
      expect(nativeAdd(-1165, -(-1165))).assertEqual(0);
      expect(nativeAdd(-1401, 236) < 236).assertTrue();
      expect(nativeAdd(-1401, 0)).assertEqual(-1401);
      expect(nativeAdd(-1401, 236) - 236).assertEqual(-1401);
      expect(sum - -1401).assertEqual(236);
      }
      {
      const sum: number = nativeAdd(-1442, -235);
      logCase('testNativeSigned0036', `sum=${sum}`);
      expect(sum).assertEqual(-1677);
      expect(nativeAdd(-235, -1442)).assertEqual(-1677);
      expect(nativeAdd(-1677, -(-235))).assertEqual(-1442);
      expect(nativeAdd(-1677, -(-1442))).assertEqual(-235);
      expect(nativeAdd(-1677, -(-1677))).assertEqual(0);
      expect(nativeAdd(-1442, -235) < -235).assertTrue();
      expect(nativeAdd(-1442, 0)).assertEqual(-1442);
      expect(nativeAdd(-1442, -235) - -235).assertEqual(-1442);
      expect(sum - -1442).assertEqual(-235);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0037
     * @tc.name      testNativeSigned0037
     * @tc.desc      Add signed values -1483 and -206 and expect -1689
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-1483, -206);
      logCase('testNativeSigned0037', `sum=${sum}`);
      expect(sum).assertEqual(-1689);
      expect(nativeAdd(-206, -1483)).assertEqual(-1689);
      expect(nativeAdd(-1689, -(-206))).assertEqual(-1483);
      expect(nativeAdd(-1689, -(-1483))).assertEqual(-206);
      expect(nativeAdd(-1689, -(-1689))).assertEqual(0);
      expect(nativeAdd(-1483, -206) < -206).assertTrue();
      expect(nativeAdd(-1483, 0)).assertEqual(-1483);
      expect(nativeAdd(-1483, -206) - -206).assertEqual(-1483);
      expect(sum - -1483).assertEqual(-206);
      {
      const sum: number = nativeAdd(-1524, -177);
      logCase('testNativeSigned0038', `sum=${sum}`);
      expect(sum).assertEqual(-1701);
      expect(nativeAdd(-177, -1524)).assertEqual(-1701);
      expect(nativeAdd(-1701, -(-177))).assertEqual(-1524);
      expect(nativeAdd(-1701, -(-1524))).assertEqual(-177);
      expect(nativeAdd(-1701, -(-1701))).assertEqual(0);
      expect(nativeAdd(-1524, -177) < -177).assertTrue();
      expect(nativeAdd(-1524, 0)).assertEqual(-1524);
      expect(nativeAdd(-1524, -177) - -177).assertEqual(-1524);
      expect(sum - -1524).assertEqual(-177);
      }
      {
      const sum: number = nativeAdd(-1565, -148);
      logCase('testNativeSigned0039', `sum=${sum}`);
      expect(sum).assertEqual(-1713);
      expect(nativeAdd(-148, -1565)).assertEqual(-1713);
      expect(nativeAdd(-1713, -(-148))).assertEqual(-1565);
      expect(nativeAdd(-1713, -(-1565))).assertEqual(-148);
      expect(nativeAdd(-1713, -(-1713))).assertEqual(0);
      expect(nativeAdd(-1565, -148) < -148).assertTrue();
      expect(nativeAdd(-1565, 0)).assertEqual(-1565);
      expect(nativeAdd(-1565, -148) - -148).assertEqual(-1565);
      expect(sum - -1565).assertEqual(-148);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0040
     * @tc.name      testNativeSigned0040
     * @tc.desc      Add signed values -1606 and -119 and expect -1725
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-1606, -119);
      logCase('testNativeSigned0040', `sum=${sum}`);
      expect(sum).assertEqual(-1725);
      expect(nativeAdd(-119, -1606)).assertEqual(-1725);
      expect(nativeAdd(-1725, -(-119))).assertEqual(-1606);
      expect(nativeAdd(-1725, -(-1606))).assertEqual(-119);
      expect(nativeAdd(-1725, -(-1725))).assertEqual(0);
      expect(nativeAdd(-1606, -119) < -119).assertTrue();
      expect(nativeAdd(-1606, 0)).assertEqual(-1606);
      expect(nativeAdd(-1606, -119) - -119).assertEqual(-1606);
      expect(sum - -1606).assertEqual(-119);
      {
      const sum: number = nativeAdd(-1647, -90);
      logCase('testNativeSigned0041', `sum=${sum}`);
      expect(sum).assertEqual(-1737);
      expect(nativeAdd(-90, -1647)).assertEqual(-1737);
      expect(nativeAdd(-1737, -(-90))).assertEqual(-1647);
      expect(nativeAdd(-1737, -(-1647))).assertEqual(-90);
      expect(nativeAdd(-1737, -(-1737))).assertEqual(0);
      expect(nativeAdd(-1647, -90) < -90).assertTrue();
      expect(nativeAdd(-1647, 0)).assertEqual(-1647);
      expect(nativeAdd(-1647, -90) - -90).assertEqual(-1647);
      expect(sum - -1647).assertEqual(-90);
      }
      {
      const sum: number = nativeAdd(-1688, -61);
      logCase('testNativeSigned0042', `sum=${sum}`);
      expect(sum).assertEqual(-1749);
      expect(nativeAdd(-61, -1688)).assertEqual(-1749);
      expect(nativeAdd(-1749, -(-61))).assertEqual(-1688);
      expect(nativeAdd(-1749, -(-1688))).assertEqual(-61);
      expect(nativeAdd(-1749, -(-1749))).assertEqual(0);
      expect(nativeAdd(-1688, -61) < -61).assertTrue();
      expect(nativeAdd(-1688, 0)).assertEqual(-1688);
      expect(nativeAdd(-1688, -61) - -61).assertEqual(-1688);
      expect(sum - -1688).assertEqual(-61);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0043
     * @tc.name      testNativeSigned0043
     * @tc.desc      Add signed values -1729 and -32 and expect -1761
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testNativeSigned0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const sum: number = nativeAdd(-1729, -32);
      logCase('testNativeSigned0043', `sum=${sum}`);
      expect(sum).assertEqual(-1761);
      expect(nativeAdd(-32, -1729)).assertEqual(-1761);
      expect(nativeAdd(-1761, -(-32))).assertEqual(-1729);
      expect(nativeAdd(-1761, -(-1729))).assertEqual(-32);
      expect(nativeAdd(-1761, -(-1761))).assertEqual(0);
      expect(nativeAdd(-1729, -32) < -32).assertTrue();
      expect(nativeAdd(-1729, 0)).assertEqual(-1729);
      expect(nativeAdd(-1729, -32) - -32).assertEqual(-1729);
      expect(sum - -1729).assertEqual(-32);
      {
      const sum: number = nativeAdd(-1770, -3);
      logCase('testNativeSigned0044', `sum=${sum}`);
      expect(sum).assertEqual(-1773);
      expect(nativeAdd(-3, -1770)).assertEqual(-1773);
      expect(nativeAdd(-1773, -(-3))).assertEqual(-1770);
      expect(nativeAdd(-1773, -(-1770))).assertEqual(-3);
      expect(nativeAdd(-1773, -(-1773))).assertEqual(0);
      expect(nativeAdd(-1770, -3) < -3).assertTrue();
      expect(nativeAdd(-1770, 0)).assertEqual(-1770);
      expect(nativeAdd(-1770, -3) - -3).assertEqual(-1770);
      expect(sum - -1770).assertEqual(-3);
      }
      {
      const sum: number = nativeAdd(-1811, 26);
      logCase('testNativeSigned0045', `sum=${sum}`);
      expect(sum).assertEqual(-1785);
      expect(nativeAdd(26, -1811)).assertEqual(-1785);
      expect(nativeAdd(-1785, -(26))).assertEqual(-1811);
      expect(nativeAdd(-1785, -(-1811))).assertEqual(26);
      expect(nativeAdd(-1785, -(-1785))).assertEqual(0);
      expect(nativeAdd(-1811, 26) < 26).assertTrue();
      expect(nativeAdd(-1811, 0)).assertEqual(-1811);
      expect(nativeAdd(-1811, 26) - 26).assertEqual(-1811);
      expect(sum - -1811).assertEqual(26);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0046
     * @tc.name      testNativeSigned0046
     * @tc.desc      Add signed values -1852 and 55 and expect -1797
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-1852, 55);
      logCase('testNativeSigned0046', `sum=${sum}`);
      expect(sum).assertEqual(-1797);
      expect(nativeAdd(55, -1852)).assertEqual(-1797);
      expect(nativeAdd(-1797, -(55))).assertEqual(-1852);
      expect(nativeAdd(-1797, -(-1852))).assertEqual(55);
      expect(nativeAdd(-1797, -(-1797))).assertEqual(0);
      expect(nativeAdd(-1852, 55) < 55).assertTrue();
      expect(nativeAdd(-1852, 0)).assertEqual(-1852);
      expect(nativeAdd(-1852, 55) - 55).assertEqual(-1852);
      expect(sum - -1852).assertEqual(55);
      {
      const sum: number = nativeAdd(-1893, 84);
      logCase('testNativeSigned0047', `sum=${sum}`);
      expect(sum).assertEqual(-1809);
      expect(nativeAdd(84, -1893)).assertEqual(-1809);
      expect(nativeAdd(-1809, -(84))).assertEqual(-1893);
      expect(nativeAdd(-1809, -(-1893))).assertEqual(84);
      expect(nativeAdd(-1809, -(-1809))).assertEqual(0);
      expect(nativeAdd(-1893, 84) < 84).assertTrue();
      expect(nativeAdd(-1893, 0)).assertEqual(-1893);
      expect(nativeAdd(-1893, 84) - 84).assertEqual(-1893);
      expect(sum - -1893).assertEqual(84);
      }
      {
      const sum: number = nativeAdd(-1934, 113);
      logCase('testNativeSigned0048', `sum=${sum}`);
      expect(sum).assertEqual(-1821);
      expect(nativeAdd(113, -1934)).assertEqual(-1821);
      expect(nativeAdd(-1821, -(113))).assertEqual(-1934);
      expect(nativeAdd(-1821, -(-1934))).assertEqual(113);
      expect(nativeAdd(-1821, -(-1821))).assertEqual(0);
      expect(nativeAdd(-1934, 113) < 113).assertTrue();
      expect(nativeAdd(-1934, 0)).assertEqual(-1934);
      expect(nativeAdd(-1934, 113) - 113).assertEqual(-1934);
      expect(sum - -1934).assertEqual(113);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0049
     * @tc.name      testNativeSigned0049
     * @tc.desc      Add signed values -1975 and 142 and expect -1833
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-1975, 142);
      logCase('testNativeSigned0049', `sum=${sum}`);
      expect(sum).assertEqual(-1833);
      expect(nativeAdd(142, -1975)).assertEqual(-1833);
      expect(nativeAdd(-1833, -(142))).assertEqual(-1975);
      expect(nativeAdd(-1833, -(-1975))).assertEqual(142);
      expect(nativeAdd(-1833, -(-1833))).assertEqual(0);
      expect(nativeAdd(-1975, 142) < 142).assertTrue();
      expect(nativeAdd(-1975, 0)).assertEqual(-1975);
      expect(nativeAdd(-1975, 142) - 142).assertEqual(-1975);
      expect(sum - -1975).assertEqual(142);
      {
      const sum: number = nativeAdd(-2016, 171);
      logCase('testNativeSigned0050', `sum=${sum}`);
      expect(sum).assertEqual(-1845);
      expect(nativeAdd(171, -2016)).assertEqual(-1845);
      expect(nativeAdd(-1845, -(171))).assertEqual(-2016);
      expect(nativeAdd(-1845, -(-2016))).assertEqual(171);
      expect(nativeAdd(-1845, -(-1845))).assertEqual(0);
      expect(nativeAdd(-2016, 171) < 171).assertTrue();
      expect(nativeAdd(-2016, 0)).assertEqual(-2016);
      expect(nativeAdd(-2016, 171) - 171).assertEqual(-2016);
      expect(sum - -2016).assertEqual(171);
      }
      {
      const sum: number = nativeAdd(-2057, 200);
      logCase('testNativeSigned0051', `sum=${sum}`);
      expect(sum).assertEqual(-1857);
      expect(nativeAdd(200, -2057)).assertEqual(-1857);
      expect(nativeAdd(-1857, -(200))).assertEqual(-2057);
      expect(nativeAdd(-1857, -(-2057))).assertEqual(200);
      expect(nativeAdd(-1857, -(-1857))).assertEqual(0);
      expect(nativeAdd(-2057, 200) < 200).assertTrue();
      expect(nativeAdd(-2057, 0)).assertEqual(-2057);
      expect(nativeAdd(-2057, 200) - 200).assertEqual(-2057);
      expect(sum - -2057).assertEqual(200);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0052
     * @tc.name      testNativeSigned0052
     * @tc.desc      Add signed values -2098 and 229 and expect -1869
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-2098, 229);
      logCase('testNativeSigned0052', `sum=${sum}`);
      expect(sum).assertEqual(-1869);
      expect(nativeAdd(229, -2098)).assertEqual(-1869);
      expect(nativeAdd(-1869, -(229))).assertEqual(-2098);
      expect(nativeAdd(-1869, -(-2098))).assertEqual(229);
      expect(nativeAdd(-1869, -(-1869))).assertEqual(0);
      expect(nativeAdd(-2098, 229) < 229).assertTrue();
      expect(nativeAdd(-2098, 0)).assertEqual(-2098);
      expect(nativeAdd(-2098, 229) - 229).assertEqual(-2098);
      expect(sum - -2098).assertEqual(229);
      {
      const sum: number = nativeAdd(-2139, -242);
      logCase('testNativeSigned0053', `sum=${sum}`);
      expect(sum).assertEqual(-2381);
      expect(nativeAdd(-242, -2139)).assertEqual(-2381);
      expect(nativeAdd(-2381, -(-242))).assertEqual(-2139);
      expect(nativeAdd(-2381, -(-2139))).assertEqual(-242);
      expect(nativeAdd(-2381, -(-2381))).assertEqual(0);
      expect(nativeAdd(-2139, -242) < -242).assertTrue();
      expect(nativeAdd(-2139, 0)).assertEqual(-2139);
      expect(nativeAdd(-2139, -242) - -242).assertEqual(-2139);
      expect(sum - -2139).assertEqual(-242);
      }
      {
      const sum: number = nativeAdd(-2180, -213);
      logCase('testNativeSigned0054', `sum=${sum}`);
      expect(sum).assertEqual(-2393);
      expect(nativeAdd(-213, -2180)).assertEqual(-2393);
      expect(nativeAdd(-2393, -(-213))).assertEqual(-2180);
      expect(nativeAdd(-2393, -(-2180))).assertEqual(-213);
      expect(nativeAdd(-2393, -(-2393))).assertEqual(0);
      expect(nativeAdd(-2180, -213) < -213).assertTrue();
      expect(nativeAdd(-2180, 0)).assertEqual(-2180);
      expect(nativeAdd(-2180, -213) - -213).assertEqual(-2180);
      expect(sum - -2180).assertEqual(-213);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0055
     * @tc.name      testNativeSigned0055
     * @tc.desc      Add signed values -2221 and -184 and expect -2405
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-2221, -184);
      logCase('testNativeSigned0055', `sum=${sum}`);
      expect(sum).assertEqual(-2405);
      expect(nativeAdd(-184, -2221)).assertEqual(-2405);
      expect(nativeAdd(-2405, -(-184))).assertEqual(-2221);
      expect(nativeAdd(-2405, -(-2221))).assertEqual(-184);
      expect(nativeAdd(-2405, -(-2405))).assertEqual(0);
      expect(nativeAdd(-2221, -184) < -184).assertTrue();
      expect(nativeAdd(-2221, 0)).assertEqual(-2221);
      expect(nativeAdd(-2221, -184) - -184).assertEqual(-2221);
      expect(sum - -2221).assertEqual(-184);
      {
      const sum: number = nativeAdd(-2262, -155);
      logCase('testNativeSigned0056', `sum=${sum}`);
      expect(sum).assertEqual(-2417);
      expect(nativeAdd(-155, -2262)).assertEqual(-2417);
      expect(nativeAdd(-2417, -(-155))).assertEqual(-2262);
      expect(nativeAdd(-2417, -(-2262))).assertEqual(-155);
      expect(nativeAdd(-2417, -(-2417))).assertEqual(0);
      expect(nativeAdd(-2262, -155) < -155).assertTrue();
      expect(nativeAdd(-2262, 0)).assertEqual(-2262);
      expect(nativeAdd(-2262, -155) - -155).assertEqual(-2262);
      expect(sum - -2262).assertEqual(-155);
      }
      {
      const sum: number = nativeAdd(-2303, -126);
      logCase('testNativeSigned0057', `sum=${sum}`);
      expect(sum).assertEqual(-2429);
      expect(nativeAdd(-126, -2303)).assertEqual(-2429);
      expect(nativeAdd(-2429, -(-126))).assertEqual(-2303);
      expect(nativeAdd(-2429, -(-2303))).assertEqual(-126);
      expect(nativeAdd(-2429, -(-2429))).assertEqual(0);
      expect(nativeAdd(-2303, -126) < -126).assertTrue();
      expect(nativeAdd(-2303, 0)).assertEqual(-2303);
      expect(nativeAdd(-2303, -126) - -126).assertEqual(-2303);
      expect(sum - -2303).assertEqual(-126);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0058
     * @tc.name      testNativeSigned0058
     * @tc.desc      Add signed values -2344 and -97 and expect -2441
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-2344, -97);
      logCase('testNativeSigned0058', `sum=${sum}`);
      expect(sum).assertEqual(-2441);
      expect(nativeAdd(-97, -2344)).assertEqual(-2441);
      expect(nativeAdd(-2441, -(-97))).assertEqual(-2344);
      expect(nativeAdd(-2441, -(-2344))).assertEqual(-97);
      expect(nativeAdd(-2441, -(-2441))).assertEqual(0);
      expect(nativeAdd(-2344, -97) < -97).assertTrue();
      expect(nativeAdd(-2344, 0)).assertEqual(-2344);
      expect(nativeAdd(-2344, -97) - -97).assertEqual(-2344);
      expect(sum - -2344).assertEqual(-97);
      {
      const sum: number = nativeAdd(-2385, -68);
      logCase('testNativeSigned0059', `sum=${sum}`);
      expect(sum).assertEqual(-2453);
      expect(nativeAdd(-68, -2385)).assertEqual(-2453);
      expect(nativeAdd(-2453, -(-68))).assertEqual(-2385);
      expect(nativeAdd(-2453, -(-2385))).assertEqual(-68);
      expect(nativeAdd(-2453, -(-2453))).assertEqual(0);
      expect(nativeAdd(-2385, -68) < -68).assertTrue();
      expect(nativeAdd(-2385, 0)).assertEqual(-2385);
      expect(nativeAdd(-2385, -68) - -68).assertEqual(-2385);
      expect(sum - -2385).assertEqual(-68);
      }
      {
      const sum: number = nativeAdd(-2426, -39);
      logCase('testNativeSigned0060', `sum=${sum}`);
      expect(sum).assertEqual(-2465);
      expect(nativeAdd(-39, -2426)).assertEqual(-2465);
      expect(nativeAdd(-2465, -(-39))).assertEqual(-2426);
      expect(nativeAdd(-2465, -(-2426))).assertEqual(-39);
      expect(nativeAdd(-2465, -(-2465))).assertEqual(0);
      expect(nativeAdd(-2426, -39) < -39).assertTrue();
      expect(nativeAdd(-2426, 0)).assertEqual(-2426);
      expect(nativeAdd(-2426, -39) - -39).assertEqual(-2426);
      expect(sum - -2426).assertEqual(-39);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0061
     * @tc.name      testNativeSigned0061
     * @tc.desc      Add signed values -2467 and -10 and expect -2477
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-2467, -10);
      logCase('testNativeSigned0061', `sum=${sum}`);
      expect(sum).assertEqual(-2477);
      expect(nativeAdd(-10, -2467)).assertEqual(-2477);
      expect(nativeAdd(-2477, -(-10))).assertEqual(-2467);
      expect(nativeAdd(-2477, -(-2467))).assertEqual(-10);
      expect(nativeAdd(-2477, -(-2477))).assertEqual(0);
      expect(nativeAdd(-2467, -10) < -10).assertTrue();
      expect(nativeAdd(-2467, 0)).assertEqual(-2467);
      expect(nativeAdd(-2467, -10) - -10).assertEqual(-2467);
      expect(sum - -2467).assertEqual(-10);
      {
      const sum: number = nativeAdd(-2508, 19);
      logCase('testNativeSigned0062', `sum=${sum}`);
      expect(sum).assertEqual(-2489);
      expect(nativeAdd(19, -2508)).assertEqual(-2489);
      expect(nativeAdd(-2489, -(19))).assertEqual(-2508);
      expect(nativeAdd(-2489, -(-2508))).assertEqual(19);
      expect(nativeAdd(-2489, -(-2489))).assertEqual(0);
      expect(nativeAdd(-2508, 19) < 19).assertTrue();
      expect(nativeAdd(-2508, 0)).assertEqual(-2508);
      expect(nativeAdd(-2508, 19) - 19).assertEqual(-2508);
      expect(sum - -2508).assertEqual(19);
      }
      {
      const sum: number = nativeAdd(-2549, 48);
      logCase('testNativeSigned0063', `sum=${sum}`);
      expect(sum).assertEqual(-2501);
      expect(nativeAdd(48, -2549)).assertEqual(-2501);
      expect(nativeAdd(-2501, -(48))).assertEqual(-2549);
      expect(nativeAdd(-2501, -(-2549))).assertEqual(48);
      expect(nativeAdd(-2501, -(-2501))).assertEqual(0);
      expect(nativeAdd(-2549, 48) < 48).assertTrue();
      expect(nativeAdd(-2549, 0)).assertEqual(-2549);
      expect(nativeAdd(-2549, 48) - 48).assertEqual(-2549);
      expect(sum - -2549).assertEqual(48);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0064
     * @tc.name      testNativeSigned0064
     * @tc.desc      Add signed values -2590 and 77 and expect -2513
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-2590, 77);
      logCase('testNativeSigned0064', `sum=${sum}`);
      expect(sum).assertEqual(-2513);
      expect(nativeAdd(77, -2590)).assertEqual(-2513);
      expect(nativeAdd(-2513, -(77))).assertEqual(-2590);
      expect(nativeAdd(-2513, -(-2590))).assertEqual(77);
      expect(nativeAdd(-2513, -(-2513))).assertEqual(0);
      expect(nativeAdd(-2590, 77) < 77).assertTrue();
      expect(nativeAdd(-2590, 0)).assertEqual(-2590);
      expect(nativeAdd(-2590, 77) - 77).assertEqual(-2590);
      expect(sum - -2590).assertEqual(77);
      {
      const sum: number = nativeAdd(-2631, 106);
      logCase('testNativeSigned0065', `sum=${sum}`);
      expect(sum).assertEqual(-2525);
      expect(nativeAdd(106, -2631)).assertEqual(-2525);
      expect(nativeAdd(-2525, -(106))).assertEqual(-2631);
      expect(nativeAdd(-2525, -(-2631))).assertEqual(106);
      expect(nativeAdd(-2525, -(-2525))).assertEqual(0);
      expect(nativeAdd(-2631, 106) < 106).assertTrue();
      expect(nativeAdd(-2631, 0)).assertEqual(-2631);
      expect(nativeAdd(-2631, 106) - 106).assertEqual(-2631);
      expect(sum - -2631).assertEqual(106);
      }
      {
      const sum: number = nativeAdd(-2672, 135);
      logCase('testNativeSigned0066', `sum=${sum}`);
      expect(sum).assertEqual(-2537);
      expect(nativeAdd(135, -2672)).assertEqual(-2537);
      expect(nativeAdd(-2537, -(135))).assertEqual(-2672);
      expect(nativeAdd(-2537, -(-2672))).assertEqual(135);
      expect(nativeAdd(-2537, -(-2537))).assertEqual(0);
      expect(nativeAdd(-2672, 135) < 135).assertTrue();
      expect(nativeAdd(-2672, 0)).assertEqual(-2672);
      expect(nativeAdd(-2672, 135) - 135).assertEqual(-2672);
      expect(sum - -2672).assertEqual(135);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0067
     * @tc.name      testNativeSigned0067
     * @tc.desc      Add signed values -2713 and 164 and expect -2549
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-2713, 164);
      logCase('testNativeSigned0067', `sum=${sum}`);
      expect(sum).assertEqual(-2549);
      expect(nativeAdd(164, -2713)).assertEqual(-2549);
      expect(nativeAdd(-2549, -(164))).assertEqual(-2713);
      expect(nativeAdd(-2549, -(-2713))).assertEqual(164);
      expect(nativeAdd(-2549, -(-2549))).assertEqual(0);
      expect(nativeAdd(-2713, 164) < 164).assertTrue();
      expect(nativeAdd(-2713, 0)).assertEqual(-2713);
      expect(nativeAdd(-2713, 164) - 164).assertEqual(-2713);
      expect(sum - -2713).assertEqual(164);
      {
      const sum: number = nativeAdd(-2754, 193);
      logCase('testNativeSigned0068', `sum=${sum}`);
      expect(sum).assertEqual(-2561);
      expect(nativeAdd(193, -2754)).assertEqual(-2561);
      expect(nativeAdd(-2561, -(193))).assertEqual(-2754);
      expect(nativeAdd(-2561, -(-2754))).assertEqual(193);
      expect(nativeAdd(-2561, -(-2561))).assertEqual(0);
      expect(nativeAdd(-2754, 193) < 193).assertTrue();
      expect(nativeAdd(-2754, 0)).assertEqual(-2754);
      expect(nativeAdd(-2754, 193) - 193).assertEqual(-2754);
      expect(sum - -2754).assertEqual(193);
      }
      {
      const sum: number = nativeAdd(-2795, 222);
      logCase('testNativeSigned0069', `sum=${sum}`);
      expect(sum).assertEqual(-2573);
      expect(nativeAdd(222, -2795)).assertEqual(-2573);
      expect(nativeAdd(-2573, -(222))).assertEqual(-2795);
      expect(nativeAdd(-2573, -(-2795))).assertEqual(222);
      expect(nativeAdd(-2573, -(-2573))).assertEqual(0);
      expect(nativeAdd(-2795, 222) < 222).assertTrue();
      expect(nativeAdd(-2795, 0)).assertEqual(-2795);
      expect(nativeAdd(-2795, 222) - 222).assertEqual(-2795);
      expect(sum - -2795).assertEqual(222);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0070
     * @tc.name      testNativeSigned0070
     * @tc.desc      Add signed values -2836 and -249 and expect -3085
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-2836, -249);
      logCase('testNativeSigned0070', `sum=${sum}`);
      expect(sum).assertEqual(-3085);
      expect(nativeAdd(-249, -2836)).assertEqual(-3085);
      expect(nativeAdd(-3085, -(-249))).assertEqual(-2836);
      expect(nativeAdd(-3085, -(-2836))).assertEqual(-249);
      expect(nativeAdd(-3085, -(-3085))).assertEqual(0);
      expect(nativeAdd(-2836, -249) < -249).assertTrue();
      expect(nativeAdd(-2836, 0)).assertEqual(-2836);
      expect(nativeAdd(-2836, -249) - -249).assertEqual(-2836);
      expect(sum - -2836).assertEqual(-249);
      {
      const sum: number = nativeAdd(-2877, -220);
      logCase('testNativeSigned0071', `sum=${sum}`);
      expect(sum).assertEqual(-3097);
      expect(nativeAdd(-220, -2877)).assertEqual(-3097);
      expect(nativeAdd(-3097, -(-220))).assertEqual(-2877);
      expect(nativeAdd(-3097, -(-2877))).assertEqual(-220);
      expect(nativeAdd(-3097, -(-3097))).assertEqual(0);
      expect(nativeAdd(-2877, -220) < -220).assertTrue();
      expect(nativeAdd(-2877, 0)).assertEqual(-2877);
      expect(nativeAdd(-2877, -220) - -220).assertEqual(-2877);
      expect(sum - -2877).assertEqual(-220);
      }
      {
      const sum: number = nativeAdd(-2918, -191);
      logCase('testNativeSigned0072', `sum=${sum}`);
      expect(sum).assertEqual(-3109);
      expect(nativeAdd(-191, -2918)).assertEqual(-3109);
      expect(nativeAdd(-3109, -(-191))).assertEqual(-2918);
      expect(nativeAdd(-3109, -(-2918))).assertEqual(-191);
      expect(nativeAdd(-3109, -(-3109))).assertEqual(0);
      expect(nativeAdd(-2918, -191) < -191).assertTrue();
      expect(nativeAdd(-2918, 0)).assertEqual(-2918);
      expect(nativeAdd(-2918, -191) - -191).assertEqual(-2918);
      expect(sum - -2918).assertEqual(-191);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0073
     * @tc.name      testNativeSigned0073
     * @tc.desc      Add signed values -2959 and -162 and expect -3121
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-2959, -162);
      logCase('testNativeSigned0073', `sum=${sum}`);
      expect(sum).assertEqual(-3121);
      expect(nativeAdd(-162, -2959)).assertEqual(-3121);
      expect(nativeAdd(-3121, -(-162))).assertEqual(-2959);
      expect(nativeAdd(-3121, -(-2959))).assertEqual(-162);
      expect(nativeAdd(-3121, -(-3121))).assertEqual(0);
      expect(nativeAdd(-2959, -162) < -162).assertTrue();
      expect(nativeAdd(-2959, 0)).assertEqual(-2959);
      expect(nativeAdd(-2959, -162) - -162).assertEqual(-2959);
      expect(sum - -2959).assertEqual(-162);
      {
      const sum: number = nativeAdd(-3000, -133);
      logCase('testNativeSigned0074', `sum=${sum}`);
      expect(sum).assertEqual(-3133);
      expect(nativeAdd(-133, -3000)).assertEqual(-3133);
      expect(nativeAdd(-3133, -(-133))).assertEqual(-3000);
      expect(nativeAdd(-3133, -(-3000))).assertEqual(-133);
      expect(nativeAdd(-3133, -(-3133))).assertEqual(0);
      expect(nativeAdd(-3000, -133) < -133).assertTrue();
      expect(nativeAdd(-3000, 0)).assertEqual(-3000);
      expect(nativeAdd(-3000, -133) - -133).assertEqual(-3000);
      expect(sum - -3000).assertEqual(-133);
      }
      {
      const sum: number = nativeAdd(-3041, -104);
      logCase('testNativeSigned0075', `sum=${sum}`);
      expect(sum).assertEqual(-3145);
      expect(nativeAdd(-104, -3041)).assertEqual(-3145);
      expect(nativeAdd(-3145, -(-104))).assertEqual(-3041);
      expect(nativeAdd(-3145, -(-3041))).assertEqual(-104);
      expect(nativeAdd(-3145, -(-3145))).assertEqual(0);
      expect(nativeAdd(-3041, -104) < -104).assertTrue();
      expect(nativeAdd(-3041, 0)).assertEqual(-3041);
      expect(nativeAdd(-3041, -104) - -104).assertEqual(-3041);
      expect(sum - -3041).assertEqual(-104);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0076
     * @tc.name      testNativeSigned0076
     * @tc.desc      Add signed values -3082 and -75 and expect -3157
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-3082, -75);
      logCase('testNativeSigned0076', `sum=${sum}`);
      expect(sum).assertEqual(-3157);
      expect(nativeAdd(-75, -3082)).assertEqual(-3157);
      expect(nativeAdd(-3157, -(-75))).assertEqual(-3082);
      expect(nativeAdd(-3157, -(-3082))).assertEqual(-75);
      expect(nativeAdd(-3157, -(-3157))).assertEqual(0);
      expect(nativeAdd(-3082, -75) < -75).assertTrue();
      expect(nativeAdd(-3082, 0)).assertEqual(-3082);
      expect(nativeAdd(-3082, -75) - -75).assertEqual(-3082);
      expect(sum - -3082).assertEqual(-75);
      {
      const sum: number = nativeAdd(-3123, -46);
      logCase('testNativeSigned0077', `sum=${sum}`);
      expect(sum).assertEqual(-3169);
      expect(nativeAdd(-46, -3123)).assertEqual(-3169);
      expect(nativeAdd(-3169, -(-46))).assertEqual(-3123);
      expect(nativeAdd(-3169, -(-3123))).assertEqual(-46);
      expect(nativeAdd(-3169, -(-3169))).assertEqual(0);
      expect(nativeAdd(-3123, -46) < -46).assertTrue();
      expect(nativeAdd(-3123, 0)).assertEqual(-3123);
      expect(nativeAdd(-3123, -46) - -46).assertEqual(-3123);
      expect(sum - -3123).assertEqual(-46);
      }
      {
      const sum: number = nativeAdd(-3164, -17);
      logCase('testNativeSigned0078', `sum=${sum}`);
      expect(sum).assertEqual(-3181);
      expect(nativeAdd(-17, -3164)).assertEqual(-3181);
      expect(nativeAdd(-3181, -(-17))).assertEqual(-3164);
      expect(nativeAdd(-3181, -(-3164))).assertEqual(-17);
      expect(nativeAdd(-3181, -(-3181))).assertEqual(0);
      expect(nativeAdd(-3164, -17) < -17).assertTrue();
      expect(nativeAdd(-3164, 0)).assertEqual(-3164);
      expect(nativeAdd(-3164, -17) - -17).assertEqual(-3164);
      expect(sum - -3164).assertEqual(-17);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0079
     * @tc.name      testNativeSigned0079
     * @tc.desc      Add signed values -3205 and 12 and expect -3193
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-3205, 12);
      logCase('testNativeSigned0079', `sum=${sum}`);
      expect(sum).assertEqual(-3193);
      expect(nativeAdd(12, -3205)).assertEqual(-3193);
      expect(nativeAdd(-3193, -(12))).assertEqual(-3205);
      expect(nativeAdd(-3193, -(-3205))).assertEqual(12);
      expect(nativeAdd(-3193, -(-3193))).assertEqual(0);
      expect(nativeAdd(-3205, 12) < 12).assertTrue();
      expect(nativeAdd(-3205, 0)).assertEqual(-3205);
      expect(nativeAdd(-3205, 12) - 12).assertEqual(-3205);
      expect(sum - -3205).assertEqual(12);
      {
      const sum: number = nativeAdd(-3246, 41);
      logCase('testNativeSigned0080', `sum=${sum}`);
      expect(sum).assertEqual(-3205);
      expect(nativeAdd(41, -3246)).assertEqual(-3205);
      expect(nativeAdd(-3205, -(41))).assertEqual(-3246);
      expect(nativeAdd(-3205, -(-3246))).assertEqual(41);
      expect(nativeAdd(-3205, -(-3205))).assertEqual(0);
      expect(nativeAdd(-3246, 41) < 41).assertTrue();
      expect(nativeAdd(-3246, 0)).assertEqual(-3246);
      expect(nativeAdd(-3246, 41) - 41).assertEqual(-3246);
      expect(sum - -3246).assertEqual(41);
      }
      {
      const sum: number = nativeAdd(-3287, 70);
      logCase('testNativeSigned0081', `sum=${sum}`);
      expect(sum).assertEqual(-3217);
      expect(nativeAdd(70, -3287)).assertEqual(-3217);
      expect(nativeAdd(-3217, -(70))).assertEqual(-3287);
      expect(nativeAdd(-3217, -(-3287))).assertEqual(70);
      expect(nativeAdd(-3217, -(-3217))).assertEqual(0);
      expect(nativeAdd(-3287, 70) < 70).assertTrue();
      expect(nativeAdd(-3287, 0)).assertEqual(-3287);
      expect(nativeAdd(-3287, 70) - 70).assertEqual(-3287);
      expect(sum - -3287).assertEqual(70);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0082
     * @tc.name      testNativeSigned0082
     * @tc.desc      Add signed values -3328 and 99 and expect -3229
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-3328, 99);
      logCase('testNativeSigned0082', `sum=${sum}`);
      expect(sum).assertEqual(-3229);
      expect(nativeAdd(99, -3328)).assertEqual(-3229);
      expect(nativeAdd(-3229, -(99))).assertEqual(-3328);
      expect(nativeAdd(-3229, -(-3328))).assertEqual(99);
      expect(nativeAdd(-3229, -(-3229))).assertEqual(0);
      expect(nativeAdd(-3328, 99) < 99).assertTrue();
      expect(nativeAdd(-3328, 0)).assertEqual(-3328);
      expect(nativeAdd(-3328, 99) - 99).assertEqual(-3328);
      expect(sum - -3328).assertEqual(99);
      {
      const sum: number = nativeAdd(-3369, 128);
      logCase('testNativeSigned0083', `sum=${sum}`);
      expect(sum).assertEqual(-3241);
      expect(nativeAdd(128, -3369)).assertEqual(-3241);
      expect(nativeAdd(-3241, -(128))).assertEqual(-3369);
      expect(nativeAdd(-3241, -(-3369))).assertEqual(128);
      expect(nativeAdd(-3241, -(-3241))).assertEqual(0);
      expect(nativeAdd(-3369, 128) < 128).assertTrue();
      expect(nativeAdd(-3369, 0)).assertEqual(-3369);
      expect(nativeAdd(-3369, 128) - 128).assertEqual(-3369);
      expect(sum - -3369).assertEqual(128);
      }
      {
      const sum: number = nativeAdd(-3410, 157);
      logCase('testNativeSigned0084', `sum=${sum}`);
      expect(sum).assertEqual(-3253);
      expect(nativeAdd(157, -3410)).assertEqual(-3253);
      expect(nativeAdd(-3253, -(157))).assertEqual(-3410);
      expect(nativeAdd(-3253, -(-3410))).assertEqual(157);
      expect(nativeAdd(-3253, -(-3253))).assertEqual(0);
      expect(nativeAdd(-3410, 157) < 157).assertTrue();
      expect(nativeAdd(-3410, 0)).assertEqual(-3410);
      expect(nativeAdd(-3410, 157) - 157).assertEqual(-3410);
      expect(sum - -3410).assertEqual(157);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0085
     * @tc.name      testNativeSigned0085
     * @tc.desc      Add signed values -3451 and 186 and expect -3265
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-3451, 186);
      logCase('testNativeSigned0085', `sum=${sum}`);
      expect(sum).assertEqual(-3265);
      expect(nativeAdd(186, -3451)).assertEqual(-3265);
      expect(nativeAdd(-3265, -(186))).assertEqual(-3451);
      expect(nativeAdd(-3265, -(-3451))).assertEqual(186);
      expect(nativeAdd(-3265, -(-3265))).assertEqual(0);
      expect(nativeAdd(-3451, 186) < 186).assertTrue();
      expect(nativeAdd(-3451, 0)).assertEqual(-3451);
      expect(nativeAdd(-3451, 186) - 186).assertEqual(-3451);
      expect(sum - -3451).assertEqual(186);
      {
      const sum: number = nativeAdd(-3492, 215);
      logCase('testNativeSigned0086', `sum=${sum}`);
      expect(sum).assertEqual(-3277);
      expect(nativeAdd(215, -3492)).assertEqual(-3277);
      expect(nativeAdd(-3277, -(215))).assertEqual(-3492);
      expect(nativeAdd(-3277, -(-3492))).assertEqual(215);
      expect(nativeAdd(-3277, -(-3277))).assertEqual(0);
      expect(nativeAdd(-3492, 215) < 215).assertTrue();
      expect(nativeAdd(-3492, 0)).assertEqual(-3492);
      expect(nativeAdd(-3492, 215) - 215).assertEqual(-3492);
      expect(sum - -3492).assertEqual(215);
      }
      {
      const sum: number = nativeAdd(-3533, 244);
      logCase('testNativeSigned0087', `sum=${sum}`);
      expect(sum).assertEqual(-3289);
      expect(nativeAdd(244, -3533)).assertEqual(-3289);
      expect(nativeAdd(-3289, -(244))).assertEqual(-3533);
      expect(nativeAdd(-3289, -(-3533))).assertEqual(244);
      expect(nativeAdd(-3289, -(-3289))).assertEqual(0);
      expect(nativeAdd(-3533, 244) < 244).assertTrue();
      expect(nativeAdd(-3533, 0)).assertEqual(-3533);
      expect(nativeAdd(-3533, 244) - 244).assertEqual(-3533);
      expect(sum - -3533).assertEqual(244);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0088
     * @tc.name      testNativeSigned0088
     * @tc.desc      Add signed values -3574 and -227 and expect -3801
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-3574, -227);
      logCase('testNativeSigned0088', `sum=${sum}`);
      expect(sum).assertEqual(-3801);
      expect(nativeAdd(-227, -3574)).assertEqual(-3801);
      expect(nativeAdd(-3801, -(-227))).assertEqual(-3574);
      expect(nativeAdd(-3801, -(-3574))).assertEqual(-227);
      expect(nativeAdd(-3801, -(-3801))).assertEqual(0);
      expect(nativeAdd(-3574, -227) < -227).assertTrue();
      expect(nativeAdd(-3574, 0)).assertEqual(-3574);
      expect(nativeAdd(-3574, -227) - -227).assertEqual(-3574);
      expect(sum - -3574).assertEqual(-227);
      {
      const sum: number = nativeAdd(-3615, -198);
      logCase('testNativeSigned0089', `sum=${sum}`);
      expect(sum).assertEqual(-3813);
      expect(nativeAdd(-198, -3615)).assertEqual(-3813);
      expect(nativeAdd(-3813, -(-198))).assertEqual(-3615);
      expect(nativeAdd(-3813, -(-3615))).assertEqual(-198);
      expect(nativeAdd(-3813, -(-3813))).assertEqual(0);
      expect(nativeAdd(-3615, -198) < -198).assertTrue();
      expect(nativeAdd(-3615, 0)).assertEqual(-3615);
      expect(nativeAdd(-3615, -198) - -198).assertEqual(-3615);
      expect(sum - -3615).assertEqual(-198);
      }
      {
      const sum: number = nativeAdd(-3656, -169);
      logCase('testNativeSigned0090', `sum=${sum}`);
      expect(sum).assertEqual(-3825);
      expect(nativeAdd(-169, -3656)).assertEqual(-3825);
      expect(nativeAdd(-3825, -(-169))).assertEqual(-3656);
      expect(nativeAdd(-3825, -(-3656))).assertEqual(-169);
      expect(nativeAdd(-3825, -(-3825))).assertEqual(0);
      expect(nativeAdd(-3656, -169) < -169).assertTrue();
      expect(nativeAdd(-3656, 0)).assertEqual(-3656);
      expect(nativeAdd(-3656, -169) - -169).assertEqual(-3656);
      expect(sum - -3656).assertEqual(-169);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0091
     * @tc.name      testNativeSigned0091
     * @tc.desc      Add signed values -3697 and -140 and expect -3837
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-3697, -140);
      logCase('testNativeSigned0091', `sum=${sum}`);
      expect(sum).assertEqual(-3837);
      expect(nativeAdd(-140, -3697)).assertEqual(-3837);
      expect(nativeAdd(-3837, -(-140))).assertEqual(-3697);
      expect(nativeAdd(-3837, -(-3697))).assertEqual(-140);
      expect(nativeAdd(-3837, -(-3837))).assertEqual(0);
      expect(nativeAdd(-3697, -140) < -140).assertTrue();
      expect(nativeAdd(-3697, 0)).assertEqual(-3697);
      expect(nativeAdd(-3697, -140) - -140).assertEqual(-3697);
      expect(sum - -3697).assertEqual(-140);
      {
      const sum: number = nativeAdd(-3738, -111);
      logCase('testNativeSigned0092', `sum=${sum}`);
      expect(sum).assertEqual(-3849);
      expect(nativeAdd(-111, -3738)).assertEqual(-3849);
      expect(nativeAdd(-3849, -(-111))).assertEqual(-3738);
      expect(nativeAdd(-3849, -(-3738))).assertEqual(-111);
      expect(nativeAdd(-3849, -(-3849))).assertEqual(0);
      expect(nativeAdd(-3738, -111) < -111).assertTrue();
      expect(nativeAdd(-3738, 0)).assertEqual(-3738);
      expect(nativeAdd(-3738, -111) - -111).assertEqual(-3738);
      expect(sum - -3738).assertEqual(-111);
      }
      {
      const sum: number = nativeAdd(-3779, -82);
      logCase('testNativeSigned0093', `sum=${sum}`);
      expect(sum).assertEqual(-3861);
      expect(nativeAdd(-82, -3779)).assertEqual(-3861);
      expect(nativeAdd(-3861, -(-82))).assertEqual(-3779);
      expect(nativeAdd(-3861, -(-3779))).assertEqual(-82);
      expect(nativeAdd(-3861, -(-3861))).assertEqual(0);
      expect(nativeAdd(-3779, -82) < -82).assertTrue();
      expect(nativeAdd(-3779, 0)).assertEqual(-3779);
      expect(nativeAdd(-3779, -82) - -82).assertEqual(-3779);
      expect(sum - -3779).assertEqual(-82);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0094
     * @tc.name      testNativeSigned0094
     * @tc.desc      Add signed values -3820 and -53 and expect -3873
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-3820, -53);
      logCase('testNativeSigned0094', `sum=${sum}`);
      expect(sum).assertEqual(-3873);
      expect(nativeAdd(-53, -3820)).assertEqual(-3873);
      expect(nativeAdd(-3873, -(-53))).assertEqual(-3820);
      expect(nativeAdd(-3873, -(-3820))).assertEqual(-53);
      expect(nativeAdd(-3873, -(-3873))).assertEqual(0);
      expect(nativeAdd(-3820, -53) < -53).assertTrue();
      expect(nativeAdd(-3820, 0)).assertEqual(-3820);
      expect(nativeAdd(-3820, -53) - -53).assertEqual(-3820);
      expect(sum - -3820).assertEqual(-53);
      {
      const sum: number = nativeAdd(-3861, -24);
      logCase('testNativeSigned0095', `sum=${sum}`);
      expect(sum).assertEqual(-3885);
      expect(nativeAdd(-24, -3861)).assertEqual(-3885);
      expect(nativeAdd(-3885, -(-24))).assertEqual(-3861);
      expect(nativeAdd(-3885, -(-3861))).assertEqual(-24);
      expect(nativeAdd(-3885, -(-3885))).assertEqual(0);
      expect(nativeAdd(-3861, -24) < -24).assertTrue();
      expect(nativeAdd(-3861, 0)).assertEqual(-3861);
      expect(nativeAdd(-3861, -24) - -24).assertEqual(-3861);
      expect(sum - -3861).assertEqual(-24);
      }
      {
      const sum: number = nativeAdd(-3902, 5);
      logCase('testNativeSigned0096', `sum=${sum}`);
      expect(sum).assertEqual(-3897);
      expect(nativeAdd(5, -3902)).assertEqual(-3897);
      expect(nativeAdd(-3897, -(5))).assertEqual(-3902);
      expect(nativeAdd(-3897, -(-3902))).assertEqual(5);
      expect(nativeAdd(-3897, -(-3897))).assertEqual(0);
      expect(nativeAdd(-3902, 5) < 5).assertTrue();
      expect(nativeAdd(-3902, 0)).assertEqual(-3902);
      expect(nativeAdd(-3902, 5) - 5).assertEqual(-3902);
      expect(sum - -3902).assertEqual(5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0097
     * @tc.name      testNativeSigned0097
     * @tc.desc      Add signed values -3943 and 34 and expect -3909
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-3943, 34);
      logCase('testNativeSigned0097', `sum=${sum}`);
      expect(sum).assertEqual(-3909);
      expect(nativeAdd(34, -3943)).assertEqual(-3909);
      expect(nativeAdd(-3909, -(34))).assertEqual(-3943);
      expect(nativeAdd(-3909, -(-3943))).assertEqual(34);
      expect(nativeAdd(-3909, -(-3909))).assertEqual(0);
      expect(nativeAdd(-3943, 34) < 34).assertTrue();
      expect(nativeAdd(-3943, 0)).assertEqual(-3943);
      expect(nativeAdd(-3943, 34) - 34).assertEqual(-3943);
      expect(sum - -3943).assertEqual(34);
      {
      const sum: number = nativeAdd(-3984, 63);
      logCase('testNativeSigned0098', `sum=${sum}`);
      expect(sum).assertEqual(-3921);
      expect(nativeAdd(63, -3984)).assertEqual(-3921);
      expect(nativeAdd(-3921, -(63))).assertEqual(-3984);
      expect(nativeAdd(-3921, -(-3984))).assertEqual(63);
      expect(nativeAdd(-3921, -(-3921))).assertEqual(0);
      expect(nativeAdd(-3984, 63) < 63).assertTrue();
      expect(nativeAdd(-3984, 0)).assertEqual(-3984);
      expect(nativeAdd(-3984, 63) - 63).assertEqual(-3984);
      expect(sum - -3984).assertEqual(63);
      }
      {
      const sum: number = nativeAdd(-4025, 92);
      logCase('testNativeSigned0099', `sum=${sum}`);
      expect(sum).assertEqual(-3933);
      expect(nativeAdd(92, -4025)).assertEqual(-3933);
      expect(nativeAdd(-3933, -(92))).assertEqual(-4025);
      expect(nativeAdd(-3933, -(-4025))).assertEqual(92);
      expect(nativeAdd(-3933, -(-3933))).assertEqual(0);
      expect(nativeAdd(-4025, 92) < 92).assertTrue();
      expect(nativeAdd(-4025, 0)).assertEqual(-4025);
      expect(nativeAdd(-4025, 92) - 92).assertEqual(-4025);
      expect(sum - -4025).assertEqual(92);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0100
     * @tc.name      testNativeSigned0100
     * @tc.desc      Add signed values -4066 and 121 and expect -3945
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-4066, 121);
      logCase('testNativeSigned0100', `sum=${sum}`);
      expect(sum).assertEqual(-3945);
      expect(nativeAdd(121, -4066)).assertEqual(-3945);
      expect(nativeAdd(-3945, -(121))).assertEqual(-4066);
      expect(nativeAdd(-3945, -(-4066))).assertEqual(121);
      expect(nativeAdd(-3945, -(-3945))).assertEqual(0);
      expect(nativeAdd(-4066, 121) < 121).assertTrue();
      expect(nativeAdd(-4066, 0)).assertEqual(-4066);
      expect(nativeAdd(-4066, 121) - 121).assertEqual(-4066);
      expect(sum - -4066).assertEqual(121);
      {
      const sum: number = nativeAdd(-4107, 150);
      logCase('testNativeSigned0101', `sum=${sum}`);
      expect(sum).assertEqual(-3957);
      expect(nativeAdd(150, -4107)).assertEqual(-3957);
      expect(nativeAdd(-3957, -(150))).assertEqual(-4107);
      expect(nativeAdd(-3957, -(-4107))).assertEqual(150);
      expect(nativeAdd(-3957, -(-3957))).assertEqual(0);
      expect(nativeAdd(-4107, 150) < 150).assertTrue();
      expect(nativeAdd(-4107, 0)).assertEqual(-4107);
      expect(nativeAdd(-4107, 150) - 150).assertEqual(-4107);
      expect(sum - -4107).assertEqual(150);
      }
      {
      const sum: number = nativeAdd(-4148, 179);
      logCase('testNativeSigned0102', `sum=${sum}`);
      expect(sum).assertEqual(-3969);
      expect(nativeAdd(179, -4148)).assertEqual(-3969);
      expect(nativeAdd(-3969, -(179))).assertEqual(-4148);
      expect(nativeAdd(-3969, -(-4148))).assertEqual(179);
      expect(nativeAdd(-3969, -(-3969))).assertEqual(0);
      expect(nativeAdd(-4148, 179) < 179).assertTrue();
      expect(nativeAdd(-4148, 0)).assertEqual(-4148);
      expect(nativeAdd(-4148, 179) - 179).assertEqual(-4148);
      expect(sum - -4148).assertEqual(179);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0103
     * @tc.name      testNativeSigned0103
     * @tc.desc      Add signed values -4189 and 208 and expect -3981
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-4189, 208);
      logCase('testNativeSigned0103', `sum=${sum}`);
      expect(sum).assertEqual(-3981);
      expect(nativeAdd(208, -4189)).assertEqual(-3981);
      expect(nativeAdd(-3981, -(208))).assertEqual(-4189);
      expect(nativeAdd(-3981, -(-4189))).assertEqual(208);
      expect(nativeAdd(-3981, -(-3981))).assertEqual(0);
      expect(nativeAdd(-4189, 208) < 208).assertTrue();
      expect(nativeAdd(-4189, 0)).assertEqual(-4189);
      expect(nativeAdd(-4189, 208) - 208).assertEqual(-4189);
      expect(sum - -4189).assertEqual(208);
      {
      const sum: number = nativeAdd(-4230, 237);
      logCase('testNativeSigned0104', `sum=${sum}`);
      expect(sum).assertEqual(-3993);
      expect(nativeAdd(237, -4230)).assertEqual(-3993);
      expect(nativeAdd(-3993, -(237))).assertEqual(-4230);
      expect(nativeAdd(-3993, -(-4230))).assertEqual(237);
      expect(nativeAdd(-3993, -(-3993))).assertEqual(0);
      expect(nativeAdd(-4230, 237) < 237).assertTrue();
      expect(nativeAdd(-4230, 0)).assertEqual(-4230);
      expect(nativeAdd(-4230, 237) - 237).assertEqual(-4230);
      expect(sum - -4230).assertEqual(237);
      }
      {
      const sum: number = nativeAdd(-4271, -234);
      logCase('testNativeSigned0105', `sum=${sum}`);
      expect(sum).assertEqual(-4505);
      expect(nativeAdd(-234, -4271)).assertEqual(-4505);
      expect(nativeAdd(-4505, -(-234))).assertEqual(-4271);
      expect(nativeAdd(-4505, -(-4271))).assertEqual(-234);
      expect(nativeAdd(-4505, -(-4505))).assertEqual(0);
      expect(nativeAdd(-4271, -234) < -234).assertTrue();
      expect(nativeAdd(-4271, 0)).assertEqual(-4271);
      expect(nativeAdd(-4271, -234) - -234).assertEqual(-4271);
      expect(sum - -4271).assertEqual(-234);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0106
     * @tc.name      testNativeSigned0106
     * @tc.desc      Add signed values -4312 and -205 and expect -4517
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-4312, -205);
      logCase('testNativeSigned0106', `sum=${sum}`);
      expect(sum).assertEqual(-4517);
      expect(nativeAdd(-205, -4312)).assertEqual(-4517);
      expect(nativeAdd(-4517, -(-205))).assertEqual(-4312);
      expect(nativeAdd(-4517, -(-4312))).assertEqual(-205);
      expect(nativeAdd(-4517, -(-4517))).assertEqual(0);
      expect(nativeAdd(-4312, -205) < -205).assertTrue();
      expect(nativeAdd(-4312, 0)).assertEqual(-4312);
      expect(nativeAdd(-4312, -205) - -205).assertEqual(-4312);
      expect(sum - -4312).assertEqual(-205);
      {
      const sum: number = nativeAdd(-4353, -176);
      logCase('testNativeSigned0107', `sum=${sum}`);
      expect(sum).assertEqual(-4529);
      expect(nativeAdd(-176, -4353)).assertEqual(-4529);
      expect(nativeAdd(-4529, -(-176))).assertEqual(-4353);
      expect(nativeAdd(-4529, -(-4353))).assertEqual(-176);
      expect(nativeAdd(-4529, -(-4529))).assertEqual(0);
      expect(nativeAdd(-4353, -176) < -176).assertTrue();
      expect(nativeAdd(-4353, 0)).assertEqual(-4353);
      expect(nativeAdd(-4353, -176) - -176).assertEqual(-4353);
      expect(sum - -4353).assertEqual(-176);
      }
      {
      const sum: number = nativeAdd(-4394, -147);
      logCase('testNativeSigned0108', `sum=${sum}`);
      expect(sum).assertEqual(-4541);
      expect(nativeAdd(-147, -4394)).assertEqual(-4541);
      expect(nativeAdd(-4541, -(-147))).assertEqual(-4394);
      expect(nativeAdd(-4541, -(-4394))).assertEqual(-147);
      expect(nativeAdd(-4541, -(-4541))).assertEqual(0);
      expect(nativeAdd(-4394, -147) < -147).assertTrue();
      expect(nativeAdd(-4394, 0)).assertEqual(-4394);
      expect(nativeAdd(-4394, -147) - -147).assertEqual(-4394);
      expect(sum - -4394).assertEqual(-147);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0109
     * @tc.name      testNativeSigned0109
     * @tc.desc      Add signed values -4435 and -118 and expect -4553
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNativeSigned0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sum: number = nativeAdd(-4435, -118);
      logCase('testNativeSigned0109', `sum=${sum}`);
      expect(sum).assertEqual(-4553);
      expect(nativeAdd(-118, -4435)).assertEqual(-4553);
      expect(nativeAdd(-4553, -(-118))).assertEqual(-4435);
      expect(nativeAdd(-4553, -(-4435))).assertEqual(-118);
      expect(nativeAdd(-4553, -(-4553))).assertEqual(0);
      expect(nativeAdd(-4435, -118) < -118).assertTrue();
      expect(nativeAdd(-4435, 0)).assertEqual(-4435);
      expect(nativeAdd(-4435, -118) - -118).assertEqual(-4435);
      expect(sum - -4435).assertEqual(-118);
      {
      const sum: number = nativeAdd(-4476, -89);
      logCase('testNativeSigned0110', `sum=${sum}`);
      expect(sum).assertEqual(-4565);
      expect(nativeAdd(-89, -4476)).assertEqual(-4565);
      expect(nativeAdd(-4565, -(-89))).assertEqual(-4476);
      expect(nativeAdd(-4565, -(-4476))).assertEqual(-89);
      expect(nativeAdd(-4565, -(-4565))).assertEqual(0);
      expect(nativeAdd(-4476, -89) < -89).assertTrue();
      expect(nativeAdd(-4476, 0)).assertEqual(-4476);
      expect(nativeAdd(-4476, -89) - -89).assertEqual(-4476);
      expect(sum - -4476).assertEqual(-89);
      }
      {
      const sum: number = nativeAdd(-4517, -60);
      logCase('testNativeSigned0111', `sum=${sum}`);
      expect(sum).assertEqual(-4577);
      expect(nativeAdd(-60, -4517)).assertEqual(-4577);
      expect(nativeAdd(-4577, -(-60))).assertEqual(-4517);
      expect(nativeAdd(-4577, -(-4517))).assertEqual(-60);
      expect(nativeAdd(-4577, -(-4577))).assertEqual(0);
      expect(nativeAdd(-4517, -60) < -60).assertTrue();
      expect(nativeAdd(-4517, 0)).assertEqual(-4517);
      expect(nativeAdd(-4517, -60) - -60).assertEqual(-4517);
      expect(sum - -4517).assertEqual(-60);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0112
     * @tc.name      testNativeSigned0112
     * @tc.desc      Add signed values -4558 and -31 and expect -4589
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeSigned0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(-4558, -31);
      logCase('testNativeSigned0112', `sum=${sum}`);
      expect(sum).assertEqual(-4589);
      expect(nativeAdd(-31, -4558)).assertEqual(-4589);
      expect(nativeAdd(-4589, -(-31))).assertEqual(-4558);
      expect(nativeAdd(-4589, -(-4558))).assertEqual(-31);
      expect(nativeAdd(-4589, -(-4589))).assertEqual(0);
      expect(nativeAdd(-4558, -31) < -31).assertTrue();
      expect(nativeAdd(-4558, 0)).assertEqual(-4558);
      expect(nativeAdd(-4558, -31) - -31).assertEqual(-4558);
      expect(sum - -4558).assertEqual(-31);
      {
      const sum: number = nativeAdd(-4599, -2);
      logCase('testNativeSigned0113', `sum=${sum}`);
      expect(sum).assertEqual(-4601);
      expect(nativeAdd(-2, -4599)).assertEqual(-4601);
      expect(nativeAdd(-4601, -(-2))).assertEqual(-4599);
      expect(nativeAdd(-4601, -(-4599))).assertEqual(-2);
      expect(nativeAdd(-4601, -(-4601))).assertEqual(0);
      expect(nativeAdd(-4599, -2) < -2).assertTrue();
      expect(nativeAdd(-4599, 0)).assertEqual(-4599);
      expect(nativeAdd(-4599, -2) - -2).assertEqual(-4599);
      expect(sum - -4599).assertEqual(-2);
      }
      {
      const sum: number = nativeAdd(-4640, 27);
      logCase('testNativeSigned0114', `sum=${sum}`);
      expect(sum).assertEqual(-4613);
      expect(nativeAdd(27, -4640)).assertEqual(-4613);
      expect(nativeAdd(-4613, -(27))).assertEqual(-4640);
      expect(nativeAdd(-4613, -(-4640))).assertEqual(27);
      expect(nativeAdd(-4613, -(-4613))).assertEqual(0);
      expect(nativeAdd(-4640, 27) < 27).assertTrue();
      expect(nativeAdd(-4640, 0)).assertEqual(-4640);
      expect(nativeAdd(-4640, 27) - 27).assertEqual(-4640);
      expect(sum - -4640).assertEqual(27);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0115
     * @tc.name      testNativeSigned0115
     * @tc.desc      Add signed values -4681 and 56 and expect -4625
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeSigned0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(-4681, 56);
      logCase('testNativeSigned0115', `sum=${sum}`);
      expect(sum).assertEqual(-4625);
      expect(nativeAdd(56, -4681)).assertEqual(-4625);
      expect(nativeAdd(-4625, -(56))).assertEqual(-4681);
      expect(nativeAdd(-4625, -(-4681))).assertEqual(56);
      expect(nativeAdd(-4625, -(-4625))).assertEqual(0);
      expect(nativeAdd(-4681, 56) < 56).assertTrue();
      expect(nativeAdd(-4681, 0)).assertEqual(-4681);
      expect(nativeAdd(-4681, 56) - 56).assertEqual(-4681);
      expect(sum - -4681).assertEqual(56);
      {
      const sum: number = nativeAdd(-4722, 85);
      logCase('testNativeSigned0116', `sum=${sum}`);
      expect(sum).assertEqual(-4637);
      expect(nativeAdd(85, -4722)).assertEqual(-4637);
      expect(nativeAdd(-4637, -(85))).assertEqual(-4722);
      expect(nativeAdd(-4637, -(-4722))).assertEqual(85);
      expect(nativeAdd(-4637, -(-4637))).assertEqual(0);
      expect(nativeAdd(-4722, 85) < 85).assertTrue();
      expect(nativeAdd(-4722, 0)).assertEqual(-4722);
      expect(nativeAdd(-4722, 85) - 85).assertEqual(-4722);
      expect(sum - -4722).assertEqual(85);
      }
      {
      const sum: number = nativeAdd(-4763, 114);
      logCase('testNativeSigned0117', `sum=${sum}`);
      expect(sum).assertEqual(-4649);
      expect(nativeAdd(114, -4763)).assertEqual(-4649);
      expect(nativeAdd(-4649, -(114))).assertEqual(-4763);
      expect(nativeAdd(-4649, -(-4763))).assertEqual(114);
      expect(nativeAdd(-4649, -(-4649))).assertEqual(0);
      expect(nativeAdd(-4763, 114) < 114).assertTrue();
      expect(nativeAdd(-4763, 0)).assertEqual(-4763);
      expect(nativeAdd(-4763, 114) - 114).assertEqual(-4763);
      expect(sum - -4763).assertEqual(114);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0118
     * @tc.name      testNativeSigned0118
     * @tc.desc      Add signed values -4804 and 143 and expect -4661
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeSigned0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(-4804, 143);
      logCase('testNativeSigned0118', `sum=${sum}`);
      expect(sum).assertEqual(-4661);
      expect(nativeAdd(143, -4804)).assertEqual(-4661);
      expect(nativeAdd(-4661, -(143))).assertEqual(-4804);
      expect(nativeAdd(-4661, -(-4804))).assertEqual(143);
      expect(nativeAdd(-4661, -(-4661))).assertEqual(0);
      expect(nativeAdd(-4804, 143) < 143).assertTrue();
      expect(nativeAdd(-4804, 0)).assertEqual(-4804);
      expect(nativeAdd(-4804, 143) - 143).assertEqual(-4804);
      expect(sum - -4804).assertEqual(143);
      {
      const sum: number = nativeAdd(-4845, 172);
      logCase('testNativeSigned0119', `sum=${sum}`);
      expect(sum).assertEqual(-4673);
      expect(nativeAdd(172, -4845)).assertEqual(-4673);
      expect(nativeAdd(-4673, -(172))).assertEqual(-4845);
      expect(nativeAdd(-4673, -(-4845))).assertEqual(172);
      expect(nativeAdd(-4673, -(-4673))).assertEqual(0);
      expect(nativeAdd(-4845, 172) < 172).assertTrue();
      expect(nativeAdd(-4845, 0)).assertEqual(-4845);
      expect(nativeAdd(-4845, 172) - 172).assertEqual(-4845);
      expect(sum - -4845).assertEqual(172);
      }
      {
      const sum: number = nativeAdd(-4886, 201);
      logCase('testNativeSigned0120', `sum=${sum}`);
      expect(sum).assertEqual(-4685);
      expect(nativeAdd(201, -4886)).assertEqual(-4685);
      expect(nativeAdd(-4685, -(201))).assertEqual(-4886);
      expect(nativeAdd(-4685, -(-4886))).assertEqual(201);
      expect(nativeAdd(-4685, -(-4685))).assertEqual(0);
      expect(nativeAdd(-4886, 201) < 201).assertTrue();
      expect(nativeAdd(-4886, 0)).assertEqual(-4886);
      expect(nativeAdd(-4886, 201) - 201).assertEqual(-4886);
      expect(sum - -4886).assertEqual(201);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0121
     * @tc.name      testNativeSigned0121
     * @tc.desc      Add signed values -4927 and 230 and expect -4697
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeSigned0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(-4927, 230);
      logCase('testNativeSigned0121', `sum=${sum}`);
      expect(sum).assertEqual(-4697);
      expect(nativeAdd(230, -4927)).assertEqual(-4697);
      expect(nativeAdd(-4697, -(230))).assertEqual(-4927);
      expect(nativeAdd(-4697, -(-4927))).assertEqual(230);
      expect(nativeAdd(-4697, -(-4697))).assertEqual(0);
      expect(nativeAdd(-4927, 230) < 230).assertTrue();
      expect(nativeAdd(-4927, 0)).assertEqual(-4927);
      expect(nativeAdd(-4927, 230) - 230).assertEqual(-4927);
      expect(sum - -4927).assertEqual(230);
      {
      const sum: number = nativeAdd(-4968, -241);
      logCase('testNativeSigned0122', `sum=${sum}`);
      expect(sum).assertEqual(-5209);
      expect(nativeAdd(-241, -4968)).assertEqual(-5209);
      expect(nativeAdd(-5209, -(-241))).assertEqual(-4968);
      expect(nativeAdd(-5209, -(-4968))).assertEqual(-241);
      expect(nativeAdd(-5209, -(-5209))).assertEqual(0);
      expect(nativeAdd(-4968, -241) < -241).assertTrue();
      expect(nativeAdd(-4968, 0)).assertEqual(-4968);
      expect(nativeAdd(-4968, -241) - -241).assertEqual(-4968);
      expect(sum - -4968).assertEqual(-241);
      }
      {
      const sum: number = nativeAdd(-5009, -212);
      logCase('testNativeSigned0123', `sum=${sum}`);
      expect(sum).assertEqual(-5221);
      expect(nativeAdd(-212, -5009)).assertEqual(-5221);
      expect(nativeAdd(-5221, -(-212))).assertEqual(-5009);
      expect(nativeAdd(-5221, -(-5009))).assertEqual(-212);
      expect(nativeAdd(-5221, -(-5221))).assertEqual(0);
      expect(nativeAdd(-5009, -212) < -212).assertTrue();
      expect(nativeAdd(-5009, 0)).assertEqual(-5009);
      expect(nativeAdd(-5009, -212) - -212).assertEqual(-5009);
      expect(sum - -5009).assertEqual(-212);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0124
     * @tc.name      testNativeSigned0124
     * @tc.desc      Add signed values -5050 and -183 and expect -5233
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeSigned0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(-5050, -183);
      logCase('testNativeSigned0124', `sum=${sum}`);
      expect(sum).assertEqual(-5233);
      expect(nativeAdd(-183, -5050)).assertEqual(-5233);
      expect(nativeAdd(-5233, -(-183))).assertEqual(-5050);
      expect(nativeAdd(-5233, -(-5050))).assertEqual(-183);
      expect(nativeAdd(-5233, -(-5233))).assertEqual(0);
      expect(nativeAdd(-5050, -183) < -183).assertTrue();
      expect(nativeAdd(-5050, 0)).assertEqual(-5050);
      expect(nativeAdd(-5050, -183) - -183).assertEqual(-5050);
      expect(sum - -5050).assertEqual(-183);
      {
      const sum: number = nativeAdd(-5091, -154);
      logCase('testNativeSigned0125', `sum=${sum}`);
      expect(sum).assertEqual(-5245);
      expect(nativeAdd(-154, -5091)).assertEqual(-5245);
      expect(nativeAdd(-5245, -(-154))).assertEqual(-5091);
      expect(nativeAdd(-5245, -(-5091))).assertEqual(-154);
      expect(nativeAdd(-5245, -(-5245))).assertEqual(0);
      expect(nativeAdd(-5091, -154) < -154).assertTrue();
      expect(nativeAdd(-5091, 0)).assertEqual(-5091);
      expect(nativeAdd(-5091, -154) - -154).assertEqual(-5091);
      expect(sum - -5091).assertEqual(-154);
      }
      {
      const sum: number = nativeAdd(-5132, -125);
      logCase('testNativeSigned0126', `sum=${sum}`);
      expect(sum).assertEqual(-5257);
      expect(nativeAdd(-125, -5132)).assertEqual(-5257);
      expect(nativeAdd(-5257, -(-125))).assertEqual(-5132);
      expect(nativeAdd(-5257, -(-5132))).assertEqual(-125);
      expect(nativeAdd(-5257, -(-5257))).assertEqual(0);
      expect(nativeAdd(-5132, -125) < -125).assertTrue();
      expect(nativeAdd(-5132, 0)).assertEqual(-5132);
      expect(nativeAdd(-5132, -125) - -125).assertEqual(-5132);
      expect(sum - -5132).assertEqual(-125);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0127
     * @tc.name      testNativeSigned0127
     * @tc.desc      Add signed values -5173 and -96 and expect -5269
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeSigned0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(-5173, -96);
      logCase('testNativeSigned0127', `sum=${sum}`);
      expect(sum).assertEqual(-5269);
      expect(nativeAdd(-96, -5173)).assertEqual(-5269);
      expect(nativeAdd(-5269, -(-96))).assertEqual(-5173);
      expect(nativeAdd(-5269, -(-5173))).assertEqual(-96);
      expect(nativeAdd(-5269, -(-5269))).assertEqual(0);
      expect(nativeAdd(-5173, -96) < -96).assertTrue();
      expect(nativeAdd(-5173, 0)).assertEqual(-5173);
      expect(nativeAdd(-5173, -96) - -96).assertEqual(-5173);
      expect(sum - -5173).assertEqual(-96);
      {
      const sum: number = nativeAdd(-5214, -67);
      logCase('testNativeSigned0128', `sum=${sum}`);
      expect(sum).assertEqual(-5281);
      expect(nativeAdd(-67, -5214)).assertEqual(-5281);
      expect(nativeAdd(-5281, -(-67))).assertEqual(-5214);
      expect(nativeAdd(-5281, -(-5214))).assertEqual(-67);
      expect(nativeAdd(-5281, -(-5281))).assertEqual(0);
      expect(nativeAdd(-5214, -67) < -67).assertTrue();
      expect(nativeAdd(-5214, 0)).assertEqual(-5214);
      expect(nativeAdd(-5214, -67) - -67).assertEqual(-5214);
      expect(sum - -5214).assertEqual(-67);
      }
      {
      const sum: number = nativeAdd(-5255, -38);
      logCase('testNativeSigned0129', `sum=${sum}`);
      expect(sum).assertEqual(-5293);
      expect(nativeAdd(-38, -5255)).assertEqual(-5293);
      expect(nativeAdd(-5293, -(-38))).assertEqual(-5255);
      expect(nativeAdd(-5293, -(-5255))).assertEqual(-38);
      expect(nativeAdd(-5293, -(-5293))).assertEqual(0);
      expect(nativeAdd(-5255, -38) < -38).assertTrue();
      expect(nativeAdd(-5255, 0)).assertEqual(-5255);
      expect(nativeAdd(-5255, -38) - -38).assertEqual(-5255);
      expect(sum - -5255).assertEqual(-38);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_NADD_NEGATIVE_0130
     * @tc.name      testNativeSigned0130
     * @tc.desc      Add signed values -5296 and -9 and expect -5305
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNativeSigned0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sum: number = nativeAdd(-5296, -9);
      logCase('testNativeSigned0130', `sum=${sum}`);
      expect(sum).assertEqual(-5305);
      expect(nativeAdd(-9, -5296)).assertEqual(-5305);
      expect(nativeAdd(-5305, -(-9))).assertEqual(-5296);
      expect(nativeAdd(-5305, -(-5296))).assertEqual(-9);
      expect(nativeAdd(-5305, -(-5305))).assertEqual(0);
      expect(nativeAdd(-5296, -9) < -9).assertTrue();
      expect(nativeAdd(-5296, 0)).assertEqual(-5296);
      expect(nativeAdd(-5296, -9) - -9).assertEqual(-5296);
      expect(sum - -5296).assertEqual(-9);
      {
      const sum: number = nativeAdd(-5337, 20);
      logCase('testNativeSigned0131', `sum=${sum}`);
      expect(sum).assertEqual(-5317);
      expect(nativeAdd(20, -5337)).assertEqual(-5317);
      expect(nativeAdd(-5317, -(20))).assertEqual(-5337);
      expect(nativeAdd(-5317, -(-5337))).assertEqual(20);
      expect(nativeAdd(-5317, -(-5317))).assertEqual(0);
      expect(nativeAdd(-5337, 20) < 20).assertTrue();
      expect(nativeAdd(-5337, 0)).assertEqual(-5337);
      expect(nativeAdd(-5337, 20) - 20).assertEqual(-5337);
      expect(sum - -5337).assertEqual(20);
      }
