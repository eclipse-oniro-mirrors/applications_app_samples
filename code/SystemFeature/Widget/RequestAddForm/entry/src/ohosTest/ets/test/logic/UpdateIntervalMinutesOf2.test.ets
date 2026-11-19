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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { updateIntervalMinutesOf } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for updateIntervalMinutesOf (96 cases). */
export default function updateIntervalMinutesOf2Test(): void {
  describe('UpdateIntervalMinutesOf2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0097
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0097
     * @tc.desc      updateIntervalMinutesOf(updateDuration=158) returns 4740
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0097 begin`);
      const actual: number = updateIntervalMinutesOf(158);
      logInfo(`updateIntervalMinutesOf(updateDuration=158): actual=${actual}`);
      expect(actual).assertEqual(4740);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0097 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0098
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0098
     * @tc.desc      updateIntervalMinutesOf(updateDuration=42.32) returns 1269.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0098 begin`);
      const actual: number = updateIntervalMinutesOf(42.32);
      logInfo(`updateIntervalMinutesOf(updateDuration=42...: actual=${actual}`);
      expect(actual).assertClose(1269.6, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0098 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0099
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0099
     * @tc.desc      updateIntervalMinutesOf(updateDuration=9.79) returns 293.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0099 begin`);
      const actual: number = updateIntervalMinutesOf(9.79);
      logInfo(`updateIntervalMinutesOf(updateDuration=9.79): actual=${actual}`);
      expect(actual).assertClose(293.7, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0099 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0100
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0100
     * @tc.desc      updateIntervalMinutesOf(updateDuration=116) returns 3480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0100 begin`);
      const actual: number = updateIntervalMinutesOf(116);
      logInfo(`updateIntervalMinutesOf(updateDuration=116): actual=${actual}`);
      expect(actual).assertEqual(3480);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0100 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0101
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0101
     * @tc.desc      updateIntervalMinutesOf(updateDuration=151) returns 4530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0101 begin`);
      const actual: number = updateIntervalMinutesOf(151);
      logInfo(`updateIntervalMinutesOf(updateDuration=151): actual=${actual}`);
      expect(actual).assertEqual(4530);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0101 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0102
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0102
     * @tc.desc      updateIntervalMinutesOf(updateDuration=111) returns 3330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0102 begin`);
      const actual: number = updateIntervalMinutesOf(111);
      logInfo(`updateIntervalMinutesOf(updateDuration=111): actual=${actual}`);
      expect(actual).assertEqual(3330);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0102 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0103
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0103
     * @tc.desc      updateIntervalMinutesOf(updateDuration=169) returns 5070
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0103 begin`);
      const actual: number = updateIntervalMinutesOf(169);
      logInfo(`updateIntervalMinutesOf(updateDuration=169): actual=${actual}`);
      expect(actual).assertEqual(5070);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0103 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0104
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0104
     * @tc.desc      updateIntervalMinutesOf(updateDuration=29.79) returns 893.6999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0104 begin`);
      const actual: number = updateIntervalMinutesOf(29.79);
      logInfo(`updateIntervalMinutesOf(updateDuration=29...: actual=${actual}`);
      expect(actual).assertClose(893.6999999999999, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0104 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0105
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0105
     * @tc.desc      updateIntervalMinutesOf(updateDuration=148) returns 4440
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0105 begin`);
      const actual: number = updateIntervalMinutesOf(148);
      logInfo(`updateIntervalMinutesOf(updateDuration=148): actual=${actual}`);
      expect(actual).assertEqual(4440);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0105 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0106
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0106
     * @tc.desc      updateIntervalMinutesOf(updateDuration=89) returns 2670
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0106 begin`);
      const actual: number = updateIntervalMinutesOf(89);
      logInfo(`updateIntervalMinutesOf(updateDuration=89): actual=${actual}`);
      expect(actual).assertEqual(2670);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0106 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0107
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0107
     * @tc.desc      updateIntervalMinutesOf(updateDuration=70.62) returns 2118.6000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0107 begin`);
      const actual: number = updateIntervalMinutesOf(70.62);
      logInfo(`updateIntervalMinutesOf(updateDuration=70...: actual=${actual}`);
      expect(actual).assertClose(2118.6000000000004, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0107 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0108
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0108
     * @tc.desc      updateIntervalMinutesOf(updateDuration=11.11) returns 333.29999999999995
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0108 begin`);
      const actual: number = updateIntervalMinutesOf(11.11);
      logInfo(`updateIntervalMinutesOf(updateDuration=11...: actual=${actual}`);
      expect(actual).assertClose(333.29999999999995, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0108 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0109
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0109
     * @tc.desc      updateIntervalMinutesOf(updateDuration=7.56) returns 226.79999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0109 begin`);
      const actual: number = updateIntervalMinutesOf(7.56);
      logInfo(`updateIntervalMinutesOf(updateDuration=7.56): actual=${actual}`);
      expect(actual).assertClose(226.79999999999998, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0109 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0110
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0110
     * @tc.desc      updateIntervalMinutesOf(updateDuration=23.14) returns 694.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0110 begin`);
      const actual: number = updateIntervalMinutesOf(23.14);
      logInfo(`updateIntervalMinutesOf(updateDuration=23...: actual=${actual}`);
      expect(actual).assertClose(694.2, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0110 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0111
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0111
     * @tc.desc      updateIntervalMinutesOf(updateDuration=20.63) returns 618.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0111 begin`);
      const actual: number = updateIntervalMinutesOf(20.63);
      logInfo(`updateIntervalMinutesOf(updateDuration=20...: actual=${actual}`);
      expect(actual).assertClose(618.9, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0111 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0112
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0112
     * @tc.desc      updateIntervalMinutesOf(updateDuration=29.9) returns 897
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0112 begin`);
      const actual: number = updateIntervalMinutesOf(29.9);
      logInfo(`updateIntervalMinutesOf(updateDuration=29.9): actual=${actual}`);
      expect(actual).assertEqual(897);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0112 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0113
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0113
     * @tc.desc      updateIntervalMinutesOf(updateDuration=81.88) returns 2456.3999999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0113 begin`);
      const actual: number = updateIntervalMinutesOf(81.88);
      logInfo(`updateIntervalMinutesOf(updateDuration=81...: actual=${actual}`);
      expect(actual).assertClose(2456.3999999999996, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0113 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0114
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0114
     * @tc.desc      updateIntervalMinutesOf(updateDuration=40.57) returns 1217.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0114 begin`);
      const actual: number = updateIntervalMinutesOf(40.57);
      logInfo(`updateIntervalMinutesOf(updateDuration=40...: actual=${actual}`);
      expect(actual).assertClose(1217.1, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0114 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0115
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0115
     * @tc.desc      updateIntervalMinutesOf(updateDuration=23) returns 690
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0115 begin`);
      const actual: number = updateIntervalMinutesOf(23);
      logInfo(`updateIntervalMinutesOf(updateDuration=23): actual=${actual}`);
      expect(actual).assertEqual(690);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0115 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0116
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0116
     * @tc.desc      updateIntervalMinutesOf(updateDuration=18) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0116 begin`);
      const actual: number = updateIntervalMinutesOf(18);
      logInfo(`updateIntervalMinutesOf(updateDuration=18): actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0116 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0117
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0117
     * @tc.desc      updateIntervalMinutesOf(updateDuration=86.5) returns 2595
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0117 begin`);
      const actual: number = updateIntervalMinutesOf(86.5);
      logInfo(`updateIntervalMinutesOf(updateDuration=86.5): actual=${actual}`);
      expect(actual).assertEqual(2595);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0117 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0118
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0118
     * @tc.desc      updateIntervalMinutesOf(updateDuration=161) returns 4830
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0118 begin`);
      const actual: number = updateIntervalMinutesOf(161);
      logInfo(`updateIntervalMinutesOf(updateDuration=161): actual=${actual}`);
      expect(actual).assertEqual(4830);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0118 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0119
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0119
     * @tc.desc      updateIntervalMinutesOf(updateDuration=67.1) returns 2012.9999999999998
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0119 begin`);
      const actual: number = updateIntervalMinutesOf(67.1);
      logInfo(`updateIntervalMinutesOf(updateDuration=67.1): actual=${actual}`);
      expect(actual).assertClose(2012.9999999999998, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0119 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0120
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0120
     * @tc.desc      updateIntervalMinutesOf(updateDuration=54.77) returns 1643.1000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0120 begin`);
      const actual: number = updateIntervalMinutesOf(54.77);
      logInfo(`updateIntervalMinutesOf(updateDuration=54...: actual=${actual}`);
      expect(actual).assertClose(1643.1000000000001, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0120 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0121
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0121
     * @tc.desc      updateIntervalMinutesOf(updateDuration=26) returns 780
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0121 begin`);
      const actual: number = updateIntervalMinutesOf(26);
      logInfo(`updateIntervalMinutesOf(updateDuration=26): actual=${actual}`);
      expect(actual).assertEqual(780);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0121 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0122
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0122
     * @tc.desc      updateIntervalMinutesOf(updateDuration=20.16) returns 604.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0122 begin`);
      const actual: number = updateIntervalMinutesOf(20.16);
      logInfo(`updateIntervalMinutesOf(updateDuration=20...: actual=${actual}`);
      expect(actual).assertClose(604.8, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0122 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0123
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0123
     * @tc.desc      updateIntervalMinutesOf(updateDuration=33) returns 990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0123 begin`);
      const actual: number = updateIntervalMinutesOf(33);
      logInfo(`updateIntervalMinutesOf(updateDuration=33): actual=${actual}`);
      expect(actual).assertEqual(990);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0123 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0124
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0124
     * @tc.desc      updateIntervalMinutesOf(updateDuration=136) returns 4080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0124 begin`);
      const actual: number = updateIntervalMinutesOf(136);
      logInfo(`updateIntervalMinutesOf(updateDuration=136): actual=${actual}`);
      expect(actual).assertEqual(4080);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0124 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0125
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0125
     * @tc.desc      updateIntervalMinutesOf(updateDuration=97.41) returns 2922.2999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0125 begin`);
      const actual: number = updateIntervalMinutesOf(97.41);
      logInfo(`updateIntervalMinutesOf(updateDuration=97...: actual=${actual}`);
      expect(actual).assertClose(2922.2999999999997, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0125 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0126
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0126
     * @tc.desc      updateIntervalMinutesOf(updateDuration=114) returns 3420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0126 begin`);
      const actual: number = updateIntervalMinutesOf(114);
      logInfo(`updateIntervalMinutesOf(updateDuration=114): actual=${actual}`);
      expect(actual).assertEqual(3420);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0126 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0127
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0127
     * @tc.desc      updateIntervalMinutesOf(updateDuration=30.61) returns 918.3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0127 begin`);
      const actual: number = updateIntervalMinutesOf(30.61);
      logInfo(`updateIntervalMinutesOf(updateDuration=30...: actual=${actual}`);
      expect(actual).assertClose(918.3, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0127 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0128
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0128
     * @tc.desc      updateIntervalMinutesOf(updateDuration=142) returns 4260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0128 begin`);
      const actual: number = updateIntervalMinutesOf(142);
      logInfo(`updateIntervalMinutesOf(updateDuration=142): actual=${actual}`);
      expect(actual).assertEqual(4260);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0128 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0129
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0129
     * @tc.desc      updateIntervalMinutesOf(updateDuration=89.42) returns 2682.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0129 begin`);
      const actual: number = updateIntervalMinutesOf(89.42);
      logInfo(`updateIntervalMinutesOf(updateDuration=89...: actual=${actual}`);
      expect(actual).assertClose(2682.6, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0129 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0130
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0130
     * @tc.desc      updateIntervalMinutesOf(updateDuration=38.83) returns 1164.8999999999999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0130 begin`);
      const actual: number = updateIntervalMinutesOf(38.83);
      logInfo(`updateIntervalMinutesOf(updateDuration=38...: actual=${actual}`);
      expect(actual).assertClose(1164.8999999999999, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0130 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0131
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0131
     * @tc.desc      updateIntervalMinutesOf(updateDuration=14) returns 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0131 begin`);
      const actual: number = updateIntervalMinutesOf(14);
      logInfo(`updateIntervalMinutesOf(updateDuration=14): actual=${actual}`);
      expect(actual).assertEqual(420);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0131 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0132
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0132
     * @tc.desc      updateIntervalMinutesOf(updateDuration=64) returns 1920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0132 begin`);
      const actual: number = updateIntervalMinutesOf(64);
      logInfo(`updateIntervalMinutesOf(updateDuration=64): actual=${actual}`);
      expect(actual).assertEqual(1920);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0132 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0133
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0133
     * @tc.desc      updateIntervalMinutesOf(updateDuration=79) returns 2370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0133 begin`);
      const actual: number = updateIntervalMinutesOf(79);
      logInfo(`updateIntervalMinutesOf(updateDuration=79): actual=${actual}`);
      expect(actual).assertEqual(2370);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0133 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0134
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0134
     * @tc.desc      updateIntervalMinutesOf(updateDuration=96.21) returns 2886.2999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0134 begin`);
      const actual: number = updateIntervalMinutesOf(96.21);
      logInfo(`updateIntervalMinutesOf(updateDuration=96...: actual=${actual}`);
      expect(actual).assertClose(2886.2999999999997, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0134 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0135
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0135
     * @tc.desc      updateIntervalMinutesOf(updateDuration=78) returns 2340
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0135 begin`);
      const actual: number = updateIntervalMinutesOf(78);
      logInfo(`updateIntervalMinutesOf(updateDuration=78): actual=${actual}`);
      expect(actual).assertEqual(2340);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0135 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0136
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0136
     * @tc.desc      updateIntervalMinutesOf(updateDuration=66.97) returns 2009.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0136 begin`);
      const actual: number = updateIntervalMinutesOf(66.97);
      logInfo(`updateIntervalMinutesOf(updateDuration=66...: actual=${actual}`);
      expect(actual).assertClose(2009.1, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0136 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0137
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0137
     * @tc.desc      updateIntervalMinutesOf(updateDuration=183) returns 5490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0137 begin`);
      const actual: number = updateIntervalMinutesOf(183);
      logInfo(`updateIntervalMinutesOf(updateDuration=183): actual=${actual}`);
      expect(actual).assertEqual(5490);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0137 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0138
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0138
     * @tc.desc      updateIntervalMinutesOf(updateDuration=47) returns 1410
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0138 begin`);
      const actual: number = updateIntervalMinutesOf(47);
      logInfo(`updateIntervalMinutesOf(updateDuration=47): actual=${actual}`);
      expect(actual).assertEqual(1410);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0138 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0139
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0139
     * @tc.desc      updateIntervalMinutesOf(updateDuration=124) returns 3720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0139 begin`);
      const actual: number = updateIntervalMinutesOf(124);
      logInfo(`updateIntervalMinutesOf(updateDuration=124): actual=${actual}`);
      expect(actual).assertEqual(3720);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0139 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0140
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0140
     * @tc.desc      updateIntervalMinutesOf(updateDuration=32) returns 960
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0140 begin`);
      const actual: number = updateIntervalMinutesOf(32);
      logInfo(`updateIntervalMinutesOf(updateDuration=32): actual=${actual}`);
      expect(actual).assertEqual(960);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0140 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0141
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0141
     * @tc.desc      updateIntervalMinutesOf(updateDuration=94.56) returns 2836.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0141 begin`);
      const actual: number = updateIntervalMinutesOf(94.56);
      logInfo(`updateIntervalMinutesOf(updateDuration=94...: actual=${actual}`);
      expect(actual).assertClose(2836.8, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0141 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0142
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0142
     * @tc.desc      updateIntervalMinutesOf(updateDuration=24) returns 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0142 begin`);
      const actual: number = updateIntervalMinutesOf(24);
      logInfo(`updateIntervalMinutesOf(updateDuration=24): actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0142 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0143
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0143
     * @tc.desc      updateIntervalMinutesOf(updateDuration=8) returns 240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0143 begin`);
      const actual: number = updateIntervalMinutesOf(8);
      logInfo(`updateIntervalMinutesOf(updateDuration=8): actual=${actual}`);
      expect(actual).assertEqual(240);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0143 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0144
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0144
     * @tc.desc      updateIntervalMinutesOf(updateDuration=104) returns 3120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0144 begin`);
      const actual: number = updateIntervalMinutesOf(104);
      logInfo(`updateIntervalMinutesOf(updateDuration=104): actual=${actual}`);
      expect(actual).assertEqual(3120);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0144 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0145
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0145
     * @tc.desc      updateIntervalMinutesOf(updateDuration=107) returns 3210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0145 begin`);
      const actual: number = updateIntervalMinutesOf(107);
      logInfo(`updateIntervalMinutesOf(updateDuration=107): actual=${actual}`);
      expect(actual).assertEqual(3210);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0145 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0146
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0146
     * @tc.desc      updateIntervalMinutesOf(updateDuration=73) returns 2190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0146 begin`);
      const actual: number = updateIntervalMinutesOf(73);
      logInfo(`updateIntervalMinutesOf(updateDuration=73): actual=${actual}`);
      expect(actual).assertEqual(2190);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0146 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0147
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0147
     * @tc.desc      updateIntervalMinutesOf(updateDuration=52) returns 1560
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0147 begin`);
      const actual: number = updateIntervalMinutesOf(52);
      logInfo(`updateIntervalMinutesOf(updateDuration=52): actual=${actual}`);
      expect(actual).assertEqual(1560);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0147 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0148
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0148
     * @tc.desc      updateIntervalMinutesOf(updateDuration=51.29) returns 1538.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0148 begin`);
      const actual: number = updateIntervalMinutesOf(51.29);
      logInfo(`updateIntervalMinutesOf(updateDuration=51...: actual=${actual}`);
      expect(actual).assertClose(1538.7, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0148 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0149
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0149
     * @tc.desc      updateIntervalMinutesOf(updateDuration=167) returns 5010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0149 begin`);
      const actual: number = updateIntervalMinutesOf(167);
      logInfo(`updateIntervalMinutesOf(updateDuration=167): actual=${actual}`);
      expect(actual).assertEqual(5010);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0149 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0150
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0150
     * @tc.desc      updateIntervalMinutesOf(updateDuration=84.67) returns 2540.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0150 begin`);
      const actual: number = updateIntervalMinutesOf(84.67);
      logInfo(`updateIntervalMinutesOf(updateDuration=84...: actual=${actual}`);
      expect(actual).assertClose(2540.1, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0150 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0151
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0151
     * @tc.desc      updateIntervalMinutesOf(updateDuration=181) returns 5430
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0151 begin`);
      const actual: number = updateIntervalMinutesOf(181);
      logInfo(`updateIntervalMinutesOf(updateDuration=181): actual=${actual}`);
      expect(actual).assertEqual(5430);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0151 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0152
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0152
     * @tc.desc      updateIntervalMinutesOf(updateDuration=11.82) returns 354.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0152 begin`);
      const actual: number = updateIntervalMinutesOf(11.82);
      logInfo(`updateIntervalMinutesOf(updateDuration=11...: actual=${actual}`);
      expect(actual).assertClose(354.6, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0152 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0153
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0153
     * @tc.desc      updateIntervalMinutesOf(updateDuration=147) returns 4410
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0153 begin`);
      const actual: number = updateIntervalMinutesOf(147);
      logInfo(`updateIntervalMinutesOf(updateDuration=147): actual=${actual}`);
      expect(actual).assertEqual(4410);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0153 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0154
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0154
     * @tc.desc      updateIntervalMinutesOf(updateDuration=82) returns 2460
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0154 begin`);
      const actual: number = updateIntervalMinutesOf(82);
      logInfo(`updateIntervalMinutesOf(updateDuration=82): actual=${actual}`);
      expect(actual).assertEqual(2460);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0154 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0155
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0155
     * @tc.desc      updateIntervalMinutesOf(updateDuration=59.26) returns 1777.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0155 begin`);
      const actual: number = updateIntervalMinutesOf(59.26);
      logInfo(`updateIntervalMinutesOf(updateDuration=59...: actual=${actual}`);
      expect(actual).assertClose(1777.8, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0155 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0156
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0156
     * @tc.desc      updateIntervalMinutesOf(updateDuration=34) returns 1020
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0156 begin`);
      const actual: number = updateIntervalMinutesOf(34);
      logInfo(`updateIntervalMinutesOf(updateDuration=34): actual=${actual}`);
      expect(actual).assertEqual(1020);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0156 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0157
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0157
     * @tc.desc      updateIntervalMinutesOf(updateDuration=188) returns 5640
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0157 begin`);
      const actual: number = updateIntervalMinutesOf(188);
      logInfo(`updateIntervalMinutesOf(updateDuration=188): actual=${actual}`);
      expect(actual).assertEqual(5640);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0157 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0158
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0158
     * @tc.desc      updateIntervalMinutesOf(updateDuration=194) returns 5820
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0158 begin`);
      const actual: number = updateIntervalMinutesOf(194);
      logInfo(`updateIntervalMinutesOf(updateDuration=194): actual=${actual}`);
      expect(actual).assertEqual(5820);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0158 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0159
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0159
     * @tc.desc      updateIntervalMinutesOf(updateDuration=76.38) returns 2291.3999999999996
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0159 begin`);
      const actual: number = updateIntervalMinutesOf(76.38);
      logInfo(`updateIntervalMinutesOf(updateDuration=76...: actual=${actual}`);
      expect(actual).assertClose(2291.3999999999996, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0159 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0160
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0160
     * @tc.desc      updateIntervalMinutesOf(updateDuration=66.92) returns 2007.6000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0160 begin`);
      const actual: number = updateIntervalMinutesOf(66.92);
      logInfo(`updateIntervalMinutesOf(updateDuration=66...: actual=${actual}`);
      expect(actual).assertClose(2007.6000000000001, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0160 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0161
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0161
     * @tc.desc      updateIntervalMinutesOf(updateDuration=118) returns 3540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0161 begin`);
      const actual: number = updateIntervalMinutesOf(118);
      logInfo(`updateIntervalMinutesOf(updateDuration=118): actual=${actual}`);
      expect(actual).assertEqual(3540);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0161 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0162
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0162
     * @tc.desc      updateIntervalMinutesOf(updateDuration=77.62) returns 2328.6000000000004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0162 begin`);
      const actual: number = updateIntervalMinutesOf(77.62);
      logInfo(`updateIntervalMinutesOf(updateDuration=77...: actual=${actual}`);
      expect(actual).assertClose(2328.6000000000004, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0162 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0163
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0163
     * @tc.desc      updateIntervalMinutesOf(updateDuration=157) returns 4710
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0163 begin`);
      const actual: number = updateIntervalMinutesOf(157);
      logInfo(`updateIntervalMinutesOf(updateDuration=157): actual=${actual}`);
      expect(actual).assertEqual(4710);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0163 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0164
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0164
     * @tc.desc      updateIntervalMinutesOf(updateDuration=12) returns 360
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0164 begin`);
      const actual: number = updateIntervalMinutesOf(12);
      logInfo(`updateIntervalMinutesOf(updateDuration=12): actual=${actual}`);
      expect(actual).assertEqual(360);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0164 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0165
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0165
     * @tc.desc      updateIntervalMinutesOf(updateDuration=174) returns 5220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0165 begin`);
      const actual: number = updateIntervalMinutesOf(174);
      logInfo(`updateIntervalMinutesOf(updateDuration=174): actual=${actual}`);
      expect(actual).assertEqual(5220);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0165 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0166
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0166
     * @tc.desc      updateIntervalMinutesOf(updateDuration=36.59) returns 1097.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0166 begin`);
      const actual: number = updateIntervalMinutesOf(36.59);
      logInfo(`updateIntervalMinutesOf(updateDuration=36...: actual=${actual}`);
      expect(actual).assertClose(1097.7, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0166 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0167
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0167
     * @tc.desc      updateIntervalMinutesOf(updateDuration=92) returns 2760
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0167 begin`);
      const actual: number = updateIntervalMinutesOf(92);
      logInfo(`updateIntervalMinutesOf(updateDuration=92): actual=${actual}`);
      expect(actual).assertEqual(2760);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0167 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0168
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0168
     * @tc.desc      updateIntervalMinutesOf(updateDuration=61) returns 1830
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0168 begin`);
      const actual: number = updateIntervalMinutesOf(61);
      logInfo(`updateIntervalMinutesOf(updateDuration=61): actual=${actual}`);
      expect(actual).assertEqual(1830);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0168 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0169
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0169
     * @tc.desc      updateIntervalMinutesOf(updateDuration=182) returns 5460
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0169 begin`);
      const actual: number = updateIntervalMinutesOf(182);
      logInfo(`updateIntervalMinutesOf(updateDuration=182): actual=${actual}`);
      expect(actual).assertEqual(5460);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0169 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0170
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0170
     * @tc.desc      updateIntervalMinutesOf(updateDuration=65.68) returns 1970.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0170 begin`);
      const actual: number = updateIntervalMinutesOf(65.68);
      logInfo(`updateIntervalMinutesOf(updateDuration=65...: actual=${actual}`);
      expect(actual).assertClose(1970.4, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0170 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0171
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0171
     * @tc.desc      updateIntervalMinutesOf(updateDuration=54.59) returns 1637.7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0171 begin`);
      const actual: number = updateIntervalMinutesOf(54.59);
      logInfo(`updateIntervalMinutesOf(updateDuration=54...: actual=${actual}`);
      expect(actual).assertClose(1637.7, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0171 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0172
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0172
     * @tc.desc      updateIntervalMinutesOf(updateDuration=2.18) returns 65.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0172 begin`);
      const actual: number = updateIntervalMinutesOf(2.18);
      logInfo(`updateIntervalMinutesOf(updateDuration=2.18): actual=${actual}`);
      expect(actual).assertClose(65.4, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0172 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0173
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0173
     * @tc.desc      updateIntervalMinutesOf(updateDuration=42.05) returns 1261.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0173 begin`);
      const actual: number = updateIntervalMinutesOf(42.05);
      logInfo(`updateIntervalMinutesOf(updateDuration=42...: actual=${actual}`);
      expect(actual).assertClose(1261.5, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0173 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0174
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0174
     * @tc.desc      updateIntervalMinutesOf(updateDuration=164) returns 4920
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0174 begin`);
      const actual: number = updateIntervalMinutesOf(164);
      logInfo(`updateIntervalMinutesOf(updateDuration=164): actual=${actual}`);
      expect(actual).assertEqual(4920);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0174 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0175
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0175
     * @tc.desc      updateIntervalMinutesOf(updateDuration=113) returns 3390
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0175 begin`);
      const actual: number = updateIntervalMinutesOf(113);
      logInfo(`updateIntervalMinutesOf(updateDuration=113): actual=${actual}`);
      expect(actual).assertEqual(3390);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0175 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0176
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0176
     * @tc.desc      updateIntervalMinutesOf(updateDuration=74) returns 2220
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0176 begin`);
      const actual: number = updateIntervalMinutesOf(74);
      logInfo(`updateIntervalMinutesOf(updateDuration=74): actual=${actual}`);
      expect(actual).assertEqual(2220);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0176 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0177
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0177
     * @tc.desc      updateIntervalMinutesOf(updateDuration=171) returns 5130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0177 begin`);
      const actual: number = updateIntervalMinutesOf(171);
      logInfo(`updateIntervalMinutesOf(updateDuration=171): actual=${actual}`);
      expect(actual).assertEqual(5130);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0177 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0178
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0178
     * @tc.desc      updateIntervalMinutesOf(updateDuration=127) returns 3810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0178 begin`);
      const actual: number = updateIntervalMinutesOf(127);
      logInfo(`updateIntervalMinutesOf(updateDuration=127): actual=${actual}`);
      expect(actual).assertEqual(3810);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0178 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0179
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0179
     * @tc.desc      updateIntervalMinutesOf(updateDuration=50.88) returns 1526.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0179 begin`);
      const actual: number = updateIntervalMinutesOf(50.88);
      logInfo(`updateIntervalMinutesOf(updateDuration=50...: actual=${actual}`);
      expect(actual).assertClose(1526.4, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0179 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0180
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0180
     * @tc.desc      updateIntervalMinutesOf(updateDuration=117) returns 3510
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0180 begin`);
      const actual: number = updateIntervalMinutesOf(117);
      logInfo(`updateIntervalMinutesOf(updateDuration=117): actual=${actual}`);
      expect(actual).assertEqual(3510);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0180 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0181
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0181
     * @tc.desc      updateIntervalMinutesOf(updateDuration=84) returns 2520
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0181 begin`);
      const actual: number = updateIntervalMinutesOf(84);
      logInfo(`updateIntervalMinutesOf(updateDuration=84): actual=${actual}`);
      expect(actual).assertEqual(2520);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0181 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0182
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0182
     * @tc.desc      updateIntervalMinutesOf(updateDuration=11.44) returns 343.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0182 begin`);
      const actual: number = updateIntervalMinutesOf(11.44);
      logInfo(`updateIntervalMinutesOf(updateDuration=11...: actual=${actual}`);
      expect(actual).assertClose(343.2, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0182 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0183
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0183
     * @tc.desc      updateIntervalMinutesOf(updateDuration=47.27) returns 1418.1000000000001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0183 begin`);
      const actual: number = updateIntervalMinutesOf(47.27);
      logInfo(`updateIntervalMinutesOf(updateDuration=47...: actual=${actual}`);
      expect(actual).assertClose(1418.1000000000001, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0183 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0184
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0184
     * @tc.desc      updateIntervalMinutesOf(updateDuration=46) returns 1380
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0184 begin`);
      const actual: number = updateIntervalMinutesOf(46);
      logInfo(`updateIntervalMinutesOf(updateDuration=46): actual=${actual}`);
      expect(actual).assertEqual(1380);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0184 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0185
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0185
     * @tc.desc      updateIntervalMinutesOf(updateDuration=17.15) returns 514.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0185 begin`);
      const actual: number = updateIntervalMinutesOf(17.15);
      logInfo(`updateIntervalMinutesOf(updateDuration=17...: actual=${actual}`);
      expect(actual).assertClose(514.5, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0185 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0186
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0186
     * @tc.desc      updateIntervalMinutesOf(updateDuration=15.39) returns 461.70000000000005
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0186 begin`);
      const actual: number = updateIntervalMinutesOf(15.39);
      logInfo(`updateIntervalMinutesOf(updateDuration=15...: actual=${actual}`);
      expect(actual).assertClose(461.70000000000005, PRECISION);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0186 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0187
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0187
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0187 begin`);
      const actual: number = updateIntervalMinutesOf(-1);
      logInfo(`updateIntervalMinutesOf(updateDuration=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0187 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0188
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0188
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-67) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0188 begin`);
      const actual: number = updateIntervalMinutesOf(-67);
      logInfo(`updateIntervalMinutesOf(updateDuration=-67): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0188 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0189
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0189
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-53) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0189 begin`);
      const actual: number = updateIntervalMinutesOf(-53);
      logInfo(`updateIntervalMinutesOf(updateDuration=-53): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0189 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0190
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0190
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0190 begin`);
      const actual: number = updateIntervalMinutesOf(-25);
      logInfo(`updateIntervalMinutesOf(updateDuration=-25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0190 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0191
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0191
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0191 begin`);
      const actual: number = updateIntervalMinutesOf(-85);
      logInfo(`updateIntervalMinutesOf(updateDuration=-85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0191 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_UPDATE_INTERVAL_MINUTES_OF_0192
     * @tc.name      RequestAddForm_UpdateIntervalMinutesOf_0192
     * @tc.desc      updateIntervalMinutesOf(updateDuration=-33) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_UpdateIntervalMinutesOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0192 begin`);
      const actual: number = updateIntervalMinutesOf(-33);
      logInfo(`updateIntervalMinutesOf(updateDuration=-33): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}UpdateIntervalMinutesOf_0192 end`);
    });
  });
}
