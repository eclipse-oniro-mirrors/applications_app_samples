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
  getHeaderDate, getWeekWeatherData, getHoursData, addCity, getCityListWeatherData,
  HeaderData, WeekWeather, Forecast, City, CityListData
} from '@ohos/common'
import { FormDate } from '@ohos/common'
import { resName } from '../util/TestHelper'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

export default function reqReal02Test() {
  describe('ReqReal02', () => {

    /**
     * @tc.name   testReq0029
     * @tc.number SUB_WEATHER_REQ_0029
     * @tc.desc   Header of city 0 shows Beijing frozen day-1 temperature fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0029 begin')
      const header: HeaderData = getHeaderDate(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s %{public}s %{public}s', header.city, header.temp, header.weatherType)
      expect(header.city).assertEqual('北京')
      expect(String(header.temp)).assertEqual('32')
      expect(header.weatherType).assertEqual('晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0029 end')
    })

    /**
     * @tc.name   testReq0030
     * @tc.number SUB_WEATHER_REQ_0030
     * @tc.desc   Header of city 0 carries frozen max and min temperatures
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0030 begin')
      const header: HeaderData = getHeaderDate(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual max=%{public}s min=%{public}s', String(header.max), String(header.min))
      expect(String(header.max)).assertEqual('35')
      expect(String(header.min)).assertEqual('25')
      expect(header instanceof HeaderData).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0030 end')
    })

    /**
     * @tc.name   testReq0031
     * @tc.number SUB_WEATHER_REQ_0031
     * @tc.desc   Header air data equals frozen Beijing aqi level and tips
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0031 begin')
      const header: HeaderData = getHeaderDate(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', header.airData.airQuality, header.airData.airDesc)
      expect(header.airData.airQuality).assertEqual('28')
      expect(header.airData.airDesc).assertEqual('优')
      expect(header.airTips).assertEqual('当前晴，炎热，不适合外出游玩！')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0031 end')
    })

    /**
     * @tc.name   testReq0032
     * @tc.number SUB_WEATHER_REQ_0032
     * @tc.desc   Header icon resource of a sunny city resolves to ic_weather_sunny
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0032 begin')
      const header: HeaderData = getHeaderDate(0)
      const name = resName(header.icon as Resource)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', name)
      expect(name).assertContain('ic_weather_sunny')
      expect(name.length > 0).assertTrue()
      expect(name === 'ic_weather_rain').assertFalse()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0032 end')
    })

    /**
     * @tc.name   testReq0033
     * @tc.number SUB_WEATHER_REQ_0033
     * @tc.desc   Header of city 1 shows Shanghai frozen day-1 fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0033 begin')
      const header: HeaderData = getHeaderDate(1)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s %{public}s %{public}s', header.city, header.temp, header.weatherType)
      expect(header.city).assertEqual('上海')
      expect(String(header.temp)).assertEqual('28')
      expect(header.weatherType).assertEqual('阴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0033 end')
    })

    /**
     * @tc.name   testReq0034
     * @tc.number SUB_WEATHER_REQ_0034
     * @tc.desc   Header tips and icon of the overcast city match frozen data
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0034 begin')
      const header: HeaderData = getHeaderDate(1)
      const name = resName(header.icon as Resource)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual tips=%{public}s icon=%{public}s', header.airTips, name)
      expect(header.airTips).assertEqual('当前阴，紫外线弱，适合外出游玩！')
      expect(name).assertContain('ic_weather_yin')
      expect(header.airData.airQuality).assertEqual('32')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0034 end')
    })

    /**
     * @tc.name   testReq0035
     * @tc.number SUB_WEATHER_REQ_0035
     * @tc.desc   Optional city parameter overrides only the displayed city name
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0035 begin')
      const override: City = new City('测试城', '1', '晴')
      const header: HeaderData = getHeaderDate(0, override)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', header.city, '测试城')
      expect(header.city).assertEqual('测试城')
      expect(header.weatherType).assertEqual('晴')
      expect(String(header.temp)).assertEqual('32')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0035 end')
    })

    /**
     * @tc.name   testReq0036
     * @tc.number SUB_WEATHER_REQ_0036
     * @tc.desc   City override keeps air data of the indexed weather record
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0036 begin')
      const header: HeaderData = getHeaderDate(2, new City('广州新城', '9', '小雨'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s air=%{public}s', header.city, header.airData.airQuality)
      expect(header.city).assertEqual('广州新城')
      expect(header.weatherType).assertEqual('小雨')
      expect(header.airData.airDesc).assertEqual('良')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0036 end')
    })

    /**
     * @tc.name   testReq0037
     * @tc.number SUB_WEATHER_REQ_0037
     * @tc.desc   Weekly forecast always exposes seven days
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0037 begin')
      const week = getWeekWeatherData(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', week.length, 7)
      expect(week.length).assertEqual(7)
      expect(week[0] instanceof WeekWeather).assertTrue()
      expect(week[6] instanceof WeekWeather).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0037 end')
    })

    /**
     * @tc.name   testReq0038
     * @tc.number SUB_WEATHER_REQ_0038
     * @tc.desc   First week row mirrors June 23rd with the padded-month format
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0038 begin')
      const row: WeekWeather = getWeekWeatherData(0)[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', row.date, row.week, row.weather)
      expect(row.date).assertEqual('06/23')
      expect(row.week).assertEqual('星期四')
      expect(row.weather).assertEqual('阴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0038 end')
    })

    /**
     * @tc.name   testReq0039
     * @tc.number SUB_WEATHER_REQ_0039
     * @tc.desc   First week row carries frozen air level and temperature range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0039 begin')
      const row: WeekWeather = getWeekWeatherData(0)[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual air=%{public}s max=%{public}s min=%{public}s', row.airLevel, String(row.max), String(row.min))
      expect(row.airLevel).assertEqual('优')
      expect(String(row.max)).assertEqual('35')
      expect(String(row.min)).assertEqual('25')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0039 end')
    })

    /**
     * @tc.name   testReq0040
     * @tc.number SUB_WEATHER_REQ_0040
     * @tc.desc   Last week row mirrors June 29th with a higher minimum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0040 begin')
      const row: WeekWeather = getWeekWeatherData(0)[6]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', row.week, row.weather, String(row.min))
      expect(row.week).assertEqual('星期三')
      expect(row.weather).assertEqual('多云')
      expect(String(row.min)).assertEqual('26')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0040 end')
    })

    /**
     * @tc.name   testReq0041
     * @tc.number SUB_WEATHER_REQ_0041
     * @tc.desc   Wuhan week head keeps its own frozen values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0041 begin')
      const row: WeekWeather = getWeekWeatherData(4)[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s max=%{public}s', row.weather, String(row.max))
      expect(row.weather).assertEqual('多云')
      expect(String(row.max)).assertEqual('39')
      expect(String(row.min)).assertEqual('25')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0041 end')
    })

    /**
     * @tc.name   testReq0042
     * @tc.number SUB_WEATHER_REQ_0042
     * @tc.desc   All week rows share the padded June month prefix but keep raw days
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0042 begin')
      const week = getWeekWeatherData(3)
      let allJune = true
      for (let i = 0; i < week.length; i++) {
        if (!week[i].date.startsWith('06/')) {
          allJune = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual allJune=%{public}s count=%{public}d', String(allJune), week.length)
      expect(allJune).assertTrue()
      expect(week.length).assertEqual(7)
      expect(week[0].date).assertEqual('06/23')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(week[6].date))
      expect(week[6].date).assertEqual('06/29')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0042 end')
    })

    /**
     * @tc.name   testReq0043
     * @tc.number SUB_WEATHER_REQ_0043
     * @tc.desc   Hourly list holds 25 rows because the sunset row is inserted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0043 begin')
      const hours = getHoursData(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', hours.length, 25)
      expect(hours.length).assertEqual(25)
      expect(hours[0] instanceof Forecast).assertTrue()
      expect(hours.length > 24).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0043 end')
    })

    /**
     * @tc.name   testReq0044
     * @tc.number SUB_WEATHER_REQ_0044
     * @tc.desc   First hourly row of Beijing is 09:00 with 上午 slot and degree text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0044 begin')
      const row: Forecast = getHoursData(0)[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', row.degree, row.date, row.desc)
      expect(row.degree).assertEqual('30°')
      expect(row.date).assertEqual('09:00')
      expect(row.desc).assertEqual('上午')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0044 end')
    })

    /**
     * @tc.name   testReq0045
     * @tc.number SUB_WEATHER_REQ_0045
     * @tc.desc   First hourly row keeps wind fields and the sunny icon
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0045 begin')
      const row: Forecast = getHoursData(0)[0]
      const name = resName(row.icon as Resource)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual win=%{public}s icon=%{public}s', row.win, name)
      expect(row.win).assertEqual('西南风')
      expect(row.winSpeed).assertEqual('3-4级')
      expect(name).assertContain('ic_weather_sunny')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0045 end')
    })

    /**
     * @tc.name   testReq0046
     * @tc.number SUB_WEATHER_REQ_0046
     * @tc.desc   Anchor: sunset row is injected right after the 17:00 entry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0046 begin')
      const row: Forecast = getHoursData(0)[9]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', row.degree, row.date, row.desc)
      expect(row.degree).assertEqual('日落')
      expect(row.date).assertEqual('17:32')
      expect(row.desc).assertEqual('傍晚')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0046 end')
    })

    /**
     * @tc.name   testReq0047
     * @tc.number SUB_WEATHER_REQ_0047
     * @tc.desc   Sunset row reuses wind data of the 17:00 item and shows sunset icon
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0047 begin')
      const row: Forecast = getHoursData(0)[9]
      const name = resName(row.icon as Resource)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual win=%{public}s icon=%{public}s', row.win, name)
      expect(row.win).assertEqual('西北风')
      expect(row.winSpeed).assertEqual('3-4级')
      expect(name).assertContain('ic_weather_sunset')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0047 end')
    })

    /**
     * @tc.name   testReq0048
     * @tc.number SUB_WEATHER_REQ_0048
     * @tc.desc   Anchor: Midnight hourly row formats as 00:00 while its slot follows the clock
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0048 begin')
      const row: Forecast = getHoursData(0)[16]
      // 行内时刻固定为 00:00，slot 必须按该行自身小时计算；若取设备当前整点，午后执行必然不等
      const slot = new FormDate().formTimeSlot(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s slot=%{public}s', row.date, row.desc, String(slot))
      expect(row.date).assertEqual('00:00')
      expect(row.desc).assertEqual(slot)
      expect(row.degree.endsWith('°')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0048 end')
    })

    /**
     * @tc.name   testReq0049
     * @tc.number SUB_WEATHER_REQ_0049
     * @tc.desc   Shanghai hourly list starts at 08:00 with the overcast icon
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0049 begin')
      const hours = getHoursData(1)
      const name = resName(hours[0].icon as Resource)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|icon=%{public}s', hours[0].date, hours[0].desc, name)
      expect(hours.length).assertEqual(25)
      expect(hours[0].date).assertEqual('08:00')
      expect(name).assertContain('ic_weather_yin')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0049 end')
    })

    /**
     * @tc.name   testReq0050
     * @tc.number SUB_WEATHER_REQ_0050
     * @tc.desc   Anchor: sunset insertion shifts with the varying hourly start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testReq0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0050 begin')
      const hours = getHoursData(1)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual[10]=%{public}s|%{public}s', hours[10].degree, hours[10].date)
      expect(hours[10].degree).assertEqual('日落')
      expect(hours[10].date).assertEqual('17:32')
      expect(hours[9].date).assertEqual('17:00')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0050 end')
    })

    /**
     * @tc.name   testReq0051
     * @tc.number SUB_WEATHER_REQ_0051
     * @tc.desc   addCity on an empty list backfills weather of index 0 before push
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0051 begin')
      const empty: City[] = []
      AppStorage.setOrCreate('cityList', empty)
      const added = new City('新增城', '0', '晴')
      addCity(added)
      const stored: City[] = AppStorage.get('cityList') ?? []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s len=%{public}d', added.weather, added.temp, stored.length)
      expect(added.weather).assertEqual('晴')
      expect(added.temp).assertEqual('32')
      expect(stored.length).assertEqual(1)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0051 end')
    })

    /**
     * @tc.name   testReq0052
     * @tc.number SUB_WEATHER_REQ_0052
     * @tc.desc   addCity with two stored cities backfills weather of index 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0052 begin')
      const base: City[] = [new City('甲', '1', '晴'), new City('乙', '2', '阴')]
      AppStorage.setOrCreate('cityList', base)
      const added = new City('丙城', '0', '晴')
      addCity(added)
      const stored: City[] = AppStorage.get('cityList') ?? []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s len=%{public}d', added.weather, added.temp, stored.length)
      expect(added.weather).assertEqual('小雨')
      expect(added.temp).assertEqual('26')
      expect(stored.length).assertEqual(3)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0052 end')
    })

    /**
     * @tc.name   testReq0053
     * @tc.number SUB_WEATHER_REQ_0053
     * @tc.desc   addCity keeps the user supplied name while overwriting visuals
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testReq0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0053 begin')
      const empty: City[] = []
      AppStorage.setOrCreate('cityList', empty)
      const added = new City('保留名', '-5', '雷阵雨')
      addCity(added)
      const stored: City[] = AppStorage.get('cityList') ?? []
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s weather=%{public}s', added.name, added.weather)
      expect(added.name).assertEqual('保留名')
      expect(added.weather).assertEqual('晴')
      expect(stored[0].name).assertEqual('保留名')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0053 end')
    })

    /**
     * @tc.name   testReq0054
     * @tc.number SUB_WEATHER_REQ_0054
     * @tc.desc   City weather page seeds two default cities when storage is empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0054 begin')
      const empty: City[] = []
      AppStorage.setOrCreate('cityList', empty)
      const result = getCityListWeatherData()
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', result.length, 2)
      expect(result.length).assertEqual(2)
      expect(result[0] instanceof CityListData).assertTrue()
      expect(result[0].city).assertEqual('北京')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0054 end')
    })

    /**
     * @tc.name   testReq0055
     * @tc.number SUB_WEATHER_REQ_0055
     * @tc.desc   Aggregated city data keeps consistent sub-list sizes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testReq0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0055 begin')
      const empty: City[] = []
      AppStorage.setOrCreate('cityList', empty)
      const data: CityListData = getCityListWeatherData()[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual hours=%{public}d week=%{public}d air=%{public}d life=%{public}d',
        data.hoursData.length, data.weekData.length, data.airIndex.length, data.suitDate.length)
      expect(data.hoursData.length).assertEqual(25)
      expect(data.weekData.length).assertEqual(7)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(data.airIndex.length))
      expect(data.airIndex.length).assertEqual(6)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(data.suitDate.length))
      expect(data.suitDate.length).assertEqual(8)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testReq0055 end')
    })
  })
}
