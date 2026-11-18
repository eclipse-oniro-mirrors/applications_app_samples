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

/** Logic checks for new DayInfo (70 cases). */
export default function dayInfoCtorTest(): void {
  describe('DayInfoCtorTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0001
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0001
     * @tc.desc      new DayInfo(2024, 1, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_DayInfoCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0001 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 1, 0);
      logInfo(`new DayInfo(2024, 1, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0002
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0002
     * @tc.desc      new DayInfo(2023, 1, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_DayInfoCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0002 begin`);
      const subject: DayInfo = new DayInfo(2023, 1, 1, 0);
      logInfo(`new DayInfo(2023, 1, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2023);
      logInfo(`new DayInfo(2023, 1, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2023, 1, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2023, 1, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0003
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0003
     * @tc.desc      new DayInfo(2000, 1, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0003 begin`);
      const subject: DayInfo = new DayInfo(2000, 1, 1, 0);
      logInfo(`new DayInfo(2000, 1, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2000);
      logInfo(`new DayInfo(2000, 1, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2000, 1, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2000, 1, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0004
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0004
     * @tc.desc      new DayInfo(1900, 1, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0004 begin`);
      const subject: DayInfo = new DayInfo(1900, 1, 1, 0);
      logInfo(`new DayInfo(1900, 1, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, 1, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(1900, 1, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(1900, 1, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0005
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0005
     * @tc.desc      new DayInfo(2100, 1, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0005 begin`);
      const subject: DayInfo = new DayInfo(2100, 1, 1, 0);
      logInfo(`new DayInfo(2100, 1, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2100);
      logInfo(`new DayInfo(2100, 1, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2100, 1, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2100, 1, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0006
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0006
     * @tc.desc      new DayInfo(1970, 1, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0006 begin`);
      const subject: DayInfo = new DayInfo(1970, 1, 1, 0);
      logInfo(`new DayInfo(1970, 1, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 1, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(1970, 1, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(1970, 1, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0007
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0007
     * @tc.desc      new DayInfo(2025, 1, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0007 begin`);
      const subject: DayInfo = new DayInfo(2025, 1, 1, 0);
      logInfo(`new DayInfo(2025, 1, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 1, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2025, 1, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2025, 1, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0008
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0008
     * @tc.desc      new DayInfo(0, 1, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0008 begin`);
      const subject: DayInfo = new DayInfo(0, 1, 1, 0);
      logInfo(`new DayInfo(0, 1, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(0);
      logInfo(`new DayInfo(0, 1, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(0, 1, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(0, 1, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0009
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0009
     * @tc.desc      new DayInfo(2024, 2, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0009 begin`);
      const subject: DayInfo = new DayInfo(2024, 2, 1, 0);
      logInfo(`new DayInfo(2024, 2, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 2, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(2024, 2, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 2, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0010
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0010
     * @tc.desc      new DayInfo(2024, 6, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0010 begin`);
      const subject: DayInfo = new DayInfo(2024, 6, 1, 0);
      logInfo(`new DayInfo(2024, 6, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 6, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(6);
      logInfo(`new DayInfo(2024, 6, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 6, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0011
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0011
     * @tc.desc      new DayInfo(2024, 12, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0011 begin`);
      const subject: DayInfo = new DayInfo(2024, 12, 1, 0);
      logInfo(`new DayInfo(2024, 12, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 12, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(2024, 12, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 12, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0012
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0012
     * @tc.desc      new DayInfo(2024, 0, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0012 begin`);
      const subject: DayInfo = new DayInfo(2024, 0, 1, 0);
      logInfo(`new DayInfo(2024, 0, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 0, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(2024, 0, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 0, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0013
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0013
     * @tc.desc      new DayInfo(2024, 13, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0013 begin`);
      const subject: DayInfo = new DayInfo(2024, 13, 1, 0);
      logInfo(`new DayInfo(2024, 13, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 13, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(2024, 13, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 13, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0014
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0014
     * @tc.desc      new DayInfo(2024, -1, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0014 begin`);
      const subject: DayInfo = new DayInfo(2024, -1, 1, 0);
      logInfo(`new DayInfo(2024, -1, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, -1, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(-1);
      logInfo(`new DayInfo(2024, -1, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, -1, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0015
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0015
     * @tc.desc      new DayInfo(2024, 3, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0015 begin`);
      const subject: DayInfo = new DayInfo(2024, 3, 1, 0);
      logInfo(`new DayInfo(2024, 3, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 3, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(2024, 3, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 3, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0016
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0016
     * @tc.desc      new DayInfo(2024, 1, 15, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0016 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 15, 0);
      logInfo(`new DayInfo(2024, 1, 15, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 15, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 15, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(2024, 1, 15, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0017
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0017
     * @tc.desc      new DayInfo(2024, 1, 28, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0017 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 28, 0);
      logInfo(`new DayInfo(2024, 1, 28, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 28, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 28, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(2024, 1, 28, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0018
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0018
     * @tc.desc      new DayInfo(2024, 1, 29, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0018 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 29, 0);
      logInfo(`new DayInfo(2024, 1, 29, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 29, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 29, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(29);
      logInfo(`new DayInfo(2024, 1, 29, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0019
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0019
     * @tc.desc      new DayInfo(2024, 1, 30, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0019 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 30, 0);
      logInfo(`new DayInfo(2024, 1, 30, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 30, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 30, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(30);
      logInfo(`new DayInfo(2024, 1, 30, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0020
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0020
     * @tc.desc      new DayInfo(2024, 1, 31, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0020 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 31, 0);
      logInfo(`new DayInfo(2024, 1, 31, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 31, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 31, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(2024, 1, 31, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0021
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0021
     * @tc.desc      new DayInfo(2024, 1, 0, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0021 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 0, 0);
      logInfo(`new DayInfo(2024, 1, 0, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 0, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 0, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(2024, 1, 0, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0022
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0022
     * @tc.desc      new DayInfo(2024, 1, -1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0022 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, -1, 0);
      logInfo(`new DayInfo(2024, 1, -1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, -1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, -1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(-1);
      logInfo(`new DayInfo(2024, 1, -1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0023
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0023
     * @tc.desc      new DayInfo(2024, 1, 1, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0023 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 1, 1);
      logInfo(`new DayInfo(2024, 1, 1, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 1, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0024
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0024
     * @tc.desc      new DayInfo(2024, 1, 1, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0024 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 1, 3);
      logInfo(`new DayInfo(2024, 1, 1, 3): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 1, 3): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 3): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 3): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(3);
      logInfo(`${BUNDLE}DayInfoCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0025
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0025
     * @tc.desc      new DayInfo(2024, 1, 1, 6) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0025 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 1, 6);
      logInfo(`new DayInfo(2024, 1, 1, 6): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 1, 6): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 6): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 6): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(6);
      logInfo(`${BUNDLE}DayInfoCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0026
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0026
     * @tc.desc      new DayInfo(2024, 1, 1, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0026 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 1, 7);
      logInfo(`new DayInfo(2024, 1, 1, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 1, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0027
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0027
     * @tc.desc      new DayInfo(2024, 1, 1, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0027 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 1, -1);
      logInfo(`new DayInfo(2024, 1, 1, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 1, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0028
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0028
     * @tc.desc      new DayInfo(2024, 1, 1, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0028 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 1, 2);
      logInfo(`new DayInfo(2024, 1, 1, 2): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 1, 2): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 2): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 2): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(2);
      logInfo(`${BUNDLE}DayInfoCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0029
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0029
     * @tc.desc      new DayInfo(2024, 1, 1, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0029 begin`);
      const subject: DayInfo = new DayInfo(2024, 1, 1, 10);
      logInfo(`new DayInfo(2024, 1, 1, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 1, 1, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2024, 1, 1, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0030
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0030
     * @tc.desc      new DayInfo(1900, -1, 28, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0030 begin`);
      const subject: DayInfo = new DayInfo(1900, -1, 28, 10);
      logInfo(`new DayInfo(1900, -1, 28, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, -1, 28, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(-1);
      logInfo(`new DayInfo(1900, -1, 28, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(1900, -1, 28, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0031
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0031
     * @tc.desc      new DayInfo(2024, 3, 0, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0031 begin`);
      const subject: DayInfo = new DayInfo(2024, 3, 0, -1);
      logInfo(`new DayInfo(2024, 3, 0, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 3, 0, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(2024, 3, 0, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(2024, 3, 0, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0032
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0032
     * @tc.desc      new DayInfo(2100, 12, 31, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0032 begin`);
      const subject: DayInfo = new DayInfo(2100, 12, 31, 7);
      logInfo(`new DayInfo(2100, 12, 31, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2100);
      logInfo(`new DayInfo(2100, 12, 31, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(2100, 12, 31, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(2100, 12, 31, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0033
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0033
     * @tc.desc      new DayInfo(1970, 2, 1, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0033 begin`);
      const subject: DayInfo = new DayInfo(1970, 2, 1, 10);
      logInfo(`new DayInfo(1970, 2, 1, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 2, 1, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(1970, 2, 1, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(1970, 2, 1, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0034
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0034
     * @tc.desc      new DayInfo(0, 12, 29, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0034 begin`);
      const subject: DayInfo = new DayInfo(0, 12, 29, 10);
      logInfo(`new DayInfo(0, 12, 29, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(0);
      logInfo(`new DayInfo(0, 12, 29, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(0, 12, 29, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(29);
      logInfo(`new DayInfo(0, 12, 29, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0035
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0035
     * @tc.desc      new DayInfo(2024, 3, 28, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0035 begin`);
      const subject: DayInfo = new DayInfo(2024, 3, 28, 7);
      logInfo(`new DayInfo(2024, 3, 28, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, 3, 28, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(2024, 3, 28, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(2024, 3, 28, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0036
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0036
     * @tc.desc      new DayInfo(0, 3, 28, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0036 begin`);
      const subject: DayInfo = new DayInfo(0, 3, 28, 10);
      logInfo(`new DayInfo(0, 3, 28, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(0);
      logInfo(`new DayInfo(0, 3, 28, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(0, 3, 28, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(0, 3, 28, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0037
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0037
     * @tc.desc      new DayInfo(2025, 12, 31, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0037 begin`);
      const subject: DayInfo = new DayInfo(2025, 12, 31, 3);
      logInfo(`new DayInfo(2025, 12, 31, 3): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 12, 31, 3): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(2025, 12, 31, 3): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(2025, 12, 31, 3): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(3);
      logInfo(`${BUNDLE}DayInfoCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0038
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0038
     * @tc.desc      new DayInfo(0, 6, 0, 6) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0038 begin`);
      const subject: DayInfo = new DayInfo(0, 6, 0, 6);
      logInfo(`new DayInfo(0, 6, 0, 6): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(0);
      logInfo(`new DayInfo(0, 6, 0, 6): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(6);
      logInfo(`new DayInfo(0, 6, 0, 6): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(0, 6, 0, 6): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(6);
      logInfo(`${BUNDLE}DayInfoCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0039
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0039
     * @tc.desc      new DayInfo(0, 3, 0, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0039 begin`);
      const subject: DayInfo = new DayInfo(0, 3, 0, 0);
      logInfo(`new DayInfo(0, 3, 0, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(0);
      logInfo(`new DayInfo(0, 3, 0, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(0, 3, 0, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(0, 3, 0, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0040
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0040
     * @tc.desc      new DayInfo(2023, 2, 28, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0040 begin`);
      const subject: DayInfo = new DayInfo(2023, 2, 28, 2);
      logInfo(`new DayInfo(2023, 2, 28, 2): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2023);
      logInfo(`new DayInfo(2023, 2, 28, 2): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(2023, 2, 28, 2): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(2023, 2, 28, 2): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(2);
      logInfo(`${BUNDLE}DayInfoCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0041
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0041
     * @tc.desc      new DayInfo(2025, 0, 28, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0041 begin`);
      const subject: DayInfo = new DayInfo(2025, 0, 28, 0);
      logInfo(`new DayInfo(2025, 0, 28, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 0, 28, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(2025, 0, 28, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(2025, 0, 28, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0042
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0042
     * @tc.desc      new DayInfo(2023, 0, 31, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0042 begin`);
      const subject: DayInfo = new DayInfo(2023, 0, 31, 1);
      logInfo(`new DayInfo(2023, 0, 31, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2023);
      logInfo(`new DayInfo(2023, 0, 31, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(2023, 0, 31, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(2023, 0, 31, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0043
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0043
     * @tc.desc      new DayInfo(1900, 12, 15, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0043 begin`);
      const subject: DayInfo = new DayInfo(1900, 12, 15, 0);
      logInfo(`new DayInfo(1900, 12, 15, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, 12, 15, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(1900, 12, 15, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(1900, 12, 15, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0044
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0044
     * @tc.desc      new DayInfo(2000, 0, 28, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0044 begin`);
      const subject: DayInfo = new DayInfo(2000, 0, 28, 10);
      logInfo(`new DayInfo(2000, 0, 28, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2000);
      logInfo(`new DayInfo(2000, 0, 28, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(2000, 0, 28, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(2000, 0, 28, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0045
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0045
     * @tc.desc      new DayInfo(1900, 0, 15, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0045 begin`);
      const subject: DayInfo = new DayInfo(1900, 0, 15, 10);
      logInfo(`new DayInfo(1900, 0, 15, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, 0, 15, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(1900, 0, 15, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(1900, 0, 15, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0046
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0046
     * @tc.desc      new DayInfo(0, 0, 1, 6) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0046 begin`);
      const subject: DayInfo = new DayInfo(0, 0, 1, 6);
      logInfo(`new DayInfo(0, 0, 1, 6): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(0);
      logInfo(`new DayInfo(0, 0, 1, 6): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(0, 0, 1, 6): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(0, 0, 1, 6): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(6);
      logInfo(`${BUNDLE}DayInfoCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0047
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0047
     * @tc.desc      new DayInfo(2100, 2, 28, 2) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0047 begin`);
      const subject: DayInfo = new DayInfo(2100, 2, 28, 2);
      logInfo(`new DayInfo(2100, 2, 28, 2): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2100);
      logInfo(`new DayInfo(2100, 2, 28, 2): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(2100, 2, 28, 2): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(2100, 2, 28, 2): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(2);
      logInfo(`${BUNDLE}DayInfoCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0048
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0048
     * @tc.desc      new DayInfo(2024, -1, -1, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0048 begin`);
      const subject: DayInfo = new DayInfo(2024, -1, -1, 3);
      logInfo(`new DayInfo(2024, -1, -1, 3): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2024);
      logInfo(`new DayInfo(2024, -1, -1, 3): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(-1);
      logInfo(`new DayInfo(2024, -1, -1, 3): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(-1);
      logInfo(`new DayInfo(2024, -1, -1, 3): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(3);
      logInfo(`${BUNDLE}DayInfoCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0049
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0049
     * @tc.desc      new DayInfo(1900, 0, 30, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0049 begin`);
      const subject: DayInfo = new DayInfo(1900, 0, 30, 0);
      logInfo(`new DayInfo(1900, 0, 30, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, 0, 30, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(1900, 0, 30, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(30);
      logInfo(`new DayInfo(1900, 0, 30, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0050
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0050
     * @tc.desc      new DayInfo(2025, 6, 29, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0050 begin`);
      const subject: DayInfo = new DayInfo(2025, 6, 29, 0);
      logInfo(`new DayInfo(2025, 6, 29, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 6, 29, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(6);
      logInfo(`new DayInfo(2025, 6, 29, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(29);
      logInfo(`new DayInfo(2025, 6, 29, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0051
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0051
     * @tc.desc      new DayInfo(2100, 1, 30, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0051 begin`);
      const subject: DayInfo = new DayInfo(2100, 1, 30, -1);
      logInfo(`new DayInfo(2100, 1, 30, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2100);
      logInfo(`new DayInfo(2100, 1, 30, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2100, 1, 30, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(30);
      logInfo(`new DayInfo(2100, 1, 30, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0052
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0052
     * @tc.desc      new DayInfo(1970, 13, 31, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0052 begin`);
      const subject: DayInfo = new DayInfo(1970, 13, 31, 7);
      logInfo(`new DayInfo(1970, 13, 31, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 13, 31, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(1970, 13, 31, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(1970, 13, 31, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0053
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0053
     * @tc.desc      new DayInfo(2025, 0, -1, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0053 begin`);
      const subject: DayInfo = new DayInfo(2025, 0, -1, 1);
      logInfo(`new DayInfo(2025, 0, -1, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 0, -1, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(2025, 0, -1, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(-1);
      logInfo(`new DayInfo(2025, 0, -1, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0054
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0054
     * @tc.desc      new DayInfo(1970, 13, 29, 6) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0054 begin`);
      const subject: DayInfo = new DayInfo(1970, 13, 29, 6);
      logInfo(`new DayInfo(1970, 13, 29, 6): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 13, 29, 6): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(1970, 13, 29, 6): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(29);
      logInfo(`new DayInfo(1970, 13, 29, 6): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(6);
      logInfo(`${BUNDLE}DayInfoCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0055
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0055
     * @tc.desc      new DayInfo(2023, 12, 1, 6) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0055 begin`);
      const subject: DayInfo = new DayInfo(2023, 12, 1, 6);
      logInfo(`new DayInfo(2023, 12, 1, 6): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2023);
      logInfo(`new DayInfo(2023, 12, 1, 6): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(2023, 12, 1, 6): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2023, 12, 1, 6): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(6);
      logInfo(`${BUNDLE}DayInfoCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0056
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0056
     * @tc.desc      new DayInfo(1900, 2, 31, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0056 begin`);
      const subject: DayInfo = new DayInfo(1900, 2, 31, -1);
      logInfo(`new DayInfo(1900, 2, 31, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, 2, 31, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(1900, 2, 31, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(1900, 2, 31, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0057
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0057
     * @tc.desc      new DayInfo(1970, 13, -1, 6) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0057 begin`);
      const subject: DayInfo = new DayInfo(1970, 13, -1, 6);
      logInfo(`new DayInfo(1970, 13, -1, 6): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, 13, -1, 6): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(1970, 13, -1, 6): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(-1);
      logInfo(`new DayInfo(1970, 13, -1, 6): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(6);
      logInfo(`${BUNDLE}DayInfoCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0058
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0058
     * @tc.desc      new DayInfo(2100, 1, 31, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0058 begin`);
      const subject: DayInfo = new DayInfo(2100, 1, 31, 0);
      logInfo(`new DayInfo(2100, 1, 31, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2100);
      logInfo(`new DayInfo(2100, 1, 31, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(1);
      logInfo(`new DayInfo(2100, 1, 31, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(31);
      logInfo(`new DayInfo(2100, 1, 31, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0059
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0059
     * @tc.desc      new DayInfo(2023, 3, 29, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0059 begin`);
      const subject: DayInfo = new DayInfo(2023, 3, 29, 3);
      logInfo(`new DayInfo(2023, 3, 29, 3): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2023);
      logInfo(`new DayInfo(2023, 3, 29, 3): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(2023, 3, 29, 3): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(29);
      logInfo(`new DayInfo(2023, 3, 29, 3): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(3);
      logInfo(`${BUNDLE}DayInfoCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0060
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0060
     * @tc.desc      new DayInfo(2025, 3, 28, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0060 begin`);
      const subject: DayInfo = new DayInfo(2025, 3, 28, 1);
      logInfo(`new DayInfo(2025, 3, 28, 1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 3, 28, 1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(2025, 3, 28, 1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(2025, 3, 28, 1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(1);
      logInfo(`${BUNDLE}DayInfoCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0061
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0061
     * @tc.desc      new DayInfo(2100, 13, 28, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0061 begin`);
      const subject: DayInfo = new DayInfo(2100, 13, 28, 7);
      logInfo(`new DayInfo(2100, 13, 28, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2100);
      logInfo(`new DayInfo(2100, 13, 28, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(2100, 13, 28, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(2100, 13, 28, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0062
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0062
     * @tc.desc      new DayInfo(1900, 13, 28, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0062 begin`);
      const subject: DayInfo = new DayInfo(1900, 13, 28, 7);
      logInfo(`new DayInfo(1900, 13, 28, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, 13, 28, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(1900, 13, 28, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(1900, 13, 28, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0063
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0063
     * @tc.desc      new DayInfo(2025, 13, 0, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0063 begin`);
      const subject: DayInfo = new DayInfo(2025, 13, 0, 3);
      logInfo(`new DayInfo(2025, 13, 0, 3): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 13, 0, 3): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(2025, 13, 0, 3): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(2025, 13, 0, 3): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(3);
      logInfo(`${BUNDLE}DayInfoCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0064
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0064
     * @tc.desc      new DayInfo(2023, 3, 0, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0064 begin`);
      const subject: DayInfo = new DayInfo(2023, 3, 0, -1);
      logInfo(`new DayInfo(2023, 3, 0, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2023);
      logInfo(`new DayInfo(2023, 3, 0, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(3);
      logInfo(`new DayInfo(2023, 3, 0, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(0);
      logInfo(`new DayInfo(2023, 3, 0, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0065
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0065
     * @tc.desc      new DayInfo(2000, 0, -1, 10) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0065 begin`);
      const subject: DayInfo = new DayInfo(2000, 0, -1, 10);
      logInfo(`new DayInfo(2000, 0, -1, 10): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2000);
      logInfo(`new DayInfo(2000, 0, -1, 10): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(0);
      logInfo(`new DayInfo(2000, 0, -1, 10): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(-1);
      logInfo(`new DayInfo(2000, 0, -1, 10): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(10);
      logInfo(`${BUNDLE}DayInfoCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0066
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0066
     * @tc.desc      new DayInfo(2023, 13, 1, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0066 begin`);
      const subject: DayInfo = new DayInfo(2023, 13, 1, 0);
      logInfo(`new DayInfo(2023, 13, 1, 0): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2023);
      logInfo(`new DayInfo(2023, 13, 1, 0): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(13);
      logInfo(`new DayInfo(2023, 13, 1, 0): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2023, 13, 1, 0): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(0);
      logInfo(`${BUNDLE}DayInfoCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0067
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0067
     * @tc.desc      new DayInfo(2025, 12, 29, 7) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0067 begin`);
      const subject: DayInfo = new DayInfo(2025, 12, 29, 7);
      logInfo(`new DayInfo(2025, 12, 29, 7): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2025);
      logInfo(`new DayInfo(2025, 12, 29, 7): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(12);
      logInfo(`new DayInfo(2025, 12, 29, 7): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(29);
      logInfo(`new DayInfo(2025, 12, 29, 7): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(7);
      logInfo(`${BUNDLE}DayInfoCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0068
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0068
     * @tc.desc      new DayInfo(2100, -1, 1, -1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0068 begin`);
      const subject: DayInfo = new DayInfo(2100, -1, 1, -1);
      logInfo(`new DayInfo(2100, -1, 1, -1): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(2100);
      logInfo(`new DayInfo(2100, -1, 1, -1): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(-1);
      logInfo(`new DayInfo(2100, -1, 1, -1): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(1);
      logInfo(`new DayInfo(2100, -1, 1, -1): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(-1);
      logInfo(`${BUNDLE}DayInfoCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0069
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0069
     * @tc.desc      new DayInfo(1900, 2, 28, 6) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0069 begin`);
      const subject: DayInfo = new DayInfo(1900, 2, 28, 6);
      logInfo(`new DayInfo(1900, 2, 28, 6): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1900);
      logInfo(`new DayInfo(1900, 2, 28, 6): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(2);
      logInfo(`new DayInfo(1900, 2, 28, 6): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(28);
      logInfo(`new DayInfo(1900, 2, 28, 6): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(6);
      logInfo(`${BUNDLE}DayInfoCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DAY_INFO_CTOR_0070
     * @tc.name      CalendarViewSwitch_DayInfoCtor_0070
     * @tc.desc      new DayInfo(1970, -1, 15, 6) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_DayInfoCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}DayInfoCtor_0070 begin`);
      const subject: DayInfo = new DayInfo(1970, -1, 15, 6);
      logInfo(`new DayInfo(1970, -1, 15, 6): subject.year=${subject.year}`);
      expect(subject.year).assertEqual(1970);
      logInfo(`new DayInfo(1970, -1, 15, 6): subject.month=${subject.month}`);
      expect(subject.month).assertEqual(-1);
      logInfo(`new DayInfo(1970, -1, 15, 6): subject.date=${subject.date}`);
      expect(subject.date).assertEqual(15);
      logInfo(`new DayInfo(1970, -1, 15, 6): subject.week=${subject.week}`);
      expect(subject.week).assertEqual(6);
      logInfo(`${BUNDLE}DayInfoCtor_0070 end`);
    });
  });
}
