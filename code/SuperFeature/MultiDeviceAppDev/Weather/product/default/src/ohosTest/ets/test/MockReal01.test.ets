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
import { weather } from '@ohos/common'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

interface HourItem {
  hours: string
  wea: string
  wea_img: string
  tem: string
  win: string
  win_speed: string
}

interface IndexItem {
  title: string
  level: string
  desc: string
}

export default function mockReal01Test() {
  describe('MockReal01', () => {

    /**
     * @tc.name   testMock0001
     * @tc.number SUB_WEATHER_MOCK_0001
     * @tc.desc   Frozen weather table contains exactly five cities
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0001 begin')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', weather.length, 5)
      expect(weather.length).assertEqual(5)
      expect(weather[4] !== undefined).assertTrue()
      expect(weather[5]).assertUndefined()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0001 end')
    })

    /**
     * @tc.name   testMock0002
     * @tc.number SUB_WEATHER_MOCK_0002
     * @tc.desc   Every city record carries seven daily entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0002 begin')
      let allSeven = true
      for (let i = 0; i < weather.length; i++) {
        if (weather[i].data.length !== 7) {
          allSeven = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual allSeven=%{public}s', String(allSeven))
      expect(allSeven).assertTrue()
      expect(weather[0].data.length).assertEqual(7)
      expect(weather[2].data.length).assertEqual(7)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0002 end')
    })

    /**
     * @tc.name   testMock0003
     * @tc.number SUB_WEATHER_MOCK_0003
     * @tc.desc   Beijing record keeps frozen identifiers and localized names
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0003 begin')
      const beijing = weather[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', beijing.cityid, beijing.city, beijing.cityEn)
      expect(beijing.cityid).assertEqual('101210101')
      expect(beijing.city).assertEqual('北京')
      expect(beijing.cityEn).assertEqual('beijing')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0003 end')
    })

    /**
     * @tc.name   testMock0004
     * @tc.number SUB_WEATHER_MOCK_0004
     * @tc.desc   Shanghai record keeps frozen identifiers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0004 begin')
      const shanghai = weather[1]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', shanghai.cityid, shanghai.city)
      expect(shanghai.cityid).assertEqual('101210102')
      expect(shanghai.city).assertEqual('上海')
      expect(shanghai.cityEn).assertEqual('shanghai')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0004 end')
    })

    /**
     * @tc.name   testMock0005
     * @tc.number SUB_WEATHER_MOCK_0005
     * @tc.desc   Guangzhou record keeps frozen identifiers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0005 begin')
      const gz = weather[2]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', gz.cityid, gz.city)
      expect(gz.cityid).assertEqual('101210103')
      expect(gz.city).assertEqual('广州')
      expect(gz.cityEn).assertEqual('guangzhou')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0005 end')
    })

    /**
     * @tc.name   testMock0006
     * @tc.number SUB_WEATHER_MOCK_0006
     * @tc.desc   Tianjin record keeps frozen identifiers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0006 begin')
      const tj = weather[3]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', tj.cityid, tj.city)
      expect(tj.cityid).assertEqual('101210104')
      expect(tj.city).assertEqual('天津')
      expect(tj.cityEn).assertEqual('tianjin')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0006 end')
    })

    /**
     * @tc.name   testMock0007
     * @tc.number SUB_WEATHER_MOCK_0007
     * @tc.desc   Wuhan record keeps frozen identifiers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0007 begin')
      const wh = weather[4]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', wh.cityid, wh.city)
      expect(wh.cityid).assertEqual('101210105')
      expect(wh.city).assertEqual('武汉')
      expect(wh.cityEn).assertEqual('wuhan')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0007 end')
    })

    /**
     * @tc.name   testMock0008
     * @tc.number SUB_WEATHER_MOCK_0008
     * @tc.desc   Every city record reports China as its country
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0008 begin')
      let allChina = true
      for (let i = 0; i < weather.length; i++) {
        if (weather[i].country !== '中国' || weather[i].countryEn !== 'China') {
          allChina = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual allChina=%{public}s', String(allChina))
      expect(allChina).assertTrue()
      expect(weather[0].country).assertEqual('中国')
      expect(weather[4].countryEn).assertEqual('China')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0008 end')
    })

    /**
     * @tc.name   testMock0009
     * @tc.number SUB_WEATHER_MOCK_0009
     * @tc.desc   Day two of Beijing mirrors the frozen 2022-06-24 header
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0009 begin')
      const d1 = weather[0].data[1]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', d1.date, d1.week, d1.wea)
      expect(d1.date).assertEqual('2022-06-24')
      expect(d1.week).assertEqual('星期五')
      expect(d1.wea).assertEqual('晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0009 end')
    })

    /**
     * @tc.name   testMock0010
     * @tc.number SUB_WEATHER_MOCK_0010
     * @tc.desc   Beijing day two temperature triple equals frozen numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0010 begin')
      const d1 = weather[0].data[1]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual tem=%{public}s', String(d1.tem))
      expect(String(d1.tem)).assertEqual('32')
      expect(String(d1.tem1)).assertEqual('35')
      expect(String(d1.tem2)).assertEqual('25')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0010 end')
    })

    /**
     * @tc.name   testMock0011
     * @tc.number SUB_WEATHER_MOCK_0011
     * @tc.desc   First day carries no hourly or index detail lists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0011 begin')
      const d0 = weather[0].data[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual hours=%{public}d index=%{public}d', d0.hours.length, d0.index.length)
      expect(d0.hours.length).assertEqual(0)
      expect(d0.index.length).assertEqual(0)
      expect(d0.date).assertEqual('2022-06-23')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0011 end')
    })

    /**
     * @tc.name   testMock0012
     * @tc.number SUB_WEATHER_MOCK_0012
     * @tc.desc   Second day exposes the full 24-slot hourly list
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0012 begin')
      const hours = weather[0].data[1].hours as HourItem[]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', hours.length, 24)
      expect(hours.length).assertEqual(24)
      expect(hours[0].hours).assertEqual('09时')
      expect(hours[23].hours).assertEqual('08时')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0012 end')
    })

    /**
     * @tc.name   testMock0013
     * @tc.number SUB_WEATHER_MOCK_0013
     * @tc.desc   Beijing hourly head keeps frozen weather payload
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0013 begin')
      const head = (weather[0].data[1].hours as HourItem[])[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', head.tem, head.wea, head.win)
      expect(String(head.tem)).assertEqual('30')
      expect(head.wea).assertEqual('晴')
      expect(head.wea_img).assertEqual('sunny')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0013 end')
    })

    /**
     * @tc.name   testMock0014
     * @tc.number SUB_WEATHER_MOCK_0014
     * @tc.desc   Beijing 17:00 hourly entry switches to cloudy payload
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0014 begin')
      const item = (weather[0].data[1].hours as HourItem[])[8]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', item.hours, item.wea_img)
      expect(item.hours).assertEqual('17时')
      expect(item.wea).assertEqual('多云')
      expect(item.wea_img).assertEqual('cloudy')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(item.win))
      expect(item.win).assertEqual('西北风')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0014 end')
    })

    /**
     * @tc.name   testMock0015
     * @tc.number SUB_WEATHER_MOCK_0015
     * @tc.desc   Every hourly entry carries the six frozen field names
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0015 begin')
      const hours = weather[1].data[1].hours as HourItem[]
      let shaped = true
      for (let i = 0; i < hours.length; i++) {
        if (hours[i].hours.length === 0 || hours[i].win_speed.length === 0) {
          shaped = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual shaped=%{public}s first=%{public}s', String(shaped), hours[0].hours)
      expect(shaped).assertTrue()
      expect(hours[0].hours).assertEqual('08时')
      expect(hours[0].win).assertEqual('西南风')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0015 end')
    })

    /**
     * @tc.name   testMock0016
     * @tc.number SUB_WEATHER_MOCK_0016
     * @tc.desc   Second day carries exactly eight life index rows
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0016 begin')
      const idx = weather[0].data[1].index as IndexItem[]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d expected=%{public}d', idx.length, 8)
      expect(idx.length).assertEqual(8)
      expect(idx[0].title).assertEqual('湿度')
      expect(idx[0].level).assertEqual('42%')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0016 end')
    })

    /**
     * @tc.name   testMock0017
     * @tc.number SUB_WEATHER_MOCK_0017
     * @tc.desc   Life index titles follow the frozen eight-topic order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0017 begin')
      const idx = weather[0].data[1].index as IndexItem[]
      const titles: string[] = ['湿度', '体感温度', '风力', '风向', '穿衣', '运动', '感冒', '紫外线']
      let same = true
      for (let i = 0; i < titles.length; i++) {
        if (idx[i].title !== titles[i]) {
          same = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual same=%{public}s', String(same))
      expect(same).assertTrue()
      expect(idx[4].title).assertEqual('穿衣')
      expect(idx[7].title).assertEqual('紫外线')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0017 end')
    })

    /**
     * @tc.name   testMock0018
     * @tc.number SUB_WEATHER_MOCK_0018
     * @tc.desc   Beijing first index row keeps the frozen humidity tip text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0018 begin')
      const row = (weather[0].data[1].index as IndexItem[])[0]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual desc=%{public}s', row.desc)
      expect(row.desc).assertEqual('湿度刚好。')
      expect(row.title).assertEqual('湿度')
      expect(row.level.endsWith('%')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0018 end')
    })

    /**
     * @tc.name   testMock0019
     * @tc.number SUB_WEATHER_MOCK_0019
     * @tc.desc   Beijing aqi block keeps frozen headline values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0019 begin')
      const aqi = weather[0].aqi
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual air=%{public}s level=%{public}s', aqi.air, aqi.air_level)
      expect(aqi.air).assertEqual('28')
      expect(aqi.air_level).assertEqual('优')
      expect(aqi.update_time).assertEqual('13:44')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0019 end')
    })

    /**
     * @tc.name   testMock0020
     * @tc.number SUB_WEATHER_MOCK_0020
     * @tc.desc   Beijing pollutant readings equal the frozen particulate trio
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0020 begin')
      const aqi = weather[0].aqi
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual pm10=%{public}s pm25=%{public}s', aqi.pm10, aqi.pm25)
      expect(aqi.pm10).assertEqual('181')
      expect(aqi.pm25).assertEqual('94')
      expect(aqi.pm10_desc).assertEqual('优')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0020 end')
    })

    /**
     * @tc.name   testMock0021
     * @tc.number SUB_WEATHER_MOCK_0021
     * @tc.desc   Beijing gas readings keep frozen ozone and carbon values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0021 begin')
      const aqi = weather[0].aqi
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual o3=%{public}s co=%{public}s', aqi.o3, aqi.co)
      expect(aqi.o3).assertEqual('19')
      expect(aqi.no2).assertEqual('105')
      expect(aqi.so2).assertEqual('67')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0021 end')
    })

    /**
     * @tc.name   testMock0022
     * @tc.number SUB_WEATHER_MOCK_0022
     * @tc.desc   Beijing advice fields keep the frozen five lifestyle texts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0022 begin')
      const aqi = weather[0].aqi
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual mask=%{public}s', aqi.kouzhao)
      expect(aqi.kouzhao).assertEqual('不用佩戴口罩')
      expect(aqi.yundong).assertEqual('非常适宜运动')
      expect(aqi.jinghuaqi).assertEqual('关闭净化器')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0022 end')
    })

    /**
     * @tc.name   testMock0023
     * @tc.number SUB_WEATHER_MOCK_0023
     * @tc.desc   Anchor: Beijing aqi cityEn accidentally equals hangzhou
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0023 begin')
      const aqi = weather[0].aqi
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual aqi.cityEn=%{public}s vs city.cityEn=%{public}s', aqi.cityEn, weather[0].cityEn)
      expect(aqi.cityEn).assertEqual('hangzhou')
      expect(aqi.cityEn === weather[0].cityEn).assertFalse()
      expect(aqi.city).assertEqual('北京')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0023 end')
    })

    /**
     * @tc.name   testMock0024
     * @tc.number SUB_WEATHER_MOCK_0024
     * @tc.desc   Shanghai aqi keeps its internally consistent identifiers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0024 begin')
      const aqi = weather[1].aqi
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', aqi.cityid, aqi.cityEn)
      expect(aqi.cityid).assertEqual('101210102')
      expect(aqi.cityEn).assertEqual('shanghai')
      expect(aqi.air).assertEqual('32')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0024 end')
    })

    /**
     * @tc.name   testMock0025
     * @tc.number SUB_WEATHER_MOCK_0025
     * @tc.desc   Anchor: Tianjin air quality is rated 良 with 良 sub-descriptors
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0025 begin')
      const aqi = weather[3].aqi
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual air=%{public}s level=%{public}s', aqi.air, aqi.air_level)
      expect(aqi.air).assertEqual('50')
      expect(aqi.air_level).assertEqual('良')
      expect(aqi.o3_desc).assertEqual('良')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0025 end')
    })

    /**
     * @tc.name   testMock0026
     * @tc.number SUB_WEATHER_MOCK_0026
     * @tc.desc   Wuhan aqi keeps the frozen low pollution readings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0026 begin')
      const aqi = weather[4].aqi
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual air=%{public}s pm10=%{public}s', aqi.air, aqi.pm10)
      expect(aqi.air).assertEqual('29')
      expect(aqi.air_level).assertEqual('优')
      expect(aqi.pm10).assertEqual('178')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0026 end')
    })

    /**
     * @tc.name   testMock0027
     * @tc.number SUB_WEATHER_MOCK_0027
     * @tc.desc   Daily label combines padded day number and weekday
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0027 begin')
      const d0 = weather[2].data[0]
      const d6 = weather[2].data[6]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', d0.day, d6.day)
      expect(d0.day).assertEqual('23日（星期四）')
      expect(d6.day).assertEqual('29日（星期三）')
      expect(d0.day.includes('（')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0027 end')
    })

    /**
     * @tc.name   testMock0028
     * @tc.number SUB_WEATHER_MOCK_0028
     * @tc.desc   Guangzhou surface data keeps frozen rainy readings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMock0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0028 begin')
      const d1 = weather[2].data[1]
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual wea=%{public}s tem=%{public}s', d1.wea, String(d1.tem))
      expect(d1.wea).assertEqual('小雨')
      expect(String(d1.tem)).assertEqual('26')
      expect(String(d1.tem1)).assertEqual('30')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0028 end')
    })

    /**
     * @tc.name   testMock0029
     * @tc.number SUB_WEATHER_MOCK_0029
     * @tc.desc   Anchor: all five cities share the same day-two date stamp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0029 begin')
      let sameDate = true
      for (let i = 0; i < weather.length; i++) {
        if (weather[i].data[1].date !== '2022-06-24') {
          sameDate = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual sameDate=%{public}s', String(sameDate))
      expect(sameDate).assertTrue()
      expect(weather[3].data[1].date).assertEqual('2022-06-24')
      expect(weather[0].data[1].date).assertEqual(weather[4].data[1].date)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0029 end')
    })

    /**
     * @tc.name   testMock0030
     * @tc.number SUB_WEATHER_MOCK_0030
     * @tc.desc   Day sequence runs 23rd through 29th without gaps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMock0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0030 begin')
      const days = ['2022-06-23', '2022-06-24', '2022-06-25', '2022-06-26', '2022-06-27', '2022-06-28', '2022-06-29']
      let ordered = true
      for (let i = 0; i < 7; i++) {
        if (weather[1].data[i].date !== days[i]) {
          ordered = false
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual ordered=%{public}s', String(ordered))
      expect(ordered).assertTrue()
      expect(weather[1].data[0].date).assertEqual('2022-06-23')
      expect(weather[1].data[6].date).assertEqual('2022-06-29')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMock0030 end')
    })
  })
}
