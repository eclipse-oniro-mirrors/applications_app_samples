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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0001
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0002
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0003
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0004
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0005
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0006
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0007
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0008
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0009
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0010
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0011
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0012
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0013
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0014
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0015
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0016
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0017
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0018
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0019
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0020
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0021
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0022
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0023
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0024
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0025
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0026
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0027
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0028
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0029
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0030
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0031
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0032
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0033
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_TXT_0034
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
  });
}
