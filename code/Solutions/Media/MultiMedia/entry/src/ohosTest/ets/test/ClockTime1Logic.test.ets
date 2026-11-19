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

export default function ClockTime1Logic(): void {
  describe('ClockTime1Logic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1446
     * @tc.name MultiMedia_Clock_1446
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1446', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1446';
      LogicTestLog.begin(name, 'hour=0;minute=0;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 0, 0);
      const duration: string = getDurationString(0);
      LogicTestLog.value(name, 'clock filename', String('000000'), String(time));
      expect(time).assertEqual('000000');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('00:00'), String(duration));
      expect(duration).assertEqual('00:00');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1447
     * @tc.name MultiMedia_Clock_1447
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1447', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1447';
      LogicTestLog.begin(name, 'hour=0;minute=0;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 0, 9);
      const duration: string = getDurationString(9000);
      LogicTestLog.value(name, 'clock filename', String('000009'), String(time));
      expect(time).assertEqual('000009');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('00:09'), String(duration));
      expect(duration).assertEqual('00:09');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('000009'), String(dateTime.concatTime(0, 0, 9)));
      expect(dateTime.concatTime(0, 0, 9)).assertEqual('000009');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1448
     * @tc.name MultiMedia_Clock_1448
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1448', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1448';
      LogicTestLog.begin(name, 'hour=0;minute=0;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 0, 10);
      const duration: string = getDurationString(10000);
      LogicTestLog.value(name, 'clock filename', String('000010'), String(time));
      expect(time).assertEqual('000010');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('00:10'), String(duration));
      expect(duration).assertEqual('00:10');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('000010'), String(dateTime.concatTime(0, 0, 10)));
      expect(dateTime.concatTime(0, 0, 10)).assertEqual('000010');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1449
     * @tc.name MultiMedia_Clock_1449
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1449', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1449';
      LogicTestLog.begin(name, 'hour=0;minute=0;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 0, 59);
      const duration: string = getDurationString(59000);
      LogicTestLog.value(name, 'clock filename', String('000059'), String(time));
      expect(time).assertEqual('000059');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('00:59'), String(duration));
      expect(duration).assertEqual('00:59');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('000059'), String(dateTime.concatTime(0, 0, 59)));
      expect(dateTime.concatTime(0, 0, 59)).assertEqual('000059');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1450
     * @tc.name MultiMedia_Clock_1450
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1450', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1450';
      LogicTestLog.begin(name, 'hour=0;minute=9;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 9, 0);
      const duration: string = getDurationString(540000);
      LogicTestLog.value(name, 'clock filename', String('000900'), String(time));
      expect(time).assertEqual('000900');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('09:00'), String(duration));
      expect(duration).assertEqual('09:00');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('000900'), String(dateTime.concatTime(0, 9, 0)));
      expect(dateTime.concatTime(0, 9, 0)).assertEqual('000900');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1451
     * @tc.name MultiMedia_Clock_1451
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1451', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1451';
      LogicTestLog.begin(name, 'hour=0;minute=9;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 9, 9);
      const duration: string = getDurationString(549000);
      LogicTestLog.value(name, 'clock filename', String('000909'), String(time));
      expect(time).assertEqual('000909');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('09:09'), String(duration));
      expect(duration).assertEqual('09:09');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('000909'), String(dateTime.concatTime(0, 9, 9)));
      expect(dateTime.concatTime(0, 9, 9)).assertEqual('000909');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1452
     * @tc.name MultiMedia_Clock_1452
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1452', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1452';
      LogicTestLog.begin(name, 'hour=0;minute=9;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 9, 10);
      const duration: string = getDurationString(550000);
      LogicTestLog.value(name, 'clock filename', String('000910'), String(time));
      expect(time).assertEqual('000910');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('09:10'), String(duration));
      expect(duration).assertEqual('09:10');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('000910'), String(dateTime.concatTime(0, 9, 10)));
      expect(dateTime.concatTime(0, 9, 10)).assertEqual('000910');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1453
     * @tc.name MultiMedia_Clock_1453
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1453', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1453';
      LogicTestLog.begin(name, 'hour=0;minute=9;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 9, 59);
      const duration: string = getDurationString(599000);
      LogicTestLog.value(name, 'clock filename', String('000959'), String(time));
      expect(time).assertEqual('000959');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('09:59'), String(duration));
      expect(duration).assertEqual('09:59');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('000959'), String(dateTime.concatTime(0, 9, 59)));
      expect(dateTime.concatTime(0, 9, 59)).assertEqual('000959');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1454
     * @tc.name MultiMedia_Clock_1454
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1454', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1454';
      LogicTestLog.begin(name, 'hour=0;minute=10;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 10, 0);
      const duration: string = getDurationString(600000);
      LogicTestLog.value(name, 'clock filename', String('001000'), String(time));
      expect(time).assertEqual('001000');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('10:00'), String(duration));
      expect(duration).assertEqual('10:00');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('001000'), String(dateTime.concatTime(0, 10, 0)));
      expect(dateTime.concatTime(0, 10, 0)).assertEqual('001000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1455
     * @tc.name MultiMedia_Clock_1455
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1455', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1455';
      LogicTestLog.begin(name, 'hour=0;minute=10;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 10, 9);
      const duration: string = getDurationString(609000);
      LogicTestLog.value(name, 'clock filename', String('001009'), String(time));
      expect(time).assertEqual('001009');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('10:09'), String(duration));
      expect(duration).assertEqual('10:09');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('001009'), String(dateTime.concatTime(0, 10, 9)));
      expect(dateTime.concatTime(0, 10, 9)).assertEqual('001009');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1456
     * @tc.name MultiMedia_Clock_1456
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1456', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1456';
      LogicTestLog.begin(name, 'hour=0;minute=10;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 10, 10);
      const duration: string = getDurationString(610000);
      LogicTestLog.value(name, 'clock filename', String('001010'), String(time));
      expect(time).assertEqual('001010');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('10:10'), String(duration));
      expect(duration).assertEqual('10:10');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('001010'), String(dateTime.concatTime(0, 10, 10)));
      expect(dateTime.concatTime(0, 10, 10)).assertEqual('001010');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1457
     * @tc.name MultiMedia_Clock_1457
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1457', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1457';
      LogicTestLog.begin(name, 'hour=0;minute=10;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 10, 59);
      const duration: string = getDurationString(659000);
      LogicTestLog.value(name, 'clock filename', String('001059'), String(time));
      expect(time).assertEqual('001059');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('10:59'), String(duration));
      expect(duration).assertEqual('10:59');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('001059'), String(dateTime.concatTime(0, 10, 59)));
      expect(dateTime.concatTime(0, 10, 59)).assertEqual('001059');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1458
     * @tc.name MultiMedia_Clock_1458
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1458', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1458';
      LogicTestLog.begin(name, 'hour=0;minute=59;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 59, 0);
      const duration: string = getDurationString(3540000);
      LogicTestLog.value(name, 'clock filename', String('005900'), String(time));
      expect(time).assertEqual('005900');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('59:00'), String(duration));
      expect(duration).assertEqual('59:00');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('005900'), String(dateTime.concatTime(0, 59, 0)));
      expect(dateTime.concatTime(0, 59, 0)).assertEqual('005900');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1459
     * @tc.name MultiMedia_Clock_1459
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1459', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1459';
      LogicTestLog.begin(name, 'hour=0;minute=59;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 59, 9);
      const duration: string = getDurationString(3549000);
      LogicTestLog.value(name, 'clock filename', String('005909'), String(time));
      expect(time).assertEqual('005909');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('59:09'), String(duration));
      expect(duration).assertEqual('59:09');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('005909'), String(dateTime.concatTime(0, 59, 9)));
      expect(dateTime.concatTime(0, 59, 9)).assertEqual('005909');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1460
     * @tc.name MultiMedia_Clock_1460
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1460', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1460';
      LogicTestLog.begin(name, 'hour=0;minute=59;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 59, 10);
      const duration: string = getDurationString(3550000);
      LogicTestLog.value(name, 'clock filename', String('005910'), String(time));
      expect(time).assertEqual('005910');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('59:10'), String(duration));
      expect(duration).assertEqual('59:10');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('005910'), String(dateTime.concatTime(0, 59, 10)));
      expect(dateTime.concatTime(0, 59, 10)).assertEqual('005910');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1461
     * @tc.name MultiMedia_Clock_1461
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1461', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1461';
      LogicTestLog.begin(name, 'hour=0;minute=59;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(0, 59, 59);
      const duration: string = getDurationString(3599000);
      LogicTestLog.value(name, 'clock filename', String('005959'), String(time));
      expect(time).assertEqual('005959');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('00'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('00');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('59:59'), String(duration));
      expect(duration).assertEqual('59:59');
      LogicTestLog.number(name, 'elapsed width', 5, duration.length);
      expect(duration.length).assertEqual(5);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('005959'), String(dateTime.concatTime(0, 59, 59)));
      expect(dateTime.concatTime(0, 59, 59)).assertEqual('005959');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1462
     * @tc.name MultiMedia_Clock_1462
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1462', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1462';
      LogicTestLog.begin(name, 'hour=9;minute=0;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 0, 0);
      const duration: string = getDurationString(32400000);
      LogicTestLog.value(name, 'clock filename', String('090000'), String(time));
      expect(time).assertEqual('090000');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('09:00:00'), String(duration));
      expect(duration).assertEqual('09:00:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('090000'), String(dateTime.concatTime(9, 0, 0)));
      expect(dateTime.concatTime(9, 0, 0)).assertEqual('090000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1463
     * @tc.name MultiMedia_Clock_1463
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1463', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1463';
      LogicTestLog.begin(name, 'hour=9;minute=0;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 0, 9);
      const duration: string = getDurationString(32409000);
      LogicTestLog.value(name, 'clock filename', String('090009'), String(time));
      expect(time).assertEqual('090009');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('09:00:09'), String(duration));
      expect(duration).assertEqual('09:00:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('090009'), String(dateTime.concatTime(9, 0, 9)));
      expect(dateTime.concatTime(9, 0, 9)).assertEqual('090009');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1464
     * @tc.name MultiMedia_Clock_1464
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1464', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1464';
      LogicTestLog.begin(name, 'hour=9;minute=0;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 0, 10);
      const duration: string = getDurationString(32410000);
      LogicTestLog.value(name, 'clock filename', String('090010'), String(time));
      expect(time).assertEqual('090010');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('09:00:10'), String(duration));
      expect(duration).assertEqual('09:00:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('090010'), String(dateTime.concatTime(9, 0, 10)));
      expect(dateTime.concatTime(9, 0, 10)).assertEqual('090010');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1465
     * @tc.name MultiMedia_Clock_1465
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1465', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1465';
      LogicTestLog.begin(name, 'hour=9;minute=0;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 0, 59);
      const duration: string = getDurationString(32459000);
      LogicTestLog.value(name, 'clock filename', String('090059'), String(time));
      expect(time).assertEqual('090059');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('09:00:59'), String(duration));
      expect(duration).assertEqual('09:00:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('090059'), String(dateTime.concatTime(9, 0, 59)));
      expect(dateTime.concatTime(9, 0, 59)).assertEqual('090059');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1466
     * @tc.name MultiMedia_Clock_1466
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1466', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1466';
      LogicTestLog.begin(name, 'hour=9;minute=9;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 9, 0);
      const duration: string = getDurationString(32940000);
      LogicTestLog.value(name, 'clock filename', String('090900'), String(time));
      expect(time).assertEqual('090900');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('09:09:00'), String(duration));
      expect(duration).assertEqual('09:09:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('090900'), String(dateTime.concatTime(9, 9, 0)));
      expect(dateTime.concatTime(9, 9, 0)).assertEqual('090900');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1467
     * @tc.name MultiMedia_Clock_1467
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1467', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1467';
      LogicTestLog.begin(name, 'hour=9;minute=9;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 9, 9);
      const duration: string = getDurationString(32949000);
      LogicTestLog.value(name, 'clock filename', String('090909'), String(time));
      expect(time).assertEqual('090909');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('09:09:09'), String(duration));
      expect(duration).assertEqual('09:09:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('090909'), String(dateTime.concatTime(9, 9, 9)));
      expect(dateTime.concatTime(9, 9, 9)).assertEqual('090909');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1468
     * @tc.name MultiMedia_Clock_1468
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1468', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1468';
      LogicTestLog.begin(name, 'hour=9;minute=9;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 9, 10);
      const duration: string = getDurationString(32950000);
      LogicTestLog.value(name, 'clock filename', String('090910'), String(time));
      expect(time).assertEqual('090910');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('09:09:10'), String(duration));
      expect(duration).assertEqual('09:09:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('090910'), String(dateTime.concatTime(9, 9, 10)));
      expect(dateTime.concatTime(9, 9, 10)).assertEqual('090910');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1469
     * @tc.name MultiMedia_Clock_1469
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1469', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1469';
      LogicTestLog.begin(name, 'hour=9;minute=9;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 9, 59);
      const duration: string = getDurationString(32999000);
      LogicTestLog.value(name, 'clock filename', String('090959'), String(time));
      expect(time).assertEqual('090959');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('09:09:59'), String(duration));
      expect(duration).assertEqual('09:09:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('090959'), String(dateTime.concatTime(9, 9, 59)));
      expect(dateTime.concatTime(9, 9, 59)).assertEqual('090959');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1470
     * @tc.name MultiMedia_Clock_1470
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1470', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1470';
      LogicTestLog.begin(name, 'hour=9;minute=10;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 10, 0);
      const duration: string = getDurationString(33000000);
      LogicTestLog.value(name, 'clock filename', String('091000'), String(time));
      expect(time).assertEqual('091000');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('09:10:00'), String(duration));
      expect(duration).assertEqual('09:10:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('091000'), String(dateTime.concatTime(9, 10, 0)));
      expect(dateTime.concatTime(9, 10, 0)).assertEqual('091000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1471
     * @tc.name MultiMedia_Clock_1471
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1471', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1471';
      LogicTestLog.begin(name, 'hour=9;minute=10;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 10, 9);
      const duration: string = getDurationString(33009000);
      LogicTestLog.value(name, 'clock filename', String('091009'), String(time));
      expect(time).assertEqual('091009');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('09:10:09'), String(duration));
      expect(duration).assertEqual('09:10:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('091009'), String(dateTime.concatTime(9, 10, 9)));
      expect(dateTime.concatTime(9, 10, 9)).assertEqual('091009');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1472
     * @tc.name MultiMedia_Clock_1472
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1472', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1472';
      LogicTestLog.begin(name, 'hour=9;minute=10;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 10, 10);
      const duration: string = getDurationString(33010000);
      LogicTestLog.value(name, 'clock filename', String('091010'), String(time));
      expect(time).assertEqual('091010');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('09:10:10'), String(duration));
      expect(duration).assertEqual('09:10:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('091010'), String(dateTime.concatTime(9, 10, 10)));
      expect(dateTime.concatTime(9, 10, 10)).assertEqual('091010');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1473
     * @tc.name MultiMedia_Clock_1473
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1473', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1473';
      LogicTestLog.begin(name, 'hour=9;minute=10;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 10, 59);
      const duration: string = getDurationString(33059000);
      LogicTestLog.value(name, 'clock filename', String('091059'), String(time));
      expect(time).assertEqual('091059');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('09:10:59'), String(duration));
      expect(duration).assertEqual('09:10:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('091059'), String(dateTime.concatTime(9, 10, 59)));
      expect(dateTime.concatTime(9, 10, 59)).assertEqual('091059');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1474
     * @tc.name MultiMedia_Clock_1474
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1474', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1474';
      LogicTestLog.begin(name, 'hour=9;minute=59;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 59, 0);
      const duration: string = getDurationString(35940000);
      LogicTestLog.value(name, 'clock filename', String('095900'), String(time));
      expect(time).assertEqual('095900');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('09:59:00'), String(duration));
      expect(duration).assertEqual('09:59:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('095900'), String(dateTime.concatTime(9, 59, 0)));
      expect(dateTime.concatTime(9, 59, 0)).assertEqual('095900');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1475
     * @tc.name MultiMedia_Clock_1475
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1475', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1475';
      LogicTestLog.begin(name, 'hour=9;minute=59;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 59, 9);
      const duration: string = getDurationString(35949000);
      LogicTestLog.value(name, 'clock filename', String('095909'), String(time));
      expect(time).assertEqual('095909');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('09:59:09'), String(duration));
      expect(duration).assertEqual('09:59:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('095909'), String(dateTime.concatTime(9, 59, 9)));
      expect(dateTime.concatTime(9, 59, 9)).assertEqual('095909');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1476
     * @tc.name MultiMedia_Clock_1476
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1476', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1476';
      LogicTestLog.begin(name, 'hour=9;minute=59;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 59, 10);
      const duration: string = getDurationString(35950000);
      LogicTestLog.value(name, 'clock filename', String('095910'), String(time));
      expect(time).assertEqual('095910');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('09:59:10'), String(duration));
      expect(duration).assertEqual('09:59:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('095910'), String(dateTime.concatTime(9, 59, 10)));
      expect(dateTime.concatTime(9, 59, 10)).assertEqual('095910');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1477
     * @tc.name MultiMedia_Clock_1477
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1477', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1477';
      LogicTestLog.begin(name, 'hour=9;minute=59;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(9, 59, 59);
      const duration: string = getDurationString(35999000);
      LogicTestLog.value(name, 'clock filename', String('095959'), String(time));
      expect(time).assertEqual('095959');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('09'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('09');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('09:59:59'), String(duration));
      expect(duration).assertEqual('09:59:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('095959'), String(dateTime.concatTime(9, 59, 59)));
      expect(dateTime.concatTime(9, 59, 59)).assertEqual('095959');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1478
     * @tc.name MultiMedia_Clock_1478
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1478', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1478';
      LogicTestLog.begin(name, 'hour=10;minute=0;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(10, 0, 0);
      const duration: string = getDurationString(36000000);
      LogicTestLog.value(name, 'clock filename', String('100000'), String(time));
      expect(time).assertEqual('100000');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('10'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('10');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('10:00:00'), String(duration));
      expect(duration).assertEqual('10:00:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('100000'), String(dateTime.concatTime(10, 0, 0)));
      expect(dateTime.concatTime(10, 0, 0)).assertEqual('100000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1479
     * @tc.name MultiMedia_Clock_1479
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1479', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1479';
      LogicTestLog.begin(name, 'hour=10;minute=0;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(10, 0, 9);
      const duration: string = getDurationString(36009000);
      LogicTestLog.value(name, 'clock filename', String('100009'), String(time));
      expect(time).assertEqual('100009');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('10'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('10');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('10:00:09'), String(duration));
      expect(duration).assertEqual('10:00:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('100009'), String(dateTime.concatTime(10, 0, 9)));
      expect(dateTime.concatTime(10, 0, 9)).assertEqual('100009');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1480
     * @tc.name MultiMedia_Clock_1480
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1480', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1480';
      LogicTestLog.begin(name, 'hour=10;minute=0;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(10, 0, 10);
      const duration: string = getDurationString(36010000);
      LogicTestLog.value(name, 'clock filename', String('100010'), String(time));
      expect(time).assertEqual('100010');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('10'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('10');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('10:00:10'), String(duration));
      expect(duration).assertEqual('10:00:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('100010'), String(dateTime.concatTime(10, 0, 10)));
      expect(dateTime.concatTime(10, 0, 10)).assertEqual('100010');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1481
     * @tc.name MultiMedia_Clock_1481
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1481', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1481';
      LogicTestLog.begin(name, 'hour=10;minute=0;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(10, 0, 59);
      const duration: string = getDurationString(36059000);
      LogicTestLog.value(name, 'clock filename', String('100059'), String(time));
      expect(time).assertEqual('100059');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('10'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('10');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('10:00:59'), String(duration));
      expect(duration).assertEqual('10:00:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('100059'), String(dateTime.concatTime(10, 0, 59)));
      expect(dateTime.concatTime(10, 0, 59)).assertEqual('100059');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1482
     * @tc.name MultiMedia_Clock_1482
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1482', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1482';
      LogicTestLog.begin(name, 'hour=10;minute=9;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(10, 9, 0);
      const duration: string = getDurationString(36540000);
      LogicTestLog.value(name, 'clock filename', String('100900'), String(time));
      expect(time).assertEqual('100900');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('10'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('10');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));