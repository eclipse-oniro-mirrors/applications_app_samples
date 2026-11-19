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

export default function fdateReal02Test() {
  describe('FdateReal02', () => {

    /**
     * @tc.name   testFdate0021
     * @tc.number SUB_WEATHER_FDATE_0021
     * @tc.desc   Anchor: formTimeSlot(24) is out of every slot range and yields undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFdate0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0021 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(24)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result))
      expect(result).assertUndefined()
      expect(String(result) === 'null').assertFalse()
      expect(String(result) === '').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0021 end')
    })

    /**
     * @tc.name   testFdate0022
     * @tc.number SUB_WEATHER_FDATE_0022
     * @tc.desc   Anchor: formTimeSlot(-1) negative hour yields undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFdate0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0022 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(-1)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result))
      expect(result).assertUndefined()
      expect(String(result) === 'null').assertFalse()
      expect(typeof result).assertEqual('undefined')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0022 end')
    })

    /**
     * @tc.name   testFdate0023
     * @tc.number SUB_WEATHER_FDATE_0023
     * @tc.desc   Anchor: formTimeSlot(8.5) falls into the gap between 早上 and 上午
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0023 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(8.5)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result))
      expect(result).assertUndefined()
      expect(result === '早上').assertFalse()
      expect(result === '上午').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0023 end')
    })

    /**
     * @tc.name   testFdate0024
     * @tc.number SUB_WEATHER_FDATE_0024
     * @tc.desc   formTimeSlot(10.5) stays inside 上午 range 9..11 exclusive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0024 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(10.5)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '上午')
      expect(result).assertEqual('上午')
      expect(String(result).length).assertEqual(2)
      expect(result === '上午').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0024 end')
    })

    /**
     * @tc.name   testFdate0025
     * @tc.number SUB_WEATHER_FDATE_0025
     * @tc.desc   Anchor: formTimeSlot(23.5) exceeds the 晚上 upper bound 23
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0025 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(23.5)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result))
      expect(result).assertUndefined()
      expect(result === '晚上').assertFalse()
      expect(String(result) === 'null').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0025 end')
    })

    /**
     * @tc.name   testFdate0026
     * @tc.number SUB_WEATHER_FDATE_0026
     * @tc.desc   formTimeSlot(0.5) belongs to 早上 since range starts at 0 inclusive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0026 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(0.5)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '早上')
      expect(result).assertEqual('早上')
      expect(String(result).length).assertEqual(2)
      expect(result === '早上').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0026 end')
    })

    /**
     * @tc.name   testFdate0027
     * @tc.number SUB_WEATHER_FDATE_0027
     * @tc.desc   Anchor: fill(10) keeps the two-digit value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFdate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0027 begin')
      const form = new FormDate()
      const result = form.fill(10)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[%{public}s]', result, '10')
      expect(result).assertEqual('10')
      expect(String(result).length).assertEqual(2)
      expect(result === '10').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0027 end')
    })

    /**
     * @tc.name   testFdate0028
     * @tc.number SUB_WEATHER_FDATE_0028
     * @tc.desc   Anchor: fill(99) keeps the two-digit value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFdate0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0028 begin')
      const form = new FormDate()
      const result = form.fill(99)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s]', result)
      expect(result).assertEqual('99')
      expect(String(result).length).assertEqual(2)
      expect(result === '099').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0028 end')
    })

    /**
     * @tc.name   testFdate0029
     * @tc.number SUB_WEATHER_FDATE_0029
     * @tc.desc   Anchor: fill(undefined) string-concatenates to '0undefined'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0029 begin')
      const form = new FormDate()
      const result = form.fill()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, '0undefined')
      expect(result).assertEqual('0undefined')
      expect(result.startsWith('0')).assertTrue()
      expect(String(result).length).assertEqual(10)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0029 end')
    })

    /**
     * @tc.name   testFdate0030
     * @tc.number SUB_WEATHER_FDATE_0030
     * @tc.desc   fill(-1) pads the negative literal producing '0-1'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0030 begin')
      const form = new FormDate()
      const result = form.fill(-1)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, '0-1')
      expect(result).assertEqual('0-1')
      expect(String(result).length).assertEqual(3)
      expect(result.startsWith('0')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0030 end')
    })

    /**
     * @tc.name   testFdate0031
     * @tc.number SUB_WEATHER_FDATE_0031
     * @tc.desc   Anchor: formMonthDay keeps the double-digit month prefix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFdate0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0031 begin')
      const form = new FormDate()
      const result = form.formMonthDay('2024-10-15T12:00:00')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=[%{public}s] expected=[%{public}s]', result, '10/15')
      expect(result).assertEqual('10/15')
      expect(String(result).length).assertEqual(5)
      expect(result.startsWith('10/')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0031 end')
    })

    /**
     * @tc.name   testFdate0032
     * @tc.number SUB_WEATHER_FDATE_0032
     * @tc.desc   formMonthDay keeps padded month and raw two-digit day (leap day)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0032 begin')
      const form = new FormDate()
      const result = form.formMonthDay('2024-02-29T12:00:00')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, '02/29')
      expect(result).assertEqual('02/29')
      expect(result.startsWith('02')).assertTrue()
      expect(String(result).length).assertEqual(5)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0032 end')
    })

    /**
     * @tc.name   testFdate0033
     * @tc.number SUB_WEATHER_FDATE_0033
     * @tc.desc   formMonthDay keeps double-digit month and single-digit day unpadded
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0033 begin')
      const form = new FormDate()
      const result = form.formMonthDay('2024-12-05T12:00:00')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, '12/5')
      expect(result).assertEqual('12/5')
      expect(result.endsWith('5')).assertTrue()
      expect(String(result).length).assertEqual(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0033 end')
    })

    /**
     * @tc.name   testFdate0034
     * @tc.number SUB_WEATHER_FDATE_0034
     * @tc.desc   formMonthDay without argument always contains a slash separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFdate0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0034 begin')
      const form = new FormDate()
      const result = form.formMonthDay()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', result)
      expect(result.includes('/')).assertTrue()
      expect(result.split('/').length).assertEqual(2)
      expect(typeof result).assertEqual('string')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0034 end')
    })

    /**
     * @tc.name   testFdate0035
     * @tc.number SUB_WEATHER_FDATE_0035
     * @tc.desc   formDay maps getDay() 0-6 to the seven weekday labels, Sunday included
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFdate0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0035 begin')
      const form = new FormDate()
      const result = form.formDay()
      const isSunday = new Date().getDay() === 0
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s isSunday=%{public}s', String(result), String(isSunday))
      if (isSunday) {
        expect(result).assertEqual('星期日')
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(String(result).startsWith('星期')))
      expect(String(result).startsWith('星期')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(String(result) === 'null'))
      expect(String(result) === 'null').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(isSunday || String(result).length === 3))
      expect(isSunday || String(result).length === 3).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0035 end')
    })

    /**
     * @tc.name   testFdate0036
     * @tc.number SUB_WEATHER_FDATE_0036
     * @tc.desc   formDay returns one of the seven weekday labels or undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testFdate0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0036 begin')
      const form = new FormDate()
      const result = form.formDay()
      const labels: string[] = ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日']
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result))
      expect(result === undefined || labels.includes(String(result))).assertTrue()
      expect(String(result) === 'null').assertFalse()
      expect(String(result) === '').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0036 end')
    })

    /**
     * @tc.name   testFdate0037
     * @tc.number SUB_WEATHER_FDATE_0037
     * @tc.desc   fill(5) pads to '05' preserving the numeric text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testFdate0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0037 begin')
      const form = new FormDate()
      const result = form.fill(5)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, '05')
      expect(result).assertEqual('05')
      expect(String(result).length).assertEqual(2)
      expect(result.endsWith('5')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0037 end')
    })

    /**
     * @tc.name   testFdate0038
     * @tc.number SUB_WEATHER_FDATE_0038
     * @tc.desc   Anchor: formTimeSlot(13.5) falls into the gap between 中午 and 下午
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0038 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(13.5)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result))
      expect(result).assertUndefined()
      expect(result === '中午').assertFalse()
      expect(result === '下午').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0038 end')
    })

    /**
     * @tc.name   testFdate0039
     * @tc.number SUB_WEATHER_FDATE_0039
     * @tc.desc   Anchor: formTimeSlot(16.5) falls into the gap between 下午 and 傍晚
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0039 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(16.5)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(result))
      expect(result).assertUndefined()
      expect(result === '下午').assertFalse()
      expect(result === '傍晚').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0039 end')
    })

    /**
     * @tc.name   testFdate0040
     * @tc.number SUB_WEATHER_FDATE_0040
     * @tc.desc   formTimeSlot(11.5) stays inside 中午 for half-open integer ranges
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testFdate0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0040 begin')
      const form = new FormDate()
      const result = form.formTimeSlot(11.5)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), '中午')
      expect(result).assertEqual('中午')
      expect(String(result).length).assertEqual(2)
      expect(result === '中午').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFdate0040 end')
    })
  })
}
