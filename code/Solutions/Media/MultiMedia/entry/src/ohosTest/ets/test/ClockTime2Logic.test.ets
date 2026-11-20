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

export default function ClockTime2Logic(): void {
  describe('ClockTime2Logic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1510
     * @tc.name MultiMedia_Clock_1510
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1510', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1510';
      LogicTestLog.begin(name, 'hour=22;minute=0;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 0, 0);
      const duration: string = getDurationString(79200000);
      LogicTestLog.value(name, 'clock filename', String('220000'), String(time));
      expect(time).assertEqual('220000');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('22:00:00'), String(duration));
      expect(duration).assertEqual('22:00:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('220000'), String(dateTime.concatTime(22, 0, 0)));
      expect(dateTime.concatTime(22, 0, 0)).assertEqual('220000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1511
     * @tc.name MultiMedia_Clock_1511
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1511', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1511';
      LogicTestLog.begin(name, 'hour=22;minute=0;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 0, 9);
      const duration: string = getDurationString(79209000);
      LogicTestLog.value(name, 'clock filename', String('220009'), String(time));
      expect(time).assertEqual('220009');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('22:00:09'), String(duration));
      expect(duration).assertEqual('22:00:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('220009'), String(dateTime.concatTime(22, 0, 9)));
      expect(dateTime.concatTime(22, 0, 9)).assertEqual('220009');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1512
     * @tc.name MultiMedia_Clock_1512
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1512', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1512';
      LogicTestLog.begin(name, 'hour=22;minute=0;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 0, 10);
      const duration: string = getDurationString(79210000);
      LogicTestLog.value(name, 'clock filename', String('220010'), String(time));
      expect(time).assertEqual('220010');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('22:00:10'), String(duration));
      expect(duration).assertEqual('22:00:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('220010'), String(dateTime.concatTime(22, 0, 10)));
      expect(dateTime.concatTime(22, 0, 10)).assertEqual('220010');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1513
     * @tc.name MultiMedia_Clock_1513
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1513', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1513';
      LogicTestLog.begin(name, 'hour=22;minute=0;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 0, 59);
      const duration: string = getDurationString(79259000);
      LogicTestLog.value(name, 'clock filename', String('220059'), String(time));
      expect(time).assertEqual('220059');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('22:00:59'), String(duration));
      expect(duration).assertEqual('22:00:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('220059'), String(dateTime.concatTime(22, 0, 59)));
      expect(dateTime.concatTime(22, 0, 59)).assertEqual('220059');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1514
     * @tc.name MultiMedia_Clock_1514
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1514', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1514';
      LogicTestLog.begin(name, 'hour=22;minute=9;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 9, 0);
      const duration: string = getDurationString(79740000);
      LogicTestLog.value(name, 'clock filename', String('220900'), String(time));
      expect(time).assertEqual('220900');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('22:09:00'), String(duration));
      expect(duration).assertEqual('22:09:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('220900'), String(dateTime.concatTime(22, 9, 0)));
      expect(dateTime.concatTime(22, 9, 0)).assertEqual('220900');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1515
     * @tc.name MultiMedia_Clock_1515
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1515', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1515';
      LogicTestLog.begin(name, 'hour=22;minute=9;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 9, 9);
      const duration: string = getDurationString(79749000);
      LogicTestLog.value(name, 'clock filename', String('220909'), String(time));
      expect(time).assertEqual('220909');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('22:09:09'), String(duration));
      expect(duration).assertEqual('22:09:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('220909'), String(dateTime.concatTime(22, 9, 9)));
      expect(dateTime.concatTime(22, 9, 9)).assertEqual('220909');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1516
     * @tc.name MultiMedia_Clock_1516
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1516', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1516';
      LogicTestLog.begin(name, 'hour=22;minute=9;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 9, 10);
      const duration: string = getDurationString(79750000);
      LogicTestLog.value(name, 'clock filename', String('220910'), String(time));
      expect(time).assertEqual('220910');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('22:09:10'), String(duration));
      expect(duration).assertEqual('22:09:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('220910'), String(dateTime.concatTime(22, 9, 10)));
      expect(dateTime.concatTime(22, 9, 10)).assertEqual('220910');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1517
     * @tc.name MultiMedia_Clock_1517
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1517', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1517';
      LogicTestLog.begin(name, 'hour=22;minute=9;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 9, 59);
      const duration: string = getDurationString(79799000);
      LogicTestLog.value(name, 'clock filename', String('220959'), String(time));
      expect(time).assertEqual('220959');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('22:09:59'), String(duration));
      expect(duration).assertEqual('22:09:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('220959'), String(dateTime.concatTime(22, 9, 59)));
      expect(dateTime.concatTime(22, 9, 59)).assertEqual('220959');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1518
     * @tc.name MultiMedia_Clock_1518
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1518', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1518';
      LogicTestLog.begin(name, 'hour=22;minute=10;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 10, 0);
      const duration: string = getDurationString(79800000);
      LogicTestLog.value(name, 'clock filename', String('221000'), String(time));
      expect(time).assertEqual('221000');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('22:10:00'), String(duration));
      expect(duration).assertEqual('22:10:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('221000'), String(dateTime.concatTime(22, 10, 0)));
      expect(dateTime.concatTime(22, 10, 0)).assertEqual('221000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1519
     * @tc.name MultiMedia_Clock_1519
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1519', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1519';
      LogicTestLog.begin(name, 'hour=22;minute=10;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 10, 9);
      const duration: string = getDurationString(79809000);
      LogicTestLog.value(name, 'clock filename', String('221009'), String(time));
      expect(time).assertEqual('221009');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('22:10:09'), String(duration));
      expect(duration).assertEqual('22:10:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('221009'), String(dateTime.concatTime(22, 10, 9)));
      expect(dateTime.concatTime(22, 10, 9)).assertEqual('221009');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1520
     * @tc.name MultiMedia_Clock_1520
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1520', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1520';
      LogicTestLog.begin(name, 'hour=22;minute=10;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 10, 10);
      const duration: string = getDurationString(79810000);
      LogicTestLog.value(name, 'clock filename', String('221010'), String(time));
      expect(time).assertEqual('221010');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('22:10:10'), String(duration));
      expect(duration).assertEqual('22:10:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('221010'), String(dateTime.concatTime(22, 10, 10)));
      expect(dateTime.concatTime(22, 10, 10)).assertEqual('221010');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1521
     * @tc.name MultiMedia_Clock_1521
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1521', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1521';
      LogicTestLog.begin(name, 'hour=22;minute=10;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 10, 59);
      const duration: string = getDurationString(79859000);
      LogicTestLog.value(name, 'clock filename', String('221059'), String(time));
      expect(time).assertEqual('221059');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('22:10:59'), String(duration));
      expect(duration).assertEqual('22:10:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('221059'), String(dateTime.concatTime(22, 10, 59)));
      expect(dateTime.concatTime(22, 10, 59)).assertEqual('221059');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1522
     * @tc.name MultiMedia_Clock_1522
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1522', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1522';
      LogicTestLog.begin(name, 'hour=22;minute=59;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 59, 0);
      const duration: string = getDurationString(82740000);
      LogicTestLog.value(name, 'clock filename', String('225900'), String(time));
      expect(time).assertEqual('225900');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('22:59:00'), String(duration));
      expect(duration).assertEqual('22:59:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('225900'), String(dateTime.concatTime(22, 59, 0)));
      expect(dateTime.concatTime(22, 59, 0)).assertEqual('225900');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1523
     * @tc.name MultiMedia_Clock_1523
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1523', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1523';
      LogicTestLog.begin(name, 'hour=22;minute=59;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 59, 9);
      const duration: string = getDurationString(82749000);
      LogicTestLog.value(name, 'clock filename', String('225909'), String(time));
      expect(time).assertEqual('225909');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('22:59:09'), String(duration));
      expect(duration).assertEqual('22:59:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('225909'), String(dateTime.concatTime(22, 59, 9)));
      expect(dateTime.concatTime(22, 59, 9)).assertEqual('225909');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1524
     * @tc.name MultiMedia_Clock_1524
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1524', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1524';
      LogicTestLog.begin(name, 'hour=22;minute=59;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 59, 10);
      const duration: string = getDurationString(82750000);
      LogicTestLog.value(name, 'clock filename', String('225910'), String(time));
      expect(time).assertEqual('225910');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('22:59:10'), String(duration));
      expect(duration).assertEqual('22:59:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('225910'), String(dateTime.concatTime(22, 59, 10)));
      expect(dateTime.concatTime(22, 59, 10)).assertEqual('225910');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1525
     * @tc.name MultiMedia_Clock_1525
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1525', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1525';
      LogicTestLog.begin(name, 'hour=22;minute=59;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(22, 59, 59);
      const duration: string = getDurationString(82799000);
      LogicTestLog.value(name, 'clock filename', String('225959'), String(time));
      expect(time).assertEqual('225959');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('22'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('22');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('22:59:59'), String(duration));
      expect(duration).assertEqual('22:59:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('225959'), String(dateTime.concatTime(22, 59, 59)));
      expect(dateTime.concatTime(22, 59, 59)).assertEqual('225959');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1526
     * @tc.name MultiMedia_Clock_1526
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1526', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1526';
      LogicTestLog.begin(name, 'hour=23;minute=0;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 0, 0);
      const duration: string = getDurationString(82800000);
      LogicTestLog.value(name, 'clock filename', String('230000'), String(time));
      expect(time).assertEqual('230000');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('23:00:00'), String(duration));
      expect(duration).assertEqual('23:00:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('230000'), String(dateTime.concatTime(23, 0, 0)));
      expect(dateTime.concatTime(23, 0, 0)).assertEqual('230000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1527
     * @tc.name MultiMedia_Clock_1527
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1527', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1527';
      LogicTestLog.begin(name, 'hour=23;minute=0;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 0, 9);
      const duration: string = getDurationString(82809000);
      LogicTestLog.value(name, 'clock filename', String('230009'), String(time));
      expect(time).assertEqual('230009');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('23:00:09'), String(duration));
      expect(duration).assertEqual('23:00:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('230009'), String(dateTime.concatTime(23, 0, 9)));
      expect(dateTime.concatTime(23, 0, 9)).assertEqual('230009');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1528
     * @tc.name MultiMedia_Clock_1528
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1528', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1528';
      LogicTestLog.begin(name, 'hour=23;minute=0;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 0, 10);
      const duration: string = getDurationString(82810000);
      LogicTestLog.value(name, 'clock filename', String('230010'), String(time));
      expect(time).assertEqual('230010');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('23:00:10'), String(duration));
      expect(duration).assertEqual('23:00:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('230010'), String(dateTime.concatTime(23, 0, 10)));
      expect(dateTime.concatTime(23, 0, 10)).assertEqual('230010');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1529
     * @tc.name MultiMedia_Clock_1529
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1529', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1529';
      LogicTestLog.begin(name, 'hour=23;minute=0;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 0, 59);
      const duration: string = getDurationString(82859000);
      LogicTestLog.value(name, 'clock filename', String('230059'), String(time));
      expect(time).assertEqual('230059');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('00'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('00');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('23:00:59'), String(duration));
      expect(duration).assertEqual('23:00:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('230059'), String(dateTime.concatTime(23, 0, 59)));
      expect(dateTime.concatTime(23, 0, 59)).assertEqual('230059');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1530
     * @tc.name MultiMedia_Clock_1530
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1530', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1530';
      LogicTestLog.begin(name, 'hour=23;minute=9;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 9, 0);
      const duration: string = getDurationString(83340000);
      LogicTestLog.value(name, 'clock filename', String('230900'), String(time));
      expect(time).assertEqual('230900');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('23:09:00'), String(duration));
      expect(duration).assertEqual('23:09:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('230900'), String(dateTime.concatTime(23, 9, 0)));
      expect(dateTime.concatTime(23, 9, 0)).assertEqual('230900');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1531
     * @tc.name MultiMedia_Clock_1531
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1531', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1531';
      LogicTestLog.begin(name, 'hour=23;minute=9;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 9, 9);
      const duration: string = getDurationString(83349000);
      LogicTestLog.value(name, 'clock filename', String('230909'), String(time));
      expect(time).assertEqual('230909');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('23:09:09'), String(duration));
      expect(duration).assertEqual('23:09:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('230909'), String(dateTime.concatTime(23, 9, 9)));
      expect(dateTime.concatTime(23, 9, 9)).assertEqual('230909');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1532
     * @tc.name MultiMedia_Clock_1532
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1532', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1532';
      LogicTestLog.begin(name, 'hour=23;minute=9;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 9, 10);
      const duration: string = getDurationString(83350000);
      LogicTestLog.value(name, 'clock filename', String('230910'), String(time));
      expect(time).assertEqual('230910');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('23:09:10'), String(duration));
      expect(duration).assertEqual('23:09:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('230910'), String(dateTime.concatTime(23, 9, 10)));
      expect(dateTime.concatTime(23, 9, 10)).assertEqual('230910');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1533
     * @tc.name MultiMedia_Clock_1533
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1533', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1533';
      LogicTestLog.begin(name, 'hour=23;minute=9;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 9, 59);
      const duration: string = getDurationString(83399000);
      LogicTestLog.value(name, 'clock filename', String('230959'), String(time));
      expect(time).assertEqual('230959');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('09'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('09');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('23:09:59'), String(duration));
      expect(duration).assertEqual('23:09:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('230959'), String(dateTime.concatTime(23, 9, 59)));
      expect(dateTime.concatTime(23, 9, 59)).assertEqual('230959');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1534
     * @tc.name MultiMedia_Clock_1534
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1534', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1534';
      LogicTestLog.begin(name, 'hour=23;minute=10;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 10, 0);
      const duration: string = getDurationString(83400000);
      LogicTestLog.value(name, 'clock filename', String('231000'), String(time));
      expect(time).assertEqual('231000');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('23:10:00'), String(duration));
      expect(duration).assertEqual('23:10:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('231000'), String(dateTime.concatTime(23, 10, 0)));
      expect(dateTime.concatTime(23, 10, 0)).assertEqual('231000');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1535
     * @tc.name MultiMedia_Clock_1535
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1535', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1535';
      LogicTestLog.begin(name, 'hour=23;minute=10;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 10, 9);
      const duration: string = getDurationString(83409000);
      LogicTestLog.value(name, 'clock filename', String('231009'), String(time));
      expect(time).assertEqual('231009');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('23:10:09'), String(duration));
      expect(duration).assertEqual('23:10:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('231009'), String(dateTime.concatTime(23, 10, 9)));
      expect(dateTime.concatTime(23, 10, 9)).assertEqual('231009');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1536
     * @tc.name MultiMedia_Clock_1536
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1536', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1536';
      LogicTestLog.begin(name, 'hour=23;minute=10;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 10, 10);
      const duration: string = getDurationString(83410000);
      LogicTestLog.value(name, 'clock filename', String('231010'), String(time));
      expect(time).assertEqual('231010');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('23:10:10'), String(duration));
      expect(duration).assertEqual('23:10:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('231010'), String(dateTime.concatTime(23, 10, 10)));
      expect(dateTime.concatTime(23, 10, 10)).assertEqual('231010');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1537
     * @tc.name MultiMedia_Clock_1537
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1537', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1537';
      LogicTestLog.begin(name, 'hour=23;minute=10;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 10, 59);
      const duration: string = getDurationString(83459000);
      LogicTestLog.value(name, 'clock filename', String('231059'), String(time));
      expect(time).assertEqual('231059');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('10'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('10');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('23:10:59'), String(duration));
      expect(duration).assertEqual('23:10:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('231059'), String(dateTime.concatTime(23, 10, 59)));
      expect(dateTime.concatTime(23, 10, 59)).assertEqual('231059');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1538
     * @tc.name MultiMedia_Clock_1538
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1538', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1538';
      LogicTestLog.begin(name, 'hour=23;minute=59;second=0');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 59, 0);
      const duration: string = getDurationString(86340000);
      LogicTestLog.value(name, 'clock filename', String('235900'), String(time));
      expect(time).assertEqual('235900');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('00'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('00');
      LogicTestLog.value(name, 'elapsed display', String('23:59:00'), String(duration));
      expect(duration).assertEqual('23:59:00');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('235900'), String(dateTime.concatTime(23, 59, 0)));
      expect(dateTime.concatTime(23, 59, 0)).assertEqual('235900');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1539
     * @tc.name MultiMedia_Clock_1539
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1539', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1539';
      LogicTestLog.begin(name, 'hour=23;minute=59;second=9');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 59, 9);
      const duration: string = getDurationString(86349000);
      LogicTestLog.value(name, 'clock filename', String('235909'), String(time));
      expect(time).assertEqual('235909');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('09'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'elapsed display', String('23:59:09'), String(duration));
      expect(duration).assertEqual('23:59:09');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('235909'), String(dateTime.concatTime(23, 59, 9)));
      expect(dateTime.concatTime(23, 59, 9)).assertEqual('235909');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1540
     * @tc.name MultiMedia_Clock_1540
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1540', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1540';
      LogicTestLog.begin(name, 'hour=23;minute=59;second=10');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 59, 10);
      const duration: string = getDurationString(86350000);
      LogicTestLog.value(name, 'clock filename', String('235910'), String(time));
      expect(time).assertEqual('235910');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('10'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'elapsed display', String('23:59:10'), String(duration));
      expect(duration).assertEqual('23:59:10');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('235910'), String(dateTime.concatTime(23, 59, 10)));
      expect(dateTime.concatTime(23, 59, 10)).assertEqual('235910');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1541
     * @tc.name MultiMedia_Clock_1541
     * @tc.desc Filename clock components agree with independent duration display components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Clock_1541', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Clock_1541';
      LogicTestLog.begin(name, 'hour=23;minute=59;second=59');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const time: string = dateTime.concatTime(23, 59, 59);
      const duration: string = getDurationString(86399000);
      LogicTestLog.value(name, 'clock filename', String('235959'), String(time));
      expect(time).assertEqual('235959');
      LogicTestLog.number(name, 'clock width', 6, time.length);
      expect(time.length).assertEqual(6);
      LogicTestLog.value(name, 'hours component', String('23'), String(time.substring(0, 2)));
      expect(time.substring(0, 2)).assertEqual('23');
      LogicTestLog.value(name, 'minutes component', String('59'), String(time.substring(2, 4)));
      expect(time.substring(2, 4)).assertEqual('59');
      LogicTestLog.value(name, 'seconds component', String('59'), String(time.substring(4, 6)));
      expect(time.substring(4, 6)).assertEqual('59');
      LogicTestLog.value(name, 'elapsed display', String('23:59:59'), String(duration));
      expect(duration).assertEqual('23:59:59');
      LogicTestLog.number(name, 'elapsed width', 8, duration.length);
      expect(duration.length).assertEqual(8);
      LogicTestLog.value(name, 'date interleave', String('20260109'), String(dateTime.concatDate(2026, 1, 9)));
      expect(dateTime.concatDate(2026, 1, 9)).assertEqual('20260109');
      LogicTestLog.value(name, 'clock remains repeatable', String('235959'), String(dateTime.concatTime(23, 59, 59)));
      expect(dateTime.concatTime(23, 59, 59)).assertEqual('235959');
      LogicTestLog.end(name);
    });
  });
}
