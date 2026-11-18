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
import { DayInfo } from '../../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CalendarViewSwitch]';
const BUNDLE: string = 'CalendarViewSwitch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new DayInfo (39 cases). */
export default function dayInfoCtor2Test(): void {
  describe('DayInfoCtor2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0071
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0071
     * @tc.desc      new DayInfo(2000, 2, 15, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0071 begin`);
      const subject: DayInfo = new DayInfo(2000, 2, 15, 1);
      logInfo(`new DayInfo(2000, 2, 15, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2000);
      logInfo(`new DayInfo(2000, 2, 15, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(2000, 2, 15, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(2000, 2, 15, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0072
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0072
     * @tc.desc      new DayInfo(2024, 3, 31, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0072 begin`);
      const subject: DayInfo = new DayInfo(2024, 3, 31, 1);
      logInfo(`new DayInfo(2024, 3, 31, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 3, 31, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(2024, 3, 31, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(2024, 3, 31, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0073
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0073
     * @tc.desc      new DayInfo(2024, 2, 1, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0073 begin`);
      const subject: DayInfo = new DayInfo(2024, 2, 1, 2);
      logInfo(`new DayInfo(2024, 2, 1, 2): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 2, 1, 2): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(2024, 2, 1, 2): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 2, 1, 2): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(2);
      logInfo(`${BUNDLE}DayInfoCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0074
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0074
     * @tc.desc      new DayInfo(2025, 0, 0, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0074 begin`);
      const subject: DayInfo = new DayInfo(2025, 0, 0, 2);
      logInfo(`new DayInfo(2025, 0, 0, 2): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 0, 0, 2): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(2025, 0, 0, 2): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(2025, 0, 0, 2): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(2);
      logInfo(`${BUNDLE}DayInfoCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0075
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0075
     * @tc.desc      new DayInfo(1900, 1, 1, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0075 begin`);
      const subject: DayInfo = new DayInfo(1900, 1, 1, 7);
      logInfo(`new DayInfo(1900, 1, 1, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, 1, 1, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(1900, 1, 1, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(1900, 1, 1, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0076
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0076
     * @tc.desc      new DayInfo(0, 13, 29, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0076 begin`);
      const subject: DayInfo = new DayInfo(0, 13, 29, 1);
      logInfo(`new DayInfo(0, 13, 29, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(0);
      logInfo(`new DayInfo(0, 13, 29, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(0, 13, 29, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(29);
      logInfo(`new DayInfo(0, 13, 29, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0077
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0077
     * @tc.desc      new DayInfo(1970, 3, 0, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0077 begin`);
      const subject: DayInfo = new DayInfo(1970, 3, 0, 0);
      logInfo(`new DayInfo(1970, 3, 0, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 3, 0, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(1970, 3, 0, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(1970, 3, 0, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0078
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0078
     * @tc.desc      new DayInfo(1970, 1, -1, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0078 begin`);
      const subject: DayInfo = new DayInfo(1970, 1, -1, 7);
      logInfo(`new DayInfo(1970, 1, -1, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 1, -1, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(1970, 1, -1, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(-1);
      logInfo(`new DayInfo(1970, 1, -1, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0079
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0079
     * @tc.desc      new DayInfo(1970, -1, 28, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0079 begin`);
      const subject: DayInfo = new DayInfo(1970, -1, 28, 2);
      logInfo(`new DayInfo(1970, -1, 28, 2): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, -1, 28, 2): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(-1);
      logInfo(`new DayInfo(1970, -1, 28, 2): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(1970, -1, 28, 2): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(2);
      logInfo(`${BUNDLE}DayInfoCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0080
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0080
     * @tc.desc      new DayInfo(2000, 13, -1, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0080 begin`);
      const subject: DayInfo = new DayInfo(2000, 13, -1, 2);
      logInfo(`new DayInfo(2000, 13, -1, 2): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2000);
      logInfo(`new DayInfo(2000, 13, -1, 2): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(2000, 13, -1, 2): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(-1);
      logInfo(`new DayInfo(2000, 13, -1, 2): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(2);
      logInfo(`${BUNDLE}DayInfoCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0081
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0081
     * @tc.desc      new DayInfo(1970, 6, -1, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0081 begin`);
      const subject: DayInfo = new DayInfo(1970, 6, -1, 2);
      logInfo(`new DayInfo(1970, 6, -1, 2): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 6, -1, 2): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(6);
      logInfo(`new DayInfo(1970, 6, -1, 2): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(-1);
      logInfo(`new DayInfo(1970, 6, -1, 2): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(2);
      logInfo(`${BUNDLE}DayInfoCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0082
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0082
     * @tc.desc      new DayInfo(2000, 3, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0082 begin`);
      const subject: DayInfo = new DayInfo(2000, 3, 1, 0);
      logInfo(`new DayInfo(2000, 3, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2000);
      logInfo(`new DayInfo(2000, 3, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(2000, 3, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2000, 3, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0083
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0083
     * @tc.desc      new DayInfo(1970, 12, 30, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0083 begin`);
      const subject: DayInfo = new DayInfo(1970, 12, 30, -1);
      logInfo(`new DayInfo(1970, 12, 30, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 12, 30, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(1970, 12, 30, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(30);
      logInfo(`new DayInfo(1970, 12, 30, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0084
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0084
     * @tc.desc      new DayInfo(2024, 12, 15, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0084 begin`);
      const subject: DayInfo = new DayInfo(2024, 12, 15, -1);
      logInfo(`new DayInfo(2024, 12, 15, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 12, 15, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(2024, 12, 15, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(2024, 12, 15, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0085
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0085
     * @tc.desc      new DayInfo(2000, 3, -1, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0085 begin`);
      const subject: DayInfo = new DayInfo(2000, 3, -1, 2);
      logInfo(`new DayInfo(2000, 3, -1, 2): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2000);
      logInfo(`new DayInfo(2000, 3, -1, 2): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(2000, 3, -1, 2): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(-1);
      logInfo(`new DayInfo(2000, 3, -1, 2): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(2);
      logInfo(`${BUNDLE}DayInfoCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0086
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0086
     * @tc.desc      new DayInfo(0, 0, 1, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0086 begin`);
      const subject: DayInfo = new DayInfo(0, 0, 1, 3);
      logInfo(`new DayInfo(0, 0, 1, 3): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(0);
      logInfo(`new DayInfo(0, 0, 1, 3): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(0, 0, 1, 3): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(0, 0, 1, 3): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(3);
      logInfo(`${BUNDLE}DayInfoCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0087
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0087
     * @tc.desc      new DayInfo(2025, 1, 31, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0087 begin`);
      const subject: DayInfo = new DayInfo(2025, 1, 31, -1);
      logInfo(`new DayInfo(2025, 1, 31, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 1, 31, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2025, 1, 31, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(2025, 1, 31, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0088
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0088
     * @tc.desc      new DayInfo(2025, 13, 31, 6) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0088 begin`);
      const subject: DayInfo = new DayInfo(2025, 13, 31, 6);
      logInfo(`new DayInfo(2025, 13, 31, 6): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 13, 31, 6): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(2025, 13, 31, 6): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(2025, 13, 31, 6): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(6);
      logInfo(`${BUNDLE}DayInfoCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0089
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0089
     * @tc.desc      new DayInfo(1970, 13, 0, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0089 begin`);
      const subject: DayInfo = new DayInfo(1970, 13, 0, 0);
      logInfo(`new DayInfo(1970, 13, 0, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 13, 0, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(1970, 13, 0, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(1970, 13, 0, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0090
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0090
     * @tc.desc      new DayInfo(2025, 12, 28, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0090 begin`);
      const subject: DayInfo = new DayInfo(2025, 12, 28, -1);
      logInfo(`new DayInfo(2025, 12, 28, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 12, 28, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(2025, 12, 28, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(2025, 12, 28, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0091
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0091
     * @tc.desc      new DayInfo(2023, 2, 29, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0091 begin`);
      const subject: DayInfo = new DayInfo(2023, 2, 29, 1);
      logInfo(`new DayInfo(2023, 2, 29, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2023);
      logInfo(`new DayInfo(2023, 2, 29, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(2023, 2, 29, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(29);
      logInfo(`new DayInfo(2023, 2, 29, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0092
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0092
     * @tc.desc      new DayInfo(2100, 1, 15, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0092 begin`);
      const subject: DayInfo = new DayInfo(2100, 1, 15, 1);
      logInfo(`new DayInfo(2100, 1, 15, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2100);
      logInfo(`new DayInfo(2100, 1, 15, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2100, 1, 15, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(2100, 1, 15, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0093
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0093
     * @tc.desc      new DayInfo(1970, 0, 31, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0093 begin`);
      const subject: DayInfo = new DayInfo(1970, 0, 31, 0);
      logInfo(`new DayInfo(1970, 0, 31, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 0, 31, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(1970, 0, 31, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(1970, 0, 31, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0094
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0094
     * @tc.desc      new DayInfo(2025, 1, 29, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0094 begin`);
      const subject: DayInfo = new DayInfo(2025, 1, 29, 0);
      logInfo(`new DayInfo(2025, 1, 29, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 1, 29, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2025, 1, 29, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(29);
      logInfo(`new DayInfo(2025, 1, 29, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0095
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0095
     * @tc.desc      new DayInfo(0, 13, 15, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0095 begin`);
      const subject: DayInfo = new DayInfo(0, 13, 15, -1);
      logInfo(`new DayInfo(0, 13, 15, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(0);
      logInfo(`new DayInfo(0, 13, 15, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(0, 13, 15, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(0, 13, 15, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0096
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0096
     * @tc.desc      new DayInfo(1970, 1, 0, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0096 begin`);
      const subject: DayInfo = new DayInfo(1970, 1, 0, 10);
      logInfo(`new DayInfo(1970, 1, 0, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 1, 0, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(1970, 1, 0, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(1970, 1, 0, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0097
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0097
     * @tc.desc      new DayInfo(1970, 1, 15, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0097 begin`);
      const subject: DayInfo = new DayInfo(1970, 1, 15, 1);
      logInfo(`new DayInfo(1970, 1, 15, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 1, 15, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(1970, 1, 15, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(1970, 1, 15, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0098
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0098
     * @tc.desc      new DayInfo(2000, 0, 31, 6) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0098 begin`);
      const subject: DayInfo = new DayInfo(2000, 0, 31, 6);
      logInfo(`new DayInfo(2000, 0, 31, 6): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2000);
      logInfo(`new DayInfo(2000, 0, 31, 6): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(2000, 0, 31, 6): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(2000, 0, 31, 6): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(6);
      logInfo(`${BUNDLE}DayInfoCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0099
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0099
     * @tc.desc      new DayInfo(2024, 2, 15, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0099 begin`);
      const subject: DayInfo = new DayInfo(2024, 2, 15, 10);
      logInfo(`new DayInfo(2024, 2, 15, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 2, 15, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(2024, 2, 15, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(2024, 2, 15, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0100
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0100
     * @tc.desc      new DayInfo(1970, 1, 15, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0100 begin`);
      const subject: DayInfo = new DayInfo(1970, 1, 15, 7);
      logInfo(`new DayInfo(1970, 1, 15, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 1, 15, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(1970, 1, 15, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(1970, 1, 15, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0101
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0101
     * @tc.desc      new DayInfo(2000, 2, 0, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0101 begin`);
      const subject: DayInfo = new DayInfo(2000, 2, 0, 0);
      logInfo(`new DayInfo(2000, 2, 0, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2000);
      logInfo(`new DayInfo(2000, 2, 0, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(2000, 2, 0, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(2000, 2, 0, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0102
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0102
     * @tc.desc      new DayInfo(2100, -1, 31, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0102 begin`);
      const subject: DayInfo = new DayInfo(2100, -1, 31, 10);
      logInfo(`new DayInfo(2100, -1, 31, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2100);
      logInfo(`new DayInfo(2100, -1, 31, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(-1);
      logInfo(`new DayInfo(2100, -1, 31, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(2100, -1, 31, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0103
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0103
     * @tc.desc      new DayInfo(2024, -1, 30, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0103 begin`);
      const subject: DayInfo = new DayInfo(2024, -1, 30, 1);
      logInfo(`new DayInfo(2024, -1, 30, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, -1, 30, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(-1);
      logInfo(`new DayInfo(2024, -1, 30, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(30);
      logInfo(`new DayInfo(2024, -1, 30, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0104
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0104
     * @tc.desc      new DayInfo(2025, 6, -1, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0104 begin`);
      const subject: DayInfo = new DayInfo(2025, 6, -1, 7);
      logInfo(`new DayInfo(2025, 6, -1, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 6, -1, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(6);
      logInfo(`new DayInfo(2025, 6, -1, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(-1);
      logInfo(`new DayInfo(2025, 6, -1, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0105
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0105
     * @tc.desc      new DayInfo(0, 13, 31, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0105 begin`);
      const subject: DayInfo = new DayInfo(0, 13, 31, 0);
      logInfo(`new DayInfo(0, 13, 31, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(0);
      logInfo(`new DayInfo(0, 13, 31, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(0, 13, 31, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(0, 13, 31, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0106
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0106
     * @tc.desc      new DayInfo(1970, 1, 0, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0106 begin`);
      const subject: DayInfo = new DayInfo(1970, 1, 0, 7);
      logInfo(`new DayInfo(1970, 1, 0, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 1, 0, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(1970, 1, 0, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(1970, 1, 0, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0107
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0107
     * @tc.desc      new DayInfo(1900, 1, 15, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0107 begin`);
      const subject: DayInfo = new DayInfo(1900, 1, 15, 10);
      logInfo(`new DayInfo(1900, 1, 15, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, 1, 15, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(1900, 1, 15, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(1900, 1, 15, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0108
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0108
     * @tc.desc      new DayInfo(2024, 12, 15, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0108 begin`);
      const subject: DayInfo = new DayInfo(2024, 12, 15, 7);
      logInfo(`new DayInfo(2024, 12, 15, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 12, 15, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(2024, 12, 15, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(2024, 12, 15, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0109
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0109
     * @tc.desc      new DayInfo(1900, 0, 1, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0109 begin`);
      const subject: DayInfo = new DayInfo(1900, 0, 1, -1);
      logInfo(`new DayInfo(1900, 0, 1, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, 0, 1, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(1900, 0, 1, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(1900, 0, 1, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0109 end`);
    });
  });
}
