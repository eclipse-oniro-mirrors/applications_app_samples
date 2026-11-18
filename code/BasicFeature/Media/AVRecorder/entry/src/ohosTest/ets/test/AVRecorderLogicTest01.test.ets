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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './TestPace';
import DateTimeUtil, { getShownTimer, dateTime } from '../../../main/ets/utils/DateTimeUtil';

const DOMAIN: number = 0xF811;
const TAG: string = 'AVRecorderLogicTest01';

export default function AVRecorderLogic01Test() {
  describe('AVRecorderLogic01Test', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_AVRECORDER_LOGIC_TEST01_0100
     * @tc.name      testAVRecorderLogic01Chapter0001
     * @tc.desc      Verify fill pads a single digit value with a leading zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVRecorderLogic01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(5)).assertEqual('05');
      expect(util.fill(10)).assertEqual('10');
      expect(util.fill(0)).assertEqual('00');
      expect(util.fill(9)).assertEqual('09');
    })

    /**
     * @tc.number    SUB_AVRECORDER_LOGIC_TEST01_0200
     * @tc.name      testAVRecorderLogic01Chapter0002
     * @tc.desc      Verify concatTime builds a six digit time string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVRecorderLogic01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      hilog.info(DOMAIN, TAG, 'concatTime=%{public}s', util.concatTime(1, 2, 3));
      expect(util.concatTime(1, 2, 3)).assertEqual('010203');
      expect(util.concatTime(0, 0, 0)).assertEqual('000000');
      expect(util.concatTime(23, 59, 59)).assertEqual('235959');
    })

    /**
     * @tc.number    SUB_AVRECORDER_LOGIC_TEST01_0300
     * @tc.name      testAVRecorderLogic01Chapter0003
     * @tc.desc      Verify getTime returns a six digit current time string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVRecorderLogic01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const time: string = util.getTime();
      expect(time.length).assertEqual(6);
      expect(/^\d{6}$/.test(time)).assertTrue();
      const hour: number = Number(time.substring(0, 2));
      const minute: number = Number(time.substring(2, 4));
      const second: number = Number(time.substring(4, 6));
      expect(hour >= 0 && hour < 24).assertTrue();
      expect(minute >= 0 && minute < 60).assertTrue();
      expect(second >= 0 && second < 60).assertTrue();
    })

    /**
     * @tc.number    SUB_AVRECORDER_LOGIC_TEST01_0400
     * @tc.name      testAVRecorderLogic01Chapter0004
     * @tc.desc      Verify getShownTimer renders the minute and second parts of a duration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVRecorderLogic01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const shown: string = getShownTimer(65000);
      hilog.info(DOMAIN, TAG, 'shownTimer=%{public}s', shown);
      expect(shown).assertEqual('1:5');
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(getShownTimer(120000)).assertEqual('2:0');
      expect(getShownTimer(59999)).assertEqual('1:0');
    })

    /**
     * @tc.number    SUB_AVRECORDER_LOGIC_TEST01_0500
     * @tc.name      testAVRecorderLogic01Chapter0005
     * @tc.desc      Verify dateTime renders a zero padded duration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAVRecorderLogic01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(65)).assertEqual('01:05');
      expect(dateTime(9)).assertEqual('00:09');
      expect(dateTime(0)).assertEqual('00:00');
      expect(dateTime(600)).assertEqual('10:00');
      expect(dateTime(3599)).assertEqual('59:59');
    })


  })
}