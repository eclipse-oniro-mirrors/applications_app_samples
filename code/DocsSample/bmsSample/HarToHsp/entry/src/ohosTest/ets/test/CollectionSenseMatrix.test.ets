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

export default function collectionSenseMatrixTest() {
  describe('collectionSenseMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0001
   * @tc.name      testCollectionSense0001
   * @tc.desc      Collection stack pass 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0001', 'stack 1');
    const values: number[] = [1];
    values.push(2);
    values.push(3);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(1);
    expect(values[values.length - 1]).assertEqual(3);
    const top: number = values.pop() as number;
    expect(top).assertEqual(3);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(1)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0002
   * @tc.name      testCollectionSense0002
   * @tc.desc      Collection stack pass 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0002', 'stack 2');
    const values: number[] = [2];
    values.push(3);
    values.push(4);
    values.push(5);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(2);
    expect(values[values.length - 1]).assertEqual(5);
    const top: number = values.pop() as number;
    expect(top).assertEqual(5);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(2)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0003
   * @tc.name      testCollectionSense0003
   * @tc.desc      Collection stack pass 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0003', 'stack 3');
    const values: number[] = [3];
    values.push(4);
    values.push(5);
    values.push(6);
    values.push(7);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(3);
    expect(values[values.length - 1]).assertEqual(7);
    const top: number = values.pop() as number;
    expect(top).assertEqual(7);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(3)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0004
   * @tc.name      testCollectionSense0004
   * @tc.desc      Collection stack pass 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0004', 'stack 4');
    const values: number[] = [4];
    values.push(5);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(4);
    expect(values[values.length - 1]).assertEqual(5);
    const top: number = values.pop() as number;
    expect(top).assertEqual(5);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(4)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0005
   * @tc.name      testCollectionSense0005
   * @tc.desc      Collection stack pass 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0005', 'stack 5');
    const values: number[] = [5];
    values.push(6);
    values.push(7);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(5);
    expect(values[values.length - 1]).assertEqual(7);
    const top: number = values.pop() as number;
    expect(top).assertEqual(7);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(5)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0006
   * @tc.name      testCollectionSense0006
   * @tc.desc      Collection stack pass 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0006', 'stack 6');
    const values: number[] = [6];
    values.push(7);
    values.push(8);
    values.push(9);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(6);
    expect(values[values.length - 1]).assertEqual(9);
    const top: number = values.pop() as number;
    expect(top).assertEqual(9);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(6)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0007
   * @tc.name      testCollectionSense0007
   * @tc.desc      Collection stack pass 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0007', 'stack 7');
    const values: number[] = [7];
    values.push(8);
    values.push(9);
    values.push(10);
    values.push(11);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(7);
    expect(values[values.length - 1]).assertEqual(11);
    const top: number = values.pop() as number;
    expect(top).assertEqual(11);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(7)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0008
   * @tc.name      testCollectionSense0008
   * @tc.desc      Collection stack pass 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0008', 'stack 8');
    const values: number[] = [8];
    values.push(9);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(8);
    expect(values[values.length - 1]).assertEqual(9);
    const top: number = values.pop() as number;
    expect(top).assertEqual(9);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(8)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0009
   * @tc.name      testCollectionSense0009
   * @tc.desc      Collection stack pass 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0009', 'stack 9');
    const values: number[] = [9];
    values.push(10);
    values.push(11);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(9);
    expect(values[values.length - 1]).assertEqual(11);
    const top: number = values.pop() as number;
    expect(top).assertEqual(11);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(9)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0010
   * @tc.name      testCollectionSense0010
   * @tc.desc      Collection stack pass 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0010', 'stack 10');
    const values: number[] = [10];
    values.push(11);
    values.push(12);
    values.push(13);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(10);
    expect(values[values.length - 1]).assertEqual(13);
    const top: number = values.pop() as number;
    expect(top).assertEqual(13);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(10)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0011
   * @tc.name      testCollectionSense0011
   * @tc.desc      Collection stack pass 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0011', 'stack 11');
    const values: number[] = [11];
    values.push(12);
    values.push(13);
    values.push(14);
    values.push(15);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(11);
    expect(values[values.length - 1]).assertEqual(15);
    const top: number = values.pop() as number;
    expect(top).assertEqual(15);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(11)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0012
   * @tc.name      testCollectionSense0012
   * @tc.desc      Collection stack pass 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0012', 'stack 12');
    const values: number[] = [12];
    values.push(13);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(12);
    expect(values[values.length - 1]).assertEqual(13);
    const top: number = values.pop() as number;
    expect(top).assertEqual(13);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(12)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0013
   * @tc.name      testCollectionSense0013
   * @tc.desc      Collection stack pass 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0013', 'stack 13');
    const values: number[] = [13];
    values.push(14);
    values.push(15);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(13);
    expect(values[values.length - 1]).assertEqual(15);
    const top: number = values.pop() as number;
    expect(top).assertEqual(15);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(13)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0014
   * @tc.name      testCollectionSense0014
   * @tc.desc      Collection stack pass 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0014', 'stack 14');
    const values: number[] = [14];
    values.push(15);
    values.push(16);
    values.push(17);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(14);
    expect(values[values.length - 1]).assertEqual(17);
    const top: number = values.pop() as number;
    expect(top).assertEqual(17);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(14)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0015
   * @tc.name      testCollectionSense0015
   * @tc.desc      Collection stack pass 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0015', 'stack 15');
    const values: number[] = [15];
    values.push(16);
    values.push(17);
    values.push(18);
    values.push(19);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(15);
    expect(values[values.length - 1]).assertEqual(19);
    const top: number = values.pop() as number;
    expect(top).assertEqual(19);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(15)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0016
   * @tc.name      testCollectionSense0016
   * @tc.desc      Collection stack pass 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0016', 'stack 16');
    const values: number[] = [16];
    values.push(17);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(16);
    expect(values[values.length - 1]).assertEqual(17);
    const top: number = values.pop() as number;
    expect(top).assertEqual(17);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(16)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0017
   * @tc.name      testCollectionSense0017
   * @tc.desc      Collection stack pass 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0017', 'stack 17');
    const values: number[] = [17];
    values.push(18);
    values.push(19);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(17);
    expect(values[values.length - 1]).assertEqual(19);
    const top: number = values.pop() as number;
    expect(top).assertEqual(19);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(17)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0018
   * @tc.name      testCollectionSense0018
   * @tc.desc      Collection stack pass 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0018', 'stack 18');
    const values: number[] = [18];
    values.push(19);
    values.push(20);
    values.push(21);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(18);
    expect(values[values.length - 1]).assertEqual(21);
    const top: number = values.pop() as number;
    expect(top).assertEqual(21);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(18)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0019
   * @tc.name      testCollectionSense0019
   * @tc.desc      Collection stack pass 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0019', 'stack 19');
    const values: number[] = [19];
    values.push(20);
    values.push(21);
    values.push(22);
    values.push(23);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(19);
    expect(values[values.length - 1]).assertEqual(23);
    const top: number = values.pop() as number;
    expect(top).assertEqual(23);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(19)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0020
   * @tc.name      testCollectionSense0020
   * @tc.desc      Collection stack pass 20
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0020', 'stack 20');
    const values: number[] = [20];
    values.push(21);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(20);
    expect(values[values.length - 1]).assertEqual(21);
    const top: number = values.pop() as number;
    expect(top).assertEqual(21);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(20)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0021
   * @tc.name      testCollectionSense0021
   * @tc.desc      Collection stack pass 21
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0021', 'stack 21');
    const values: number[] = [21];
    values.push(22);
    values.push(23);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(21);
    expect(values[values.length - 1]).assertEqual(23);
    const top: number = values.pop() as number;
    expect(top).assertEqual(23);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(21)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0022
   * @tc.name      testCollectionSense0022
   * @tc.desc      Collection stack pass 22
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0022', 'stack 22');
    const values: number[] = [22];
    values.push(23);
    values.push(24);
    values.push(25);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(22);
    expect(values[values.length - 1]).assertEqual(25);
    const top: number = values.pop() as number;
    expect(top).assertEqual(25);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(22)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0023
   * @tc.name      testCollectionSense0023
   * @tc.desc      Collection stack pass 23
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0023', 'stack 23');
    const values: number[] = [23];
    values.push(24);
    values.push(25);
    values.push(26);
    values.push(27);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(23);
    expect(values[values.length - 1]).assertEqual(27);
    const top: number = values.pop() as number;
    expect(top).assertEqual(27);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(23)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0024
   * @tc.name      testCollectionSense0024
   * @tc.desc      Collection stack pass 24
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0024', 'stack 24');
    const values: number[] = [24];
    values.push(25);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(24);
    expect(values[values.length - 1]).assertEqual(25);
    const top: number = values.pop() as number;
    expect(top).assertEqual(25);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(24)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0025
   * @tc.name      testCollectionSense0025
   * @tc.desc      Collection stack pass 25
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0025', 'stack 25');
    const values: number[] = [25];
    values.push(26);
    values.push(27);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(25);
    expect(values[values.length - 1]).assertEqual(27);
    const top: number = values.pop() as number;
    expect(top).assertEqual(27);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(25)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0026
   * @tc.name      testCollectionSense0026
   * @tc.desc      Collection stack pass 26
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0026', 'stack 26');
    const values: number[] = [26];
    values.push(27);
    values.push(28);
    values.push(29);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(26);
    expect(values[values.length - 1]).assertEqual(29);
    const top: number = values.pop() as number;
    expect(top).assertEqual(29);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(26)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0027
   * @tc.name      testCollectionSense0027
   * @tc.desc      Collection stack pass 27
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0027', 'stack 27');
    const values: number[] = [27];
    values.push(28);
    values.push(29);
    values.push(30);
    values.push(31);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(27);
    expect(values[values.length - 1]).assertEqual(31);
    const top: number = values.pop() as number;
    expect(top).assertEqual(31);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(27)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0028
   * @tc.name      testCollectionSense0028
   * @tc.desc      Collection stack pass 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0028', 'stack 28');
    const values: number[] = [28];
    values.push(29);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(28);
    expect(values[values.length - 1]).assertEqual(29);
    const top: number = values.pop() as number;
    expect(top).assertEqual(29);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(28)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0029
   * @tc.name      testCollectionSense0029
   * @tc.desc      Collection stack pass 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0029', 'stack 29');
    const values: number[] = [29];
    values.push(30);
    values.push(31);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(29);
    expect(values[values.length - 1]).assertEqual(31);
    const top: number = values.pop() as number;
    expect(top).assertEqual(31);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(29)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0030
   * @tc.name      testCollectionSense0030
   * @tc.desc      Collection stack pass 30
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0030', 'stack 30');
    const values: number[] = [30];
    values.push(31);
    values.push(32);
    values.push(33);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(30);
    expect(values[values.length - 1]).assertEqual(33);
    const top: number = values.pop() as number;
    expect(top).assertEqual(33);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(30)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0031
   * @tc.name      testCollectionSense0031
   * @tc.desc      Collection stack pass 31
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0031', 'stack 31');
    const values: number[] = [31];
    values.push(32);
    values.push(33);
    values.push(34);
    values.push(35);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(31);
    expect(values[values.length - 1]).assertEqual(35);
    const top: number = values.pop() as number;
    expect(top).assertEqual(35);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(31)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0032
   * @tc.name      testCollectionSense0032
   * @tc.desc      Collection stack pass 32
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0032', 'stack 32');
    const values: number[] = [32];
    values.push(33);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(32);
    expect(values[values.length - 1]).assertEqual(33);
    const top: number = values.pop() as number;
    expect(top).assertEqual(33);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(32)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0033
   * @tc.name      testCollectionSense0033
   * @tc.desc      Collection stack pass 33
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0033', 'stack 33');
    const values: number[] = [33];
    values.push(34);
    values.push(35);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(33);
    expect(values[values.length - 1]).assertEqual(35);
    const top: number = values.pop() as number;
    expect(top).assertEqual(35);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(33)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0034
   * @tc.name      testCollectionSense0034
   * @tc.desc      Collection stack pass 34
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0034', 'stack 34');
    const values: number[] = [34];
    values.push(35);
    values.push(36);
    values.push(37);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(34);
    expect(values[values.length - 1]).assertEqual(37);
    const top: number = values.pop() as number;
    expect(top).assertEqual(37);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(34)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0035
   * @tc.name      testCollectionSense0035
   * @tc.desc      Collection stack pass 35
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0035', 'stack 35');
    const values: number[] = [35];
    values.push(36);
    values.push(37);
    values.push(38);
    values.push(39);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(35);
    expect(values[values.length - 1]).assertEqual(39);
    const top: number = values.pop() as number;
    expect(top).assertEqual(39);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(35)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0036
   * @tc.name      testCollectionSense0036
   * @tc.desc      Collection stack pass 36
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0036', 'stack 36');
    const values: number[] = [36];
    values.push(37);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(36);
    expect(values[values.length - 1]).assertEqual(37);
    const top: number = values.pop() as number;
    expect(top).assertEqual(37);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(36)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0037
   * @tc.name      testCollectionSense0037
   * @tc.desc      Collection stack pass 37
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0037', 'stack 37');
    const values: number[] = [37];
    values.push(38);
    values.push(39);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(37);
    expect(values[values.length - 1]).assertEqual(39);
    const top: number = values.pop() as number;
    expect(top).assertEqual(39);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(37)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0038
   * @tc.name      testCollectionSense0038
   * @tc.desc      Collection stack pass 38
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0038', 'stack 38');
    const values: number[] = [38];
    values.push(39);
    values.push(40);
    values.push(41);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(38);
    expect(values[values.length - 1]).assertEqual(41);
    const top: number = values.pop() as number;
    expect(top).assertEqual(41);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(38)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0039
   * @tc.name      testCollectionSense0039
   * @tc.desc      Collection stack pass 39
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0039', 'stack 39');
    const values: number[] = [39];
    values.push(40);
    values.push(41);
    values.push(42);
    values.push(43);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(39);
    expect(values[values.length - 1]).assertEqual(43);
    const top: number = values.pop() as number;
    expect(top).assertEqual(43);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(39)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0040
   * @tc.name      testCollectionSense0040
   * @tc.desc      Collection stack pass 40
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0040', 'stack 40');
    const values: number[] = [40];
    values.push(41);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(40);
    expect(values[values.length - 1]).assertEqual(41);
    const top: number = values.pop() as number;
    expect(top).assertEqual(41);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(40)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0041
   * @tc.name      testCollectionSense0041
   * @tc.desc      Collection stack pass 41
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0041', 'stack 41');
    const values: number[] = [41];
    values.push(42);
    values.push(43);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(41);
    expect(values[values.length - 1]).assertEqual(43);
    const top: number = values.pop() as number;
    expect(top).assertEqual(43);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(41)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0042
   * @tc.name      testCollectionSense0042
   * @tc.desc      Collection stack pass 42
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0042', 'stack 42');
    const values: number[] = [42];
    values.push(43);
    values.push(44);
    values.push(45);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(42);
    expect(values[values.length - 1]).assertEqual(45);
    const top: number = values.pop() as number;
    expect(top).assertEqual(45);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(42)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0043
   * @tc.name      testCollectionSense0043
   * @tc.desc      Collection stack pass 43
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0043', 'stack 43');
    const values: number[] = [43];
    values.push(44);
    values.push(45);
    values.push(46);
    values.push(47);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(43);
    expect(values[values.length - 1]).assertEqual(47);
    const top: number = values.pop() as number;
    expect(top).assertEqual(47);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(43)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0044
   * @tc.name      testCollectionSense0044
   * @tc.desc      Collection stack pass 44
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0044', 'stack 44');
    const values: number[] = [44];
    values.push(45);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(44);
    expect(values[values.length - 1]).assertEqual(45);
    const top: number = values.pop() as number;
    expect(top).assertEqual(45);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(44)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0045
   * @tc.name      testCollectionSense0045
   * @tc.desc      Collection stack pass 45
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0045', 'stack 45');
    const values: number[] = [45];
    values.push(46);
    values.push(47);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(45);
    expect(values[values.length - 1]).assertEqual(47);
    const top: number = values.pop() as number;
    expect(top).assertEqual(47);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(45)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0046
   * @tc.name      testCollectionSense0046
   * @tc.desc      Collection stack pass 46
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0046', 'stack 46');
    const values: number[] = [46];
    values.push(47);
    values.push(48);
    values.push(49);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(46);
    expect(values[values.length - 1]).assertEqual(49);
    const top: number = values.pop() as number;
    expect(top).assertEqual(49);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(46)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0047
   * @tc.name      testCollectionSense0047
   * @tc.desc      Collection stack pass 47
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0047', 'stack 47');
    const values: number[] = [47];
    values.push(48);
    values.push(49);
    values.push(50);
    values.push(51);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(47);
    expect(values[values.length - 1]).assertEqual(51);
    const top: number = values.pop() as number;
    expect(top).assertEqual(51);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(47)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0048
   * @tc.name      testCollectionSense0048
   * @tc.desc      Collection stack pass 48
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0048', 'stack 48');
    const values: number[] = [48];
    values.push(49);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(48);
    expect(values[values.length - 1]).assertEqual(49);
    const top: number = values.pop() as number;
    expect(top).assertEqual(49);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(48)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0049
   * @tc.name      testCollectionSense0049
   * @tc.desc      Collection stack pass 49
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0049', 'stack 49');
    const values: number[] = [49];
    values.push(50);
    values.push(51);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(49);
    expect(values[values.length - 1]).assertEqual(51);
    const top: number = values.pop() as number;
    expect(top).assertEqual(51);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(49)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0050
   * @tc.name      testCollectionSense0050
   * @tc.desc      Collection stack pass 50
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0050', 'stack 50');
    const values: number[] = [50];
    values.push(51);
    values.push(52);
    values.push(53);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(50);
    expect(values[values.length - 1]).assertEqual(53);
    const top: number = values.pop() as number;
    expect(top).assertEqual(53);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(50)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0051
   * @tc.name      testCollectionSense0051
   * @tc.desc      Collection stack pass 51
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0051', 'stack 51');
    const values: number[] = [51];
    values.push(52);
    values.push(53);
    values.push(54);
    values.push(55);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(51);
    expect(values[values.length - 1]).assertEqual(55);
    const top: number = values.pop() as number;
    expect(top).assertEqual(55);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(51)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0052
   * @tc.name      testCollectionSense0052
   * @tc.desc      Collection stack pass 52
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0052', 'stack 52');
    const values: number[] = [52];
    values.push(53);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(52);
    expect(values[values.length - 1]).assertEqual(53);
    const top: number = values.pop() as number;
    expect(top).assertEqual(53);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(52)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0053
   * @tc.name      testCollectionSense0053
   * @tc.desc      Collection stack pass 53
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0053', 'stack 53');
    const values: number[] = [53];
    values.push(54);
    values.push(55);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(53);
    expect(values[values.length - 1]).assertEqual(55);
    const top: number = values.pop() as number;
    expect(top).assertEqual(55);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(53)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0054
   * @tc.name      testCollectionSense0054
   * @tc.desc      Collection stack pass 54
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0054', 'stack 54');
    const values: number[] = [54];
    values.push(55);
    values.push(56);
    values.push(57);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(54);
    expect(values[values.length - 1]).assertEqual(57);
    const top: number = values.pop() as number;
    expect(top).assertEqual(57);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(54)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0055
   * @tc.name      testCollectionSense0055
   * @tc.desc      Collection stack pass 55
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0055', 'stack 55');
    const values: number[] = [55];
    values.push(56);
    values.push(57);
    values.push(58);
    values.push(59);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(55);
    expect(values[values.length - 1]).assertEqual(59);
    const top: number = values.pop() as number;
    expect(top).assertEqual(59);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(55)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0056
   * @tc.name      testCollectionSense0056
   * @tc.desc      Collection stack pass 56
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0056', 'stack 56');
    const values: number[] = [56];
    values.push(57);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(56);
    expect(values[values.length - 1]).assertEqual(57);
    const top: number = values.pop() as number;
    expect(top).assertEqual(57);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(56)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0057
   * @tc.name      testCollectionSense0057
   * @tc.desc      Collection stack pass 57
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0057', 'stack 57');
    const values: number[] = [57];
    values.push(58);
    values.push(59);
    expect(values.length).assertEqual(3);
    expect(values[0]).assertEqual(57);
    expect(values[values.length - 1]).assertEqual(59);
    const top: number = values.pop() as number;
    expect(top).assertEqual(59);
    expect(values.length).assertEqual(2);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(57)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0058
   * @tc.name      testCollectionSense0058
   * @tc.desc      Collection stack pass 58
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0058', 'stack 58');
    const values: number[] = [58];
    values.push(59);
    values.push(60);
    values.push(61);
    expect(values.length).assertEqual(4);
    expect(values[0]).assertEqual(58);
    expect(values[values.length - 1]).assertEqual(61);
    const top: number = values.pop() as number;
    expect(top).assertEqual(61);
    expect(values.length).assertEqual(3);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(58)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0059
   * @tc.name      testCollectionSense0059
   * @tc.desc      Collection stack pass 59
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0059', 'stack 59');
    const values: number[] = [59];
    values.push(60);
    values.push(61);
    values.push(62);
    values.push(63);
    expect(values.length).assertEqual(5);
    expect(values[0]).assertEqual(59);
    expect(values[values.length - 1]).assertEqual(63);
    const top: number = values.pop() as number;
    expect(top).assertEqual(63);
    expect(values.length).assertEqual(4);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(59)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0060
   * @tc.name      testCollectionSense0060
   * @tc.desc      Collection stack pass 60
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0060', 'stack 60');
    const values: number[] = [60];
    values.push(61);
    expect(values.length).assertEqual(2);
    expect(values[0]).assertEqual(60);
    expect(values[values.length - 1]).assertEqual(61);
    const top: number = values.pop() as number;
    expect(top).assertEqual(61);
    expect(values.length).assertEqual(1);
    values.unshift(0);
    expect(values[0]).assertEqual(0);
    const bottom: number = values.shift() as number;
    expect(bottom).assertEqual(0);
    expect(values.indexOf(60)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0061
   * @tc.name      testCollectionSense0061
   * @tc.desc      Collection splice pass 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0061', 'splice 1');
        const values: number[] = [1, 2, 3];
        const expected: number[] = [1, 101, 201, 3];
    const removed: number[] = values.splice(1, 1, 101, 201);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(2);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(4);
    expect(values.includes(101)).assertTrue();
    expect(values.indexOf(101)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_COL_0062
   * @tc.name      testCollectionSense0062
   * @tc.desc      Collection splice pass 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0062', 'splice 2');
        const values: number[] = [1, 2, 3, 4];
        const expected: number[] = [1, 2, 102, 202, 4];
    const removed: number[] = values.splice(2, 1, 102, 202);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(5);
    expect(values.includes(102)).assertTrue();
    expect(values.indexOf(102)).assertEqual(2);
  });
