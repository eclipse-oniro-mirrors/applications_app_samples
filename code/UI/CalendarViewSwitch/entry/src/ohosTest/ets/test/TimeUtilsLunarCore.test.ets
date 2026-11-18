/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TimeUtils } from '../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'TimeUtilsLunarCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function timeUtilsLunarCoreTest(): void {
  describe('TimeUtilsLunarCoreTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0201
     * @tc.name      testLunarCore0201
     * @tc.desc      Checks lunarMonthToChinese maps lunar month 1 to 正月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0201 begin');
      const actual: string = TimeUtils.lunarMonthToChinese(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='正月'`);
      expect(actual).assertEqual('正月');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testLunarCore0201 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0202
     * @tc.name      testLunarCore0202
     * @tc.desc      Checks lunarMonthToChinese maps lunar month 2 to 二月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0202 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(2)}, expected='二月'`);
      expect(TimeUtils.lunarMonthToChinese(2)).assertEqual('二月');
      log('testLunarCore0202 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0203
     * @tc.name      testLunarCore0203
     * @tc.desc      Checks lunarMonthToChinese maps lunar month 3 to 三月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0203 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(3)}, expected='三月'`);
      expect(TimeUtils.lunarMonthToChinese(3)).assertEqual('三月');
      log('testLunarCore0203 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0204
     * @tc.name      testLunarCore0204
     * @tc.desc      Checks lunarMonthToChinese maps lunar month 6 to 六月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0204 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(6)}, expected='六月'`);
      expect(TimeUtils.lunarMonthToChinese(6)).assertEqual('六月');
      log('testLunarCore0204 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0205
     * @tc.name      testLunarCore0205
     * @tc.desc      Checks lunarMonthToChinese maps lunar month 10 to 十月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0205 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(10)}, expected='十月'`);
      expect(TimeUtils.lunarMonthToChinese(10)).assertEqual('十月');
      log('testLunarCore0205 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0206
     * @tc.name      testLunarCore0206
     * @tc.desc      Checks lunarMonthToChinese maps lunar month 11 to 十一月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0206 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(11)}, expected='十一月'`);
      expect(TimeUtils.lunarMonthToChinese(11)).assertEqual('十一月');
      log('testLunarCore0206 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0207
     * @tc.name      testLunarCore0207
     * @tc.desc      Checks lunarMonthToChinese maps lunar month 12 to 腊月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0207 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(12)}, expected='腊月'`);
      expect(TimeUtils.lunarMonthToChinese(12)).assertEqual('腊月');
      log('testLunarCore0207 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0208
     * @tc.name      testLunarCore0208
     * @tc.desc      Checks lunarMonthToChinese maps negative month -1 to leap 闰正月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0208 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(-1)}, expected='闰正月'`);
      expect(TimeUtils.lunarMonthToChinese(-1)).assertEqual('闰正月');
      log('testLunarCore0208 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0209
     * @tc.name      testLunarCore0209
     * @tc.desc      Checks lunarMonthToChinese maps negative month -6 to leap 闰六月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0209 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(-6)}, expected='闰六月'`);
      expect(TimeUtils.lunarMonthToChinese(-6)).assertEqual('闰六月');
      log('testLunarCore0209 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0210
     * @tc.name      testLunarCore0210
     * @tc.desc      Checks lunarMonthToChinese maps negative month -12 to leap 闰腊月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0210 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(-12)}, expected='闰腊月'`);
      expect(TimeUtils.lunarMonthToChinese(-12)).assertEqual('闰腊月');
      log('testLunarCore0210 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0211
     * @tc.name      testLunarCore0211
     * @tc.desc      Checks every lunar month 1 to 12 ends with the 月 character.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0211 begin');
      let allEndWithMonth: boolean = true;
      for (let i: number = 1; i <= 12; i++) {
        if (!TimeUtils.lunarMonthToChinese(i).endsWith('月')) {
          allEndWithMonth = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allEndWithMonth=${allEndWithMonth}`);
      expect(allEndWithMonth).assertTrue();
      log('testLunarCore0211 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0212
     * @tc.name      testLunarCore0212
     * @tc.desc      Checks lunarDayToChinese maps day 1 to 初一.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0212 begin');
      const actual: string = TimeUtils.lunarDayToChinese(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='初一'`);
      expect(actual).assertEqual('初一');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='string'`);
      expect(typeof actual).assertEqual('string');
      log('testLunarCore0212 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0213
     * @tc.name      testLunarCore0213
     * @tc.desc      Checks lunarDayToChinese maps day 10 to 初十.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0213 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarDayToChinese(10)}, expected='初十'`);
      expect(TimeUtils.lunarDayToChinese(10)).assertEqual('初十');
      log('testLunarCore0213 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0214
     * @tc.name      testLunarCore0214
     * @tc.desc      Checks lunarDayToChinese maps day 11 to 十一.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0214 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarDayToChinese(11)}, expected='十一'`);
      expect(TimeUtils.lunarDayToChinese(11)).assertEqual('十一');
      log('testLunarCore0214 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0215
     * @tc.name      testLunarCore0215
     * @tc.desc      Checks lunarDayToChinese maps day 20 to 二十.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0215 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarDayToChinese(20)}, expected='二十'`);
      expect(TimeUtils.lunarDayToChinese(20)).assertEqual('二十');
      log('testLunarCore0215 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0216
     * @tc.name      testLunarCore0216
     * @tc.desc      Checks lunarDayToChinese maps day 21 to 廿一.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0216 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarDayToChinese(21)}, expected='廿一'`);
      expect(TimeUtils.lunarDayToChinese(21)).assertEqual('廿一');
      log('testLunarCore0216 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0217
     * @tc.name      testLunarCore0217
     * @tc.desc      Checks lunarDayToChinese maps day 29 to 廿九.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0217 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarDayToChinese(29)}, expected='廿九'`);
      expect(TimeUtils.lunarDayToChinese(29)).assertEqual('廿九');
      log('testLunarCore0217 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0218
     * @tc.name      testLunarCore0218
     * @tc.desc      Checks lunarDayToChinese maps day 30 to 三十.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0218 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarDayToChinese(30)}, expected='三十'`);
      expect(TimeUtils.lunarDayToChinese(30)).assertEqual('三十');
      log('testLunarCore0218 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0219
     * @tc.name      testLunarCore0219
     * @tc.desc      Checks every lunar day 1 to 30 yields a non-empty Chinese string.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0219 begin');
      let allNonEmpty: boolean = true;
      for (let i: number = 1; i <= 30; i++) {
        if (TimeUtils.lunarDayToChinese(i).length === 0) {
          allNonEmpty = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allNonEmpty=${allNonEmpty}`);
      expect(allNonEmpty).assertTrue();
      log('testLunarCore0219 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0220
     * @tc.name      testLunarCore0220
     * @tc.desc      Checks lunarDayToChinese returns undefined for out-of-range day 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0220 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined TimeUtils.lunarDayToChinese(0)`);
      expect(TimeUtils.lunarDayToChinese(0)).assertUndefined();
      log('testLunarCore0220 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0221
     * @tc.name      testLunarCore0221
     * @tc.desc      Checks lunarDayToChinese returns undefined for out-of-range day 31.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0221 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined TimeUtils.lunarDayToChinese(31)`);
      expect(TimeUtils.lunarDayToChinese(31)).assertUndefined();
      log('testLunarCore0221 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0222
     * @tc.name      testLunarCore0222
     * @tc.desc      Checks lunarMonthToChinese pins undefined month 0 behavior to undefined月.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0222 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(0)}`);
      expect(TimeUtils.lunarMonthToChinese(0)).assertEqual('undefined月');
      log('testLunarCore0222 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0223
     * @tc.name      testLunarCore0223
     * @tc.desc      Checks lunarMonthToChinese pins out-of-range leap month -13 behavior.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0223 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${TimeUtils.lunarMonthToChinese(-13)}`);
      expect(TimeUtils.lunarMonthToChinese(-13)).assertEqual('闰undefined月');
      log('testLunarCore0223 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0224
     * @tc.name      testLunarCore0224
     * @tc.desc      Checks isLunarFirstDayOfMonth is true for 2024 Spring Festival 2024-02-10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0224 begin');
      const actual: boolean = TimeUtils.isLunarFirstDayOfMonth(2024, 2, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${actual}`);
      expect(actual).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='boolean'`);
      expect(typeof actual).assertEqual('boolean');
      log('testLunarCore0224 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0225
     * @tc.name      testLunarCore0225
     * @tc.desc      Checks isLunarFirstDayOfMonth is true for 2025 Spring Festival 2025-01-29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0225 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${TimeUtils.isLunarFirstDayOfMonth(2025, 1, 29)}`);
      expect(TimeUtils.isLunarFirstDayOfMonth(2025, 1, 29)).assertTrue();
      log('testLunarCore0225 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0226
     * @tc.name      testLunarCore0226
     * @tc.desc      Checks isLunarFirstDayOfMonth is true for 2023 Spring Festival 2023-01-22.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0226 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${TimeUtils.isLunarFirstDayOfMonth(2023, 1, 22)}`);
      expect(TimeUtils.isLunarFirstDayOfMonth(2023, 1, 22)).assertTrue();
      log('testLunarCore0226 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0227
     * @tc.name      testLunarCore0227
     * @tc.desc      Checks isLunarFirstDayOfMonth is false for the second lunar day 2024-02-11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0227 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${TimeUtils.isLunarFirstDayOfMonth(2024, 2, 11)}`);
      expect(TimeUtils.isLunarFirstDayOfMonth(2024, 2, 11)).assertFalse();
      log('testLunarCore0227 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0228
     * @tc.name      testLunarCore0228
     * @tc.desc      Checks isLunarFirstDayOfMonth is false for lunar new year eve 2024-02-09.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0228 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${TimeUtils.isLunarFirstDayOfMonth(2024, 2, 9)}`);
      expect(TimeUtils.isLunarFirstDayOfMonth(2024, 2, 9)).assertFalse();
      log('testLunarCore0228 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0229
     * @tc.name      testLunarCore0229
     * @tc.desc      Checks isLunarFirstDayOfMonth is false for a mid-month date 2024-06-01.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0229 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${TimeUtils.isLunarFirstDayOfMonth(2024, 6, 1)}`);
      expect(TimeUtils.isLunarFirstDayOfMonth(2024, 6, 1)).assertFalse();
      log('testLunarCore0229 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_LUNARCORE_0230
     * @tc.name      testLunarCore0230
     * @tc.desc      Checks lunar conversions compose for the first lunar day of 2024-02-10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLunarCore0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLunarCore0230 begin');
      const isFirstDay: boolean = TimeUtils.isLunarFirstDayOfMonth(2024, 2, 10);
      const dayText: string = TimeUtils.lunarDayToChinese(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue isFirstDay=${isFirstDay}`);
      expect(isFirstDay).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual dayText=${dayText}, expected='初一'`);
      expect(dayText).assertEqual('初一');
      log('testLunarCore0230 end');
    })
  })
}
