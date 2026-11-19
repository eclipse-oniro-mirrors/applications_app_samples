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

export default function CalendarDate1Logic(): void {
  describe('CalendarDate1Logic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1374
     * @tc.name MultiMedia_Date_1374
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1374', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1374';
      LogicTestLog.begin(name, 'year=2000;month=1;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 1, 1);
      LogicTestLog.value(name, 'filename date', String('20000101'), String(formatted));
      expect(formatted).assertEqual('20000101');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('01'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('01');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000101'), String(dateTime.concatDate(2000, 1, 1)));
      expect(dateTime.concatDate(2000, 1, 1)).assertEqual('20000101');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1375
     * @tc.name MultiMedia_Date_1375
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1375', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1375';
      LogicTestLog.begin(name, 'year=2000;month=1;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 1, 31);
      LogicTestLog.value(name, 'filename date', String('20000131'), String(formatted));
      expect(formatted).assertEqual('20000131');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('01'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('01');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000131'), String(dateTime.concatDate(2000, 1, 31)));
      expect(dateTime.concatDate(2000, 1, 31)).assertEqual('20000131');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1376
     * @tc.name MultiMedia_Date_1376
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1376', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1376';
      LogicTestLog.begin(name, 'year=2000;month=2;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 2, 1);
      LogicTestLog.value(name, 'filename date', String('20000201'), String(formatted));
      expect(formatted).assertEqual('20000201');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('02'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('02');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000201'), String(dateTime.concatDate(2000, 2, 1)));
      expect(dateTime.concatDate(2000, 2, 1)).assertEqual('20000201');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1377
     * @tc.name MultiMedia_Date_1377
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1377', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1377';
      LogicTestLog.begin(name, 'year=2000;month=2;day=29');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 2, 29);
      LogicTestLog.value(name, 'filename date', String('20000229'), String(formatted));
      expect(formatted).assertEqual('20000229');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('02'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('02');
      LogicTestLog.value(name, 'day component', String('29'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('29');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000229'), String(dateTime.concatDate(2000, 2, 29)));
      expect(dateTime.concatDate(2000, 2, 29)).assertEqual('20000229');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1378
     * @tc.name MultiMedia_Date_1378
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1378', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1378';
      LogicTestLog.begin(name, 'year=2000;month=3;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 3, 1);
      LogicTestLog.value(name, 'filename date', String('20000301'), String(formatted));
      expect(formatted).assertEqual('20000301');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('03'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('03');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000301'), String(dateTime.concatDate(2000, 3, 1)));
      expect(dateTime.concatDate(2000, 3, 1)).assertEqual('20000301');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1379
     * @tc.name MultiMedia_Date_1379
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1379', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1379';
      LogicTestLog.begin(name, 'year=2000;month=3;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 3, 31);
      LogicTestLog.value(name, 'filename date', String('20000331'), String(formatted));
      expect(formatted).assertEqual('20000331');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('03'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('03');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000331'), String(dateTime.concatDate(2000, 3, 31)));
      expect(dateTime.concatDate(2000, 3, 31)).assertEqual('20000331');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1380
     * @tc.name MultiMedia_Date_1380
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1380', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1380';
      LogicTestLog.begin(name, 'year=2000;month=4;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 4, 1);
      LogicTestLog.value(name, 'filename date', String('20000401'), String(formatted));
      expect(formatted).assertEqual('20000401');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('04'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('04');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000401'), String(dateTime.concatDate(2000, 4, 1)));
      expect(dateTime.concatDate(2000, 4, 1)).assertEqual('20000401');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1381
     * @tc.name MultiMedia_Date_1381
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1381', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1381';
      LogicTestLog.begin(name, 'year=2000;month=4;day=30');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 4, 30);
      LogicTestLog.value(name, 'filename date', String('20000430'), String(formatted));
      expect(formatted).assertEqual('20000430');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('04'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('04');
      LogicTestLog.value(name, 'day component', String('30'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('30');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000430'), String(dateTime.concatDate(2000, 4, 30)));
      expect(dateTime.concatDate(2000, 4, 30)).assertEqual('20000430');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1382
     * @tc.name MultiMedia_Date_1382
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1382', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1382';
      LogicTestLog.begin(name, 'year=2000;month=5;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 5, 1);
      LogicTestLog.value(name, 'filename date', String('20000501'), String(formatted));
      expect(formatted).assertEqual('20000501');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('05'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('05');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000501'), String(dateTime.concatDate(2000, 5, 1)));
      expect(dateTime.concatDate(2000, 5, 1)).assertEqual('20000501');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1383
     * @tc.name MultiMedia_Date_1383
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1383', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1383';
      LogicTestLog.begin(name, 'year=2000;month=5;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 5, 31);
      LogicTestLog.value(name, 'filename date', String('20000531'), String(formatted));
      expect(formatted).assertEqual('20000531');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('05'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('05');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000531'), String(dateTime.concatDate(2000, 5, 31)));
      expect(dateTime.concatDate(2000, 5, 31)).assertEqual('20000531');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1384
     * @tc.name MultiMedia_Date_1384
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1384', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1384';
      LogicTestLog.begin(name, 'year=2000;month=6;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 6, 1);
      LogicTestLog.value(name, 'filename date', String('20000601'), String(formatted));
      expect(formatted).assertEqual('20000601');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('06'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('06');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000601'), String(dateTime.concatDate(2000, 6, 1)));
      expect(dateTime.concatDate(2000, 6, 1)).assertEqual('20000601');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1385
     * @tc.name MultiMedia_Date_1385
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1385', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1385';
      LogicTestLog.begin(name, 'year=2000;month=6;day=30');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 6, 30);
      LogicTestLog.value(name, 'filename date', String('20000630'), String(formatted));
      expect(formatted).assertEqual('20000630');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('06'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('06');
      LogicTestLog.value(name, 'day component', String('30'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('30');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000630'), String(dateTime.concatDate(2000, 6, 30)));
      expect(dateTime.concatDate(2000, 6, 30)).assertEqual('20000630');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1386
     * @tc.name MultiMedia_Date_1386
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1386', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1386';
      LogicTestLog.begin(name, 'year=2000;month=7;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 7, 1);
      LogicTestLog.value(name, 'filename date', String('20000701'), String(formatted));
      expect(formatted).assertEqual('20000701');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('07'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('07');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000701'), String(dateTime.concatDate(2000, 7, 1)));
      expect(dateTime.concatDate(2000, 7, 1)).assertEqual('20000701');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1387
     * @tc.name MultiMedia_Date_1387
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1387', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1387';
      LogicTestLog.begin(name, 'year=2000;month=7;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 7, 31);
      LogicTestLog.value(name, 'filename date', String('20000731'), String(formatted));
      expect(formatted).assertEqual('20000731');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('07'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('07');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000731'), String(dateTime.concatDate(2000, 7, 31)));
      expect(dateTime.concatDate(2000, 7, 31)).assertEqual('20000731');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1388
     * @tc.name MultiMedia_Date_1388
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1388', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1388';
      LogicTestLog.begin(name, 'year=2000;month=8;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 8, 1);
      LogicTestLog.value(name, 'filename date', String('20000801'), String(formatted));
      expect(formatted).assertEqual('20000801');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('08'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('08');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000801'), String(dateTime.concatDate(2000, 8, 1)));
      expect(dateTime.concatDate(2000, 8, 1)).assertEqual('20000801');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1389
     * @tc.name MultiMedia_Date_1389
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1389', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1389';
      LogicTestLog.begin(name, 'year=2000;month=8;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 8, 31);
      LogicTestLog.value(name, 'filename date', String('20000831'), String(formatted));
      expect(formatted).assertEqual('20000831');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('08'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('08');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000831'), String(dateTime.concatDate(2000, 8, 31)));
      expect(dateTime.concatDate(2000, 8, 31)).assertEqual('20000831');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1390
     * @tc.name MultiMedia_Date_1390
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1390', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1390';
      LogicTestLog.begin(name, 'year=2000;month=9;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 9, 1);
      LogicTestLog.value(name, 'filename date', String('20000901'), String(formatted));
      expect(formatted).assertEqual('20000901');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('09'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000901'), String(dateTime.concatDate(2000, 9, 1)));
      expect(dateTime.concatDate(2000, 9, 1)).assertEqual('20000901');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1391
     * @tc.name MultiMedia_Date_1391
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1391', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1391';
      LogicTestLog.begin(name, 'year=2000;month=9;day=30');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 9, 30);
      LogicTestLog.value(name, 'filename date', String('20000930'), String(formatted));
      expect(formatted).assertEqual('20000930');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('09'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'day component', String('30'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('30');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20000930'), String(dateTime.concatDate(2000, 9, 30)));
      expect(dateTime.concatDate(2000, 9, 30)).assertEqual('20000930');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1392
     * @tc.name MultiMedia_Date_1392
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1392', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1392';
      LogicTestLog.begin(name, 'year=2000;month=10;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 10, 1);
      LogicTestLog.value(name, 'filename date', String('20001001'), String(formatted));
      expect(formatted).assertEqual('20001001');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('10'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20001001'), String(dateTime.concatDate(2000, 10, 1)));
      expect(dateTime.concatDate(2000, 10, 1)).assertEqual('20001001');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1393
     * @tc.name MultiMedia_Date_1393
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1393', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1393';
      LogicTestLog.begin(name, 'year=2000;month=10;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 10, 31);
      LogicTestLog.value(name, 'filename date', String('20001031'), String(formatted));
      expect(formatted).assertEqual('20001031');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('10'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable',
        String('20001031'),
        String(dateTime.concatDate(2000, 10, 31)));
      expect(dateTime.concatDate(2000, 10, 31)).assertEqual('20001031');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1394
     * @tc.name MultiMedia_Date_1394
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1394', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1394';
      LogicTestLog.begin(name, 'year=2000;month=11;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 11, 1);
      LogicTestLog.value(name, 'filename date', String('20001101'), String(formatted));
      expect(formatted).assertEqual('20001101');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('11'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('11');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20001101'), String(dateTime.concatDate(2000, 11, 1)));
      expect(dateTime.concatDate(2000, 11, 1)).assertEqual('20001101');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1395
     * @tc.name MultiMedia_Date_1395
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1395', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1395';
      LogicTestLog.begin(name, 'year=2000;month=11;day=30');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 11, 30);
      LogicTestLog.value(name, 'filename date', String('20001130'), String(formatted));
      expect(formatted).assertEqual('20001130');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('11'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('11');
      LogicTestLog.value(name, 'day component', String('30'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('30');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable',
        String('20001130'),
        String(dateTime.concatDate(2000, 11, 30)));
      expect(dateTime.concatDate(2000, 11, 30)).assertEqual('20001130');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1396
     * @tc.name MultiMedia_Date_1396
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1396', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1396';
      LogicTestLog.begin(name, 'year=2000;month=12;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 12, 1);
      LogicTestLog.value(name, 'filename date', String('20001201'), String(formatted));
      expect(formatted).assertEqual('20001201');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('12'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('12');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20001201'), String(dateTime.concatDate(2000, 12, 1)));
      expect(dateTime.concatDate(2000, 12, 1)).assertEqual('20001201');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1397
     * @tc.name MultiMedia_Date_1397
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1397', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1397';
      LogicTestLog.begin(name, 'year=2000;month=12;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2000, 12, 31);
      LogicTestLog.value(name, 'filename date', String('20001231'), String(formatted));
      expect(formatted).assertEqual('20001231');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2000'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2000');
      LogicTestLog.value(name, 'month component', String('12'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('12');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable',
        String('20001231'),
        String(dateTime.concatDate(2000, 12, 31)));
      expect(dateTime.concatDate(2000, 12, 31)).assertEqual('20001231');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1398
     * @tc.name MultiMedia_Date_1398
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1398', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1398';
      LogicTestLog.begin(name, 'year=2024;month=1;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 1, 1);
      LogicTestLog.value(name, 'filename date', String('20240101'), String(formatted));
      expect(formatted).assertEqual('20240101');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('01'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('01');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240101'), String(dateTime.concatDate(2024, 1, 1)));
      expect(dateTime.concatDate(2024, 1, 1)).assertEqual('20240101');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1399
     * @tc.name MultiMedia_Date_1399
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1399', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1399';
      LogicTestLog.begin(name, 'year=2024;month=1;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 1, 31);
      LogicTestLog.value(name, 'filename date', String('20240131'), String(formatted));
      expect(formatted).assertEqual('20240131');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('01'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('01');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240131'), String(dateTime.concatDate(2024, 1, 31)));
      expect(dateTime.concatDate(2024, 1, 31)).assertEqual('20240131');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1400
     * @tc.name MultiMedia_Date_1400
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1400', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1400';
      LogicTestLog.begin(name, 'year=2024;month=2;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 2, 1);
      LogicTestLog.value(name, 'filename date', String('20240201'), String(formatted));
      expect(formatted).assertEqual('20240201');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('02'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('02');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240201'), String(dateTime.concatDate(2024, 2, 1)));
      expect(dateTime.concatDate(2024, 2, 1)).assertEqual('20240201');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1401
     * @tc.name MultiMedia_Date_1401
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1401', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1401';
      LogicTestLog.begin(name, 'year=2024;month=2;day=29');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 2, 29);
      LogicTestLog.value(name, 'filename date', String('20240229'), String(formatted));
      expect(formatted).assertEqual('20240229');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('02'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('02');
      LogicTestLog.value(name, 'day component', String('29'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('29');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240229'), String(dateTime.concatDate(2024, 2, 29)));
      expect(dateTime.concatDate(2024, 2, 29)).assertEqual('20240229');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1402
     * @tc.name MultiMedia_Date_1402
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1402', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1402';
      LogicTestLog.begin(name, 'year=2024;month=3;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 3, 1);
      LogicTestLog.value(name, 'filename date', String('20240301'), String(formatted));
      expect(formatted).assertEqual('20240301');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('03'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('03');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240301'), String(dateTime.concatDate(2024, 3, 1)));
      expect(dateTime.concatDate(2024, 3, 1)).assertEqual('20240301');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1403
     * @tc.name MultiMedia_Date_1403
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1403', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1403';
      LogicTestLog.begin(name, 'year=2024;month=3;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 3, 31);
      LogicTestLog.value(name, 'filename date', String('20240331'), String(formatted));
      expect(formatted).assertEqual('20240331');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('03'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('03');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240331'), String(dateTime.concatDate(2024, 3, 31)));
      expect(dateTime.concatDate(2024, 3, 31)).assertEqual('20240331');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1404
     * @tc.name MultiMedia_Date_1404
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1404', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1404';
      LogicTestLog.begin(name, 'year=2024;month=4;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 4, 1);
      LogicTestLog.value(name, 'filename date', String('20240401'), String(formatted));
      expect(formatted).assertEqual('20240401');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('04'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('04');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240401'), String(dateTime.concatDate(2024, 4, 1)));
      expect(dateTime.concatDate(2024, 4, 1)).assertEqual('20240401');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1405
     * @tc.name MultiMedia_Date_1405
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1405', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1405';
      LogicTestLog.begin(name, 'year=2024;month=4;day=30');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 4, 30);
      LogicTestLog.value(name, 'filename date', String('20240430'), String(formatted));
      expect(formatted).assertEqual('20240430');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('04'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('04');
      LogicTestLog.value(name, 'day component', String('30'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('30');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240430'), String(dateTime.concatDate(2024, 4, 30)));
      expect(dateTime.concatDate(2024, 4, 30)).assertEqual('20240430');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1406
     * @tc.name MultiMedia_Date_1406
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1406', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1406';
      LogicTestLog.begin(name, 'year=2024;month=5;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 5, 1);
      LogicTestLog.value(name, 'filename date', String('20240501'), String(formatted));
      expect(formatted).assertEqual('20240501');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('05'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('05');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240501'), String(dateTime.concatDate(2024, 5, 1)));
      expect(dateTime.concatDate(2024, 5, 1)).assertEqual('20240501');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1407
     * @tc.name MultiMedia_Date_1407
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1407', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1407';
      LogicTestLog.begin(name, 'year=2024;month=5;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 5, 31);
      LogicTestLog.value(name, 'filename date', String('20240531'), String(formatted));
      expect(formatted).assertEqual('20240531');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('05'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('05');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240531'), String(dateTime.concatDate(2024, 5, 31)));
      expect(dateTime.concatDate(2024, 5, 31)).assertEqual('20240531');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1408
     * @tc.name MultiMedia_Date_1408
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1408', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1408';
      LogicTestLog.begin(name, 'year=2024;month=6;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 6, 1);
      LogicTestLog.value(name, 'filename date', String('20240601'), String(formatted));
      expect(formatted).assertEqual('20240601');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('06'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('06');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240601'), String(dateTime.concatDate(2024, 6, 1)));
      expect(dateTime.concatDate(2024, 6, 1)).assertEqual('20240601');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1409
     * @tc.name MultiMedia_Date_1409
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1409', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1409';
      LogicTestLog.begin(name, 'year=2024;month=6;day=30');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 6, 30);
      LogicTestLog.value(name, 'filename date', String('20240630'), String(formatted));
      expect(formatted).assertEqual('20240630');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('06'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('06');
      LogicTestLog.value(name, 'day component', String('30'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('30');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240630'), String(dateTime.concatDate(2024, 6, 30)));
      expect(dateTime.concatDate(2024, 6, 30)).assertEqual('20240630');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1410
     * @tc.name MultiMedia_Date_1410
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1410', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1410';
      LogicTestLog.begin(name, 'year=2024;month=7;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 7, 1);
      LogicTestLog.value(name, 'filename date', String('20240701'), String(formatted));
      expect(formatted).assertEqual('20240701');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('07'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('07');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240701'), String(dateTime.concatDate(2024, 7, 1)));
      expect(dateTime.concatDate(2024, 7, 1)).assertEqual('20240701');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1411
     * @tc.name MultiMedia_Date_1411
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1411', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1411';
      LogicTestLog.begin(name, 'year=2024;month=7;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 7, 31);
      LogicTestLog.value(name, 'filename date', String('20240731'), String(formatted));
      expect(formatted).assertEqual('20240731');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('07'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('07');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240731'), String(dateTime.concatDate(2024, 7, 31)));
      expect(dateTime.concatDate(2024, 7, 31)).assertEqual('20240731');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1412
     * @tc.name MultiMedia_Date_1412
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1412', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1412';
      LogicTestLog.begin(name, 'year=2024;month=8;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 8, 1);
      LogicTestLog.value(name, 'filename date', String('20240801'), String(formatted));
      expect(formatted).assertEqual('20240801');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('08'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('08');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240801'), String(dateTime.concatDate(2024, 8, 1)));
      expect(dateTime.concatDate(2024, 8, 1)).assertEqual('20240801');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1413
     * @tc.name MultiMedia_Date_1413
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1413', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1413';
      LogicTestLog.begin(name, 'year=2024;month=8;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 8, 31);
      LogicTestLog.value(name, 'filename date', String('20240831'), String(formatted));
      expect(formatted).assertEqual('20240831');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('08'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('08');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240831'), String(dateTime.concatDate(2024, 8, 31)));
      expect(dateTime.concatDate(2024, 8, 31)).assertEqual('20240831');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1414
     * @tc.name MultiMedia_Date_1414
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1414', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1414';
      LogicTestLog.begin(name, 'year=2024;month=9;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 9, 1);
      LogicTestLog.value(name, 'filename date', String('20240901'), String(formatted));
      expect(formatted).assertEqual('20240901');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('09'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240901'), String(dateTime.concatDate(2024, 9, 1)));
      expect(dateTime.concatDate(2024, 9, 1)).assertEqual('20240901');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1415
     * @tc.name MultiMedia_Date_1415
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1415', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1415';
      LogicTestLog.begin(name, 'year=2024;month=9;day=30');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 9, 30);
      LogicTestLog.value(name, 'filename date', String('20240930'), String(formatted));
      expect(formatted).assertEqual('20240930');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('09'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('09');
      LogicTestLog.value(name, 'day component', String('30'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('30');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20240930'), String(dateTime.concatDate(2024, 9, 30)));
      expect(dateTime.concatDate(2024, 9, 30)).assertEqual('20240930');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1416
     * @tc.name MultiMedia_Date_1416
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1416', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1416';
      LogicTestLog.begin(name, 'year=2024;month=10;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 10, 1);
      LogicTestLog.value(name, 'filename date', String('20241001'), String(formatted));
      expect(formatted).assertEqual('20241001');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('10'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20241001'), String(dateTime.concatDate(2024, 10, 1)));
      expect(dateTime.concatDate(2024, 10, 1)).assertEqual('20241001');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1417
     * @tc.name MultiMedia_Date_1417
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1417', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1417';
      LogicTestLog.begin(name, 'year=2024;month=10;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 10, 31);
      LogicTestLog.value(name, 'filename date', String('20241031'), String(formatted));
      expect(formatted).assertEqual('20241031');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('10'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('10');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable',
        String('20241031'),
        String(dateTime.concatDate(2024, 10, 31)));
      expect(dateTime.concatDate(2024, 10, 31)).assertEqual('20241031');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1418
     * @tc.name MultiMedia_Date_1418
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1418', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1418';
      LogicTestLog.begin(name, 'year=2024;month=11;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 11, 1);
      LogicTestLog.value(name, 'filename date', String('20241101'), String(formatted));
      expect(formatted).assertEqual('20241101');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('11'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('11');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20241101'), String(dateTime.concatDate(2024, 11, 1)));
      expect(dateTime.concatDate(2024, 11, 1)).assertEqual('20241101');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1419
     * @tc.name MultiMedia_Date_1419
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1419', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1419';
      LogicTestLog.begin(name, 'year=2024;month=11;day=30');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 11, 30);
      LogicTestLog.value(name, 'filename date', String('20241130'), String(formatted));
      expect(formatted).assertEqual('20241130');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('11'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('11');
      LogicTestLog.value(name, 'day component', String('30'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('30');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable',
        String('20241130'),
        String(dateTime.concatDate(2024, 11, 30)));
      expect(dateTime.concatDate(2024, 11, 30)).assertEqual('20241130');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1420
     * @tc.name MultiMedia_Date_1420
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1420', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1420';
      LogicTestLog.begin(name, 'year=2024;month=12;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 12, 1);
      LogicTestLog.value(name, 'filename date', String('20241201'), String(formatted));
      expect(formatted).assertEqual('20241201');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('12'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('12');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20241201'), String(dateTime.concatDate(2024, 12, 1)));
      expect(dateTime.concatDate(2024, 12, 1)).assertEqual('20241201');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1421
     * @tc.name MultiMedia_Date_1421
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1421', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1421';
      LogicTestLog.begin(name, 'year=2024;month=12;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2024, 12, 31);
      LogicTestLog.value(name, 'filename date', String('20241231'), String(formatted));
      expect(formatted).assertEqual('20241231');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2024'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2024');
      LogicTestLog.value(name, 'month component', String('12'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('12');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable',
        String('20241231'),
        String(dateTime.concatDate(2024, 12, 31)));
      expect(dateTime.concatDate(2024, 12, 31)).assertEqual('20241231');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1422
     * @tc.name MultiMedia_Date_1422
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1422', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1422';
      LogicTestLog.begin(name, 'year=2026;month=1;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 1, 1);
      LogicTestLog.value(name, 'filename date', String('20260101'), String(formatted));
      expect(formatted).assertEqual('20260101');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('01'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('01');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260101'), String(dateTime.concatDate(2026, 1, 1)));
      expect(dateTime.concatDate(2026, 1, 1)).assertEqual('20260101');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1423
     * @tc.name MultiMedia_Date_1423
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1423', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1423';
      LogicTestLog.begin(name, 'year=2026;month=1;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 1, 31);
      LogicTestLog.value(name, 'filename date', String('20260131'), String(formatted));
      expect(formatted).assertEqual('20260131');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('01'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('01');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260131'), String(dateTime.concatDate(2026, 1, 31)));
      expect(dateTime.concatDate(2026, 1, 31)).assertEqual('20260131');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1424
     * @tc.name MultiMedia_Date_1424
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1424', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1424';
      LogicTestLog.begin(name, 'year=2026;month=2;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 2, 1);
      LogicTestLog.value(name, 'filename date', String('20260201'), String(formatted));
      expect(formatted).assertEqual('20260201');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('02'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('02');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260201'), String(dateTime.concatDate(2026, 2, 1)));
      expect(dateTime.concatDate(2026, 2, 1)).assertEqual('20260201');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1425
     * @tc.name MultiMedia_Date_1425
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1425', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1425';
      LogicTestLog.begin(name, 'year=2026;month=2;day=28');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 2, 28);
      LogicTestLog.value(name, 'filename date', String('20260228'), String(formatted));
      expect(formatted).assertEqual('20260228');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('02'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('02');
      LogicTestLog.value(name, 'day component', String('28'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('28');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260228'), String(dateTime.concatDate(2026, 2, 28)));
      expect(dateTime.concatDate(2026, 2, 28)).assertEqual('20260228');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1426
     * @tc.name MultiMedia_Date_1426
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1426', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1426';
      LogicTestLog.begin(name, 'year=2026;month=3;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 3, 1);
      LogicTestLog.value(name, 'filename date', String('20260301'), String(formatted));
      expect(formatted).assertEqual('20260301');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('03'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('03');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260301'), String(dateTime.concatDate(2026, 3, 1)));
      expect(dateTime.concatDate(2026, 3, 1)).assertEqual('20260301');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1427
     * @tc.name MultiMedia_Date_1427
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1427', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1427';
      LogicTestLog.begin(name, 'year=2026;month=3;day=31');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 3, 31);
      LogicTestLog.value(name, 'filename date', String('20260331'), String(formatted));
      expect(formatted).assertEqual('20260331');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('03'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('03');
      LogicTestLog.value(name, 'day component', String('31'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('31');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260331'), String(dateTime.concatDate(2026, 3, 31)));
      expect(dateTime.concatDate(2026, 3, 31)).assertEqual('20260331');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1428
     * @tc.name MultiMedia_Date_1428
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('MultiMedia_Date_1428', 0, async (): Promise<void> => {
      const name: string = 'MultiMedia_Date_1428';
      LogicTestLog.begin(name, 'year=2026;month=4;day=1');
      const dateTime: DateTimeUtil = new DateTimeUtil();
      const formatted: string = dateTime.concatDate(2026, 4, 1);
      LogicTestLog.value(name, 'filename date', String('20260401'), String(formatted));
      expect(formatted).assertEqual('20260401');
      LogicTestLog.number(name, 'date width', 8, formatted.length);
      expect(formatted.length).assertEqual(8);
      LogicTestLog.value(name, 'year component', String('2026'), String(formatted.substring(0, 4)));
      expect(formatted.substring(0, 4)).assertEqual('2026');
      LogicTestLog.value(name, 'month component', String('04'), String(formatted.substring(4, 6)));
      expect(formatted.substring(4, 6)).assertEqual('04');
      LogicTestLog.value(name, 'day component', String('01'), String(formatted.substring(6, 8)));
      expect(formatted.substring(6, 8)).assertEqual('01');
      LogicTestLog.value(name, 'interleaved time independence', String('000000'), String(dateTime.concatTime(0, 0, 0)));
      expect(dateTime.concatTime(0, 0, 0)).assertEqual('000000');
      LogicTestLog.value(name, 'date remains repeatable', String('20260401'), String(dateTime.concatDate(2026, 4, 1)));
      expect(dateTime.concatDate(2026, 4, 1)).assertEqual('20260401');
      LogicTestLog.value(name, 'date result type', String('string'), String(typeof formatted));
      expect(typeof formatted).assertEqual('string');
      LogicTestLog.end(name);
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_CORE_1429
     * @tc.name MultiMedia_Date_1429
     * @tc.desc Month-boundary filename dates across leap, non-leap and century years
     * @tc.type FUNCTION