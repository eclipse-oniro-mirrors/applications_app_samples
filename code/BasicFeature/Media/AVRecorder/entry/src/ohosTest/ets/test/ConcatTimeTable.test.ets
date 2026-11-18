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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import DateTimeUtil from '../../../main/ets/utils/DateTimeUtil';
import { paceTurn } from './TestPace';

export default function concatTimeTableTest() {
  describe('concatTimeTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_0100
     * @tc.name testConcatTimeTable0001
     * @tc.desc Verify concatTime pads hour 0, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(0, 0, 0);
      expect(text).assertEqual('000000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_0200
     * @tc.name testConcatTimeTable0002
     * @tc.desc Verify concatTime pads hour 0, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(0, 9, 59);
      expect(text).assertEqual('000959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_0300
     * @tc.name testConcatTimeTable0003
     * @tc.desc Verify concatTime pads hour 0, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(0, 10, 0);
      expect(text).assertEqual('001000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_0400
     * @tc.name testConcatTimeTable0004
     * @tc.desc Verify concatTime pads hour 0, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(0, 59, 9);
      expect(text).assertEqual('005909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_0500
     * @tc.name testConcatTimeTable0005
     * @tc.desc Verify concatTime pads hour 1, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(1, 0, 0);
      expect(text).assertEqual('010000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_0600
     * @tc.name testConcatTimeTable0006
     * @tc.desc Verify concatTime pads hour 1, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(1, 9, 59);
      expect(text).assertEqual('010959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_0700
     * @tc.name testConcatTimeTable0007
     * @tc.desc Verify concatTime pads hour 1, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(1, 10, 0);
      expect(text).assertEqual('011000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_0800
     * @tc.name testConcatTimeTable0008
     * @tc.desc Verify concatTime pads hour 1, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(1, 59, 9);
      expect(text).assertEqual('015909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_0900
     * @tc.name testConcatTimeTable0009
     * @tc.desc Verify concatTime pads hour 2, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(2, 0, 0);
      expect(text).assertEqual('020000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_1000
     * @tc.name testConcatTimeTable0010
     * @tc.desc Verify concatTime pads hour 2, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(2, 9, 59);
      expect(text).assertEqual('020959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_1100
     * @tc.name testConcatTimeTable0011
     * @tc.desc Verify concatTime pads hour 2, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(2, 10, 0);
      expect(text).assertEqual('021000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_1200
     * @tc.name testConcatTimeTable0012
     * @tc.desc Verify concatTime pads hour 2, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(2, 59, 9);
      expect(text).assertEqual('025909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_1300
     * @tc.name testConcatTimeTable0013
     * @tc.desc Verify concatTime pads hour 3, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(3, 0, 0);
      expect(text).assertEqual('030000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_1400
     * @tc.name testConcatTimeTable0014
     * @tc.desc Verify concatTime pads hour 3, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(3, 9, 59);
      expect(text).assertEqual('030959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_1500
     * @tc.name testConcatTimeTable0015
     * @tc.desc Verify concatTime pads hour 3, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(3, 10, 0);
      expect(text).assertEqual('031000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_1600
     * @tc.name testConcatTimeTable0016
     * @tc.desc Verify concatTime pads hour 3, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(3, 59, 9);
      expect(text).assertEqual('035909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_1700
     * @tc.name testConcatTimeTable0017
     * @tc.desc Verify concatTime pads hour 4, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(4, 0, 0);
      expect(text).assertEqual('040000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_1800
     * @tc.name testConcatTimeTable0018
     * @tc.desc Verify concatTime pads hour 4, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(4, 9, 59);
      expect(text).assertEqual('040959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_1900
     * @tc.name testConcatTimeTable0019
     * @tc.desc Verify concatTime pads hour 4, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(4, 10, 0);
      expect(text).assertEqual('041000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_2000
     * @tc.name testConcatTimeTable0020
     * @tc.desc Verify concatTime pads hour 4, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(4, 59, 9);
      expect(text).assertEqual('045909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_2100
     * @tc.name testConcatTimeTable0021
     * @tc.desc Verify concatTime pads hour 5, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(5, 0, 0);
      expect(text).assertEqual('050000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_2200
     * @tc.name testConcatTimeTable0022
     * @tc.desc Verify concatTime pads hour 5, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(5, 9, 59);
      expect(text).assertEqual('050959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_2300
     * @tc.name testConcatTimeTable0023
     * @tc.desc Verify concatTime pads hour 5, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(5, 10, 0);
      expect(text).assertEqual('051000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_2400
     * @tc.name testConcatTimeTable0024
     * @tc.desc Verify concatTime pads hour 5, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(5, 59, 9);
      expect(text).assertEqual('055909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_2500
     * @tc.name testConcatTimeTable0025
     * @tc.desc Verify concatTime pads hour 6, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(6, 0, 0);
      expect(text).assertEqual('060000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_2600
     * @tc.name testConcatTimeTable0026
     * @tc.desc Verify concatTime pads hour 6, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(6, 9, 59);
      expect(text).assertEqual('060959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_2700
     * @tc.name testConcatTimeTable0027
     * @tc.desc Verify concatTime pads hour 6, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(6, 10, 0);
      expect(text).assertEqual('061000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_2800
     * @tc.name testConcatTimeTable0028
     * @tc.desc Verify concatTime pads hour 6, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(6, 59, 9);
      expect(text).assertEqual('065909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_2900
     * @tc.name testConcatTimeTable0029
     * @tc.desc Verify concatTime pads hour 7, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(7, 0, 0);
      expect(text).assertEqual('070000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_3000
     * @tc.name testConcatTimeTable0030
     * @tc.desc Verify concatTime pads hour 7, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(7, 9, 59);
      expect(text).assertEqual('070959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_3100
     * @tc.name testConcatTimeTable0031
     * @tc.desc Verify concatTime pads hour 7, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(7, 10, 0);
      expect(text).assertEqual('071000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_3200
     * @tc.name testConcatTimeTable0032
     * @tc.desc Verify concatTime pads hour 7, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(7, 59, 9);
      expect(text).assertEqual('075909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_3300
     * @tc.name testConcatTimeTable0033
     * @tc.desc Verify concatTime pads hour 8, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(8, 0, 0);
      expect(text).assertEqual('080000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_3400
     * @tc.name testConcatTimeTable0034
     * @tc.desc Verify concatTime pads hour 8, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(8, 9, 59);
      expect(text).assertEqual('080959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_3500
     * @tc.name testConcatTimeTable0035
     * @tc.desc Verify concatTime pads hour 8, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(8, 10, 0);
      expect(text).assertEqual('081000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_3600
     * @tc.name testConcatTimeTable0036
     * @tc.desc Verify concatTime pads hour 8, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(8, 59, 9);
      expect(text).assertEqual('085909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_3700
     * @tc.name testConcatTimeTable0037
     * @tc.desc Verify concatTime pads hour 9, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(9, 0, 0);
      expect(text).assertEqual('090000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_3800
     * @tc.name testConcatTimeTable0038
     * @tc.desc Verify concatTime pads hour 9, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(9, 9, 59);
      expect(text).assertEqual('090959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_3900
     * @tc.name testConcatTimeTable0039
     * @tc.desc Verify concatTime pads hour 9, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(9, 10, 0);
      expect(text).assertEqual('091000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_4000
     * @tc.name testConcatTimeTable0040
     * @tc.desc Verify concatTime pads hour 9, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(9, 59, 9);
      expect(text).assertEqual('095909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_4100
     * @tc.name testConcatTimeTable0041
     * @tc.desc Verify concatTime pads hour 10, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(10, 0, 0);
      expect(text).assertEqual('100000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_4200
     * @tc.name testConcatTimeTable0042
     * @tc.desc Verify concatTime pads hour 10, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(10, 9, 59);
      expect(text).assertEqual('100959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_4300
     * @tc.name testConcatTimeTable0043
     * @tc.desc Verify concatTime pads hour 10, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(10, 10, 0);
      expect(text).assertEqual('101000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_4400
     * @tc.name testConcatTimeTable0044
     * @tc.desc Verify concatTime pads hour 10, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(10, 59, 9);
      expect(text).assertEqual('105909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_4500
     * @tc.name testConcatTimeTable0045
     * @tc.desc Verify concatTime pads hour 11, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(11, 0, 0);
      expect(text).assertEqual('110000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_4600
     * @tc.name testConcatTimeTable0046
     * @tc.desc Verify concatTime pads hour 11, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(11, 9, 59);
      expect(text).assertEqual('110959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_4700
     * @tc.name testConcatTimeTable0047
     * @tc.desc Verify concatTime pads hour 11, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(11, 10, 0);
      expect(text).assertEqual('111000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_4800
     * @tc.name testConcatTimeTable0048
     * @tc.desc Verify concatTime pads hour 11, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(11, 59, 9);
      expect(text).assertEqual('115909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_4900
     * @tc.name testConcatTimeTable0049
     * @tc.desc Verify concatTime pads hour 12, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(12, 0, 0);
      expect(text).assertEqual('120000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_5000
     * @tc.name testConcatTimeTable0050
     * @tc.desc Verify concatTime pads hour 12, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(12, 9, 59);
      expect(text).assertEqual('120959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_5100
     * @tc.name testConcatTimeTable0051
     * @tc.desc Verify concatTime pads hour 12, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(12, 10, 0);
      expect(text).assertEqual('121000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_5200
     * @tc.name testConcatTimeTable0052
     * @tc.desc Verify concatTime pads hour 12, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(12, 59, 9);
      expect(text).assertEqual('125909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_5300
     * @tc.name testConcatTimeTable0053
     * @tc.desc Verify concatTime pads hour 13, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(13, 0, 0);
      expect(text).assertEqual('130000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_5400
     * @tc.name testConcatTimeTable0054
     * @tc.desc Verify concatTime pads hour 13, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(13, 9, 59);
      expect(text).assertEqual('130959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_5500
     * @tc.name testConcatTimeTable0055
     * @tc.desc Verify concatTime pads hour 13, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(13, 10, 0);
      expect(text).assertEqual('131000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_5600
     * @tc.name testConcatTimeTable0056
     * @tc.desc Verify concatTime pads hour 13, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(13, 59, 9);
      expect(text).assertEqual('135909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_5700
     * @tc.name testConcatTimeTable0057
     * @tc.desc Verify concatTime pads hour 14, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(14, 0, 0);
      expect(text).assertEqual('140000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_5800
     * @tc.name testConcatTimeTable0058
     * @tc.desc Verify concatTime pads hour 14, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(14, 9, 59);
      expect(text).assertEqual('140959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_5900
     * @tc.name testConcatTimeTable0059
     * @tc.desc Verify concatTime pads hour 14, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(14, 10, 0);
      expect(text).assertEqual('141000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_6000
     * @tc.name testConcatTimeTable0060
     * @tc.desc Verify concatTime pads hour 14, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(14, 59, 9);
      expect(text).assertEqual('145909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_6100
     * @tc.name testConcatTimeTable0061
     * @tc.desc Verify concatTime pads hour 15, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(15, 0, 0);
      expect(text).assertEqual('150000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_6200
     * @tc.name testConcatTimeTable0062
     * @tc.desc Verify concatTime pads hour 15, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(15, 9, 59);
      expect(text).assertEqual('150959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_6300
     * @tc.name testConcatTimeTable0063
     * @tc.desc Verify concatTime pads hour 15, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(15, 10, 0);
      expect(text).assertEqual('151000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_6400
     * @tc.name testConcatTimeTable0064
     * @tc.desc Verify concatTime pads hour 15, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(15, 59, 9);
      expect(text).assertEqual('155909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_6500
     * @tc.name testConcatTimeTable0065
     * @tc.desc Verify concatTime pads hour 16, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(16, 0, 0);
      expect(text).assertEqual('160000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_6600
     * @tc.name testConcatTimeTable0066
     * @tc.desc Verify concatTime pads hour 16, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(16, 9, 59);
      expect(text).assertEqual('160959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_6700
     * @tc.name testConcatTimeTable0067
     * @tc.desc Verify concatTime pads hour 16, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(16, 10, 0);
      expect(text).assertEqual('161000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_6800
     * @tc.name testConcatTimeTable0068
     * @tc.desc Verify concatTime pads hour 16, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(16, 59, 9);
      expect(text).assertEqual('165909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_6900
     * @tc.name testConcatTimeTable0069
     * @tc.desc Verify concatTime pads hour 17, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(17, 0, 0);
      expect(text).assertEqual('170000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_7000
     * @tc.name testConcatTimeTable0070
     * @tc.desc Verify concatTime pads hour 17, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(17, 9, 59);
      expect(text).assertEqual('170959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_7100
     * @tc.name testConcatTimeTable0071
     * @tc.desc Verify concatTime pads hour 17, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(17, 10, 0);
      expect(text).assertEqual('171000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_7200
     * @tc.name testConcatTimeTable0072
     * @tc.desc Verify concatTime pads hour 17, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(17, 59, 9);
      expect(text).assertEqual('175909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_7300
     * @tc.name testConcatTimeTable0073
     * @tc.desc Verify concatTime pads hour 18, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(18, 0, 0);
      expect(text).assertEqual('180000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_7400
     * @tc.name testConcatTimeTable0074
     * @tc.desc Verify concatTime pads hour 18, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(18, 9, 59);
      expect(text).assertEqual('180959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_7500
     * @tc.name testConcatTimeTable0075
     * @tc.desc Verify concatTime pads hour 18, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(18, 10, 0);
      expect(text).assertEqual('181000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_7600
     * @tc.name testConcatTimeTable0076
     * @tc.desc Verify concatTime pads hour 18, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(18, 59, 9);
      expect(text).assertEqual('185909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_7700
     * @tc.name testConcatTimeTable0077
     * @tc.desc Verify concatTime pads hour 19, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(19, 0, 0);
      expect(text).assertEqual('190000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_7800
     * @tc.name testConcatTimeTable0078
     * @tc.desc Verify concatTime pads hour 19, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(19, 9, 59);
      expect(text).assertEqual('190959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_7900
     * @tc.name testConcatTimeTable0079
     * @tc.desc Verify concatTime pads hour 19, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(19, 10, 0);
      expect(text).assertEqual('191000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_8000
     * @tc.name testConcatTimeTable0080
     * @tc.desc Verify concatTime pads hour 19, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(19, 59, 9);
      expect(text).assertEqual('195909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_8100
     * @tc.name testConcatTimeTable0081
     * @tc.desc Verify concatTime pads hour 20, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(20, 0, 0);
      expect(text).assertEqual('200000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_8200
     * @tc.name testConcatTimeTable0082
     * @tc.desc Verify concatTime pads hour 20, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(20, 9, 59);
      expect(text).assertEqual('200959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_8300
     * @tc.name testConcatTimeTable0083
     * @tc.desc Verify concatTime pads hour 20, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(20, 10, 0);
      expect(text).assertEqual('201000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_8400
     * @tc.name testConcatTimeTable0084
     * @tc.desc Verify concatTime pads hour 20, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(20, 59, 9);
      expect(text).assertEqual('205909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_8500
     * @tc.name testConcatTimeTable0085
     * @tc.desc Verify concatTime pads hour 21, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(21, 0, 0);
      expect(text).assertEqual('210000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_8600
     * @tc.name testConcatTimeTable0086
     * @tc.desc Verify concatTime pads hour 21, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(21, 9, 59);
      expect(text).assertEqual('210959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_8700
     * @tc.name testConcatTimeTable0087
     * @tc.desc Verify concatTime pads hour 21, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(21, 10, 0);
      expect(text).assertEqual('211000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_8800
     * @tc.name testConcatTimeTable0088
     * @tc.desc Verify concatTime pads hour 21, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(21, 59, 9);
      expect(text).assertEqual('215909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_8900
     * @tc.name testConcatTimeTable0089
     * @tc.desc Verify concatTime pads hour 22, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(22, 0, 0);
      expect(text).assertEqual('220000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_9000
     * @tc.name testConcatTimeTable0090
     * @tc.desc Verify concatTime pads hour 22, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(22, 9, 59);
      expect(text).assertEqual('220959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_9100
     * @tc.name testConcatTimeTable0091
     * @tc.desc Verify concatTime pads hour 22, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(22, 10, 0);
      expect(text).assertEqual('221000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_9200
     * @tc.name testConcatTimeTable0092
     * @tc.desc Verify concatTime pads hour 22, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(22, 59, 9);
      expect(text).assertEqual('225909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_9300
     * @tc.name testConcatTimeTable0093
     * @tc.desc Verify concatTime pads hour 23, minute 0 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(23, 0, 0);
      expect(text).assertEqual('230000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_9400
     * @tc.name testConcatTimeTable0094
     * @tc.desc Verify concatTime pads hour 23, minute 9 and second 59 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(23, 9, 59);
      expect(text).assertEqual('230959');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_9500
     * @tc.name testConcatTimeTable0095
     * @tc.desc Verify concatTime pads hour 23, minute 10 and second 0 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(23, 10, 0);
      expect(text).assertEqual('231000');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CTIME_9600
     * @tc.name testConcatTimeTable0096
     * @tc.desc Verify concatTime pads hour 23, minute 59 and second 9 to six digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testConcatTimeTable0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(23, 59, 9);
      expect(text).assertEqual('235909');
      expect(text.length).assertEqual(6);
      expect(/^\d{6}$/.test(text)).assertTrue();
    })
  })
}
