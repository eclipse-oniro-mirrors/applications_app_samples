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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0001
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0002
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0003
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0004
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0005
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0006
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0007
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0008
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0009
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0010
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0011
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0012
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0013
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0014
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0015
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0016
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0017
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0018
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0019
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0020
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0021
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0022
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0023
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0024
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0025
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0026
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0027
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
   * @tc.number    SUB_BMS_PERFTEST_TIME_0028
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
