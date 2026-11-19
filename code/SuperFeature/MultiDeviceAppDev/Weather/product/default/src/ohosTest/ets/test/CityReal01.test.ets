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
import { cityData } from '@ohos/common'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

export default function cityReal01Test() {
  describe('CityReal01', () => {

    /**
     * @tc.name   testCity0001
     * @tc.number SUB_WEATHER_CITY_0001
     * @tc.desc   City table contains 22 supported locations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0001 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', cityData.length, 22)
      expect(cityData.length).assertEqual(22)
      expect(cityData[0].name).assertEqual('北京')
      expect(cityData[21].name).assertEqual('南宁')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0001 end')
    })

    /**
     * @tc.name   testCity0002
     * @tc.number SUB_WEATHER_CITY_0002
     * @tc.desc   Beijing row keeps frozen temperature and weather
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCity0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0002 begin')
      const row = cityData[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', row.name, row.temp, row.weather)
      expect(row.name).assertEqual('北京')
      expect(row.temp).assertEqual('32')
      expect(row.weather).assertEqual('晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0002 end')
    })

    /**
     * @tc.name   testCity0003
     * @tc.number SUB_WEATHER_CITY_0003
     * @tc.desc   Shanghai row keeps frozen temperature and weather
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCity0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0003 begin')
      const row = cityData[1]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', row.name, row.temp, row.weather)
      expect(row.name).assertEqual('上海')
      expect(row.temp).assertEqual('28')
      expect(row.weather).assertEqual('阴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0003 end')
    })

    /**
     * @tc.name   testCity0004
     * @tc.number SUB_WEATHER_CITY_0004
     * @tc.desc   Guangzhou row keeps frozen temperature and weather
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCity0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0004 begin')
      const row = cityData[2]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', row.name, row.temp, row.weather)
      expect(row.name).assertEqual('广州')
      expect(row.temp).assertEqual('35')
      expect(row.weather).assertEqual('小雨')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0004 end')
    })

    /**
     * @tc.name   testCity0005
     * @tc.number SUB_WEATHER_CITY_0005
     * @tc.desc   Tianjin row keeps frozen temperature and weather
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCity0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0005 begin')
      const row = cityData[3]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', row.name, row.temp, row.weather)
      expect(row.name).assertEqual('天津')
      expect(row.temp).assertEqual('35')
      expect(row.weather).assertEqual('中雨')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0005 end')
    })

    /**
     * @tc.name   testCity0006
     * @tc.number SUB_WEATHER_CITY_0006
     * @tc.desc   Wuhan row keeps frozen temperature and weather
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCity0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0006 begin')
      const row = cityData[4]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', row.name, row.temp, row.weather)
      expect(row.name).assertEqual('武汉')
      expect(row.temp).assertEqual('26')
      expect(row.weather).assertEqual('多云')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0006 end')
    })

    /**
     * @tc.name   testCity0007
     * @tc.number SUB_WEATHER_CITY_0007
     * @tc.desc   Shenyang and Chongqing rows keep frozen payloads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCity0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0007 begin')
      const sy = cityData[5]
      const cq = cityData[6]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', sy.name, cq.weather)
      expect(sy.name).assertEqual('沈阳')
      expect(sy.temp).assertEqual('25')
      expect(cq.weather).assertEqual('小雨')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0007 end')
    })

    /**
     * @tc.name   testCity0008
     * @tc.number SUB_WEATHER_CITY_0008
     * @tc.desc   Hangzhou and Nanjing rows keep frozen payloads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCity0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0008 begin')
      const hz = cityData[7]
      const nj = cityData[8]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', hz.temp, nj.name)
      expect(hz.name).assertEqual('杭州')
      expect(hz.temp).assertEqual('35')
      expect(nj.weather).assertEqual('晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0008 end')
    })

    /**
     * @tc.name   testCity0009
     * @tc.number SUB_WEATHER_CITY_0009
     * @tc.desc   Harbin and Changsha rows keep frozen payloads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCity0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0009 begin')
      const heb = cityData[9]
      const cc = cityData[10]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', heb.name, cc.name)
      expect(heb.name).assertEqual('哈尔滨')
      expect(heb.temp).assertEqual('25')
      expect(cc.weather).assertEqual('阵雨')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0009 end')
    })

    /**
     * @tc.name   testCity0010
     * @tc.number SUB_WEATHER_CITY_0010
     * @tc.desc   Changsha is the only shower city in the table
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCity0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0010 begin')
      let showerCount = 0
      for (let i = 0; i < cityData.length; i++) {
        if (cityData[i].weather === '阵雨') {
          showerCount++
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual showerCount=%{public}d', showerCount)
      expect(showerCount).assertEqual(1)
      expect(cityData[10].name).assertEqual('长春')
      expect(cityData[10].temp).assertEqual('28')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0010 end')
    })

    /**
     * @tc.name   testCity0011
     * @tc.number SUB_WEATHER_CITY_0011
     * @tc.desc   Hohhot and Shijiazhuang rows keep frozen payloads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCity0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0011 begin')
      const hh = cityData[11]
      const sjz = cityData[12]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', hh.name, sjz.name)
      expect(hh.name).assertEqual('呼和浩特')
      expect(hh.temp).assertEqual('25')
      expect(sjz.weather).assertEqual('晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0011 end')
    })

    /**
     * @tc.name   testCity0012
     * @tc.number SUB_WEATHER_CITY_0012
     * @tc.desc   Yinchuan and Urumqi rows keep frozen payloads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCity0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0012 begin')
      const yc = cityData[13]
      const wlmq = cityData[14]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', yc.name, wlmq.name)
      expect(yc.name).assertEqual('银川')
      expect(yc.temp).assertEqual('25')
      expect(wlmq.weather).assertEqual('晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0012 end')
    })

    /**
     * @tc.name   testCity0013
     * @tc.number SUB_WEATHER_CITY_0013
     * @tc.desc   Lhasa and Xining rows keep frozen payloads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCity0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0013 begin')
      const ls = cityData[15]
      const xn = cityData[16]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', ls.temp, xn.name)
      expect(ls.name).assertEqual('拉萨')
      expect(ls.temp).assertEqual('35')
      expect(xn.temp).assertEqual('25')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0013 end')
    })

    /**
     * @tc.name   testCity0014
     * @tc.number SUB_WEATHER_CITY_0014
     * @tc.desc   Xian and Lanzhou rows keep frozen payloads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCity0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0014 begin')
      const xa = cityData[17]
      const lz = cityData[18]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', xa.name, lz.weather)
      expect(xa.name).assertEqual('西安')
      expect(xa.weather).assertEqual('晴')
      expect(lz.weather).assertEqual('多云')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0014 end')
    })

    /**
     * @tc.name   testCity0015
     * @tc.number SUB_WEATHER_CITY_0015
     * @tc.desc   Taiyuan and Kunming rows keep frozen payloads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCity0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0015 begin')
      const ty = cityData[19]
      const km = cityData[20]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', ty.weather, km.weather)
      expect(ty.name).assertEqual('太原')
      expect(ty.weather).assertEqual('阴')
      expect(km.weather).assertEqual('小雨')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0015 end')
    })

    /**
     * @tc.name   testCity0016
     * @tc.number SUB_WEATHER_CITY_0016
     * @tc.desc   Nanning closes the table with the coolest temperature
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCity0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0016 begin')
      const nn = cityData[21]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', nn.name, nn.temp, nn.weather)
      expect(nn.name).assertEqual('南宁')
      expect(nn.temp).assertEqual('20')
      expect(Number(nn.temp)).assertEqual(20)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0016 end')
    })

    /**
     * @tc.name   testCity0017
     * @tc.number SUB_WEATHER_CITY_0017
     * @tc.desc   All city names are unique
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCity0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0017 begin')
      const names = cityData.map(x => x.name)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual unique=%{public}d total=%{public}d', new Set(names).size, names.length)
      expect(new Set(names).size).assertEqual(22)
      expect(names.length).assertEqual(22)
      expect(names.includes('北京')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0017 end')
    })

    /**
     * @tc.name   testCity0018
     * @tc.number SUB_WEATHER_CITY_0018
     * @tc.desc   Every temperature is a two-digit numeric string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCity0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0018 begin')
      let allNumeric = true
      for (let i = 0; i < cityData.length; i++) {
        if (!/^\d{2}$/.test(cityData[i].temp)) {
          allNumeric = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual allNumeric=%{public}s', String(allNumeric))
      expect(allNumeric).assertTrue()
      expect(cityData[0].temp.length).assertEqual(2)
      expect(Number(cityData[0].temp) >= 20).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0018 end')
    })

    /**
     * @tc.name   testCity0019
     * @tc.number SUB_WEATHER_CITY_0019
     * @tc.desc   Weather labels stay inside the six supported tokens
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCity0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0019 begin')
      const allowed: string[] = ['晴', '阴', '小雨', '中雨', '多云', '阵雨']
      let inSet = true
      for (let i = 0; i < cityData.length; i++) {
        if (!allowed.includes(cityData[i].weather)) {
          inSet = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual inSet=%{public}s', String(inSet))
      expect(inSet).assertTrue()
      expect(allowed.length).assertEqual(6)
      expect(cityData[3].weather).assertEqual('中雨')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0019 end')
    })

    /**
     * @tc.name   testCity0020
     * @tc.number SUB_WEATHER_CITY_0020
     * @tc.desc   Sunny cities outnumber rainy cities in the frozen table
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCity0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0020 begin')
      let sunny = 0
      let rainy = 0
      for (let i = 0; i < cityData.length; i++) {
        if (cityData[i].weather === '晴') {
          sunny++
        }
        if (cityData[i].weather.includes('雨')) {
          rainy++
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual sunny=%{public}d rainy=%{public}d', sunny, rainy)
      expect(sunny > rainy).assertTrue()
      expect(sunny + rainy <= 22).assertTrue()
      expect(sunny).assertEqual(13)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0020 end')
    })

    /**
     * @tc.name   testCity0021
     * @tc.number SUB_WEATHER_CITY_0021
     * @tc.desc   The first five cities match the weather detail records
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCity0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0021 begin')
      const head = ['北京', '上海', '广州', '天津', '武汉']
      let matched = true
      for (let i = 0; i < head.length; i++) {
        if (cityData[i].name !== head[i]) {
          matched = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual matched=%{public}s', String(matched))
      expect(matched).assertTrue()
      expect(cityData[4].name).assertEqual('武汉')
      expect(cityData[0].name === cityData[4].name).assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0021 end')
    })

    /**
     * @tc.name   testCity0022
     * @tc.number SUB_WEATHER_CITY_0022
     * @tc.desc   Anchor: temperature spread of the table runs from 20 to 35
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCity0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0022 begin')
      const nums = cityData.map(x => Number(x.temp))
      let lo = nums[0]
      let hi = nums[0]
      for (let i = 1; i < nums.length; i++) {
        if (nums[i] < lo) {
          lo = nums[i]
        }
        if (nums[i] > hi) {
          hi = nums[i]
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual lo=%{public}d hi=%{public}d', lo, hi)
      expect(lo).assertEqual(20)
      expect(hi).assertEqual(35)
      expect(hi - lo).assertEqual(15)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testCity0022 end')
    })
  })
}
