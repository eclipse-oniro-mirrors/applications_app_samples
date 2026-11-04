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
import Constant from '../../../main/ets/common/Constant';

export default function boundaryTest() {
  describe('ReminderBoundaryTest', () => {
    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_0100
     * @tc.name      testReminderAgentBoundaryFutureHour0001
     * @tc.desc      Verify a 1-hour future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryFutureHour0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 1 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 3601).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_0200
     * @tc.name      testReminderAgentBoundaryFutureHour0002
     * @tc.desc      Verify a 2-hour future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryFutureHour0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 2 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 7201).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_0300
     * @tc.name      testReminderAgentBoundaryFutureHour0003
     * @tc.desc      Verify a 6-hour future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryFutureHour0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 6 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 21601).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_0400
     * @tc.name      testReminderAgentBoundaryFutureHour0004
     * @tc.desc      Verify a 12-hour future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryFutureHour0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 12 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 43201).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_0500
     * @tc.name      testReminderAgentBoundaryFutureHour0005
     * @tc.desc      Verify a 18-hour future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryFutureHour0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 18 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 64801).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_0600
     * @tc.name      testReminderAgentBoundaryFutureHour0006
     * @tc.desc      Verify a 23-hour future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryFutureHour0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() + 23 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 82801).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_0700
     * @tc.name      testReminderAgentBoundaryPastHour0007
     * @tc.desc      Verify a 1-hour past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryPastHour0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 1 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -3660).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_0800
     * @tc.name      testReminderAgentBoundaryPastHour0008
     * @tc.desc      Verify a 2-hour past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryPastHour0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 2 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -7260).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_0900
     * @tc.name      testReminderAgentBoundaryPastHour0009
     * @tc.desc      Verify a 6-hour past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryPastHour0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 6 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -21660).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_1000
     * @tc.name      testReminderAgentBoundaryPastHour0010
     * @tc.desc      Verify a 12-hour past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryPastHour0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 12 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -43260).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_1100
     * @tc.name      testReminderAgentBoundaryPastHour0011
     * @tc.desc      Verify a 18-hour past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryPastHour0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 18 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -64860).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_1200
     * @tc.name      testReminderAgentBoundaryPastHour0012
     * @tc.desc      Verify a 23-hour past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryPastHour0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          const date: Date = new Date(Date.now() - 23 * 3600 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value <= 0).assertTrue();
          expect(value >= -90000).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_1300
     * @tc.name      testReminderAgentBoundaryConstant0013
     * @tc.desc      Verify additional clock and reminder constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryConstant0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.VERTICAL_CLOCK_HEIGHT).assertEqual(250);
          expect(Constant.VERTICAL_CLOCK_WIDTH).assertEqual(250);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_1400
     * @tc.name      testReminderAgentBoundaryConstant0014
     * @tc.desc      Verify additional clock and reminder constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryConstant0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.VERTICAL_CENTER_Y).assertEqual(125);
          expect(Constant.VERTICAL_PICKER_HEIGHT).assertEqual(128);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_1500
     * @tc.name      testReminderAgentBoundaryConstant0015
     * @tc.desc      Verify additional clock and reminder constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryConstant0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HORIZONTAL_CLOCK_HEIGHT).assertEqual(188);
          expect(Constant.HORIZONTAL_CLOCK_WIDTH).assertEqual(188);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_1600
     * @tc.name      testReminderAgentBoundaryConstant0016
     * @tc.desc      Verify additional clock and reminder constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryConstant0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HORIZONTAL_CENTER_Y).assertEqual(99);
          expect(Constant.VERTICAL_LINE_LENGTH).assertEqual(410);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_1700
     * @tc.name      testReminderAgentBoundaryConstant0017
     * @tc.desc      Verify additional clock and reminder constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryConstant0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HORIZONTAL_LINE_LENGTH).assertEqual(345);
          expect(Constant.VERTICAL_POINTER_HEIGHT).assertEqual(375);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_1800
     * @tc.name      testReminderAgentBoundaryConstant0018
     * @tc.desc      Verify additional clock and reminder constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryConstant0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HORIZONTAL_CLOCK_DIAL_HEIGHT).assertEqual(212);
          expect(Constant.HORIZONTAL_CLOCK_DIAL_WIDTH).assertEqual(212);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_1900
     * @tc.name      testReminderAgentBoundaryConstant0019
     * @tc.desc      Verify additional clock and reminder constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryConstant0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.VERTICAL_CLOCK_DIAL_HEIGHT).assertEqual(280);
          expect(Constant.VERTICAL_CLOCK_DIAL_WIDTH).assertEqual(280);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_BOUNDARY_2000
     * @tc.name      testReminderAgentBoundaryConstant0020
     * @tc.desc      Verify additional clock and reminder constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentBoundaryConstant0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.PROMPT_DURATION).assertEqual(300);
          expect(Constant.REMINDER_DURATION).assertEqual(30);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });  });
}
