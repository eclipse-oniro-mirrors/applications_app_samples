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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function textSenseMatrixTest() {
  describe('textSenseMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0001
   * @tc.name      testTextSense0001
   * @tc.desc      Text alpha keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0001', 'text alpha length');
    const text: string = 'alpha';
    expect(text.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0002
   * @tc.name      testTextSense0002
   * @tc.desc      Text alpha keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0002', 'text alpha middle char');
    const text: string = 'alpha';
    expect(text.charAt(2)).assertEqual('p');
    expect(text.charCodeAt(2)).assertEqual(112);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0003
   * @tc.name      testTextSense0003
   * @tc.desc      Text alpha keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0003', 'text alpha slice equals substring');
    const text: string = 'alpha';
    expect(text.slice(2)).assertEqual('pha');
    expect(text.substring(2)).assertEqual('pha');
    expect(text.slice(2).length + 2).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0004
   * @tc.name      testTextSense0004
   * @tc.desc      Text alpha keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0004', 'text alpha case pairs');
    const text: string = 'alpha';
    expect(text.toUpperCase()).assertEqual('ALPHA');
    expect(text.toLowerCase()).assertEqual('alpha');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0005
   * @tc.name      testTextSense0005
   * @tc.desc      Text alpha keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0005', 'text alpha search edges');
    const text: string = 'alpha';
    expect(text.indexOf('a')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0006
   * @tc.name      testTextSense0006
   * @tc.desc      Text alpha keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0006', 'text alpha prefix and suffix');
    const text: string = 'alpha';
    expect(text.startsWith('al')).assertTrue();
    expect(text.endsWith('ha')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0007
   * @tc.name      testTextSense0007
   * @tc.desc      Text alpha keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0007', 'text alpha split join');
    const text: string = 'alpha';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0008
   * @tc.name      testTextSense0008
   * @tc.desc      Text alpha keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0008', 'text alpha pad edges');
    const text: string = 'alpha';
    expect(text.padStart(8, '0').length).assertEqual(8);
    expect(text.padEnd(7, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0009
   * @tc.name      testTextSense0009
   * @tc.desc      Text alpha keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0009', 'text alpha replace first');
    const text: string = 'alpha';
    expect(text.replace('a', '#')).assertEqual('#lpha');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0010
   * @tc.name      testTextSense0010
   * @tc.desc      Text alpha keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0010', 'text alpha repeat twice');
    const text: string = 'alpha';
    expect(text.repeat(2)).assertEqual('alphaalpha');
    expect(text.repeat(2).length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0011
   * @tc.name      testTextSense0011
   * @tc.desc      Text bravo keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0011', 'text bravo length');
    const text: string = 'bravo';
    expect(text.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0012
   * @tc.name      testTextSense0012
   * @tc.desc      Text bravo keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0012', 'text bravo middle char');
    const text: string = 'bravo';
    expect(text.charAt(2)).assertEqual('a');
    expect(text.charCodeAt(2)).assertEqual(97);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0013
   * @tc.name      testTextSense0013
   * @tc.desc      Text bravo keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0013', 'text bravo slice equals substring');
    const text: string = 'bravo';
    expect(text.slice(2)).assertEqual('avo');
    expect(text.substring(2)).assertEqual('avo');
    expect(text.slice(2).length + 2).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0014
   * @tc.name      testTextSense0014
   * @tc.desc      Text bravo keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0014', 'text bravo case pairs');
    const text: string = 'bravo';
    expect(text.toUpperCase()).assertEqual('BRAVO');
    expect(text.toLowerCase()).assertEqual('bravo');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0015
   * @tc.name      testTextSense0015
   * @tc.desc      Text bravo keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0015', 'text bravo search edges');
    const text: string = 'bravo';
    expect(text.indexOf('b')).assertEqual(0);
    expect(text.lastIndexOf('o')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0016
   * @tc.name      testTextSense0016
   * @tc.desc      Text bravo keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0016', 'text bravo prefix and suffix');
    const text: string = 'bravo';
    expect(text.startsWith('br')).assertTrue();
    expect(text.endsWith('vo')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0017
   * @tc.name      testTextSense0017
   * @tc.desc      Text bravo keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0017', 'text bravo split join');
    const text: string = 'bravo';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0018
   * @tc.name      testTextSense0018
   * @tc.desc      Text bravo keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0018', 'text bravo pad edges');
    const text: string = 'bravo';
    expect(text.padStart(8, '0').length).assertEqual(8);
    expect(text.padEnd(7, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0019
   * @tc.name      testTextSense0019
   * @tc.desc      Text bravo keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0019', 'text bravo replace first');
    const text: string = 'bravo';
    expect(text.replace('b', '#')).assertEqual('#ravo');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0020
   * @tc.name      testTextSense0020
   * @tc.desc      Text bravo keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0020', 'text bravo repeat twice');
    const text: string = 'bravo';
    expect(text.repeat(2)).assertEqual('bravobravo');
    expect(text.repeat(2).length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0021
   * @tc.name      testTextSense0021
   * @tc.desc      Text charlie keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0021', 'text charlie length');
    const text: string = 'charlie';
    expect(text.length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0022
   * @tc.name      testTextSense0022
   * @tc.desc      Text charlie keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0022', 'text charlie middle char');
    const text: string = 'charlie';
    expect(text.charAt(3)).assertEqual('r');
    expect(text.charCodeAt(3)).assertEqual(114);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0023
   * @tc.name      testTextSense0023
   * @tc.desc      Text charlie keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0023', 'text charlie slice equals substring');
    const text: string = 'charlie';
    expect(text.slice(3)).assertEqual('rlie');
    expect(text.substring(3)).assertEqual('rlie');
    expect(text.slice(3).length + 3).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0024
   * @tc.name      testTextSense0024
   * @tc.desc      Text charlie keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0024', 'text charlie case pairs');
    const text: string = 'charlie';
    expect(text.toUpperCase()).assertEqual('CHARLIE');
    expect(text.toLowerCase()).assertEqual('charlie');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0025
   * @tc.name      testTextSense0025
   * @tc.desc      Text charlie keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0025', 'text charlie search edges');
    const text: string = 'charlie';
    expect(text.indexOf('c')).assertEqual(0);
    expect(text.lastIndexOf('e')).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0026
   * @tc.name      testTextSense0026
   * @tc.desc      Text charlie keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0026', 'text charlie prefix and suffix');
    const text: string = 'charlie';
    expect(text.startsWith('ch')).assertTrue();
    expect(text.endsWith('ie')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0027
   * @tc.name      testTextSense0027
   * @tc.desc      Text charlie keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0027', 'text charlie split join');
    const text: string = 'charlie';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0028
   * @tc.name      testTextSense0028
   * @tc.desc      Text charlie keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0028', 'text charlie pad edges');
    const text: string = 'charlie';
    expect(text.padStart(10, '0').length).assertEqual(10);
    expect(text.padEnd(9, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0029
   * @tc.name      testTextSense0029
   * @tc.desc      Text charlie keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0029', 'text charlie replace first');
    const text: string = 'charlie';
    expect(text.replace('c', '#')).assertEqual('#harlie');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0030
   * @tc.name      testTextSense0030
   * @tc.desc      Text charlie keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0030', 'text charlie repeat twice');
    const text: string = 'charlie';
    expect(text.repeat(2)).assertEqual('charliecharlie');
    expect(text.repeat(2).length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0031
   * @tc.name      testTextSense0031
   * @tc.desc      Text delta keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0031', 'text delta length');
    const text: string = 'delta';
    expect(text.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0032
   * @tc.name      testTextSense0032
   * @tc.desc      Text delta keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0032', 'text delta middle char');
    const text: string = 'delta';
    expect(text.charAt(2)).assertEqual('l');
    expect(text.charCodeAt(2)).assertEqual(108);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0033
   * @tc.name      testTextSense0033
   * @tc.desc      Text delta keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0033', 'text delta slice equals substring');
    const text: string = 'delta';
    expect(text.slice(2)).assertEqual('lta');
    expect(text.substring(2)).assertEqual('lta');
    expect(text.slice(2).length + 2).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0034
   * @tc.name      testTextSense0034
   * @tc.desc      Text delta keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0034', 'text delta case pairs');
    const text: string = 'delta';
    expect(text.toUpperCase()).assertEqual('DELTA');
    expect(text.toLowerCase()).assertEqual('delta');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0035
   * @tc.name      testTextSense0035
   * @tc.desc      Text delta keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0035', 'text delta search edges');
    const text: string = 'delta';
    expect(text.indexOf('d')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0036
   * @tc.name      testTextSense0036
   * @tc.desc      Text delta keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0036', 'text delta prefix and suffix');
    const text: string = 'delta';
    expect(text.startsWith('de')).assertTrue();
    expect(text.endsWith('ta')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0037
   * @tc.name      testTextSense0037
   * @tc.desc      Text delta keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0037', 'text delta split join');
    const text: string = 'delta';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0038
   * @tc.name      testTextSense0038
   * @tc.desc      Text delta keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0038', 'text delta pad edges');
    const text: string = 'delta';
    expect(text.padStart(8, '0').length).assertEqual(8);
    expect(text.padEnd(7, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0039
   * @tc.name      testTextSense0039
   * @tc.desc      Text delta keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0039', 'text delta replace first');
    const text: string = 'delta';
    expect(text.replace('d', '#')).assertEqual('#elta');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0040
   * @tc.name      testTextSense0040
   * @tc.desc      Text delta keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0040', 'text delta repeat twice');
    const text: string = 'delta';
    expect(text.repeat(2)).assertEqual('deltadelta');
    expect(text.repeat(2).length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0041
   * @tc.name      testTextSense0041
   * @tc.desc      Text echo keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0041', 'text echo length');
    const text: string = 'echo';
    expect(text.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0042
   * @tc.name      testTextSense0042
   * @tc.desc      Text echo keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0042', 'text echo middle char');
    const text: string = 'echo';
    expect(text.charAt(2)).assertEqual('h');
    expect(text.charCodeAt(2)).assertEqual(104);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0043
   * @tc.name      testTextSense0043
   * @tc.desc      Text echo keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0043', 'text echo slice equals substring');
    const text: string = 'echo';
    expect(text.slice(2)).assertEqual('ho');
    expect(text.substring(2)).assertEqual('ho');
    expect(text.slice(2).length + 2).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0044
   * @tc.name      testTextSense0044
   * @tc.desc      Text echo keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0044', 'text echo case pairs');
    const text: string = 'echo';
    expect(text.toUpperCase()).assertEqual('ECHO');
    expect(text.toLowerCase()).assertEqual('echo');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0045
   * @tc.name      testTextSense0045
   * @tc.desc      Text echo keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0045', 'text echo search edges');
    const text: string = 'echo';
    expect(text.indexOf('e')).assertEqual(0);
    expect(text.lastIndexOf('o')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0046
   * @tc.name      testTextSense0046
   * @tc.desc      Text echo keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0046', 'text echo prefix and suffix');
    const text: string = 'echo';
    expect(text.startsWith('ec')).assertTrue();
    expect(text.endsWith('ho')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0047
   * @tc.name      testTextSense0047
   * @tc.desc      Text echo keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0047', 'text echo split join');
    const text: string = 'echo';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0048
   * @tc.name      testTextSense0048
   * @tc.desc      Text echo keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0048', 'text echo pad edges');
    const text: string = 'echo';
    expect(text.padStart(7, '0').length).assertEqual(7);
    expect(text.padEnd(6, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0049
   * @tc.name      testTextSense0049
   * @tc.desc      Text echo keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0049', 'text echo replace first');
    const text: string = 'echo';
    expect(text.replace('e', '#')).assertEqual('#cho');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0050
   * @tc.name      testTextSense0050
   * @tc.desc      Text echo keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0050', 'text echo repeat twice');
    const text: string = 'echo';
    expect(text.repeat(2)).assertEqual('echoecho');
    expect(text.repeat(2).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0051
   * @tc.name      testTextSense0051
   * @tc.desc      Text foxtrot keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0051', 'text foxtrot length');
    const text: string = 'foxtrot';
    expect(text.length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0052
   * @tc.name      testTextSense0052
   * @tc.desc      Text foxtrot keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0052', 'text foxtrot middle char');
    const text: string = 'foxtrot';
    expect(text.charAt(3)).assertEqual('t');
    expect(text.charCodeAt(3)).assertEqual(116);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0053
   * @tc.name      testTextSense0053
   * @tc.desc      Text foxtrot keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0053', 'text foxtrot slice equals substring');
    const text: string = 'foxtrot';
    expect(text.slice(3)).assertEqual('trot');
    expect(text.substring(3)).assertEqual('trot');
    expect(text.slice(3).length + 3).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0054
   * @tc.name      testTextSense0054
   * @tc.desc      Text foxtrot keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0054', 'text foxtrot case pairs');
    const text: string = 'foxtrot';
    expect(text.toUpperCase()).assertEqual('FOXTROT');
    expect(text.toLowerCase()).assertEqual('foxtrot');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0055
   * @tc.name      testTextSense0055
   * @tc.desc      Text foxtrot keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0055', 'text foxtrot search edges');
    const text: string = 'foxtrot';
    expect(text.indexOf('f')).assertEqual(0);
    expect(text.lastIndexOf('t')).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0056
   * @tc.name      testTextSense0056
   * @tc.desc      Text foxtrot keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0056', 'text foxtrot prefix and suffix');
    const text: string = 'foxtrot';
    expect(text.startsWith('fo')).assertTrue();
    expect(text.endsWith('ot')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0057
   * @tc.name      testTextSense0057
   * @tc.desc      Text foxtrot keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0057', 'text foxtrot split join');
    const text: string = 'foxtrot';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0058
   * @tc.name      testTextSense0058
   * @tc.desc      Text foxtrot keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0058', 'text foxtrot pad edges');
    const text: string = 'foxtrot';
    expect(text.padStart(10, '0').length).assertEqual(10);
    expect(text.padEnd(9, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0059
   * @tc.name      testTextSense0059
   * @tc.desc      Text foxtrot keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0059', 'text foxtrot replace first');
    const text: string = 'foxtrot';
    expect(text.replace('f', '#')).assertEqual('#oxtrot');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0060
   * @tc.name      testTextSense0060
   * @tc.desc      Text foxtrot keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0060', 'text foxtrot repeat twice');
    const text: string = 'foxtrot';
    expect(text.repeat(2)).assertEqual('foxtrotfoxtrot');
    expect(text.repeat(2).length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0061
   * @tc.name      testTextSense0061
   * @tc.desc      Text golf keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0061', 'text golf length');
    const text: string = 'golf';
    expect(text.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0062
   * @tc.name      testTextSense0062
   * @tc.desc      Text golf keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0062', 'text golf middle char');
    const text: string = 'golf';
    expect(text.charAt(2)).assertEqual('l');
    expect(text.charCodeAt(2)).assertEqual(108);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0063
   * @tc.name      testTextSense0063
   * @tc.desc      Text golf keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0063', 'text golf slice equals substring');
    const text: string = 'golf';
    expect(text.slice(2)).assertEqual('lf');
    expect(text.substring(2)).assertEqual('lf');
    expect(text.slice(2).length + 2).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0064
   * @tc.name      testTextSense0064
   * @tc.desc      Text golf keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0064', 'text golf case pairs');
    const text: string = 'golf';
    expect(text.toUpperCase()).assertEqual('GOLF');
    expect(text.toLowerCase()).assertEqual('golf');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0065
   * @tc.name      testTextSense0065
   * @tc.desc      Text golf keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0065', 'text golf search edges');
    const text: string = 'golf';
    expect(text.indexOf('g')).assertEqual(0);
    expect(text.lastIndexOf('f')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0066
   * @tc.name      testTextSense0066
   * @tc.desc      Text golf keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0066', 'text golf prefix and suffix');
    const text: string = 'golf';
    expect(text.startsWith('go')).assertTrue();
    expect(text.endsWith('lf')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0067
   * @tc.name      testTextSense0067
   * @tc.desc      Text golf keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0067', 'text golf split join');
    const text: string = 'golf';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0068
   * @tc.name      testTextSense0068
   * @tc.desc      Text golf keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0068', 'text golf pad edges');
    const text: string = 'golf';
    expect(text.padStart(7, '0').length).assertEqual(7);
    expect(text.padEnd(6, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0069
   * @tc.name      testTextSense0069
   * @tc.desc      Text golf keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0069', 'text golf replace first');
    const text: string = 'golf';
    expect(text.replace('g', '#')).assertEqual('#olf');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0070
   * @tc.name      testTextSense0070
   * @tc.desc      Text golf keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0070', 'text golf repeat twice');
    const text: string = 'golf';
    expect(text.repeat(2)).assertEqual('golfgolf');
    expect(text.repeat(2).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0071
   * @tc.name      testTextSense0071
   * @tc.desc      Text hotel keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0071', 'text hotel length');
    const text: string = 'hotel';
    expect(text.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0072
   * @tc.name      testTextSense0072
   * @tc.desc      Text hotel keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0072', 'text hotel middle char');
    const text: string = 'hotel';
    expect(text.charAt(2)).assertEqual('t');
    expect(text.charCodeAt(2)).assertEqual(116);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0073
   * @tc.name      testTextSense0073
   * @tc.desc      Text hotel keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0073', 'text hotel slice equals substring');
    const text: string = 'hotel';
    expect(text.slice(2)).assertEqual('tel');
    expect(text.substring(2)).assertEqual('tel');
    expect(text.slice(2).length + 2).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0074
   * @tc.name      testTextSense0074
   * @tc.desc      Text hotel keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0074', 'text hotel case pairs');
    const text: string = 'hotel';
    expect(text.toUpperCase()).assertEqual('HOTEL');
    expect(text.toLowerCase()).assertEqual('hotel');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0075
   * @tc.name      testTextSense0075
   * @tc.desc      Text hotel keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0075', 'text hotel search edges');
    const text: string = 'hotel';
    expect(text.indexOf('h')).assertEqual(0);
    expect(text.lastIndexOf('l')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0076
   * @tc.name      testTextSense0076
   * @tc.desc      Text hotel keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0076', 'text hotel prefix and suffix');
    const text: string = 'hotel';
    expect(text.startsWith('ho')).assertTrue();
    expect(text.endsWith('el')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0077
   * @tc.name      testTextSense0077
   * @tc.desc      Text hotel keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0077', 'text hotel split join');
    const text: string = 'hotel';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0078
   * @tc.name      testTextSense0078
   * @tc.desc      Text hotel keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0078', 'text hotel pad edges');
    const text: string = 'hotel';
    expect(text.padStart(8, '0').length).assertEqual(8);
    expect(text.padEnd(7, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0079
   * @tc.name      testTextSense0079
   * @tc.desc      Text hotel keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0079', 'text hotel replace first');
    const text: string = 'hotel';
    expect(text.replace('h', '#')).assertEqual('#otel');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0080
   * @tc.name      testTextSense0080
   * @tc.desc      Text hotel keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0080', 'text hotel repeat twice');
    const text: string = 'hotel';
    expect(text.repeat(2)).assertEqual('hotelhotel');
    expect(text.repeat(2).length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0081
   * @tc.name      testTextSense0081
   * @tc.desc      Text india keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0081', 'text india length');
    const text: string = 'india';
    expect(text.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0082
   * @tc.name      testTextSense0082
   * @tc.desc      Text india keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0082', 'text india middle char');
    const text: string = 'india';
    expect(text.charAt(2)).assertEqual('d');
    expect(text.charCodeAt(2)).assertEqual(100);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0083
   * @tc.name      testTextSense0083
   * @tc.desc      Text india keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0083', 'text india slice equals substring');
    const text: string = 'india';
    expect(text.slice(2)).assertEqual('dia');
    expect(text.substring(2)).assertEqual('dia');
    expect(text.slice(2).length + 2).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0084
   * @tc.name      testTextSense0084
   * @tc.desc      Text india keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0084', 'text india case pairs');
    const text: string = 'india';
    expect(text.toUpperCase()).assertEqual('INDIA');
    expect(text.toLowerCase()).assertEqual('india');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0085
   * @tc.name      testTextSense0085
   * @tc.desc      Text india keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0085', 'text india search edges');
    const text: string = 'india';
    expect(text.indexOf('i')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0086
   * @tc.name      testTextSense0086
   * @tc.desc      Text india keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0086', 'text india prefix and suffix');
    const text: string = 'india';
    expect(text.startsWith('in')).assertTrue();
    expect(text.endsWith('ia')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0087
   * @tc.name      testTextSense0087
   * @tc.desc      Text india keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0087', 'text india split join');
    const text: string = 'india';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0088
   * @tc.name      testTextSense0088
   * @tc.desc      Text india keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0088', 'text india pad edges');
    const text: string = 'india';
    expect(text.padStart(8, '0').length).assertEqual(8);
    expect(text.padEnd(7, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0089
   * @tc.name      testTextSense0089
   * @tc.desc      Text india keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0089', 'text india replace first');
    const text: string = 'india';
    expect(text.replace('i', '#')).assertEqual('#ndia');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0090
   * @tc.name      testTextSense0090
   * @tc.desc      Text india keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0090', 'text india repeat twice');
    const text: string = 'india';
    expect(text.repeat(2)).assertEqual('indiaindia');
    expect(text.repeat(2).length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0091
   * @tc.name      testTextSense0091
   * @tc.desc      Text juliet keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0091', 'text juliet length');
    const text: string = 'juliet';
    expect(text.length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0092
   * @tc.name      testTextSense0092
   * @tc.desc      Text juliet keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0092', 'text juliet middle char');
    const text: string = 'juliet';
    expect(text.charAt(3)).assertEqual('i');
    expect(text.charCodeAt(3)).assertEqual(105);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0093
   * @tc.name      testTextSense0093
   * @tc.desc      Text juliet keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0093', 'text juliet slice equals substring');
    const text: string = 'juliet';
    expect(text.slice(3)).assertEqual('iet');
    expect(text.substring(3)).assertEqual('iet');
    expect(text.slice(3).length + 3).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0094
   * @tc.name      testTextSense0094
   * @tc.desc      Text juliet keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0094', 'text juliet case pairs');
    const text: string = 'juliet';
    expect(text.toUpperCase()).assertEqual('JULIET');
    expect(text.toLowerCase()).assertEqual('juliet');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0095
   * @tc.name      testTextSense0095
   * @tc.desc      Text juliet keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0095', 'text juliet search edges');
    const text: string = 'juliet';
    expect(text.indexOf('j')).assertEqual(0);
    expect(text.lastIndexOf('t')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0096
   * @tc.name      testTextSense0096
   * @tc.desc      Text juliet keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0096', 'text juliet prefix and suffix');
    const text: string = 'juliet';
    expect(text.startsWith('ju')).assertTrue();
    expect(text.endsWith('et')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0097
   * @tc.name      testTextSense0097
   * @tc.desc      Text juliet keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0097', 'text juliet split join');
    const text: string = 'juliet';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0098
   * @tc.name      testTextSense0098
   * @tc.desc      Text juliet keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0098', 'text juliet pad edges');
    const text: string = 'juliet';
    expect(text.padStart(9, '0').length).assertEqual(9);
    expect(text.padEnd(8, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0099
   * @tc.name      testTextSense0099
   * @tc.desc      Text juliet keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0099', 'text juliet replace first');
    const text: string = 'juliet';
    expect(text.replace('j', '#')).assertEqual('#uliet');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0100
   * @tc.name      testTextSense0100
   * @tc.desc      Text juliet keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0100', 'text juliet repeat twice');
    const text: string = 'juliet';
    expect(text.repeat(2)).assertEqual('julietjuliet');
    expect(text.repeat(2).length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0101
   * @tc.name      testTextSense0101
   * @tc.desc      Text kilo keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0101', 'text kilo length');
    const text: string = 'kilo';
    expect(text.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0102
   * @tc.name      testTextSense0102
   * @tc.desc      Text kilo keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0102', 'text kilo middle char');
    const text: string = 'kilo';
    expect(text.charAt(2)).assertEqual('l');
    expect(text.charCodeAt(2)).assertEqual(108);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0103
   * @tc.name      testTextSense0103
   * @tc.desc      Text kilo keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0103', 'text kilo slice equals substring');
    const text: string = 'kilo';
    expect(text.slice(2)).assertEqual('lo');
    expect(text.substring(2)).assertEqual('lo');
    expect(text.slice(2).length + 2).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0104
   * @tc.name      testTextSense0104
   * @tc.desc      Text kilo keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0104', 'text kilo case pairs');
    const text: string = 'kilo';
    expect(text.toUpperCase()).assertEqual('KILO');
    expect(text.toLowerCase()).assertEqual('kilo');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0105
   * @tc.name      testTextSense0105
   * @tc.desc      Text kilo keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0105', 'text kilo search edges');
    const text: string = 'kilo';
    expect(text.indexOf('k')).assertEqual(0);
    expect(text.lastIndexOf('o')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0106
   * @tc.name      testTextSense0106
   * @tc.desc      Text kilo keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0106', 'text kilo prefix and suffix');
    const text: string = 'kilo';
    expect(text.startsWith('ki')).assertTrue();
    expect(text.endsWith('lo')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0107
   * @tc.name      testTextSense0107
   * @tc.desc      Text kilo keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0107', 'text kilo split join');
    const text: string = 'kilo';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0108
   * @tc.name      testTextSense0108
   * @tc.desc      Text kilo keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0108', 'text kilo pad edges');
    const text: string = 'kilo';
    expect(text.padStart(7, '0').length).assertEqual(7);
    expect(text.padEnd(6, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0109
   * @tc.name      testTextSense0109
   * @tc.desc      Text kilo keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0109', 'text kilo replace first');
    const text: string = 'kilo';
    expect(text.replace('k', '#')).assertEqual('#ilo');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0110
   * @tc.name      testTextSense0110
   * @tc.desc      Text kilo keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0110', 'text kilo repeat twice');
    const text: string = 'kilo';
    expect(text.repeat(2)).assertEqual('kilokilo');
    expect(text.repeat(2).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0111
   * @tc.name      testTextSense0111
   * @tc.desc      Text lima keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0111', 'text lima length');
    const text: string = 'lima';
    expect(text.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0112
   * @tc.name      testTextSense0112
   * @tc.desc      Text lima keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0112', 'text lima middle char');
    const text: string = 'lima';
    expect(text.charAt(2)).assertEqual('m');
    expect(text.charCodeAt(2)).assertEqual(109);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0113
   * @tc.name      testTextSense0113
   * @tc.desc      Text lima keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0113', 'text lima slice equals substring');
    const text: string = 'lima';
    expect(text.slice(2)).assertEqual('ma');
    expect(text.substring(2)).assertEqual('ma');
    expect(text.slice(2).length + 2).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0114
   * @tc.name      testTextSense0114
   * @tc.desc      Text lima keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0114', 'text lima case pairs');
    const text: string = 'lima';
    expect(text.toUpperCase()).assertEqual('LIMA');
    expect(text.toLowerCase()).assertEqual('lima');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0115
   * @tc.name      testTextSense0115
   * @tc.desc      Text lima keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0115', 'text lima search edges');
    const text: string = 'lima';
    expect(text.indexOf('l')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0116
   * @tc.name      testTextSense0116
   * @tc.desc      Text lima keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0116', 'text lima prefix and suffix');
    const text: string = 'lima';
    expect(text.startsWith('li')).assertTrue();
    expect(text.endsWith('ma')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0117
   * @tc.name      testTextSense0117
   * @tc.desc      Text lima keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0117', 'text lima split join');
    const text: string = 'lima';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0118
   * @tc.name      testTextSense0118
   * @tc.desc      Text lima keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0118', 'text lima pad edges');
    const text: string = 'lima';
    expect(text.padStart(7, '0').length).assertEqual(7);
    expect(text.padEnd(6, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0119
   * @tc.name      testTextSense0119
   * @tc.desc      Text lima keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0119', 'text lima replace first');
    const text: string = 'lima';
    expect(text.replace('l', '#')).assertEqual('#ima');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0120
   * @tc.name      testTextSense0120
   * @tc.desc      Text lima keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0120', 'text lima repeat twice');
    const text: string = 'lima';
    expect(text.repeat(2)).assertEqual('limalima');
    expect(text.repeat(2).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0121
   * @tc.name      testTextSense0121
   * @tc.desc      Text mike keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0121', 'text mike length');
    const text: string = 'mike';
    expect(text.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0122
   * @tc.name      testTextSense0122
   * @tc.desc      Text mike keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0122', 'text mike middle char');
    const text: string = 'mike';
    expect(text.charAt(2)).assertEqual('k');
    expect(text.charCodeAt(2)).assertEqual(107);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0123
   * @tc.name      testTextSense0123
   * @tc.desc      Text mike keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0123', 'text mike slice equals substring');
    const text: string = 'mike';
    expect(text.slice(2)).assertEqual('ke');
    expect(text.substring(2)).assertEqual('ke');
    expect(text.slice(2).length + 2).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0124
   * @tc.name      testTextSense0124
   * @tc.desc      Text mike keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0124', 'text mike case pairs');
    const text: string = 'mike';
    expect(text.toUpperCase()).assertEqual('MIKE');
    expect(text.toLowerCase()).assertEqual('mike');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0125
   * @tc.name      testTextSense0125
   * @tc.desc      Text mike keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0125', 'text mike search edges');
    const text: string = 'mike';
    expect(text.indexOf('m')).assertEqual(0);
    expect(text.lastIndexOf('e')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0126
   * @tc.name      testTextSense0126
   * @tc.desc      Text mike keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0126', 'text mike prefix and suffix');
    const text: string = 'mike';
    expect(text.startsWith('mi')).assertTrue();
    expect(text.endsWith('ke')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0127
   * @tc.name      testTextSense0127
   * @tc.desc      Text mike keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0127', 'text mike split join');
    const text: string = 'mike';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0128
   * @tc.name      testTextSense0128
   * @tc.desc      Text mike keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0128', 'text mike pad edges');
    const text: string = 'mike';
    expect(text.padStart(7, '0').length).assertEqual(7);
    expect(text.padEnd(6, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0129
   * @tc.name      testTextSense0129
   * @tc.desc      Text mike keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0129', 'text mike replace first');
    const text: string = 'mike';
    expect(text.replace('m', '#')).assertEqual('#ike');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0130
   * @tc.name      testTextSense0130
   * @tc.desc      Text mike keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0130', 'text mike repeat twice');
    const text: string = 'mike';
    expect(text.repeat(2)).assertEqual('mikemike');
    expect(text.repeat(2).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0131
   * @tc.name      testTextSense0131
   * @tc.desc      Text november keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0131', 'text november length');
    const text: string = 'november';
    expect(text.length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0132
   * @tc.name      testTextSense0132
   * @tc.desc      Text november keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0132', 'text november middle char');
    const text: string = 'november';
    expect(text.charAt(4)).assertEqual('m');
    expect(text.charCodeAt(4)).assertEqual(109);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0133
   * @tc.name      testTextSense0133
   * @tc.desc      Text november keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0133', 'text november slice equals substring');
    const text: string = 'november';
    expect(text.slice(4)).assertEqual('mber');
    expect(text.substring(4)).assertEqual('mber');
    expect(text.slice(4).length + 4).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0134
   * @tc.name      testTextSense0134
   * @tc.desc      Text november keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0134', 'text november case pairs');
    const text: string = 'november';
    expect(text.toUpperCase()).assertEqual('NOVEMBER');
    expect(text.toLowerCase()).assertEqual('november');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0135
   * @tc.name      testTextSense0135
   * @tc.desc      Text november keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0135', 'text november search edges');
    const text: string = 'november';
    expect(text.indexOf('n')).assertEqual(0);
    expect(text.lastIndexOf('r')).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0136
   * @tc.name      testTextSense0136
   * @tc.desc      Text november keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0136', 'text november prefix and suffix');
    const text: string = 'november';
    expect(text.startsWith('no')).assertTrue();
    expect(text.endsWith('er')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0137
   * @tc.name      testTextSense0137
   * @tc.desc      Text november keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0137', 'text november split join');
    const text: string = 'november';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0138
   * @tc.name      testTextSense0138
   * @tc.desc      Text november keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0138', 'text november pad edges');
    const text: string = 'november';
    expect(text.padStart(11, '0').length).assertEqual(11);
    expect(text.padEnd(10, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0139
   * @tc.name      testTextSense0139
   * @tc.desc      Text november keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0139', 'text november replace first');
    const text: string = 'november';
    expect(text.replace('n', '#')).assertEqual('#ovember');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0140
   * @tc.name      testTextSense0140
   * @tc.desc      Text november keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0140', 'text november repeat twice');
    const text: string = 'november';
    expect(text.repeat(2)).assertEqual('novembernovember');
    expect(text.repeat(2).length).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0141
   * @tc.name      testTextSense0141
   * @tc.desc      Text oscar keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0141', 'text oscar length');
    const text: string = 'oscar';
    expect(text.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0142
   * @tc.name      testTextSense0142
   * @tc.desc      Text oscar keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0142', 'text oscar middle char');
    const text: string = 'oscar';
    expect(text.charAt(2)).assertEqual('c');
    expect(text.charCodeAt(2)).assertEqual(99);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0143
   * @tc.name      testTextSense0143
   * @tc.desc      Text oscar keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0143', 'text oscar slice equals substring');
    const text: string = 'oscar';
    expect(text.slice(2)).assertEqual('car');
    expect(text.substring(2)).assertEqual('car');
    expect(text.slice(2).length + 2).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0144
   * @tc.name      testTextSense0144
   * @tc.desc      Text oscar keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0144', 'text oscar case pairs');
    const text: string = 'oscar';
    expect(text.toUpperCase()).assertEqual('OSCAR');
    expect(text.toLowerCase()).assertEqual('oscar');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0145
   * @tc.name      testTextSense0145
   * @tc.desc      Text oscar keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0145', 'text oscar search edges');
    const text: string = 'oscar';
    expect(text.indexOf('o')).assertEqual(0);
    expect(text.lastIndexOf('r')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0146
   * @tc.name      testTextSense0146
   * @tc.desc      Text oscar keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0146', 'text oscar prefix and suffix');
    const text: string = 'oscar';
    expect(text.startsWith('os')).assertTrue();
    expect(text.endsWith('ar')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0147
   * @tc.name      testTextSense0147
   * @tc.desc      Text oscar keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0147', 'text oscar split join');
    const text: string = 'oscar';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0148
   * @tc.name      testTextSense0148
   * @tc.desc      Text oscar keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0148', 'text oscar pad edges');
    const text: string = 'oscar';
    expect(text.padStart(8, '0').length).assertEqual(8);
    expect(text.padEnd(7, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0149
   * @tc.name      testTextSense0149
   * @tc.desc      Text oscar keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0149', 'text oscar replace first');
    const text: string = 'oscar';
    expect(text.replace('o', '#')).assertEqual('#scar');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0150
   * @tc.name      testTextSense0150
   * @tc.desc      Text oscar keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0150', 'text oscar repeat twice');
    const text: string = 'oscar';
    expect(text.repeat(2)).assertEqual('oscaroscar');
    expect(text.repeat(2).length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0151
   * @tc.name      testTextSense0151
   * @tc.desc      Text papa keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0151', 'text papa length');
    const text: string = 'papa';
    expect(text.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0152
   * @tc.name      testTextSense0152
   * @tc.desc      Text papa keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0152', 'text papa middle char');
    const text: string = 'papa';
    expect(text.charAt(2)).assertEqual('p');
    expect(text.charCodeAt(2)).assertEqual(112);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0153
   * @tc.name      testTextSense0153
   * @tc.desc      Text papa keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0153', 'text papa slice equals substring');
    const text: string = 'papa';
    expect(text.slice(2)).assertEqual('pa');
    expect(text.substring(2)).assertEqual('pa');
    expect(text.slice(2).length + 2).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0154
   * @tc.name      testTextSense0154
   * @tc.desc      Text papa keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0154', 'text papa case pairs');
    const text: string = 'papa';
    expect(text.toUpperCase()).assertEqual('PAPA');
    expect(text.toLowerCase()).assertEqual('papa');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0155
   * @tc.name      testTextSense0155
   * @tc.desc      Text papa keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0155', 'text papa search edges');
    const text: string = 'papa';
    expect(text.indexOf('p')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0156
   * @tc.name      testTextSense0156
   * @tc.desc      Text papa keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0156', 'text papa prefix and suffix');
    const text: string = 'papa';
    expect(text.startsWith('pa')).assertTrue();
    expect(text.endsWith('pa')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0157
   * @tc.name      testTextSense0157
   * @tc.desc      Text papa keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0157', 'text papa split join');
    const text: string = 'papa';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0158
   * @tc.name      testTextSense0158
   * @tc.desc      Text papa keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0158', 'text papa pad edges');
    const text: string = 'papa';
    expect(text.padStart(7, '0').length).assertEqual(7);
    expect(text.padEnd(6, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0159
   * @tc.name      testTextSense0159
   * @tc.desc      Text papa keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0159', 'text papa replace first');
    const text: string = 'papa';
    expect(text.replace('p', '#')).assertEqual('#apa');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0160
   * @tc.name      testTextSense0160
   * @tc.desc      Text papa keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0160', 'text papa repeat twice');
    const text: string = 'papa';
    expect(text.repeat(2)).assertEqual('papapapa');
    expect(text.repeat(2).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0161
   * @tc.name      testTextSense0161
   * @tc.desc      Text quebec keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0161', 'text quebec length');
    const text: string = 'quebec';
    expect(text.length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0162
   * @tc.name      testTextSense0162
   * @tc.desc      Text quebec keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0162', 'text quebec middle char');
    const text: string = 'quebec';
    expect(text.charAt(3)).assertEqual('b');
    expect(text.charCodeAt(3)).assertEqual(98);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0163
   * @tc.name      testTextSense0163
   * @tc.desc      Text quebec keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0163', 'text quebec slice equals substring');
    const text: string = 'quebec';
    expect(text.slice(3)).assertEqual('bec');
    expect(text.substring(3)).assertEqual('bec');
    expect(text.slice(3).length + 3).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0164
   * @tc.name      testTextSense0164
   * @tc.desc      Text quebec keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0164', 'text quebec case pairs');
    const text: string = 'quebec';
    expect(text.toUpperCase()).assertEqual('QUEBEC');
    expect(text.toLowerCase()).assertEqual('quebec');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0165
   * @tc.name      testTextSense0165
   * @tc.desc      Text quebec keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0165', 'text quebec search edges');
    const text: string = 'quebec';
    expect(text.indexOf('q')).assertEqual(0);
    expect(text.lastIndexOf('c')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0166
   * @tc.name      testTextSense0166
   * @tc.desc      Text quebec keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0166', 'text quebec prefix and suffix');
    const text: string = 'quebec';
    expect(text.startsWith('qu')).assertTrue();
    expect(text.endsWith('ec')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0167
   * @tc.name      testTextSense0167
   * @tc.desc      Text quebec keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0167', 'text quebec split join');
    const text: string = 'quebec';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0168
   * @tc.name      testTextSense0168
   * @tc.desc      Text quebec keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0168', 'text quebec pad edges');
    const text: string = 'quebec';
    expect(text.padStart(9, '0').length).assertEqual(9);
    expect(text.padEnd(8, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0169
   * @tc.name      testTextSense0169
   * @tc.desc      Text quebec keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0169', 'text quebec replace first');
    const text: string = 'quebec';
    expect(text.replace('q', '#')).assertEqual('#uebec');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0170
   * @tc.name      testTextSense0170
   * @tc.desc      Text quebec keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0170', 'text quebec repeat twice');
    const text: string = 'quebec';
    expect(text.repeat(2)).assertEqual('quebecquebec');
    expect(text.repeat(2).length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0171
   * @tc.name      testTextSense0171
   * @tc.desc      Text romeo keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0171', 'text romeo length');
    const text: string = 'romeo';
    expect(text.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0172
   * @tc.name      testTextSense0172
   * @tc.desc      Text romeo keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0172', 'text romeo middle char');
    const text: string = 'romeo';
    expect(text.charAt(2)).assertEqual('m');
    expect(text.charCodeAt(2)).assertEqual(109);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0173
   * @tc.name      testTextSense0173
   * @tc.desc      Text romeo keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0173', 'text romeo slice equals substring');
    const text: string = 'romeo';
    expect(text.slice(2)).assertEqual('meo');
    expect(text.substring(2)).assertEqual('meo');
    expect(text.slice(2).length + 2).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0174
   * @tc.name      testTextSense0174
   * @tc.desc      Text romeo keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0174', 'text romeo case pairs');
    const text: string = 'romeo';
    expect(text.toUpperCase()).assertEqual('ROMEO');
    expect(text.toLowerCase()).assertEqual('romeo');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0175
   * @tc.name      testTextSense0175
   * @tc.desc      Text romeo keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0175', 'text romeo search edges');
    const text: string = 'romeo';
    expect(text.indexOf('r')).assertEqual(0);
    expect(text.lastIndexOf('o')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0176
   * @tc.name      testTextSense0176
   * @tc.desc      Text romeo keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0176', 'text romeo prefix and suffix');
    const text: string = 'romeo';
    expect(text.startsWith('ro')).assertTrue();
    expect(text.endsWith('eo')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0177
   * @tc.name      testTextSense0177
   * @tc.desc      Text romeo keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0177', 'text romeo split join');
    const text: string = 'romeo';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0178
   * @tc.name      testTextSense0178
   * @tc.desc      Text romeo keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0178', 'text romeo pad edges');
    const text: string = 'romeo';
    expect(text.padStart(8, '0').length).assertEqual(8);
    expect(text.padEnd(7, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0179
   * @tc.name      testTextSense0179
   * @tc.desc      Text romeo keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0179', 'text romeo replace first');
    const text: string = 'romeo';
    expect(text.replace('r', '#')).assertEqual('#omeo');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0180
   * @tc.name      testTextSense0180
   * @tc.desc      Text romeo keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0180', 'text romeo repeat twice');
    const text: string = 'romeo';
    expect(text.repeat(2)).assertEqual('romeoromeo');
    expect(text.repeat(2).length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0181
   * @tc.name      testTextSense0181
   * @tc.desc      Text sierra keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0181', 'text sierra length');
    const text: string = 'sierra';
    expect(text.length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0182
   * @tc.name      testTextSense0182
   * @tc.desc      Text sierra keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0182', 'text sierra middle char');
    const text: string = 'sierra';
    expect(text.charAt(3)).assertEqual('r');
    expect(text.charCodeAt(3)).assertEqual(114);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0183
   * @tc.name      testTextSense0183
   * @tc.desc      Text sierra keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0183', 'text sierra slice equals substring');
    const text: string = 'sierra';
    expect(text.slice(3)).assertEqual('rra');
    expect(text.substring(3)).assertEqual('rra');
    expect(text.slice(3).length + 3).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0184
   * @tc.name      testTextSense0184
   * @tc.desc      Text sierra keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0184', 'text sierra case pairs');
    const text: string = 'sierra';
    expect(text.toUpperCase()).assertEqual('SIERRA');
    expect(text.toLowerCase()).assertEqual('sierra');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0185
   * @tc.name      testTextSense0185
   * @tc.desc      Text sierra keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0185', 'text sierra search edges');
    const text: string = 'sierra';
    expect(text.indexOf('s')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0186
   * @tc.name      testTextSense0186
   * @tc.desc      Text sierra keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0186', 'text sierra prefix and suffix');
    const text: string = 'sierra';
    expect(text.startsWith('si')).assertTrue();
    expect(text.endsWith('ra')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0187
   * @tc.name      testTextSense0187
   * @tc.desc      Text sierra keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0187', 'text sierra split join');
    const text: string = 'sierra';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0188
   * @tc.name      testTextSense0188
   * @tc.desc      Text sierra keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0188', 'text sierra pad edges');
    const text: string = 'sierra';
    expect(text.padStart(9, '0').length).assertEqual(9);
    expect(text.padEnd(8, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0189
   * @tc.name      testTextSense0189
   * @tc.desc      Text sierra keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0189', 'text sierra replace first');
    const text: string = 'sierra';
    expect(text.replace('s', '#')).assertEqual('#ierra');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0190
   * @tc.name      testTextSense0190
   * @tc.desc      Text sierra keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0190', 'text sierra repeat twice');
    const text: string = 'sierra';
    expect(text.repeat(2)).assertEqual('sierrasierra');
    expect(text.repeat(2).length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0191
   * @tc.name      testTextSense0191
   * @tc.desc      Text tango keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0191', 'text tango length');
    const text: string = 'tango';
    expect(text.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0192
   * @tc.name      testTextSense0192
   * @tc.desc      Text tango keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0192', 'text tango middle char');
    const text: string = 'tango';
    expect(text.charAt(2)).assertEqual('n');
    expect(text.charCodeAt(2)).assertEqual(110);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0193
   * @tc.name      testTextSense0193
   * @tc.desc      Text tango keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0193', 'text tango slice equals substring');
    const text: string = 'tango';
    expect(text.slice(2)).assertEqual('ngo');
    expect(text.substring(2)).assertEqual('ngo');
    expect(text.slice(2).length + 2).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0194
   * @tc.name      testTextSense0194
   * @tc.desc      Text tango keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0194', 'text tango case pairs');
    const text: string = 'tango';
    expect(text.toUpperCase()).assertEqual('TANGO');
    expect(text.toLowerCase()).assertEqual('tango');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0195
   * @tc.name      testTextSense0195
   * @tc.desc      Text tango keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0195', 'text tango search edges');
    const text: string = 'tango';
    expect(text.indexOf('t')).assertEqual(0);
    expect(text.lastIndexOf('o')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0196
   * @tc.name      testTextSense0196
   * @tc.desc      Text tango keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0196', 'text tango prefix and suffix');
    const text: string = 'tango';
    expect(text.startsWith('ta')).assertTrue();
    expect(text.endsWith('go')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0197
   * @tc.name      testTextSense0197
   * @tc.desc      Text tango keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0197', 'text tango split join');
    const text: string = 'tango';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0198
   * @tc.name      testTextSense0198
   * @tc.desc      Text tango keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0198', 'text tango pad edges');
    const text: string = 'tango';
    expect(text.padStart(8, '0').length).assertEqual(8);
    expect(text.padEnd(7, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0199
   * @tc.name      testTextSense0199
   * @tc.desc      Text tango keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0199', 'text tango replace first');
    const text: string = 'tango';
    expect(text.replace('t', '#')).assertEqual('#ango');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0200
   * @tc.name      testTextSense0200
   * @tc.desc      Text tango keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0200', 'text tango repeat twice');
    const text: string = 'tango';
    expect(text.repeat(2)).assertEqual('tangotango');
    expect(text.repeat(2).length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0201
   * @tc.name      testTextSense0201
   * @tc.desc      Text uniform keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0201', 'text uniform length');
    const text: string = 'uniform';
    expect(text.length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0202
   * @tc.name      testTextSense0202
   * @tc.desc      Text uniform keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0202', 'text uniform middle char');
    const text: string = 'uniform';
    expect(text.charAt(3)).assertEqual('f');
    expect(text.charCodeAt(3)).assertEqual(102);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0203
   * @tc.name      testTextSense0203
   * @tc.desc      Text uniform keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0203', 'text uniform slice equals substring');
    const text: string = 'uniform';
    expect(text.slice(3)).assertEqual('form');
    expect(text.substring(3)).assertEqual('form');
    expect(text.slice(3).length + 3).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0204
   * @tc.name      testTextSense0204
   * @tc.desc      Text uniform keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0204', 'text uniform case pairs');
    const text: string = 'uniform';
    expect(text.toUpperCase()).assertEqual('UNIFORM');
    expect(text.toLowerCase()).assertEqual('uniform');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0205
   * @tc.name      testTextSense0205
   * @tc.desc      Text uniform keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0205', 'text uniform search edges');
    const text: string = 'uniform';
    expect(text.indexOf('u')).assertEqual(0);
    expect(text.lastIndexOf('m')).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0206
   * @tc.name      testTextSense0206
   * @tc.desc      Text uniform keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0206', 'text uniform prefix and suffix');
    const text: string = 'uniform';
    expect(text.startsWith('un')).assertTrue();
    expect(text.endsWith('rm')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0207
   * @tc.name      testTextSense0207
   * @tc.desc      Text uniform keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0207', 'text uniform split join');
    const text: string = 'uniform';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0208
   * @tc.name      testTextSense0208
   * @tc.desc      Text uniform keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0208', 'text uniform pad edges');
    const text: string = 'uniform';
    expect(text.padStart(10, '0').length).assertEqual(10);
    expect(text.padEnd(9, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0209
   * @tc.name      testTextSense0209
   * @tc.desc      Text uniform keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0209', 'text uniform replace first');
    const text: string = 'uniform';
    expect(text.replace('u', '#')).assertEqual('#niform');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0210
   * @tc.name      testTextSense0210
   * @tc.desc      Text uniform keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0210', 'text uniform repeat twice');
    const text: string = 'uniform';
    expect(text.repeat(2)).assertEqual('uniformuniform');
    expect(text.repeat(2).length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0211
   * @tc.name      testTextSense0211
   * @tc.desc      Text victor keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0211', 'text victor length');
    const text: string = 'victor';
    expect(text.length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0212
   * @tc.name      testTextSense0212
   * @tc.desc      Text victor keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0212', 'text victor middle char');
    const text: string = 'victor';
    expect(text.charAt(3)).assertEqual('t');
    expect(text.charCodeAt(3)).assertEqual(116);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0213
   * @tc.name      testTextSense0213
   * @tc.desc      Text victor keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0213', 'text victor slice equals substring');
    const text: string = 'victor';
    expect(text.slice(3)).assertEqual('tor');
    expect(text.substring(3)).assertEqual('tor');
    expect(text.slice(3).length + 3).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0214
   * @tc.name      testTextSense0214
   * @tc.desc      Text victor keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0214', 'text victor case pairs');
    const text: string = 'victor';
    expect(text.toUpperCase()).assertEqual('VICTOR');
    expect(text.toLowerCase()).assertEqual('victor');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0215
   * @tc.name      testTextSense0215
   * @tc.desc      Text victor keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0215', 'text victor search edges');
    const text: string = 'victor';
    expect(text.indexOf('v')).assertEqual(0);
    expect(text.lastIndexOf('r')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0216
   * @tc.name      testTextSense0216
   * @tc.desc      Text victor keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0216', 'text victor prefix and suffix');
    const text: string = 'victor';
    expect(text.startsWith('vi')).assertTrue();
    expect(text.endsWith('or')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0217
   * @tc.name      testTextSense0217
   * @tc.desc      Text victor keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0217', 'text victor split join');
    const text: string = 'victor';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0218
   * @tc.name      testTextSense0218
   * @tc.desc      Text victor keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0218', 'text victor pad edges');
    const text: string = 'victor';
    expect(text.padStart(9, '0').length).assertEqual(9);
    expect(text.padEnd(8, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0219
   * @tc.name      testTextSense0219
   * @tc.desc      Text victor keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0219', 'text victor replace first');
    const text: string = 'victor';
    expect(text.replace('v', '#')).assertEqual('#ictor');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0220
   * @tc.name      testTextSense0220
   * @tc.desc      Text victor keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0220', 'text victor repeat twice');
    const text: string = 'victor';
    expect(text.repeat(2)).assertEqual('victorvictor');
    expect(text.repeat(2).length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0221
   * @tc.name      testTextSense0221
   * @tc.desc      Text whiskey keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0221', 'text whiskey length');
    const text: string = 'whiskey';
    expect(text.length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0222
   * @tc.name      testTextSense0222
   * @tc.desc      Text whiskey keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0222', 'text whiskey middle char');
    const text: string = 'whiskey';
    expect(text.charAt(3)).assertEqual('s');
    expect(text.charCodeAt(3)).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0223
   * @tc.name      testTextSense0223
   * @tc.desc      Text whiskey keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0223', 'text whiskey slice equals substring');
    const text: string = 'whiskey';
    expect(text.slice(3)).assertEqual('skey');
    expect(text.substring(3)).assertEqual('skey');
    expect(text.slice(3).length + 3).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0224
   * @tc.name      testTextSense0224
   * @tc.desc      Text whiskey keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0224', 'text whiskey case pairs');
    const text: string = 'whiskey';
    expect(text.toUpperCase()).assertEqual('WHISKEY');
    expect(text.toLowerCase()).assertEqual('whiskey');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0225
   * @tc.name      testTextSense0225
   * @tc.desc      Text whiskey keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0225', 'text whiskey search edges');
    const text: string = 'whiskey';
    expect(text.indexOf('w')).assertEqual(0);
    expect(text.lastIndexOf('y')).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0226
   * @tc.name      testTextSense0226
   * @tc.desc      Text whiskey keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0226', 'text whiskey prefix and suffix');
    const text: string = 'whiskey';
    expect(text.startsWith('wh')).assertTrue();
    expect(text.endsWith('ey')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0227
   * @tc.name      testTextSense0227
   * @tc.desc      Text whiskey keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0227', 'text whiskey split join');
    const text: string = 'whiskey';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0228
   * @tc.name      testTextSense0228
   * @tc.desc      Text whiskey keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0228', 'text whiskey pad edges');
    const text: string = 'whiskey';
    expect(text.padStart(10, '0').length).assertEqual(10);
    expect(text.padEnd(9, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0229
   * @tc.name      testTextSense0229
   * @tc.desc      Text whiskey keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0229', 'text whiskey replace first');
    const text: string = 'whiskey';
    expect(text.replace('w', '#')).assertEqual('#hiskey');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0230
   * @tc.name      testTextSense0230
   * @tc.desc      Text whiskey keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0230', 'text whiskey repeat twice');
    const text: string = 'whiskey';
    expect(text.repeat(2)).assertEqual('whiskeywhiskey');
    expect(text.repeat(2).length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0231
   * @tc.name      testTextSense0231
   * @tc.desc      Text xray keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0231', 'text xray length');
    const text: string = 'xray';
    expect(text.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0232
   * @tc.name      testTextSense0232
   * @tc.desc      Text xray keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0232', 'text xray middle char');
    const text: string = 'xray';
    expect(text.charAt(2)).assertEqual('a');
    expect(text.charCodeAt(2)).assertEqual(97);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0233
   * @tc.name      testTextSense0233
   * @tc.desc      Text xray keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0233', 'text xray slice equals substring');
    const text: string = 'xray';
    expect(text.slice(2)).assertEqual('ay');
    expect(text.substring(2)).assertEqual('ay');
    expect(text.slice(2).length + 2).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0234
   * @tc.name      testTextSense0234
   * @tc.desc      Text xray keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0234', 'text xray case pairs');
    const text: string = 'xray';
    expect(text.toUpperCase()).assertEqual('XRAY');
    expect(text.toLowerCase()).assertEqual('xray');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0235
   * @tc.name      testTextSense0235
   * @tc.desc      Text xray keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0235', 'text xray search edges');
    const text: string = 'xray';
    expect(text.indexOf('x')).assertEqual(0);
    expect(text.lastIndexOf('y')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0236
   * @tc.name      testTextSense0236
   * @tc.desc      Text xray keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0236', 'text xray prefix and suffix');
    const text: string = 'xray';
    expect(text.startsWith('xr')).assertTrue();
    expect(text.endsWith('ay')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0237
   * @tc.name      testTextSense0237
   * @tc.desc      Text xray keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0237', 'text xray split join');
    const text: string = 'xray';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0238
   * @tc.name      testTextSense0238
   * @tc.desc      Text xray keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0238', 'text xray pad edges');
    const text: string = 'xray';
    expect(text.padStart(7, '0').length).assertEqual(7);
    expect(text.padEnd(6, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0239
   * @tc.name      testTextSense0239
   * @tc.desc      Text xray keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0239', 'text xray replace first');
    const text: string = 'xray';
    expect(text.replace('x', '#')).assertEqual('#ray');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0240
   * @tc.name      testTextSense0240
   * @tc.desc      Text xray keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0240', 'text xray repeat twice');
    const text: string = 'xray';
    expect(text.repeat(2)).assertEqual('xrayxray');
    expect(text.repeat(2).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0241
   * @tc.name      testTextSense0241
   * @tc.desc      Text yankee keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0241', 'text yankee length');
    const text: string = 'yankee';
    expect(text.length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0242
   * @tc.name      testTextSense0242
   * @tc.desc      Text yankee keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0242', 'text yankee middle char');
    const text: string = 'yankee';
    expect(text.charAt(3)).assertEqual('k');
    expect(text.charCodeAt(3)).assertEqual(107);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0243
   * @tc.name      testTextSense0243
   * @tc.desc      Text yankee keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0243', 'text yankee slice equals substring');
    const text: string = 'yankee';
    expect(text.slice(3)).assertEqual('kee');
    expect(text.substring(3)).assertEqual('kee');
    expect(text.slice(3).length + 3).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0244
   * @tc.name      testTextSense0244
   * @tc.desc      Text yankee keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0244', 'text yankee case pairs');
    const text: string = 'yankee';
    expect(text.toUpperCase()).assertEqual('YANKEE');
    expect(text.toLowerCase()).assertEqual('yankee');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0245
   * @tc.name      testTextSense0245
   * @tc.desc      Text yankee keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0245', 'text yankee search edges');
    const text: string = 'yankee';
    expect(text.indexOf('y')).assertEqual(0);
    expect(text.lastIndexOf('e')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0246
   * @tc.name      testTextSense0246
   * @tc.desc      Text yankee keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0246', 'text yankee prefix and suffix');
    const text: string = 'yankee';
    expect(text.startsWith('ya')).assertTrue();
    expect(text.endsWith('ee')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0247
   * @tc.name      testTextSense0247
   * @tc.desc      Text yankee keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0247', 'text yankee split join');
    const text: string = 'yankee';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0248
   * @tc.name      testTextSense0248
   * @tc.desc      Text yankee keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0248', 'text yankee pad edges');
    const text: string = 'yankee';
    expect(text.padStart(9, '0').length).assertEqual(9);
    expect(text.padEnd(8, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0249
   * @tc.name      testTextSense0249
   * @tc.desc      Text yankee keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0249', 'text yankee replace first');
    const text: string = 'yankee';
    expect(text.replace('y', '#')).assertEqual('#ankee');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0250
   * @tc.name      testTextSense0250
   * @tc.desc      Text yankee keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0250', 'text yankee repeat twice');
    const text: string = 'yankee';
    expect(text.repeat(2)).assertEqual('yankeeyankee');
    expect(text.repeat(2).length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0251
   * @tc.name      testTextSense0251
   * @tc.desc      Text zulu keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0251', 'text zulu length');
    const text: string = 'zulu';
    expect(text.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0252
   * @tc.name      testTextSense0252
   * @tc.desc      Text zulu keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0252', 'text zulu middle char');
    const text: string = 'zulu';
    expect(text.charAt(2)).assertEqual('l');
    expect(text.charCodeAt(2)).assertEqual(108);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0253
   * @tc.name      testTextSense0253
   * @tc.desc      Text zulu keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0253', 'text zulu slice equals substring');
    const text: string = 'zulu';
    expect(text.slice(2)).assertEqual('lu');
    expect(text.substring(2)).assertEqual('lu');
    expect(text.slice(2).length + 2).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0254
   * @tc.name      testTextSense0254
   * @tc.desc      Text zulu keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0254', 'text zulu case pairs');
    const text: string = 'zulu';
    expect(text.toUpperCase()).assertEqual('ZULU');
    expect(text.toLowerCase()).assertEqual('zulu');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0255
   * @tc.name      testTextSense0255
   * @tc.desc      Text zulu keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0255', 'text zulu search edges');
    const text: string = 'zulu';
    expect(text.indexOf('z')).assertEqual(0);
    expect(text.lastIndexOf('u')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0256
   * @tc.name      testTextSense0256
   * @tc.desc      Text zulu keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0256', 'text zulu prefix and suffix');
    const text: string = 'zulu';
    expect(text.startsWith('zu')).assertTrue();
    expect(text.endsWith('lu')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0257
   * @tc.name      testTextSense0257
   * @tc.desc      Text zulu keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0257', 'text zulu split join');
    const text: string = 'zulu';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0258
   * @tc.name      testTextSense0258
   * @tc.desc      Text zulu keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0258', 'text zulu pad edges');
    const text: string = 'zulu';
    expect(text.padStart(7, '0').length).assertEqual(7);
    expect(text.padEnd(6, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0259
   * @tc.name      testTextSense0259
   * @tc.desc      Text zulu keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0259', 'text zulu replace first');
    const text: string = 'zulu';
    expect(text.replace('z', '#')).assertEqual('#ulu');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0260
   * @tc.name      testTextSense0260
   * @tc.desc      Text zulu keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0260', 'text zulu repeat twice');
    const text: string = 'zulu';
    expect(text.repeat(2)).assertEqual('zuluzulu');
    expect(text.repeat(2).length).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0261
   * @tc.name      testTextSense0261
   * @tc.desc      Text camelCaseToken keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0261', 'text camelCaseToken length');
    const text: string = 'camelCaseToken';
    expect(text.length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0262
   * @tc.name      testTextSense0262
   * @tc.desc      Text camelCaseToken keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0262', 'text camelCaseToken middle char');
    const text: string = 'camelCaseToken';
    expect(text.charAt(7)).assertEqual('s');
    expect(text.charCodeAt(7)).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0263
   * @tc.name      testTextSense0263
   * @tc.desc      Text camelCaseToken keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0263', 'text camelCaseToken slice equals substring');
    const text: string = 'camelCaseToken';
    expect(text.slice(7)).assertEqual('seToken');
    expect(text.substring(7)).assertEqual('seToken');
    expect(text.slice(7).length + 7).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0264
   * @tc.name      testTextSense0264
   * @tc.desc      Text camelCaseToken keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0264', 'text camelCaseToken case pairs');
    const text: string = 'camelCaseToken';
    expect(text.toUpperCase()).assertEqual('CAMELCASETOKEN');
    expect(text.toLowerCase()).assertEqual('camelcasetoken');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0265
   * @tc.name      testTextSense0265
   * @tc.desc      Text camelCaseToken keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0265', 'text camelCaseToken search edges');
    const text: string = 'camelCaseToken';
    expect(text.indexOf('c')).assertEqual(0);
    expect(text.lastIndexOf('n')).assertEqual(13);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0266
   * @tc.name      testTextSense0266
   * @tc.desc      Text camelCaseToken keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0266', 'text camelCaseToken prefix and suffix');
    const text: string = 'camelCaseToken';
    expect(text.startsWith('ca')).assertTrue();
    expect(text.endsWith('en')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0267
   * @tc.name      testTextSense0267
   * @tc.desc      Text camelCaseToken keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0267', 'text camelCaseToken split join');
    const text: string = 'camelCaseToken';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(14);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0268
   * @tc.name      testTextSense0268
   * @tc.desc      Text camelCaseToken keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0268', 'text camelCaseToken pad edges');
    const text: string = 'camelCaseToken';
    expect(text.padStart(17, '0').length).assertEqual(17);
    expect(text.padEnd(16, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0269
   * @tc.name      testTextSense0269
   * @tc.desc      Text camelCaseToken keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0269', 'text camelCaseToken replace first');
    const text: string = 'camelCaseToken';
    expect(text.replace('c', '#')).assertEqual('#amelCaseToken');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0270
   * @tc.name      testTextSense0270
   * @tc.desc      Text camelCaseToken keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0270', 'text camelCaseToken repeat twice');
    const text: string = 'camelCaseToken';
    expect(text.repeat(2)).assertEqual('camelCaseTokencamelCaseToken');
    expect(text.repeat(2).length).assertEqual(28);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0271
   * @tc.name      testTextSense0271
   * @tc.desc      Text kebab-case-token keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0271', 'text kebab-case-token length');
    const text: string = 'kebab-case-token';
    expect(text.length).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0272
   * @tc.name      testTextSense0272
   * @tc.desc      Text kebab-case-token keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0272', 'text kebab-case-token middle char');
    const text: string = 'kebab-case-token';
    expect(text.charAt(8)).assertEqual('s');
    expect(text.charCodeAt(8)).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0273
   * @tc.name      testTextSense0273
   * @tc.desc      Text kebab-case-token keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0273', 'text kebab-case-token slice equals substring');
    const text: string = 'kebab-case-token';
    expect(text.slice(8)).assertEqual('se-token');
    expect(text.substring(8)).assertEqual('se-token');
    expect(text.slice(8).length + 8).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0274
   * @tc.name      testTextSense0274
   * @tc.desc      Text kebab-case-token keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0274', 'text kebab-case-token case pairs');
    const text: string = 'kebab-case-token';
    expect(text.toUpperCase()).assertEqual('KEBAB-CASE-TOKEN');
    expect(text.toLowerCase()).assertEqual('kebab-case-token');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0275
   * @tc.name      testTextSense0275
   * @tc.desc      Text kebab-case-token keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0275', 'text kebab-case-token search edges');
    const text: string = 'kebab-case-token';
    expect(text.indexOf('k')).assertEqual(0);
    expect(text.lastIndexOf('n')).assertEqual(15);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0276
   * @tc.name      testTextSense0276
   * @tc.desc      Text kebab-case-token keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0276', 'text kebab-case-token prefix and suffix');
    const text: string = 'kebab-case-token';
    expect(text.startsWith('ke')).assertTrue();
    expect(text.endsWith('en')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0277
   * @tc.name      testTextSense0277
   * @tc.desc      Text kebab-case-token keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0277', 'text kebab-case-token split join');
    const text: string = 'kebab-case-token';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0278
   * @tc.name      testTextSense0278
   * @tc.desc      Text kebab-case-token keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0278', 'text kebab-case-token pad edges');
    const text: string = 'kebab-case-token';
    expect(text.padStart(19, '0').length).assertEqual(19);
    expect(text.padEnd(18, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0279
   * @tc.name      testTextSense0279
   * @tc.desc      Text kebab-case-token keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0279', 'text kebab-case-token replace first');
    const text: string = 'kebab-case-token';
    expect(text.replace('k', '#')).assertEqual('#ebab-case-token');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0280
   * @tc.name      testTextSense0280
   * @tc.desc      Text kebab-case-token keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0280', 'text kebab-case-token repeat twice');
    const text: string = 'kebab-case-token';
    expect(text.repeat(2)).assertEqual('kebab-case-tokenkebab-case-token');
    expect(text.repeat(2).length).assertEqual(32);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0281
   * @tc.name      testTextSense0281
   * @tc.desc      Text snake_case_token keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0281', 'text snake_case_token length');
    const text: string = 'snake_case_token';
    expect(text.length).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0282
   * @tc.name      testTextSense0282
   * @tc.desc      Text snake_case_token keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0282', 'text snake_case_token middle char');
    const text: string = 'snake_case_token';
    expect(text.charAt(8)).assertEqual('s');
    expect(text.charCodeAt(8)).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0283
   * @tc.name      testTextSense0283
   * @tc.desc      Text snake_case_token keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0283', 'text snake_case_token slice equals substring');
    const text: string = 'snake_case_token';
    expect(text.slice(8)).assertEqual('se_token');
    expect(text.substring(8)).assertEqual('se_token');
    expect(text.slice(8).length + 8).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0284
   * @tc.name      testTextSense0284
   * @tc.desc      Text snake_case_token keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0284', 'text snake_case_token case pairs');
    const text: string = 'snake_case_token';
    expect(text.toUpperCase()).assertEqual('SNAKE_CASE_TOKEN');
    expect(text.toLowerCase()).assertEqual('snake_case_token');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0285
   * @tc.name      testTextSense0285
   * @tc.desc      Text snake_case_token keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0285', 'text snake_case_token search edges');
    const text: string = 'snake_case_token';
    expect(text.indexOf('s')).assertEqual(0);
    expect(text.lastIndexOf('n')).assertEqual(15);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0286
   * @tc.name      testTextSense0286
   * @tc.desc      Text snake_case_token keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0286', 'text snake_case_token prefix and suffix');
    const text: string = 'snake_case_token';
    expect(text.startsWith('sn')).assertTrue();
    expect(text.endsWith('en')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0287
   * @tc.name      testTextSense0287
   * @tc.desc      Text snake_case_token keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0287', 'text snake_case_token split join');
    const text: string = 'snake_case_token';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(16);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0288
   * @tc.name      testTextSense0288
   * @tc.desc      Text snake_case_token keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0288', 'text snake_case_token pad edges');
    const text: string = 'snake_case_token';
    expect(text.padStart(19, '0').length).assertEqual(19);
    expect(text.padEnd(18, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0289
   * @tc.name      testTextSense0289
   * @tc.desc      Text snake_case_token keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0289', 'text snake_case_token replace first');
    const text: string = 'snake_case_token';
    expect(text.replace('s', '#')).assertEqual('#nake_case_token');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0290
   * @tc.name      testTextSense0290
   * @tc.desc      Text snake_case_token keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0290', 'text snake_case_token repeat twice');
    const text: string = 'snake_case_token';
    expect(text.repeat(2)).assertEqual('snake_case_tokensnake_case_token');
    expect(text.repeat(2).length).assertEqual(32);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0291
   * @tc.name      testTextSense0291
   * @tc.desc      Text Mixed99Case keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0291', 'text Mixed99Case length');
    const text: string = 'Mixed99Case';
    expect(text.length).assertEqual(11);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0292
   * @tc.name      testTextSense0292
   * @tc.desc      Text Mixed99Case keeps middle char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0292', 'text Mixed99Case middle char');
    const text: string = 'Mixed99Case';
    expect(text.charAt(5)).assertEqual('9');
    expect(text.charCodeAt(5)).assertEqual(57);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0293
   * @tc.name      testTextSense0293
   * @tc.desc      Text Mixed99Case keeps slice equals substring
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0293', 'text Mixed99Case slice equals substring');
    const text: string = 'Mixed99Case';
    expect(text.slice(5)).assertEqual('99Case');
    expect(text.substring(5)).assertEqual('99Case');
    expect(text.slice(5).length + 5).assertEqual(11);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0294
   * @tc.name      testTextSense0294
   * @tc.desc      Text Mixed99Case keeps case pairs
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0294', 'text Mixed99Case case pairs');
    const text: string = 'Mixed99Case';
    expect(text.toUpperCase()).assertEqual('MIXED99CASE');
    expect(text.toLowerCase()).assertEqual('mixed99case');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0295
   * @tc.name      testTextSense0295
   * @tc.desc      Text Mixed99Case keeps search edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0295', 'text Mixed99Case search edges');
    const text: string = 'Mixed99Case';
    expect(text.indexOf('M')).assertEqual(0);
    expect(text.lastIndexOf('e')).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0296
   * @tc.name      testTextSense0296
   * @tc.desc      Text Mixed99Case keeps prefix and suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0296', 'text Mixed99Case prefix and suffix');
    const text: string = 'Mixed99Case';
    expect(text.startsWith('Mi')).assertTrue();
    expect(text.endsWith('se')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0297
   * @tc.name      testTextSense0297
   * @tc.desc      Text Mixed99Case keeps split join
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0297', 'text Mixed99Case split join');
    const text: string = 'Mixed99Case';
    expect(text.split('').join('')).assertEqual(text);
    expect(text.split('').length).assertEqual(11);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0298
   * @tc.name      testTextSense0298
   * @tc.desc      Text Mixed99Case keeps pad edges
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTextSense0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTextSense0298', 'text Mixed99Case pad edges');
    const text: string = 'Mixed99Case';
    expect(text.padStart(14, '0').length).assertEqual(14);
    expect(text.padEnd(13, '~').startsWith(text)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0299
   * @tc.name      testTextSense0299
   * @tc.desc      Text Mixed99Case keeps replace first
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTextSense0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTextSense0299', 'text Mixed99Case replace first');
    const text: string = 'Mixed99Case';
    expect(text.replace('M', '#')).assertEqual('#ixed99Case');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TXT_0300
   * @tc.name      testTextSense0300
   * @tc.desc      Text Mixed99Case keeps repeat twice
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTextSense0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTextSense0300', 'text Mixed99Case repeat twice');
    const text: string = 'Mixed99Case';
    expect(text.repeat(2)).assertEqual('Mixed99CaseMixed99Case');
    expect(text.repeat(2).length).assertEqual(22);
  });
  });
}
