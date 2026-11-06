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
import { describe, beforeEach, it, expect } from '@ohos/hypium';
import DateTimeUtil, { getShownTimer, dateTime } from '../../../main/ets/utils/DateTimeUtil';
import { paceTurn } from './TestPace';

export default function dateTimeExtremeTableTest() {
  describe('dateTimeExtremeTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_0100
     * @tc.name testExtremeTable0001
     * @tc.desc Verify fill keeps a deterministic rendering for the out-of-range value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0001', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(-1);
      expect(text).assertEqual('0-1');
      expect(text.length).assertEqual('0-1'.length);
      expect(text.indexOf('-1') >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_0200
     * @tc.name testExtremeTable0002
     * @tc.desc Verify fill keeps a deterministic rendering for the out-of-range value -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0002', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(-5);
      expect(text).assertEqual('0-5');
      expect(text.length).assertEqual('0-5'.length);
      expect(text.indexOf('-5') >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_0300
     * @tc.name testExtremeTable0003
     * @tc.desc Verify fill keeps a deterministic rendering for the out-of-range value -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0003', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(-10);
      expect(text).assertEqual('0-10');
      expect(text.length).assertEqual('0-10'.length);
      expect(text.indexOf('-10') >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_0400
     * @tc.name testExtremeTable0004
     * @tc.desc Verify fill keeps a deterministic rendering for the out-of-range value -99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0004', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(-99);
      expect(text).assertEqual('0-99');
      expect(text.length).assertEqual('0-99'.length);
      expect(text.indexOf('-99') >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_0500
     * @tc.name testExtremeTable0005
     * @tc.desc Verify fill keeps a deterministic rendering for the out-of-range value -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0005', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(-100);
      expect(text).assertEqual('0-100');
      expect(text.length).assertEqual('0-100'.length);
      expect(text.indexOf('-100') >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_0600
     * @tc.name testExtremeTable0006
     * @tc.desc Verify fill keeps a deterministic rendering for the out-of-range value 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0006', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(65535);
      expect(text).assertEqual('65535');
      expect(text.length).assertEqual('65535'.length);
      expect(text.indexOf('65535') >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_0700
     * @tc.name testExtremeTable0007
     * @tc.desc Verify fill keeps a deterministic rendering for the out-of-range value 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0007', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(100000);
      expect(text).assertEqual('100000');
      expect(text.length).assertEqual('100000'.length);
      expect(text.indexOf('100000') >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_0800
     * @tc.name testExtremeTable0008
     * @tc.desc Verify fill keeps a deterministic rendering for the out-of-range value 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0008', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(1000000);
      expect(text).assertEqual('1000000');
      expect(text.length).assertEqual('1000000'.length);
      expect(text.indexOf('1000000') >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_0900
     * @tc.name testExtremeTable0009
     * @tc.desc Verify fill keeps a deterministic rendering for the out-of-range value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0009', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.fill(2147483647);
      expect(text).assertEqual('2147483647');
      expect(text.length).assertEqual('2147483647'.length);
      expect(text.indexOf('2147483647') >= 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_1000
     * @tc.name testExtremeTable0010
     * @tc.desc Verify concatTime keeps every out-of-range field for -1, 0, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0010', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(-1, 0, 0);
      expect(text).assertEqual('0-10000');
      expect(text.length).assertEqual(7);
      expect(text.startsWith('0-1')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_1100
     * @tc.name testExtremeTable0011
     * @tc.desc Verify concatTime keeps every out-of-range field for 0, -1, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0011', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(0, -1, 0);
      expect(text).assertEqual('000-100');
      expect(text.length).assertEqual(7);
      expect(text.startsWith('00')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_1200
     * @tc.name testExtremeTable0012
     * @tc.desc Verify concatTime keeps every out-of-range field for 0, 0, -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0012', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(0, 0, -1);
      expect(text).assertEqual('00000-1');
      expect(text.length).assertEqual(7);
      expect(text.startsWith('00')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_1300
     * @tc.name testExtremeTable0013
     * @tc.desc Verify concatTime keeps every out-of-range field for -1, -1, -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0013', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(-1, -1, -1);
      expect(text).assertEqual('0-10-10-1');
      expect(text.length).assertEqual(9);
      expect(text.startsWith('0-1')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_1400
     * @tc.name testExtremeTable0014
     * @tc.desc Verify concatTime keeps every out-of-range field for 99, 99, 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0014', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(99, 99, 99);
      expect(text).assertEqual('999999');
      expect(text.length).assertEqual(6);
      expect(text.startsWith('99')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_1500
     * @tc.name testExtremeTable0015
     * @tc.desc Verify concatTime keeps every out-of-range field for 100, 59, 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0015', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(100, 59, 59);
      expect(text).assertEqual('1005959');
      expect(text.length).assertEqual(7);
      expect(text.startsWith('100')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_1600
     * @tc.name testExtremeTable0016
     * @tc.desc Verify concatTime keeps every out-of-range field for 9, 100, 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0016', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(9, 100, 9);
      expect(text).assertEqual('0910009');
      expect(text.length).assertEqual(7);
      expect(text.startsWith('09')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_1700
     * @tc.name testExtremeTable0017
     * @tc.desc Verify concatTime keeps every out-of-range field for 1000, 1000, 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0017', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(1000, 1000, 1000);
      expect(text).assertEqual('100010001000');
      expect(text.length).assertEqual(12);
      expect(text.startsWith('1000')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_1800
     * @tc.name testExtremeTable0018
     * @tc.desc Verify concatTime keeps every out-of-range field for 65, 65, 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0018', 0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const text: string = util.concatTime(65, 65, 65);
      expect(text).assertEqual('656565');
      expect(text.length).assertEqual(6);
      expect(text.startsWith('65')).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_1900
     * @tc.name testExtremeTable0019
     * @tc.desc Verify getShownTimer keeps a deterministic split for the out-of-range duration -1 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0019', 0, () => {
      const text: string = getShownTimer(-1);
      expect(text).assertEqual('0:0');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^-?\d{1,6}:-?\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_2000
     * @tc.name testExtremeTable0020
     * @tc.desc Verify getShownTimer keeps a deterministic split for the out-of-range duration -499 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0020', 0, () => {
      const text: string = getShownTimer(-499);
      expect(text).assertEqual('0:0');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^-?\d{1,6}:-?\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_2100
     * @tc.name testExtremeTable0021
     * @tc.desc Verify getShownTimer keeps a deterministic split for the out-of-range duration -500 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0021', 0, () => {
      const text: string = getShownTimer(-500);
      expect(text).assertEqual('0:0');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^-?\d{1,6}:-?\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_2200
     * @tc.name testExtremeTable0022
     * @tc.desc Verify getShownTimer keeps a deterministic split for the out-of-range duration -1000 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0022', 0, () => {
      const text: string = getShownTimer(-1000);
      expect(text).assertEqual('0:-1');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^-?\d{1,6}:-?\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_2300
     * @tc.name testExtremeTable0023
     * @tc.desc Verify getShownTimer keeps a deterministic split for the out-of-range duration -61000 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0023', 0, () => {
      const text: string = getShownTimer(-61000);
      expect(text).assertEqual('-1:-1');
      expect(text.indexOf(':')).assertEqual(2);
      expect(/^-?\d{1,6}:-?\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_2400
     * @tc.name testExtremeTable0024
     * @tc.desc Verify getShownTimer keeps a deterministic split for the out-of-range duration 3600001 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0024', 0, () => {
      const text: string = getShownTimer(3600001);
      expect(text).assertEqual('60:0');
      expect(text.indexOf(':')).assertEqual(2);
      expect(/^-?\d{1,6}:-?\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_2500
     * @tc.name testExtremeTable0025
     * @tc.desc Verify getShownTimer keeps a deterministic split for the out-of-range duration 3599999 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0025', 0, () => {
      const text: string = getShownTimer(3599999);
      expect(text).assertEqual('60:0');
      expect(text.indexOf(':')).assertEqual(2);
      expect(/^-?\d{1,6}:-?\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_2600
     * @tc.name testExtremeTable0026
     * @tc.desc Verify getShownTimer keeps a deterministic split for the out-of-range duration 86400000 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0026', 0, () => {
      const text: string = getShownTimer(86400000);
      expect(text).assertEqual('1440:0');
      expect(text.indexOf(':')).assertEqual(4);
      expect(/^-?\d{1,6}:-?\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_2700
     * @tc.name testExtremeTable0027
     * @tc.desc Verify getShownTimer keeps a deterministic split for the out-of-range duration 999999999 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0027', 0, () => {
      const text: string = getShownTimer(999999999);
      expect(text).assertEqual('16666:40');
      expect(text.indexOf(':')).assertEqual(5);
      expect(/^-?\d{1,6}:-?\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_2800
     * @tc.name testExtremeTable0028
     * @tc.desc Verify dateTime keeps a deterministic clock string for the out-of-range second -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0028', 0, () => {
      const text: string = dateTime(-1);
      expect(text).assertEqual('0-1:0-1');
      expect(text.indexOf(':')).assertEqual(3);
      expect(text.length).assertEqual(7);
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_2900
     * @tc.name testExtremeTable0029
     * @tc.desc Verify dateTime keeps a deterministic clock string for the out-of-range second -59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0029', 0, () => {
      const text: string = dateTime(-59);
      expect(text).assertEqual('0-1:0-59');
      expect(text.indexOf(':')).assertEqual(3);
      expect(text.length).assertEqual(8);
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_3000
     * @tc.name testExtremeTable0030
     * @tc.desc Verify dateTime keeps a deterministic clock string for the out-of-range second -60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0030', 0, () => {
      const text: string = dateTime(-60);
      expect(text).assertEqual('0-1:00');
      expect(text.indexOf(':')).assertEqual(3);
      expect(text.length).assertEqual(6);
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_3100
     * @tc.name testExtremeTable0031
     * @tc.desc Verify dateTime keeps a deterministic clock string for the out-of-range second -61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0031', 0, () => {
      const text: string = dateTime(-61);
      expect(text).assertEqual('0-2:0-1');
      expect(text.indexOf(':')).assertEqual(3);
      expect(text.length).assertEqual(7);
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_3200
     * @tc.name testExtremeTable0032
     * @tc.desc Verify dateTime keeps a deterministic clock string for the out-of-range second -3600
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0032', 0, () => {
      const text: string = dateTime(-3600);
      expect(text).assertEqual('00:00');
      expect(text.indexOf(':')).assertEqual(2);
      expect(text.length).assertEqual(5);
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_3300
     * @tc.name testExtremeTable0033
     * @tc.desc Verify dateTime keeps a deterministic clock string for the out-of-range second 86400
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0033', 0, () => {
      const text: string = dateTime(86400);
      expect(text).assertEqual('00:00');
      expect(text.indexOf(':')).assertEqual(2);
      expect(text.length).assertEqual(5);
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_3400
     * @tc.name testExtremeTable0034
     * @tc.desc Verify dateTime keeps a deterministic clock string for the out-of-range second 86459
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0034', 0, () => {
      const text: string = dateTime(86459);
      expect(text).assertEqual('00:59');
      expect(text.indexOf(':')).assertEqual(2);
      expect(text.length).assertEqual(5);
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_3500
     * @tc.name testExtremeTable0035
     * @tc.desc Verify dateTime keeps a deterministic clock string for the out-of-range second 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0035', 0, () => {
      const text: string = dateTime(1000000);
      expect(text).assertEqual('46:40');
      expect(text.indexOf(':')).assertEqual(2);
      expect(text.length).assertEqual(5);
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_EXTREME_3600
     * @tc.name testExtremeTable0036
     * @tc.desc Verify dateTime keeps a deterministic clock string for the out-of-range second 3599999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testExtremeTable0036', 0, () => {
      const text: string = dateTime(3599999);
      expect(text).assertEqual('59:59');
      expect(text.indexOf(':')).assertEqual(2);
      expect(text.length).assertEqual(5);
    })
  })
}
