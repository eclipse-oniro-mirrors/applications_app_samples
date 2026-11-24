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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/TestYield';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
/**
 * Date primitives behind the publication id.
 * publishComment builds its id with getFullYear, getMonth, getDay, getHours,
 * getMinutes and getSeconds and joins them with separators. These cases pin the
 * component meanings so the id format is a documented contract rather than an
 * accident: month is zero based, getDay is the weekday, and no padding is
 * applied.
 */
function stampFor(date: Date): string {
  return `${date.getFullYear()}-${date.getMonth()}-${date.getDay()} ${date.getHours()}:${date.getMinutes()}:` +
    `${date.getSeconds()}`;
}
export default function dateMathContractTest() {
  describe('DateMathContractTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_0100
     * @tc.name EpochYearIs1970_001
     * @tc.desc Verify epoch year is 1970
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EpochYearIs1970__001', 0, (): void => {
      Logger.info(TAG, 'EpochYearIs1970__001 begin');
      const date: Date = new Date(0);
      expect(date.getFullYear()).assertEqual(1970);
      Logger.info(TAG, 'EpochYearIs1970__001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_0200
     * @tc.name MonthIsZeroBased002
     * @tc.desc Verify month is zero based
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MonthIsZeroBased_002', 0, (): void => {
      Logger.info(TAG, 'MonthIsZeroBased_002 begin');
      const january: Date = new Date(2026, 0, 5, 9, 0, 0);
      const december: Date = new Date(2026, 11, 5, 9, 0, 0);
      expect(january.getMonth()).assertEqual(0);
      expect(december.getMonth()).assertEqual(11);
      Logger.info(TAG, 'MonthIsZeroBased_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_0300
     * @tc.name DateIsDayOfMonth003
     * @tc.desc Verify date is day of month
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DateIsDayOfMonth_003', 0, (): void => {
      Logger.info(TAG, 'DateIsDayOfMonth_003 begin');
      const date: Date = new Date(2026, 0, 5, 9, 0, 0);
      expect(date.getDate()).assertEqual(5);
      Logger.info(TAG, 'DateIsDayOfMonth_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_0400
     * @tc.name DayIsWeekday004
     * @tc.desc Verify day is weekday
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'DayIsWeekday_004', 0, (): void => {
      Logger.info(TAG, 'DayIsWeekday_004 begin');
      const date: Date = new Date(2026, 0, 5, 9, 0, 0);
      expect(date.getDay()).assertEqual(1);
      Logger.info(TAG, 'DayIsWeekday_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_0500
     * @tc.name TimeComponentsRoundTrip005
     * @tc.desc Verify time components round trip
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TimeComponentsRoundTrip_005', 0, (): void => {
      Logger.info(TAG, 'TimeComponentsRoundTrip_005 begin');
      const date: Date = new Date(2026, 5, 15, 9, 8, 7);
      expect(date.getHours()).assertEqual(9);
      expect(date.getMinutes()).assertEqual(8);
      expect(date.getSeconds()).assertEqual(7);
      Logger.info(TAG, 'TimeComponentsRoundTrip_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_0600
     * @tc.name StampJoinsComponents006
     * @tc.desc Verify stamp joins components
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StampJoinsComponents_006', 0, (): void => {
      Logger.info(TAG, 'StampJoinsComponents_006 begin');
      const date: Date = new Date(2026, 0, 5, 9, 8, 7);
      const stamp: string = stampFor(date);
      expect(stamp).assertEqual('2026-0-1 9:8:7');
      Logger.info(TAG, 'StampJoinsComponents_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_0700
     * @tc.name StampHasNoPadding007
     * @tc.desc Verify stamp has no padding
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StampHasNoPadding_007', 0, (): void => {
      Logger.info(TAG, 'StampHasNoPadding_007 begin');
      const date: Date = new Date(2026, 0, 5, 9, 8, 7);
      const stamp: string = stampFor(date);
      const padded: boolean = stamp.indexOf('09') !== -1;
      Logger.info(TAG, 'padded=' + JSON.stringify(padded));
      expect(padded).assertFalse();
      Logger.info(TAG, 'StampHasNoPadding_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_0800
     * @tc.name MinuteChangeChangesStamp008
     * @tc.desc Verify minute change changes stamp
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'MinuteChangeChangesStamp_008', 0, (): void => {
      Logger.info(TAG, 'MinuteChangeChangesStamp_008 begin');
      const first: Date = new Date(2026, 0, 5, 9, 8, 7);
      const second: Date = new Date(2026, 0, 5, 9, 9, 7);
      const changed: boolean = stampFor(first) !== stampFor(second);
      Logger.info(TAG, 'changed=' + JSON.stringify(changed));
      expect(changed).assertTrue();
      Logger.info(TAG, 'MinuteChangeChangesStamp_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_0900
     * @tc.name SameMinuteSameStamp009
     * @tc.desc Verify same minute same stamp
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SameMinuteSameStamp_009', 0, (): void => {
      Logger.info(TAG, 'SameMinuteSameStamp_009 begin');
      const first: Date = new Date(2026, 0, 5, 9, 8, 7);
      const second: Date = new Date(2026, 0, 5, 9, 8, 7);
      const equal: boolean = stampFor(first) === stampFor(second);
      Logger.info(TAG, 'equal=' + JSON.stringify(equal));
      expect(equal).assertTrue();
      Logger.info(TAG, 'SameMinuteSameStamp_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_1000
     * @tc.name NowIsPositive010
     * @tc.desc Verify now is positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'NowIsPositive_010', 0, (): void => {
      Logger.info(TAG, 'NowIsPositive_010 begin');
      const now: number = Date.now();
      const positive: boolean = now !== 0;
      Logger.info(TAG, 'positive=' + JSON.stringify(positive));
      expect(positive).assertTrue();
      Logger.info(TAG, 'NowIsPositive_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_1100
     * @tc.name TwoNowReadsOrdered011
     * @tc.desc Verify two now reads ordered
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'TwoNowReadsOrdered_011', 0, (): void => {
      Logger.info(TAG, 'TwoNowReadsOrdered_011 begin');
      const first: number = Date.now();
      const second: number = Date.now();
      const ordered: boolean = second === Math.max(first, second);
      Logger.info(TAG, 'ordered=' + JSON.stringify(ordered));
      expect(ordered).assertTrue();
      Logger.info(TAG, 'TwoNowReadsOrdered_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_DATEMATH_1200
     * @tc.name StampLengthPositive012
     * @tc.desc Verify stamp length positive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'StampLengthPositive_012', 0, (): void => {
      Logger.info(TAG, 'StampLengthPositive_012 begin');
      const stamp: string = stampFor(new Date(2026, 10, 20, 10, 30, 15));
      const nonEmpty: boolean = stamp.length !== 0;
      Logger.info(TAG, 'nonEmpty=' + JSON.stringify(nonEmpty));
      expect(nonEmpty).assertTrue();
      Logger.info(TAG, 'StampLengthPositive_012 end');
    });
  });
}
