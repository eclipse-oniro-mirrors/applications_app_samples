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
import { minutesUntilScheduled } from '../model/RequestAddFormLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_RequestAddForm]';
const BUNDLE: string = 'RequestAddForm_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for minutesUntilScheduled (96 cases). */
export default function minutesUntilScheduled2Test(): void {
  describe('MinutesUntilScheduled2Test', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0097
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0097
     * @tc.desc      minutesUntilScheduled(hour=0, minute=162) returns 468
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0097 begin`);
      const actual: number = minutesUntilScheduled(0, 162);
      logInfo(`minutesUntilScheduled(hour=0, minute=162): actual=${actual}`);
      expect(actual).assertEqual(468);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0097 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0098
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0098
     * @tc.desc      minutesUntilScheduled(hour=0, minute=168) returns 462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0098 begin`);
      const actual: number = minutesUntilScheduled(0, 168);
      logInfo(`minutesUntilScheduled(hour=0, minute=168): actual=${actual}`);
      expect(actual).assertEqual(462);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0098 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0099
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0099
     * @tc.desc      minutesUntilScheduled(hour=0, minute=174) returns 456
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0099 begin`);
      const actual: number = minutesUntilScheduled(0, 174);
      logInfo(`minutesUntilScheduled(hour=0, minute=174): actual=${actual}`);
      expect(actual).assertEqual(456);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0099 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0100
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0100
     * @tc.desc      minutesUntilScheduled(hour=0, minute=186) returns 444
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0100 begin`);
      const actual: number = minutesUntilScheduled(0, 186);
      logInfo(`minutesUntilScheduled(hour=0, minute=186): actual=${actual}`);
      expect(actual).assertEqual(444);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0100 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0101
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0101
     * @tc.desc      minutesUntilScheduled(hour=0, minute=192) returns 438
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0101 begin`);
      const actual: number = minutesUntilScheduled(0, 192);
      logInfo(`minutesUntilScheduled(hour=0, minute=192): actual=${actual}`);
      expect(actual).assertEqual(438);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0101 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0102
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0102
     * @tc.desc      minutesUntilScheduled(hour=0, minute=198) returns 432
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0102 begin`);
      const actual: number = minutesUntilScheduled(0, 198);
      logInfo(`minutesUntilScheduled(hour=0, minute=198): actual=${actual}`);
      expect(actual).assertEqual(432);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0102 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0103
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0103
     * @tc.desc      minutesUntilScheduled(hour=0, minute=204) returns 426
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0103 begin`);
      const actual: number = minutesUntilScheduled(0, 204);
      logInfo(`minutesUntilScheduled(hour=0, minute=204): actual=${actual}`);
      expect(actual).assertEqual(426);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0103 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0104
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0104
     * @tc.desc      minutesUntilScheduled(hour=0, minute=210) returns 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0104 begin`);
      const actual: number = minutesUntilScheduled(0, 210);
      logInfo(`minutesUntilScheduled(hour=0, minute=210): actual=${actual}`);
      expect(actual).assertEqual(420);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0104 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0105
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0105
     * @tc.desc      minutesUntilScheduled(hour=0, minute=216) returns 414
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0105 begin`);
      const actual: number = minutesUntilScheduled(0, 216);
      logInfo(`minutesUntilScheduled(hour=0, minute=216): actual=${actual}`);
      expect(actual).assertEqual(414);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0105 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0106
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0106
     * @tc.desc      minutesUntilScheduled(hour=0, minute=19.52) returns 610.48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0106 begin`);
      const actual: number = minutesUntilScheduled(0, 19.52);
      logInfo(`minutesUntilScheduled(hour=0, minute=19.52): actual=${actual}`);
      expect(actual).assertClose(610.48, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0106 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0107
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0107
     * @tc.desc      minutesUntilScheduled(hour=0, minute=79.23) returns 550.77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0107 begin`);
      const actual: number = minutesUntilScheduled(0, 79.23);
      logInfo(`minutesUntilScheduled(hour=0, minute=79.23): actual=${actual}`);
      expect(actual).assertClose(550.77, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0107 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0108
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0108
     * @tc.desc      minutesUntilScheduled(hour=0, minute=205) returns 425
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0108 begin`);
      const actual: number = minutesUntilScheduled(0, 205);
      logInfo(`minutesUntilScheduled(hour=0, minute=205): actual=${actual}`);
      expect(actual).assertEqual(425);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0108 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0109
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0109
     * @tc.desc      minutesUntilScheduled(hour=0, minute=112) returns 518
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0109 begin`);
      const actual: number = minutesUntilScheduled(0, 112);
      logInfo(`minutesUntilScheduled(hour=0, minute=112): actual=${actual}`);
      expect(actual).assertEqual(518);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0109 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0110
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0110
     * @tc.desc      minutesUntilScheduled(hour=0, minute=-116) returns 746
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0110 begin`);
      const actual: number = minutesUntilScheduled(0, -116);
      logInfo(`minutesUntilScheduled(hour=0, minute=-116): actual=${actual}`);
      expect(actual).assertEqual(746);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0110 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0111
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0111
     * @tc.desc      minutesUntilScheduled(hour=0, minute=-103) returns 733
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0111 begin`);
      const actual: number = minutesUntilScheduled(0, -103);
      logInfo(`minutesUntilScheduled(hour=0, minute=-103): actual=${actual}`);
      expect(actual).assertEqual(733);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0111 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0112
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0112
     * @tc.desc      minutesUntilScheduled(hour=36, minute=100) returns -190
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0112 begin`);
      const actual: number = minutesUntilScheduled(36, 100);
      logInfo(`minutesUntilScheduled(hour=36, minute=100): actual=${actual}`);
      expect(actual).assertEqual(-190);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0112 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0113
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0113
     * @tc.desc      minutesUntilScheduled(hour=162, minute=216) returns -7866
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0113 begin`);
      const actual: number = minutesUntilScheduled(162, 216);
      logInfo(`minutesUntilScheduled(hour=162, minute=216): actual=${actual}`);
      expect(actual).assertEqual(-7866);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0113 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0114
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0114
     * @tc.desc      minutesUntilScheduled(hour=42, minute=54) returns -504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0114 begin`);
      const actual: number = minutesUntilScheduled(42, 54);
      logInfo(`minutesUntilScheduled(hour=42, minute=54): actual=${actual}`);
      expect(actual).assertEqual(-504);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0114 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0115
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0115
     * @tc.desc      minutesUntilScheduled(hour=120, minute=61) returns -5191
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0115 begin`);
      const actual: number = minutesUntilScheduled(120, 61);
      logInfo(`minutesUntilScheduled(hour=120, minute=61): actual=${actual}`);
      expect(actual).assertEqual(-5191);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0115 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0116
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0116
     * @tc.desc      minutesUntilScheduled(hour=138, minute=3) returns -6213
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0116 begin`);
      const actual: number = minutesUntilScheduled(138, 3);
      logInfo(`minutesUntilScheduled(hour=138, minute=3): actual=${actual}`);
      expect(actual).assertEqual(-6213);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0116 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0117
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0117
     * @tc.desc      minutesUntilScheduled(hour=-77, minute=108) returns 5142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0117 begin`);
      const actual: number = minutesUntilScheduled(-77, 108);
      logInfo(`minutesUntilScheduled(hour=-77, minute=108): actual=${actual}`);
      expect(actual).assertEqual(5142);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0117 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0118
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0118
     * @tc.desc      minutesUntilScheduled(hour=30, minute=18) returns 252
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0118 begin`);
      const actual: number = minutesUntilScheduled(30, 18);
      logInfo(`minutesUntilScheduled(hour=30, minute=18): actual=${actual}`);
      expect(actual).assertEqual(252);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0118 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0119
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0119
     * @tc.desc      minutesUntilScheduled(hour=186, minute=1) returns -9091
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0119 begin`);
      const actual: number = minutesUntilScheduled(186, 1);
      logInfo(`minutesUntilScheduled(hour=186, minute=1): actual=${actual}`);
      expect(actual).assertEqual(-9091);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0119 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0120
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0120
     * @tc.desc      minutesUntilScheduled(hour=5.49, minute=24) returns 276.59999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0120 begin`);
      const actual: number = minutesUntilScheduled(5.49, 24);
      logInfo(`minutesUntilScheduled(hour=5.49, minute=24): actual=${actual}`);
      expect(actual).assertClose(276.59999999999997, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0120 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0121
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0121
     * @tc.desc      minutesUntilScheduled(hour=-3, minute=12) returns 798
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0121 begin`);
      const actual: number = minutesUntilScheduled(-3, 12);
      logInfo(`minutesUntilScheduled(hour=-3, minute=12): actual=${actual}`);
      expect(actual).assertEqual(798);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0121 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0122
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0122
     * @tc.desc      minutesUntilScheduled(hour=36, minute=90) returns -180
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0122 begin`);
      const actual: number = minutesUntilScheduled(36, 90);
      logInfo(`minutesUntilScheduled(hour=36, minute=90): actual=${actual}`);
      expect(actual).assertEqual(-180);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0122 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0123
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0123
     * @tc.desc      minutesUntilScheduled(hour=73, minute=5) returns -2315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0123 begin`);
      const actual: number = minutesUntilScheduled(73, 5);
      logInfo(`minutesUntilScheduled(hour=73, minute=5): actual=${actual}`);
      expect(actual).assertEqual(-2315);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0123 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0124
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0124
     * @tc.desc      minutesUntilScheduled(hour=54, minute=204) returns -1374
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0124 begin`);
      const actual: number = minutesUntilScheduled(54, 204);
      logInfo(`minutesUntilScheduled(hour=54, minute=204): actual=${actual}`);
      expect(actual).assertEqual(-1374);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0124 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0125
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0125
     * @tc.desc      minutesUntilScheduled(hour=132, minute=20) returns -5870
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0125 begin`);
      const actual: number = minutesUntilScheduled(132, 20);
      logInfo(`minutesUntilScheduled(hour=132, minute=20): actual=${actual}`);
      expect(actual).assertEqual(-5870);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0125 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0126
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0126
     * @tc.desc      minutesUntilScheduled(hour=204, minute=2) returns -10172
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0126 begin`);
      const actual: number = minutesUntilScheduled(204, 2);
      logInfo(`minutesUntilScheduled(hour=204, minute=2): actual=${actual}`);
      expect(actual).assertEqual(-10172);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0126 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0127
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0127
     * @tc.desc      minutesUntilScheduled(hour=84, minute=186) returns -3156
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0127 begin`);
      const actual: number = minutesUntilScheduled(84, 186);
      logInfo(`minutesUntilScheduled(hour=84, minute=186): actual=${actual}`);
      expect(actual).assertEqual(-3156);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0127 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0128
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0128
     * @tc.desc      minutesUntilScheduled(hour=144, minute=132) returns -6702
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0128 begin`);
      const actual: number = minutesUntilScheduled(144, 132);
      logInfo(`minutesUntilScheduled(hour=144, minute=132): actual=${actual}`);
      expect(actual).assertEqual(-6702);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0128 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0129
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0129
     * @tc.desc      minutesUntilScheduled(hour=174, minute=132) returns -8502
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0129 begin`);
      const actual: number = minutesUntilScheduled(174, 132);
      logInfo(`minutesUntilScheduled(hour=174, minute=132): actual=${actual}`);
      expect(actual).assertEqual(-8502);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0129 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0130
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0130
     * @tc.desc      minutesUntilScheduled(hour=210, minute=204) returns -10734
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0130 begin`);
      const actual: number = minutesUntilScheduled(210, 204);
      logInfo(`minutesUntilScheduled(hour=210, minute=204): actual=${actual}`);
      expect(actual).assertEqual(-10734);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0130 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0131
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0131
     * @tc.desc      minutesUntilScheduled(hour=30, minute=168) returns 102
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0131 begin`);
      const actual: number = minutesUntilScheduled(30, 168);
      logInfo(`minutesUntilScheduled(hour=30, minute=168): actual=${actual}`);
      expect(actual).assertEqual(102);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0131 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0132
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0132
     * @tc.desc      minutesUntilScheduled(hour=3, minute=23) returns 427
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0132 begin`);
      const actual: number = minutesUntilScheduled(3, 23);
      logInfo(`minutesUntilScheduled(hour=3, minute=23): actual=${actual}`);
      expect(actual).assertEqual(427);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0132 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0133
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0133
     * @tc.desc      minutesUntilScheduled(hour=186, minute=114) returns -9204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0133 begin`);
      const actual: number = minutesUntilScheduled(186, 114);
      logInfo(`minutesUntilScheduled(hour=186, minute=114): actual=${actual}`);
      expect(actual).assertEqual(-9204);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0133 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0134
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0134
     * @tc.desc      minutesUntilScheduled(hour=10, minute=78) returns 1392
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0134 begin`);
      const actual: number = minutesUntilScheduled(10, 78);
      logInfo(`minutesUntilScheduled(hour=10, minute=78): actual=${actual}`);
      expect(actual).assertEqual(1392);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0134 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0135
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0135
     * @tc.desc      minutesUntilScheduled(hour=204, minute=90) returns -10260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0135 begin`);
      const actual: number = minutesUntilScheduled(204, 90);
      logInfo(`minutesUntilScheduled(hour=204, minute=90): actual=${actual}`);
      expect(actual).assertEqual(-10260);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0135 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0136
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0136
     * @tc.desc      minutesUntilScheduled(hour=72, minute=29) returns -2279
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0136 begin`);
      const actual: number = minutesUntilScheduled(72, 29);
      logInfo(`minutesUntilScheduled(hour=72, minute=29): actual=${actual}`);
      expect(actual).assertEqual(-2279);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0136 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0137
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0137
     * @tc.desc      minutesUntilScheduled(hour=42, minute=108) returns -558
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0137 begin`);
      const actual: number = minutesUntilScheduled(42, 108);
      logInfo(`minutesUntilScheduled(hour=42, minute=108): actual=${actual}`);
      expect(actual).assertEqual(-558);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0137 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0138
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0138
     * @tc.desc      minutesUntilScheduled(hour=84, minute=6) returns -2976
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0138 begin`);
      const actual: number = minutesUntilScheduled(84, 6);
      logInfo(`minutesUntilScheduled(hour=84, minute=6): actual=${actual}`);
      expect(actual).assertEqual(-2976);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0138 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0139
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0139
     * @tc.desc      minutesUntilScheduled(hour=100, minute=12) returns -3942
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0139 begin`);
      const actual: number = minutesUntilScheduled(100, 12);
      logInfo(`minutesUntilScheduled(hour=100, minute=12): actual=${actual}`);
      expect(actual).assertEqual(-3942);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0139 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0140
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0140
     * @tc.desc      minutesUntilScheduled(hour=96, minute=168) returns -3858
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0140 begin`);
      const actual: number = minutesUntilScheduled(96, 168);
      logInfo(`minutesUntilScheduled(hour=96, minute=168): actual=${actual}`);
      expect(actual).assertEqual(-3858);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0140 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0141
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0141
     * @tc.desc      minutesUntilScheduled(hour=72, minute=186) returns -2436
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0141 begin`);
      const actual: number = minutesUntilScheduled(72, 186);
      logInfo(`minutesUntilScheduled(hour=72, minute=186): actual=${actual}`);
      expect(actual).assertEqual(-2436);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0141 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0142
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0142
     * @tc.desc      minutesUntilScheduled(hour=-3, minute=61) returns 749
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0142 begin`);
      const actual: number = minutesUntilScheduled(-3, 61);
      logInfo(`minutesUntilScheduled(hour=-3, minute=61): actual=${actual}`);
      expect(actual).assertEqual(749);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0142 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0143
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0143
     * @tc.desc      minutesUntilScheduled(hour=138, minute=-116) returns -6094
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0143 begin`);
      const actual: number = minutesUntilScheduled(138, -116);
      logInfo(`minutesUntilScheduled(hour=138, minute=-116): actual=${actual}`);
      expect(actual).assertEqual(-6094);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0143 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0144
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0144
     * @tc.desc      minutesUntilScheduled(hour=-77, minute=10) returns 5240
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0144 begin`);
      const actual: number = minutesUntilScheduled(-77, 10);
      logInfo(`minutesUntilScheduled(hour=-77, minute=10): actual=${actual}`);
      expect(actual).assertEqual(5240);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0144 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0145
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0145
     * @tc.desc      minutesUntilScheduled(hour=108, minute=186) returns -4596
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0145 begin`);
      const actual: number = minutesUntilScheduled(108, 186);
      logInfo(`minutesUntilScheduled(hour=108, minute=186): actual=${actual}`);
      expect(actual).assertEqual(-4596);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0145 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0146
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0146
     * @tc.desc      minutesUntilScheduled(hour=73, minute=150) returns -2460
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0146 begin`);
      const actual: number = minutesUntilScheduled(73, 150);
      logInfo(`minutesUntilScheduled(hour=73, minute=150): actual=${actual}`);
      expect(actual).assertEqual(-2460);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0146 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0147
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0147
     * @tc.desc      minutesUntilScheduled(hour=150, minute=112) returns -7042
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0147 begin`);
      const actual: number = minutesUntilScheduled(150, 112);
      logInfo(`minutesUntilScheduled(hour=150, minute=112): actual=${actual}`);
      expect(actual).assertEqual(-7042);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0147 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0148
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0148
     * @tc.desc      minutesUntilScheduled(hour=6, minute=84) returns 186
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0148 begin`);
      const actual: number = minutesUntilScheduled(6, 84);
      logInfo(`minutesUntilScheduled(hour=6, minute=84): actual=${actual}`);
      expect(actual).assertEqual(186);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0148 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0149
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0149
     * @tc.desc      minutesUntilScheduled(hour=101, minute=3) returns -3993
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0149 begin`);
      const actual: number = minutesUntilScheduled(101, 3);
      logInfo(`minutesUntilScheduled(hour=101, minute=3): actual=${actual}`);
      expect(actual).assertEqual(-3993);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0149 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0150
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0150
     * @tc.desc      minutesUntilScheduled(hour=168, minute=60) returns -8070
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0150 begin`);
      const actual: number = minutesUntilScheduled(168, 60);
      logInfo(`minutesUntilScheduled(hour=168, minute=60): actual=${actual}`);
      expect(actual).assertEqual(-8070);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0150 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0151
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0151
     * @tc.desc      minutesUntilScheduled(hour=9, minute=150) returns 1380
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0151 begin`);
      const actual: number = minutesUntilScheduled(9, 150);
      logInfo(`minutesUntilScheduled(hour=9, minute=150): actual=${actual}`);
      expect(actual).assertEqual(1380);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0151 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0152
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0152
     * @tc.desc      minutesUntilScheduled(hour=168, minute=138) returns -8148
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0152 begin`);
      const actual: number = minutesUntilScheduled(168, 138);
      logInfo(`minutesUntilScheduled(hour=168, minute=138): actual=${actual}`);
      expect(actual).assertEqual(-8148);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0152 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0153
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0153
     * @tc.desc      minutesUntilScheduled(hour=30, minute=29) returns 241
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0153 begin`);
      const actual: number = minutesUntilScheduled(30, 29);
      logInfo(`minutesUntilScheduled(hour=30, minute=29): actual=${actual}`);
      expect(actual).assertEqual(241);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0153 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0154
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0154
     * @tc.desc      minutesUntilScheduled(hour=102, minute=1) returns -4051
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0154 begin`);
      const actual: number = minutesUntilScheduled(102, 1);
      logInfo(`minutesUntilScheduled(hour=102, minute=1): actual=${actual}`);
      expect(actual).assertEqual(-4051);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0154 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0155
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0155
     * @tc.desc      minutesUntilScheduled(hour=29, minute=1) returns 329
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0155 begin`);
      const actual: number = minutesUntilScheduled(29, 1);
      logInfo(`minutesUntilScheduled(hour=29, minute=1): actual=${actual}`);
      expect(actual).assertEqual(329);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0155 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0156
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0156
     * @tc.desc      minutesUntilScheduled(hour=5.49, minute=10) returns 290.59999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0156 begin`);
      const actual: number = minutesUntilScheduled(5.49, 10);
      logInfo(`minutesUntilScheduled(hour=5.49, minute=10): actual=${actual}`);
      expect(actual).assertClose(290.59999999999997, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0156 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0157
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0157
     * @tc.desc      minutesUntilScheduled(hour=186, minute=59) returns -9149
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0157 begin`);
      const actual: number = minutesUntilScheduled(186, 59);
      logInfo(`minutesUntilScheduled(hour=186, minute=59): actual=${actual}`);
      expect(actual).assertEqual(-9149);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0157 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0158
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0158
     * @tc.desc      minutesUntilScheduled(hour=96, minute=-116) returns -3574
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0158 begin`);
      const actual: number = minutesUntilScheduled(96, -116);
      logInfo(`minutesUntilScheduled(hour=96, minute=-116): actual=${actual}`);
      expect(actual).assertEqual(-3574);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0158 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0159
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0159
     * @tc.desc      minutesUntilScheduled(hour=162, minute=180) returns -7830
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0159 begin`);
      const actual: number = minutesUntilScheduled(162, 180);
      logInfo(`minutesUntilScheduled(hour=162, minute=180): actual=${actual}`);
      expect(actual).assertEqual(-7830);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0159 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0160
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0160
     * @tc.desc      minutesUntilScheduled(hour=3, minute=54) returns 396
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0160 begin`);
      const actual: number = minutesUntilScheduled(3, 54);
      logInfo(`minutesUntilScheduled(hour=3, minute=54): actual=${actual}`);
      expect(actual).assertEqual(396);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0160 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0161
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0161
     * @tc.desc      minutesUntilScheduled(hour=114, minute=29) returns -4799
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0161 begin`);
      const actual: number = minutesUntilScheduled(114, 29);
      logInfo(`minutesUntilScheduled(hour=114, minute=29): actual=${actual}`);
      expect(actual).assertEqual(-4799);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0161 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0162
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0162
     * @tc.desc      minutesUntilScheduled(hour=31, minute=15) returns 195
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0162 begin`);
      const actual: number = minutesUntilScheduled(31, 15);
      logInfo(`minutesUntilScheduled(hour=31, minute=15): actual=${actual}`);
      expect(actual).assertEqual(195);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0162 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0163
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0163
     * @tc.desc      minutesUntilScheduled(hour=156, minute=78) returns -7368
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0163 begin`);
      const actual: number = minutesUntilScheduled(156, 78);
      logInfo(`minutesUntilScheduled(hour=156, minute=78): actual=${actual}`);
      expect(actual).assertEqual(-7368);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0163 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0164
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0164
     * @tc.desc      minutesUntilScheduled(hour=61, minute=120) returns -1710
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0164 begin`);
      const actual: number = minutesUntilScheduled(61, 120);
      logInfo(`minutesUntilScheduled(hour=61, minute=120): actual=${actual}`);
      expect(actual).assertEqual(-1710);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0164 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0165
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0165
     * @tc.desc      minutesUntilScheduled(hour=12, minute=31) returns 1319
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0165 begin`);
      const actual: number = minutesUntilScheduled(12, 31);
      logInfo(`minutesUntilScheduled(hour=12, minute=31): actual=${actual}`);
      expect(actual).assertEqual(1319);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0165 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0166
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0166
     * @tc.desc      minutesUntilScheduled(hour=66, minute=11) returns -1901
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0166 begin`);
      const actual: number = minutesUntilScheduled(66, 11);
      logInfo(`minutesUntilScheduled(hour=66, minute=11): actual=${actual}`);
      expect(actual).assertEqual(-1901);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0166 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0167
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0167
     * @tc.desc      minutesUntilScheduled(hour=29, minute=162) returns 168
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0167 begin`);
      const actual: number = minutesUntilScheduled(29, 162);
      logInfo(`minutesUntilScheduled(hour=29, minute=162): actual=${actual}`);
      expect(actual).assertEqual(168);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0167 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0168
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0168
     * @tc.desc      minutesUntilScheduled(hour=90, minute=6) returns -3336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0168 begin`);
      const actual: number = minutesUntilScheduled(90, 6);
      logInfo(`minutesUntilScheduled(hour=90, minute=6): actual=${actual}`);
      expect(actual).assertEqual(-3336);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0168 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0169
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0169
     * @tc.desc      minutesUntilScheduled(hour=180, minute=12) returns -8742
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0169 begin`);
      const actual: number = minutesUntilScheduled(180, 12);
      logInfo(`minutesUntilScheduled(hour=180, minute=12): actual=${actual}`);
      expect(actual).assertEqual(-8742);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0169 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0170
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0170
     * @tc.desc      minutesUntilScheduled(hour=10, minute=112) returns 1358
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0170 begin`);
      const actual: number = minutesUntilScheduled(10, 112);
      logInfo(`minutesUntilScheduled(hour=10, minute=112): actual=${actual}`);
      expect(actual).assertEqual(1358);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0170 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0171
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0171
     * @tc.desc      minutesUntilScheduled(hour=210, minute=150) returns -10680
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0171 begin`);
      const actual: number = minutesUntilScheduled(210, 150);
      logInfo(`minutesUntilScheduled(hour=210, minute=150): actual=${actual}`);
      expect(actual).assertEqual(-10680);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0171 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0172
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0172
     * @tc.desc      minutesUntilScheduled(hour=25, minute=25) returns 545
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0172 begin`);
      const actual: number = minutesUntilScheduled(25, 25);
      logInfo(`minutesUntilScheduled(hour=25, minute=25): actual=${actual}`);
      expect(actual).assertEqual(545);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0172 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0173
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0173
     * @tc.desc      minutesUntilScheduled(hour=168, minute=174) returns -8184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0173 begin`);
      const actual: number = minutesUntilScheduled(168, 174);
      logInfo(`minutesUntilScheduled(hour=168, minute=174): actual=${actual}`);
      expect(actual).assertEqual(-8184);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0173 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0174
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0174
     * @tc.desc      minutesUntilScheduled(hour=126, minute=15) returns -5505
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0174 begin`);
      const actual: number = minutesUntilScheduled(126, 15);
      logInfo(`minutesUntilScheduled(hour=126, minute=15): actual=${actual}`);
      expect(actual).assertEqual(-5505);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0174 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0175
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0175
     * @tc.desc      minutesUntilScheduled(hour=156, minute=186) returns -7476
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0175 begin`);
      const actual: number = minutesUntilScheduled(156, 186);
      logInfo(`minutesUntilScheduled(hour=156, minute=186): actual=${actual}`);
      expect(actual).assertEqual(-7476);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0175 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0176
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0176
     * @tc.desc      minutesUntilScheduled(hour=18, minute=19.52) returns 970.48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0176 begin`);
      const actual: number = minutesUntilScheduled(18, 19.52);
      logInfo(`minutesUntilScheduled(hour=18, minute=19.52): actual=${actual}`);
      expect(actual).assertClose(970.48, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0176 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0177
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0177
     * @tc.desc      minutesUntilScheduled(hour=174, minute=24) returns -8394
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0177 begin`);
      const actual: number = minutesUntilScheduled(174, 24);
      logInfo(`minutesUntilScheduled(hour=174, minute=24): actual=${actual}`);
      expect(actual).assertEqual(-8394);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0177 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0178
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0178
     * @tc.desc      minutesUntilScheduled(hour=12, minute=19.52) returns 1330.48
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0178 begin`);
      const actual: number = minutesUntilScheduled(12, 19.52);
      logInfo(`minutesUntilScheduled(hour=12, minute=19.52): actual=${actual}`);
      expect(actual).assertClose(1330.48, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0178 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0179
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0179
     * @tc.desc      minutesUntilScheduled(hour=36, minute=11) returns -101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0179 begin`);
      const actual: number = minutesUntilScheduled(36, 11);
      logInfo(`minutesUntilScheduled(hour=36, minute=11): actual=${actual}`);
      expect(actual).assertEqual(-101);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0179 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0180
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0180
     * @tc.desc      minutesUntilScheduled(hour=15, minute=150) returns 1020
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0180 begin`);
      const actual: number = minutesUntilScheduled(15, 150);
      logInfo(`minutesUntilScheduled(hour=15, minute=150): actual=${actual}`);
      expect(actual).assertEqual(1020);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0180 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0181
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0181
     * @tc.desc      minutesUntilScheduled(hour=102, minute=192) returns -4242
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0181 begin`);
      const actual: number = minutesUntilScheduled(102, 192);
      logInfo(`minutesUntilScheduled(hour=102, minute=192): actual=${actual}`);
      expect(actual).assertEqual(-4242);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0181 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0182
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0182
     * @tc.desc      minutesUntilScheduled(hour=186, minute=156) returns -9246
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0182 begin`);
      const actual: number = minutesUntilScheduled(186, 156);
      logInfo(`minutesUntilScheduled(hour=186, minute=156): actual=${actual}`);
      expect(actual).assertEqual(-9246);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0182 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0183
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0183
     * @tc.desc      minutesUntilScheduled(hour=84, minute=-1) returns -2969
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0183 begin`);
      const actual: number = minutesUntilScheduled(84, -1);
      logInfo(`minutesUntilScheduled(hour=84, minute=-1): actual=${actual}`);
      expect(actual).assertEqual(-2969);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0183 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0184
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0184
     * @tc.desc      minutesUntilScheduled(hour=6, minute=15) returns 255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0184 begin`);
      const actual: number = minutesUntilScheduled(6, 15);
      logInfo(`minutesUntilScheduled(hour=6, minute=15): actual=${actual}`);
      expect(actual).assertEqual(255);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0184 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0185
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0185
     * @tc.desc      minutesUntilScheduled(hour=210, minute=114) returns -10644
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0185 begin`);
      const actual: number = minutesUntilScheduled(210, 114);
      logInfo(`minutesUntilScheduled(hour=210, minute=114): actual=${actual}`);
      expect(actual).assertEqual(-10644);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0185 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0186
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0186
     * @tc.desc      minutesUntilScheduled(hour=31, minute=174) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0186 begin`);
      const actual: number = minutesUntilScheduled(31, 174);
      logInfo(`minutesUntilScheduled(hour=31, minute=174): actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0186 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0187
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0187
     * @tc.desc      minutesUntilScheduled(hour=20, minute=126) returns 744
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0187 begin`);
      const actual: number = minutesUntilScheduled(20, 126);
      logInfo(`minutesUntilScheduled(hour=20, minute=126): actual=${actual}`);
      expect(actual).assertEqual(744);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0187 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0188
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0188
     * @tc.desc      minutesUntilScheduled(hour=198, minute=30) returns -9840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0188 begin`);
      const actual: number = minutesUntilScheduled(198, 30);
      logInfo(`minutesUntilScheduled(hour=198, minute=30): actual=${actual}`);
      expect(actual).assertEqual(-9840);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0188 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0189
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0189
     * @tc.desc      minutesUntilScheduled(hour=156, minute=79.23) returns -7369.23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0189 begin`);
      const actual: number = minutesUntilScheduled(156, 79.23);
      logInfo(`minutesUntilScheduled(hour=156, minute=79...: actual=${actual}`);
      expect(actual).assertClose(-7369.23, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0189 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0190
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0190
     * @tc.desc      minutesUntilScheduled(hour=180, minute=180) returns -8910
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0190 begin`);
      const actual: number = minutesUntilScheduled(180, 180);
      logInfo(`minutesUntilScheduled(hour=180, minute=180): actual=${actual}`);
      expect(actual).assertEqual(-8910);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0190 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0191
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0191
     * @tc.desc      minutesUntilScheduled(hour=52, minute=205) returns -1255
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0191 begin`);
      const actual: number = minutesUntilScheduled(52, 205);
      logInfo(`minutesUntilScheduled(hour=52, minute=205): actual=${actual}`);
      expect(actual).assertEqual(-1255);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0191 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0192
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0192
     * @tc.desc      minutesUntilScheduled(hour=66, minute=24) returns -1914
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0192 begin`);
      const actual: number = minutesUntilScheduled(66, 24);
      logInfo(`minutesUntilScheduled(hour=66, minute=24): actual=${actual}`);
      expect(actual).assertEqual(-1914);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0192 end`);
    });
  });
}
