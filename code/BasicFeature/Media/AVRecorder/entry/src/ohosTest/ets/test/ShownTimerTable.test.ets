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
import { getShownTimer } from '../../../main/ets/utils/DateTimeUtil';
import { paceTurn } from './TestPace';

export default function shownTimerTableTest() {
  describe('shownTimerTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_0100
     * @tc.name testTimerTable0001
     * @tc.desc Verify getShownTimer maps 499 ms to 0 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0001', 0, () => {
      const text: string = getShownTimer(499);
      expect(text).assertEqual('0:0');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_0200
     * @tc.name testTimerTable0002
     * @tc.desc Verify getShownTimer maps 500 ms to 1 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0002', 0, () => {
      const text: string = getShownTimer(500);
      expect(text).assertEqual('0:1');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_0300
     * @tc.name testTimerTable0003
     * @tc.desc Verify getShownTimer maps 1499 ms to 1 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0003', 0, () => {
      const text: string = getShownTimer(1499);
      expect(text).assertEqual('0:1');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_0400
     * @tc.name testTimerTable0004
     * @tc.desc Verify getShownTimer maps 1500 ms to 2 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0004', 0, () => {
      const text: string = getShownTimer(1500);
      expect(text).assertEqual('0:2');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_0500
     * @tc.name testTimerTable0005
     * @tc.desc Verify getShownTimer maps 2499 ms to 2 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0005', 0, () => {
      const text: string = getShownTimer(2499);
      expect(text).assertEqual('0:2');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_0600
     * @tc.name testTimerTable0006
     * @tc.desc Verify getShownTimer maps 2500 ms to 3 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0006', 0, () => {
      const text: string = getShownTimer(2500);
      expect(text).assertEqual('0:3');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_0700
     * @tc.name testTimerTable0007
     * @tc.desc Verify getShownTimer maps 3499 ms to 3 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0007', 0, () => {
      const text: string = getShownTimer(3499);
      expect(text).assertEqual('0:3');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_0800
     * @tc.name testTimerTable0008
     * @tc.desc Verify getShownTimer maps 3500 ms to 4 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0008', 0, () => {
      const text: string = getShownTimer(3500);
      expect(text).assertEqual('0:4');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_0900
     * @tc.name testTimerTable0009
     * @tc.desc Verify getShownTimer maps 4499 ms to 4 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0009', 0, () => {
      const text: string = getShownTimer(4499);
      expect(text).assertEqual('0:4');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_1000
     * @tc.name testTimerTable0010
     * @tc.desc Verify getShownTimer maps 4500 ms to 5 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0010', 0, () => {
      const text: string = getShownTimer(4500);
      expect(text).assertEqual('0:5');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_1100
     * @tc.name testTimerTable0011
     * @tc.desc Verify getShownTimer maps 5499 ms to 5 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0011', 0, () => {
      const text: string = getShownTimer(5499);
      expect(text).assertEqual('0:5');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_1200
     * @tc.name testTimerTable0012
     * @tc.desc Verify getShownTimer maps 5500 ms to 6 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0012', 0, () => {
      const text: string = getShownTimer(5500);
      expect(text).assertEqual('0:6');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_1300
     * @tc.name testTimerTable0013
     * @tc.desc Verify getShownTimer maps 6499 ms to 6 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0013', 0, () => {
      const text: string = getShownTimer(6499);
      expect(text).assertEqual('0:6');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_1400
     * @tc.name testTimerTable0014
     * @tc.desc Verify getShownTimer maps 6500 ms to 7 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0014', 0, () => {
      const text: string = getShownTimer(6500);
      expect(text).assertEqual('0:7');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_1500
     * @tc.name testTimerTable0015
     * @tc.desc Verify getShownTimer maps 7499 ms to 7 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0015', 0, () => {
      const text: string = getShownTimer(7499);
      expect(text).assertEqual('0:7');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_1600
     * @tc.name testTimerTable0016
     * @tc.desc Verify getShownTimer maps 7500 ms to 8 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0016', 0, () => {
      const text: string = getShownTimer(7500);
      expect(text).assertEqual('0:8');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_1700
     * @tc.name testTimerTable0017
     * @tc.desc Verify getShownTimer maps 8499 ms to 8 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0017', 0, () => {
      const text: string = getShownTimer(8499);
      expect(text).assertEqual('0:8');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_1800
     * @tc.name testTimerTable0018
     * @tc.desc Verify getShownTimer maps 8500 ms to 9 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0018', 0, () => {
      const text: string = getShownTimer(8500);
      expect(text).assertEqual('0:9');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_1900
     * @tc.name testTimerTable0019
     * @tc.desc Verify getShownTimer maps 9499 ms to 9 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0019', 0, () => {
      const text: string = getShownTimer(9499);
      expect(text).assertEqual('0:9');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_2000
     * @tc.name testTimerTable0020
     * @tc.desc Verify getShownTimer maps 9500 ms to 10 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0020', 0, () => {
      const text: string = getShownTimer(9500);
      expect(text).assertEqual('0:10');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_2100
     * @tc.name testTimerTable0021
     * @tc.desc Verify getShownTimer maps 10499 ms to 10 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0021', 0, () => {
      const text: string = getShownTimer(10499);
      expect(text).assertEqual('0:10');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_2200
     * @tc.name testTimerTable0022
     * @tc.desc Verify getShownTimer maps 10500 ms to 11 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0022', 0, () => {
      const text: string = getShownTimer(10500);
      expect(text).assertEqual('0:11');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_2300
     * @tc.name testTimerTable0023
     * @tc.desc Verify getShownTimer maps 11499 ms to 11 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0023', 0, () => {
      const text: string = getShownTimer(11499);
      expect(text).assertEqual('0:11');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_2400
     * @tc.name testTimerTable0024
     * @tc.desc Verify getShownTimer maps 11500 ms to 12 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0024', 0, () => {
      const text: string = getShownTimer(11500);
      expect(text).assertEqual('0:12');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_2500
     * @tc.name testTimerTable0025
     * @tc.desc Verify getShownTimer maps 12499 ms to 12 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0025', 0, () => {
      const text: string = getShownTimer(12499);
      expect(text).assertEqual('0:12');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_2600
     * @tc.name testTimerTable0026
     * @tc.desc Verify getShownTimer maps 12500 ms to 13 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0026', 0, () => {
      const text: string = getShownTimer(12500);
      expect(text).assertEqual('0:13');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_2700
     * @tc.name testTimerTable0027
     * @tc.desc Verify getShownTimer maps 13499 ms to 13 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0027', 0, () => {
      const text: string = getShownTimer(13499);
      expect(text).assertEqual('0:13');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_2800
     * @tc.name testTimerTable0028
     * @tc.desc Verify getShownTimer maps 13500 ms to 14 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0028', 0, () => {
      const text: string = getShownTimer(13500);
      expect(text).assertEqual('0:14');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_2900
     * @tc.name testTimerTable0029
     * @tc.desc Verify getShownTimer maps 14499 ms to 14 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0029', 0, () => {
      const text: string = getShownTimer(14499);
      expect(text).assertEqual('0:14');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_3000
     * @tc.name testTimerTable0030
     * @tc.desc Verify getShownTimer maps 14500 ms to 15 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0030', 0, () => {
      const text: string = getShownTimer(14500);
      expect(text).assertEqual('0:15');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_3100
     * @tc.name testTimerTable0031
     * @tc.desc Verify getShownTimer maps 15499 ms to 15 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0031', 0, () => {
      const text: string = getShownTimer(15499);
      expect(text).assertEqual('0:15');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_3200
     * @tc.name testTimerTable0032
     * @tc.desc Verify getShownTimer maps 15500 ms to 16 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0032', 0, () => {
      const text: string = getShownTimer(15500);
      expect(text).assertEqual('0:16');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_3300
     * @tc.name testTimerTable0033
     * @tc.desc Verify getShownTimer maps 16499 ms to 16 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0033', 0, () => {
      const text: string = getShownTimer(16499);
      expect(text).assertEqual('0:16');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_3400
     * @tc.name testTimerTable0034
     * @tc.desc Verify getShownTimer maps 16500 ms to 17 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0034', 0, () => {
      const text: string = getShownTimer(16500);
      expect(text).assertEqual('0:17');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_3500
     * @tc.name testTimerTable0035
     * @tc.desc Verify getShownTimer maps 17499 ms to 17 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0035', 0, () => {
      const text: string = getShownTimer(17499);
      expect(text).assertEqual('0:17');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_3600
     * @tc.name testTimerTable0036
     * @tc.desc Verify getShownTimer maps 17500 ms to 18 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0036', 0, () => {
      const text: string = getShownTimer(17500);
      expect(text).assertEqual('0:18');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_3700
     * @tc.name testTimerTable0037
     * @tc.desc Verify getShownTimer maps 18499 ms to 18 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0037', 0, () => {
      const text: string = getShownTimer(18499);
      expect(text).assertEqual('0:18');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_3800
     * @tc.name testTimerTable0038
     * @tc.desc Verify getShownTimer maps 18500 ms to 19 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0038', 0, () => {
      const text: string = getShownTimer(18500);
      expect(text).assertEqual('0:19');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_3900
     * @tc.name testTimerTable0039
     * @tc.desc Verify getShownTimer maps 19499 ms to 19 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0039', 0, () => {
      const text: string = getShownTimer(19499);
      expect(text).assertEqual('0:19');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_4000
     * @tc.name testTimerTable0040
     * @tc.desc Verify getShownTimer maps 19500 ms to 20 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0040', 0, () => {
      const text: string = getShownTimer(19500);
      expect(text).assertEqual('0:20');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_4100
     * @tc.name testTimerTable0041
     * @tc.desc Verify getShownTimer maps 20499 ms to 20 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0041', 0, () => {
      const text: string = getShownTimer(20499);
      expect(text).assertEqual('0:20');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_4200
     * @tc.name testTimerTable0042
     * @tc.desc Verify getShownTimer maps 20500 ms to 21 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0042', 0, () => {
      const text: string = getShownTimer(20500);
      expect(text).assertEqual('0:21');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_4300
     * @tc.name testTimerTable0043
     * @tc.desc Verify getShownTimer maps 21499 ms to 21 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0043', 0, () => {
      const text: string = getShownTimer(21499);
      expect(text).assertEqual('0:21');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_4400
     * @tc.name testTimerTable0044
     * @tc.desc Verify getShownTimer maps 21500 ms to 22 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0044', 0, () => {
      const text: string = getShownTimer(21500);
      expect(text).assertEqual('0:22');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_4500
     * @tc.name testTimerTable0045
     * @tc.desc Verify getShownTimer maps 22499 ms to 22 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0045', 0, () => {
      const text: string = getShownTimer(22499);
      expect(text).assertEqual('0:22');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_4600
     * @tc.name testTimerTable0046
     * @tc.desc Verify getShownTimer maps 22500 ms to 23 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0046', 0, () => {
      const text: string = getShownTimer(22500);
      expect(text).assertEqual('0:23');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_4700
     * @tc.name testTimerTable0047
     * @tc.desc Verify getShownTimer maps 23499 ms to 23 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0047', 0, () => {
      const text: string = getShownTimer(23499);
      expect(text).assertEqual('0:23');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_4800
     * @tc.name testTimerTable0048
     * @tc.desc Verify getShownTimer maps 23500 ms to 24 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0048', 0, () => {
      const text: string = getShownTimer(23500);
      expect(text).assertEqual('0:24');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_4900
     * @tc.name testTimerTable0049
     * @tc.desc Verify getShownTimer maps 24499 ms to 24 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0049', 0, () => {
      const text: string = getShownTimer(24499);
      expect(text).assertEqual('0:24');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_5000
     * @tc.name testTimerTable0050
     * @tc.desc Verify getShownTimer maps 24500 ms to 25 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0050', 0, () => {
      const text: string = getShownTimer(24500);
      expect(text).assertEqual('0:25');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_5100
     * @tc.name testTimerTable0051
     * @tc.desc Verify getShownTimer maps 25499 ms to 25 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0051', 0, () => {
      const text: string = getShownTimer(25499);
      expect(text).assertEqual('0:25');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_5200
     * @tc.name testTimerTable0052
     * @tc.desc Verify getShownTimer maps 25500 ms to 26 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0052', 0, () => {
      const text: string = getShownTimer(25500);
      expect(text).assertEqual('0:26');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_5300
     * @tc.name testTimerTable0053
     * @tc.desc Verify getShownTimer maps 26499 ms to 26 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0053', 0, () => {
      const text: string = getShownTimer(26499);
      expect(text).assertEqual('0:26');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_5400
     * @tc.name testTimerTable0054
     * @tc.desc Verify getShownTimer maps 26500 ms to 27 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0054', 0, () => {
      const text: string = getShownTimer(26500);
      expect(text).assertEqual('0:27');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_5500
     * @tc.name testTimerTable0055
     * @tc.desc Verify getShownTimer maps 27499 ms to 27 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0055', 0, () => {
      const text: string = getShownTimer(27499);
      expect(text).assertEqual('0:27');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_5600
     * @tc.name testTimerTable0056
     * @tc.desc Verify getShownTimer maps 27500 ms to 28 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0056', 0, () => {
      const text: string = getShownTimer(27500);
      expect(text).assertEqual('0:28');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_5700
     * @tc.name testTimerTable0057
     * @tc.desc Verify getShownTimer maps 28499 ms to 28 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0057', 0, () => {
      const text: string = getShownTimer(28499);
      expect(text).assertEqual('0:28');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_5800
     * @tc.name testTimerTable0058
     * @tc.desc Verify getShownTimer maps 28500 ms to 29 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0058', 0, () => {
      const text: string = getShownTimer(28500);
      expect(text).assertEqual('0:29');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_5900
     * @tc.name testTimerTable0059
     * @tc.desc Verify getShownTimer maps 29499 ms to 29 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0059', 0, () => {
      const text: string = getShownTimer(29499);
      expect(text).assertEqual('0:29');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_6000
     * @tc.name testTimerTable0060
     * @tc.desc Verify getShownTimer maps 29500 ms to 30 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0060', 0, () => {
      const text: string = getShownTimer(29500);
      expect(text).assertEqual('0:30');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_6100
     * @tc.name testTimerTable0061
     * @tc.desc Verify getShownTimer maps 30499 ms to 30 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0061', 0, () => {
      const text: string = getShownTimer(30499);
      expect(text).assertEqual('0:30');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_6200
     * @tc.name testTimerTable0062
     * @tc.desc Verify getShownTimer maps 30500 ms to 31 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0062', 0, () => {
      const text: string = getShownTimer(30500);
      expect(text).assertEqual('0:31');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_6300
     * @tc.name testTimerTable0063
     * @tc.desc Verify getShownTimer maps 31499 ms to 31 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0063', 0, () => {
      const text: string = getShownTimer(31499);
      expect(text).assertEqual('0:31');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_6400
     * @tc.name testTimerTable0064
     * @tc.desc Verify getShownTimer maps 31500 ms to 32 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0064', 0, () => {
      const text: string = getShownTimer(31500);
      expect(text).assertEqual('0:32');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_6500
     * @tc.name testTimerTable0065
     * @tc.desc Verify getShownTimer maps 32499 ms to 32 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0065', 0, () => {
      const text: string = getShownTimer(32499);
      expect(text).assertEqual('0:32');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_6600
     * @tc.name testTimerTable0066
     * @tc.desc Verify getShownTimer maps 32500 ms to 33 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0066', 0, () => {
      const text: string = getShownTimer(32500);
      expect(text).assertEqual('0:33');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_6700
     * @tc.name testTimerTable0067
     * @tc.desc Verify getShownTimer maps 33499 ms to 33 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0067', 0, () => {
      const text: string = getShownTimer(33499);
      expect(text).assertEqual('0:33');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_6800
     * @tc.name testTimerTable0068
     * @tc.desc Verify getShownTimer maps 33500 ms to 34 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0068', 0, () => {
      const text: string = getShownTimer(33500);
      expect(text).assertEqual('0:34');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_6900
     * @tc.name testTimerTable0069
     * @tc.desc Verify getShownTimer maps 34499 ms to 34 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0069', 0, () => {
      const text: string = getShownTimer(34499);
      expect(text).assertEqual('0:34');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_7000
     * @tc.name testTimerTable0070
     * @tc.desc Verify getShownTimer maps 34500 ms to 35 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0070', 0, () => {
      const text: string = getShownTimer(34500);
      expect(text).assertEqual('0:35');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_7100
     * @tc.name testTimerTable0071
     * @tc.desc Verify getShownTimer maps 35499 ms to 35 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0071', 0, () => {
      const text: string = getShownTimer(35499);
      expect(text).assertEqual('0:35');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_7200
     * @tc.name testTimerTable0072
     * @tc.desc Verify getShownTimer maps 35500 ms to 36 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0072', 0, () => {
      const text: string = getShownTimer(35500);
      expect(text).assertEqual('0:36');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_7300
     * @tc.name testTimerTable0073
     * @tc.desc Verify getShownTimer maps 36499 ms to 36 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0073', 0, () => {
      const text: string = getShownTimer(36499);
      expect(text).assertEqual('0:36');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_7400
     * @tc.name testTimerTable0074
     * @tc.desc Verify getShownTimer maps 36500 ms to 37 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0074', 0, () => {
      const text: string = getShownTimer(36500);
      expect(text).assertEqual('0:37');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_7500
     * @tc.name testTimerTable0075
     * @tc.desc Verify getShownTimer maps 37499 ms to 37 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0075', 0, () => {
      const text: string = getShownTimer(37499);
      expect(text).assertEqual('0:37');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_7600
     * @tc.name testTimerTable0076
     * @tc.desc Verify getShownTimer maps 37500 ms to 38 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0076', 0, () => {
      const text: string = getShownTimer(37500);
      expect(text).assertEqual('0:38');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_7700
     * @tc.name testTimerTable0077
     * @tc.desc Verify getShownTimer maps 38499 ms to 38 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0077', 0, () => {
      const text: string = getShownTimer(38499);
      expect(text).assertEqual('0:38');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_7800
     * @tc.name testTimerTable0078
     * @tc.desc Verify getShownTimer maps 38500 ms to 39 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0078', 0, () => {
      const text: string = getShownTimer(38500);
      expect(text).assertEqual('0:39');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_7900
     * @tc.name testTimerTable0079
     * @tc.desc Verify getShownTimer maps 39499 ms to 39 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0079', 0, () => {
      const text: string = getShownTimer(39499);
      expect(text).assertEqual('0:39');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_8000
     * @tc.name testTimerTable0080
     * @tc.desc Verify getShownTimer maps 39500 ms to 40 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0080', 0, () => {
      const text: string = getShownTimer(39500);
      expect(text).assertEqual('0:40');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_8100
     * @tc.name testTimerTable0081
     * @tc.desc Verify getShownTimer maps 40499 ms to 40 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0081', 0, () => {
      const text: string = getShownTimer(40499);
      expect(text).assertEqual('0:40');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_8200
     * @tc.name testTimerTable0082
     * @tc.desc Verify getShownTimer maps 40500 ms to 41 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0082', 0, () => {
      const text: string = getShownTimer(40500);
      expect(text).assertEqual('0:41');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_8300
     * @tc.name testTimerTable0083
     * @tc.desc Verify getShownTimer maps 41499 ms to 41 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0083', 0, () => {
      const text: string = getShownTimer(41499);
      expect(text).assertEqual('0:41');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_8400
     * @tc.name testTimerTable0084
     * @tc.desc Verify getShownTimer maps 41500 ms to 42 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0084', 0, () => {
      const text: string = getShownTimer(41500);
      expect(text).assertEqual('0:42');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_8500
     * @tc.name testTimerTable0085
     * @tc.desc Verify getShownTimer maps 42499 ms to 42 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0085', 0, () => {
      const text: string = getShownTimer(42499);
      expect(text).assertEqual('0:42');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_8600
     * @tc.name testTimerTable0086
     * @tc.desc Verify getShownTimer maps 42500 ms to 43 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0086', 0, () => {
      const text: string = getShownTimer(42500);
      expect(text).assertEqual('0:43');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_8700
     * @tc.name testTimerTable0087
     * @tc.desc Verify getShownTimer maps 43499 ms to 43 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0087', 0, () => {
      const text: string = getShownTimer(43499);
      expect(text).assertEqual('0:43');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_8800
     * @tc.name testTimerTable0088
     * @tc.desc Verify getShownTimer maps 43500 ms to 44 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0088', 0, () => {
      const text: string = getShownTimer(43500);
      expect(text).assertEqual('0:44');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_8900
     * @tc.name testTimerTable0089
     * @tc.desc Verify getShownTimer maps 44499 ms to 44 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0089', 0, () => {
      const text: string = getShownTimer(44499);
      expect(text).assertEqual('0:44');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_9000
     * @tc.name testTimerTable0090
     * @tc.desc Verify getShownTimer maps 44500 ms to 45 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0090', 0, () => {
      const text: string = getShownTimer(44500);
      expect(text).assertEqual('0:45');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_9100
     * @tc.name testTimerTable0091
     * @tc.desc Verify getShownTimer maps 45499 ms to 45 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0091', 0, () => {
      const text: string = getShownTimer(45499);
      expect(text).assertEqual('0:45');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_9200
     * @tc.name testTimerTable0092
     * @tc.desc Verify getShownTimer maps 45500 ms to 46 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0092', 0, () => {
      const text: string = getShownTimer(45500);
      expect(text).assertEqual('0:46');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_9300
     * @tc.name testTimerTable0093
     * @tc.desc Verify getShownTimer maps 46499 ms to 46 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0093', 0, () => {
      const text: string = getShownTimer(46499);
      expect(text).assertEqual('0:46');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_9400
     * @tc.name testTimerTable0094
     * @tc.desc Verify getShownTimer maps 46500 ms to 47 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0094', 0, () => {
      const text: string = getShownTimer(46500);
      expect(text).assertEqual('0:47');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_9500
     * @tc.name testTimerTable0095
     * @tc.desc Verify getShownTimer maps 47499 ms to 47 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0095', 0, () => {
      const text: string = getShownTimer(47499);
      expect(text).assertEqual('0:47');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_9600
     * @tc.name testTimerTable0096
     * @tc.desc Verify getShownTimer maps 47500 ms to 48 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0096', 0, () => {
      const text: string = getShownTimer(47500);
      expect(text).assertEqual('0:48');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_9700
     * @tc.name testTimerTable0097
     * @tc.desc Verify getShownTimer maps 3600000 ms to 3600 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0097', 0, () => {
      const text: string = getShownTimer(3600000);
      expect(text).assertEqual('60:0');
      expect(text.indexOf(':')).assertEqual(2);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_9800
     * @tc.name testTimerTable0098
     * @tc.desc Verify getShownTimer maps 3599999 ms to 3600 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0098', 0, () => {
      const text: string = getShownTimer(3599999);
      expect(text).assertEqual('60:0');
      expect(text.indexOf(':')).assertEqual(2);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_9900
     * @tc.name testTimerTable0099
     * @tc.desc Verify getShownTimer maps 86399000 ms to 86399 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0099', 0, () => {
      const text: string = getShownTimer(86399000);
      expect(text).assertEqual('1439:59');
      expect(text.indexOf(':')).assertEqual(4);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_10000
     * @tc.name testTimerTable0100
     * @tc.desc Verify getShownTimer maps 86399499 ms to 86399 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0100', 0, () => {
      const text: string = getShownTimer(86399499);
      expect(text).assertEqual('1439:59');
      expect(text.indexOf(':')).assertEqual(4);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_10100
     * @tc.name testTimerTable0101
     * @tc.desc Verify getShownTimer maps 123456789 ms to 123457 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0101', 0, () => {
      const text: string = getShownTimer(123456789);
      expect(text).assertEqual('2057:37');
      expect(text.indexOf(':')).assertEqual(4);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_10200
     * @tc.name testTimerTable0102
     * @tc.desc Verify getShownTimer maps 60000 ms to 60 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0102', 0, () => {
      const text: string = getShownTimer(60000);
      expect(text).assertEqual('1:0');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_10300
     * @tc.name testTimerTable0103
     * @tc.desc Verify getShownTimer maps 59999 ms to 60 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0103', 0, () => {
      const text: string = getShownTimer(59999);
      expect(text).assertEqual('1:0');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_TIMER_10400
     * @tc.name testTimerTable0104
     * @tc.desc Verify getShownTimer maps 61500 ms to 62 whole seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTimerTable0104', 0, () => {
      const text: string = getShownTimer(61500);
      expect(text).assertEqual('1:2');
      expect(text.indexOf(':')).assertEqual(1);
      expect(/^\d{1,4}:\d{1,2}$/.test(text)).assertTrue();
    })
  })
}
