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
import { installCaseIsolation } from './TestRuntime';

export default function contractTest() {
  describe('ReminderContractTest', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_0100
     * @tc.name      testReminderAgentContractConstant0001
     * @tc.desc      Verify layout and timing constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractConstant0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.PROMPT_DURATION).assertEqual(300);
          expect(Constant.REMINDER_DURATION).assertEqual(30);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_0200
     * @tc.name      testReminderAgentContractConstant0002
     * @tc.desc      Verify layout and timing constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractConstant0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.FONT_WEIGHT).assertEqual(400);
          expect(Constant.VIBRATOR_DURATION).assertEqual(3000);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_0300
     * @tc.name      testReminderAgentContractConstant0003
     * @tc.desc      Verify layout and timing constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractConstant0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.SECONDS_MILLISECONDS).assertEqual(1000);
          expect(Constant.ANGLE).assertEqual(360);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_0400
     * @tc.name      testReminderAgentContractConstant0004
     * @tc.desc      Verify layout and timing constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractConstant0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.HOUR_SECONDS).assertEqual(3600);
          expect(Constant.MINUTES_SECONDS).assertEqual(60);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_0500
     * @tc.name      testReminderAgentContractConstant0005
     * @tc.desc      Verify layout and timing constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractConstant0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.TIME_COUNTDOWN).assertEqual(59);
          expect(Constant.HORIZONTAL_POINTER_HEIGHT).assertEqual(310);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_0600
     * @tc.name      testReminderAgentContractConstant0006
     * @tc.desc      Verify layout and timing constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractConstant0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.HORIZONTAL_LINE_LENGTH).assertEqual(345);
          expect(Constant.HORIZONTAL_CLOCK_DIAL_HEIGHT).assertEqual(212);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_0700
     * @tc.name      testReminderAgentContractConstant0007
     * @tc.desc      Verify layout and timing constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractConstant0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.HORIZONTAL_CLOCK_DIAL_WIDTH).assertEqual(212);
          expect(Constant.HORIZONTAL_CLOCK_HEIGHT).assertEqual(188);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_0800
     * @tc.name      testReminderAgentContractConstant0008
     * @tc.desc      Verify layout and timing constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractConstant0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.HORIZONTAL_CLOCK_WIDTH).assertEqual(188);
          expect(Constant.HORIZONTAL_CENTER_Y).assertEqual(99);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_0900
     * @tc.name      testReminderAgentContractConstant0009
     * @tc.desc      Verify layout and timing constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractConstant0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.VERTICAL_POINTER_HEIGHT).assertEqual(375);
          expect(Constant.VERTICAL_LINE_LENGTH).assertEqual(410);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_1000
     * @tc.name      testReminderAgentContractConstant0010
     * @tc.desc      Verify layout and timing constants keep declared values.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractConstant0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          expect(Constant.VERTICAL_CLOCK_DIAL_HEIGHT).assertEqual(280);
          expect(Constant.VERTICAL_CLOCK_DIAL_WIDTH).assertEqual(280);
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_1100
     * @tc.name      testReminderAgentContractFuture0011
     * @tc.desc      Verify a 1-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractFuture0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() + 1 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 61).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_1200
     * @tc.name      testReminderAgentContractFuture0012
     * @tc.desc      Verify a 3-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractFuture0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() + 3 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 181).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_1300
     * @tc.name      testReminderAgentContractFuture0013
     * @tc.desc      Verify a 7-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractFuture0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() + 7 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 421).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_1400
     * @tc.name      testReminderAgentContractFuture0014
     * @tc.desc      Verify a 15-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractFuture0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() + 15 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 901).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_1500
     * @tc.name      testReminderAgentContractFuture0015
     * @tc.desc      Verify a 30-minute future date converts to a bounded positive delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractFuture0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() + 30 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value > 0).assertTrue();
          expect(value <= 1801).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_1600
     * @tc.name      testReminderAgentContractPast0016
     * @tc.desc      Verify a 1-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractPast0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() - 1 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -120).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_1700
     * @tc.name      testReminderAgentContractPast0017
     * @tc.desc      Verify a 3-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractPast0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() - 3 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -240).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_1800
     * @tc.name      testReminderAgentContractPast0018
     * @tc.desc      Verify a 7-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractPast0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() - 7 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -480).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_1900
     * @tc.name      testReminderAgentContractPast0019
     * @tc.desc      Verify a 15-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractPast0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() - 15 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -960).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_AGENT_CONTRACT_2000
     * @tc.name      testReminderAgentContractPast0020
     * @tc.desc      Verify a 30-minute past date converts to a bounded negative delay.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderAgentContractPast0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const date: Date = new Date(Date.now() - 30 * 60 * 1000);
          const value: number = TimeConversion.dateToMillisecond(date.getFullYear(),
            date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes());
          expect(value < 0).assertTrue();
          expect(value >= -1860).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
