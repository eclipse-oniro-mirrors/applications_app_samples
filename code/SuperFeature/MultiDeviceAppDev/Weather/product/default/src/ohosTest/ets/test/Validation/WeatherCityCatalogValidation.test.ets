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

import { describe, it, expect } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import {
  getHeaderDate,
  getCityListWeatherData,
  getHoursData,
  getWeekWeatherData,
  getAirIndexData,
  getLifeData,
  HeaderData,
  CityListData,
  Forecast,
  AirIndex,
  SuitData,
  WeekWeather,
  City
} from '@ohos/common';

const DATASET = 'WeatherCityCatalogValidation';

const DOMAIN: number = 0xF812;
const TAG: string = '[WeatherCityCatalogValidation]';

const CITY_COUNT: number = 5;

const AIR_LABELS: string[] = ['PM10', 'PM2.5', 'NO2', 'SO2', 'O2', 'CO'];

const LIFE_TITLES: string[] = ['湿度', '体感温度', '风力', '风向', '穿衣', '运动', '感冒', '紫外线'];

function setCityList(cities: Array<City>): void {
  AppStorage.SetOrCreate<Array<City>>('cityList', cities);
}

function probes(count: number): Array<City> {
  const cities: Array<City> = [];
  for (let i = 0; i < count; i++) {
    cities.push(new City('probe' + String(i), '20', 'sunny'));
  }
  return cities;
}

function hourDegreeTrace(hours: Array<Forecast>): string {
  let trace: string = '';
  for (let i = 0; i < hours.length; i++) {
    if (hours[i].date !== '17:32') {
      trace += hours[i].degree + ',';
    }
  }
  return trace;
}

function airFigureTrace(index: number): string {
  const air: Array<AirIndex> = getAirIndexData(index);
  let trace: string = '';
  for (let i = 0; i < air.length; i++) {
    trace += String(air[i].figure) + ',';
  }
  return trace;
}

function lifeValueTrace(index: number): string {
  const suits: Array<SuitData> = getLifeData(index);
  let trace: string = '';
  for (let i = 0; i < suits.length; i++) {
    trace += suits[i].value + ',';
  }
  return trace;
}

function lifeTitleTrace(index: number): string {
  const suits: Array<SuitData> = getLifeData(index);
  let trace: string = '';
  for (let i = 0; i < suits.length; i++) {
    trace += suits[i].desc + ',';
  }
  return trace;
}

function weekTrace(index: number, field: string): string {
  const weeks: Array<WeekWeather> = getWeekWeatherData(index);
  let trace: string = '';
  for (let i = 0; i < weeks.length; i++) {
    if (field === 'weather') {
      trace += weeks[i].weather + ',';
    } else if (field === 'max') {
      trace += weeks[i].max + ',';
    } else if (field === 'min') {
      trace += weeks[i].min + ',';
    } else if (field === 'date') {
      trace += weeks[i].date + ',';
    } else {
      trace += weeks[i].week + ',';
    }
  }
  return trace;
}

export default function weatherCityCatalogValidationSuite() {
  describe('WeatherCityCatalogValidation', () => {
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1860
     * @tc.name    WeatherCityCatalogValidation1
     * @tc.desc    city 0 header mirrors the 北京 mock record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'headerBeijing', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const header: HeaderData = getHeaderDate(0);
      expect(header.city).assertEqual('北京');
      expect(header.temp).assertEqual('32');
      expect(header.weatherType).assertEqual('晴');
      expect(header.max).assertEqual('35');
      expect(header.min).assertEqual('25');
      expect(header.airData.airQuality).assertEqual('28');
      expect(header.airData.airDesc).assertEqual('优');
      expect(header.airTips).assertEqual('当前晴，炎热，不适合外出游玩！');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1861
     * @tc.name    WeatherCityCatalogValidation2
     * @tc.desc    city 1 header mirrors the 上海 mock record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'headerShanghai', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const header: HeaderData = getHeaderDate(1);
      expect(header.city).assertEqual('上海');
      expect(header.temp).assertEqual('28');
      expect(header.weatherType).assertEqual('阴');
      expect(header.max).assertEqual('32');
      expect(header.min).assertEqual('25');
      expect(header.airData.airQuality).assertEqual('32');
      expect(header.airData.airDesc).assertEqual('优');
      expect(header.airTips).assertEqual('当前阴，紫外线弱，适合外出游玩！');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1862
     * @tc.name    WeatherCityCatalogValidation3
     * @tc.desc    city 2 header mirrors the 广州 mock record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'headerGuangzhou', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const header: HeaderData = getHeaderDate(2);
      expect(header.city).assertEqual('广州');
      expect(header.temp).assertEqual('26');
      expect(header.weatherType).assertEqual('小雨');
      expect(header.max).assertEqual('30');
      expect(header.min).assertEqual('22');
      expect(header.airData.airQuality).assertEqual('50');
      expect(header.airData.airDesc).assertEqual('良');
      expect(header.airTips).assertEqual('今天小雨，天气凉爽');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1863
     * @tc.name    WeatherCityCatalogValidation4
     * @tc.desc    city 3 header mirrors the 天津 mock record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'headerTianjin', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const header: HeaderData = getHeaderDate(3);
      expect(header.city).assertEqual('天津');
      expect(header.temp).assertEqual('32');
      expect(header.weatherType).assertEqual('中雨');
      expect(header.max).assertEqual('32');
      expect(header.min).assertEqual('25');
      expect(header.airData.airQuality).assertEqual('50');
      expect(header.airData.airDesc).assertEqual('良');
      expect(header.airTips).assertEqual('今天中雨，出门记得带伞哦！');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1864
     * @tc.name    WeatherCityCatalogValidation5
     * @tc.desc    city 4 header mirrors the 武汉 mock record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'headerWuhan', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const header: HeaderData = getHeaderDate(4);
      expect(header.city).assertEqual('武汉');
      expect(header.temp).assertEqual('27');
      expect(header.weatherType).assertEqual('多云');
      expect(header.max).assertEqual('29');
      expect(header.min).assertEqual('22');
      expect(header.airData.airQuality).assertEqual('29');
      expect(header.airData.airDesc).assertEqual('优');
      expect(header.airTips).assertEqual('今天空气很好，适合外出游玩，注意防晒！');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1865
     * @tc.name    WeatherCityCatalogValidation6
     * @tc.desc    city 0 weekly forecast keeps the shipped weather sequence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'weekBeijing', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weeks: Array<WeekWeather> = getWeekWeatherData(0);
      expect(weeks.length).assertEqual(7);
      expect(weekTrace(0, 'weather')).assertEqual('阴,晴,多云,小雨,阴,晴,多云,');
      expect(weekTrace(0, 'max')).assertEqual('35,35,32,36,36,36,35,');
      expect(weekTrace(0, 'min')).assertEqual('25,25,26,27,26,27,26,');
      expect(weekTrace(0, 'date')).assertEqual('06/23,06/24,06/25,06/26,06/27,06/28,06/29,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1866
     * @tc.name    WeatherCityCatalogValidation7
     * @tc.desc    city 1 weekly forecast keeps the shipped weather sequence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'weekShanghai', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weeks: Array<WeekWeather> = getWeekWeatherData(1);
      expect(weeks.length).assertEqual(7);
      expect(weekTrace(1, 'weather')).assertEqual('多云,阴,多云,阴,阴,多云,小雨,');
      expect(weekTrace(1, 'max')).assertEqual('36,32,34,36,36,36,35,');
      expect(weekTrace(1, 'min')).assertEqual('28,25,26,27,26,27,26,');
      expect(weekTrace(1, 'week')).assertEqual('星期四,星期五,星期六,星期日,星期一,星期二,星期三,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1867
     * @tc.name    WeatherCityCatalogValidation8
     * @tc.desc    city 2 weekly forecast keeps the shipped weather sequence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'weekGuangzhou', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weeks: Array<WeekWeather> = getWeekWeatherData(2);
      expect(weeks.length).assertEqual(7);
      expect(weekTrace(2, 'weather')).assertEqual('小雨,小雨,多云,阴,阴,中雨,中雨,');
      expect(weekTrace(2, 'max')).assertEqual('38,30,34,36,36,36,35,');
      expect(weekTrace(2, 'min')).assertEqual('30,22,26,27,26,27,26,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1868
     * @tc.name    WeatherCityCatalogValidation9
     * @tc.desc    city 3 weekly forecast keeps the shipped weather sequence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'weekTianjin', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weeks: Array<WeekWeather> = getWeekWeatherData(3);
      expect(weeks.length).assertEqual(7);
      expect(weekTrace(3, 'weather')).assertEqual('阴,中雨,阴,阴,多云,晴,晴,');
      expect(weekTrace(3, 'max')).assertEqual('35,32,36,38,36,36,35,');
      expect(weekTrace(3, 'min')).assertEqual('22,25,22,27,26,27,26,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1869
     * @tc.name    WeatherCityCatalogValidation10
     * @tc.desc    city 4 weekly forecast keeps the shipped weather sequence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'weekWuhan', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weeks: Array<WeekWeather> = getWeekWeatherData(4);
      expect(weeks.length).assertEqual(7);
      expect(weekTrace(4, 'weather')).assertEqual('多云,多云,多云,晴,晴,多云,晴,');
      expect(weekTrace(4, 'max')).assertEqual('39,29,30,40,39,38,39,');
      expect(weekTrace(4, 'min')).assertEqual('25,22,26,30,28,28,26,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1870
     * @tc.name    WeatherCityCatalogValidation11
     * @tc.desc    city 0 pollutant figures follow the mock air record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'airBeijing', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const air: Array<AirIndex> = getAirIndexData(0);
      expect(air.length).assertEqual(6);
      expect(airFigureTrace(0)).assertEqual('181,94,105,67,19,19,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1871
     * @tc.name    WeatherCityCatalogValidation12
     * @tc.desc    city 1 pollutant figures follow the mock air record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'airShanghai', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const air: Array<AirIndex> = getAirIndexData(1);
      expect(air.length).assertEqual(6);
      expect(airFigureTrace(1)).assertEqual('200,80,100,70,39,20,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1872
     * @tc.name    WeatherCityCatalogValidation13
     * @tc.desc    city 2 pollutant figures follow the mock air record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'airGuangzhou', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const air: Array<AirIndex> = getAirIndexData(2);
      expect(air.length).assertEqual(6);
      expect(airFigureTrace(2)).assertEqual('170,90,90,64,18,22,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1873
     * @tc.name    WeatherCityCatalogValidation14
     * @tc.desc    city 3 pollutant figures follow the mock air record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'airTianjin', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const air: Array<AirIndex> = getAirIndexData(3);
      expect(air.length).assertEqual(6);
      expect(airFigureTrace(3)).assertEqual('180,95,150,65,30,19,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1874
     * @tc.name    WeatherCityCatalogValidation15
     * @tc.desc    city 4 pollutant figures follow the mock air record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'airWuhan', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const air: Array<AirIndex> = getAirIndexData(4);
      expect(air.length).assertEqual(6);
      expect(airFigureTrace(4)).assertEqual('178,93,100,66,17,18,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1875
     * @tc.name    WeatherCityCatalogValidation16
     * @tc.desc    city 0 life index keeps the shipped levels
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'lifeBeijing', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const suits: Array<SuitData> = getLifeData(0);
      expect(suits.length).assertEqual(8);
      expect(lifeValueTrace(0)).assertEqual('42%,28°,微风,北风,短袖,宜室内,容易,强,');
      expect(lifeTitleTrace(0)).assertEqual('湿度,体感温度,风力,风向,穿衣,运动,感冒,紫外线,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1876
     * @tc.name    WeatherCityCatalogValidation17
     * @tc.desc    city 1 life index keeps the shipped levels
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'lifeShanghai', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const suits: Array<SuitData> = getLifeData(1);
      expect(suits.length).assertEqual(8);
      expect(lifeValueTrace(1)).assertEqual('45%,28°,微风,南风,短袖,宜室内,容易,弱,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1877
     * @tc.name    WeatherCityCatalogValidation18
     * @tc.desc    city 2 life index keeps the shipped levels
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'lifeGuangzhou', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const suits: Array<SuitData> = getLifeData(2);
      expect(suits.length).assertEqual(8);
      expect(lifeValueTrace(2)).assertEqual('50%,27°,大风,东南风,长袖,宜室内,容易,弱,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1878
     * @tc.name    WeatherCityCatalogValidation19
     * @tc.desc    city 3 life index keeps the shipped levels
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'lifeTianjin', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const suits: Array<SuitData> = getLifeData(3);
      expect(suits.length).assertEqual(8);
      expect(lifeValueTrace(3)).assertEqual('55%,35°,微风,南风,短袖,宜室内,容易,弱,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1879
     * @tc.name    WeatherCityCatalogValidation20
     * @tc.desc    city 4 life index keeps the shipped levels
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'lifeWuhan', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const suits: Array<SuitData> = getLifeData(4);
      expect(suits.length).assertEqual(8);
      expect(lifeValueTrace(4)).assertEqual('42%,25°,微风,西南风,短袖,宜室外,容易,弱,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1880
     * @tc.name    WeatherCityCatalogValidation21
     * @tc.desc    Beijing hourly list starts at 09:00 and runs to 08:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hoursBeijingWindow', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hours: Array<Forecast> = getHoursData(0);
      expect(hours.length).assertEqual(25);
      expect(hours[0].date).assertEqual('09:00');
      expect(hours[0].degree).assertEqual('30°');
      expect(hours[hours.length - 1].date).assertEqual('08:00');
      expect(hours[hours.length - 1].degree).assertEqual('29°');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1881
     * @tc.name    WeatherCityCatalogValidation22
     * @tc.desc    Shanghai hourly list starts at 08:00 and peaks at 30 degrees on 17:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hoursShanghaiWindow', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hours: Array<Forecast> = getHoursData(1);
      expect(hours.length).assertEqual(25);
      expect(hours[0].date).assertEqual('08:00');
      expect(hours[0].degree).assertEqual('29°');
      expect(hours[hours.length - 1].date).assertEqual('07:00');
      expect(hours[hours.length - 1].degree).assertEqual('27°');
      let peakDegree: string = '';
      let peakWind: string = '';
      for (let i = 0; i < hours.length; i++) {
        if (hours[i].date === '17:00') {
          peakDegree = hours[i].degree;
          peakWind = hours[i].win;
        }
      }
      expect(peakDegree).assertEqual('30°');
      expect(peakWind).assertEqual('西北风');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1882
     * @tc.name    WeatherCityCatalogValidation23
     * @tc.desc    Guangzhou reuses the Shanghai hourly curve and winds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hoursSouthCitiesShareCurve', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const shanghai: Array<Forecast> = getHoursData(1);
      const guangzhou: Array<Forecast> = getHoursData(2);
      expect(shanghai.length).assertEqual(guangzhou.length);
      expect(hourDegreeTrace(guangzhou)).assertEqual(hourDegreeTrace(shanghai));
      let sameWind: boolean = true;
      for (let i = 0; i < shanghai.length; i++) {
        if (shanghai[i].win !== guangzhou[i].win) {
          sameWind = false;
        }
      }
      expect(sameWind).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1883
     * @tc.name    WeatherCityCatalogValidation24
     * @tc.desc    Wuhan hourly list starts five degrees cooler and turns north at 17:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hoursWuhanCooler', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hours: Array<Forecast> = getHoursData(4);
      expect(hours.length).assertEqual(25);
      expect(hours[0].date).assertEqual('08:00');
      expect(hours[0].degree).assertEqual('25°');
      expect(hours[hours.length - 1].degree).assertEqual('26°');
      let peakDegree: string = '';
      let peakWind: string = '';
      for (let i = 0; i < hours.length; i++) {
        if (hours[i].date === '17:00') {
          peakDegree = hours[i].degree;
          peakWind = hours[i].win;
        }
      }
      expect(peakDegree).assertEqual('27°');
      expect(peakWind).assertEqual('北风');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1884
     * @tc.name    WeatherCityCatalogValidation25
     * @tc.desc    every city injects the sunset row right after 17:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hoursSunsetUniform', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let sunsets: number = 0;
      for (let city = 0; city < CITY_COUNT; city++) {
        const hours: Array<Forecast> = getHoursData(city);
        let peak: number = -1;
        let sunset: number = -1;
        let count: number = 0;
        for (let i = 0; i < hours.length; i++) {
          if (hours[i].date === '17:00') {
            peak = i;
          }
          if (hours[i].date === '17:32') {
            sunset = i;
            count++;
          }
        }
        expect(count).assertEqual(1);
        expect(sunset).assertEqual(peak + 1);
        if (count === 1 && sunset === peak + 1) {
          sunsets++;
        }
      }
      expect(sunsets).assertEqual(CITY_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1885
     * @tc.name    WeatherCityCatalogValidation26
     * @tc.desc    Shanghai carries the highest PM10 and Guangzhou the lowest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremePm10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const values: number[] = [];
      for (let city = 0; city < CITY_COUNT; city++) {
        values.push(Number(getAirIndexData(city)[0].figure));
      }
      expect(values[0]).assertEqual(181);
      expect(values[1]).assertEqual(200);
      expect(values[2]).assertEqual(170);
      expect(values[3]).assertEqual(180);
      expect(values[4]).assertEqual(178);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1886
     * @tc.name    WeatherCityCatalogValidation27
     * @tc.desc    Tianjin carries the highest PM2.5 and Shanghai the lowest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremePm25', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const values: number[] = [];
      for (let city = 0; city < CITY_COUNT; city++) {
        values.push(Number(getAirIndexData(city)[1].figure));
      }
      expect(values[3] > values[0]).assertTrue();
      expect(values[3] > values[1]).assertTrue();
      expect(values[3] > values[2]).assertTrue();
      expect(values[3] > values[4]).assertTrue();
      expect(values[1]).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1887
     * @tc.name    WeatherCityCatalogValidation28
     * @tc.desc    Tianjin carries the highest NO2 and Guangzhou the lowest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremeNo2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const values: number[] = [];
      for (let city = 0; city < CITY_COUNT; city++) {
        values.push(Number(getAirIndexData(city)[2].figure));
      }
      expect(values[3]).assertEqual(150);
      expect(values[2]).assertEqual(90);
      expect(values[3] > values[0]).assertTrue();
      expect(values[2] < values[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1888
     * @tc.name    WeatherCityCatalogValidation29
     * @tc.desc    Shanghai carries the highest SO2 and Guangzhou the lowest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremeSo2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const values: number[] = [];
      for (let city = 0; city < CITY_COUNT; city++) {
        values.push(Number(getAirIndexData(city)[3].figure));
      }
      expect(values[1]).assertEqual(70);
      expect(values[2]).assertEqual(64);
      expect(values[1] > values[0]).assertTrue();
      expect(values[1] > values[3]).assertTrue();
      expect(values[1] > values[4]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1889
     * @tc.name    WeatherCityCatalogValidation30
     * @tc.desc    Shanghai carries the highest ozone and Wuhan the lowest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremeO3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const values: number[] = [];
      for (let city = 0; city < CITY_COUNT; city++) {
        values.push(Number(getAirIndexData(city)[4].figure));
      }
      expect(values[1]).assertEqual(39);
      expect(values[4]).assertEqual(17);
      expect(values[1] > values[0]).assertTrue();
      expect(values[4] < values[0]).assertTrue();
      expect(values[4] < values[2]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1890
     * @tc.name    WeatherCityCatalogValidation31
     * @tc.desc    Guangzhou carries the highest CO and Wuhan the lowest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremeCo', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const values: number[] = [];
      for (let city = 0; city < CITY_COUNT; city++) {
        values.push(Number(getAirIndexData(city)[5].figure));
      }
      expect(values[2]).assertEqual(22);
      expect(values[4]).assertEqual(18);
      expect(values[2] > values[0]).assertTrue();
      expect(values[2] > values[3]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1891
     * @tc.name    WeatherCityCatalogValidation32
     * @tc.desc    Tianjin reports the highest humidity and Beijing the baseline
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremeHumidity', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const values: number[] = [];
      for (let city = 0; city < CITY_COUNT; city++) {
        values.push(parseInt(getLifeData(city)[0].value));
      }
      expect(values[0]).assertEqual(42);
      expect(values[1]).assertEqual(45);
      expect(values[2]).assertEqual(50);
      expect(values[3]).assertEqual(55);
      expect(values[4]).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1892
     * @tc.name    WeatherCityCatalogValidation33
     * @tc.desc    Tianjin feels five degrees hotter than its neighbour cities
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremeFeelsLike', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const values: number[] = [];
      for (let city = 0; city < CITY_COUNT; city++) {
        values.push(parseInt(getLifeData(city)[1].value));
      }
      expect(values[3]).assertEqual(35);
      expect(values[4]).assertEqual(25);
      expect(values[3] > values[0]).assertTrue();
      expect(values[3] > values[2]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1893
     * @tc.name    WeatherCityCatalogValidation34
     * @tc.desc    Guangzhou is the only city that recommends a long sleeve
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremeClothing', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let longSleeve: number = 0;
      for (let city = 0; city < CITY_COUNT; city++) {
        if (getLifeData(city)[4].value === '长袖') {
          longSleeve++;
        }
      }
      expect(longSleeve).assertEqual(1);
      expect(getLifeData(2)[4].value).assertEqual('长袖');
      expect(getLifeData(0)[4].value).assertEqual('短袖');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1894
     * @tc.name    WeatherCityCatalogValidation35
     * @tc.desc    Wuhan is the only city that recommends outdoor exercise
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremeOutdoor', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let outdoor: number = 0;
      for (let city = 0; city < CITY_COUNT; city++) {
        if (getLifeData(city)[5].value === '宜室外') {
          outdoor++;
        }
      }
      expect(outdoor).assertEqual(1);
      expect(getLifeData(4)[5].value).assertEqual('宜室外');
      expect(getLifeData(3)[5].value).assertEqual('宜室内');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1895
     * @tc.name    WeatherCityCatalogValidation36
     * @tc.desc    Beijing is the only city that reports a strong UV index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'extremeUv', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let strong: number = 0;
      for (let city = 0; city < CITY_COUNT; city++) {
        if (getLifeData(city)[7].value === '强') {
          strong++;
        }
      }
      expect(strong).assertEqual(1);
      expect(getLifeData(0)[7].value).assertEqual('强');
      expect(getLifeData(1)[7].value).assertEqual('弱');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1896
     * @tc.name    WeatherCityCatalogValidation37
     * @tc.desc    empty storage seeds the first two cities with full cards
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'pipelineEmptySeedsTwo', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      setCityList([]);
      const data: Array<CityListData> = getCityListWeatherData();
      expect(data.length).assertEqual(2);
      expect(data[0].header.temp).assertEqual('32');
      expect(data[1].header.temp).assertEqual('28');
      for (let i = 0; i < data.length; i++) {
        expect(data[i].weekData.length).assertEqual(7);
        expect(data[i].airIndex.length).assertEqual(6);
        expect(data[i].suitDate.length).assertEqual(8);
      }
      const titles: Array<string> = AppStorage.Get<Array<string>>('titleText') ?? [];
      expect(titles.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1897
     * @tc.name    WeatherCityCatalogValidation38
     * @tc.desc    three stored cities produce three cards headed by the probe names
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'pipelineThree', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      setCityList(probes(3));
      const data: Array<CityListData> = getCityListWeatherData();
      expect(data.length).assertEqual(3);
      let names: string = '';
      let temps: string = '';
      for (let i = 0; i < data.length; i++) {
        names += data[i].city + ',';
        temps += data[i].header.temp + ',';
      }
      expect(names).assertEqual('probe0,probe1,probe2,');
      expect(temps).assertEqual('32,28,26,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1898
     * @tc.name    WeatherCityCatalogValidation39
     * @tc.desc    the fourth card falls back to the Tianjin weather block
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'pipelineFour', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      setCityList(probes(4));
      const data: Array<CityListData> = getCityListWeatherData();
      expect(data.length).assertEqual(4);
      expect(data[3].city).assertEqual('probe3');
      expect(data[3].header.temp).assertEqual('32');
      expect(data[3].header.weatherType).assertEqual('中雨');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1899
     * @tc.name    WeatherCityCatalogValidation40
     * @tc.desc    five stored cities cover the whole mock city table
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'pipelineFive', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      setCityList(probes(5));
      const data: Array<CityListData> = getCityListWeatherData();
      expect(data.length).assertEqual(5);
      let temps: string = '';
      for (let i = 0; i < data.length; i++) {
        temps += data[i].header.temp + ',';
      }
      expect(temps).assertEqual('32,28,26,32,27,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1900
     * @tc.name    WeatherCityCatalogValidation41
     * @tc.desc    the sixth card wraps back to the first mock city
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'pipelineSixWraps', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      setCityList(probes(6));
      const data: Array<CityListData> = getCityListWeatherData();
      expect(data.length).assertEqual(6);
      expect(data[5].city).assertEqual('probe5');
      expect(data[5].header.temp).assertEqual(data[0].header.temp);
      expect(data[5].header.weatherType).assertEqual(data[0].header.weatherType);
      expect(data[5].hoursData.length).assertEqual(data[0].hoursData.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1901
     * @tc.name    WeatherCityCatalogValidation42
     * @tc.desc    seven stored cities reuse the first two mock blocks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'pipelineSevenWrapsTwice', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      setCityList(probes(7));
      const data: Array<CityListData> = getCityListWeatherData();
      expect(data.length).assertEqual(7);
      let temps: string = '';
      for (let i = 0; i < data.length; i++) {
        temps += data[i].header.temp + ',';
      }
      expect(temps).assertEqual('32,28,26,32,27,32,28,');
      expect(data[6].header.weatherType).assertEqual(data[1].header.weatherType);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1902
     * @tc.name    WeatherCityCatalogValidation43
     * @tc.desc    title placeholders follow the stored city count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'pipelineTitlesTrack', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      setCityList(probes(4));
      getCityListWeatherData();
      const four: Array<string> = AppStorage.Get<Array<string>>('titleText') ?? [];
      expect(four.length).assertEqual(4);
      setCityList(probes(7));
      getCityListWeatherData();
      const seven: Array<string> = AppStorage.Get<Array<string>>('titleText') ?? [];
      expect(seven.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1903
     * @tc.name    WeatherCityCatalogValidation44
     * @tc.desc    every generated card keeps a valid seven day range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'pipelineWeekIntegrity', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      setCityList(probes(3));
      const data: Array<CityListData> = getCityListWeatherData();
      let invalid: number = 0;
      for (let card = 0; card < data.length; card++) {
        const weeks: Array<WeekWeather> = data[card].weekData;
        expect(weeks.length).assertEqual(7);
        for (let i = 0; i < weeks.length; i++) {
          if (Number(weeks[i].max) < Number(weeks[i].min)) {
            invalid++;
          }
          if (!/^\d{2}\/\d{1,2}$/.test(weeks[i].date)) {
            invalid++;
          }
        }
      }
      expect(invalid).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1904
     * @tc.name    WeatherCityCatalogValidation45
     * @tc.desc    all five cities keep the same pollutant label order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'labelsAirStable', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let same: number = 0;
      for (let city = 0; city < CITY_COUNT; city++) {
        const air: Array<AirIndex> = getAirIndexData(city);
        let trace: string = '';
        for (let i = 0; i < air.length; i++) {
          trace += air[i].index + ',';
        }
        expect(trace).assertEqual('PM10,PM2.5,NO2,SO2,O2,CO,');
        if (trace === 'PM10,PM2.5,NO2,SO2,O2,CO,') {
          same++;
        }
      }
      expect(same).assertEqual(CITY_COUNT);
      expect(AIR_LABELS.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1905
     * @tc.name    WeatherCityCatalogValidation46
     * @tc.desc    all five cities keep the same life index titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'labelsLifeStable', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let same: number = 0;
      for (let city = 0; city < CITY_COUNT; city++) {
        const trace: string = lifeTitleTrace(city);
        expect(trace).assertEqual('湿度,体感温度,风力,风向,穿衣,运动,感冒,紫外线,');
        if (trace === '湿度,体感温度,风力,风向,穿衣,运动,感冒,紫外线,') {
          same++;
        }
      }
      expect(same).assertEqual(CITY_COUNT);
      expect(LIFE_TITLES.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1906
     * @tc.name    WeatherCityCatalogValidation47
     * @tc.desc    all five cities share the same weekday sequence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'labelsWeekStable', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let same: number = 0;
      for (let city = 0; city < CITY_COUNT; city++) {
        const weeks: Array<WeekWeather> = getWeekWeatherData(city);
        expect(weeks[0].week).assertEqual('星期四');
        expect(weeks[1].week).assertEqual('星期五');
        expect(weeks[6].week).assertEqual('星期三');
        if (weeks[0].week === '星期四' && weeks[6].week === '星期三') {
          same++;
        }
      }
      expect(same).assertEqual(CITY_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1907
     * @tc.name    WeatherCityCatalogValidation48
     * @tc.desc    every city formats its week dates as MM/DD
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'labelsDateFormatStable', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let valid: number = 0;
      for (let city = 0; city < CITY_COUNT; city++) {
        const weeks: Array<WeekWeather> = getWeekWeatherData(city);
        for (let i = 0; i < weeks.length; i++) {
          if (/^\d{2}\/\d{1,2}$/.test(weeks[i].date) && weeks[i].date.indexOf('06/') === 0) {
            valid++;
          }
        }
      }
      expect(valid).assertEqual(CITY_COUNT * 7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })
  })
}
