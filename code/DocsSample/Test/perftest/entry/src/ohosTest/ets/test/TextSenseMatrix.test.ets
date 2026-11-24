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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0001
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0002
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0003
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0004
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0005
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0006
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0007
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0008
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0009
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0010
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0011
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0012
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0013
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0014
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0015
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0016
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0017
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0018
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0019
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0020
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0021
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0022
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0023
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0024
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0025
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0026
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0027
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0028
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0029
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0030
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0031
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0032
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0033
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0034
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0035
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0036
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0037
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0038
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0039
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0040
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0041
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0042
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0043
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0044
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0045
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0046
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0047
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0048
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0049
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0050
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0051
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0052
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0053
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0054
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0055
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0056
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0057
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0058
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0059
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0060
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0061
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0062
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0063
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0064
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0065
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0066
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0067
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0068
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0069
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0070
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0071
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0072
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0073
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0074
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0075
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0076
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0077
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0078
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0079
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0080
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0081
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0082
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0083
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0084
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
   * @tc.number    SUB_BMS_PERFTEST_TXT_0085
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
  });
}
