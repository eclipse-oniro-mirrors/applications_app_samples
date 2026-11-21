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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { EventRecordManager } from '../../../main/ets/feature/EventRecordManager';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function clockFormatTest() {
  describe('FormatTimeVolume01Test', () => {

    /**
     * @tc.name   testClockFormat0001
     * @tc.number SUB_CCER_FTIME_0001
     * @tc.desc   时刻 00:00:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0001 begin');
      const timestamp: number = new Date(2026, 7, 12, 0, 0, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:00'));
      expect(result).assertEqual('00:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0001 end');
    })

    /**
     * @tc.name   testClockFormat0002
     * @tc.number SUB_CCER_FTIME_0002
     * @tc.desc   时刻 00:00:01 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0002 begin');
      const timestamp: number = new Date(2026, 7, 12, 0, 0, 1).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:01'));
      expect(result).assertEqual('00:00:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0002 end');
    })

    /**
     * @tc.name   testClockFormat0003
     * @tc.number SUB_CCER_FTIME_0003
     * @tc.desc   时刻 00:01:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0003 begin');
      const timestamp: number = new Date(2026, 7, 12, 0, 1, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:00'));
      expect(result).assertEqual('00:01:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0003 end');
    })

    /**
     * @tc.name   testClockFormat0004
     * @tc.number SUB_CCER_FTIME_0004
     * @tc.desc   时刻 01:00:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0004 begin');
      const timestamp: number = new Date(2026, 7, 12, 1, 0, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:00:00'));
      expect(result).assertEqual('01:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0004 end');
    })

    /**
     * @tc.name   testClockFormat0005
     * @tc.number SUB_CCER_FTIME_0005
     * @tc.desc   时刻 05:06:07 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0005 begin');
      const timestamp: number = new Date(2026, 7, 12, 5, 6, 7).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('05:06:07'));
      expect(result).assertEqual('05:06:07');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0005 end');
    })

    /**
     * @tc.name   testClockFormat0006
     * @tc.number SUB_CCER_FTIME_0006
     * @tc.desc   时刻 09:09:09 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0006 begin');
      const timestamp: number = new Date(2026, 7, 12, 9, 9, 9).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('09:09:09'));
      expect(result).assertEqual('09:09:09');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0006 end');
    })

    /**
     * @tc.name   testClockFormat0007
     * @tc.number SUB_CCER_FTIME_0007
     * @tc.desc   时刻 10:00:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0007 begin');
      const timestamp: number = new Date(2026, 7, 12, 10, 0, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10:00:00'));
      expect(result).assertEqual('10:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0007 end');
    })

    /**
     * @tc.name   testClockFormat0008
     * @tc.number SUB_CCER_FTIME_0008
     * @tc.desc   时刻 12:00:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0008 begin');
      const timestamp: number = new Date(2026, 7, 12, 12, 0, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12:00:00'));
      expect(result).assertEqual('12:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0008 end');
    })

    /**
     * @tc.name   testClockFormat0009
     * @tc.number SUB_CCER_FTIME_0009
     * @tc.desc   时刻 12:34:56 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0009 begin');
      const timestamp: number = new Date(2026, 7, 12, 12, 34, 56).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12:34:56'));
      expect(result).assertEqual('12:34:56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0009 end');
    })

    /**
     * @tc.name   testClockFormat0010
     * @tc.number SUB_CCER_FTIME_0010
     * @tc.desc   时刻 13:59:59 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0010 begin');
      const timestamp: number = new Date(2026, 7, 12, 13, 59, 59).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('13:59:59'));
      expect(result).assertEqual('13:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0010 end');
    })

    /**
     * @tc.name   testClockFormat0011
     * @tc.number SUB_CCER_FTIME_0011
     * @tc.desc   时刻 23:00:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0011 begin');
      const timestamp: number = new Date(2026, 7, 12, 23, 0, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('23:00:00'));
      expect(result).assertEqual('23:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0011 end');
    })

    /**
     * @tc.name   testClockFormat0012
     * @tc.number SUB_CCER_FTIME_0012
     * @tc.desc   时刻 23:59:59 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0012 begin');
      const timestamp: number = new Date(2026, 7, 12, 23, 59, 59).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('23:59:59'));
      expect(result).assertEqual('23:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0012 end');
    })

    /**
     * @tc.name   testClockFormat0013
     * @tc.number SUB_CCER_FTIME_0013
     * @tc.desc   时刻 23:59:58 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0013 begin');
      const timestamp: number = new Date(2026, 7, 12, 23, 59, 58).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('23:59:58'));
      expect(result).assertEqual('23:59:58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0013 end');
    })

    /**
     * @tc.name   testClockFormat0014
     * @tc.number SUB_CCER_FTIME_0014
     * @tc.desc   时刻 22:58:59 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0014 begin');
      const timestamp: number = new Date(2026, 7, 12, 22, 58, 59).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('22:58:59'));
      expect(result).assertEqual('22:58:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0014 end');
    })

    /**
     * @tc.name   testClockFormat0015
     * @tc.number SUB_CCER_FTIME_0015
     * @tc.desc   时刻 11:11:11 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0015 begin');
      const timestamp: number = new Date(2026, 7, 12, 11, 11, 11).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:11:11'));
      expect(result).assertEqual('11:11:11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0015 end');
    })

    /**
     * @tc.name   testClockFormat0016
     * @tc.number SUB_CCER_FTIME_0016
     * @tc.desc   时刻 10:10:10 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0016 begin');
      const timestamp: number = new Date(2026, 7, 12, 10, 10, 10).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10:10:10'));
      expect(result).assertEqual('10:10:10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0016 end');
    })

    /**
     * @tc.name   testClockFormat0017
     * @tc.number SUB_CCER_FTIME_0017
     * @tc.desc   时刻 02:03:04 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0017 begin');
      const timestamp: number = new Date(2026, 7, 12, 2, 3, 4).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('02:03:04'));
      expect(result).assertEqual('02:03:04');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0017 end');
    })

    /**
     * @tc.name   testClockFormat0018
     * @tc.number SUB_CCER_FTIME_0018
     * @tc.desc   时刻 03:04:05 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0018 begin');
      const timestamp: number = new Date(2026, 7, 12, 3, 4, 5).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('03:04:05'));
      expect(result).assertEqual('03:04:05');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0018 end');
    })

    /**
     * @tc.name   testClockFormat0019
     * @tc.number SUB_CCER_FTIME_0019
     * @tc.desc   时刻 04:05:06 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0019 begin');
      const timestamp: number = new Date(2026, 7, 12, 4, 5, 6).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('04:05:06'));
      expect(result).assertEqual('04:05:06');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0019 end');
    })

    /**
     * @tc.name   testClockFormat0020
     * @tc.number SUB_CCER_FTIME_0020
     * @tc.desc   时刻 06:07:08 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0020 begin');
      const timestamp: number = new Date(2026, 7, 12, 6, 7, 8).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('06:07:08'));
      expect(result).assertEqual('06:07:08');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0020 end');
    })

    /**
     * @tc.name   testClockFormat0021
     * @tc.number SUB_CCER_FTIME_0021
     * @tc.desc   时刻 07:08:09 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0021 begin');
      const timestamp: number = new Date(2026, 7, 12, 7, 8, 9).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('07:08:09'));
      expect(result).assertEqual('07:08:09');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0021 end');
    })

    /**
     * @tc.name   testClockFormat0022
     * @tc.number SUB_CCER_FTIME_0022
     * @tc.desc   时刻 08:09:10 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0022 begin');
      const timestamp: number = new Date(2026, 7, 12, 8, 9, 10).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('08:09:10'));
      expect(result).assertEqual('08:09:10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0022 end');
    })

    /**
     * @tc.name   testClockFormat0023
     * @tc.number SUB_CCER_FTIME_0023
     * @tc.desc   时刻 14:15:16 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0023 begin');
      const timestamp: number = new Date(2026, 7, 12, 14, 15, 16).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('14:15:16'));
      expect(result).assertEqual('14:15:16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0023 end');
    })

    /**
     * @tc.name   testClockFormat0024
     * @tc.number SUB_CCER_FTIME_0024
     * @tc.desc   时刻 15:16:17 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0024 begin');
      const timestamp: number = new Date(2026, 7, 12, 15, 16, 17).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('15:16:17'));
      expect(result).assertEqual('15:16:17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0024 end');
    })

    /**
     * @tc.name   testClockFormat0025
     * @tc.number SUB_CCER_FTIME_0025
     * @tc.desc   时刻 16:17:18 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0025 begin');
      const timestamp: number = new Date(2026, 7, 12, 16, 17, 18).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16:17:18'));
      expect(result).assertEqual('16:17:18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0025 end');
    })

    /**
     * @tc.name   testClockFormat0026
     * @tc.number SUB_CCER_FTIME_0026
     * @tc.desc   时刻 17:18:19 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0026 begin');
      const timestamp: number = new Date(2026, 7, 12, 17, 18, 19).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('17:18:19'));
      expect(result).assertEqual('17:18:19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0026 end');
    })

    /**
     * @tc.name   testClockFormat0027
     * @tc.number SUB_CCER_FTIME_0027
     * @tc.desc   时刻 18:19:20 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0027 begin');
      const timestamp: number = new Date(2026, 7, 12, 18, 19, 20).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('18:19:20'));
      expect(result).assertEqual('18:19:20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0027 end');
    })

    /**
     * @tc.name   testClockFormat0028
     * @tc.number SUB_CCER_FTIME_0028
     * @tc.desc   时刻 19:20:21 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0028 begin');
      const timestamp: number = new Date(2026, 7, 12, 19, 20, 21).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('19:20:21'));
      expect(result).assertEqual('19:20:21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0028 end');
    })

    /**
     * @tc.name   testClockFormat0029
     * @tc.number SUB_CCER_FTIME_0029
     * @tc.desc   时刻 20:21:22 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0029 begin');
      const timestamp: number = new Date(2026, 7, 12, 20, 21, 22).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('20:21:22'));
      expect(result).assertEqual('20:21:22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0029 end');
    })

    /**
     * @tc.name   testClockFormat0030
     * @tc.number SUB_CCER_FTIME_0030
     * @tc.desc   时刻 21:22:23 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0030 begin');
      const timestamp: number = new Date(2026, 7, 12, 21, 22, 23).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('21:22:23'));
      expect(result).assertEqual('21:22:23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0030 end');
    })

    /**
     * @tc.name   testClockFormat0031
     * @tc.number SUB_CCER_FTIME_0031
     * @tc.desc   时刻 22:23:24 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0031 begin');
      const timestamp: number = new Date(2026, 7, 12, 22, 23, 24).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('22:23:24'));
      expect(result).assertEqual('22:23:24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0031 end');
    })

    /**
     * @tc.name   testClockFormat0032
     * @tc.number SUB_CCER_FTIME_0032
     * @tc.desc   时刻 00:30:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0032 begin');
      const timestamp: number = new Date(2026, 7, 12, 0, 30, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:30:00'));
      expect(result).assertEqual('00:30:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0032 end');
    })

    /**
     * @tc.name   testClockFormat0033
     * @tc.number SUB_CCER_FTIME_0033
     * @tc.desc   时刻 00:59:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0033 begin');
      const timestamp: number = new Date(2026, 7, 12, 0, 59, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:59:00'));
      expect(result).assertEqual('00:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0033 end');
    })

    /**
     * @tc.name   testClockFormat0034
     * @tc.number SUB_CCER_FTIME_0034
     * @tc.desc   时刻 12:00:59 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0034 begin');
      const timestamp: number = new Date(2026, 7, 12, 12, 0, 59).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12:00:59'));
      expect(result).assertEqual('12:00:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0034 end');
    })

    /**
     * @tc.name   testClockFormat0035
     * @tc.number SUB_CCER_FTIME_0035
     * @tc.desc   时刻 01:02:03 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0035 begin');
      const timestamp: number = new Date(2026, 7, 12, 1, 2, 3).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:02:03'));
      expect(result).assertEqual('01:02:03');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0035 end');
    })

    /**
     * @tc.name   testClockFormat0036
     * @tc.number SUB_CCER_FTIME_0036
     * @tc.desc   时刻 11:00:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0036 begin');
      const timestamp: number = new Date(2026, 7, 12, 11, 0, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('11:00:00'));
      expect(result).assertEqual('11:00:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0036 end');
    })

    /**
     * @tc.name   testClockFormat0037
     * @tc.number SUB_CCER_FTIME_0037
     * @tc.desc   时刻 12:59:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0037 begin');
      const timestamp: number = new Date(2026, 7, 12, 12, 59, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12:59:00'));
      expect(result).assertEqual('12:59:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0037 end');
    })

    /**
     * @tc.name   testClockFormat0038
     * @tc.number SUB_CCER_FTIME_0038
     * @tc.desc   时刻 00:00:59 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0038 begin');
      const timestamp: number = new Date(2026, 7, 12, 0, 0, 59).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:00:59'));
      expect(result).assertEqual('00:00:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0038 end');
    })

    /**
     * @tc.name   testClockFormat0039
     * @tc.number SUB_CCER_FTIME_0039
     * @tc.desc   时刻 05:59:59 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0039 begin');
      const timestamp: number = new Date(2026, 7, 12, 5, 59, 59).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('05:59:59'));
      expect(result).assertEqual('05:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0039 end');
    })

    /**
     * @tc.name   testClockFormat0040
     * @tc.number SUB_CCER_FTIME_0040
     * @tc.desc   时刻 09:00:01 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0040 begin');
      const timestamp: number = new Date(2026, 7, 12, 9, 0, 1).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('09:00:01'));
      expect(result).assertEqual('09:00:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0040 end');
    })

    /**
     * @tc.name   testClockFormat0041
     * @tc.number SUB_CCER_FTIME_0041
     * @tc.desc   时刻 10:01:00 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0041 begin');
      const timestamp: number = new Date(2026, 7, 12, 10, 1, 0).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10:01:00'));
      expect(result).assertEqual('10:01:00');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0041 end');
    })

    /**
     * @tc.name   testClockFormat0042
     * @tc.number SUB_CCER_FTIME_0042
     * @tc.desc   时刻 00:01:01 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0042 begin');
      const timestamp: number = new Date(2026, 7, 12, 0, 1, 1).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('00:01:01'));
      expect(result).assertEqual('00:01:01');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0042 end');
    })

    /**
     * @tc.name   testClockFormat0043
     * @tc.number SUB_CCER_FTIME_0043
     * @tc.desc   时刻 23:01:02 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0043 begin');
      const timestamp: number = new Date(2026, 7, 12, 23, 1, 2).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('23:01:02'));
      expect(result).assertEqual('23:01:02');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0043 end');
    })

    /**
     * @tc.name   testClockFormat0044
     * @tc.number SUB_CCER_FTIME_0044
     * @tc.desc   时刻 01:59:59 按 HH:mm:ss 补零输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0044 begin');
      const timestamp: number = new Date(2026, 7, 12, 1, 59, 59).getTime();
      const result: string = EventRecordManager.formatTime(timestamp);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('01:59:59'));
      expect(result).assertEqual('01:59:59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.indexOf(':')), String(2));
      expect(result.indexOf(':')).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.lastIndexOf(':')), String(5));
      expect(result.lastIndexOf(':')).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0044 end');
    })

    /**
     * @tc.name   testClockFormat0045
     * @tc.number SUB_CCER_FTIME_0045
     * @tc.desc   闰日与跨日两端时刻校验，确认日期不渗入时间字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testClockFormat0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0045 begin');
      const leapDay: string = EventRecordManager.formatTime(new Date(2028, 1, 29, 23, 59, 59).getTime());
      const nextDay: string = EventRecordManager.formatTime(new Date(2028, 2, 1, 0, 0, 0).getTime());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'leapDay=%{public}s nextDay=%{public}s', leapDay, nextDay);
      expect(leapDay).assertEqual('23:59:59');
      expect(nextDay).assertEqual('00:00:00');
      expect(leapDay.indexOf('-')).assertEqual(-1);
      expect(nextDay.indexOf('-')).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testClockFormat0045 end');
    })
  })
}
