/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { FormDate } from '@ohos/common'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

export default function fdateReal01Test() {
  describe('FdateReal01', () => {

    /**
     * @tc.name   testFdate0001
     * @tc.number SUB_WEATHER_FDATE_0001
     * @tc.desc   Anchor: formTimeSlot(0) resolves to the early-morning slot (0 is a valid hour)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0001 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(0)
      const deviceSlot = form.formTimeSlot(new Date().getHours())
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s deviceSlot=%{public}s', String(result), String(deviceSlot))
      expect(result).assertEqual('早上')
      expect(result === '早上' || result === '上午' || result === '中午' ||
        result === '下午' || result === '傍晚' || result === '晚上').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(String(result) !== ''))
      expect(String(result) !== '').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0001 end')
    })

    /**
     * @tc.name   testFdate0002
     * @tc.number SUB_WEATHER_FDATE_0002
     * @tc.desc   formTimeSlot returns 早上 for mid-night hour 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0002 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '早上')
      expect(result).assertEqual('早上')
      expect(typeof result).assertEqual('string')
      expect(String(result).length > 0).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0002 end')
    })

    /**
     * @tc.name   testFdate0003
     * @tc.number SUB_WEATHER_FDATE_0003
     * @tc.desc   formTimeSlot returns 早上 for upper boundary hour 8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0003 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(8)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '早上')
      expect(result).assertEqual('早上')
      expect(String(result).length).assertEqual(2)
      expect(result === '早上').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0003 end')
    })

    /**
     * @tc.name   testFdate0004
     * @tc.number SUB_WEATHER_FDATE_0004
     * @tc.desc   formTimeSlot returns 上午 for lower boundary hour 9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0004 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(9)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '上午')
      expect(result).assertEqual('上午')
      expect(String(result).length).assertEqual(2)
      expect(result === '上午').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0004 end')
    })

    /**
     * @tc.name   testFdate0005
     * @tc.number SUB_WEATHER_FDATE_0005
     * @tc.desc   formTimeSlot returns 上午 for hour 10 (excluded from 中午)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0005 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(10)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '上午')
      expect(result).assertEqual('上午')
      expect(String(result).length > 0).assertTrue()
      expect(result === '上午').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0005 end')
    })

    /**
     * @tc.name   testFdate0006
     * @tc.number SUB_WEATHER_FDATE_0006
     * @tc.desc   formTimeSlot returns 中午 for lower boundary hour 11
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0006 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(11)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '中午')
      expect(result).assertEqual('中午')
      expect(String(result).length).assertEqual(2)
      expect(result === '中午').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0006 end')
    })

    /**
     * @tc.name   testFdate0007
     * @tc.number SUB_WEATHER_FDATE_0007
     * @tc.desc   formTimeSlot returns 中午 for noon hour 12
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0007 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(12)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '中午')
      expect(result).assertEqual('中午')
      expect(String(result).length).assertEqual(2)
      expect(result === '中午').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0007 end')
    })

    /**
     * @tc.name   testFdate0008
     * @tc.number SUB_WEATHER_FDATE_0008
     * @tc.desc   formTimeSlot returns 中午 for upper boundary hour 13
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0008 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(13)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '中午')
      expect(result).assertEqual('中午')
      expect(String(result).length).assertEqual(2)
      expect(result === '中午').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0008 end')
    })

    /**
     * @tc.name   testFdate0009
     * @tc.number SUB_WEATHER_FDATE_0009
     * @tc.desc   formTimeSlot returns 下午 for lower boundary hour 14
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0009 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(14)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '下午')
      expect(result).assertEqual('下午')
      expect(String(result).length).assertEqual(2)
      expect(result === '下午').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0009 end')
    })

    /**
     * @tc.name   testFdate0010
     * @tc.number SUB_WEATHER_FDATE_0010
     * @tc.desc   formTimeSlot returns 下午 for upper boundary hour 16
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0010 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(16)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '下午')
      expect(result).assertEqual('下午')
      expect(String(result).length).assertEqual(2)
      expect(result === '下午').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0010 end')
    })

    /**
     * @tc.name   testFdate0011
     * @tc.number SUB_WEATHER_FDATE_0011
     * @tc.desc   formTimeSlot returns 傍晚 for lower boundary hour 17
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0011 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(17)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '傍晚')
      expect(result).assertEqual('傍晚')
      expect(String(result).length).assertEqual(2)
      expect(result === '傍晚').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0011 end')
    })

    /**
     * @tc.name   testFdate0012
     * @tc.number SUB_WEATHER_FDATE_0012
     * @tc.desc   formTimeSlot returns 傍晚 for hour 18
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0012 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(18)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '傍晚')
      expect(result).assertEqual('傍晚')
      expect(String(result).length).assertEqual(2)
      expect(result === '傍晚').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0012 end')
    })

    /**
     * @tc.name   testFdate0013
     * @tc.number SUB_WEATHER_FDATE_0013
     * @tc.desc   formTimeSlot returns 傍晚 for hour 19 (first-match wins over 晚上)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0013 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(19)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '傍晚')
      expect(result).assertEqual('傍晚')
      expect(String(result).length).assertEqual(2)
      expect(result !== '晚上').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0013 end')
    })

    /**
     * @tc.name   testFdate0014
     * @tc.number SUB_WEATHER_FDATE_0014
     * @tc.desc   formTimeSlot returns 晚上 for hour 20
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0014 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(20)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '晚上')
      expect(result).assertEqual('晚上')
      expect(String(result).length).assertEqual(2)
      expect(result === '晚上').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0014 end')
    })

    /**
     * @tc.name   testFdate0015
     * @tc.number SUB_WEATHER_FDATE_0015
     * @tc.desc   formTimeSlot returns 晚上 for hour 23 (last hour of day)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0015 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(23)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '晚上')
      expect(result).assertEqual('晚上')
      expect(String(result).length).assertEqual(2)
      expect(result === '晚上').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0015 end')
    })

    /**
     * @tc.name   testFdate0016
     * @tc.number SUB_WEATHER_FDATE_0016
     * @tc.desc   formTimeSlot without argument resolves the current hour slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFdate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0016 begin')
      const form = new FormDate()
      const result = form.formTimeSlot()
      const labels: string[] = ['早上', '上午', '中午', '下午', '傍晚', '晚上']
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result))
      expect(labels.includes(String(result))).assertTrue()
      expect(typeof result).assertEqual('string')
      expect(String(result).length).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0016 end')
    })

    /**
     * @tc.name   testFdate0017
     * @tc.number SUB_WEATHER_FDATE_0017
     * @tc.desc   fill pads single digit 0 with leading zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0017 begin')
      const form = new FormDate()
      const result = form.fill(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, '00')
      expect(result).assertEqual('00')
      expect(String(result).length).assertEqual(2)
      expect(result.startsWith('0')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0017 end')
    })

    /**
     * @tc.name   testFdate0018
     * @tc.number SUB_WEATHER_FDATE_0018
     * @tc.desc   fill pads single digit 9 with leading zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0018 begin')
      const form = new FormDate()
      const result = form.fill(9)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, '09')
      expect(result).assertEqual('09')
      expect(String(result).length).assertEqual(2)
      expect(result === '09').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0018 end')
    })

    /**
     * @tc.name   testFdate0019
     * @tc.number SUB_WEATHER_FDATE_0019
     * @tc.desc   formMonthDay pads a single-digit month but keeps the day unpadded
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0019 begin')
      const form = new FormDate()
      const result = form.formMonthDay('2024-03-05T12:00:00')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, '03/5')
      expect(result).assertEqual('03/5')
      expect(result.includes('/')).assertTrue()
      expect(String(result).length).assertEqual(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0019 end')
    })

    /**
     * @tc.name   testFdate0020
     * @tc.number SUB_WEATHER_FDATE_0020
     * @tc.desc   formMonthDay keeps a padded month and unpadded day in a double-digit month
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0020 begin')
      const form = new FormDate()
      const result = form.formMonthDay('2022-09-07T12:00:00')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, '09/7')
      expect(result).assertEqual('09/7')
      expect(result.split('/').length).assertEqual(2)
      expect(String(result).length).assertEqual(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0020 end')
    })
  })
}
