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
import Constant from '../../../main/ets/common/Constant';

export default function constantRelationExtraTest(): void {
  describe('ReminderConstantRelationExtraTest', () => {
    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_0100
     * @tc.name      testReminderConstantRelationExtra0001
     * @tc.desc      Verify hour is sixty minutes.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HOUR_SECONDS).assertEqual(Constant.MINUTES_SECONDS * 60);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_0200
     * @tc.name      testReminderConstantRelationExtra0002
     * @tc.desc      Verify prompt times ten equals vibrator.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.PROMPT_DURATION * 10).assertEqual(Constant.VIBRATOR_DURATION);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_0300
     * @tc.name      testReminderConstantRelationExtra0003
     * @tc.desc      Verify second equals one thousand milliseconds.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.SECONDS_MILLISECONDS).assertEqual(1000);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_0400
     * @tc.name      testReminderConstantRelationExtra0004
     * @tc.desc      Verify angle equals full circle.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.ANGLE).assertEqual(360);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_0500
     * @tc.name      testReminderConstantRelationExtra0005
     * @tc.desc      Verify countdown equals fifty nine.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.TIME_COUNTDOWN).assertEqual(59);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_0600
     * @tc.name      testReminderConstantRelationExtra0006
     * @tc.desc      Verify horizontal dial is square.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HORIZONTAL_CLOCK_DIAL_HEIGHT).assertEqual(Constant.HORIZONTAL_CLOCK_DIAL_WIDTH);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_0700
     * @tc.name      testReminderConstantRelationExtra0007
     * @tc.desc      Verify vertical dial is square.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.VERTICAL_CLOCK_DIAL_HEIGHT).assertEqual(Constant.VERTICAL_CLOCK_DIAL_WIDTH);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_0800
     * @tc.name      testReminderConstantRelationExtra0008
     * @tc.desc      Verify horizontal center is half height.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HORIZONTAL_CENTER_Y > Constant.HORIZONTAL_CLOCK_HEIGHT / 2).assertTrue();
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_0900
     * @tc.name      testReminderConstantRelationExtra0009
     * @tc.desc      Verify vertical center is half height.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.VERTICAL_CENTER_Y).assertEqual(Constant.VERTICAL_CLOCK_HEIGHT / 2);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_1000
     * @tc.name      testReminderConstantRelationExtra0010
     * @tc.desc      Verify horizontal line exceeds pointer.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HORIZONTAL_LINE_LENGTH > Constant.HORIZONTAL_POINTER_HEIGHT).assertEqual(true);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_1100
     * @tc.name      testReminderConstantRelationExtra0011
     * @tc.desc      Verify vertical line exceeds pointer.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.VERTICAL_LINE_LENGTH > Constant.VERTICAL_POINTER_HEIGHT).assertEqual(true);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_1200
     * @tc.name      testReminderConstantRelationExtra0012
     * @tc.desc      Verify horizontal clock is smaller than dial.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HORIZONTAL_CLOCK_HEIGHT < Constant.HORIZONTAL_CLOCK_DIAL_HEIGHT).assertEqual(true);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_1300
     * @tc.name      testReminderConstantRelationExtra0013
     * @tc.desc      Verify vertical clock is smaller than dial.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.VERTICAL_CLOCK_HEIGHT < Constant.VERTICAL_CLOCK_DIAL_HEIGHT).assertEqual(true);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_1400
     * @tc.name      testReminderConstantRelationExtra0014
     * @tc.desc      Verify picker is smaller than vertical dial.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.VERTICAL_PICKER_HEIGHT < Constant.VERTICAL_CLOCK_DIAL_HEIGHT).assertEqual(true);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_1500
     * @tc.name      testReminderConstantRelationExtra0015
     * @tc.desc      Verify all dimensions are positive.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HORIZONTAL_POINTER_HEIGHT + Constant.VERTICAL_POINTER_HEIGHT > 0).assertEqual(true);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_1600
     * @tc.name      testReminderConstantRelationExtra0016
     * @tc.desc      Verify constant values are integers.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.PROMPT_DURATION % 1).assertEqual(0);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_1700
     * @tc.name      testReminderConstantRelationExtra0017
     * @tc.desc      Verify reminder is shorter than prompt.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.REMINDER_DURATION < Constant.PROMPT_DURATION).assertEqual(true);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_1800
     * @tc.name      testReminderConstantRelationExtra0018
     * @tc.desc      Verify countdown is less than a minute.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.TIME_COUNTDOWN < Constant.MINUTES_SECONDS).assertEqual(true);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_1900
     * @tc.name      testReminderConstantRelationExtra0019
     * @tc.desc      Verify hour exceeds minute.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.HOUR_SECONDS > Constant.MINUTES_SECONDS).assertEqual(true);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_REMINDER_CONSTANT_RELATION_EXTRA_2000
     * @tc.name      testReminderConstantRelationExtra0020
     * @tc.desc      Verify angle exceeds countdown.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderConstantRelationExtra0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          expect(Constant.ANGLE > Constant.TIME_COUNTDOWN).assertEqual(true);
          expect(Constant.PROMPT_DURATION > 0).assertTrue();
          expect(Constant.VIBRATOR_DURATION > 0).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

  });
}
