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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0001
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0002
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0003
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0004
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0005
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0006
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0007
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0008
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0009
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0010
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0011
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0012
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0013
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0014
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0015
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0016
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0017
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0018
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0019
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0020
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0021
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0022
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0023
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0024
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0025
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0026
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0027
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0028
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0029
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0030
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0031
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0032
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0033
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0034
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0035
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0036
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0037
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0038
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0039
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0040
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0041
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0042
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0043
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0044
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0045
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0046
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
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0106
   * @tc.name      testTimeSense0106
   * @tc.desc      Date hour shift 24
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0106', 'hours 24');
    const offset: number = 86400 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(86400);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(24 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 24) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0107
   * @tc.name      testTimeSense0107
   * @tc.desc      Date hour shift 25
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0107', 'hours 25');
    const offset: number = 90000 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(90000);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(25 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 25) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0108
   * @tc.name      testTimeSense0108
   * @tc.desc      Date hour shift 26
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0108', 'hours 26');
    const offset: number = 93600 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(93600);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(26 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 26) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0109
   * @tc.name      testTimeSense0109
   * @tc.desc      Date hour shift 27
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0109', 'hours 27');
    const offset: number = 97200 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(97200);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(27 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 27) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0110
   * @tc.name      testTimeSense0110
   * @tc.desc      Date hour shift 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0110', 'hours 28');
    const offset: number = 100800 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(100800);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(28 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 28) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0111
   * @tc.name      testTimeSense0111
   * @tc.desc      Date hour shift 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0111', 'hours 29');
    const offset: number = 104400 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(104400);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(29 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 29) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0112
   * @tc.name      testTimeSense0112
   * @tc.desc      Date hour shift 30
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0112', 'hours 30');
    const offset: number = 108000 * 1000;
    const date: Date = new Date(Date.UTC(2023, 5, 15, 12, 0, 0));
    const shifted: Date = new Date(date.getTime() + offset);
    expect((shifted.getTime() - date.getTime()) / 1000).assertEqual(108000);
    expect(shifted.getUTCDate()).assertEqual(15 + Math.floor(30 / 24));
    expect(shifted.getUTCHours()).assertEqual((12 + 30) % 24);
    expect(shifted.getUTCFullYear()).assertEqual(2023);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0113
   * @tc.name      testTimeSense0113
   * @tc.desc      Year 2001 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0113', 'weekday 1');
    const date: Date = new Date(Date.UTC(2001, 0, 1));
    expect(date.getUTCDay()).assertEqual(1);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2001);
    expect(date.toISOString().startsWith('2001-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0114
   * @tc.name      testTimeSense0114
   * @tc.desc      Year 2002 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0114', 'weekday 2');
    const date: Date = new Date(Date.UTC(2002, 0, 1));
    expect(date.getUTCDay()).assertEqual(2);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2002);
    expect(date.toISOString().startsWith('2002-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0115
   * @tc.name      testTimeSense0115
   * @tc.desc      Year 2003 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0115', 'weekday 3');
    const date: Date = new Date(Date.UTC(2003, 0, 1));
    expect(date.getUTCDay()).assertEqual(3);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2003);
    expect(date.toISOString().startsWith('2003-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0116
   * @tc.name      testTimeSense0116
   * @tc.desc      Year 2004 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0116', 'weekday 4');
    const date: Date = new Date(Date.UTC(2004, 0, 1));
    expect(date.getUTCDay()).assertEqual(4);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2004);
    expect(date.toISOString().startsWith('2004-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0117
   * @tc.name      testTimeSense0117
   * @tc.desc      Year 2005 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0117', 'weekday 5');
    const date: Date = new Date(Date.UTC(2005, 0, 1));
    expect(date.getUTCDay()).assertEqual(6);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2005);
    expect(date.toISOString().startsWith('2005-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0118
   * @tc.name      testTimeSense0118
   * @tc.desc      Year 2006 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0118', 'weekday 6');
    const date: Date = new Date(Date.UTC(2006, 0, 1));
    expect(date.getUTCDay()).assertEqual(0);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2006);
    expect(date.toISOString().startsWith('2006-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0119
   * @tc.name      testTimeSense0119
   * @tc.desc      Year 2007 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0119', 'weekday 7');
    const date: Date = new Date(Date.UTC(2007, 0, 1));
    expect(date.getUTCDay()).assertEqual(1);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2007);
    expect(date.toISOString().startsWith('2007-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0120
   * @tc.name      testTimeSense0120
   * @tc.desc      Year 2008 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0120', 'weekday 8');
    const date: Date = new Date(Date.UTC(2008, 0, 1));
    expect(date.getUTCDay()).assertEqual(2);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2008);
    expect(date.toISOString().startsWith('2008-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0121
   * @tc.name      testTimeSense0121
   * @tc.desc      Year 2009 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0121', 'weekday 9');
    const date: Date = new Date(Date.UTC(2009, 0, 1));
    expect(date.getUTCDay()).assertEqual(4);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2009);
    expect(date.toISOString().startsWith('2009-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0122
   * @tc.name      testTimeSense0122
   * @tc.desc      Year 2010 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0122', 'weekday 10');
    const date: Date = new Date(Date.UTC(2010, 0, 1));
    expect(date.getUTCDay()).assertEqual(5);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2010);
    expect(date.toISOString().startsWith('2010-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0123
   * @tc.name      testTimeSense0123
   * @tc.desc      Year 2011 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0123', 'weekday 11');
    const date: Date = new Date(Date.UTC(2011, 0, 1));
    expect(date.getUTCDay()).assertEqual(6);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2011);
    expect(date.toISOString().startsWith('2011-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0124
   * @tc.name      testTimeSense0124
   * @tc.desc      Year 2012 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0124', 'weekday 12');
    const date: Date = new Date(Date.UTC(2012, 0, 1));
    expect(date.getUTCDay()).assertEqual(0);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2012);
    expect(date.toISOString().startsWith('2012-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0125
   * @tc.name      testTimeSense0125
   * @tc.desc      Year 2013 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0125', 'weekday 13');
    const date: Date = new Date(Date.UTC(2013, 0, 1));
    expect(date.getUTCDay()).assertEqual(2);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2013);
    expect(date.toISOString().startsWith('2013-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0126
   * @tc.name      testTimeSense0126
   * @tc.desc      Year 2014 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0126', 'weekday 14');
    const date: Date = new Date(Date.UTC(2014, 0, 1));
    expect(date.getUTCDay()).assertEqual(3);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2014);
    expect(date.toISOString().startsWith('2014-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0127
   * @tc.name      testTimeSense0127
   * @tc.desc      Year 2015 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0127', 'weekday 15');
    const date: Date = new Date(Date.UTC(2015, 0, 1));
    expect(date.getUTCDay()).assertEqual(4);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2015);
    expect(date.toISOString().startsWith('2015-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0128
   * @tc.name      testTimeSense0128
   * @tc.desc      Year 2016 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0128', 'weekday 16');
    const date: Date = new Date(Date.UTC(2016, 0, 1));
    expect(date.getUTCDay()).assertEqual(5);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2016);
    expect(date.toISOString().startsWith('2016-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0129
   * @tc.name      testTimeSense0129
   * @tc.desc      Year 2017 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0129', 'weekday 17');
    const date: Date = new Date(Date.UTC(2017, 0, 1));
    expect(date.getUTCDay()).assertEqual(0);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2017);
    expect(date.toISOString().startsWith('2017-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0130
   * @tc.name      testTimeSense0130
   * @tc.desc      Year 2018 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testTimeSense0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testTimeSense0130', 'weekday 18');
    const date: Date = new Date(Date.UTC(2018, 0, 1));
    expect(date.getUTCDay()).assertEqual(1);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2018);
    expect(date.toISOString().startsWith('2018-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0131
   * @tc.name      testTimeSense0131
   * @tc.desc      Year 2019 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testTimeSense0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testTimeSense0131', 'weekday 19');
    const date: Date = new Date(Date.UTC(2019, 0, 1));
    expect(date.getUTCDay()).assertEqual(2);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2019);
    expect(date.toISOString().startsWith('2019-01-01')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_TIME_0132
   * @tc.name      testTimeSense0132
   * @tc.desc      Year 2020 starts on a valid weekday
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testTimeSense0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testTimeSense0132', 'weekday 20');
    const date: Date = new Date(Date.UTC(2020, 0, 1));
    expect(date.getUTCDay()).assertEqual(3);
    expect(date.getUTCMonth()).assertEqual(0);
    expect(date.getUTCDate()).assertEqual(1);
    expect(date.getUTCFullYear()).assertEqual(2020);
    expect(date.toISOString().startsWith('2020-01-01')).assertTrue();
  });
  });
}
