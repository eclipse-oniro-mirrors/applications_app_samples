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
