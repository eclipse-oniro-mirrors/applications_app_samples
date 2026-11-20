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

export default function CalendarDate2Logic(): void {
  describe('CalendarDate2Logic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1434
     * @tc.name MultiMedia_Date_1434
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1434', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1434';
      LogicTestLog.begin(name, 'year=2026;month=7;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 7, 1);
      LogicTestLog.value(name, 'filename date', String('20260701'), String(formatted));
      expect(formatted).assertEqual('20260701');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('07'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('07');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260701'), String(dateTime.concatDate(2026, 7, 1)));
      expect(dateTime.concatDate(2026, 7, 1)).assertEqual('20260701');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1435
     * @tc.name MultiMedia_Date_1435
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1435', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1435';
      LogicTestLog.begin(name, 'year=2026;month=7;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 7, 31);
      LogicTestLog.value(name, 'filename date', String('20260731'), String(formatted));
      expect(formatted).assertEqual('20260731');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('07'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('07');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260731'), String(dateTime.concatDate(2026, 7, 31)));
      expect(dateTime.concatDate(2026, 7, 31)).assertEqual('20260731');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1436
     * @tc.name MultiMedia_Date_1436
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1436', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1436';
      LogicTestLog.begin(name, 'year=2026;month=8;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 8, 1);
      LogicTestLog.value(name, 'filename date', String('20260801'), String(formatted));
      expect(formatted).assertEqual('20260801');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('08'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('08');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260801'), String(dateTime.concatDate(2026, 8, 1)));
      expect(dateTime.concatDate(2026, 8, 1)).assertEqual('20260801');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1437
     * @tc.name MultiMedia_Date_1437
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1437', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1437';
      LogicTestLog.begin(name, 'year=2026;month=8;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 8, 31);
      LogicTestLog.value(name, 'filename date', String('20260831'), String(formatted));
      expect(formatted).assertEqual('20260831');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('08'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('08');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260831'), String(dateTime.concatDate(2026, 8, 31)));
      expect(dateTime.concatDate(2026, 8, 31)).assertEqual('20260831');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1438
     * @tc.name MultiMedia_Date_1438
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1438', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1438';
      LogicTestLog.begin(name, 'year=2026;month=9;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 9, 1);
      LogicTestLog.value(name, 'filename date', String('20260901'), String(formatted));
      expect(formatted).assertEqual('20260901');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('09'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260901'), String(dateTime.concatDate(2026, 9, 1)));
      expect(dateTime.concatDate(2026, 9, 1)).assertEqual('20260901');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1439
     * @tc.name MultiMedia_Date_1439
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1439', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1439';
      LogicTestLog.begin(name, 'year=2026;month=9;day=30');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 9, 30);
      LogicTestLog.value(name, 'filename date', String('20260930'), String(formatted));
      expect(formatted).assertEqual('20260930');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('09'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'day component', String('30'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('30');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260930'), String(dateTime.concatDate(2026, 9, 30)));
      expect(dateTime.concatDate(2026, 9, 30)).assertEqual('20260930');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1440
     * @tc.name MultiMedia_Date_1440
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1440', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1440';
      LogicTestLog.begin(name, 'year=2026;month=10;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 10, 1);
      LogicTestLog.value(name, 'filename date', String('20261001'), String(formatted));
      expect(formatted).assertEqual('20261001');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('10'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20261001'), String(dateTime.concatDate(2026, 10, 1)));
      expect(dateTime.concatDate(2026, 10, 1)).assertEqual('20261001');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1441
     * @tc.name MultiMedia_Date_1441
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1441', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1441';
      LogicTestLog.begin(name, 'year=2026;month=10;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 10, 31);
      LogicTestLog.value(name, 'filename date', String('20261031'), String(formatted));
      expect(formatted).assertEqual('20261031');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('10'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable',
        String('20261031'),
        String(dateTime.concatDate(2026, 10, 31)));
      expect(dateTime.concatDate(2026, 10, 31)).assertEqual('20261031');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1442
     * @tc.name MultiMedia_Date_1442
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1442', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1442';
      LogicTestLog.begin(name, 'year=2026;month=11;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 11, 1);
      LogicTestLog.value(name, 'filename date', String('20261101'), String(formatted));
      expect(formatted).assertEqual('20261101');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('11'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('11');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20261101'), String(dateTime.concatDate(2026, 11, 1)));
      expect(dateTime.concatDate(2026, 11, 1)).assertEqual('20261101');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1443
     * @tc.name MultiMedia_Date_1443
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1443', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1443';
      LogicTestLog.begin(name, 'year=2026;month=11;day=30');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 11, 30);
      LogicTestLog.value(name, 'filename date', String('20261130'), String(formatted));
      expect(formatted).assertEqual('20261130');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('11'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('11');
      LogicTestLog.value(name, 'day component', String('30'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('30');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable',
        String('20261130'),
        String(dateTime.concatDate(2026, 11, 30)));
      expect(dateTime.concatDate(2026, 11, 30)).assertEqual('20261130');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1444
     * @tc.name MultiMedia_Date_1444
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1444', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1444';
      LogicTestLog.begin(name, 'year=2026;month=12;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 12, 1);
      LogicTestLog.value(name, 'filename date', String('20261201'), String(formatted));
      expect(formatted).assertEqual('20261201');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('12'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('12');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20261201'), String(dateTime.concatDate(2026, 12, 1)));
      expect(dateTime.concatDate(2026, 12, 1)).assertEqual('20261201');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1445
     * @tc.name MultiMedia_Date_1445
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1445', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1445';
      LogicTestLog.begin(name, 'year=2026;month=12;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 12, 31);
      LogicTestLog.value(name, 'filename date', String('20261231'), String(formatted));
      expect(formatted).assertEqual('20261231');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('12'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('12');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable',
        String('20261231'),
        String(dateTime.concatDate(2026, 12, 31)));
      expect(dateTime.concatDate(2026, 12, 31)).assertEqual('20261231');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });
  });
}
