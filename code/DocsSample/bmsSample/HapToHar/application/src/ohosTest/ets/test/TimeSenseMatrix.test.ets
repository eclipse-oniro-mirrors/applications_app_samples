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
   * @tc.number    SUB_BMS_HAPTOHAR_TIME_0001
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
   * @tc.number    SUB_BMS_HAPTOHAR_TIME_0002
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
   * @tc.number    SUB_BMS_HAPTOHAR_TIME_0003
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
   * @tc.number    SUB_BMS_HAPTOHAR_TIME_0004
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
   * @tc.number    SUB_BMS_HAPTOHAR_TIME_0005
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
   * @tc.number    SUB_BMS_HAPTOHAR_TIME_0006
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
   * @tc.number    SUB_BMS_HAPTOHAR_TIME_0007
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
   * @tc.number    SUB_BMS_HAPTOHAR_TIME_0008
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
   * @tc.number    SUB_BMS_HAPTOHAR_TIME_0009
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
