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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0001
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0002
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0003
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0004
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0005
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0006
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0007
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0008
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0009
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0010
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0011
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0012
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0013
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0014
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0015
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0016
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0017
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0018
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0019
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0020
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0021
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0022
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0023
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0024
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0025
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0026
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0027
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0028
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0029
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0030
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0031
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0032
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0033
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0034
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0035
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0036
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0037
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0038
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0039
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0040
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0041
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0042
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0043
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0044
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0045
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0046
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0047
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0048
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0049
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0050
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0051
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0052
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0053
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0054
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0055
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0056
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0057
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0058
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0059
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0060
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0061
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
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0062
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

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0063
   * @tc.name      testCollectionSense0063
   * @tc.desc      Collection splice pass 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0063', 'splice 3');
        const values: number[] = [1, 2, 3, 4, 5];
        const expected: number[] = [1, 2, 3, 103, 203, 5];
    const removed: number[] = values.splice(3, 1, 103, 203);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(4);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(6);
    expect(values.includes(103)).assertTrue();
    expect(values.indexOf(103)).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0064
   * @tc.name      testCollectionSense0064
   * @tc.desc      Collection splice pass 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0064', 'splice 4');
        const values: number[] = [1, 2, 3, 4, 5, 6];
        const expected: number[] = [1, 2, 3, 4, 104, 204, 6];
    const removed: number[] = values.splice(4, 1, 104, 204);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(5);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(7);
    expect(values.includes(104)).assertTrue();
    expect(values.indexOf(104)).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0065
   * @tc.name      testCollectionSense0065
   * @tc.desc      Collection splice pass 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0065', 'splice 5');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7];
        const expected: number[] = [1, 2, 3, 4, 5, 105, 205, 7];
    const removed: number[] = values.splice(5, 1, 105, 205);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(6);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(8);
    expect(values.includes(105)).assertTrue();
    expect(values.indexOf(105)).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0066
   * @tc.name      testCollectionSense0066
   * @tc.desc      Collection splice pass 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0066', 'splice 6');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
        const expected: number[] = [1, 2, 3, 4, 5, 6, 106, 206, 8];
    const removed: number[] = values.splice(6, 1, 106, 206);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(7);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(9);
    expect(values.includes(106)).assertTrue();
    expect(values.indexOf(106)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0067
   * @tc.name      testCollectionSense0067
   * @tc.desc      Collection splice pass 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0067', 'splice 7');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        const expected: number[] = [1, 2, 3, 4, 5, 6, 7, 107, 207, 9];
    const removed: number[] = values.splice(7, 1, 107, 207);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(8);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(10);
    expect(values.includes(107)).assertTrue();
    expect(values.indexOf(107)).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0068
   * @tc.name      testCollectionSense0068
   * @tc.desc      Collection splice pass 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0068', 'splice 8');
        const values: number[] = [1, 2];
        const expected: number[] = [108, 208, 2];
    const removed: number[] = values.splice(0, 1, 108, 208);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(3);
    expect(values.includes(108)).assertTrue();
    expect(values.indexOf(108)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0069
   * @tc.name      testCollectionSense0069
   * @tc.desc      Collection splice pass 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0069', 'splice 9');
        const values: number[] = [1, 2, 3];
        const expected: number[] = [109, 209, 2, 3];
    const removed: number[] = values.splice(0, 1, 109, 209);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(4);
    expect(values.includes(109)).assertTrue();
    expect(values.indexOf(109)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0070
   * @tc.name      testCollectionSense0070
   * @tc.desc      Collection splice pass 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0070', 'splice 10');
        const values: number[] = [1, 2, 3, 4];
        const expected: number[] = [1, 2, 110, 210, 4];
    const removed: number[] = values.splice(2, 1, 110, 210);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(5);
    expect(values.includes(110)).assertTrue();
    expect(values.indexOf(110)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0071
   * @tc.name      testCollectionSense0071
   * @tc.desc      Collection splice pass 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0071', 'splice 11');
        const values: number[] = [1, 2, 3, 4, 5];
        const expected: number[] = [1, 111, 211, 3, 4, 5];
    const removed: number[] = values.splice(1, 1, 111, 211);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(2);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(6);
    expect(values.includes(111)).assertTrue();
    expect(values.indexOf(111)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0072
   * @tc.name      testCollectionSense0072
   * @tc.desc      Collection splice pass 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0072', 'splice 12');
        const values: number[] = [1, 2, 3, 4, 5, 6];
        const expected: number[] = [112, 212, 2, 3, 4, 5, 6];
    const removed: number[] = values.splice(0, 1, 112, 212);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(7);
    expect(values.includes(112)).assertTrue();
    expect(values.indexOf(112)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0073
   * @tc.name      testCollectionSense0073
   * @tc.desc      Collection splice pass 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0073', 'splice 13');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7];
        const expected: number[] = [1, 2, 3, 4, 5, 6, 113, 213];
    const removed: number[] = values.splice(6, 1, 113, 213);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(7);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(8);
    expect(values.includes(113)).assertTrue();
    expect(values.indexOf(113)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0074
   * @tc.name      testCollectionSense0074
   * @tc.desc      Collection splice pass 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0074', 'splice 14');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
        const expected: number[] = [1, 2, 3, 4, 5, 6, 114, 214, 8];
    const removed: number[] = values.splice(6, 1, 114, 214);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(7);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(9);
    expect(values.includes(114)).assertTrue();
    expect(values.indexOf(114)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0075
   * @tc.name      testCollectionSense0075
   * @tc.desc      Collection splice pass 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0075', 'splice 15');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        const expected: number[] = [1, 2, 3, 4, 5, 6, 115, 215, 8, 9];
    const removed: number[] = values.splice(6, 1, 115, 215);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(7);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(10);
    expect(values.includes(115)).assertTrue();
    expect(values.indexOf(115)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0076
   * @tc.name      testCollectionSense0076
   * @tc.desc      Collection splice pass 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0076', 'splice 16');
        const values: number[] = [1, 2];
        const expected: number[] = [116, 216, 2];
    const removed: number[] = values.splice(0, 1, 116, 216);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(3);
    expect(values.includes(116)).assertTrue();
    expect(values.indexOf(116)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0077
   * @tc.name      testCollectionSense0077
   * @tc.desc      Collection splice pass 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0077', 'splice 17');
        const values: number[] = [1, 2, 3];
        const expected: number[] = [1, 2, 117, 217];
    const removed: number[] = values.splice(2, 1, 117, 217);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(4);
    expect(values.includes(117)).assertTrue();
    expect(values.indexOf(117)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0078
   * @tc.name      testCollectionSense0078
   * @tc.desc      Collection splice pass 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0078', 'splice 18');
        const values: number[] = [1, 2, 3, 4];
        const expected: number[] = [1, 2, 118, 218, 4];
    const removed: number[] = values.splice(2, 1, 118, 218);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(5);
    expect(values.includes(118)).assertTrue();
    expect(values.indexOf(118)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0079
   * @tc.name      testCollectionSense0079
   * @tc.desc      Collection splice pass 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0079', 'splice 19');
        const values: number[] = [1, 2, 3, 4, 5];
        const expected: number[] = [1, 2, 3, 4, 119, 219];
    const removed: number[] = values.splice(4, 1, 119, 219);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(5);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(6);
    expect(values.includes(119)).assertTrue();
    expect(values.indexOf(119)).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0080
   * @tc.name      testCollectionSense0080
   * @tc.desc      Collection splice pass 20
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0080', 'splice 20');
        const values: number[] = [1, 2, 3, 4, 5, 6];
        const expected: number[] = [1, 2, 120, 220, 4, 5, 6];
    const removed: number[] = values.splice(2, 1, 120, 220);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(7);
    expect(values.includes(120)).assertTrue();
    expect(values.indexOf(120)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0081
   * @tc.name      testCollectionSense0081
   * @tc.desc      Collection splice pass 21
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0081', 'splice 21');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7];
        const expected: number[] = [121, 221, 2, 3, 4, 5, 6, 7];
    const removed: number[] = values.splice(0, 1, 121, 221);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(8);
    expect(values.includes(121)).assertTrue();
    expect(values.indexOf(121)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0082
   * @tc.name      testCollectionSense0082
   * @tc.desc      Collection splice pass 22
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0082', 'splice 22');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
        const expected: number[] = [1, 2, 3, 4, 5, 6, 122, 222, 8];
    const removed: number[] = values.splice(6, 1, 122, 222);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(7);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(9);
    expect(values.includes(122)).assertTrue();
    expect(values.indexOf(122)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0083
   * @tc.name      testCollectionSense0083
   * @tc.desc      Collection splice pass 23
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0083', 'splice 23');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        const expected: number[] = [1, 2, 3, 4, 5, 123, 223, 7, 8, 9];
    const removed: number[] = values.splice(5, 1, 123, 223);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(6);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(10);
    expect(values.includes(123)).assertTrue();
    expect(values.indexOf(123)).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0084
   * @tc.name      testCollectionSense0084
   * @tc.desc      Collection splice pass 24
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0084', 'splice 24');
        const values: number[] = [1, 2];
        const expected: number[] = [124, 224, 2];
    const removed: number[] = values.splice(0, 1, 124, 224);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(3);
    expect(values.includes(124)).assertTrue();
    expect(values.indexOf(124)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0085
   * @tc.name      testCollectionSense0085
   * @tc.desc      Collection splice pass 25
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0085', 'splice 25');
        const values: number[] = [1, 2, 3];
        const expected: number[] = [1, 125, 225, 3];
    const removed: number[] = values.splice(1, 1, 125, 225);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(2);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(4);
    expect(values.includes(125)).assertTrue();
    expect(values.indexOf(125)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0086
   * @tc.name      testCollectionSense0086
   * @tc.desc      Collection splice pass 26
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0086', 'splice 26');
        const values: number[] = [1, 2, 3, 4];
        const expected: number[] = [1, 2, 126, 226, 4];
    const removed: number[] = values.splice(2, 1, 126, 226);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(5);
    expect(values.includes(126)).assertTrue();
    expect(values.indexOf(126)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0087
   * @tc.name      testCollectionSense0087
   * @tc.desc      Collection splice pass 27
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0087', 'splice 27');
        const values: number[] = [1, 2, 3, 4, 5];
        const expected: number[] = [1, 2, 127, 227, 4, 5];
    const removed: number[] = values.splice(2, 1, 127, 227);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(6);
    expect(values.includes(127)).assertTrue();
    expect(values.indexOf(127)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0088
   * @tc.name      testCollectionSense0088
   * @tc.desc      Collection splice pass 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0088', 'splice 28');
        const values: number[] = [1, 2, 3, 4, 5, 6];
        const expected: number[] = [1, 2, 3, 4, 128, 228, 6];
    const removed: number[] = values.splice(4, 1, 128, 228);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(5);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(7);
    expect(values.includes(128)).assertTrue();
    expect(values.indexOf(128)).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0089
   * @tc.name      testCollectionSense0089
   * @tc.desc      Collection splice pass 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0089', 'splice 29');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7];
        const expected: number[] = [1, 129, 229, 3, 4, 5, 6, 7];
    const removed: number[] = values.splice(1, 1, 129, 229);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(2);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(8);
    expect(values.includes(129)).assertTrue();
    expect(values.indexOf(129)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0090
   * @tc.name      testCollectionSense0090
   * @tc.desc      Collection splice pass 30
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0090', 'splice 30');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
        const expected: number[] = [1, 2, 3, 4, 5, 6, 130, 230, 8];
    const removed: number[] = values.splice(6, 1, 130, 230);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(7);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(9);
    expect(values.includes(130)).assertTrue();
    expect(values.indexOf(130)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0091
   * @tc.name      testCollectionSense0091
   * @tc.desc      Collection splice pass 31
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0091', 'splice 31');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        const expected: number[] = [1, 2, 3, 4, 131, 231, 6, 7, 8, 9];
    const removed: number[] = values.splice(4, 1, 131, 231);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(5);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(10);
    expect(values.includes(131)).assertTrue();
    expect(values.indexOf(131)).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0092
   * @tc.name      testCollectionSense0092
   * @tc.desc      Collection splice pass 32
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0092', 'splice 32');
        const values: number[] = [1, 2];
        const expected: number[] = [132, 232, 2];
    const removed: number[] = values.splice(0, 1, 132, 232);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(3);
    expect(values.includes(132)).assertTrue();
    expect(values.indexOf(132)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0093
   * @tc.name      testCollectionSense0093
   * @tc.desc      Collection splice pass 33
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0093', 'splice 33');
        const values: number[] = [1, 2, 3];
        const expected: number[] = [133, 233, 2, 3];
    const removed: number[] = values.splice(0, 1, 133, 233);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(4);
    expect(values.includes(133)).assertTrue();
    expect(values.indexOf(133)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0094
   * @tc.name      testCollectionSense0094
   * @tc.desc      Collection splice pass 34
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0094', 'splice 34');
        const values: number[] = [1, 2, 3, 4];
        const expected: number[] = [1, 2, 134, 234, 4];
    const removed: number[] = values.splice(2, 1, 134, 234);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(5);
    expect(values.includes(134)).assertTrue();
    expect(values.indexOf(134)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0095
   * @tc.name      testCollectionSense0095
   * @tc.desc      Collection splice pass 35
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0095', 'splice 35');
        const values: number[] = [1, 2, 3, 4, 5];
        const expected: number[] = [135, 235, 2, 3, 4, 5];
    const removed: number[] = values.splice(0, 1, 135, 235);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(6);
    expect(values.includes(135)).assertTrue();
    expect(values.indexOf(135)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0096
   * @tc.name      testCollectionSense0096
   * @tc.desc      Collection splice pass 36
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0096', 'splice 36');
        const values: number[] = [1, 2, 3, 4, 5, 6];
        const expected: number[] = [136, 236, 2, 3, 4, 5, 6];
    const removed: number[] = values.splice(0, 1, 136, 236);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(7);
    expect(values.includes(136)).assertTrue();
    expect(values.indexOf(136)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0097
   * @tc.name      testCollectionSense0097
   * @tc.desc      Collection splice pass 37
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0097', 'splice 37');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7];
        const expected: number[] = [1, 2, 137, 237, 4, 5, 6, 7];
    const removed: number[] = values.splice(2, 1, 137, 237);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(8);
    expect(values.includes(137)).assertTrue();
    expect(values.indexOf(137)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0098
   * @tc.name      testCollectionSense0098
   * @tc.desc      Collection splice pass 38
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0098', 'splice 38');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
        const expected: number[] = [1, 2, 3, 4, 5, 6, 138, 238, 8];
    const removed: number[] = values.splice(6, 1, 138, 238);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(7);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(9);
    expect(values.includes(138)).assertTrue();
    expect(values.indexOf(138)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0099
   * @tc.name      testCollectionSense0099
   * @tc.desc      Collection splice pass 39
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0099', 'splice 39');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        const expected: number[] = [1, 2, 3, 139, 239, 5, 6, 7, 8, 9];
    const removed: number[] = values.splice(3, 1, 139, 239);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(4);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(10);
    expect(values.includes(139)).assertTrue();
    expect(values.indexOf(139)).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0100
   * @tc.name      testCollectionSense0100
   * @tc.desc      Collection splice pass 40
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0100', 'splice 40');
        const values: number[] = [1, 2];
        const expected: number[] = [140, 240, 2];
    const removed: number[] = values.splice(0, 1, 140, 240);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(3);
    expect(values.includes(140)).assertTrue();
    expect(values.indexOf(140)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0101
   * @tc.name      testCollectionSense0101
   * @tc.desc      Collection splice pass 41
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0101', 'splice 41');
        const values: number[] = [1, 2, 3];
        const expected: number[] = [1, 2, 141, 241];
    const removed: number[] = values.splice(2, 1, 141, 241);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(4);
    expect(values.includes(141)).assertTrue();
    expect(values.indexOf(141)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0102
   * @tc.name      testCollectionSense0102
   * @tc.desc      Collection splice pass 42
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0102', 'splice 42');
        const values: number[] = [1, 2, 3, 4];
        const expected: number[] = [1, 2, 142, 242, 4];
    const removed: number[] = values.splice(2, 1, 142, 242);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(5);
    expect(values.includes(142)).assertTrue();
    expect(values.indexOf(142)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0103
   * @tc.name      testCollectionSense0103
   * @tc.desc      Collection splice pass 43
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0103', 'splice 43');
        const values: number[] = [1, 2, 3, 4, 5];
        const expected: number[] = [1, 2, 3, 143, 243, 5];
    const removed: number[] = values.splice(3, 1, 143, 243);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(4);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(6);
    expect(values.includes(143)).assertTrue();
    expect(values.indexOf(143)).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0104
   * @tc.name      testCollectionSense0104
   * @tc.desc      Collection splice pass 44
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0104', 'splice 44');
        const values: number[] = [1, 2, 3, 4, 5, 6];
        const expected: number[] = [1, 2, 144, 244, 4, 5, 6];
    const removed: number[] = values.splice(2, 1, 144, 244);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(7);
    expect(values.includes(144)).assertTrue();
    expect(values.indexOf(144)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0105
   * @tc.name      testCollectionSense0105
   * @tc.desc      Collection splice pass 45
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0105', 'splice 45');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7];
        const expected: number[] = [1, 2, 3, 145, 245, 5, 6, 7];
    const removed: number[] = values.splice(3, 1, 145, 245);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(4);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(8);
    expect(values.includes(145)).assertTrue();
    expect(values.indexOf(145)).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0106
   * @tc.name      testCollectionSense0106
   * @tc.desc      Collection splice pass 46
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0106', 'splice 46');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
        const expected: number[] = [1, 2, 3, 4, 5, 6, 146, 246, 8];
    const removed: number[] = values.splice(6, 1, 146, 246);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(7);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(9);
    expect(values.includes(146)).assertTrue();
    expect(values.indexOf(146)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0107
   * @tc.name      testCollectionSense0107
   * @tc.desc      Collection splice pass 47
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0107', 'splice 47');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        const expected: number[] = [1, 2, 147, 247, 4, 5, 6, 7, 8, 9];
    const removed: number[] = values.splice(2, 1, 147, 247);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(10);
    expect(values.includes(147)).assertTrue();
    expect(values.indexOf(147)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0108
   * @tc.name      testCollectionSense0108
   * @tc.desc      Collection splice pass 48
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0108', 'splice 48');
        const values: number[] = [1, 2];
        const expected: number[] = [148, 248, 2];
    const removed: number[] = values.splice(0, 1, 148, 248);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(3);
    expect(values.includes(148)).assertTrue();
    expect(values.indexOf(148)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0109
   * @tc.name      testCollectionSense0109
   * @tc.desc      Collection splice pass 49
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0109', 'splice 49');
        const values: number[] = [1, 2, 3];
        const expected: number[] = [1, 149, 249, 3];
    const removed: number[] = values.splice(1, 1, 149, 249);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(2);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(4);
    expect(values.includes(149)).assertTrue();
    expect(values.indexOf(149)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0110
   * @tc.name      testCollectionSense0110
   * @tc.desc      Collection splice pass 50
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0110', 'splice 50');
        const values: number[] = [1, 2, 3, 4];
        const expected: number[] = [1, 2, 150, 250, 4];
    const removed: number[] = values.splice(2, 1, 150, 250);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(5);
    expect(values.includes(150)).assertTrue();
    expect(values.indexOf(150)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0111
   * @tc.name      testCollectionSense0111
   * @tc.desc      Collection splice pass 51
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0111', 'splice 51');
        const values: number[] = [1, 2, 3, 4, 5];
        const expected: number[] = [1, 151, 251, 3, 4, 5];
    const removed: number[] = values.splice(1, 1, 151, 251);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(2);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(6);
    expect(values.includes(151)).assertTrue();
    expect(values.indexOf(151)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0112
   * @tc.name      testCollectionSense0112
   * @tc.desc      Collection splice pass 52
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0112', 'splice 52');
        const values: number[] = [1, 2, 3, 4, 5, 6];
        const expected: number[] = [1, 2, 3, 4, 152, 252, 6];
    const removed: number[] = values.splice(4, 1, 152, 252);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(5);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(7);
    expect(values.includes(152)).assertTrue();
    expect(values.indexOf(152)).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0113
   * @tc.name      testCollectionSense0113
   * @tc.desc      Collection splice pass 53
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0113', 'splice 53');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7];
        const expected: number[] = [1, 2, 3, 4, 153, 253, 6, 7];
    const removed: number[] = values.splice(4, 1, 153, 253);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(5);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(8);
    expect(values.includes(153)).assertTrue();
    expect(values.indexOf(153)).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0114
   * @tc.name      testCollectionSense0114
   * @tc.desc      Collection splice pass 54
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0114', 'splice 54');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
        const expected: number[] = [1, 2, 3, 4, 5, 6, 154, 254, 8];
    const removed: number[] = values.splice(6, 1, 154, 254);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(7);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(9);
    expect(values.includes(154)).assertTrue();
    expect(values.indexOf(154)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0115
   * @tc.name      testCollectionSense0115
   * @tc.desc      Collection splice pass 55
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0115', 'splice 55');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
        const expected: number[] = [1, 155, 255, 3, 4, 5, 6, 7, 8, 9];
    const removed: number[] = values.splice(1, 1, 155, 255);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(2);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(10);
    expect(values.includes(155)).assertTrue();
    expect(values.indexOf(155)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0116
   * @tc.name      testCollectionSense0116
   * @tc.desc      Collection splice pass 56
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0116', 'splice 56');
        const values: number[] = [1, 2];
        const expected: number[] = [156, 256, 2];
    const removed: number[] = values.splice(0, 1, 156, 256);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(3);
    expect(values.includes(156)).assertTrue();
    expect(values.indexOf(156)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0117
   * @tc.name      testCollectionSense0117
   * @tc.desc      Collection splice pass 57
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0117', 'splice 57');
        const values: number[] = [1, 2, 3];
        const expected: number[] = [157, 257, 2, 3];
    const removed: number[] = values.splice(0, 1, 157, 257);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(4);
    expect(values.includes(157)).assertTrue();
    expect(values.indexOf(157)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0118
   * @tc.name      testCollectionSense0118
   * @tc.desc      Collection splice pass 58
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0118', 'splice 58');
        const values: number[] = [1, 2, 3, 4];
        const expected: number[] = [1, 2, 158, 258, 4];
    const removed: number[] = values.splice(2, 1, 158, 258);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(3);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(5);
    expect(values.includes(158)).assertTrue();
    expect(values.indexOf(158)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0119
   * @tc.name      testCollectionSense0119
   * @tc.desc      Collection splice pass 59
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0119', 'splice 59');
        const values: number[] = [1, 2, 3, 4, 5];
        const expected: number[] = [1, 2, 3, 4, 159, 259];
    const removed: number[] = values.splice(4, 1, 159, 259);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(5);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(6);
    expect(values.includes(159)).assertTrue();
    expect(values.indexOf(159)).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0120
   * @tc.name      testCollectionSense0120
   * @tc.desc      Collection splice pass 60
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0120', 'splice 60');
        const values: number[] = [1, 2, 3, 4, 5, 6];
        const expected: number[] = [160, 260, 2, 3, 4, 5, 6];
    const removed: number[] = values.splice(0, 1, 160, 260);
    expect(removed.length).assertEqual(1);
    expect(removed[0]).assertEqual(1);
    expect(values.join(',')).assertEqual(expected.join(','));
    expect(values.length).assertEqual(7);
    expect(values.includes(160)).assertTrue();
    expect(values.indexOf(160)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0121
   * @tc.name      testCollectionSense0121
   * @tc.desc      Collection filter map pass 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0121', 'filter map 1');
        const values: number[] = [1];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(0);
    expect(doubled.length).assertEqual(1);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(2);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 1)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0122
   * @tc.name      testCollectionSense0122
   * @tc.desc      Collection filter map pass 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0122', 'filter map 2');
        const values: number[] = [1, 2];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(1);
    expect(doubled.length).assertEqual(2);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(4);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 2)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0123
   * @tc.name      testCollectionSense0123
   * @tc.desc      Collection filter map pass 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0123', 'filter map 3');
        const values: number[] = [1, 2, 3];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(1);
    expect(doubled.length).assertEqual(3);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(6);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 3)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0124
   * @tc.name      testCollectionSense0124
   * @tc.desc      Collection filter map pass 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0124', 'filter map 4');
        const values: number[] = [1, 2, 3, 4];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(2);
    expect(doubled.length).assertEqual(4);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(8);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 4)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0125
   * @tc.name      testCollectionSense0125
   * @tc.desc      Collection filter map pass 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0125', 'filter map 5');
        const values: number[] = [1, 2, 3, 4, 5];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(2);
    expect(doubled.length).assertEqual(5);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(10);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 5)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0126
   * @tc.name      testCollectionSense0126
   * @tc.desc      Collection filter map pass 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0126', 'filter map 6');
        const values: number[] = [1, 2, 3, 4, 5, 6];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(3);
    expect(doubled.length).assertEqual(6);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(12);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 6)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0127
   * @tc.name      testCollectionSense0127
   * @tc.desc      Collection filter map pass 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0127', 'filter map 7');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(3);
    expect(doubled.length).assertEqual(7);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(14);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 7)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0128
   * @tc.name      testCollectionSense0128
   * @tc.desc      Collection filter map pass 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0128', 'filter map 8');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(4);
    expect(doubled.length).assertEqual(8);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(16);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 8)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0129
   * @tc.name      testCollectionSense0129
   * @tc.desc      Collection filter map pass 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0129', 'filter map 9');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(4);
    expect(doubled.length).assertEqual(9);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(18);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 9)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0130
   * @tc.name      testCollectionSense0130
   * @tc.desc      Collection filter map pass 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0130', 'filter map 10');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(5);
    expect(doubled.length).assertEqual(10);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(20);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 10)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0131
   * @tc.name      testCollectionSense0131
   * @tc.desc      Collection filter map pass 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0131', 'filter map 11');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(5);
    expect(doubled.length).assertEqual(11);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(22);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 11)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0132
   * @tc.name      testCollectionSense0132
   * @tc.desc      Collection filter map pass 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0132', 'filter map 12');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(6);
    expect(doubled.length).assertEqual(12);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(24);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 12)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0133
   * @tc.name      testCollectionSense0133
   * @tc.desc      Collection filter map pass 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0133', 'filter map 13');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(6);
    expect(doubled.length).assertEqual(13);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(26);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 13)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0134
   * @tc.name      testCollectionSense0134
   * @tc.desc      Collection filter map pass 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0134', 'filter map 14');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(7);
    expect(doubled.length).assertEqual(14);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(28);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 14)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0135
   * @tc.name      testCollectionSense0135
   * @tc.desc      Collection filter map pass 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0135', 'filter map 15');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(7);
    expect(doubled.length).assertEqual(15);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(30);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 15)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0136
   * @tc.name      testCollectionSense0136
   * @tc.desc      Collection filter map pass 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0136', 'filter map 16');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(8);
    expect(doubled.length).assertEqual(16);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(32);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 16)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0137
   * @tc.name      testCollectionSense0137
   * @tc.desc      Collection filter map pass 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0137', 'filter map 17');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(8);
    expect(doubled.length).assertEqual(17);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(34);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 17)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0138
   * @tc.name      testCollectionSense0138
   * @tc.desc      Collection filter map pass 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0138', 'filter map 18');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(9);
    expect(doubled.length).assertEqual(18);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(36);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 18)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0139
   * @tc.name      testCollectionSense0139
   * @tc.desc      Collection filter map pass 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0139', 'filter map 19');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(9);
    expect(doubled.length).assertEqual(19);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(38);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 19)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0140
   * @tc.name      testCollectionSense0140
   * @tc.desc      Collection filter map pass 20
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testCollectionSense0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testCollectionSense0140', 'filter map 20');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(10);
    expect(doubled.length).assertEqual(20);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(40);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 20)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0141
   * @tc.name      testCollectionSense0141
   * @tc.desc      Collection filter map pass 21
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testCollectionSense0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testCollectionSense0141', 'filter map 21');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(10);
    expect(doubled.length).assertEqual(21);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(42);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 21)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0142
   * @tc.name      testCollectionSense0142
   * @tc.desc      Collection filter map pass 22
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testCollectionSense0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testCollectionSense0142', 'filter map 22');
        const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
    const evens: number[] = values.filter((value: number) => value % 2 === 0);
    const doubled: number[] = values.map((value: number) => value * 2);
    expect(evens.length).assertEqual(11);
    expect(doubled.length).assertEqual(22);
    expect(doubled[0]).assertEqual(2);
    expect(doubled[doubled.length - 1]).assertEqual(44);
    expect(values.every((value: number) => value > 0)).assertTrue();
    expect(values.some((value: number) => value === 22)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_COL_0143
