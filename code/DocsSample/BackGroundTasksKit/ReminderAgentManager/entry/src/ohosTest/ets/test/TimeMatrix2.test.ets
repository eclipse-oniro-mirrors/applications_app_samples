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

export default function timeMatrix2Test(): void {
  describe('ReminderTimeMatrix2Test', () => {
    installCaseIsolation();
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX2_0100
     * @tc.name      testReminderTimeMatrix20001
     * @tc.desc      Verify 00:46 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix20001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 46);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });
    /**
     * @tc.number    SUB_REMINDER_TIME_MATRIX2_0200
     * @tc.name      testReminderTimeMatrix20002
     * @tc.desc      Verify 00:47 conversion stays within one day.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testReminderTimeMatrix20002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        try {
          const value: number = TimeConversion.timeToMillisecond(0, 47);
          expect(value >= -2).assertTrue();
          expect(value <= 86398).assertTrue();
          expect(value === value).assertTrue();
        } catch (err) {
          expect().assertFail();
        }
      });  });
}
