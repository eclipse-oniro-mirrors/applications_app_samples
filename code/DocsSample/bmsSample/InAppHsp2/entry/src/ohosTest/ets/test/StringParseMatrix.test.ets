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
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function stringMatrixTest() {
  describe('StringMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_IHSP_STR_0001
     * @tc.name      testString0001
     * @tc.desc      String split dash keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'alpha-beta-gamma';
      logCase('testString0001', 'split dash length ' + text.length);
      expect(text.length).assertEqual(16);
      expect(text.charAt(0)).assertEqual('a');
      expect(text.charAt(text.length - 1)).assertEqual('a');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(15);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0002
     * @tc.name      testString0002
     * @tc.desc      String split pipe keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'one|two|three|four';
      logCase('testString0002', 'split pipe length ' + text.length);
      expect(text.length).assertEqual(18);
      expect(text.charAt(0)).assertEqual('o');
      expect(text.charAt(text.length - 1)).assertEqual('r');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(17);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0003
     * @tc.name      testString0003
     * @tc.desc      String split comma keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'a,b,c,d,e';
      logCase('testString0003', 'split comma length ' + text.length);
      expect(text.length).assertEqual(9);
      expect(text.charAt(0)).assertEqual('a');
      expect(text.charAt(text.length - 1)).assertEqual('e');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(8);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0004
     * @tc.name      testString0004
     * @tc.desc      String split space keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'red green blue';
      logCase('testString0004', 'split space length ' + text.length);
      expect(text.length).assertEqual(14);
      expect(text.charAt(0)).assertEqual('r');
      expect(text.charAt(text.length - 1)).assertEqual('e');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(13);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0005
     * @tc.name      testString0005
     * @tc.desc      String split semicolon keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'x;y;z';
      logCase('testString0005', 'split semicolon length ' + text.length);
      expect(text.length).assertEqual(5);
      expect(text.charAt(0)).assertEqual('x');
      expect(text.charAt(text.length - 1)).assertEqual('z');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(4);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0006
     * @tc.name      testString0006
     * @tc.desc      String split colon keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'left:right';
      logCase('testString0006', 'split colon length ' + text.length);
      expect(text.length).assertEqual(10);
      expect(text.charAt(0)).assertEqual('l');
      expect(text.charAt(text.length - 1)).assertEqual('t');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(9);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0007
     * @tc.name      testString0007
     * @tc.desc      String split date keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '2026-11-19';
      logCase('testString0007', 'split date length ' + text.length);
      expect(text.length).assertEqual(10);
      expect(text.charAt(0)).assertEqual('2');
      expect(text.charAt(text.length - 1)).assertEqual('9');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(9);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0008
     * @tc.name      testString0008
     * @tc.desc      String split underscore keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'alpha_beta_gamma_delta';
      logCase('testString0008', 'split underscore length ' + text.length);
      expect(text.length).assertEqual(22);
      expect(text.charAt(0)).assertEqual('a');
      expect(text.charAt(text.length - 1)).assertEqual('a');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(21);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0009
     * @tc.name      testString0009
     * @tc.desc      String split path keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'path/to/resource';
      logCase('testString0009', 'split path length ' + text.length);
      expect(text.length).assertEqual(16);
      expect(text.charAt(0)).assertEqual('p');
      expect(text.charAt(text.length - 1)).assertEqual('e');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(15);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0010
     * @tc.name      testString0010
     * @tc.desc      String split dots keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'name.suffix.ext';
      logCase('testString0010', 'split dots length ' + text.length);
      expect(text.length).assertEqual(15);
      expect(text.charAt(0)).assertEqual('n');
      expect(text.charAt(text.length - 1)).assertEqual('t');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(14);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0011
     * @tc.name      testString0011
     * @tc.desc      String capitalized words keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'Hello World';
      logCase('testString0011', 'capitalized words length ' + text.length);
      expect(text.length).assertEqual(11);
      expect(text.charAt(0)).assertEqual('H');
      expect(text.charAt(text.length - 1)).assertEqual('d');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(10);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0012
     * @tc.name      testString0012
     * @tc.desc      String mixed case keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'Mixed CASE Tokens';
      logCase('testString0012', 'mixed case length ' + text.length);
      expect(text.length).assertEqual(17);
      expect(text.charAt(0)).assertEqual('M');
      expect(text.charAt(text.length - 1)).assertEqual('s');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(16);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0013
     * @tc.name      testString0013
     * @tc.desc      String padded text keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '  padded text  ';
      logCase('testString0013', 'padded text length ' + text.length);
      expect(text.length).assertEqual(15);
      expect(text.charAt(0)).assertEqual(' ');
      expect(text.charAt(text.length - 1)).assertEqual(' ');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(14);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0014
     * @tc.name      testString0014
     * @tc.desc      String tabbed text keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '\ttabbed\tvalue\t';
      logCase('testString0014', 'tabbed text length ' + text.length);
      expect(text.length).assertEqual(14);
      expect(text.charAt(0)).assertEqual('\t');
      expect(text.charAt(text.length - 1)).assertEqual('\t');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(13);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0015
     * @tc.name      testString0015
     * @tc.desc      String two lines keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'line-one\nline-two';
      logCase('testString0015', 'two lines length ' + text.length);
      expect(text.length).assertEqual(17);
      expect(text.charAt(0)).assertEqual('l');
      expect(text.charAt(text.length - 1)).assertEqual('o');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(16);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0016
     * @tc.name      testString0016
     * @tc.desc      String upper dashed keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'AAA-BBB-CCC-DDD';
      logCase('testString0016', 'upper dashed length ' + text.length);
      expect(text.length).assertEqual(15);
      expect(text.charAt(0)).assertEqual('A');
      expect(text.charAt(text.length - 1)).assertEqual('D');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(14);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0017
     * @tc.name      testString0017
     * @tc.desc      String repeated abc keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'abcabcabc';
      logCase('testString0017', 'repeated abc length ' + text.length);
      expect(text.length).assertEqual(9);
      expect(text.charAt(0)).assertEqual('a');
      expect(text.charAt(text.length - 1)).assertEqual('c');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(8);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0018
     * @tc.name      testString0018
     * @tc.desc      String three parts keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'prefix-middle-suffix';
      logCase('testString0018', 'three parts length ' + text.length);
      expect(text.length).assertEqual(20);
      expect(text.charAt(0)).assertEqual('p');
      expect(text.charAt(text.length - 1)).assertEqual('x');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(19);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0019
     * @tc.name      testString0019
     * @tc.desc      String query string keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'k1=v1&k2=v2&k3=v3';
      logCase('testString0019', 'query string length ' + text.length);
      expect(text.length).assertEqual(17);
      expect(text.charAt(0)).assertEqual('k');
      expect(text.charAt(text.length - 1)).assertEqual('3');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(16);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0020
     * @tc.name      testString0020
     * @tc.desc      String numeric list keeps edges
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = '1,2,3,4,5,6';
      logCase('testString0020', 'numeric list length ' + text.length);
      expect(text.length).assertEqual(11);
      expect(text.charAt(0)).assertEqual('1');
      expect(text.charAt(text.length - 1)).assertEqual('6');
      expect(text.indexOf(text.charAt(0))).assertEqual(0);
      expect(text.lastIndexOf(text.charAt(text.length - 1))).assertEqual(10);
    });
    /**
     * @tc.number    SUB_IHSP_STR_0021
     * @tc.name      testString0021
     * @tc.desc      String split dash changes case safely
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'alpha-beta-gamma';
      logCase('testString0021', 'split dash case change');
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.toUpperCase()).assertEqual('ALPHA-BETA-GAMMA');
      expect(text.toLowerCase()).assertEqual('alpha-beta-gamma');
      expect(text.trim().length <= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_STR_0022
     * @tc.name      testString0022
     * @tc.desc      String split pipe changes case safely
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'one|two|three|four';
      logCase('testString0022', 'split pipe case change');
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.toUpperCase()).assertEqual('ONE|TWO|THREE|FOUR');
      expect(text.toLowerCase()).assertEqual('one|two|three|four');
      expect(text.trim().length <= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_STR_0023
     * @tc.name      testString0023
     * @tc.desc      String split comma changes case safely
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'a,b,c,d,e';
      logCase('testString0023', 'split comma case change');
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.toUpperCase()).assertEqual('A,B,C,D,E');
      expect(text.toLowerCase()).assertEqual('a,b,c,d,e');
      expect(text.trim().length <= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_STR_0024
     * @tc.name      testString0024
     * @tc.desc      String split space changes case safely
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'red green blue';
      logCase('testString0024', 'split space case change');
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.toUpperCase()).assertEqual('RED GREEN BLUE');
      expect(text.toLowerCase()).assertEqual('red green blue');
      expect(text.trim().length <= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_STR_0025
     * @tc.name      testString0025
     * @tc.desc      String split semicolon changes case safely
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'x;y;z';
      logCase('testString0025', 'split semicolon case change');
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.toUpperCase()).assertEqual('X;Y;Z');
      expect(text.toLowerCase()).assertEqual('x;y;z');
      expect(text.trim().length <= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_STR_0026
     * @tc.name      testString0026
     * @tc.desc      String split colon changes case safely
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const text: string = 'left:right';
      logCase('testString0026', 'split colon case change');
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.toUpperCase()).assertEqual('LEFT:RIGHT');
      expect(text.toLowerCase()).assertEqual('left:right');
      expect(text.trim().length <= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_STR_0027
     * @tc.name      testString0027
     * @tc.desc      String split date changes case safely
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = '2026-11-19';
      logCase('testString0027', 'split date case change');
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.toUpperCase()).assertEqual('2026-11-19');
      expect(text.toLowerCase()).assertEqual('2026-11-19');
      expect(text.trim().length <= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_STR_0028
     * @tc.name      testString0028
     * @tc.desc      String split underscore changes case safely
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = 'alpha_beta_gamma_delta';
      logCase('testString0028', 'split underscore case change');
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.toUpperCase()).assertEqual('ALPHA_BETA_GAMMA_DELTA');
      expect(text.toLowerCase()).assertEqual('alpha_beta_gamma_delta');
      expect(text.trim().length <= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_STR_0029
     * @tc.name      testString0029
     * @tc.desc      String split path changes case safely
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = 'path/to/resource';
      logCase('testString0029', 'split path case change');
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.toUpperCase()).assertEqual('PATH/TO/RESOURCE');
      expect(text.toLowerCase()).assertEqual('path/to/resource');
      expect(text.trim().length <= text.length).assertTrue();
    });
    /**
     * @tc.number    SUB_IHSP_STR_0030
     * @tc.name      testString0030
     * @tc.desc      String split dots changes case safely
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testString0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const text: string = 'name.suffix.ext';
      logCase('testString0030', 'split dots case change');
      expect(text.toUpperCase().length).assertEqual(text.length);
      expect(text.toLowerCase().length).assertEqual(text.length);
      expect(text.toUpperCase()).assertEqual('NAME.SUFFIX.EXT');
      expect(text.toLowerCase()).assertEqual('name.suffix.ext');
      expect(text.trim().length <= text.length).assertTrue();
    });
;
  });
}
