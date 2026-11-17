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
export default function minutesUntilScheduledTest(): void {
  describe('MinutesUntilScheduledTest', (): void => {
    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0001
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0001
     * @tc.desc      minutesUntilScheduled(hour=0, minute=0) returns 630
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_MinutesUntilScheduled_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0001 begin`);
      const actual: number = minutesUntilScheduled(0, 0);
      logInfo(`minutesUntilScheduled(hour=0, minute=0): actual=${actual}`);
      expect(actual).assertEqual(630);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0001 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0002
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0002
     * @tc.desc      minutesUntilScheduled(hour=12, minute=0) returns 1350
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('RequestAddForm_MinutesUntilScheduled_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0002 begin`);
      const actual: number = minutesUntilScheduled(12, 0);
      logInfo(`minutesUntilScheduled(hour=12, minute=0): actual=${actual}`);
      expect(actual).assertEqual(1350);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0002 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0003
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0003
     * @tc.desc      minutesUntilScheduled(hour=10, minute=0) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0003 begin`);
      const actual: number = minutesUntilScheduled(10, 0);
      logInfo(`minutesUntilScheduled(hour=10, minute=0): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0003 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0004
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0004
     * @tc.desc      minutesUntilScheduled(hour=9, minute=0) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0004 begin`);
      const actual: number = minutesUntilScheduled(9, 0);
      logInfo(`minutesUntilScheduled(hour=9, minute=0): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0004 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0005
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0005
     * @tc.desc      minutesUntilScheduled(hour=11, minute=0) returns 1410
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0005 begin`);
      const actual: number = minutesUntilScheduled(11, 0);
      logInfo(`minutesUntilScheduled(hour=11, minute=0): actual=${actual}`);
      expect(actual).assertEqual(1410);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0005 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0006
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0006
     * @tc.desc      minutesUntilScheduled(hour=20, minute=0) returns 870
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0006 begin`);
      const actual: number = minutesUntilScheduled(20, 0);
      logInfo(`minutesUntilScheduled(hour=20, minute=0): actual=${actual}`);
      expect(actual).assertEqual(870);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0006 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0007
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0007
     * @tc.desc      minutesUntilScheduled(hour=5, minute=0) returns 330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0007 begin`);
      const actual: number = minutesUntilScheduled(5, 0);
      logInfo(`minutesUntilScheduled(hour=5, minute=0): actual=${actual}`);
      expect(actual).assertEqual(330);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0007 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0008
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0008
     * @tc.desc      minutesUntilScheduled(hour=60, minute=0) returns -1530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0008 begin`);
      const actual: number = minutesUntilScheduled(60, 0);
      logInfo(`minutesUntilScheduled(hour=60, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-1530);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0008 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0009
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0009
     * @tc.desc      minutesUntilScheduled(hour=59, minute=0) returns -1470
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0009 begin`);
      const actual: number = minutesUntilScheduled(59, 0);
      logInfo(`minutesUntilScheduled(hour=59, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-1470);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0009 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0010
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0010
     * @tc.desc      minutesUntilScheduled(hour=61, minute=0) returns -1590
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0010 begin`);
      const actual: number = minutesUntilScheduled(61, 0);
      logInfo(`minutesUntilScheduled(hour=61, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-1590);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0010 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0011
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0011
     * @tc.desc      minutesUntilScheduled(hour=120, minute=0) returns -5130
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0011 begin`);
      const actual: number = minutesUntilScheduled(120, 0);
      logInfo(`minutesUntilScheduled(hour=120, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-5130);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0011 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0012
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0012
     * @tc.desc      minutesUntilScheduled(hour=30, minute=0) returns 270
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0012 begin`);
      const actual: number = minutesUntilScheduled(30, 0);
      logInfo(`minutesUntilScheduled(hour=30, minute=0): actual=${actual}`);
      expect(actual).assertEqual(270);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0012 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0013
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0013
     * @tc.desc      minutesUntilScheduled(hour=31, minute=0) returns 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0013 begin`);
      const actual: number = minutesUntilScheduled(31, 0);
      logInfo(`minutesUntilScheduled(hour=31, minute=0): actual=${actual}`);
      expect(actual).assertEqual(210);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0013 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0014
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0014
     * @tc.desc      minutesUntilScheduled(hour=15, minute=0) returns 1170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0014 begin`);
      const actual: number = minutesUntilScheduled(15, 0);
      logInfo(`minutesUntilScheduled(hour=15, minute=0): actual=${actual}`);
      expect(actual).assertEqual(1170);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0014 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0015
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0015
     * @tc.desc      minutesUntilScheduled(hour=-1, minute=0) returns 690
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0015 begin`);
      const actual: number = minutesUntilScheduled(-1, 0);
      logInfo(`minutesUntilScheduled(hour=-1, minute=0): actual=${actual}`);
      expect(actual).assertEqual(690);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0015 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0016
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0016
     * @tc.desc      minutesUntilScheduled(hour=1, minute=0) returns 570
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0016 begin`);
      const actual: number = minutesUntilScheduled(1, 0);
      logInfo(`minutesUntilScheduled(hour=1, minute=0): actual=${actual}`);
      expect(actual).assertEqual(570);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0016 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0017
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0017
     * @tc.desc      minutesUntilScheduled(hour=48, minute=0) returns -810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0017 begin`);
      const actual: number = minutesUntilScheduled(48, 0);
      logInfo(`minutesUntilScheduled(hour=48, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-810);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0017 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0018
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0018
     * @tc.desc      minutesUntilScheduled(hour=2, minute=0) returns 510
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0018 begin`);
      const actual: number = minutesUntilScheduled(2, 0);
      logInfo(`minutesUntilScheduled(hour=2, minute=0): actual=${actual}`);
      expect(actual).assertEqual(510);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0018 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0019
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0019
     * @tc.desc      minutesUntilScheduled(hour=3, minute=0) returns 450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0019 begin`);
      const actual: number = minutesUntilScheduled(3, 0);
      logInfo(`minutesUntilScheduled(hour=3, minute=0): actual=${actual}`);
      expect(actual).assertEqual(450);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0019 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0020
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0020
     * @tc.desc      minutesUntilScheduled(hour=100, minute=0) returns -3930
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0020 begin`);
      const actual: number = minutesUntilScheduled(100, 0);
      logInfo(`minutesUntilScheduled(hour=100, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-3930);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0020 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0021
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0021
     * @tc.desc      minutesUntilScheduled(hour=18, minute=0) returns 990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0021 begin`);
      const actual: number = minutesUntilScheduled(18, 0);
      logInfo(`minutesUntilScheduled(hour=18, minute=0): actual=${actual}`);
      expect(actual).assertEqual(990);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0021 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0022
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0022
     * @tc.desc      minutesUntilScheduled(hour=36, minute=0) returns -90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0022 begin`);
      const actual: number = minutesUntilScheduled(36, 0);
      logInfo(`minutesUntilScheduled(hour=36, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-90);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0022 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0023
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0023
     * @tc.desc      minutesUntilScheduled(hour=42, minute=0) returns -450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0023 begin`);
      const actual: number = minutesUntilScheduled(42, 0);
      logInfo(`minutesUntilScheduled(hour=42, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-450);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0023 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0024
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0024
     * @tc.desc      minutesUntilScheduled(hour=54, minute=0) returns -1170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0024 begin`);
      const actual: number = minutesUntilScheduled(54, 0);
      logInfo(`minutesUntilScheduled(hour=54, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-1170);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0024 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0025
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0025
     * @tc.desc      minutesUntilScheduled(hour=66, minute=0) returns -1890
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0025 begin`);
      const actual: number = minutesUntilScheduled(66, 0);
      logInfo(`minutesUntilScheduled(hour=66, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-1890);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0025 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0026
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0026
     * @tc.desc      minutesUntilScheduled(hour=72, minute=0) returns -2250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0026 begin`);
      const actual: number = minutesUntilScheduled(72, 0);
      logInfo(`minutesUntilScheduled(hour=72, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-2250);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0026 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0027
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0027
     * @tc.desc      minutesUntilScheduled(hour=78, minute=0) returns -2610
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0027 begin`);
      const actual: number = minutesUntilScheduled(78, 0);
      logInfo(`minutesUntilScheduled(hour=78, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-2610);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0027 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0028
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0028
     * @tc.desc      minutesUntilScheduled(hour=84, minute=0) returns -2970
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0028 begin`);
      const actual: number = minutesUntilScheduled(84, 0);
      logInfo(`minutesUntilScheduled(hour=84, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-2970);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0028 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0029
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0029
     * @tc.desc      minutesUntilScheduled(hour=90, minute=0) returns -3330
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0029 begin`);
      const actual: number = minutesUntilScheduled(90, 0);
      logInfo(`minutesUntilScheduled(hour=90, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-3330);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0029 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0030
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0030
     * @tc.desc      minutesUntilScheduled(hour=96, minute=0) returns -3690
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0030 begin`);
      const actual: number = minutesUntilScheduled(96, 0);
      logInfo(`minutesUntilScheduled(hour=96, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-3690);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0030 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0031
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0031
     * @tc.desc      minutesUntilScheduled(hour=102, minute=0) returns -4050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0031 begin`);
      const actual: number = minutesUntilScheduled(102, 0);
      logInfo(`minutesUntilScheduled(hour=102, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-4050);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0031 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0032
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0032
     * @tc.desc      minutesUntilScheduled(hour=108, minute=0) returns -4410
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0032 begin`);
      const actual: number = minutesUntilScheduled(108, 0);
      logInfo(`minutesUntilScheduled(hour=108, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-4410);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0032 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0033
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0033
     * @tc.desc      minutesUntilScheduled(hour=114, minute=0) returns -4770
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0033 begin`);
      const actual: number = minutesUntilScheduled(114, 0);
      logInfo(`minutesUntilScheduled(hour=114, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-4770);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0033 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0034
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0034
     * @tc.desc      minutesUntilScheduled(hour=126, minute=0) returns -5490
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0034 begin`);
      const actual: number = minutesUntilScheduled(126, 0);
      logInfo(`minutesUntilScheduled(hour=126, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-5490);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0034 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0035
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0035
     * @tc.desc      minutesUntilScheduled(hour=132, minute=0) returns -5850
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0035 begin`);
      const actual: number = minutesUntilScheduled(132, 0);
      logInfo(`minutesUntilScheduled(hour=132, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-5850);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0035 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0036
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0036
     * @tc.desc      minutesUntilScheduled(hour=138, minute=0) returns -6210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0036 begin`);
      const actual: number = minutesUntilScheduled(138, 0);
      logInfo(`minutesUntilScheduled(hour=138, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-6210);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0036 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0037
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0037
     * @tc.desc      minutesUntilScheduled(hour=144, minute=0) returns -6570
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0037 begin`);
      const actual: number = minutesUntilScheduled(144, 0);
      logInfo(`minutesUntilScheduled(hour=144, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-6570);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0037 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0038
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0038
     * @tc.desc      minutesUntilScheduled(hour=150, minute=0) returns -6930
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0038 begin`);
      const actual: number = minutesUntilScheduled(150, 0);
      logInfo(`minutesUntilScheduled(hour=150, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-6930);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0038 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0039
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0039
     * @tc.desc      minutesUntilScheduled(hour=156, minute=0) returns -7290
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0039 begin`);
      const actual: number = minutesUntilScheduled(156, 0);
      logInfo(`minutesUntilScheduled(hour=156, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-7290);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0039 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0040
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0040
     * @tc.desc      minutesUntilScheduled(hour=162, minute=0) returns -7650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0040 begin`);
      const actual: number = minutesUntilScheduled(162, 0);
      logInfo(`minutesUntilScheduled(hour=162, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-7650);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0040 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0041
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0041
     * @tc.desc      minutesUntilScheduled(hour=168, minute=0) returns -8010
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0041 begin`);
      const actual: number = minutesUntilScheduled(168, 0);
      logInfo(`minutesUntilScheduled(hour=168, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-8010);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0041 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0042
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0042
     * @tc.desc      minutesUntilScheduled(hour=174, minute=0) returns -8370
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0042 begin`);
      const actual: number = minutesUntilScheduled(174, 0);
      logInfo(`minutesUntilScheduled(hour=174, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-8370);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0042 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0043
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0043
     * @tc.desc      minutesUntilScheduled(hour=180, minute=0) returns -8730
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0043 begin`);
      const actual: number = minutesUntilScheduled(180, 0);
      logInfo(`minutesUntilScheduled(hour=180, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-8730);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0043 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0044
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0044
     * @tc.desc      minutesUntilScheduled(hour=186, minute=0) returns -9090
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0044 begin`);
      const actual: number = minutesUntilScheduled(186, 0);
      logInfo(`minutesUntilScheduled(hour=186, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-9090);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0044 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0045
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0045
     * @tc.desc      minutesUntilScheduled(hour=192, minute=0) returns -9450
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0045 begin`);
      const actual: number = minutesUntilScheduled(192, 0);
      logInfo(`minutesUntilScheduled(hour=192, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-9450);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0045 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0046
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0046
     * @tc.desc      minutesUntilScheduled(hour=198, minute=0) returns -9810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0046 begin`);
      const actual: number = minutesUntilScheduled(198, 0);
      logInfo(`minutesUntilScheduled(hour=198, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-9810);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0046 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0047
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0047
     * @tc.desc      minutesUntilScheduled(hour=204, minute=0) returns -10170
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0047 begin`);
      const actual: number = minutesUntilScheduled(204, 0);
      logInfo(`minutesUntilScheduled(hour=204, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-10170);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0047 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0048
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0048
     * @tc.desc      minutesUntilScheduled(hour=210, minute=0) returns -10530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0048 begin`);
      const actual: number = minutesUntilScheduled(210, 0);
      logInfo(`minutesUntilScheduled(hour=210, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-10530);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0048 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0049
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0049
     * @tc.desc      minutesUntilScheduled(hour=216, minute=0) returns -10890
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0049 begin`);
      const actual: number = minutesUntilScheduled(216, 0);
      logInfo(`minutesUntilScheduled(hour=216, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-10890);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0049 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0050
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0050
     * @tc.desc      minutesUntilScheduled(hour=-77, minute=0) returns 5250
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0050 begin`);
      const actual: number = minutesUntilScheduled(-77, 0);
      logInfo(`minutesUntilScheduled(hour=-77, minute=0): actual=${actual}`);
      expect(actual).assertEqual(5250);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0050 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0051
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0051
     * @tc.desc      minutesUntilScheduled(hour=5.49, minute=0) returns 300.59999999999997
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0051 begin`);
      const actual: number = minutesUntilScheduled(5.49, 0);
      logInfo(`minutesUntilScheduled(hour=5.49, minute=0): actual=${actual}`);
      expect(actual).assertClose(300.59999999999997, PRECISION);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0051 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0052
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0052
     * @tc.desc      minutesUntilScheduled(hour=52, minute=0) returns -1050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0052 begin`);
      const actual: number = minutesUntilScheduled(52, 0);
      logInfo(`minutesUntilScheduled(hour=52, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-1050);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0052 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0053
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0053
     * @tc.desc      minutesUntilScheduled(hour=101, minute=0) returns -3990
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0053 begin`);
      const actual: number = minutesUntilScheduled(101, 0);
      logInfo(`minutesUntilScheduled(hour=101, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-3990);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0053 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0054
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0054
     * @tc.desc      minutesUntilScheduled(hour=73, minute=0) returns -2310
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0054 begin`);
      const actual: number = minutesUntilScheduled(73, 0);
      logInfo(`minutesUntilScheduled(hour=73, minute=0): actual=${actual}`);
      expect(actual).assertEqual(-2310);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0054 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0055
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0055
     * @tc.desc      minutesUntilScheduled(hour=-3, minute=0) returns 810
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('RequestAddForm_MinutesUntilScheduled_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0055 begin`);
      const actual: number = minutesUntilScheduled(-3, 0);
      logInfo(`minutesUntilScheduled(hour=-3, minute=0): actual=${actual}`);
      expect(actual).assertEqual(810);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0055 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0056
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0056
     * @tc.desc      minutesUntilScheduled(hour=0, minute=30) returns 600
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0056 begin`);
      const actual: number = minutesUntilScheduled(0, 30);
      logInfo(`minutesUntilScheduled(hour=0, minute=30): actual=${actual}`);
      expect(actual).assertEqual(600);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0056 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0057
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0057
     * @tc.desc      minutesUntilScheduled(hour=0, minute=10) returns 620
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0057 begin`);
      const actual: number = minutesUntilScheduled(0, 10);
      logInfo(`minutesUntilScheduled(hour=0, minute=10): actual=${actual}`);
      expect(actual).assertEqual(620);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0057 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0058
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0058
     * @tc.desc      minutesUntilScheduled(hour=0, minute=9) returns 621
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0058 begin`);
      const actual: number = minutesUntilScheduled(0, 9);
      logInfo(`minutesUntilScheduled(hour=0, minute=9): actual=${actual}`);
      expect(actual).assertEqual(621);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0058 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0059
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0059
     * @tc.desc      minutesUntilScheduled(hour=0, minute=11) returns 619
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0059 begin`);
      const actual: number = minutesUntilScheduled(0, 11);
      logInfo(`minutesUntilScheduled(hour=0, minute=11): actual=${actual}`);
      expect(actual).assertEqual(619);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0059 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0060
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0060
     * @tc.desc      minutesUntilScheduled(hour=0, minute=20) returns 610
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0060 begin`);
      const actual: number = minutesUntilScheduled(0, 20);
      logInfo(`minutesUntilScheduled(hour=0, minute=20): actual=${actual}`);
      expect(actual).assertEqual(610);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0060 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0061
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0061
     * @tc.desc      minutesUntilScheduled(hour=0, minute=5) returns 625
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0061 begin`);
      const actual: number = minutesUntilScheduled(0, 5);
      logInfo(`minutesUntilScheduled(hour=0, minute=5): actual=${actual}`);
      expect(actual).assertEqual(625);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0061 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0062
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0062
     * @tc.desc      minutesUntilScheduled(hour=0, minute=59) returns 571
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0062 begin`);
      const actual: number = minutesUntilScheduled(0, 59);
      logInfo(`minutesUntilScheduled(hour=0, minute=59): actual=${actual}`);
      expect(actual).assertEqual(571);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0062 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0063
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0063
     * @tc.desc      minutesUntilScheduled(hour=0, minute=61) returns 569
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0063 begin`);
      const actual: number = minutesUntilScheduled(0, 61);
      logInfo(`minutesUntilScheduled(hour=0, minute=61): actual=${actual}`);
      expect(actual).assertEqual(569);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0063 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0064
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0064
     * @tc.desc      minutesUntilScheduled(hour=0, minute=29) returns 601
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0064 begin`);
      const actual: number = minutesUntilScheduled(0, 29);
      logInfo(`minutesUntilScheduled(hour=0, minute=29): actual=${actual}`);
      expect(actual).assertEqual(601);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0064 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0065
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0065
     * @tc.desc      minutesUntilScheduled(hour=0, minute=31) returns 599
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0065 begin`);
      const actual: number = minutesUntilScheduled(0, 31);
      logInfo(`minutesUntilScheduled(hour=0, minute=31): actual=${actual}`);
      expect(actual).assertEqual(599);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0065 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0066
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0066
     * @tc.desc      minutesUntilScheduled(hour=0, minute=15) returns 615
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0066 begin`);
      const actual: number = minutesUntilScheduled(0, 15);
      logInfo(`minutesUntilScheduled(hour=0, minute=15): actual=${actual}`);
      expect(actual).assertEqual(615);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0066 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0067
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0067
     * @tc.desc      minutesUntilScheduled(hour=0, minute=-1) returns 631
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0067 begin`);
      const actual: number = minutesUntilScheduled(0, -1);
      logInfo(`minutesUntilScheduled(hour=0, minute=-1): actual=${actual}`);
      expect(actual).assertEqual(631);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0067 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0068
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0068
     * @tc.desc      minutesUntilScheduled(hour=0, minute=1) returns 629
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0068 begin`);
      const actual: number = minutesUntilScheduled(0, 1);
      logInfo(`minutesUntilScheduled(hour=0, minute=1): actual=${actual}`);
      expect(actual).assertEqual(629);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0068 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0069
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0069
     * @tc.desc      minutesUntilScheduled(hour=0, minute=24) returns 606
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0069 begin`);
      const actual: number = minutesUntilScheduled(0, 24);
      logInfo(`minutesUntilScheduled(hour=0, minute=24): actual=${actual}`);
      expect(actual).assertEqual(606);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0069 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0070
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0070
     * @tc.desc      minutesUntilScheduled(hour=0, minute=23) returns 607
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0070 begin`);
      const actual: number = minutesUntilScheduled(0, 23);
      logInfo(`minutesUntilScheduled(hour=0, minute=23): actual=${actual}`);
      expect(actual).assertEqual(607);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0070 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0071
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0071
     * @tc.desc      minutesUntilScheduled(hour=0, minute=25) returns 605
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('RequestAddForm_MinutesUntilScheduled_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0071 begin`);
      const actual: number = minutesUntilScheduled(0, 25);
      logInfo(`minutesUntilScheduled(hour=0, minute=25): actual=${actual}`);
      expect(actual).assertEqual(605);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0071 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0072
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0072
     * @tc.desc      minutesUntilScheduled(hour=0, minute=48) returns 582
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0072 begin`);
      const actual: number = minutesUntilScheduled(0, 48);
      logInfo(`minutesUntilScheduled(hour=0, minute=48): actual=${actual}`);
      expect(actual).assertEqual(582);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0072 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0073
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0073
     * @tc.desc      minutesUntilScheduled(hour=0, minute=12) returns 618
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0073 begin`);
      const actual: number = minutesUntilScheduled(0, 12);
      logInfo(`minutesUntilScheduled(hour=0, minute=12): actual=${actual}`);
      expect(actual).assertEqual(618);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0073 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0074
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0074
     * @tc.desc      minutesUntilScheduled(hour=0, minute=2) returns 628
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0074 begin`);
      const actual: number = minutesUntilScheduled(0, 2);
      logInfo(`minutesUntilScheduled(hour=0, minute=2): actual=${actual}`);
      expect(actual).assertEqual(628);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0074 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0075
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0075
     * @tc.desc      minutesUntilScheduled(hour=0, minute=3) returns 627
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0075 begin`);
      const actual: number = minutesUntilScheduled(0, 3);
      logInfo(`minutesUntilScheduled(hour=0, minute=3): actual=${actual}`);
      expect(actual).assertEqual(627);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0075 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0076
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0076
     * @tc.desc      minutesUntilScheduled(hour=0, minute=100) returns 530
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0076 begin`);
      const actual: number = minutesUntilScheduled(0, 100);
      logInfo(`minutesUntilScheduled(hour=0, minute=100): actual=${actual}`);
      expect(actual).assertEqual(530);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0076 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0077
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0077
     * @tc.desc      minutesUntilScheduled(hour=0, minute=6) returns 624
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0077 begin`);
      const actual: number = minutesUntilScheduled(0, 6);
      logInfo(`minutesUntilScheduled(hour=0, minute=6): actual=${actual}`);
      expect(actual).assertEqual(624);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0077 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0078
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0078
     * @tc.desc      minutesUntilScheduled(hour=0, minute=18) returns 612
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0078 begin`);
      const actual: number = minutesUntilScheduled(0, 18);
      logInfo(`minutesUntilScheduled(hour=0, minute=18): actual=${actual}`);
      expect(actual).assertEqual(612);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0078 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0079
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0079
     * @tc.desc      minutesUntilScheduled(hour=0, minute=36) returns 594
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0079 begin`);
      const actual: number = minutesUntilScheduled(0, 36);
      logInfo(`minutesUntilScheduled(hour=0, minute=36): actual=${actual}`);
      expect(actual).assertEqual(594);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0079 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0080
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0080
     * @tc.desc      minutesUntilScheduled(hour=0, minute=42) returns 588
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0080 begin`);
      const actual: number = minutesUntilScheduled(0, 42);
      logInfo(`minutesUntilScheduled(hour=0, minute=42): actual=${actual}`);
      expect(actual).assertEqual(588);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0080 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0081
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0081
     * @tc.desc      minutesUntilScheduled(hour=0, minute=54) returns 576
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0081 begin`);
      const actual: number = minutesUntilScheduled(0, 54);
      logInfo(`minutesUntilScheduled(hour=0, minute=54): actual=${actual}`);
      expect(actual).assertEqual(576);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0081 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0082
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0082
     * @tc.desc      minutesUntilScheduled(hour=0, minute=66) returns 564
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0082 begin`);
      const actual: number = minutesUntilScheduled(0, 66);
      logInfo(`minutesUntilScheduled(hour=0, minute=66): actual=${actual}`);
      expect(actual).assertEqual(564);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0082 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0083
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0083
     * @tc.desc      minutesUntilScheduled(hour=0, minute=72) returns 558
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0083 begin`);
      const actual: number = minutesUntilScheduled(0, 72);
      logInfo(`minutesUntilScheduled(hour=0, minute=72): actual=${actual}`);
      expect(actual).assertEqual(558);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0083 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0084
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0084
     * @tc.desc      minutesUntilScheduled(hour=0, minute=78) returns 552
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0084 begin`);
      const actual: number = minutesUntilScheduled(0, 78);
      logInfo(`minutesUntilScheduled(hour=0, minute=78): actual=${actual}`);
      expect(actual).assertEqual(552);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0084 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0085
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0085
     * @tc.desc      minutesUntilScheduled(hour=0, minute=84) returns 546
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0085 begin`);
      const actual: number = minutesUntilScheduled(0, 84);
      logInfo(`minutesUntilScheduled(hour=0, minute=84): actual=${actual}`);
      expect(actual).assertEqual(546);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0085 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0086
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0086
     * @tc.desc      minutesUntilScheduled(hour=0, minute=90) returns 540
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0086 begin`);
      const actual: number = minutesUntilScheduled(0, 90);
      logInfo(`minutesUntilScheduled(hour=0, minute=90): actual=${actual}`);
      expect(actual).assertEqual(540);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0086 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0087
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0087
     * @tc.desc      minutesUntilScheduled(hour=0, minute=96) returns 534
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0087 begin`);
      const actual: number = minutesUntilScheduled(0, 96);
      logInfo(`minutesUntilScheduled(hour=0, minute=96): actual=${actual}`);
      expect(actual).assertEqual(534);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0087 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0088
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0088
     * @tc.desc      minutesUntilScheduled(hour=0, minute=102) returns 528
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0088 begin`);
      const actual: number = minutesUntilScheduled(0, 102);
      logInfo(`minutesUntilScheduled(hour=0, minute=102): actual=${actual}`);
      expect(actual).assertEqual(528);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0088 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0089
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0089
     * @tc.desc      minutesUntilScheduled(hour=0, minute=108) returns 522
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0089 begin`);
      const actual: number = minutesUntilScheduled(0, 108);
      logInfo(`minutesUntilScheduled(hour=0, minute=108): actual=${actual}`);
      expect(actual).assertEqual(522);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0089 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0090
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0090
     * @tc.desc      minutesUntilScheduled(hour=0, minute=114) returns 516
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0090 begin`);
      const actual: number = minutesUntilScheduled(0, 114);
      logInfo(`minutesUntilScheduled(hour=0, minute=114): actual=${actual}`);
      expect(actual).assertEqual(516);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0090 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0091
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0091
     * @tc.desc      minutesUntilScheduled(hour=0, minute=126) returns 504
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0091 begin`);
      const actual: number = minutesUntilScheduled(0, 126);
      logInfo(`minutesUntilScheduled(hour=0, minute=126): actual=${actual}`);
      expect(actual).assertEqual(504);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0091 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0092
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0092
     * @tc.desc      minutesUntilScheduled(hour=0, minute=132) returns 498
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0092 begin`);
      const actual: number = minutesUntilScheduled(0, 132);
      logInfo(`minutesUntilScheduled(hour=0, minute=132): actual=${actual}`);
      expect(actual).assertEqual(498);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0092 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0093
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0093
     * @tc.desc      minutesUntilScheduled(hour=0, minute=138) returns 492
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0093 begin`);
      const actual: number = minutesUntilScheduled(0, 138);
      logInfo(`minutesUntilScheduled(hour=0, minute=138): actual=${actual}`);
      expect(actual).assertEqual(492);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0093 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0094
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0094
     * @tc.desc      minutesUntilScheduled(hour=0, minute=144) returns 486
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0094 begin`);
      const actual: number = minutesUntilScheduled(0, 144);
      logInfo(`minutesUntilScheduled(hour=0, minute=144): actual=${actual}`);
      expect(actual).assertEqual(486);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0094 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0095
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0095
     * @tc.desc      minutesUntilScheduled(hour=0, minute=150) returns 480
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0095 begin`);
      const actual: number = minutesUntilScheduled(0, 150);
      logInfo(`minutesUntilScheduled(hour=0, minute=150): actual=${actual}`);
      expect(actual).assertEqual(480);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0095 end`);
    });

    /**
     * @tc.number    SUB_REQUESTADDFORM_MINUTES_UNTIL_SCHEDULED_0096
     * @tc.name      RequestAddForm_MinutesUntilScheduled_0096
     * @tc.desc      minutesUntilScheduled(hour=0, minute=156) returns 474
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('RequestAddForm_MinutesUntilScheduled_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}MinutesUntilScheduled_0096 begin`);
      const actual: number = minutesUntilScheduled(0, 156);
      logInfo(`minutesUntilScheduled(hour=0, minute=156): actual=${actual}`);
      expect(actual).assertEqual(474);
      logInfo(`${BUNDLE}MinutesUntilScheduled_0096 end`);
    });
  });
}
