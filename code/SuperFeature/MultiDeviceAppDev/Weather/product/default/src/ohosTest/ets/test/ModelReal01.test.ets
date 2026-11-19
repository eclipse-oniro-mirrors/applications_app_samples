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
import { Forecast, WeekWeather, AirIndex, SuitData, AirData, HeaderData, City, CityListData } from '@ohos/common'

const LOG_DOMAIN: number = 0xF811
const LOG_TAG: string = '[Sample_Weather]'

export default function modelReal01Test() {
  describe('ModelReal01', () => {

    /**
     * @tc.name   testModel0001
     * @tc.number SUB_WEATHER_MODEL_0001
     * @tc.desc   Forecast stores all six constructor arguments verbatim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0001 begin')
      const f = new Forecast('30°', '09:00', '上午', 'sunny', '西南风', '3-4级')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', f.degree, f.date)
      expect(f.degree).assertEqual('30°')
      expect(f.date).assertEqual('09:00')
      expect(f.desc).assertEqual('上午')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(f.winSpeed))
      expect(f.winSpeed).assertEqual('3-4级')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0001 end')
    })

    /**
     * @tc.name   testModel0002
     * @tc.number SUB_WEATHER_MODEL_0002
     * @tc.desc   Forecast accepts empty strings for every text field
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0002 begin')
      const f = new Forecast('', '', '', '', '', '')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual len=%{public}d', f.degree.length)
      expect(f.degree.length).assertEqual(0)
      expect(f.date.length).assertEqual(0)
      expect(f.win.length).assertEqual(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(f.winSpeed.length))
      expect(f.winSpeed.length).assertEqual(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0002 end')
    })

    /**
     * @tc.name   testModel0003
     * @tc.number SUB_WEATHER_MODEL_0003
     * @tc.desc   Forecast icon field accepts a plain string payload
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0003 begin')
      const f = new Forecast('1°', '00:00', '早上', 'stringIcon', '无风', '<1级')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual icon=%{public}s', String(f.icon))
      expect(f.icon).assertEqual('stringIcon')
      expect(typeof f.icon).assertEqual('string')
      expect(f.desc).assertEqual('早上')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0003 end')
    })

    /**
     * @tc.name   testModel0004
     * @tc.number SUB_WEATHER_MODEL_0004
     * @tc.desc   Forecast instances keep independent field values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0004 begin')
      const a = new Forecast('1°', 'a', 'b', 'c', 'd', 'e')
      const b = new Forecast('2°', 'f', 'g', 'h', 'i', 'j')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', a.degree, b.degree)
      expect(a.degree === b.degree).assertFalse()
      expect(a.date).assertEqual('a')
      expect(b.date).assertEqual('f')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(b.win))
      expect(b.win).assertEqual('i')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0004 end')
    })

    /**
     * @tc.name   testModel0005
     * @tc.number SUB_WEATHER_MODEL_0005
     * @tc.desc   WeekWeather stores seven text fields and icon verbatim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testModel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0005 begin')
      const w = new WeekWeather('06/23', '星期四', 'yin', '阴', '优', '35', '25')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', w.date, w.week)
      expect(w.date).assertEqual('06/23')
      expect(w.weather).assertEqual('阴')
      expect(w.airLevel).assertEqual('优')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(w.max))
      expect(w.max).assertEqual('35')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0005 end')
    })

    /**
     * @tc.name   testModel0006
     * @tc.number SUB_WEATHER_MODEL_0006
     * @tc.desc   WeekWeather min/max fields accept arbitrary strings untouched
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0006 begin')
      const w = new WeekWeather('', '', 'x', '', '', '-9', 'N/A')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual min=%{public}s max=%{public}s', w.min, w.max)
      expect(w.min).assertEqual('N/A')
      expect(w.max).assertEqual('-9')
      expect(w.date.length).assertEqual(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(w.icon))
      expect(w.icon).assertEqual('x')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0006 end')
    })

    /**
     * @tc.name   testModel0007
     * @tc.number SUB_WEATHER_MODEL_0007
     * @tc.desc   WeekWeather accepts a Resource object in the icon slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0007 begin')
      const w = new WeekWeather('06/', '星期五', $r('app.media.ic_weather_sunny'), '晴', '良', '30', '20')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual weather=%{public}s', w.weather)
      expect(w.weather).assertEqual('晴')
      expect(w.icon instanceof Object).assertTrue()
      expect(w.airLevel).assertEqual('良')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0007 end')
    })

    /**
     * @tc.name   testModel0008
     * @tc.number SUB_WEATHER_MODEL_0008
     * @tc.desc   WeekWeather unicode payloads survive round-trip untouched
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testModel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0008 begin')
      const w = new WeekWeather('😀/🌧', '星期☀', 'i', '雪❄', '优💡', '🔥', '💧')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', w.week)
      expect(w.date).assertEqual('😀/🌧')
      expect(w.weather).assertEqual('雪❄')
      expect(w.max).assertEqual('🔥')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(w.min.length > 0))
      expect(w.min.length > 0).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0008 end')
    })

    /**
     * @tc.name   testModel0009
     * @tc.number SUB_WEATHER_MODEL_0009
     * @tc.desc   AirIndex stores label and figure untouched
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testModel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0009 begin')
      const a = new AirIndex('PM10', 181)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', a.index, String(a.figure))
      expect(a.index).assertEqual('PM10')
      expect(a.figure).assertEqual(181)
      expect(a.index.length).assertEqual(4)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0009 end')
    })

    /**
     * @tc.name   testModel0010
     * @tc.number SUB_WEATHER_MODEL_0010
     * @tc.desc   AirIndex keeps a string figure supplied by mock data
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0010 begin')
      const a = new AirIndex('O2', '94')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual figure=%{public}s', String(a.figure))
      expect(String(a.figure)).assertEqual('94')
      expect(a.index).assertEqual('O2')
      expect(typeof a.figure).assertEqual('string')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0010 end')
    })

    /**
     * @tc.name   testModel0011
     * @tc.number SUB_WEATHER_MODEL_0011
     * @tc.desc   AirIndex tolerates numeric edge values zero and negatives
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0011 begin')
      const z = new AirIndex('CO', 0)
      const n = new AirIndex('NO2', -5)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d|%{public}d', z.figure, n.figure)
      expect(z.figure).assertEqual(0)
      expect(n.figure).assertEqual(-5)
      expect(z.index).assertEqual('CO')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0011 end')
    })

    /**
     * @tc.name   testModel0012
     * @tc.number SUB_WEATHER_MODEL_0012
     * @tc.desc   AirIndex empty label stays empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testModel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0012 begin')
      const a = new AirIndex('', 500)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual len=%{public}d', a.index.length)
      expect(a.index.length).assertEqual(0)
      expect(a.figure).assertEqual(500)
      expect(a.index === '').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0012 end')
    })

    /**
     * @tc.name   testModel0013
     * @tc.number SUB_WEATHER_MODEL_0013
     * @tc.desc   SuitData stores resource plus description and value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testModel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0013 begin')
      const s = new SuitData($r('app.media.ic_weather_sunny'), '湿度', '42%')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', s.desc, s.value)
      expect(s.desc).assertEqual('湿度')
      expect(s.value).assertEqual('42%')
      expect(s.src instanceof Object).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0013 end')
    })

    /**
     * @tc.name   testModel0014
     * @tc.number SUB_WEATHER_MODEL_0014
     * @tc.desc   SuitData accepts empty description and value strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0014 begin')
      const s = new SuitData($r('app.media.ic_weather_yin'), '', '')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual desc len=%{public}d', s.desc.length)
      expect(s.desc.length).assertEqual(0)
      expect(s.value.length).assertEqual(0)
      expect(s.src.id > 0).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0014 end')
    })

    /**
     * @tc.name   testModel0015
     * @tc.number SUB_WEATHER_MODEL_0015
     * @tc.desc   SuitData resource field carries the referenced media id
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0015 begin')
      const s1 = new SuitData($r('app.media.ic_weather_sunny'), '穿衣', '短袖')
      const s2 = new SuitData($r('app.media.ic_weather_rain'), '运动', '宜室内')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual ids=%{public}d|%{public}d', s1.src.id, s2.src.id)
      expect(s1.src.id === s2.src.id).assertFalse()
      expect(s1.value).assertEqual('短袖')
      expect(s2.desc).assertEqual('运动')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0015 end')
    })

    /**
     * @tc.name   testModel0016
     * @tc.number SUB_WEATHER_MODEL_0016
     * @tc.desc   SuitData long value strings are stored without truncation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testModel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0016 begin')
      const long: string = '适宜'.repeat(50)
      const s = new SuitData($r('app.media.ic_weather_cloudy'), '感冒', long)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual len=%{public}d expected=%{public}d', s.value.length, 100)
      expect(s.value.length).assertEqual(100)
      expect(s.value.startsWith('适宜')).assertTrue()
      expect(s.desc).assertEqual('感冒')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0016 end')
    })

    /**
     * @tc.name   testModel0017
     * @tc.number SUB_WEATHER_MODEL_0017
     * @tc.desc   AirData stores quality number and description text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testModel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0017 begin')
      const air = new AirData('28', '优')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', air.airQuality, air.airDesc)
      expect(air.airQuality).assertEqual('28')
      expect(air.airDesc).assertEqual('优')
      expect(air.airQuality.length).assertEqual(2)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0017 end')
    })

    /**
     * @tc.name   testModel0018
     * @tc.number SUB_WEATHER_MODEL_0018
     * @tc.desc   AirData empty values remain empty strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0018 begin')
      const air = new AirData('', '')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual q len=%{public}d', air.airQuality.length)
      expect(air.airQuality.length).assertEqual(0)
      expect(air.airDesc.length).assertEqual(0)
      expect(air.airQuality === '').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0018 end')
    })

    /**
     * @tc.name   testModel0019
     * @tc.number SUB_WEATHER_MODEL_0019
     * @tc.desc   AirData boundary values 0 and 500 are stored verbatim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0019 begin')
      const low = new AirData('0', '优')
      const high = new AirData('500', '严重污染')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', low.airQuality, high.airQuality)
      expect(low.airQuality).assertEqual('0')
      expect(high.airQuality).assertEqual('500')
      expect(high.airDesc).assertEqual('严重污染')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0019 end')
    })

    /**
     * @tc.name   testModel0020
     * @tc.number SUB_WEATHER_MODEL_0020
     * @tc.desc   AirData non numeric quality stays untouched
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testModel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0020 begin')
      const air = new AirData('abc', '-')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', air.airQuality)
      expect(air.airQuality).assertEqual('abc')
      expect(air.airDesc).assertEqual('-')
      expect(Number.isNaN(Number(air.airQuality))).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0020 end')
    })

    /**
     * @tc.name   testModel0021
     * @tc.number SUB_WEATHER_MODEL_0021
     * @tc.desc   HeaderData stores the eight home-header fields
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testModel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0021 begin')
      const air = new AirData('28', '优')
      const h = new HeaderData('北京', '32', '晴', '35', '25', 'sunny', air, '当前晴，炎热，不适合外出游玩！')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', h.city, h.temp)
      expect(h.city).assertEqual('北京')
      expect(h.temp).assertEqual('32')
      expect(h.weatherType).assertEqual('晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(h.airData.airDesc))
      expect(h.airData.airDesc).assertEqual('优')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0021 end')
    })

    /**
     * @tc.name   testModel0022
     * @tc.number SUB_WEATHER_MODEL_0022
     * @tc.desc   HeaderData max/min/tips fields keep supplied strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0022 begin')
      const h = new HeaderData('X', '1', '阴', '2', '0', 'yin', new AirData('1', '良'), 'tips')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', h.max, h.min)
      expect(h.max).assertEqual('2')
      expect(h.min).assertEqual('0')
      expect(h.airTips).assertEqual('tips')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(h.airData.airQuality))
      expect(h.airData.airQuality).assertEqual('1')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0022 end')
    })

    /**
     * @tc.name   testModel0023
     * @tc.number SUB_WEATHER_MODEL_0023
     * @tc.desc   HeaderData icon slot accepts a Resource instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0023 begin')
      const h = new HeaderData('上海', '28', '阴', '32', '25', $r('app.media.ic_weather_yin'), new AirData('32', '优'), 't')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual city=%{public}s', h.city)
      expect(h.city).assertEqual('上海')
      expect(h.icon instanceof Object).assertTrue()
      expect(h.weatherType).assertEqual('阴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0023 end')
    })

    /**
     * @tc.name   testModel0024
     * @tc.number SUB_WEATHER_MODEL_0024
     * @tc.desc   HeaderData shares the referenced AirData instance by reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testModel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0024 begin')
      const air = new AirData('28', '优')
      const h = new HeaderData('C', '1', '晴', '2', '3', 'i', air, 't')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual same=%{public}s', String(h.airData === air))
      expect(h.airData === air).assertTrue()
      expect(h.airData.airQuality).assertEqual('28')
      expect(h.min).assertEqual('3')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0024 end')
    })

    /**
     * @tc.name   testModel0025
     * @tc.number SUB_WEATHER_MODEL_0025
     * @tc.desc   City stores name temp weather triple
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testModel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0025 begin')
      const c = new City('北京', '32', '晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s|%{public}s', c.name, c.temp, c.weather)
      expect(c.name).assertEqual('北京')
      expect(c.temp).assertEqual('32')
      expect(c.weather).assertEqual('晴')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0025 end')
    })

    /**
     * @tc.name   testModel0026
     * @tc.number SUB_WEATHER_MODEL_0026
     * @tc.desc   City fields are mutable after construction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0026 begin')
      const c = new City('测试城', '0', '晴')
      c.weather = '小雨'
      c.temp = '26'
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s|%{public}s', c.weather, c.temp)
      expect(c.weather).assertEqual('小雨')
      expect(c.temp).assertEqual('26')
      expect(c.name).assertEqual('测试城')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0026 end')
    })

    /**
     * @tc.name   testModel0027
     * @tc.number SUB_WEATHER_MODEL_0027
     * @tc.desc   City with empty triple keeps all fields empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0027 begin')
      const c = new City('', '', '')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual name len=%{public}d', c.name.length)
      expect(c.name.length).assertEqual(0)
      expect(c.temp.length).assertEqual(0)
      expect(c.weather.length).assertEqual(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0027 end')
    })

    /**
     * @tc.name   testModel0028
     * @tc.number SUB_WEATHER_MODEL_0028
     * @tc.desc   City name supports long unicode payloads
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testModel0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0028 begin')
      const c = new City('呼和浩特'.repeat(10), '-1', '雷阵雨☡')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual len=%{public}d', c.name.length)
      expect(c.name.length).assertEqual(40)
      expect(c.temp).assertEqual('-1')
      expect(c.weather.endsWith('☡')).assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0028 end')
    })

    /**
     * @tc.name   testModel0029
     * @tc.number SUB_WEATHER_MODEL_0029
     * @tc.desc   CityListData bundles all seven aggregate sections
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testModel0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0029 begin')
      const air = new AirData('28', '优')
      const header = new HeaderData('北京', '32', '晴', '35', '25', 's', air, 't')
      const cl = new CityListData('北京', header, [], [], air, [], [])
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s header=%{public}s', cl.city, cl.header.city)
      expect(cl.city).assertEqual('北京')
      expect(cl.header.weatherType).assertEqual('晴')
      expect(cl.airData.airQuality).assertEqual('28')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0029 end')
    })

    /**
     * @tc.name   testModel0030
     * @tc.number SUB_WEATHER_MODEL_0030
     * @tc.desc   CityListData list sections keep supplied lengths
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0030 begin')
      const hours: Forecast[] = [new Forecast('1°', 'a', 'b', 'c', 'd', 'e')]
      const week: WeekWeather[] = [new WeekWeather('06/', '五', 'i', '晴', '优', '1', '0')]
      const airIdx: AirIndex[] = [new AirIndex('PM10', 1)]
      const life: SuitData[] = [new SuitData($r('app.media.icon_humidity'), '湿度', '1%')]
      const cl = new CityListData('X', new HeaderData('X', '1', '晴', '2', '3', 'i', new AirData('1', '优'), 't'),
        hours, week, new AirData('9', '良'), airIdx, life)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}d|%{public}d', cl.hoursData.length, cl.weekData.length)
      expect(cl.hoursData.length).assertEqual(1)
      expect(cl.weekData.length).assertEqual(1)
      expect(cl.airIndex.length).assertEqual(1)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(cl.suitDate.length))
      expect(cl.suitDate.length).assertEqual(1)
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0030 end')
    })

    /**
     * @tc.name   testModel0031
     * @tc.number SUB_WEATHER_MODEL_0031
     * @tc.desc   CityListData with empty arrays initialises empty sections
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testModel0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0031 begin')
      const air = new AirData('', '')
      const cl = new CityListData('', new HeaderData('', '', '', '', '', '', air, ''), [], [], air, [], [])
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual hours=%{public}d suit=%{public}d', cl.hoursData.length, cl.suitDate.length)
      expect(cl.hoursData.length).assertEqual(0)
      expect(cl.weekData.length).assertEqual(0)
      expect(cl.airIndex.length).assertEqual(0)
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(cl.city === ''))
      expect(cl.city === '').assertTrue()
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0031 end')
    })

    /**
     * @tc.name   testModel0032
     * @tc.number SUB_WEATHER_MODEL_0032
     * @tc.desc   CityListData instances do not share list containers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testModel0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0032 begin')
      const air = new AirData('1', '优')
      const header = new HeaderData('A', '1', '晴', '2', '3', 'i', air, 't')
      const shared: Forecast[] = []
      const c1 = new CityListData('A', header, shared, [], air, [], [])
      const c2 = new CityListData('B', header, [], [], air, [], [])
      shared.push(new Forecast('1°', 'x', 'y', 'z', 'w', 'v'))
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual c1=%{public}d c2=%{public}d', c1.hoursData.length, c2.hoursData.length)
      expect(c1.hoursData.length).assertEqual(1)
      expect(c2.hoursData.length).assertEqual(0)
      expect(c1.city).assertEqual('A')
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s', String(c2.city))
      expect(c2.city).assertEqual('B')
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testModel0032 end')
    })
  })
}
