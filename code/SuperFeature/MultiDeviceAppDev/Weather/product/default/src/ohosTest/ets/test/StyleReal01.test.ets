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
import { Style } from '@ohos/common'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

export default function styleReal01Test() {
  describe('StyleReal01', () => {

    /**
     * @tc.name   testStyle0001
     * @tc.number SUB_WEATHER_STYLE_0001
     * @tc.desc   Card height constant equals frozen value 192
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0001 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.CARD_HEIGHT, 192)
      expect(Style.CARD_HEIGHT).assertEqual(192)
      expect(Style.CARD_HEIGHT > Style.NORMAL_RADIUS).assertTrue()
      expect(Style.CARD_HEIGHT % 2).assertEqual(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0001 end')
    })

    /**
     * @tc.name   testStyle0002
     * @tc.number SUB_WEATHER_STYLE_0002
     * @tc.desc   Weather item width constant equals frozen value 80
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0002 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.WEATHER_ITEM_WIDTH, 80)
      expect(Style.WEATHER_ITEM_WIDTH).assertEqual(80)
      expect(Style.WEATHER_ITEM_WIDTH < Style.CARD_HEIGHT).assertTrue()
      expect(Style.WEATHER_ITEM_WIDTH > Style.NORMAL_MARGIN).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0002 end')
    })

    /**
     * @tc.name   testStyle0003
     * @tc.number SUB_WEATHER_STYLE_0003
     * @tc.desc   Normal padding equals 14
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0003 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.NORMAL_PADDING, 14)
      expect(Style.NORMAL_PADDING).assertEqual(14)
      expect(Style.NORMAL_PADDING).assertEqual(Style.NORMAL_MARGIN)
      expect(Style.NORMAL_PADDING > Style.NORMAL_SPACE).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0003 end')
    })

    /**
     * @tc.name   testStyle0004
     * @tc.number SUB_WEATHER_STYLE_0004
     * @tc.desc   Normal margin equals 14
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0004 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.NORMAL_MARGIN, 14)
      expect(Style.NORMAL_MARGIN).assertEqual(14)
      expect(Style.NORMAL_MARGIN < Style.NORMAL_RADIUS).assertTrue()
      expect(Style.NORMAL_MARGIN - Style.NORMAL_SPACE).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0004 end')
    })

    /**
     * @tc.name   testStyle0005
     * @tc.number SUB_WEATHER_STYLE_0005
     * @tc.desc   Normal space equals 12
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0005 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.NORMAL_SPACE, 12)
      expect(Style.NORMAL_SPACE).assertEqual(12)
      expect(Style.NORMAL_SPACE).assertEqual(Style.GRID_GUTTER)
      expect(Style.NORMAL_SPACE < Style.NORMAL_PADDING).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0005 end')
    })

    /**
     * @tc.name   testStyle0006
     * @tc.number SUB_WEATHER_STYLE_0006
     * @tc.desc   Grid gutter equals 12
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0006 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.GRID_GUTTER, 12)
      expect(Style.GRID_GUTTER).assertEqual(12)
      expect(Style.GRID_GUTTER > Style.ADD_CITY_BOTTOM).assertTrue()
      expect(Style.GRID_GUTTER < Style.NORMAL_RADIUS).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0006 end')
    })

    /**
     * @tc.name   testStyle0007
     * @tc.number SUB_WEATHER_STYLE_0007
     * @tc.desc   Normal radius equals 16
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0007 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.NORMAL_RADIUS, 16)
      expect(Style.NORMAL_RADIUS).assertEqual(16)
      expect(Style.NORMAL_RADIUS > Style.NORMAL_MARGIN).assertTrue()
      expect(Style.NORMAL_RADIUS < Style.CITY_TEXT_RADIUS).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0007 end')
    })

    /**
     * @tc.name   testStyle0008
     * @tc.number SUB_WEATHER_STYLE_0008
     * @tc.desc   City text radius equals 18
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0008 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.CITY_TEXT_RADIUS, 18)
      expect(Style.CITY_TEXT_RADIUS).assertEqual(18)
      expect(Style.CITY_TEXT_RADIUS - Style.NORMAL_RADIUS).assertEqual(2)
      expect(Style.CITY_TEXT_RADIUS < Style.TIME_LIST_HEIGHT).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0008 end')
    })

    /**
     * @tc.name   testStyle0009
     * @tc.number SUB_WEATHER_STYLE_0009
     * @tc.desc   Add city bottom margin equals 6
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0009 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.ADD_CITY_BOTTOM, 6)
      expect(Style.ADD_CITY_BOTTOM).assertEqual(6)
      expect(Style.ADD_CITY_BOTTOM < Style.ADD_CITY_BOTTOM_LG).assertTrue()
      expect(Style.ADD_CITY_BOTTOM > 0).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0009 end')
    })

    /**
     * @tc.name   testStyle0010
     * @tc.number SUB_WEATHER_STYLE_0010
     * @tc.desc   Large add city bottom margin equals 28
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0010 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.ADD_CITY_BOTTOM_LG, 28)
      expect(Style.ADD_CITY_BOTTOM_LG).assertEqual(28)
      expect(Style.ADD_CITY_BOTTOM_LG > Style.NORMAL_RADIUS).assertTrue()
      expect(Style.ADD_CITY_BOTTOM_LG < Style.DIALOG_PADDING_OUT).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0010 end')
    })

    /**
     * @tc.name   testStyle0011
     * @tc.number SUB_WEATHER_STYLE_0011
     * @tc.desc   Card background color is the frozen alpha white literal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0011 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', Style.CARD_BACKGROUND_COLOR, '#24FFFFFF')
      expect(Style.CARD_BACKGROUND_COLOR).assertEqual('#24FFFFFF')
      expect(Style.CARD_BACKGROUND_COLOR.startsWith('#')).assertTrue()
      expect(Style.CARD_BACKGROUND_COLOR.length).assertEqual(9)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0011 end')
    })

    /**
     * @tc.name   testStyle0012
     * @tc.number SUB_WEATHER_STYLE_0012
     * @tc.desc   Dialog padding out equals 42
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0012 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.DIALOG_PADDING_OUT, 42)
      expect(Style.DIALOG_PADDING_OUT).assertEqual(42)
      expect(Style.DIALOG_PADDING_OUT > Style.DIALOG_PADDING).assertTrue()
      expect(Style.DIALOG_PADDING_OUT < Style.WEATHER_ITEM_WIDTH).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0012 end')
    })

    /**
     * @tc.name   testStyle0013
     * @tc.number SUB_WEATHER_STYLE_0013
     * @tc.desc   Dialog padding equals 24
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0013 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.DIALOG_PADDING, 24)
      expect(Style.DIALOG_PADDING).assertEqual(24)
      expect(Style.DIALOG_PADDING + Style.DIALOG_PADDING_OUT).assertEqual(66)
      expect(Style.DIALOG_PADDING > Style.NORMAL_SPACE).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0013 end')
    })

    /**
     * @tc.name   testStyle0014
     * @tc.number SUB_WEATHER_STYLE_0014
     * @tc.desc   Big font weight equals 300
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0014 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.BIG_FONT_WEIGHT, 300)
      expect(Style.BIG_FONT_WEIGHT).assertEqual(300)
      expect(Style.BIG_FONT_WEIGHT > Style.TIME_LIST_HEIGHT).assertTrue()
      expect(Style.BIG_FONT_WEIGHT % 100).assertEqual(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0014 end')
    })

    /**
     * @tc.name   testStyle0015
     * @tc.number SUB_WEATHER_STYLE_0015
     * @tc.desc   Time list height equals 48
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0015 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.TIME_LIST_HEIGHT, 48)
      expect(Style.TIME_LIST_HEIGHT).assertEqual(48)
      expect(Style.TIME_LIST_HEIGHT > Style.TIME_LIST_MARGIN).assertTrue()
      expect(Style.TIME_LIST_HEIGHT < Style.WEATHER_ITEM_WIDTH).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0015 end')
    })

    /**
     * @tc.name   testStyle0016
     * @tc.number SUB_WEATHER_STYLE_0016
     * @tc.desc   Time list margin equals 22
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testStyle0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0016 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', Style.TIME_LIST_MARGIN, 22)
      expect(Style.TIME_LIST_MARGIN).assertEqual(22)
      expect(Style.TIME_LIST_MARGIN > Style.DIALOG_PADDING / 2).assertTrue()
      expect(Style.TIME_LIST_MARGIN < Style.TIME_LIST_HEIGHT).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testStyle0016 end')
    })
  })
}
