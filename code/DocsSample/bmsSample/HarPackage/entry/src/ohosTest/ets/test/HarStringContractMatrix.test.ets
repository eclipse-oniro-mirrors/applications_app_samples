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
import { func, func2 } from 'library';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function harStringContractMatrixTest() {
  describe('HarStringContractMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0001
     * @tc.name      testHarStringContract0001
     * @tc.desc      Length of func() equals 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0001', 'string contract case 1');
      expect(func().length).assertEqual(8);
      {
      logCase('testHarStringContract0002', 'string contract case 2');
      expect(func().charAt(0)).assertEqual('h');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0003
     * @tc.name      testHarStringContract0003
     * @tc.desc      Character at 1 of func() is 'a'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0003', 'string contract case 3');
      expect(func().charAt(1)).assertEqual('a');
      {
      logCase('testHarStringContract0004', 'string contract case 4');
      expect(func().charAt(2)).assertEqual('r');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0005
     * @tc.name      testHarStringContract0005
     * @tc.desc      Character at 3 of func() is ' '
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0005', 'string contract case 5');
      expect(func().charAt(3)).assertEqual(' ');
      {
      logCase('testHarStringContract0006', 'string contract case 6');
      expect(func().charAt(4)).assertEqual('f');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0007
     * @tc.name      testHarStringContract0007
     * @tc.desc      Character at 5 of func() is 'u'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0007', 'string contract case 7');
      expect(func().charAt(5)).assertEqual('u');
      {
      logCase('testHarStringContract0008', 'string contract case 8');
      expect(func().charAt(6)).assertEqual('n');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0009
     * @tc.name      testHarStringContract0009
     * @tc.desc      Character at 7 of func() is 'c'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0009', 'string contract case 9');
      expect(func().charAt(7)).assertEqual('c');
      {
      logCase('testHarStringContract0010', 'string contract case 10');
      expect(func().charCodeAt(0)).assertEqual(104);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0011
     * @tc.name      testHarStringContract0011
     * @tc.desc      Char code at 1 of func() is 97
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0011', 'string contract case 11');
      expect(func().charCodeAt(1)).assertEqual(97);
      {
      logCase('testHarStringContract0012', 'string contract case 12');
      expect(func().charCodeAt(2)).assertEqual(114);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0013
     * @tc.name      testHarStringContract0013
     * @tc.desc      Char code at 3 of func() is 32
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0013', 'string contract case 13');
      expect(func().charCodeAt(3)).assertEqual(32);
      {
      logCase('testHarStringContract0014', 'string contract case 14');
      expect(func().charCodeAt(4)).assertEqual(102);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0015
     * @tc.name      testHarStringContract0015
     * @tc.desc      Char code at 5 of func() is 117
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0015', 'string contract case 15');
      expect(func().charCodeAt(5)).assertEqual(117);
      {
      logCase('testHarStringContract0016', 'string contract case 16');
      expect(func().charCodeAt(6)).assertEqual(110);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0017
     * @tc.name      testHarStringContract0017
     * @tc.desc      Char code at 7 of func() is 99
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0017', 'string contract case 17');
      expect(func().charCodeAt(7)).assertEqual(99);
      {
      logCase('testHarStringContract0018', 'string contract case 18');
      expect(func().codePointAt(0)).assertEqual(104);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0019
     * @tc.name      testHarStringContract0019
     * @tc.desc      Code point at 1 of func() is 97
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0019', 'string contract case 19');
      expect(func().codePointAt(1)).assertEqual(97);
      {
      logCase('testHarStringContract0020', 'string contract case 20');
      expect(func().codePointAt(2)).assertEqual(114);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0021
     * @tc.name      testHarStringContract0021
     * @tc.desc      Code point at 3 of func() is 32
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0021', 'string contract case 21');
      expect(func().codePointAt(3)).assertEqual(32);
      {
      logCase('testHarStringContract0022', 'string contract case 22');
      expect(func().codePointAt(4)).assertEqual(102);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0023
     * @tc.name      testHarStringContract0023
     * @tc.desc      Code point at 5 of func() is 117
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0023', 'string contract case 23');
      expect(func().codePointAt(5)).assertEqual(117);
      {
      logCase('testHarStringContract0024', 'string contract case 24');
      expect(func().codePointAt(6)).assertEqual(110);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0025
     * @tc.name      testHarStringContract0025
     * @tc.desc      Code point at 7 of func() is 99
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0025', 'string contract case 25');
      expect(func().codePointAt(7)).assertEqual(99);
      {
      logCase('testHarStringContract0026', 'string contract case 26');
      expect(func().indexOf('a')).assertEqual(1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0027
     * @tc.name      testHarStringContract0027
     * @tc.desc      Last index of 'r' in func() is 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0027', 'string contract case 27');
      expect(func().lastIndexOf('r')).assertEqual(2);
      {
      logCase('testHarStringContract0028', 'string contract case 28');
      expect(func().indexOf('zz')).assertEqual(-1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0029
     * @tc.name      testHarStringContract0029
     * @tc.desc      func() includes 'func'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0029', 'string contract case 29');
      expect(func().includes('func')).assertTrue();
      {
      logCase('testHarStringContract0030', 'string contract case 30');
      expect(func().startsWith('har ')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0031
     * @tc.name      testHarStringContract0031
     * @tc.desc      func() ends with 'func'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0031', 'string contract case 31');
      expect(func().endsWith('func')).assertTrue();
      {
      logCase('testHarStringContract0032', 'string contract case 32');
      expect(func().slice(4)).assertEqual('func');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0033
     * @tc.name      testHarStringContract0033
     * @tc.desc      func() sliced 0..3 is 'har'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0033', 'string contract case 33');
      expect(func().slice(0, 3)).assertEqual('har');
      {
      logCase('testHarStringContract0034', 'string contract case 34');
      expect(func().substring(4, 8)).assertEqual('func');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0035
     * @tc.name      testHarStringContract0035
     * @tc.desc      func() upper case is 'HAR FUNC'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0035', 'string contract case 35');
      expect(func().toUpperCase()).assertEqual('HAR FUNC');
      {
      logCase('testHarStringContract0036', 'string contract case 36');
      expect(func().toLowerCase()).assertEqual('har func');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0037
     * @tc.name      testHarStringContract0037
     * @tc.desc      func() concatenated with '!' is 'har func!'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0037', 'string contract case 37');
      expect(func().concat('!')).assertEqual('har func!');
      {
      logCase('testHarStringContract0038', 'string contract case 38');
      expect(func().repeat(2)).assertEqual('har funchar func');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0039
     * @tc.name      testHarStringContract0039
     * @tc.desc      func() repeated three times is 'har funchar funchar func'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0039', 'string contract case 39');
      expect(func().repeat(3)).assertEqual('har funchar funchar func');
      {
      logCase('testHarStringContract0040', 'string contract case 40');
      expect(func().padStart(12, '.')).assertEqual('....har func');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0041
     * @tc.name      testHarStringContract0041
     * @tc.desc      func() padded on the right to 12 chars
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0041', 'string contract case 41');
      expect(func().padEnd(12, '.')).assertEqual('har func....');
      {
      logCase('testHarStringContract0042', 'string contract case 42');
      expect(func().trim()).assertEqual('har func');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0043
     * @tc.name      testHarStringContract0043
     * @tc.desc      func() split by space has two parts
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0043', 'string contract case 43');
      expect(func().split(' ').length).assertEqual(2);
      {
      logCase('testHarStringContract0044', 'string contract case 44');
      expect(func().split(' ')[0]).assertEqual('har');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0045
     * @tc.name      testHarStringContract0045
     * @tc.desc      func() replaced 'har' is 'HAR func'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringContract0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringContract0045', 'string contract case 45');
      expect(func().replace('har', 'HAR')).assertEqual('HAR func');
      {
      logCase('testHarStringContract0046', 'string contract case 46');
      let codeSum0: number = 0;
      for (let pos0: number = 0; pos0 < func().length; pos0++) {
        codeSum0 += func().charCodeAt(pos0);
      }
      expect(codeSum0).assertEqual(775);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0047
     * @tc.name      testHarStringContract0047
     * @tc.desc      Length of func2() equals 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0047', 'string contract case 47');
      expect(func2().length).assertEqual(9);
      {
      logCase('testHarStringContract0048', 'string contract case 48');
      expect(func2().charAt(0)).assertEqual('h');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0049
     * @tc.name      testHarStringContract0049
     * @tc.desc      Character at 1 of func2() is 'a'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0049', 'string contract case 49');
      expect(func2().charAt(1)).assertEqual('a');
      {
      logCase('testHarStringContract0050', 'string contract case 50');
      expect(func2().charAt(2)).assertEqual('r');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0051
     * @tc.name      testHarStringContract0051
     * @tc.desc      Character at 3 of func2() is ' '
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0051', 'string contract case 51');
      expect(func2().charAt(3)).assertEqual(' ');
      {
      logCase('testHarStringContract0052', 'string contract case 52');
      expect(func2().charAt(4)).assertEqual('f');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0053
     * @tc.name      testHarStringContract0053
     * @tc.desc      Character at 5 of func2() is 'u'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0053', 'string contract case 53');
      expect(func2().charAt(5)).assertEqual('u');
      {
      logCase('testHarStringContract0054', 'string contract case 54');
      expect(func2().charAt(6)).assertEqual('n');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0055
     * @tc.name      testHarStringContract0055
     * @tc.desc      Character at 7 of func2() is 'c'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0055', 'string contract case 55');
      expect(func2().charAt(7)).assertEqual('c');
      {
      logCase('testHarStringContract0056', 'string contract case 56');
      expect(func2().charAt(8)).assertEqual('2');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0057
     * @tc.name      testHarStringContract0057
     * @tc.desc      Char code at 0 of func2() is 104
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0057', 'string contract case 57');
      expect(func2().charCodeAt(0)).assertEqual(104);
      {
      logCase('testHarStringContract0058', 'string contract case 58');
      expect(func2().charCodeAt(1)).assertEqual(97);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0059
     * @tc.name      testHarStringContract0059
     * @tc.desc      Char code at 2 of func2() is 114
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0059', 'string contract case 59');
      expect(func2().charCodeAt(2)).assertEqual(114);
      {
      logCase('testHarStringContract0060', 'string contract case 60');
      expect(func2().charCodeAt(3)).assertEqual(32);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0061
     * @tc.name      testHarStringContract0061
     * @tc.desc      Char code at 4 of func2() is 102
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0061', 'string contract case 61');
      expect(func2().charCodeAt(4)).assertEqual(102);
      {
      logCase('testHarStringContract0062', 'string contract case 62');
      expect(func2().charCodeAt(5)).assertEqual(117);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0063
     * @tc.name      testHarStringContract0063
     * @tc.desc      Char code at 6 of func2() is 110
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0063', 'string contract case 63');
      expect(func2().charCodeAt(6)).assertEqual(110);
      {
      logCase('testHarStringContract0064', 'string contract case 64');
      expect(func2().charCodeAt(7)).assertEqual(99);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0065
     * @tc.name      testHarStringContract0065
     * @tc.desc      Char code at 8 of func2() is 50
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0065', 'string contract case 65');
      expect(func2().charCodeAt(8)).assertEqual(50);
      {
      logCase('testHarStringContract0066', 'string contract case 66');
      expect(func2().codePointAt(0)).assertEqual(104);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0067
     * @tc.name      testHarStringContract0067
     * @tc.desc      Code point at 1 of func2() is 97
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0067', 'string contract case 67');
      expect(func2().codePointAt(1)).assertEqual(97);
      {
      logCase('testHarStringContract0068', 'string contract case 68');
      expect(func2().codePointAt(2)).assertEqual(114);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0069
     * @tc.name      testHarStringContract0069
     * @tc.desc      Code point at 3 of func2() is 32
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0069', 'string contract case 69');
      expect(func2().codePointAt(3)).assertEqual(32);
      {
      logCase('testHarStringContract0070', 'string contract case 70');
      expect(func2().codePointAt(4)).assertEqual(102);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0071
     * @tc.name      testHarStringContract0071
     * @tc.desc      Code point at 5 of func2() is 117
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0071', 'string contract case 71');
      expect(func2().codePointAt(5)).assertEqual(117);
      {
      logCase('testHarStringContract0072', 'string contract case 72');
      expect(func2().codePointAt(6)).assertEqual(110);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0073
     * @tc.name      testHarStringContract0073
     * @tc.desc      Code point at 7 of func2() is 99
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0073', 'string contract case 73');
      expect(func2().codePointAt(7)).assertEqual(99);
      {
      logCase('testHarStringContract0074', 'string contract case 74');
      expect(func2().codePointAt(8)).assertEqual(50);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0075
     * @tc.name      testHarStringContract0075
     * @tc.desc      Index of 'a' in func2() is 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0075', 'string contract case 75');
      expect(func2().indexOf('a')).assertEqual(1);
      {
      logCase('testHarStringContract0076', 'string contract case 76');
      expect(func2().lastIndexOf('r')).assertEqual(2);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0077
     * @tc.name      testHarStringContract0077
     * @tc.desc      Index of missing 'zz' in func2() is -1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0077', 'string contract case 77');
      expect(func2().indexOf('zz')).assertEqual(-1);
      {
      logCase('testHarStringContract0078', 'string contract case 78');
      expect(func2().includes('func')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0079
     * @tc.name      testHarStringContract0079
     * @tc.desc      func2() starts with 'har '
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0079', 'string contract case 79');
      expect(func2().startsWith('har ')).assertTrue();
      {
      logCase('testHarStringContract0080', 'string contract case 80');
      expect(func2().endsWith('unc2')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0081
     * @tc.name      testHarStringContract0081
     * @tc.desc      func2() sliced from 4 is 'func2'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0081', 'string contract case 81');
      expect(func2().slice(4)).assertEqual('func2');
      {
      logCase('testHarStringContract0082', 'string contract case 82');
      expect(func2().slice(0, 3)).assertEqual('har');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0083
     * @tc.name      testHarStringContract0083
     * @tc.desc      func2() substring 4..8 is 'func'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0083', 'string contract case 83');
      expect(func2().substring(4, 8)).assertEqual('func');
      {
      logCase('testHarStringContract0084', 'string contract case 84');
      expect(func2().toUpperCase()).assertEqual('HAR FUNC2');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0085
     * @tc.name      testHarStringContract0085
     * @tc.desc      func2() lower case is 'har func2'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0085', 'string contract case 85');
      expect(func2().toLowerCase()).assertEqual('har func2');
      {
      logCase('testHarStringContract0086', 'string contract case 86');
      expect(func2().concat('!')).assertEqual('har func2!');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0087
     * @tc.name      testHarStringContract0087
     * @tc.desc      func2() repeated twice is 'har func2har func2'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0087', 'string contract case 87');
      expect(func2().repeat(2)).assertEqual('har func2har func2');
      {
      logCase('testHarStringContract0088', 'string contract case 88');
      expect(func2().repeat(3)).assertEqual('har func2har func2har func2');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0089
     * @tc.name      testHarStringContract0089
     * @tc.desc      func2() padded on the left to 12 chars
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0089', 'string contract case 89');
      expect(func2().padStart(12, '.')).assertEqual('...har func2');
      {
      logCase('testHarStringContract0090', 'string contract case 90');
      expect(func2().padEnd(12, '.')).assertEqual('har func2...');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0091
     * @tc.name      testHarStringContract0091
     * @tc.desc      func2() trimmed equals itself
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0091', 'string contract case 91');
      expect(func2().trim()).assertEqual('har func2');
      {
      logCase('testHarStringContract0092', 'string contract case 92');
      expect(func2().split(' ').length).assertEqual(2);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0093
     * @tc.name      testHarStringContract0093
     * @tc.desc      func2() split by space keeps 'har' first
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0093', 'string contract case 93');
      expect(func2().split(' ')[0]).assertEqual('har');
      {
      logCase('testHarStringContract0094', 'string contract case 94');
      expect(func2().replace('har', 'HAR')).assertEqual('HAR func2');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0095
     * @tc.name      testHarStringContract0095
     * @tc.desc      func2() character code sum is 825
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0095', 'string contract case 95');
      let codeSum1: number = 0;
      for (let pos1: number = 0; pos1 < func2().length; pos1++) {
        codeSum1 += func2().charCodeAt(pos1);
      }
      expect(codeSum1).assertEqual(825);
      {
      logCase('testHarStringContract0096', 'string contract case 96');
      expect(func() === func2()).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0097
     * @tc.name      testHarStringContract0097
     * @tc.desc      func() sorts before func2()
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0097', 'string contract case 97');
      expect(func() < func2()).assertTrue();
      {
      logCase('testHarStringContract0098', 'string contract case 98');
      expect(func().slice(0, 4)).assertEqual(func2().slice(0, 4));
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0099
     * @tc.name      testHarStringContract0099
     * @tc.desc      func() and func2() share the same length of the leading word
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0099', 'string contract case 99');
      expect(func().indexOf(' ')).assertEqual(func2().indexOf(' '));
      {
      logCase('testHarStringContract0100', 'string contract case 100');
      expect(func().concat(func2()).length).assertEqual(17);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0101
     * @tc.name      testHarStringContract0101
     * @tc.desc      Repeated calls to func() return equal values
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0101', 'string contract case 101');
      expect(func()).assertEqual('har func');
      {
      logCase('testHarStringContract0102', 'string contract case 102');
      expect(func2()).assertEqual('har func2');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRING_0103
     * @tc.name      testHarStringContract0103
     * @tc.desc      func() rebuilds the same code unit sequence
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringContract0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringContract0103', 'string contract case 103');
      const codesRebuilt: number[] = [];
      for (let posR: number = 0; posR < func().length; posR++) {
        codesRebuilt.push(func().charCodeAt(posR));
      }
      expect(codesRebuilt.join('-')).assertEqual('104-97-114-32-102-117-110-99');
      {
      logCase('testHarStringContract0104', 'string contract case 104');
      const codesRebuilt2: number[] = [];
      for (let posR2: number = 0; posR2 < func2().length; posR2++) {
        codesRebuilt2.push(func2().charCodeAt(posR2));
      }
      expect(codesRebuilt2.join('-')).assertEqual('104-97-114-32-102-117-110-99-50');
      }
    });

  });
}
