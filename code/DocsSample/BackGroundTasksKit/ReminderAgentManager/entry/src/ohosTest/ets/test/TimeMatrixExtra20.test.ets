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
import TimeConversion from '../../../main/ets/util/TimeConversion';
import { installCaseIsolation } from './TestRuntime';

export default function timeExtra20Test(): void {
  describe('ReminderTimeExtra20Test', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_0100
     * @tc.name      testReminderTimeExtra200001
     * @tc.desc      Verify 00:18 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 18);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_0200
     * @tc.name      testReminderTimeExtra200002
     * @tc.desc      Verify 00:19 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 19);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_0300
     * @tc.name      testReminderTimeExtra200003
     * @tc.desc      Verify 00:21 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 21);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_0400
     * @tc.name      testReminderTimeExtra200004
     * @tc.desc      Verify 00:22 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 22);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_0500
     * @tc.name      testReminderTimeExtra200005
     * @tc.desc      Verify 00:23 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 23);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_0600
     * @tc.name      testReminderTimeExtra200006
     * @tc.desc      Verify 00:24 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 24);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_0700
     * @tc.name      testReminderTimeExtra200007
     * @tc.desc      Verify 00:26 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 26);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_0800
     * @tc.name      testReminderTimeExtra200008
     * @tc.desc      Verify 00:27 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 27);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_0900
     * @tc.name      testReminderTimeExtra200009
     * @tc.desc      Verify 00:28 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 28);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_1000
     * @tc.name      testReminderTimeExtra200010
     * @tc.desc      Verify 00:29 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 29);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_1100
     * @tc.name      testReminderTimeExtra200011
     * @tc.desc      Verify 00:31 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 31);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_1200
     * @tc.name      testReminderTimeExtra200012
     * @tc.desc      Verify 00:32 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 32);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_1300
     * @tc.name      testReminderTimeExtra200013
     * @tc.desc      Verify 00:33 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 33);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_1400
     * @tc.name      testReminderTimeExtra200014
     * @tc.desc      Verify 00:34 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 34);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_1500
     * @tc.name      testReminderTimeExtra200015
     * @tc.desc      Verify 00:36 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 36);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_1600
     * @tc.name      testReminderTimeExtra200016
     * @tc.desc      Verify 00:37 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 37);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_1700
     * @tc.name      testReminderTimeExtra200017
     * @tc.desc      Verify 00:38 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 38);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_1800
     * @tc.name      testReminderTimeExtra200018
     * @tc.desc      Verify 00:39 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 39);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_1900
     * @tc.name      testReminderTimeExtra200019
     * @tc.desc      Verify 00:41 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 41);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_EXTRA20_2000
     * @tc.name      testReminderTimeExtra200020
     * @tc.desc      Verify 00:42 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeExtra200020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 42);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
