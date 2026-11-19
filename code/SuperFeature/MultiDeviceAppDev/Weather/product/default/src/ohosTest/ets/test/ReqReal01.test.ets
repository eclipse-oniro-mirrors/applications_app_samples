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
import {
  getUpdateTimes, getMenuInfo, getCityList, getBg, getSideBg,
  getAirIndexData, getLifeData, MenuData, City, AirIndex, SuitData
} from '@ohos/common'
import { resName } from '../util/TestHelper'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

export default function reqReal01Test() {
  describe('ReqReal01', () => {

    /**
     * @tc.name   testReq0001
     * @tc.number SUB_WEATHER_REQ_0001
     * @tc.desc   getUpdateTimes exposes exactly seven refresh options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0001 begin')
      const result = getUpdateTimes()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', result.length, 7)
      expect(result.length).assertEqual(7)
      expect(result[result.length - 1]).assertEqual('不更新')
      expect(Array.isArray(result)).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0001 end')
    })

    /**
     * @tc.name   testReq0002
     * @tc.number SUB_WEATHER_REQ_0002
     * @tc.desc   getUpdateTimes starts with one hour option
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0002 begin')
      const result = getUpdateTimes()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result[0], '1小时')
      expect(result[0]).assertEqual('1小时')
      expect(result[1]).assertEqual('2小时')
      expect(result[0].endsWith('小时')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0002 end')
    })

    /**
     * @tc.name   testReq0003
     * @tc.number SUB_WEATHER_REQ_0003
     * @tc.desc   getUpdateTimes options are the frozen sequence and unique
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0003 begin')
      const result = getUpdateTimes()
      const expected: string[] = ['1小时', '2小时', '4小时', '6小时', '12小时', '24小时', '不更新']
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', JSON.stringify(result))
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(expected))
      expect(new Set(result).size).assertEqual(result.length)
      expect(result[5]).assertEqual('24小时')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0003 end')
    })

    /**
     * @tc.name   testReq0004
     * @tc.number SUB_WEATHER_REQ_0004
     * @tc.desc   getMenuInfo returns exactly two menu entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0004 begin')
      const result = getMenuInfo()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', result.length, 2)
      expect(result.length).assertEqual(2)
      expect(result[0] instanceof MenuData).assertTrue()
      expect(result[1] instanceof MenuData).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0004 end')
    })

    /**
     * @tc.name   testReq0005
     * @tc.number SUB_WEATHER_REQ_0005
     * @tc.desc   First menu entry is manage-city pointing to CityList page
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0005 begin')
      const entry: MenuData = getMenuInfo()[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual title=%{public}s url=%{public}s', entry.title, entry.url)
      expect(entry.title).assertEqual('管理城市')
      expect(entry.url).assertEqual('pages/CityList')
      expect(entry.url.includes('CityList')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0005 end')
    })

    /**
     * @tc.name   testReq0006
     * @tc.number SUB_WEATHER_REQ_0006
     * @tc.desc   Second menu entry is update interval with empty uri
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0006 begin')
      const entry: MenuData = getMenuInfo()[1]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual title=%{public}s url=[%{public}s]', entry.title, entry.url)
      expect(entry.title).assertEqual('更新间隔')
      expect(entry.url).assertEqual('')
      expect(entry.url.length).assertEqual(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0006 end')
    })

    /**
     * @tc.name   testReq0007
     * @tc.number SUB_WEATHER_REQ_0007
     * @tc.desc   Two menu entries carry distinct titles and urls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0007 begin')
      const menu = getMenuInfo()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', menu[0].title, menu[1].title)
      expect(menu[0].title === menu[1].title).assertFalse()
      expect(menu[0].url === menu[1].url).assertFalse()
      expect(menu[0].title.length > 0).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0007 end')
    })

    /**
     * @tc.name   testReq0008
     * @tc.number SUB_WEATHER_REQ_0008
     * @tc.desc   getCityList exposes all 22 supported cities
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0008 begin')
      const result = getCityList()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', result.length, 22)
      expect(result.length).assertEqual(22)
      expect(result[0] instanceof City).assertTrue()
      expect(result.length > 20).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0008 end')
    })

    /**
     * @tc.name   testReq0009
     * @tc.number SUB_WEATHER_REQ_0009
     * @tc.desc   First city is Beijing with frozen temperature and weather
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0009 begin')
      const city: City = getCityList()[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s %{public}s %{public}s', city.name, city.temp, city.weather)
      expect(city.name).assertEqual('北京')
      expect(city.temp).assertEqual('32')
      expect(city.weather).assertEqual('晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0009 end')
    })

    /**
     * @tc.name   testReq0010
     * @tc.number SUB_WEATHER_REQ_0010
     * @tc.desc   Last city is Nanning with frozen temperature and weather
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0010 begin')
      const city: City = getCityList()[21]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s %{public}s %{public}s', city.name, city.temp, city.weather)
      expect(city.name).assertEqual('南宁')
      expect(city.temp).assertEqual('20')
      expect(city.weather).assertEqual('晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0010 end')
    })

    /**
     * @tc.name   testReq0011
     * @tc.number SUB_WEATHER_REQ_0011
     * @tc.desc   Every city entry carries non-empty name, temp and weather
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0011 begin')
      const list = getCityList()
      let ok = true
      for (let i = 0; i < list.length; i++) {
        if (list[i].name.length === 0 || list[i].temp.length === 0 || list[i].weather.length === 0) {
          ok = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual ok=%{public}s count=%{public}d', String(ok), list.length)
      expect(ok).assertTrue()
      expect(list.length).assertEqual(22)
      expect(list[10].name).assertEqual('长春')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0011 end')
    })

    /**
     * @tc.name   testReq0012
     * @tc.number SUB_WEATHER_REQ_0012
     * @tc.desc   All city weather labels stay inside the frozen label set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0012 begin')
      const list = getCityList()
      const allowed: string[] = ['晴', '阴', '小雨', '中雨', '多云', '阵雨']
      let inSet = true
      for (let i = 0; i < list.length; i++) {
        if (!allowed.includes(list[i].weather)) {
          inSet = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual inSet=%{public}s', String(inSet))
      expect(inSet).assertTrue()
      expect(list[2].weather).assertEqual('小雨')
      expect(list[4].weather).assertEqual('多云')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0012 end')
    })

    /**
     * @tc.name   testReq0013
     * @tc.number SUB_WEATHER_REQ_0013
     * @tc.desc   getBg maps 晴 to sunny background resource
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0013 begin')
      const result = resName(getBg('晴'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, 'sunny_bg')
      expect(result).assertContain('sunny_bg')
      expect(result.length > 0).assertTrue()
      expect(result === 'rain_bg').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0013 end')
    })

    /**
     * @tc.name   testReq0014
     * @tc.number SUB_WEATHER_REQ_0014
     * @tc.desc   getBg maps light rain to rain background resource
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0014 begin')
      const result = resName(getBg('小雨'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, 'rain_bg')
      expect(result).assertContain('rain_bg')
      expect(result.length > 0).assertTrue()
      expect(result === 'sunny_bg').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0014 end')
    })

    /**
     * @tc.name   testReq0015
     * @tc.number SUB_WEATHER_REQ_0015
     * @tc.desc   getBg maps 阴 to default yin background resource
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0015 begin')
      const result = resName(getBg('阴'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, 'yin_bg')
      expect(result).assertContain('yin_bg')
      expect(result.length > 0).assertTrue()
      expect(result === 'rain_bg').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0015 end')
    })

    /**
     * @tc.name   testReq0016
     * @tc.number SUB_WEATHER_REQ_0016
     * @tc.desc   getBg maps 中雨 to rain background by substring rule
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0016 begin')
      const result = resName(getBg('中雨'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, 'rain_bg')
      expect(result).assertContain('rain_bg')
      expect(result.includes('bg')).assertTrue()
      expect(result.length > 0).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0016 end')
    })

    /**
     * @tc.name   testReq0017
     * @tc.number SUB_WEATHER_REQ_0017
     * @tc.desc   getBg maps 多云 to default yin background resource
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0017 begin')
      const result = resName(getBg('多云'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, 'yin_bg')
      expect(result).assertContain('yin_bg')
      expect(result.includes('sunny')).assertFalse()
      expect(result.length > 0).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0017 end')
    })

    /**
     * @tc.name   testReq0018
     * @tc.number SUB_WEATHER_REQ_0018
     * @tc.desc   getBg maps 大雨 to rain background resource
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0018 begin')
      const result = resName(getBg('大雨'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, 'rain_bg')
      expect(result).assertContain('rain_bg')
      expect(result.includes('bg')).assertTrue()
      expect(result === 'yin_bg').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0018 end')
    })

    /**
     * @tc.name   testReq0019
     * @tc.number SUB_WEATHER_REQ_0019
     * @tc.desc   getSideBg maps 晴 to fine side panel resource
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0019 begin')
      const result = resName(getSideBg('晴'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, 'weather_fine')
      expect(result).assertContain('weather_fine')
      expect(result.length > 0).assertTrue()
      expect(result === 'weather_rain').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0019 end')
    })

    /**
     * @tc.name   testReq0020
     * @tc.number SUB_WEATHER_REQ_0020
     * @tc.desc   getSideBg maps 阵雨 to rain side panel resource
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0020 begin')
      const result = resName(getSideBg('阵雨'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, 'weather_rain')
      expect(result).assertContain('weather_rain')
      expect(result.length > 0).assertTrue()
      expect(result === 'weather_fine').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0020 end')
    })

    /**
     * @tc.name   testReq0021
     * @tc.number SUB_WEATHER_REQ_0021
     * @tc.desc   getSideBg maps 阴 to yin side panel resource
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0021 begin')
      const result = resName(getSideBg('阴'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, 'weather_yin')
      expect(result).assertContain('weather_yin')
      expect(result.length > 0).assertTrue()
      expect(result === 'weather_fine').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0021 end')
    })

    /**
     * @tc.name   testReq0022
     * @tc.number SUB_WEATHER_REQ_0022
     * @tc.desc   getSideBg maps 雷阵雨 to rain side panel by substring rule
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0022 begin')
      const result = resName(getSideBg('雷阵雨'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', result, 'weather_rain')
      expect(result).assertContain('weather_rain')
      expect(result.includes('weather')).assertTrue()
      expect(result.length > 0).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0022 end')
    })

    /**
     * @tc.name   testReq0023
     * @tc.number SUB_WEATHER_REQ_0023
     * @tc.desc   getAirIndexData returns six pollutant rows for a city
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0023 begin')
      const result = getAirIndexData(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', result.length, 6)
      expect(result.length).assertEqual(6)
      expect(result[0] instanceof AirIndex).assertTrue()
      expect(result[5] instanceof AirIndex).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0023 end')
    })

    /**
     * @tc.name   testReq0024
     * @tc.number SUB_WEATHER_REQ_0024
     * @tc.desc   Pollutant label order is frozen including the O2 slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0024 begin')
      const result = getAirIndexData(0)
      const labels: string[] = ['PM10', 'PM2.5', 'NO2', 'SO2', 'O2', 'CO']
      let match = true
      for (let i = 0; i < labels.length; i++) {
        if (result[i].index !== labels[i]) {
          match = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual match=%{public}s', String(match))
      expect(match).assertTrue()
      expect(result[0].index).assertEqual('PM10')
      expect(result[4].index).assertEqual('O2')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0024 end')
    })

    /**
     * @tc.name   testReq0025
     * @tc.number SUB_WEATHER_REQ_0025
     * @tc.desc   Beijing pollutant figures equal frozen aqi values of day one
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0025 begin')
      const result = getAirIndexData(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual pm10=%{public}s', String(result[0].figure))
      expect(String(result[0].figure)).assertEqual('181')
      expect(String(result[1].figure)).assertEqual('94')
      expect(String(result[2].figure)).assertEqual('105')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0025 end')
    })

    /**
     * @tc.name   testReq0026
     * @tc.number SUB_WEATHER_REQ_0026
     * @tc.desc   Tianjin pollutant figures equal frozen aqi values with 良 O3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0026 begin')
      const result = getAirIndexData(3)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual o2=%{public}s', String(result[4].figure))
      expect(String(result[0].figure)).assertEqual('180')
      expect(String(result[4].figure)).assertEqual('30')
      expect(result[4].index).assertEqual('O2')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0026 end')
    })

    /**
     * @tc.name   testReq0027
     * @tc.number SUB_WEATHER_REQ_0027
     * @tc.desc   getLifeData returns eight lifestyle rows mirroring day indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0027 begin')
      const result = getLifeData(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', result.length, 8)
      expect(result.length).assertEqual(8)
      expect(result[0] instanceof SuitData).assertTrue()
      expect(result[0].desc).assertEqual('湿度')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0027 end')
    })

    /**
     * @tc.name   testReq0028
     * @tc.number SUB_WEATHER_REQ_0028
     * @tc.desc   Beijing life values equal frozen index levels
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0028 begin')
      const result = getLifeData(0)
      const descs: string[] = ['湿度', '体感温度', '风力', '风向', '穿衣', '运动', '感冒', '紫外线']
      let match = true
      for (let i = 0; i < descs.length; i++) {
        if (result[i].desc !== descs[i]) {
          match = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual match=%{public}s v0=%{public}s', String(match), result[0].value)
      expect(match).assertTrue()
      expect(result[0].value).assertEqual('42%')
      expect(result[7].value).assertEqual('强')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0028 end')
    })
  })
}
