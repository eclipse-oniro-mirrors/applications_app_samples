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

export default function timeSenseMatrixTest() {
  describe('timeSenseMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0001
   * @tc.name      testTimeSense0001
   * @tc.desc      Utc date pass 1 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0001', 'utc date 1');
    const date: Date = new Date(1609722000000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(4);
    expect(date.getUTCHours()).assertEqual(1);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-01-04T01:00:00.000Z');
    expect(date.getTime()).assertEqual(1609722000000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0002
   * @tc.name      testTimeSense0002
   * @tc.desc      Utc date pass 2 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0002', 'utc date 2');
    const date: Date = new Date(1609984800000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(7);
    expect(date.getUTCHours()).assertEqual(2);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-01-07T02:00:00.000Z');
    expect(date.getTime()).assertEqual(1609984800000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0003
   * @tc.name      testTimeSense0003
   * @tc.desc      Utc date pass 3 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0003', 'utc date 3');
    const date: Date = new Date(1610247600000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(10);
    expect(date.getUTCHours()).assertEqual(3);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-01-10T03:00:00.000Z');
    expect(date.getTime()).assertEqual(1610247600000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0004
   * @tc.name      testTimeSense0004
   * @tc.desc      Utc date pass 4 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0004', 'utc date 4');
    const date: Date = new Date(1610510400000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(13);
    expect(date.getUTCHours()).assertEqual(4);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-01-13T04:00:00.000Z');
    expect(date.getTime()).assertEqual(1610510400000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0005
   * @tc.name      testTimeSense0005
   * @tc.desc      Utc date pass 5 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0005', 'utc date 5');
    const date: Date = new Date(1610773200000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(16);
    expect(date.getUTCHours()).assertEqual(5);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-01-16T05:00:00.000Z');
    expect(date.getTime()).assertEqual(1610773200000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0006
   * @tc.name      testTimeSense0006
   * @tc.desc      Utc date pass 6 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0006', 'utc date 6');
    const date: Date = new Date(1611036000000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(19);
    expect(date.getUTCHours()).assertEqual(6);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-01-19T06:00:00.000Z');
    expect(date.getTime()).assertEqual(1611036000000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0007
   * @tc.name      testTimeSense0007
   * @tc.desc      Utc date pass 7 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0007', 'utc date 7');
    const date: Date = new Date(1611298800000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(22);
    expect(date.getUTCHours()).assertEqual(7);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-01-22T07:00:00.000Z');
    expect(date.getTime()).assertEqual(1611298800000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0008
   * @tc.name      testTimeSense0008
   * @tc.desc      Utc date pass 8 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0008', 'utc date 8');
    const date: Date = new Date(1611561600000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(25);
    expect(date.getUTCHours()).assertEqual(8);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-01-25T08:00:00.000Z');
    expect(date.getTime()).assertEqual(1611561600000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0009
   * @tc.name      testTimeSense0009
   * @tc.desc      Utc date pass 9 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0009', 'utc date 9');
    const date: Date = new Date(1611824400000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(28);
    expect(date.getUTCHours()).assertEqual(9);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-01-28T09:00:00.000Z');
    expect(date.getTime()).assertEqual(1611824400000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0010
   * @tc.name      testTimeSense0010
   * @tc.desc      Utc date pass 10 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0010', 'utc date 10');
    const date: Date = new Date(1612087200000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(31);
    expect(date.getUTCHours()).assertEqual(10);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-01-31T10:00:00.000Z');
    expect(date.getTime()).assertEqual(1612087200000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0011
   * @tc.name      testTimeSense0011
   * @tc.desc      Utc date pass 11 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0011', 'utc date 11');
    const date: Date = new Date(1612350000000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(3);
    expect(date.getUTCHours()).assertEqual(11);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-02-03T11:00:00.000Z');
    expect(date.getTime()).assertEqual(1612350000000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0012
   * @tc.name      testTimeSense0012
   * @tc.desc      Utc date pass 12 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0012', 'utc date 12');
    const date: Date = new Date(1612612800000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(6);
    expect(date.getUTCHours()).assertEqual(12);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-02-06T12:00:00.000Z');
    expect(date.getTime()).assertEqual(1612612800000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0013
   * @tc.name      testTimeSense0013
   * @tc.desc      Utc date pass 13 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0013', 'utc date 13');
    const date: Date = new Date(1612875600000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(9);
    expect(date.getUTCHours()).assertEqual(13);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-02-09T13:00:00.000Z');
    expect(date.getTime()).assertEqual(1612875600000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0014
   * @tc.name      testTimeSense0014
   * @tc.desc      Utc date pass 14 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0014', 'utc date 14');
    const date: Date = new Date(1613138400000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(12);
    expect(date.getUTCHours()).assertEqual(14);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-02-12T14:00:00.000Z');
    expect(date.getTime()).assertEqual(1613138400000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0015
   * @tc.name      testTimeSense0015
   * @tc.desc      Utc date pass 15 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0015', 'utc date 15');
    const date: Date = new Date(1613401200000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(15);
    expect(date.getUTCHours()).assertEqual(15);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-02-15T15:00:00.000Z');
    expect(date.getTime()).assertEqual(1613401200000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0016
   * @tc.name      testTimeSense0016
   * @tc.desc      Utc date pass 16 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0016', 'utc date 16');
    const date: Date = new Date(1613664000000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(18);
    expect(date.getUTCHours()).assertEqual(16);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-02-18T16:00:00.000Z');
    expect(date.getTime()).assertEqual(1613664000000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0017
   * @tc.name      testTimeSense0017
   * @tc.desc      Utc date pass 17 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0017', 'utc date 17');
    const date: Date = new Date(1613926800000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(21);
    expect(date.getUTCHours()).assertEqual(17);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-02-21T17:00:00.000Z');
    expect(date.getTime()).assertEqual(1613926800000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0018
   * @tc.name      testTimeSense0018
   * @tc.desc      Utc date pass 18 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0018', 'utc date 18');
    const date: Date = new Date(1614189600000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(24);
    expect(date.getUTCHours()).assertEqual(18);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-02-24T18:00:00.000Z');
    expect(date.getTime()).assertEqual(1614189600000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0019
   * @tc.name      testTimeSense0019
   * @tc.desc      Utc date pass 19 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0019', 'utc date 19');
    const date: Date = new Date(1614452400000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(27);
    expect(date.getUTCHours()).assertEqual(19);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-02-27T19:00:00.000Z');
    expect(date.getTime()).assertEqual(1614452400000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0020
   * @tc.name      testTimeSense0020
   * @tc.desc      Utc date pass 20 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0020', 'utc date 20');
    const date: Date = new Date(1614715200000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(2);
    expect(date.getUTCDate()).assertEqual(2);
    expect(date.getUTCHours()).assertEqual(20);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-03-02T20:00:00.000Z');
    expect(date.getTime()).assertEqual(1614715200000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0021
   * @tc.name      testTimeSense0021
   * @tc.desc      Utc date pass 21 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0021', 'utc date 21');
    const date: Date = new Date(1614978000000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(2);
    expect(date.getUTCDate()).assertEqual(5);
    expect(date.getUTCHours()).assertEqual(21);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-03-05T21:00:00.000Z');
    expect(date.getTime()).assertEqual(1614978000000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0022
   * @tc.name      testTimeSense0022
   * @tc.desc      Utc date pass 22 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0022', 'utc date 22');
    const date: Date = new Date(1615240800000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(2);
    expect(date.getUTCDate()).assertEqual(8);
    expect(date.getUTCHours()).assertEqual(22);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-03-08T22:00:00.000Z');
    expect(date.getTime()).assertEqual(1615240800000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0023
   * @tc.name      testTimeSense0023
   * @tc.desc      Utc date pass 23 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0023', 'utc date 23');
    const date: Date = new Date(1615503600000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(2);
    expect(date.getUTCDate()).assertEqual(11);
    expect(date.getUTCHours()).assertEqual(23);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-03-11T23:00:00.000Z');
    expect(date.getTime()).assertEqual(1615503600000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0024
   * @tc.name      testTimeSense0024
   * @tc.desc      Utc date pass 24 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0024', 'utc date 24');
    const date: Date = new Date(1615680000000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(2);
    expect(date.getUTCDate()).assertEqual(14);
    expect(date.getUTCHours()).assertEqual(0);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-03-14T00:00:00.000Z');
    expect(date.getTime()).assertEqual(1615680000000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0025
   * @tc.name      testTimeSense0025
   * @tc.desc      Utc date pass 25 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0025', 'utc date 25');
    const date: Date = new Date(1615942800000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(2);
    expect(date.getUTCDate()).assertEqual(17);
    expect(date.getUTCHours()).assertEqual(1);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-03-17T01:00:00.000Z');
    expect(date.getTime()).assertEqual(1615942800000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0026
   * @tc.name      testTimeSense0026
   * @tc.desc      Utc date pass 26 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0026', 'utc date 26');
    const date: Date = new Date(1616205600000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(2);
    expect(date.getUTCDate()).assertEqual(20);
    expect(date.getUTCHours()).assertEqual(2);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-03-20T02:00:00.000Z');
    expect(date.getTime()).assertEqual(1616205600000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0027
   * @tc.name      testTimeSense0027
   * @tc.desc      Utc date pass 27 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0027', 'utc date 27');
    const date: Date = new Date(1616468400000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(2);
    expect(date.getUTCDate()).assertEqual(23);
    expect(date.getUTCHours()).assertEqual(3);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-03-23T03:00:00.000Z');
    expect(date.getTime()).assertEqual(1616468400000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0028
   * @tc.name      testTimeSense0028
   * @tc.desc      Utc date pass 28 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0028', 'utc date 28');
    const date: Date = new Date(1616731200000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(2);
    expect(date.getUTCDate()).assertEqual(26);
    expect(date.getUTCHours()).assertEqual(4);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-03-26T04:00:00.000Z');
    expect(date.getTime()).assertEqual(1616731200000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0029
   * @tc.name      testTimeSense0029
   * @tc.desc      Utc date pass 29 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0029', 'utc date 29');
    const date: Date = new Date(1616994000000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(2);
    expect(date.getUTCDate()).assertEqual(29);
    expect(date.getUTCHours()).assertEqual(5);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-03-29T05:00:00.000Z');
    expect(date.getTime()).assertEqual(1616994000000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0030
   * @tc.name      testTimeSense0030
   * @tc.desc      Utc date pass 30 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0030', 'utc date 30');
    const date: Date = new Date(1617256800000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(3);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCHours()).assertEqual(6);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-04-01T06:00:00.000Z');
    expect(date.getTime()).assertEqual(1617256800000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0031
   * @tc.name      testTimeSense0031
   * @tc.desc      Utc date pass 31 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0031', 'utc date 31');
    const date: Date = new Date(1617519600000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(3);
    expect(date.getUTCDate()).assertEqual(4);
    expect(date.getUTCHours()).assertEqual(7);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-04-04T07:00:00.000Z');
    expect(date.getTime()).assertEqual(1617519600000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0032
   * @tc.name      testTimeSense0032
   * @tc.desc      Utc date pass 32 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0032', 'utc date 32');
    const date: Date = new Date(1617782400000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(3);
    expect(date.getUTCDate()).assertEqual(7);
    expect(date.getUTCHours()).assertEqual(8);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-04-07T08:00:00.000Z');
    expect(date.getTime()).assertEqual(1617782400000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0033
   * @tc.name      testTimeSense0033
   * @tc.desc      Utc date pass 33 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0033', 'utc date 33');
    const date: Date = new Date(1618045200000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(3);
    expect(date.getUTCDate()).assertEqual(10);
    expect(date.getUTCHours()).assertEqual(9);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-04-10T09:00:00.000Z');
    expect(date.getTime()).assertEqual(1618045200000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0034
   * @tc.name      testTimeSense0034
   * @tc.desc      Utc date pass 34 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0034', 'utc date 34');
    const date: Date = new Date(1618308000000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(3);
    expect(date.getUTCDate()).assertEqual(13);
    expect(date.getUTCHours()).assertEqual(10);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-04-13T10:00:00.000Z');
    expect(date.getTime()).assertEqual(1618308000000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0035
   * @tc.name      testTimeSense0035
   * @tc.desc      Utc date pass 35 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0035', 'utc date 35');
    const date: Date = new Date(1618570800000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(3);
    expect(date.getUTCDate()).assertEqual(16);
    expect(date.getUTCHours()).assertEqual(11);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-04-16T11:00:00.000Z');
    expect(date.getTime()).assertEqual(1618570800000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0036
   * @tc.name      testTimeSense0036
   * @tc.desc      Utc date pass 36 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0036', 'utc date 36');
    const date: Date = new Date(1618833600000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(3);
    expect(date.getUTCDate()).assertEqual(19);
    expect(date.getUTCHours()).assertEqual(12);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-04-19T12:00:00.000Z');
    expect(date.getTime()).assertEqual(1618833600000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0037
   * @tc.name      testTimeSense0037
   * @tc.desc      Utc date pass 37 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0037', 'utc date 37');
    const date: Date = new Date(1619096400000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(3);
    expect(date.getUTCDate()).assertEqual(22);
    expect(date.getUTCHours()).assertEqual(13);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-04-22T13:00:00.000Z');
    expect(date.getTime()).assertEqual(1619096400000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0038
   * @tc.name      testTimeSense0038
   * @tc.desc      Utc date pass 38 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0038', 'utc date 38');
    const date: Date = new Date(1619359200000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(3);
    expect(date.getUTCDate()).assertEqual(25);
    expect(date.getUTCHours()).assertEqual(14);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-04-25T14:00:00.000Z');
    expect(date.getTime()).assertEqual(1619359200000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0039
   * @tc.name      testTimeSense0039
   * @tc.desc      Utc date pass 39 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0039', 'utc date 39');
    const date: Date = new Date(1619622000000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(3);
    expect(date.getUTCDate()).assertEqual(28);
    expect(date.getUTCHours()).assertEqual(15);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-04-28T15:00:00.000Z');
    expect(date.getTime()).assertEqual(1619622000000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0040
   * @tc.name      testTimeSense0040
   * @tc.desc      Utc date pass 40 keeps fields
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0040', 'utc date 40');
    const date: Date = new Date(1619884800000);
    expect(date.getUTCFullYear()).assertEqual(2021);
    expect(date.getUTCMonth()).assertEqual(4);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCHours()).assertEqual(16);
    expect(date.getUTCMinutes()).assertEqual(0);
    expect(date.toISOString()).assertEqual('2021-05-01T16:00:00.000Z');
    expect(date.getTime()).assertEqual(1619884800000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0041
   * @tc.name      testTimeSense0041
   * @tc.desc      Date duration 1 days
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0041', 'duration 1');
    const start: Date = new Date(Date.UTC(2022, 0, 1));
    const end: Date = new Date(Date.UTC(2022, 0, 1) + 5 * 24 * 60 * 60 * 1000);
    expect(end.getTime() - start.getTime()).assertEqual(432000000);
    expect((end.getTime() - start.getTime()) / 86400000).assertEqual(5);
    expect(end > start).assertTrue();
    expect(start < end).assertTrue();
    expect(end.toISOString().startsWith('2022-01')).assertTrue();
    expect(start.toISOString()).assertEqual('2022-01-01T00:00:00.000Z');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0042
   * @tc.name      testTimeSense0042
   * @tc.desc      Date duration 2 days
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0042', 'duration 2');
    const start: Date = new Date(Date.UTC(2022, 0, 1));
    const end: Date = new Date(Date.UTC(2022, 0, 1) + 10 * 24 * 60 * 60 * 1000);
    expect(end.getTime() - start.getTime()).assertEqual(864000000);
    expect((end.getTime() - start.getTime()) / 86400000).assertEqual(10);
    expect(end > start).assertTrue();
    expect(start < end).assertTrue();
    expect(end.toISOString().startsWith('2022-01')).assertTrue();
    expect(start.toISOString()).assertEqual('2022-01-01T00:00:00.000Z');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0043
   * @tc.name      testTimeSense0043
   * @tc.desc      Date duration 3 days
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0043', 'duration 3');
    const start: Date = new Date(Date.UTC(2022, 0, 1));
    const end: Date = new Date(Date.UTC(2022, 0, 1) + 15 * 24 * 60 * 60 * 1000);
    expect(end.getTime() - start.getTime()).assertEqual(1296000000);
    expect((end.getTime() - start.getTime()) / 86400000).assertEqual(15);
    expect(end > start).assertTrue();
    expect(start < end).assertTrue();
    expect(end.toISOString().startsWith('2022-01')).assertTrue();
    expect(start.toISOString()).assertEqual('2022-01-01T00:00:00.000Z');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0044
   * @tc.name      testTimeSense0044
   * @tc.desc      Date duration 4 days
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0044', 'duration 4');
    const start: Date = new Date(Date.UTC(2022, 0, 1));
    const end: Date = new Date(Date.UTC(2022, 0, 1) + 20 * 24 * 60 * 60 * 1000);
    expect(end.getTime() - start.getTime()).assertEqual(1728000000);
    expect((end.getTime() - start.getTime()) / 86400000).assertEqual(20);
    expect(end > start).assertTrue();
    expect(start < end).assertTrue();
    expect(end.toISOString().startsWith('2022-01')).assertTrue();
    expect(start.toISOString()).assertEqual('2022-01-01T00:00:00.000Z');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0045
   * @tc.name      testTimeSense0045
   * @tc.desc      Date duration 5 days
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0045', 'duration 5');
    const start: Date = new Date(Date.UTC(2022, 0, 1));
    const end: Date = new Date(Date.UTC(2022, 0, 1) + 25 * 24 * 60 * 60 * 1000);
    expect(end.getTime() - start.getTime()).assertEqual(2160000000);
    expect((end.getTime() - start.getTime()) / 86400000).assertEqual(25);
    expect(end > start).assertTrue();
    expect(start < end).assertTrue();
    expect(end.toISOString().startsWith('2022-01')).assertTrue();
    expect(start.toISOString()).assertEqual('2022-01-01T00:00:00.000Z');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0046
   * @tc.name      testTimeSense0046
   * @tc.desc      Date duration 6 days
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0046', 'duration 6');
    const start: Date = new Date(Date.UTC(2022, 0, 1));
    const end: Date = new Date(Date.UTC(2022, 0, 1) + 30 * 24 * 60 * 60 * 1000);
    expect(end.getTime() - start.getTime()).assertEqual(2592000000);
    expect((end.getTime() - start.getTime()) / 86400000).assertEqual(30);
    expect(end > start).assertTrue();
    expect(start < end).assertTrue();
    expect(end.toISOString().startsWith('2022-01')).assertTrue();
    expect(start.toISOString()).assertEqual('2022-01-01T00:00:00.000Z');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0071
   * @tc.name      testTimeSense0071
   * @tc.desc      February 2020 length 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0071', 'february 2020');
    const date: Date = new Date(Date.UTC(2020, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(2020, 2, 0));
    expect(probe.getUTCDate()).assertEqual(29);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2020);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0072
   * @tc.name      testTimeSense0072
   * @tc.desc      February 2024 length 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0072', 'february 2024');
    const date: Date = new Date(Date.UTC(2024, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(2024, 2, 0));
    expect(probe.getUTCDate()).assertEqual(29);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2024);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0073
   * @tc.name      testTimeSense0073
   * @tc.desc      February 2028 length 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0073', 'february 2028');
    const date: Date = new Date(Date.UTC(2028, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(2028, 2, 0));
    expect(probe.getUTCDate()).assertEqual(29);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2028);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0074
   * @tc.name      testTimeSense0074
   * @tc.desc      February 1996 length 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0074', 'february 1996');
    const date: Date = new Date(Date.UTC(1996, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(1996, 2, 0));
    expect(probe.getUTCDate()).assertEqual(29);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(1996);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0075
   * @tc.name      testTimeSense0075
   * @tc.desc      February 2000 length 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0075', 'february 2000');
    const date: Date = new Date(Date.UTC(2000, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(2000, 2, 0));
    expect(probe.getUTCDate()).assertEqual(29);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2000);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0076
   * @tc.name      testTimeSense0076
   * @tc.desc      February 2400 length 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0076', 'february 2400');
    const date: Date = new Date(Date.UTC(2400, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(2400, 2, 0));
    expect(probe.getUTCDate()).assertEqual(29);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2400);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0077
   * @tc.name      testTimeSense0077
   * @tc.desc      February 2021 length 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0077', 'february 2021');
    const date: Date = new Date(Date.UTC(2021, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(2021, 2, 0));
    expect(probe.getUTCDate()).assertEqual(28);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2021);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0078
   * @tc.name      testTimeSense0078
   * @tc.desc      February 2022 length 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0078', 'february 2022');
    const date: Date = new Date(Date.UTC(2022, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(2022, 2, 0));
    expect(probe.getUTCDate()).assertEqual(28);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2022);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0079
   * @tc.name      testTimeSense0079
   * @tc.desc      February 2023 length 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0079', 'february 2023');
    const date: Date = new Date(Date.UTC(2023, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(2023, 2, 0));
    expect(probe.getUTCDate()).assertEqual(28);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0080
   * @tc.name      testTimeSense0080
   * @tc.desc      February 2025 length 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0080', 'february 2025');
    const date: Date = new Date(Date.UTC(2025, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(2025, 2, 0));
    expect(probe.getUTCDate()).assertEqual(28);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2025);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0081
   * @tc.name      testTimeSense0081
   * @tc.desc      February 1999 length 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0081', 'february 1999');
    const date: Date = new Date(Date.UTC(1999, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(1999, 2, 0));
    expect(probe.getUTCDate()).assertEqual(28);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(1999);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0082
   * @tc.name      testTimeSense0082
   * @tc.desc      February 1900 length 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0082', 'february 1900');
    const date: Date = new Date(Date.UTC(1900, 1, 1));
    expect(date.getUTCMonth()).assertEqual(1);
    expect(date.getUTCDate()).assertEqual(1);
    const probe: Date = new Date(Date.UTC(1900, 2, 0));
    expect(probe.getUTCDate()).assertEqual(28);
    expect(probe.getUTCMonth()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(1900);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0083
   * @tc.name      testTimeSense0083
   * @tc.desc      Date hour shift 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0083', 'hours 1');
    const offset: number = 3600 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(3600);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(1 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 1) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0084
   * @tc.name      testTimeSense0084
   * @tc.desc      Date hour shift 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0084', 'hours 2');
    const offset: number = 7200 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(7200);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(2 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 2) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0085
   * @tc.name      testTimeSense0085
   * @tc.desc      Date hour shift 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0085', 'hours 3');
    const offset: number = 10800 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(10800);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(3 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 3) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0086
   * @tc.name      testTimeSense0086
   * @tc.desc      Date hour shift 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0086', 'hours 4');
    const offset: number = 14400 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(14400);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(4 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 4) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0087
   * @tc.name      testTimeSense0087
   * @tc.desc      Date hour shift 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0087', 'hours 5');
    const offset: number = 18000 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(18000);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(5 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 5) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0088
   * @tc.name      testTimeSense0088
   * @tc.desc      Date hour shift 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0088', 'hours 6');
    const offset: number = 21600 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(21600);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(6 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 6) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_TIME_0089
   * @tc.name      testTimeSense0089
   * @tc.desc      Date hour shift 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
