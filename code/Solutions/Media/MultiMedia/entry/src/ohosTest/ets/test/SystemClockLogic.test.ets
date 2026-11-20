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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import { LogicTestLog } from '../utils/LogicTestLog';
import DateTimeUtil from '../../../main/ets/model/DateTimeUtil';
import { getDurationString, tempNum } from '../../../main/ets/model/TimeUtils';

export default function SystemClockLogic(): void {
  describe('SystemClockLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1621
     * @tc.name MultiMedia_SystemClock_1621
     * @tc.desc Read the real local clock without a midnight or second-boundary false failure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_SystemClock_1621', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_SystemClock_1621';
      LogicTestLog.begin(name, 'wall-clock bounds; no platform services');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const before: Date = new Date();
      const date: string = dateTime.getDate();
      const time: string = dateTime.getTime();
      const after: Date = new Date();
      const beforeDate: string = String(before.getFullYear()) +
        String(before.getMonth() + 1).padStart(2, '0') + String(before.getDate()).padStart(2, '0');
      const afterDate: string = String(after.getFullYear()) +
        String(after.getMonth() + 1).padStart(2, '0') + String(after.getDate()).padStart(2, '0');
      const beforeTime: string = String(before.getHours()).padStart(2, '0') +
        String(before.getMinutes()).padStart(2, '0') + String(before.getSeconds()).padStart(2, '0');
      const afterTime: string = String(after.getHours()).padStart(2, '0') +
        String(after.getMinutes()).padStart(2, '0') + String(after.getSeconds()).padStart(2, '0');
      LogicTestLog.value(name, 'local date bounds', String(true), String(date >= beforeDate && date <= afterDate));
      expect(date >= beforeDate && date <= afterDate).assertEqual(true);
      const bounded: boolean = beforeTime <= afterTime ? time >= beforeTime && time <= afterTime :
        time >= beforeTime || time <= afterTime;
      LogicTestLog.value(name, 'local time bounds', String(true), String(bounded));
      expect(bounded).assertEqual(true);
      LogicTestLog.number(name, 'system date width', 8, date.length);
      expect(date.length).assertEqual(8);
      LogicTestLog.number(name, 'system clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'date digits', String(true), String(/^[0-9]{8}$/.test(date)));
      expect(/^[0-9]{8}$/.test(date)).assertEqual(true);
      LogicTestLog.value(name, 'clock digits', String(true), String(/^[0-9]{6}$/.test(time)));
      expect(/^[0-9]{6}$/.test(time)).assertEqual(true);
      LogicTestLog.end(name);
    });
  });
}
