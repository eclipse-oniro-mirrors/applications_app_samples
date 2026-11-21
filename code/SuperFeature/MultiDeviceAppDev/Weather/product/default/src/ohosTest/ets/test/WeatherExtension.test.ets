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
import {
  AirData,
  AirIndex,
  City,
  CityListData,
  Forecast,
  getAirIndexData,
  getBg,
  getCityList,
  getHeaderDate,
  getHoursData,
  getLifeData,
  getMenuInfo,
  getSideBg,
  getUpdateTimes,
  getWeekWeatherData,
  HeaderData,
  Style,
  SuitData,
  WeekWeather
} from '@ohos/common';
import {
  WEATHER_CITY_COUNT,
  WeatherCity,
  WeatherDataSourceState,
  WeatherModel
} from './Shared/WeatherModel';
import {
  averageOf,
  rangeOf,
  resolveBreakpoint,
  safeDivide,
  WIDTH_LG,
  WIDTH_MD,
  WIDTH_SM,
  WIDTH_XS
} from './Shared/SharedDriver';

const DATASET = 'WeatherExtensionTest_';

export default function weatherExtensionSuite() {
  describe('WeatherFeatureExtension', () => {
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1313
     * @tc.name    WeatherExtension1313
     * @tc.desc    Breakpoint resolver maps negative width to unknown
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'resolveBreakpoint_001', 0, () => {
      expect(resolveBreakpoint(-1)).assertEqual('unknown');
      expect(resolveBreakpoint(-1000)).assertEqual('unknown');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1314
     * @tc.name    WeatherExtension1314
     * @tc.desc    Breakpoint resolver covers the xs to sm transition
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'resolveBreakpoint_002', 0, () => {
      expect(resolveBreakpoint(0)).assertEqual('xs');
      expect(resolveBreakpoint(319)).assertEqual('xs');
      expect(resolveBreakpoint(320)).assertEqual('sm');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1315
     * @tc.name    WeatherExtension1315
     * @tc.desc    Breakpoint resolver covers the sm to md transition
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'resolveBreakpoint_003', 0, () => {
      expect(resolveBreakpoint(599)).assertEqual('sm');
      expect(resolveBreakpoint(600)).assertEqual('md');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1316
     * @tc.name    WeatherExtension1316
     * @tc.desc    Breakpoint resolver covers the md to lg transition and above
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'resolveBreakpoint_004', 0, () => {
      expect(resolveBreakpoint(839)).assertEqual('md');
      expect(resolveBreakpoint(840)).assertEqual('lg');
      expect(resolveBreakpoint(9999)).assertEqual('lg');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1317
     * @tc.name    WeatherExtension1317
     * @tc.desc    Sample range handles empty, single and mixed samples
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'rangeOf_001', 0, () => {
      expect(rangeOf([])).assertEqual(0);
      expect(rangeOf([5])).assertEqual(0);
      expect(rangeOf([3, 1, 4, 1, 5])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1318
     * @tc.name    WeatherExtension1318
     * @tc.desc    Sample average handles empty and uneven sample sets
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'averageOf_001', 0, () => {
      expect(averageOf([])).assertEqual(0);
      expect(averageOf([1, 2])).assertEqual(1.5);
      expect(averageOf([2, 4, 6])).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1319
     * @tc.name    WeatherExtension1319
     * @tc.desc    Safe division guards a zero divisor and keeps the sign
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'safeDivide_001', 0, () => {
      expect(safeDivide(10, 0)).assertEqual(0);
      expect(safeDivide(0, 5)).assertEqual(0);
      expect(safeDivide(-6, 3)).assertEqual(-2);
      expect(safeDivide(1, 4)).assertEqual(0.25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1320
     * @tc.name    WeatherExtension1320
     * @tc.desc    Shared window width probes increase strictly from xs to lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'widthProbes_001', 0, () => {
      expect(WIDTH_XS < WIDTH_SM).assertTrue();
      expect(WIDTH_SM < WIDTH_MD).assertTrue();
      expect(WIDTH_MD < WIDTH_LG).assertTrue();
      expect(WIDTH_MD >= 600).assertTrue();
      expect(WIDTH_LG >= 840).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1321
     * @tc.name    WeatherExtension1321
     * @tc.desc    Reload notification only bumps the reload counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyReload_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyReload();
      const state: WeatherDataSourceState = model.getState();
      expect(state.reloads).assertEqual(1);
      expect(state.adds).assertEqual(0);
      expect(state.changes).assertEqual(0);
      expect(state.deletes).assertEqual(0);
      expect(state.moves).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1322
     * @tc.name    WeatherExtension1322
     * @tc.desc    Add notification only bumps the add counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyAdd_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyAdd();
      const state: WeatherDataSourceState = model.getState();
      expect(state.adds).assertEqual(1);
      expect(state.reloads).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1323
     * @tc.name    WeatherExtension1323
     * @tc.desc    Change notification only bumps the change counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyChange_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyChange();
      const state: WeatherDataSourceState = model.getState();
      expect(state.changes).assertEqual(1);
      expect(state.adds).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1324
     * @tc.name    WeatherExtension1324
     * @tc.desc    Delete notification only bumps the delete counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyDelete_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyDelete();
      const state: WeatherDataSourceState = model.getState();
      expect(state.deletes).assertEqual(1);
      expect(state.changes).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1325
     * @tc.name    WeatherExtension1325
     * @tc.desc    Move notification only bumps the move counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyMove_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyMove();
      const state: WeatherDataSourceState = model.getState();
      expect(state.moves).assertEqual(1);
      expect(state.deletes).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1326
     * @tc.name    WeatherExtension1326
     * @tc.desc    Counters accumulate independently across mixed notifications
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyCounters_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyReload();
      model.notifyReload();
      model.notifyAdd();
      model.notifyChange();
      model.notifyDelete();
      model.notifyMove();
      const state: WeatherDataSourceState = model.getState();
      expect(state.reloads).assertEqual(2);
      expect(state.adds).assertEqual(1);
      expect(state.changes).assertEqual(1);
      expect(state.deletes).assertEqual(1);
      expect(state.moves).assertEqual(1);
      expect(state.total).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1327
     * @tc.name    WeatherExtension1327
     * @tc.desc    Seeded city names are unique and the count is five
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hasUniqueNames_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.hasUniqueNames()).assertTrue();
      expect(model.getCityCount()).assertEqual(WEATHER_CITY_COUNT);
      const cities: WeatherCity[] = model.getCities();
      const names: string[] = [];
      cities.forEach((city: WeatherCity) => {
        expect(names.indexOf(city.name)).assertEqual(-1);
        names.push(city.name);
      });
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1328
     * @tc.name    WeatherExtension1328
     * @tc.desc    Forecast keeps every constructor argument
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'Forecast_001', 0, () => {
      const icon: Resource = $r('app.media.icon');
      const forecast: Forecast = new Forecast('25°', '12:00', 'sunny', icon, 'east', '3');
      expect(forecast.degree).assertEqual('25°');
      expect(forecast.date).assertEqual('12:00');
      expect(forecast.desc).assertEqual('sunny');
      expect((forecast.icon as Resource).id).assertEqual(icon.id);
      expect(forecast.win).assertEqual('east');
      expect(forecast.winSpeed).assertEqual('3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1329
     * @tc.name    WeatherExtension1329
     * @tc.desc    Week weather keeps date, week and range fields
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'WeekWeather_001', 0, () => {
      const week: WeekWeather = new WeekWeather('01/01', 'monday', 'sunny', 'sunny', 'excellent', '30', '18');
      expect(week.date).assertEqual('01/01');
      expect(week.week).assertEqual('monday');
      expect(week.weather).assertEqual('sunny');
      expect(week.airLevel).assertEqual('excellent');
      expect(week.max).assertEqual('30');
      expect(week.min).assertEqual('18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1330
     * @tc.name    WeatherExtension1330
     * @tc.desc    Air index keeps its label and numeric figure
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'AirIndex_001', 0, () => {
      const index: AirIndex = new AirIndex('PM2.5', 42);
      expect(index.index).assertEqual('PM2.5');
      expect(index.figure).assertEqual(42);
      expect(index.figure > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1331
     * @tc.name    WeatherExtension1331
     * @tc.desc    Suit data keeps icon, description and value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'SuitData_001', 0, () => {
      const icon: Resource = $r('app.media.icon');
      const suit: SuitData = new SuitData(icon, 'sport', 'good');
      expect((suit.src as Resource).id).assertEqual(icon.id);
      expect(suit.desc).assertEqual('sport');
      expect(suit.value).assertEqual('good');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1332
     * @tc.name    WeatherExtension1332
     * @tc.desc    Air data keeps quality text and description
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'AirData_001', 0, () => {
      const air: AirData = new AirData('excellent', 'clean air');
      expect(air.airQuality).assertEqual('excellent');
      expect(air.airDesc).assertEqual('clean air');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1333
     * @tc.name    WeatherExtension1333
     * @tc.desc    Header data composes the air payload and keeps the temperature range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'HeaderData_001', 0, () => {
      const air: AirData = new AirData('good', 'moderate');
      const header: HeaderData = new HeaderData('beijing', '26', 'sunny', '30', '18', $r('app.media.icon'), air, 'open window');
      expect(header.city).assertEqual('beijing');
      expect(header.temp).assertEqual('26');
      expect(header.weatherType).assertEqual('sunny');
      expect(header.max).assertEqual('30');
      expect(header.min).assertEqual('18');
      expect(header.airData === air).assertTrue();
      expect(header.airTips).assertEqual('open window');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1334
     * @tc.name    WeatherExtension1334
     * @tc.desc    City entry keeps name, temperature and weather text
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'City_001', 0, () => {
      const city: City = new City('hangzhou', '28', 'cloudy');
      expect(city.name).assertEqual('hangzhou');
      expect(city.temp).assertEqual('28');
      expect(city.weather).assertEqual('cloudy');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1335
     * @tc.name    WeatherExtension1335
     * @tc.desc    City list data keeps every nested collection reference
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'CityListData_001', 0, () => {
      const air: AirData = new AirData('good', 'moderate');
      const header: HeaderData = new HeaderData('beijing', '26', 'sunny', '30', '18', $r('app.media.icon'), air, 'tips');
      const hours: Forecast[] = [new Forecast('25°', '12:00', 'sunny', $r('app.media.icon'), 'east', '3')];
      const weeks: WeekWeather[] = [new WeekWeather('01/01', 'monday', 'sunny', 'sunny', 'good', '30', '18')];
      const indexes: AirIndex[] = [new AirIndex('PM10', 20)];
      const suits: SuitData[] = [new SuitData($r('app.media.icon'), 'sport', 'good')];
      const data: CityListData = new CityListData('beijing', header, hours, weeks, air, indexes, suits);
      expect(data.city).assertEqual('beijing');
      expect(data.header === header).assertTrue();
      expect(data.hoursData === hours).assertTrue();
      expect(data.weekData === weeks).assertTrue();
      expect(data.airData === air).assertTrue();
      expect(data.airIndex === indexes).assertTrue();
      expect(data.suitDate === suits).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1336
     * @tc.name    WeatherExtension1336
     * @tc.desc    Card and list geometry constants keep their published values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'Style_001', 0, () => {
      expect(Style.CARD_HEIGHT).assertEqual(192);
      expect(Style.WEATHER_ITEM_WIDTH).assertEqual(80);
      expect(Style.TIME_LIST_HEIGHT).assertEqual(48);
      expect(Style.TIME_LIST_MARGIN).assertEqual(22);
      expect(Style.CITY_TEXT_RADIUS).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1337
     * @tc.name    WeatherExtension1337
     * @tc.desc    Normal spacing constants stay aligned with each other
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'Style_002', 0, () => {
      expect(Style.NORMAL_PADDING).assertEqual(Style.NORMAL_MARGIN);
      expect(Style.NORMAL_SPACE).assertEqual(Style.GRID_GUTTER);
      expect(Style.NORMAL_RADIUS).assertEqual(16);
      expect(Style.ADD_CITY_BOTTOM < Style.ADD_CITY_BOTTOM_LG).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1338
     * @tc.name    WeatherExtension1338
     * @tc.desc    Card background keeps its translucent alpha prefix
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'Style_003', 0, () => {
      expect(Style.CARD_BACKGROUND_COLOR).assertEqual('#24FFFFFF');
      expect(Style.CARD_BACKGROUND_COLOR.length).assertEqual(9);
      expect(Style.DIALOG_PADDING_OUT > Style.DIALOG_PADDING).assertTrue();
      expect(Style.BIG_FONT_WEIGHT).assertEqual(300);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1339
     * @tc.name    WeatherExtension1339
     * @tc.desc    Temperature check accepts the lower boundary
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'tempLowerBound_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(-50)).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1340
     * @tc.name    WeatherExtension1340
     * @tc.desc    Temperature check accepts the upper boundary
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'tempUpperBound_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(60)).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1341
     * @tc.name    WeatherExtension1341
     * @tc.desc    Temperature check rejects values one step outside the range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'tempOutside_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(-51)).assertFalse();
      expect(model.isTempValid(61)).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1342
     * @tc.name    WeatherExtension1342
     * @tc.desc    Seeded cities keep their published values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'citySeedValues_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const beijing: WeatherCity = model.getCity('beijing') as WeatherCity;
      const shanghai: WeatherCity = model.getCity('shanghai') as WeatherCity;
      const guangzhou: WeatherCity = model.getCity('guangzhou') as WeatherCity;
      const shenzhen: WeatherCity = model.getCity('shenzhen') as WeatherCity;
      const hangzhou: WeatherCity = model.getCity('hangzhou') as WeatherCity;
      expect(beijing.temp).assertEqual(26);
      expect(shanghai.humidity).assertEqual(68);
      expect(guangzhou.aqi).assertEqual(55);
      expect(shenzhen.temp).assertEqual(32);
      expect(hangzhou.humidity).assertEqual(62);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1343
     * @tc.name    WeatherExtension1343
     * @tc.desc    Seeded city names are lower case ASCII words
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'cityNameFormat_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      for (let i = 0; i < model.getCityCount(); i++) {
        const name: string = model.getCities()[i].name;
        expect(name.length > 0).assertTrue();
        expect(name === name.toLowerCase()).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1344
     * @tc.name    WeatherExtension1344
     * @tc.desc    Seeded cities carry pairwise distinct temperatures
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'cityTempUnique_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const temps: Set<number> = new Set<number>();
      for (let i = 0; i < model.getCityCount(); i++) {
        temps.add(model.getCities()[i].temp);
      }
      expect(temps.size).assertEqual(WEATHER_CITY_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1345
     * @tc.name    WeatherExtension1345
     * @tc.desc    Hottest seeded city resolves to index two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hottestIndex_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.hottestIndex()).assertEqual(2);
      expect(model.getCities()[model.hottestIndex()].name).assertEqual('guangzhou');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1346
     * @tc.name    WeatherExtension1346
     * @tc.desc    Coldest seeded city resolves to index zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'coldestIndex_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.coldestIndex()).assertEqual(0);
      expect(model.getCities()[model.coldestIndex()].name).assertEqual('beijing');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1347
     * @tc.name    WeatherExtension1347
     * @tc.desc    Average temperature equals the exact mean of the seeds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'averageTemp_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.averageTemp()).assertEqual(29.6);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1348
     * @tc.name    WeatherExtension1348
     * @tc.desc    Average temperature lies between the coldest and hottest seeds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'tempOrdering_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const hot: number = model.getCities()[model.hottestIndex()].temp;
      const cold: number = model.getCities()[model.coldestIndex()].temp;
      expect(model.averageTemp() >= cold).assertTrue();
      expect(model.averageTemp() <= hot).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1349
     * @tc.name    WeatherExtension1349
     * @tc.desc    Every seeded humidity is a valid percentage
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'humidityRange_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      for (let i = 0; i < model.getCityCount(); i++) {
        expect(model.isHumidityValid(model.getCities()[i].humidity)).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1350
     * @tc.name    WeatherExtension1350
     * @tc.desc    Every seeded air quality index is non negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'aqiRange_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      for (let i = 0; i < model.getCityCount(); i++) {
        expect(model.getCities()[i].aqi >= 0).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1351
     * @tc.name    WeatherExtension1351
     * @tc.desc    City lookup is exact and returns the seeded object
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getCityExact_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getCity('beijing') === model.getCities()[0]).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1352
     * @tc.name    WeatherExtension1352
     * @tc.desc    City lookup rejects padded and upper case names
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getCityPadded_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getCity(' beijing') === undefined).assertTrue();
      expect(model.getCity('Beijing') === undefined).assertTrue();
      expect(model.getCity('BEIJING') === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1353
     * @tc.name    WeatherExtension1353
     * @tc.desc    Data accessor returns the same object as the city list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getDataIdentity_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const city: WeatherCity | undefined = model.getData(3);
      expect(city !== undefined).assertTrue();
      expect(city === model.getCities()[3]).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1354
     * @tc.name    WeatherExtension1354
     * @tc.desc    Fractional index does not resolve to a city
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getDataFraction_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getData(1.5) === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1355
     * @tc.name    WeatherExtension1355
     * @tc.desc    Mutating a resolved city changes the aggregate temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'citiesAlias_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[0].temp = 100;
      expect(model.hottestIndex()).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1356
     * @tc.name    WeatherExtension1356
     * @tc.desc    Appending a city raises count and hottest index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'cityAppend_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities().push({ name: 'chengdu', temp: 40, humidity: 50, aqi: 30 });
      expect(model.getCityCount()).assertEqual(WEATHER_CITY_COUNT + 1);
      expect(model.hottestIndex()).assertEqual(WEATHER_CITY_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1357
     * @tc.name    WeatherExtension1357
     * @tc.desc    Duplicating a city name breaks name uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'namesMutation_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[1].name = 'beijing';
      expect(model.hasUniqueNames()).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1358
     * @tc.name    WeatherExtension1358
     * @tc.desc    State accessor returns the same live object
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'stateIdentity_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getState() === model.getState()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1359
     * @tc.name    WeatherExtension1359
     * @tc.desc    Notification counters stay with their own model
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyIsolation_001', 0, () => {
      const first: WeatherModel = new WeatherModel();
      const second: WeatherModel = new WeatherModel();
      first.notifyReload();
      first.notifyAdd();
      expect(second.getState().reloads).assertEqual(0);
      expect(second.getState().adds).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1360
     * @tc.name    WeatherExtension1360
     * @tc.desc    Data source total equals the city count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalCount_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.totalCount()).assertEqual(WEATHER_CITY_COUNT);
      expect(model.totalCount()).assertEqual(model.getCities().length);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1361
     * @tc.name    WeatherExtension1361
     * @tc.desc    Suit data keeps the exact resource instance
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'suitResource_001', 0, () => {
      const icon: Resource = $r('app.media.icon');
      const suit: SuitData = new SuitData(icon, 'dressing', 'comfortable');
      expect(suit.src === icon).assertTrue();
      expect(suit.value).assertEqual('comfortable');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1362
     * @tc.name    WeatherExtension1362
     * @tc.desc    City list data keeps the exact nested array instances
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'cityListArrays_001', 0, () => {
      const air: AirData = new AirData('good', 'clean air');
      const header: HeaderData = new HeaderData('beijing', '26', 'sunny', '30', '18', 'icon', air, 'tip');
      const hours: Forecast[] = [new Forecast('26', '12:00', 'sunny', 'icon', 'east', '3')];
      const weeks: WeekWeather[] = [new WeekWeather('01/01', 'mon', 'sunny', 'sunny', 'good', '30', '18')];
      const indexes: AirIndex[] = [new AirIndex('PM10', 20)];
      const suits: SuitData[] = [new SuitData($r('app.media.icon'), 'd', 'v')];
      const data: CityListData = new CityListData('beijing', header, hours, weeks, air, indexes, suits);
      expect(data.hoursData === hours).assertTrue();
      expect(data.weekData === weeks).assertTrue();
      expect(data.airIndex === indexes).assertTrue();
      expect(data.suitDate === suits).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1363
     * @tc.name    WeatherExtension1363
     * @tc.desc    Header data keeps the exact air payload instance
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'headerAir_001', 0, () => {
      const air: AirData = new AirData('excellent', 'very clean');
      const header: HeaderData = new HeaderData('hangzhou', '28', 'cloudy', '29', '20', 'icon', air, 'tip');
      expect(header.airData === air).assertTrue();
      expect(header.airData.airQuality).assertEqual('excellent');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1364
     * @tc.name    WeatherExtension1364
     * @tc.desc    Forecast keeps a plain string icon
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'forecastUnion_001', 0, () => {
      const forecast: Forecast = new Forecast('25', '09:00', 'rain', 'rain.png', 'west', '5');
      expect(forecast.icon).assertEqual('rain.png');
      expect(forecast.winSpeed).assertEqual('5');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1365
     * @tc.name    WeatherExtension1365
     * @tc.desc    Air index keeps a zero figure
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'airIndexZero_001', 0, () => {
      const index: AirIndex = new AirIndex('PM25', 0);
      expect(index.figure).assertEqual(0);
      expect(index.index).assertEqual('PM25');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1366
     * @tc.name    WeatherExtension1366
     * @tc.desc    City keeps an empty name without validation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'cityEmpty_001', 0, () => {
      const city: City = new City('', '0', 'sunny');
      expect(city.name).assertEqual('');
      expect(city.weather).assertEqual('sunny');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1367
     * @tc.name    WeatherExtension1367
     * @tc.desc    Week weather keeps inverted range strings unchanged
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'weekRange_001', 0, () => {
      const week: WeekWeather = new WeekWeather('01/01', 'mon', 'sunny', 'sunny', 'good', '1', '99');
      expect(week.max).assertEqual('1');
      expect(week.min).assertEqual('99');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1368
     * @tc.name    WeatherExtension1368
     * @tc.desc    City list data keeps empty nested collections
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listEmpty_001', 0, () => {
      const air: AirData = new AirData('good', 'clean');
      const header: HeaderData = new HeaderData('beijing', '26', 'sunny', '30', '18', 'icon', air, 'tip');
      const hours: Forecast[] = [];
      const weeks: WeekWeather[] = [];
      const indexes: AirIndex[] = [];
      const suits: SuitData[] = [];
      const data: CityListData = new CityListData('beijing', header, hours, weeks, air, indexes, suits);
      expect(data.hoursData.length).assertEqual(0);
      expect(data.hoursData === hours).assertTrue();
      expect(data.weekData === weeks).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1369
     * @tc.name    WeatherExtension1369
     * @tc.desc    First seeded city exposes twenty five hourly slots
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hoursLength_001', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours.length).assertEqual(25);
      expect(hours[0].date).assertEqual('09:00');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1370
     * @tc.name    WeatherExtension1370
     * @tc.desc    First seeded city inserts the sunset slot right after five pm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hoursSunsetIndex_001', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[8].date).assertEqual('17:00');
      expect(hours[9].date).assertEqual('17:32');
      expect(hours[10].date).assertEqual('18:00');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1371
     * @tc.name    WeatherExtension1371
     * @tc.desc    Second seeded city inserts the sunset slot at index ten
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hoursSunsetSecond_001', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[9].date).assertEqual('17:00');
      expect(hours[10].date).assertEqual('17:32');
      expect(hours[11].date).assertEqual('18:00');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1372
     * @tc.name    WeatherExtension1372
     * @tc.desc    Fifth seeded city wraps the hourly cycle back to seven in the morning
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hoursWrap_001', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[0].date).assertEqual('08:00');
      expect(hours[24].date).assertEqual('07:00');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1373
     * @tc.name    WeatherExtension1373
     * @tc.desc    First seeded city spans seven days from June twenty third
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'weekSpan_001', 0, () => {
      const weeks: WeekWeather[] = getWeekWeatherData(0);
      expect(weeks.length).assertEqual(7);
      expect(weeks[0].date).assertEqual('06/23');
      expect(weeks[6].date).assertEqual('06/29');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1374
     * @tc.name    WeatherExtension1374
     * @tc.desc    Second seeded city keeps the published high and low
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'weekRangeSecond_001', 0, () => {
      const weeks: WeekWeather[] = getWeekWeatherData(1);
      expect(weeks[1].max).assertEqual('32');
      expect(weeks[1].min).assertEqual('25');
      expect((weeks[1].icon as Resource).id > 0).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1375
     * @tc.name    WeatherExtension1375
     * @tc.desc    Third seeded city keeps its cooler high and low
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'weekRangeThird_001', 0, () => {
      const weeks: WeekWeather[] = getWeekWeatherData(2);
      expect(weeks[1].max).assertEqual('30');
      expect(weeks[1].min).assertEqual('22');
      expect(weeks[1].airLevel.length > 0).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1376
     * @tc.name    WeatherExtension1376
     * @tc.desc    First seeded city reports six exact air figures
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'airFirstFigures_001', 0, () => {
      const air: AirIndex[] = getAirIndexData(0);
      expect(air[0].figure).assertEqual('181');
      expect(air[1].figure).assertEqual('94');
      expect(air[2].figure).assertEqual('105');
      expect(air[3].figure).assertEqual('67');
      expect(air[4].figure).assertEqual('19');
      expect(air[5].figure).assertEqual('19');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1377
     * @tc.name    WeatherExtension1377
     * @tc.desc    Second seeded city leads with the largest particle figure
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'airSecondFigures_001', 0, () => {
      const air: AirIndex[] = getAirIndexData(1);
      expect(air[0].figure).assertEqual('200');
      expect(air[4].figure).assertEqual('39');
      expect(air[5].figure).assertEqual('20');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1378
     * @tc.name    WeatherExtension1378
     * @tc.desc    Third seeded city keeps its own gas figures
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'airThirdFigures_001', 0, () => {
      const air: AirIndex[] = getAirIndexData(2);
      expect(air[2].figure).assertEqual('90');
      expect(air[3].figure).assertEqual('64');
      expect(air[5].figure).assertEqual('22');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1379
     * @tc.name    WeatherExtension1379
     * @tc.desc    Fourth seeded city reports the highest nitrogen figure
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'airFourthFigures_001', 0, () => {
      const air: AirIndex[] = getAirIndexData(3);
      expect(air[2].figure).assertEqual('150');
      expect(air[0].figure).assertEqual('180');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1380
     * @tc.name    WeatherExtension1380
     * @tc.desc    Fifth seeded city reports its own particle figure
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'airFifthFigures_001', 0, () => {
      const air: AirIndex[] = getAirIndexData(4);
      expect(air[0].figure).assertEqual('178');
      expect(air[1].figure).assertEqual('93');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1381
     * @tc.name    WeatherExtension1381
     * @tc.desc    First seeded city exposes eight life indices
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lifeLength_001', 0, () => {
      const suits: SuitData[] = getLifeData(0);
      expect(suits.length).assertEqual(8);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1382
     * @tc.name    WeatherExtension1382
     * @tc.desc    Life index icons are pairwise distinct resources
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lifeIcons_001', 0, () => {
      const suits: SuitData[] = getLifeData(0);
      const ids: Set<number> = new Set<number>();
      for (let i = 0; i < suits.length; i++) {
        ids.add(suits[i].src.id);
      }
      expect(ids.size).assertEqual(suits.length);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1383
     * @tc.name    WeatherExtension1383
     * @tc.desc    Fifth seeded city also exposes eight life indices
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lifeFifth_001', 0, () => {
      const suits: SuitData[] = getLifeData(4);
      expect(suits.length).assertEqual(8);
      expect(suits[0].src.id > 0).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1384
     * @tc.name    WeatherExtension1384
     * @tc.desc    First seeded header keeps its temperature and range strings
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'headerNumbers_001', 0, () => {
      const header: HeaderData = getHeaderDate(0);
      expect(header.temp).assertEqual('32');
      expect(header.max).assertEqual('35');
      expect(header.min).assertEqual('25');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1385
     * @tc.name    WeatherExtension1385
     * @tc.desc    First seeded header composes the live air quality payload
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'headerAirQuality_001', 0, () => {
      const header: HeaderData = getHeaderDate(0);
      expect(header.airData.airQuality).assertEqual('28');
      expect(header.airData.airDesc.length > 0).assertTrue();
      expect(header.airTips.length > 0).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1386
     * @tc.name    WeatherExtension1386
     * @tc.desc    Third seeded header keeps its cooler range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'headerThird_001', 0, () => {
      const header: HeaderData = getHeaderDate(2);
      expect(header.temp).assertEqual('26');
      expect(header.max).assertEqual('30');
      expect(header.min).assertEqual('22');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1387
     * @tc.name    WeatherExtension1387
     * @tc.desc    A supplied city overrides only the header name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'headerOverride_001', 0, () => {
      const city: City = new City('chengdu', '30', 'sunny');
      const header: HeaderData = getHeaderDate(0, city);
      expect(header.city).assertEqual('chengdu');
      expect(header.temp).assertEqual('32');
      expect(header.max).assertEqual('35');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1388
     * @tc.name    WeatherExtension1388
     * @tc.desc    An empty override name is kept without falling back
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'headerEmptyName_001', 0, () => {
      const city: City = new City('', '30', 'sunny');
      const header: HeaderData = getHeaderDate(1, city);
      expect(header.city).assertEqual('');
      expect(header.temp).assertEqual('28');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1389
     * @tc.name    WeatherExtension1389
     * @tc.desc    Every rain label maps to the same page background
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'bgRain_001', 0, () => {
      const light: Resource = getBg('小雨');
      const heavy: Resource = getBg('中雨');
      expect(light.id).assertEqual(heavy.id);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1390
     * @tc.name    WeatherExtension1390
     * @tc.desc    Side and page backgrounds differ for the same weather
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sideVsBg_001', 0, () => {
      const side: Resource = getSideBg('晴');
      const page: Resource = getBg('晴');
      expect(side.id === page.id).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1391
     * @tc.name    WeatherExtension1391
     * @tc.desc    City list accessor rebuilds a fresh array on each call
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'cityListFresh_001', 0, () => {
      const first: City[] = getCityList();
      const second: City[] = getCityList();
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(second.length);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1392
     * @tc.name    WeatherExtension1392
     * @tc.desc    Normal padding and margin keep the same published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'stylePadding_001', 0, () => {
      expect(Style.NORMAL_PADDING).assertEqual(14);
      expect(Style.NORMAL_MARGIN).assertEqual(14);
      expect(Style.NORMAL_PADDING).assertEqual(Style.NORMAL_MARGIN);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1393
     * @tc.name    WeatherExtension1393
     * @tc.desc    Dialog and time list geometry keep their published values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleDialog_001', 0, () => {
      expect(Style.DIALOG_PADDING).assertEqual(24);
      expect(Style.DIALOG_PADDING_OUT).assertEqual(42);
      expect(Style.TIME_LIST_MARGIN).assertEqual(22);
      expect(Style.BIG_FONT_WEIGHT).assertEqual(300);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1394
     * @tc.name    WeatherExtension1394
     * @tc.desc    Model data accessor rejects both boundaries of the city list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'modelDataBounds_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getData(-1) === undefined).assertTrue();
      expect(model.getData(WEATHER_CITY_COUNT) === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1395
     * @tc.name    WeatherExtension1395
     * @tc.desc    Equal temperatures resolve the hottest and coldest to the first city
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'modelEqualTemps_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      for (let i = 0; i < model.getCityCount(); i++) {
        model.getCities()[i].temp = 20;
      }
      expect(model.hottestIndex()).assertEqual(0);
      expect(model.coldestIndex()).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1396
     * @tc.name    WeatherExtension1396
     * @tc.desc    Air quality up to fifty is excellent
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'aqiExcellentBoundary_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(0)).assertEqual('excellent');
      expect(model.aqiLevel(50)).assertEqual('excellent');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1397
     * @tc.name    WeatherExtension1397
     * @tc.desc    Air quality from fifty one to one hundred is good
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'aqiGoodBoundary_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(51)).assertEqual('good');
      expect(model.aqiLevel(100)).assertEqual('good');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1398
     * @tc.name    WeatherExtension1398
     * @tc.desc    Air quality from one hundred one to one hundred fifty is light
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'aqiLightBoundary_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(101)).assertEqual('light');
      expect(model.aqiLevel(150)).assertEqual('light');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1399
     * @tc.name    WeatherExtension1399
     * @tc.desc    Air quality above one hundred fifty is moderate
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'aqiModerateBoundary_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(151)).assertEqual('moderate');
      expect(model.aqiLevel(500)).assertEqual('moderate');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1400
     * @tc.name    WeatherExtension1400
     * @tc.desc    A negative air quality index stays in the excellent band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'aqiNegative_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(-1)).assertEqual('excellent');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1401
     * @tc.name    WeatherExtension1401
     * @tc.desc    Humidity accepts zero and rejects one below it
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'humidityLower_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(0)).assertTrue();
      expect(model.isHumidityValid(-1)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1402
     * @tc.name    WeatherExtension1402
     * @tc.desc    Humidity accepts one hundred and rejects one above it
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'humidityUpper_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(100)).assertTrue();
      expect(model.isHumidityValid(101)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1403
     * @tc.name    WeatherExtension1403
     * @tc.desc    Menu exposes two entries with published urls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'menuEntries_001', 0, () => {
      const menu = getMenuInfo();
      expect(menu.length).assertEqual(2);
      expect(menu[0].url).assertEqual('pages/CityList');
      expect(menu[1].url).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1404
     * @tc.name    WeatherExtension1404
     * @tc.desc    Update time list exposes seven slots starting at one hour
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'updateTimesCount_001', 0, () => {
      const times: string[] = getUpdateTimes();
      expect(times.length).assertEqual(7);
      expect(times[0]).assertEqual('1\u5c0f\u65f6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1405
     * @tc.name    WeatherExtension1405
     * @tc.desc    The third seeded city keeps its published temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'cityTempThird_001', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[2].temp).assertEqual('35');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1406
     * @tc.name    WeatherExtension1406
     * @tc.desc    The last seeded city keeps its published temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'cityTempLast_001', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[21].temp).assertEqual('20');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1407
     * @tc.name    WeatherExtension1407
     * @tc.desc    Twelve seeded cities share the twenty five degree temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'cityTempTwentyFive_001', 0, () => {
      const cities: City[] = getCityList();
      let count: number = 0;
      cities.forEach((city: City) => {
        if (city.temp === '25') {
          count++;
        }
      });
      expect(count).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1408
     * @tc.name    WeatherExtension1408
     * @tc.desc    The seeded city list holds twenty two entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'cityListCount_001', 0, () => {
      expect(getCityList().length).assertEqual(22);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1409
     * @tc.name    WeatherExtension1409
     * @tc.desc    Air index labels keep the published six entry order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'airLabels_001', 0, () => {
      const air: AirIndex[] = getAirIndexData(0);
      expect(air[0].index).assertEqual('PM10');
      expect(air[1].index).assertEqual('PM2.5');
      expect(air[2].index).assertEqual('NO2');
      expect(air[3].index).assertEqual('SO2');
      expect(air[4].index).assertEqual('O2');
      expect(air[5].index).assertEqual('CO');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1410
     * @tc.name    WeatherExtension1410
     * @tc.desc    The second seeded city leads with two hundred particle figures
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'airSecondCity_001', 0, () => {
      const air: AirIndex[] = getAirIndexData(1);
      expect(air[0].figure).assertEqual('200');
      expect(air[1].figure).assertEqual('80');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1411
     * @tc.name    WeatherExtension1411
     * @tc.desc    The third seeded city keeps its own gas and carbon figures
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'airThirdCity_001', 0, () => {
      const air: AirIndex[] = getAirIndexData(2);
      expect(air[2].figure).assertEqual('90');
      expect(air[5].figure).assertEqual('22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1412
     * @tc.name    WeatherExtension1412
     * @tc.desc    The second seeded city exposes eight life indices starting at 45 percent
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lifeSecondCity_001', 0, () => {
      const life: SuitData[] = getLifeData(1);
      expect(life.length).assertEqual(8);
      expect(life[0].value).assertEqual('45%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1413
     * @tc.name    WeatherExtension1413
     * @tc.desc    The third seeded city exposes eight life indices starting at 50 percent
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lifeThirdCity_001', 0, () => {
      const life: SuitData[] = getLifeData(2);
      expect(life.length).assertEqual(8);
      expect(life[0].value).assertEqual('50%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1414
     * @tc.name    WeatherExtension1414
     * @tc.desc    The third seeded city starts its hourly cycle at eight
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hoursThirdStart_001', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours.length).assertEqual(25);
      expect(hours[0].date).assertEqual('08:00');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1415
     * @tc.name    WeatherExtension1415
     * @tc.desc    The fourth seeded city inserts the sunset at the same slot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hoursFourthSunset_001', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours.length).assertEqual(25);
      expect(hours[10].date).assertEqual('17:32');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1416
     * @tc.name    WeatherExtension1416
     * @tc.desc    The fourth seeded city keeps seven days and its first range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'weekFourthCity_001', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week.length).assertEqual(7);
      expect(week[0].max).assertEqual('35');
      expect(week[0].min).assertEqual('22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1417
     * @tc.name    WeatherExtension1417
     * @tc.desc    A fresh model reports zero for every data source counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'modelInitialState_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const state: WeatherDataSourceState = model.getState();
      expect(state.total).assertEqual(0);
      expect(state.reloads).assertEqual(0);
      expect(state.adds).assertEqual(0);
      expect(state.changes).assertEqual(0);
      expect(state.deletes).assertEqual(0);
      expect(state.moves).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1418
     * @tc.name    WeatherExtension1418
     * @tc.desc    Clearing every city resets the aggregates safely
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'modelClearAggregate_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities().splice(0, model.getCityCount());
      expect(model.totalCount()).assertEqual(0);
      expect(model.averageTemp()).assertEqual(0);
      expect(model.hottestIndex()).assertEqual(-1);
      expect(model.coldestIndex()).assertEqual(-1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1419
     * @tc.name    WeatherExtension1419
     * @tc.desc    An appended city is counted and found by its exact name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'modelAppendLookup_001', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const city: WeatherCity = { name: 'x', temp: 1, humidity: 2, aqi: 3 };
      model.getCities().push(city);
      expect(model.totalCount()).assertEqual(6);
      expect(model.getCity('x') === city).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1420
     * @tc.name    WeatherExtension1420
     * @tc.desc    Card width and shared spacing keep their published values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleWidthSpace_001', 0, () => {
      expect(Style.WEATHER_ITEM_WIDTH).assertEqual(80);
      expect(Style.NORMAL_SPACE).assertEqual(12);
      expect(Style.GRID_GUTTER).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1421
     * @tc.name    WeatherExtension1421
     * @tc.desc    Card and city text radii keep their published values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleRadius_001', 0, () => {
      expect(Style.NORMAL_RADIUS).assertEqual(16);
      expect(Style.CITY_TEXT_RADIUS).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1422
     * @tc.name    WeatherExtension1422
     * @tc.desc    Add city bottom margins keep their two published values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleAddCity_001', 0, () => {
      expect(Style.ADD_CITY_BOTTOM).assertEqual(6);
      expect(Style.ADD_CITY_BOTTOM_LG).assertEqual(28);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1423
     * @tc.name    WeatherExtension1423
     * @tc.desc    Big font weight and time list height keep their values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'styleWeightHeight_001', 0, () => {
      expect(Style.BIG_FONT_WEIGHT).assertEqual(300);
      expect(Style.TIME_LIST_HEIGHT).assertEqual(48);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1424
     * @tc.name    WeatherExtension1424
     * @tc.desc    Sunny and rain labels map to different page and side backgrounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'bgSunnyVsRain_001', 0, () => {
      expect(getBg('\u6674').id === getBg('\u96e8').id).assertFalse();
      expect(getSideBg('\u6674').id === getSideBg('\u96e8').id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1425
     * @tc.name    WeatherExtension1425
     * @tc.desc    Unknown labels fall back to the same page and side background
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'bgDefault_001', 0, () => {
      expect(getBg('').id).assertEqual(getBg('cloudy').id);
      expect(getSideBg('').id).assertEqual(getSideBg('cloudy').id);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1426
     * @tc.name    WeatherExtension1426
     * @tc.desc    A supplied city overrides only the name and keeps the seeded temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'headerTempOverride_001', 0, () => {
      const header: HeaderData = getHeaderDate(0, new City('x', '1', '2'));
      expect(header.city).assertEqual('x');
      expect(header.temp).assertEqual('32');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1427
     * @tc.name    WeatherExtension1427
     * @tc.desc    Seeded city 1 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName00', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[0].name).assertEqual('\u5317\u4eac');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1428
     * @tc.name    WeatherExtension1428
     * @tc.desc    Seeded city 1 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp00', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[0].temp).assertEqual('32');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1429
     * @tc.name    WeatherExtension1429
     * @tc.desc    Seeded city 2 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName01', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[1].name).assertEqual('\u4e0a\u6d77');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1430
     * @tc.name    WeatherExtension1430
     * @tc.desc    Seeded city 2 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp01', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[1].temp).assertEqual('28');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1431
     * @tc.name    WeatherExtension1431
     * @tc.desc    Seeded city 3 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName02', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[2].name).assertEqual('\u5e7f\u5dde');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1432
     * @tc.name    WeatherExtension1432
     * @tc.desc    Seeded city 4 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName03', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[3].name).assertEqual('\u5929\u6d25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1433
     * @tc.name    WeatherExtension1433
     * @tc.desc    Seeded city 4 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp03', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[3].temp).assertEqual('35');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1434
     * @tc.name    WeatherExtension1434
     * @tc.desc    Seeded city 5 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName04', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[4].name).assertEqual('\u6b66\u6c49');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1435
     * @tc.name    WeatherExtension1435
     * @tc.desc    Seeded city 5 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp04', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[4].temp).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1436
     * @tc.name    WeatherExtension1436
     * @tc.desc    Seeded city 6 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName05', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[5].name).assertEqual('\u6c88\u9633');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1437
     * @tc.name    WeatherExtension1437
     * @tc.desc    Seeded city 6 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp05', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[5].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1438
     * @tc.name    WeatherExtension1438
     * @tc.desc    Seeded city 7 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName06', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[6].name).assertEqual('\u91cd\u5e86');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1439
     * @tc.name    WeatherExtension1439
     * @tc.desc    Seeded city 7 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp06', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[6].temp).assertEqual('27');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1440
     * @tc.name    WeatherExtension1440
     * @tc.desc    Seeded city 8 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName07', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[7].name).assertEqual('\u676d\u5dde');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1441
     * @tc.name    WeatherExtension1441
     * @tc.desc    Seeded city 8 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp07', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[7].temp).assertEqual('35');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1442
     * @tc.name    WeatherExtension1442
     * @tc.desc    Seeded city 9 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName08', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[8].name).assertEqual('\u5357\u4eac');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1443
     * @tc.name    WeatherExtension1443
     * @tc.desc    Seeded city 9 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp08', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[8].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1444
     * @tc.name    WeatherExtension1444
     * @tc.desc    Seeded city 10 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName09', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[9].name).assertEqual('\u54c8\u5c14\u6ee8');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1445
     * @tc.name    WeatherExtension1445
     * @tc.desc    Seeded city 10 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp09', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[9].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1446
     * @tc.name    WeatherExtension1446
     * @tc.desc    Seeded city 11 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName10', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[10].name).assertEqual('\u957f\u6625');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1447
     * @tc.name    WeatherExtension1447
     * @tc.desc    Seeded city 11 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp10', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[10].temp).assertEqual('28');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1448
     * @tc.name    WeatherExtension1448
     * @tc.desc    Seeded city 12 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName11', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[11].name).assertEqual('\u547c\u548c\u6d69\u7279');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1449
     * @tc.name    WeatherExtension1449
     * @tc.desc    Seeded city 12 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp11', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[11].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1450
     * @tc.name    WeatherExtension1450
     * @tc.desc    Seeded city 13 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName12', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[12].name).assertEqual('\u77f3\u5bb6\u5e84');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1451
     * @tc.name    WeatherExtension1451
     * @tc.desc    Seeded city 13 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp12', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[12].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1452
     * @tc.name    WeatherExtension1452
     * @tc.desc    Seeded city 14 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName13', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[13].name).assertEqual('\u94f6\u5ddd');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1453
     * @tc.name    WeatherExtension1453
     * @tc.desc    Seeded city 14 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp13', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[13].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1454
     * @tc.name    WeatherExtension1454
     * @tc.desc    Seeded city 15 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName14', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[14].name).assertEqual('\u4e4c\u9c81\u6728\u9f50');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1455
     * @tc.name    WeatherExtension1455
     * @tc.desc    Seeded city 15 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp14', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[14].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1456
     * @tc.name    WeatherExtension1456
     * @tc.desc    Seeded city 16 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName15', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[15].name).assertEqual('\u62c9\u8428');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1457
     * @tc.name    WeatherExtension1457
     * @tc.desc    Seeded city 16 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp15', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[15].temp).assertEqual('35');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1458
     * @tc.name    WeatherExtension1458
     * @tc.desc    Seeded city 17 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName16', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[16].name).assertEqual('\u897f\u5b81');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1459
     * @tc.name    WeatherExtension1459
     * @tc.desc    Seeded city 17 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp16', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[16].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1460
     * @tc.name    WeatherExtension1460
     * @tc.desc    Seeded city 18 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName17', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[17].name).assertEqual('\u897f\u5b89');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1461
     * @tc.name    WeatherExtension1461
     * @tc.desc    Seeded city 18 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp17', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[17].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1462
     * @tc.name    WeatherExtension1462
     * @tc.desc    Seeded city 19 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName18', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[18].name).assertEqual('\u5170\u5dde');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1463
     * @tc.name    WeatherExtension1463
     * @tc.desc    Seeded city 19 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp18', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[18].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1464
     * @tc.name    WeatherExtension1464
     * @tc.desc    Seeded city 20 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName19', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[19].name).assertEqual('\u592a\u539f');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1465
     * @tc.name    WeatherExtension1465
     * @tc.desc    Seeded city 20 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp19', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[19].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1466
     * @tc.name    WeatherExtension1466
     * @tc.desc    Seeded city 21 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName20', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[20].name).assertEqual('\u6606\u660e');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1467
     * @tc.name    WeatherExtension1467
     * @tc.desc    Seeded city 21 keeps its temperature string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityTemp20', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[20].temp).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1468
     * @tc.name    WeatherExtension1468
     * @tc.desc    Seeded city 22 keeps its name
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cityName21', 0, () => {
      const cities: City[] = getCityList();
      expect(cities[21].name).assertEqual('\u5357\u5b81');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1469
     * @tc.name    WeatherExtension1469
     * @tc.desc    City 1 hour slot 0 keeps degree 30° at 09:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_00', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[0].degree).assertEqual('30\u00b0');
      expect(hours[0].date).assertEqual('09:00');
      expect(hours[0].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1470
     * @tc.name    WeatherExtension1470
     * @tc.desc    City 1 hour slot 1 keeps degree 30° at 10:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_01', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[1].degree).assertEqual('30\u00b0');
      expect(hours[1].date).assertEqual('10:00');
      expect(hours[1].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1471
     * @tc.name    WeatherExtension1471
     * @tc.desc    City 1 hour slot 2 keeps degree 31° at 11:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_02', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[2].degree).assertEqual('31\u00b0');
      expect(hours[2].date).assertEqual('11:00');
      expect(hours[2].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1472
     * @tc.name    WeatherExtension1472
     * @tc.desc    City 1 hour slot 3 keeps degree 31° at 12:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_03', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[3].degree).assertEqual('31\u00b0');
      expect(hours[3].date).assertEqual('12:00');
      expect(hours[3].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1473
     * @tc.name    WeatherExtension1473
     * @tc.desc    City 1 hour slot 4 keeps degree 32° at 13:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_04', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[4].degree).assertEqual('32\u00b0');
      expect(hours[4].date).assertEqual('13:00');
      expect(hours[4].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1474
     * @tc.name    WeatherExtension1474
     * @tc.desc    City 1 hour slot 5 keeps degree 32° at 14:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_05', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[5].degree).assertEqual('32\u00b0');
      expect(hours[5].date).assertEqual('14:00');
      expect(hours[5].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1475
     * @tc.name    WeatherExtension1475
     * @tc.desc    City 1 hour slot 6 keeps degree 31° at 15:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_06', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[6].degree).assertEqual('31\u00b0');
      expect(hours[6].date).assertEqual('15:00');
      expect(hours[6].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1476
     * @tc.name    WeatherExtension1476
     * @tc.desc    City 1 hour slot 7 keeps degree 30° at 16:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_07', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[7].degree).assertEqual('30\u00b0');
      expect(hours[7].date).assertEqual('16:00');
      expect(hours[7].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1477
     * @tc.name    WeatherExtension1477
     * @tc.desc    City 1 hour slot 8 keeps degree 30° at 17:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_08', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[8].degree).assertEqual('30\u00b0');
      expect(hours[8].date).assertEqual('17:00');
      expect(hours[8].win).assertEqual('\u897f\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1478
     * @tc.name    WeatherExtension1478
     * @tc.desc    City 1 hour slot 9 keeps degree 日落 at 17:32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_09', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[9].degree).assertEqual('\u65e5\u843d');
      expect(hours[9].date).assertEqual('17:32');
      expect(hours[9].win).assertEqual('\u897f\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1479
     * @tc.name    WeatherExtension1479
     * @tc.desc    City 1 hour slot 10 keeps degree 29° at 18:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_10', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[10].degree).assertEqual('29\u00b0');
      expect(hours[10].date).assertEqual('18:00');
      expect(hours[10].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1480
     * @tc.name    WeatherExtension1480
     * @tc.desc    City 1 hour slot 11 keeps degree 28° at 19:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_11', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[11].degree).assertEqual('28\u00b0');
      expect(hours[11].date).assertEqual('19:00');
      expect(hours[11].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1481
     * @tc.name    WeatherExtension1481
     * @tc.desc    City 1 hour slot 12 keeps degree 28° at 20:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_12', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[12].degree).assertEqual('28\u00b0');
      expect(hours[12].date).assertEqual('20:00');
      expect(hours[12].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1482
     * @tc.name    WeatherExtension1482
     * @tc.desc    City 1 hour slot 13 keeps degree 27° at 21:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_13', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[13].degree).assertEqual('27\u00b0');
      expect(hours[13].date).assertEqual('21:00');
      expect(hours[13].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1483
     * @tc.name    WeatherExtension1483
     * @tc.desc    City 1 hour slot 14 keeps degree 27° at 22:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_14', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[14].degree).assertEqual('27\u00b0');
      expect(hours[14].date).assertEqual('22:00');
      expect(hours[14].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1484
     * @tc.name    WeatherExtension1484
     * @tc.desc    City 1 hour slot 15 keeps degree 27° at 23:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_15', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[15].degree).assertEqual('27\u00b0');
      expect(hours[15].date).assertEqual('23:00');
      expect(hours[15].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1485
     * @tc.name    WeatherExtension1485
     * @tc.desc    City 1 hour slot 16 keeps degree 26° at 00:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_16', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[16].degree).assertEqual('26\u00b0');
      expect(hours[16].date).assertEqual('00:00');
      expect(hours[16].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1486
     * @tc.name    WeatherExtension1486
     * @tc.desc    City 1 hour slot 17 keeps degree 26° at 01:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_17', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[17].degree).assertEqual('26\u00b0');
      expect(hours[17].date).assertEqual('01:00');
      expect(hours[17].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1487
     * @tc.name    WeatherExtension1487
     * @tc.desc    City 1 hour slot 18 keeps degree 26° at 02:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_18', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[18].degree).assertEqual('26\u00b0');
      expect(hours[18].date).assertEqual('02:00');
      expect(hours[18].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1488
     * @tc.name    WeatherExtension1488
     * @tc.desc    City 1 hour slot 19 keeps degree 26° at 03:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_19', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[19].degree).assertEqual('26\u00b0');
      expect(hours[19].date).assertEqual('03:00');
      expect(hours[19].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1489
     * @tc.name    WeatherExtension1489
     * @tc.desc    City 1 hour slot 20 keeps degree 26° at 04:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_20', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[20].degree).assertEqual('26\u00b0');
      expect(hours[20].date).assertEqual('04:00');
      expect(hours[20].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1490
     * @tc.name    WeatherExtension1490
     * @tc.desc    City 1 hour slot 21 keeps degree 25° at 05:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_21', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[21].degree).assertEqual('25\u00b0');
      expect(hours[21].date).assertEqual('05:00');
      expect(hours[21].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1491
     * @tc.name    WeatherExtension1491
     * @tc.desc    City 1 hour slot 22 keeps degree 26° at 06:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_22', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[22].degree).assertEqual('26\u00b0');
      expect(hours[22].date).assertEqual('06:00');
      expect(hours[22].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1492
     * @tc.name    WeatherExtension1492
     * @tc.desc    City 1 hour slot 23 keeps degree 27° at 07:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_23', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[23].degree).assertEqual('27\u00b0');
      expect(hours[23].date).assertEqual('07:00');
      expect(hours[23].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1493
     * @tc.name    WeatherExtension1493
     * @tc.desc    City 1 hour slot 24 keeps degree 29° at 08:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h00_24', 0, () => {
      const hours: Forecast[] = getHoursData(0);
      expect(hours[24].degree).assertEqual('29\u00b0');
      expect(hours[24].date).assertEqual('08:00');
      expect(hours[24].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1494
     * @tc.name    WeatherExtension1494
     * @tc.desc    City 2 hour slot 0 keeps degree 29° at 08:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_00', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[0].degree).assertEqual('29\u00b0');
      expect(hours[0].date).assertEqual('08:00');
      expect(hours[0].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1495
     * @tc.name    WeatherExtension1495
     * @tc.desc    City 2 hour slot 1 keeps degree 30° at 09:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_01', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[1].degree).assertEqual('30\u00b0');
      expect(hours[1].date).assertEqual('09:00');
      expect(hours[1].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1496
     * @tc.name    WeatherExtension1496
     * @tc.desc    City 2 hour slot 2 keeps degree 30° at 10:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_02', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[2].degree).assertEqual('30\u00b0');
      expect(hours[2].date).assertEqual('10:00');
      expect(hours[2].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1497
     * @tc.name    WeatherExtension1497
     * @tc.desc    City 2 hour slot 3 keeps degree 31° at 11:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_03', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[3].degree).assertEqual('31\u00b0');
      expect(hours[3].date).assertEqual('11:00');
      expect(hours[3].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1498
     * @tc.name    WeatherExtension1498
     * @tc.desc    City 2 hour slot 4 keeps degree 31° at 12:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_04', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[4].degree).assertEqual('31\u00b0');
      expect(hours[4].date).assertEqual('12:00');
      expect(hours[4].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1499
     * @tc.name    WeatherExtension1499
     * @tc.desc    City 2 hour slot 5 keeps degree 32° at 13:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_05', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[5].degree).assertEqual('32\u00b0');
      expect(hours[5].date).assertEqual('13:00');
      expect(hours[5].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1500
     * @tc.name    WeatherExtension1500
     * @tc.desc    City 2 hour slot 6 keeps degree 32° at 14:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_06', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[6].degree).assertEqual('32\u00b0');
      expect(hours[6].date).assertEqual('14:00');
      expect(hours[6].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1501
     * @tc.name    WeatherExtension1501
     * @tc.desc    City 2 hour slot 7 keeps degree 31° at 15:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_07', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[7].degree).assertEqual('31\u00b0');
      expect(hours[7].date).assertEqual('15:00');
      expect(hours[7].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1502
     * @tc.name    WeatherExtension1502
     * @tc.desc    City 2 hour slot 8 keeps degree 30° at 16:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_08', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[8].degree).assertEqual('30\u00b0');
      expect(hours[8].date).assertEqual('16:00');
      expect(hours[8].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1503
     * @tc.name    WeatherExtension1503
     * @tc.desc    City 2 hour slot 9 keeps degree 30° at 17:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_09', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[9].degree).assertEqual('30\u00b0');
      expect(hours[9].date).assertEqual('17:00');
      expect(hours[9].win).assertEqual('\u897f\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1504
     * @tc.name    WeatherExtension1504
     * @tc.desc    City 2 hour slot 10 keeps degree 日落 at 17:32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_10', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[10].degree).assertEqual('\u65e5\u843d');
      expect(hours[10].date).assertEqual('17:32');
      expect(hours[10].win).assertEqual('\u897f\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1505
     * @tc.name    WeatherExtension1505
     * @tc.desc    City 2 hour slot 11 keeps degree 29° at 18:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_11', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[11].degree).assertEqual('29\u00b0');
      expect(hours[11].date).assertEqual('18:00');
      expect(hours[11].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1506
     * @tc.name    WeatherExtension1506
     * @tc.desc    City 2 hour slot 12 keeps degree 28° at 19:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_12', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[12].degree).assertEqual('28\u00b0');
      expect(hours[12].date).assertEqual('19:00');
      expect(hours[12].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1507
     * @tc.name    WeatherExtension1507
     * @tc.desc    City 2 hour slot 13 keeps degree 28° at 20:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_13', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[13].degree).assertEqual('28\u00b0');
      expect(hours[13].date).assertEqual('20:00');
      expect(hours[13].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1508
     * @tc.name    WeatherExtension1508
     * @tc.desc    City 2 hour slot 14 keeps degree 27° at 21:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_14', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[14].degree).assertEqual('27\u00b0');
      expect(hours[14].date).assertEqual('21:00');
      expect(hours[14].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1509
     * @tc.name    WeatherExtension1509
     * @tc.desc    City 2 hour slot 15 keeps degree 27° at 22:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_15', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[15].degree).assertEqual('27\u00b0');
      expect(hours[15].date).assertEqual('22:00');
      expect(hours[15].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1510
     * @tc.name    WeatherExtension1510
     * @tc.desc    City 2 hour slot 16 keeps degree 27° at 23:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_16', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[16].degree).assertEqual('27\u00b0');
      expect(hours[16].date).assertEqual('23:00');
      expect(hours[16].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1511
     * @tc.name    WeatherExtension1511
     * @tc.desc    City 2 hour slot 17 keeps degree 26° at 00:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_17', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[17].degree).assertEqual('26\u00b0');
      expect(hours[17].date).assertEqual('00:00');
      expect(hours[17].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1512
     * @tc.name    WeatherExtension1512
     * @tc.desc    City 2 hour slot 18 keeps degree 26° at 01:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_18', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[18].degree).assertEqual('26\u00b0');
      expect(hours[18].date).assertEqual('01:00');
      expect(hours[18].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1513
     * @tc.name    WeatherExtension1513
     * @tc.desc    City 2 hour slot 19 keeps degree 26° at 02:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_19', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[19].degree).assertEqual('26\u00b0');
      expect(hours[19].date).assertEqual('02:00');
      expect(hours[19].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1514
     * @tc.name    WeatherExtension1514
     * @tc.desc    City 2 hour slot 20 keeps degree 26° at 03:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_20', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[20].degree).assertEqual('26\u00b0');
      expect(hours[20].date).assertEqual('03:00');
      expect(hours[20].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1515
     * @tc.name    WeatherExtension1515
     * @tc.desc    City 2 hour slot 21 keeps degree 26° at 04:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_21', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[21].degree).assertEqual('26\u00b0');
      expect(hours[21].date).assertEqual('04:00');
      expect(hours[21].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1516
     * @tc.name    WeatherExtension1516
     * @tc.desc    City 2 hour slot 22 keeps degree 25° at 05:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_22', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[22].degree).assertEqual('25\u00b0');
      expect(hours[22].date).assertEqual('05:00');
      expect(hours[22].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1517
     * @tc.name    WeatherExtension1517
     * @tc.desc    City 2 hour slot 23 keeps degree 26° at 06:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_23', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[23].degree).assertEqual('26\u00b0');
      expect(hours[23].date).assertEqual('06:00');
      expect(hours[23].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1518
     * @tc.name    WeatherExtension1518
     * @tc.desc    City 2 hour slot 24 keeps degree 27° at 07:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h01_24', 0, () => {
      const hours: Forecast[] = getHoursData(1);
      expect(hours[24].degree).assertEqual('27\u00b0');
      expect(hours[24].date).assertEqual('07:00');
      expect(hours[24].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1519
     * @tc.name    WeatherExtension1519
     * @tc.desc    City 3 hour slot 0 keeps degree 29° at 08:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_00', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[0].degree).assertEqual('29\u00b0');
      expect(hours[0].date).assertEqual('08:00');
      expect(hours[0].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1520
     * @tc.name    WeatherExtension1520
     * @tc.desc    City 3 hour slot 1 keeps degree 30° at 09:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_01', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[1].degree).assertEqual('30\u00b0');
      expect(hours[1].date).assertEqual('09:00');
      expect(hours[1].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1521
     * @tc.name    WeatherExtension1521
     * @tc.desc    City 3 hour slot 2 keeps degree 30° at 10:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_02', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[2].degree).assertEqual('30\u00b0');
      expect(hours[2].date).assertEqual('10:00');
      expect(hours[2].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1522
     * @tc.name    WeatherExtension1522
     * @tc.desc    City 3 hour slot 3 keeps degree 31° at 11:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_03', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[3].degree).assertEqual('31\u00b0');
      expect(hours[3].date).assertEqual('11:00');
      expect(hours[3].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1523
     * @tc.name    WeatherExtension1523
     * @tc.desc    City 3 hour slot 4 keeps degree 31° at 12:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_04', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[4].degree).assertEqual('31\u00b0');
      expect(hours[4].date).assertEqual('12:00');
      expect(hours[4].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1524
     * @tc.name    WeatherExtension1524
     * @tc.desc    City 3 hour slot 5 keeps degree 32° at 13:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_05', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[5].degree).assertEqual('32\u00b0');
      expect(hours[5].date).assertEqual('13:00');
      expect(hours[5].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1525
     * @tc.name    WeatherExtension1525
     * @tc.desc    City 3 hour slot 6 keeps degree 32° at 14:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_06', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[6].degree).assertEqual('32\u00b0');
      expect(hours[6].date).assertEqual('14:00');
      expect(hours[6].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1526
     * @tc.name    WeatherExtension1526
     * @tc.desc    City 3 hour slot 7 keeps degree 31° at 15:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_07', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[7].degree).assertEqual('31\u00b0');
      expect(hours[7].date).assertEqual('15:00');
      expect(hours[7].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1527
     * @tc.name    WeatherExtension1527
     * @tc.desc    City 3 hour slot 8 keeps degree 30° at 16:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_08', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[8].degree).assertEqual('30\u00b0');
      expect(hours[8].date).assertEqual('16:00');
      expect(hours[8].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1528
     * @tc.name    WeatherExtension1528
     * @tc.desc    City 3 hour slot 9 keeps degree 30° at 17:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_09', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[9].degree).assertEqual('30\u00b0');
      expect(hours[9].date).assertEqual('17:00');
      expect(hours[9].win).assertEqual('\u897f\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1529
     * @tc.name    WeatherExtension1529
     * @tc.desc    City 3 hour slot 10 keeps degree 日落 at 17:32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_10', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[10].degree).assertEqual('\u65e5\u843d');
      expect(hours[10].date).assertEqual('17:32');
      expect(hours[10].win).assertEqual('\u897f\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1530
     * @tc.name    WeatherExtension1530
     * @tc.desc    City 3 hour slot 11 keeps degree 29° at 18:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_11', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[11].degree).assertEqual('29\u00b0');
      expect(hours[11].date).assertEqual('18:00');
      expect(hours[11].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1531
     * @tc.name    WeatherExtension1531
     * @tc.desc    City 3 hour slot 12 keeps degree 28° at 19:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_12', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[12].degree).assertEqual('28\u00b0');
      expect(hours[12].date).assertEqual('19:00');
      expect(hours[12].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1532
     * @tc.name    WeatherExtension1532
     * @tc.desc    City 3 hour slot 13 keeps degree 28° at 20:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_13', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[13].degree).assertEqual('28\u00b0');
      expect(hours[13].date).assertEqual('20:00');
      expect(hours[13].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1533
     * @tc.name    WeatherExtension1533
     * @tc.desc    City 3 hour slot 14 keeps degree 27° at 21:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_14', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[14].degree).assertEqual('27\u00b0');
      expect(hours[14].date).assertEqual('21:00');
      expect(hours[14].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1534
     * @tc.name    WeatherExtension1534
     * @tc.desc    City 3 hour slot 15 keeps degree 27° at 22:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_15', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[15].degree).assertEqual('27\u00b0');
      expect(hours[15].date).assertEqual('22:00');
      expect(hours[15].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1535
     * @tc.name    WeatherExtension1535
     * @tc.desc    City 3 hour slot 16 keeps degree 27° at 23:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_16', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[16].degree).assertEqual('27\u00b0');
      expect(hours[16].date).assertEqual('23:00');
      expect(hours[16].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1536
     * @tc.name    WeatherExtension1536
     * @tc.desc    City 3 hour slot 17 keeps degree 26° at 00:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_17', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[17].degree).assertEqual('26\u00b0');
      expect(hours[17].date).assertEqual('00:00');
      expect(hours[17].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1537
     * @tc.name    WeatherExtension1537
     * @tc.desc    City 3 hour slot 18 keeps degree 26° at 01:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_18', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[18].degree).assertEqual('26\u00b0');
      expect(hours[18].date).assertEqual('01:00');
      expect(hours[18].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1538
     * @tc.name    WeatherExtension1538
     * @tc.desc    City 3 hour slot 19 keeps degree 26° at 02:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_19', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[19].degree).assertEqual('26\u00b0');
      expect(hours[19].date).assertEqual('02:00');
      expect(hours[19].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1539
     * @tc.name    WeatherExtension1539
     * @tc.desc    City 3 hour slot 20 keeps degree 26° at 03:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_20', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[20].degree).assertEqual('26\u00b0');
      expect(hours[20].date).assertEqual('03:00');
      expect(hours[20].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1540
     * @tc.name    WeatherExtension1540
     * @tc.desc    City 3 hour slot 21 keeps degree 26° at 04:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_21', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[21].degree).assertEqual('26\u00b0');
      expect(hours[21].date).assertEqual('04:00');
      expect(hours[21].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1541
     * @tc.name    WeatherExtension1541
     * @tc.desc    City 3 hour slot 22 keeps degree 25° at 05:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_22', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[22].degree).assertEqual('25\u00b0');
      expect(hours[22].date).assertEqual('05:00');
      expect(hours[22].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1542
     * @tc.name    WeatherExtension1542
     * @tc.desc    City 3 hour slot 23 keeps degree 26° at 06:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_23', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[23].degree).assertEqual('26\u00b0');
      expect(hours[23].date).assertEqual('06:00');
      expect(hours[23].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1543
     * @tc.name    WeatherExtension1543
     * @tc.desc    City 3 hour slot 24 keeps degree 27° at 07:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h02_24', 0, () => {
      const hours: Forecast[] = getHoursData(2);
      expect(hours[24].degree).assertEqual('27\u00b0');
      expect(hours[24].date).assertEqual('07:00');
      expect(hours[24].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1544
     * @tc.name    WeatherExtension1544
     * @tc.desc    City 4 hour slot 0 keeps degree 29° at 08:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_00', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[0].degree).assertEqual('29\u00b0');
      expect(hours[0].date).assertEqual('08:00');
      expect(hours[0].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1545
     * @tc.name    WeatherExtension1545
     * @tc.desc    City 4 hour slot 1 keeps degree 30° at 09:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_01', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[1].degree).assertEqual('30\u00b0');
      expect(hours[1].date).assertEqual('09:00');
      expect(hours[1].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1546
     * @tc.name    WeatherExtension1546
     * @tc.desc    City 4 hour slot 2 keeps degree 30° at 10:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_02', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[2].degree).assertEqual('30\u00b0');
      expect(hours[2].date).assertEqual('10:00');
      expect(hours[2].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1547
     * @tc.name    WeatherExtension1547
     * @tc.desc    City 4 hour slot 3 keeps degree 31° at 11:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_03', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[3].degree).assertEqual('31\u00b0');
      expect(hours[3].date).assertEqual('11:00');
      expect(hours[3].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1548
     * @tc.name    WeatherExtension1548
     * @tc.desc    City 4 hour slot 4 keeps degree 31° at 12:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_04', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[4].degree).assertEqual('31\u00b0');
      expect(hours[4].date).assertEqual('12:00');
      expect(hours[4].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1549
     * @tc.name    WeatherExtension1549
     * @tc.desc    City 4 hour slot 5 keeps degree 32° at 13:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_05', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[5].degree).assertEqual('32\u00b0');
      expect(hours[5].date).assertEqual('13:00');
      expect(hours[5].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1550
     * @tc.name    WeatherExtension1550
     * @tc.desc    City 4 hour slot 6 keeps degree 32° at 14:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_06', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[6].degree).assertEqual('32\u00b0');
      expect(hours[6].date).assertEqual('14:00');
      expect(hours[6].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1551
     * @tc.name    WeatherExtension1551
     * @tc.desc    City 4 hour slot 7 keeps degree 31° at 15:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_07', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[7].degree).assertEqual('31\u00b0');
      expect(hours[7].date).assertEqual('15:00');
      expect(hours[7].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1552
     * @tc.name    WeatherExtension1552
     * @tc.desc    City 4 hour slot 8 keeps degree 30° at 16:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_08', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[8].degree).assertEqual('30\u00b0');
      expect(hours[8].date).assertEqual('16:00');
      expect(hours[8].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1553
     * @tc.name    WeatherExtension1553
     * @tc.desc    City 4 hour slot 9 keeps degree 30° at 17:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_09', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[9].degree).assertEqual('30\u00b0');
      expect(hours[9].date).assertEqual('17:00');
      expect(hours[9].win).assertEqual('\u897f\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1554
     * @tc.name    WeatherExtension1554
     * @tc.desc    City 4 hour slot 10 keeps degree 日落 at 17:32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_10', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[10].degree).assertEqual('\u65e5\u843d');
      expect(hours[10].date).assertEqual('17:32');
      expect(hours[10].win).assertEqual('\u897f\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1555
     * @tc.name    WeatherExtension1555
     * @tc.desc    City 4 hour slot 11 keeps degree 29° at 18:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_11', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[11].degree).assertEqual('29\u00b0');
      expect(hours[11].date).assertEqual('18:00');
      expect(hours[11].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1556
     * @tc.name    WeatherExtension1556
     * @tc.desc    City 4 hour slot 12 keeps degree 28° at 19:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_12', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[12].degree).assertEqual('28\u00b0');
      expect(hours[12].date).assertEqual('19:00');
      expect(hours[12].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1557
     * @tc.name    WeatherExtension1557
     * @tc.desc    City 4 hour slot 13 keeps degree 28° at 20:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_13', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[13].degree).assertEqual('28\u00b0');
      expect(hours[13].date).assertEqual('20:00');
      expect(hours[13].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1558
     * @tc.name    WeatherExtension1558
     * @tc.desc    City 4 hour slot 14 keeps degree 27° at 21:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_14', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[14].degree).assertEqual('27\u00b0');
      expect(hours[14].date).assertEqual('21:00');
      expect(hours[14].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1559
     * @tc.name    WeatherExtension1559
     * @tc.desc    City 4 hour slot 15 keeps degree 27° at 22:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_15', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[15].degree).assertEqual('27\u00b0');
      expect(hours[15].date).assertEqual('22:00');
      expect(hours[15].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1560
     * @tc.name    WeatherExtension1560
     * @tc.desc    City 4 hour slot 16 keeps degree 27° at 23:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_16', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[16].degree).assertEqual('27\u00b0');
      expect(hours[16].date).assertEqual('23:00');
      expect(hours[16].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1561
     * @tc.name    WeatherExtension1561
     * @tc.desc    City 4 hour slot 17 keeps degree 26° at 00:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_17', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[17].degree).assertEqual('26\u00b0');
      expect(hours[17].date).assertEqual('00:00');
      expect(hours[17].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1562
     * @tc.name    WeatherExtension1562
     * @tc.desc    City 4 hour slot 18 keeps degree 26° at 01:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_18', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[18].degree).assertEqual('26\u00b0');
      expect(hours[18].date).assertEqual('01:00');
      expect(hours[18].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1563
     * @tc.name    WeatherExtension1563
     * @tc.desc    City 4 hour slot 19 keeps degree 26° at 02:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_19', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[19].degree).assertEqual('26\u00b0');
      expect(hours[19].date).assertEqual('02:00');
      expect(hours[19].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1564
     * @tc.name    WeatherExtension1564
     * @tc.desc    City 4 hour slot 20 keeps degree 26° at 03:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_20', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[20].degree).assertEqual('26\u00b0');
      expect(hours[20].date).assertEqual('03:00');
      expect(hours[20].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1565
     * @tc.name    WeatherExtension1565
     * @tc.desc    City 4 hour slot 21 keeps degree 26° at 04:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_21', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[21].degree).assertEqual('26\u00b0');
      expect(hours[21].date).assertEqual('04:00');
      expect(hours[21].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1566
     * @tc.name    WeatherExtension1566
     * @tc.desc    City 4 hour slot 22 keeps degree 25° at 05:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_22', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[22].degree).assertEqual('25\u00b0');
      expect(hours[22].date).assertEqual('05:00');
      expect(hours[22].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1567
     * @tc.name    WeatherExtension1567
     * @tc.desc    City 4 hour slot 23 keeps degree 26° at 06:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_23', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[23].degree).assertEqual('26\u00b0');
      expect(hours[23].date).assertEqual('06:00');
      expect(hours[23].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1568
     * @tc.name    WeatherExtension1568
     * @tc.desc    City 4 hour slot 24 keeps degree 27° at 07:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h03_24', 0, () => {
      const hours: Forecast[] = getHoursData(3);
      expect(hours[24].degree).assertEqual('27\u00b0');
      expect(hours[24].date).assertEqual('07:00');
      expect(hours[24].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1569
     * @tc.name    WeatherExtension1569
     * @tc.desc    City 5 hour slot 0 keeps degree 25° at 08:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_00', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[0].degree).assertEqual('25\u00b0');
      expect(hours[0].date).assertEqual('08:00');
      expect(hours[0].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1570
     * @tc.name    WeatherExtension1570
     * @tc.desc    City 5 hour slot 1 keeps degree 27° at 09:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_01', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[1].degree).assertEqual('27\u00b0');
      expect(hours[1].date).assertEqual('09:00');
      expect(hours[1].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1571
     * @tc.name    WeatherExtension1571
     * @tc.desc    City 5 hour slot 2 keeps degree 27° at 10:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_02', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[2].degree).assertEqual('27\u00b0');
      expect(hours[2].date).assertEqual('10:00');
      expect(hours[2].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1572
     * @tc.name    WeatherExtension1572
     * @tc.desc    City 5 hour slot 3 keeps degree 28° at 11:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_03', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[3].degree).assertEqual('28\u00b0');
      expect(hours[3].date).assertEqual('11:00');
      expect(hours[3].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1573
     * @tc.name    WeatherExtension1573
     * @tc.desc    City 5 hour slot 4 keeps degree 28° at 12:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_04', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[4].degree).assertEqual('28\u00b0');
      expect(hours[4].date).assertEqual('12:00');
      expect(hours[4].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1574
     * @tc.name    WeatherExtension1574
     * @tc.desc    City 5 hour slot 5 keeps degree 28° at 13:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_05', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[5].degree).assertEqual('28\u00b0');
      expect(hours[5].date).assertEqual('13:00');
      expect(hours[5].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1575
     * @tc.name    WeatherExtension1575
     * @tc.desc    City 5 hour slot 6 keeps degree 27° at 14:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_06', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[6].degree).assertEqual('27\u00b0');
      expect(hours[6].date).assertEqual('14:00');
      expect(hours[6].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1576
     * @tc.name    WeatherExtension1576
     * @tc.desc    City 5 hour slot 7 keeps degree 27° at 15:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_07', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[7].degree).assertEqual('27\u00b0');
      expect(hours[7].date).assertEqual('15:00');
      expect(hours[7].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1577
     * @tc.name    WeatherExtension1577
     * @tc.desc    City 5 hour slot 8 keeps degree 26° at 16:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_08', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[8].degree).assertEqual('26\u00b0');
      expect(hours[8].date).assertEqual('16:00');
      expect(hours[8].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1578
     * @tc.name    WeatherExtension1578
     * @tc.desc    City 5 hour slot 9 keeps degree 27° at 17:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_09', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[9].degree).assertEqual('27\u00b0');
      expect(hours[9].date).assertEqual('17:00');
      expect(hours[9].win).assertEqual('\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1579
     * @tc.name    WeatherExtension1579
     * @tc.desc    City 5 hour slot 10 keeps degree 日落 at 17:32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_10', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[10].degree).assertEqual('\u65e5\u843d');
      expect(hours[10].date).assertEqual('17:32');
      expect(hours[10].win).assertEqual('\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1580
     * @tc.name    WeatherExtension1580
     * @tc.desc    City 5 hour slot 11 keeps degree 27° at 18:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_11', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[11].degree).assertEqual('27\u00b0');
      expect(hours[11].date).assertEqual('18:00');
      expect(hours[11].win).assertEqual('\u897f\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1581
     * @tc.name    WeatherExtension1581
     * @tc.desc    City 5 hour slot 12 keeps degree 26° at 19:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_12', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[12].degree).assertEqual('26\u00b0');
      expect(hours[12].date).assertEqual('19:00');
      expect(hours[12].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1582
     * @tc.name    WeatherExtension1582
     * @tc.desc    City 5 hour slot 13 keeps degree 25° at 20:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_13', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[13].degree).assertEqual('25\u00b0');
      expect(hours[13].date).assertEqual('20:00');
      expect(hours[13].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1583
     * @tc.name    WeatherExtension1583
     * @tc.desc    City 5 hour slot 14 keeps degree 25° at 21:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_14', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[14].degree).assertEqual('25\u00b0');
      expect(hours[14].date).assertEqual('21:00');
      expect(hours[14].win).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1584
     * @tc.name    WeatherExtension1584
     * @tc.desc    City 5 hour slot 15 keeps degree 24° at 22:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_15', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[15].degree).assertEqual('24\u00b0');
      expect(hours[15].date).assertEqual('22:00');
      expect(hours[15].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1585
     * @tc.name    WeatherExtension1585
     * @tc.desc    City 5 hour slot 16 keeps degree 24° at 23:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_16', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[16].degree).assertEqual('24\u00b0');
      expect(hours[16].date).assertEqual('23:00');
      expect(hours[16].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1586
     * @tc.name    WeatherExtension1586
     * @tc.desc    City 5 hour slot 17 keeps degree 24° at 00:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_17', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[17].degree).assertEqual('24\u00b0');
      expect(hours[17].date).assertEqual('00:00');
      expect(hours[17].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1587
     * @tc.name    WeatherExtension1587
     * @tc.desc    City 5 hour slot 18 keeps degree 24° at 01:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_18', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[18].degree).assertEqual('24\u00b0');
      expect(hours[18].date).assertEqual('01:00');
      expect(hours[18].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1588
     * @tc.name    WeatherExtension1588
     * @tc.desc    City 5 hour slot 19 keeps degree 24° at 02:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_19', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[19].degree).assertEqual('24\u00b0');
      expect(hours[19].date).assertEqual('02:00');
      expect(hours[19].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1589
     * @tc.name    WeatherExtension1589
     * @tc.desc    City 5 hour slot 20 keeps degree 23° at 03:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_20', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[20].degree).assertEqual('23\u00b0');
      expect(hours[20].date).assertEqual('03:00');
      expect(hours[20].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1590
     * @tc.name    WeatherExtension1590
     * @tc.desc    City 5 hour slot 21 keeps degree 24° at 04:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_21', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[21].degree).assertEqual('24\u00b0');
      expect(hours[21].date).assertEqual('04:00');
      expect(hours[21].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1591
     * @tc.name    WeatherExtension1591
     * @tc.desc    City 5 hour slot 22 keeps degree 25° at 05:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_22', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[22].degree).assertEqual('25\u00b0');
      expect(hours[22].date).assertEqual('05:00');
      expect(hours[22].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1592
     * @tc.name    WeatherExtension1592
     * @tc.desc    City 5 hour slot 23 keeps degree 25° at 06:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_23', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[23].degree).assertEqual('25\u00b0');
      expect(hours[23].date).assertEqual('06:00');
      expect(hours[23].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1593
     * @tc.name    WeatherExtension1593
     * @tc.desc    City 5 hour slot 24 keeps degree 26° at 07:00
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5h04_24', 0, () => {
      const hours: Forecast[] = getHoursData(4);
      expect(hours[24].degree).assertEqual('26\u00b0');
      expect(hours[24].date).assertEqual('07:00');
      expect(hours[24].win).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1594
     * @tc.name    WeatherExtension1594
     * @tc.desc    City 1 day 0 keeps the maximum 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax00_00', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[0].max).assertEqual('35');
      expect(week[0].min).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1595
     * @tc.name    WeatherExtension1595
     * @tc.desc    City 1 day 0 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea00_00', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[0].weather).assertEqual('\u9634');
      expect(week[0].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1596
     * @tc.name    WeatherExtension1596
     * @tc.desc    City 1 day 1 keeps the maximum 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax00_01', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[1].max).assertEqual('35');
      expect(week[1].min).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1597
     * @tc.name    WeatherExtension1597
     * @tc.desc    City 1 day 1 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea00_01', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[1].weather).assertEqual('\u6674');
      expect(week[1].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1598
     * @tc.name    WeatherExtension1598
     * @tc.desc    City 1 day 2 keeps the maximum 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax00_02', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[2].max).assertEqual('32');
      expect(week[2].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1599
     * @tc.name    WeatherExtension1599
     * @tc.desc    City 1 day 2 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea00_02', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[2].weather).assertEqual('\u591a\u4e91');
      expect(week[2].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1600
     * @tc.name    WeatherExtension1600
     * @tc.desc    City 1 day 3 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax00_03', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[3].max).assertEqual('36');
      expect(week[3].min).assertEqual('27');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1601
     * @tc.name    WeatherExtension1601
     * @tc.desc    City 1 day 3 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea00_03', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[3].weather).assertEqual('\u5c0f\u96e8');
      expect(week[3].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1602
     * @tc.name    WeatherExtension1602
     * @tc.desc    City 1 day 4 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax00_04', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[4].max).assertEqual('36');
      expect(week[4].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1603
     * @tc.name    WeatherExtension1603
     * @tc.desc    City 1 day 4 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea00_04', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[4].weather).assertEqual('\u9634');
      expect(week[4].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1604
     * @tc.name    WeatherExtension1604
     * @tc.desc    City 1 day 5 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax00_05', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[5].max).assertEqual('36');
      expect(week[5].min).assertEqual('27');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1605
     * @tc.name    WeatherExtension1605
     * @tc.desc    City 1 day 5 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea00_05', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[5].weather).assertEqual('\u6674');
      expect(week[5].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1606
     * @tc.name    WeatherExtension1606
     * @tc.desc    City 1 day 6 keeps the maximum 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax00_06', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[6].max).assertEqual('35');
      expect(week[6].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1607
     * @tc.name    WeatherExtension1607
     * @tc.desc    City 1 day 6 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea00_06', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(0);
      expect(week[6].weather).assertEqual('\u591a\u4e91');
      expect(week[6].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1608
     * @tc.name    WeatherExtension1608
     * @tc.desc    City 2 day 0 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax01_00', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[0].max).assertEqual('36');
      expect(week[0].min).assertEqual('28');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1609
     * @tc.name    WeatherExtension1609
     * @tc.desc    City 2 day 0 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea01_00', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[0].weather).assertEqual('\u591a\u4e91');
      expect(week[0].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1610
     * @tc.name    WeatherExtension1610
     * @tc.desc    City 2 day 1 keeps the maximum 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax01_01', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[1].max).assertEqual('32');
      expect(week[1].min).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1611
     * @tc.name    WeatherExtension1611
     * @tc.desc    City 2 day 1 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea01_01', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[1].weather).assertEqual('\u9634');
      expect(week[1].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1612
     * @tc.name    WeatherExtension1612
     * @tc.desc    City 2 day 2 keeps the maximum 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax01_02', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[2].max).assertEqual('34');
      expect(week[2].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1613
     * @tc.name    WeatherExtension1613
     * @tc.desc    City 2 day 2 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea01_02', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[2].weather).assertEqual('\u591a\u4e91');
      expect(week[2].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1614
     * @tc.name    WeatherExtension1614
     * @tc.desc    City 2 day 3 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax01_03', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[3].max).assertEqual('36');
      expect(week[3].min).assertEqual('27');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1615
     * @tc.name    WeatherExtension1615
     * @tc.desc    City 2 day 3 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea01_03', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[3].weather).assertEqual('\u9634');
      expect(week[3].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1616
     * @tc.name    WeatherExtension1616
     * @tc.desc    City 2 day 4 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax01_04', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[4].max).assertEqual('36');
      expect(week[4].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1617
     * @tc.name    WeatherExtension1617
     * @tc.desc    City 2 day 4 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea01_04', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[4].weather).assertEqual('\u9634');
      expect(week[4].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1618
     * @tc.name    WeatherExtension1618
     * @tc.desc    City 2 day 5 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax01_05', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[5].max).assertEqual('36');
      expect(week[5].min).assertEqual('27');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1619
     * @tc.name    WeatherExtension1619
     * @tc.desc    City 2 day 5 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea01_05', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[5].weather).assertEqual('\u591a\u4e91');
      expect(week[5].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1620
     * @tc.name    WeatherExtension1620
     * @tc.desc    City 2 day 6 keeps the maximum 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax01_06', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[6].max).assertEqual('35');
      expect(week[6].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1621
     * @tc.name    WeatherExtension1621
     * @tc.desc    City 2 day 6 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea01_06', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(1);
      expect(week[6].weather).assertEqual('\u5c0f\u96e8');
      expect(week[6].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1622
     * @tc.name    WeatherExtension1622
     * @tc.desc    City 3 day 0 keeps the maximum 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax02_00', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[0].max).assertEqual('38');
      expect(week[0].min).assertEqual('30');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1623
     * @tc.name    WeatherExtension1623
     * @tc.desc    City 3 day 0 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea02_00', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[0].weather).assertEqual('\u5c0f\u96e8');
      expect(week[0].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1624
     * @tc.name    WeatherExtension1624
     * @tc.desc    City 3 day 1 keeps the maximum 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax02_01', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[1].max).assertEqual('30');
      expect(week[1].min).assertEqual('22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1625
     * @tc.name    WeatherExtension1625
     * @tc.desc    City 3 day 1 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea02_01', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[1].weather).assertEqual('\u5c0f\u96e8');
      expect(week[1].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1626
     * @tc.name    WeatherExtension1626
     * @tc.desc    City 3 day 2 keeps the maximum 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax02_02', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[2].max).assertEqual('34');
      expect(week[2].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1627
     * @tc.name    WeatherExtension1627
     * @tc.desc    City 3 day 2 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea02_02', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[2].weather).assertEqual('\u591a\u4e91');
      expect(week[2].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1628
     * @tc.name    WeatherExtension1628
     * @tc.desc    City 3 day 3 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax02_03', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[3].max).assertEqual('36');
      expect(week[3].min).assertEqual('27');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1629
     * @tc.name    WeatherExtension1629
     * @tc.desc    City 3 day 3 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea02_03', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[3].weather).assertEqual('\u9634');
      expect(week[3].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1630
     * @tc.name    WeatherExtension1630
     * @tc.desc    City 3 day 4 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax02_04', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[4].max).assertEqual('36');
      expect(week[4].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1631
     * @tc.name    WeatherExtension1631
     * @tc.desc    City 3 day 4 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea02_04', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[4].weather).assertEqual('\u9634');
      expect(week[4].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1632
     * @tc.name    WeatherExtension1632
     * @tc.desc    City 3 day 5 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax02_05', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[5].max).assertEqual('36');
      expect(week[5].min).assertEqual('27');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1633
     * @tc.name    WeatherExtension1633
     * @tc.desc    City 3 day 5 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea02_05', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[5].weather).assertEqual('\u4e2d\u96e8');
      expect(week[5].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1634
     * @tc.name    WeatherExtension1634
     * @tc.desc    City 3 day 6 keeps the maximum 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax02_06', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[6].max).assertEqual('35');
      expect(week[6].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1635
     * @tc.name    WeatherExtension1635
     * @tc.desc    City 3 day 6 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea02_06', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(2);
      expect(week[6].weather).assertEqual('\u4e2d\u96e8');
      expect(week[6].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1636
     * @tc.name    WeatherExtension1636
     * @tc.desc    City 4 day 0 keeps the maximum 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax03_00', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[0].max).assertEqual('35');
      expect(week[0].min).assertEqual('22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1637
     * @tc.name    WeatherExtension1637
     * @tc.desc    City 4 day 0 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea03_00', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[0].weather).assertEqual('\u9634');
      expect(week[0].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1638
     * @tc.name    WeatherExtension1638
     * @tc.desc    City 4 day 1 keeps the maximum 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax03_01', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[1].max).assertEqual('32');
      expect(week[1].min).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1639
     * @tc.name    WeatherExtension1639
     * @tc.desc    City 4 day 1 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea03_01', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[1].weather).assertEqual('\u4e2d\u96e8');
      expect(week[1].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1640
     * @tc.name    WeatherExtension1640
     * @tc.desc    City 4 day 2 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax03_02', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[2].max).assertEqual('36');
      expect(week[2].min).assertEqual('22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1641
     * @tc.name    WeatherExtension1641
     * @tc.desc    City 4 day 2 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea03_02', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[2].weather).assertEqual('\u9634');
      expect(week[2].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1642
     * @tc.name    WeatherExtension1642
     * @tc.desc    City 4 day 3 keeps the maximum 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax03_03', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[3].max).assertEqual('38');
      expect(week[3].min).assertEqual('27');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1643
     * @tc.name    WeatherExtension1643
     * @tc.desc    City 4 day 3 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea03_03', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[3].weather).assertEqual('\u9634');
      expect(week[3].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1644
     * @tc.name    WeatherExtension1644
     * @tc.desc    City 4 day 4 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax03_04', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[4].max).assertEqual('36');
      expect(week[4].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1645
     * @tc.name    WeatherExtension1645
     * @tc.desc    City 4 day 4 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea03_04', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[4].weather).assertEqual('\u591a\u4e91');
      expect(week[4].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1646
     * @tc.name    WeatherExtension1646
     * @tc.desc    City 4 day 5 keeps the maximum 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax03_05', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[5].max).assertEqual('36');
      expect(week[5].min).assertEqual('27');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1647
     * @tc.name    WeatherExtension1647
     * @tc.desc    City 4 day 5 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea03_05', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[5].weather).assertEqual('\u6674');
      expect(week[5].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1648
     * @tc.name    WeatherExtension1648
     * @tc.desc    City 4 day 6 keeps the maximum 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax03_06', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[6].max).assertEqual('35');
      expect(week[6].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1649
     * @tc.name    WeatherExtension1649
     * @tc.desc    City 4 day 6 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea03_06', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(3);
      expect(week[6].weather).assertEqual('\u6674');
      expect(week[6].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1650
     * @tc.name    WeatherExtension1650
     * @tc.desc    City 5 day 0 keeps the maximum 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax04_00', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[0].max).assertEqual('39');
      expect(week[0].min).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1651
     * @tc.name    WeatherExtension1651
     * @tc.desc    City 5 day 0 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea04_00', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[0].weather).assertEqual('\u591a\u4e91');
      expect(week[0].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1652
     * @tc.name    WeatherExtension1652
     * @tc.desc    City 5 day 1 keeps the maximum 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax04_01', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[1].max).assertEqual('29');
      expect(week[1].min).assertEqual('22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1653
     * @tc.name    WeatherExtension1653
     * @tc.desc    City 5 day 1 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea04_01', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[1].weather).assertEqual('\u591a\u4e91');
      expect(week[1].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1654
     * @tc.name    WeatherExtension1654
     * @tc.desc    City 5 day 2 keeps the maximum 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax04_02', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[2].max).assertEqual('30');
      expect(week[2].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1655
     * @tc.name    WeatherExtension1655
     * @tc.desc    City 5 day 2 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea04_02', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[2].weather).assertEqual('\u591a\u4e91');
      expect(week[2].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1656
     * @tc.name    WeatherExtension1656
     * @tc.desc    City 5 day 3 keeps the maximum 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax04_03', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[3].max).assertEqual('40');
      expect(week[3].min).assertEqual('30');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1657
     * @tc.name    WeatherExtension1657
     * @tc.desc    City 5 day 3 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea04_03', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[3].weather).assertEqual('\u6674');
      expect(week[3].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1658
     * @tc.name    WeatherExtension1658
     * @tc.desc    City 5 day 4 keeps the maximum 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax04_04', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[4].max).assertEqual('39');
      expect(week[4].min).assertEqual('28');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1659
     * @tc.name    WeatherExtension1659
     * @tc.desc    City 5 day 4 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea04_04', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[4].weather).assertEqual('\u6674');
      expect(week[4].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1660
     * @tc.name    WeatherExtension1660
     * @tc.desc    City 5 day 5 keeps the maximum 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax04_05', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[5].max).assertEqual('38');
      expect(week[5].min).assertEqual('28');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1661
     * @tc.name    WeatherExtension1661
     * @tc.desc    City 5 day 5 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea04_05', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[5].weather).assertEqual('\u591a\u4e91');
      expect(week[5].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1662
     * @tc.name    WeatherExtension1662
     * @tc.desc    City 5 day 6 keeps the maximum 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkMax04_06', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[6].max).assertEqual('39');
      expect(week[6].min).assertEqual('26');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1663
     * @tc.name    WeatherExtension1663
     * @tc.desc    City 5 day 6 keeps the weather and air level
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5wkWea04_06', 0, () => {
      const week: WeekWeather[] = getWeekWeatherData(4);
      expect(week[6].weather).assertEqual('\u6674');
      expect(week[6].airLevel).assertEqual('\u4f18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1664
     * @tc.name    WeatherExtension1664
     * @tc.desc    City 1 air slot 0 keeps PM10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air00_00', 0, () => {
      const air: AirIndex[] = getAirIndexData(0);
      expect(air[0].index).assertEqual('PM10');
      expect(air[0].figure).assertEqual('181');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1665
     * @tc.name    WeatherExtension1665
     * @tc.desc    City 1 air slot 1 keeps PM2.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air00_01', 0, () => {
      const air: AirIndex[] = getAirIndexData(0);
      expect(air[1].index).assertEqual('PM2.5');
      expect(air[1].figure).assertEqual('94');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1666
     * @tc.name    WeatherExtension1666
     * @tc.desc    City 1 air slot 2 keeps NO2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air00_02', 0, () => {
      const air: AirIndex[] = getAirIndexData(0);
      expect(air[2].index).assertEqual('NO2');
      expect(air[2].figure).assertEqual('105');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1667
     * @tc.name    WeatherExtension1667
     * @tc.desc    City 1 air slot 3 keeps SO2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air00_03', 0, () => {
      const air: AirIndex[] = getAirIndexData(0);
      expect(air[3].index).assertEqual('SO2');
      expect(air[3].figure).assertEqual('67');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1668
     * @tc.name    WeatherExtension1668
     * @tc.desc    City 1 air slot 4 keeps O2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air00_04', 0, () => {
      const air: AirIndex[] = getAirIndexData(0);
      expect(air[4].index).assertEqual('O2');
      expect(air[4].figure).assertEqual('19');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1669
     * @tc.name    WeatherExtension1669
     * @tc.desc    City 1 air slot 5 keeps CO
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air00_05', 0, () => {
      const air: AirIndex[] = getAirIndexData(0);
      expect(air[5].index).assertEqual('CO');
      expect(air[5].figure).assertEqual('19');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1670
     * @tc.name    WeatherExtension1670
     * @tc.desc    City 2 air slot 0 keeps PM10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air01_00', 0, () => {
      const air: AirIndex[] = getAirIndexData(1);
      expect(air[0].index).assertEqual('PM10');
      expect(air[0].figure).assertEqual('200');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1671
     * @tc.name    WeatherExtension1671
     * @tc.desc    City 2 air slot 1 keeps PM2.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air01_01', 0, () => {
      const air: AirIndex[] = getAirIndexData(1);
      expect(air[1].index).assertEqual('PM2.5');
      expect(air[1].figure).assertEqual('80');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1672
     * @tc.name    WeatherExtension1672
     * @tc.desc    City 2 air slot 2 keeps NO2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air01_02', 0, () => {
      const air: AirIndex[] = getAirIndexData(1);
      expect(air[2].index).assertEqual('NO2');
      expect(air[2].figure).assertEqual('100');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1673
     * @tc.name    WeatherExtension1673
     * @tc.desc    City 2 air slot 3 keeps SO2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air01_03', 0, () => {
      const air: AirIndex[] = getAirIndexData(1);
      expect(air[3].index).assertEqual('SO2');
      expect(air[3].figure).assertEqual('70');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1674
     * @tc.name    WeatherExtension1674
     * @tc.desc    City 2 air slot 4 keeps O2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air01_04', 0, () => {
      const air: AirIndex[] = getAirIndexData(1);
      expect(air[4].index).assertEqual('O2');
      expect(air[4].figure).assertEqual('39');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1675
     * @tc.name    WeatherExtension1675
     * @tc.desc    City 2 air slot 5 keeps CO
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air01_05', 0, () => {
      const air: AirIndex[] = getAirIndexData(1);
      expect(air[5].index).assertEqual('CO');
      expect(air[5].figure).assertEqual('20');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1676
     * @tc.name    WeatherExtension1676
     * @tc.desc    City 3 air slot 0 keeps PM10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air02_00', 0, () => {
      const air: AirIndex[] = getAirIndexData(2);
      expect(air[0].index).assertEqual('PM10');
      expect(air[0].figure).assertEqual('170');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1677
     * @tc.name    WeatherExtension1677
     * @tc.desc    City 3 air slot 1 keeps PM2.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air02_01', 0, () => {
      const air: AirIndex[] = getAirIndexData(2);
      expect(air[1].index).assertEqual('PM2.5');
      expect(air[1].figure).assertEqual('90');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1678
     * @tc.name    WeatherExtension1678
     * @tc.desc    City 3 air slot 2 keeps NO2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air02_02', 0, () => {
      const air: AirIndex[] = getAirIndexData(2);
      expect(air[2].index).assertEqual('NO2');
      expect(air[2].figure).assertEqual('90');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1679
     * @tc.name    WeatherExtension1679
     * @tc.desc    City 3 air slot 3 keeps SO2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air02_03', 0, () => {
      const air: AirIndex[] = getAirIndexData(2);
      expect(air[3].index).assertEqual('SO2');
      expect(air[3].figure).assertEqual('64');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1680
     * @tc.name    WeatherExtension1680
     * @tc.desc    City 3 air slot 4 keeps O2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air02_04', 0, () => {
      const air: AirIndex[] = getAirIndexData(2);
      expect(air[4].index).assertEqual('O2');
      expect(air[4].figure).assertEqual('18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1681
     * @tc.name    WeatherExtension1681
     * @tc.desc    City 3 air slot 5 keeps CO
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air02_05', 0, () => {
      const air: AirIndex[] = getAirIndexData(2);
      expect(air[5].index).assertEqual('CO');
      expect(air[5].figure).assertEqual('22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1682
     * @tc.name    WeatherExtension1682
     * @tc.desc    City 4 air slot 0 keeps PM10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air03_00', 0, () => {
      const air: AirIndex[] = getAirIndexData(3);
      expect(air[0].index).assertEqual('PM10');
      expect(air[0].figure).assertEqual('180');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1683
     * @tc.name    WeatherExtension1683
     * @tc.desc    City 4 air slot 1 keeps PM2.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air03_01', 0, () => {
      const air: AirIndex[] = getAirIndexData(3);
      expect(air[1].index).assertEqual('PM2.5');
      expect(air[1].figure).assertEqual('95');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1684
     * @tc.name    WeatherExtension1684
     * @tc.desc    City 4 air slot 2 keeps NO2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air03_02', 0, () => {
      const air: AirIndex[] = getAirIndexData(3);
      expect(air[2].index).assertEqual('NO2');
      expect(air[2].figure).assertEqual('150');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1685
     * @tc.name    WeatherExtension1685
     * @tc.desc    City 4 air slot 3 keeps SO2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air03_03', 0, () => {
      const air: AirIndex[] = getAirIndexData(3);
      expect(air[3].index).assertEqual('SO2');
      expect(air[3].figure).assertEqual('65');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1686
     * @tc.name    WeatherExtension1686
     * @tc.desc    City 4 air slot 4 keeps O2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air03_04', 0, () => {
      const air: AirIndex[] = getAirIndexData(3);
      expect(air[4].index).assertEqual('O2');
      expect(air[4].figure).assertEqual('30');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1687
     * @tc.name    WeatherExtension1687
     * @tc.desc    City 4 air slot 5 keeps CO
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air03_05', 0, () => {
      const air: AirIndex[] = getAirIndexData(3);
      expect(air[5].index).assertEqual('CO');
      expect(air[5].figure).assertEqual('19');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1688
     * @tc.name    WeatherExtension1688
     * @tc.desc    City 5 air slot 0 keeps PM10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air04_00', 0, () => {
      const air: AirIndex[] = getAirIndexData(4);
      expect(air[0].index).assertEqual('PM10');
      expect(air[0].figure).assertEqual('178');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1689
     * @tc.name    WeatherExtension1689
     * @tc.desc    City 5 air slot 1 keeps PM2.5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air04_01', 0, () => {
      const air: AirIndex[] = getAirIndexData(4);
      expect(air[1].index).assertEqual('PM2.5');
      expect(air[1].figure).assertEqual('93');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1690
     * @tc.name    WeatherExtension1690
     * @tc.desc    City 5 air slot 2 keeps NO2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air04_02', 0, () => {
      const air: AirIndex[] = getAirIndexData(4);
      expect(air[2].index).assertEqual('NO2');
      expect(air[2].figure).assertEqual('100');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1691
     * @tc.name    WeatherExtension1691
     * @tc.desc    City 5 air slot 3 keeps SO2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air04_03', 0, () => {
      const air: AirIndex[] = getAirIndexData(4);
      expect(air[3].index).assertEqual('SO2');
      expect(air[3].figure).assertEqual('66');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1692
     * @tc.name    WeatherExtension1692
     * @tc.desc    City 5 air slot 4 keeps O2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air04_04', 0, () => {
      const air: AirIndex[] = getAirIndexData(4);
      expect(air[4].index).assertEqual('O2');
      expect(air[4].figure).assertEqual('17');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1693
     * @tc.name    WeatherExtension1693
     * @tc.desc    City 5 air slot 5 keeps CO
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5air04_05', 0, () => {
      const air: AirIndex[] = getAirIndexData(4);
      expect(air[5].index).assertEqual('CO');
      expect(air[5].figure).assertEqual('18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1694
     * @tc.name    WeatherExtension1694
     * @tc.desc    City 1 life slot 0 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life00_00', 0, () => {
      const life: SuitData[] = getLifeData(0);
      expect(life[0].desc).assertEqual('\u6e7f\u5ea6');
      expect(life[0].value).assertEqual('42%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1695
     * @tc.name    WeatherExtension1695
     * @tc.desc    City 1 life slot 1 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life00_01', 0, () => {
      const life: SuitData[] = getLifeData(0);
      expect(life[1].desc).assertEqual('\u4f53\u611f\u6e29\u5ea6');
      expect(life[1].value).assertEqual('28\u00b0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1696
     * @tc.name    WeatherExtension1696
     * @tc.desc    City 1 life slot 2 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life00_02', 0, () => {
      const life: SuitData[] = getLifeData(0);
      expect(life[2].desc).assertEqual('\u98ce\u529b');
      expect(life[2].value).assertEqual('\u5fae\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1697
     * @tc.name    WeatherExtension1697
     * @tc.desc    City 1 life slot 3 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life00_03', 0, () => {
      const life: SuitData[] = getLifeData(0);
      expect(life[3].desc).assertEqual('\u98ce\u5411');
      expect(life[3].value).assertEqual('\u5317\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1698
     * @tc.name    WeatherExtension1698
     * @tc.desc    City 1 life slot 4 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life00_04', 0, () => {
      const life: SuitData[] = getLifeData(0);
      expect(life[4].desc).assertEqual('\u7a7f\u8863');
      expect(life[4].value).assertEqual('\u77ed\u8896');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1699
     * @tc.name    WeatherExtension1699
     * @tc.desc    City 1 life slot 5 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life00_05', 0, () => {
      const life: SuitData[] = getLifeData(0);
      expect(life[5].desc).assertEqual('\u8fd0\u52a8');
      expect(life[5].value).assertEqual('\u5b9c\u5ba4\u5185');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1700
     * @tc.name    WeatherExtension1700
     * @tc.desc    City 1 life slot 6 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life00_06', 0, () => {
      const life: SuitData[] = getLifeData(0);
      expect(life[6].desc).assertEqual('\u611f\u5192');
      expect(life[6].value).assertEqual('\u5bb9\u6613');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1701
     * @tc.name    WeatherExtension1701
     * @tc.desc    City 1 life slot 7 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life00_07', 0, () => {
      const life: SuitData[] = getLifeData(0);
      expect(life[7].desc).assertEqual('\u7d2b\u5916\u7ebf');
      expect(life[7].value).assertEqual('\u5f3a');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1702
     * @tc.name    WeatherExtension1702
     * @tc.desc    City 2 life slot 0 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life01_00', 0, () => {
      const life: SuitData[] = getLifeData(1);
      expect(life[0].desc).assertEqual('\u6e7f\u5ea6');
      expect(life[0].value).assertEqual('45%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1703
     * @tc.name    WeatherExtension1703
     * @tc.desc    City 2 life slot 1 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life01_01', 0, () => {
      const life: SuitData[] = getLifeData(1);
      expect(life[1].desc).assertEqual('\u4f53\u611f\u6e29\u5ea6');
      expect(life[1].value).assertEqual('28\u00b0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1704
     * @tc.name    WeatherExtension1704
     * @tc.desc    City 2 life slot 2 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life01_02', 0, () => {
      const life: SuitData[] = getLifeData(1);
      expect(life[2].desc).assertEqual('\u98ce\u529b');
      expect(life[2].value).assertEqual('\u5fae\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1705
     * @tc.name    WeatherExtension1705
     * @tc.desc    City 2 life slot 3 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life01_03', 0, () => {
      const life: SuitData[] = getLifeData(1);
      expect(life[3].desc).assertEqual('\u98ce\u5411');
      expect(life[3].value).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1706
     * @tc.name    WeatherExtension1706
     * @tc.desc    City 2 life slot 4 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life01_04', 0, () => {
      const life: SuitData[] = getLifeData(1);
      expect(life[4].desc).assertEqual('\u7a7f\u8863');
      expect(life[4].value).assertEqual('\u77ed\u8896');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1707
     * @tc.name    WeatherExtension1707
     * @tc.desc    City 2 life slot 5 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life01_05', 0, () => {
      const life: SuitData[] = getLifeData(1);
      expect(life[5].desc).assertEqual('\u8fd0\u52a8');
      expect(life[5].value).assertEqual('\u5b9c\u5ba4\u5185');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1708
     * @tc.name    WeatherExtension1708
     * @tc.desc    City 2 life slot 6 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life01_06', 0, () => {
      const life: SuitData[] = getLifeData(1);
      expect(life[6].desc).assertEqual('\u611f\u5192');
      expect(life[6].value).assertEqual('\u5bb9\u6613');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1709
     * @tc.name    WeatherExtension1709
     * @tc.desc    City 2 life slot 7 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life01_07', 0, () => {
      const life: SuitData[] = getLifeData(1);
      expect(life[7].desc).assertEqual('\u7d2b\u5916\u7ebf');
      expect(life[7].value).assertEqual('\u5f31');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1710
     * @tc.name    WeatherExtension1710
     * @tc.desc    City 3 life slot 0 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life02_00', 0, () => {
      const life: SuitData[] = getLifeData(2);
      expect(life[0].desc).assertEqual('\u6e7f\u5ea6');
      expect(life[0].value).assertEqual('50%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1711
     * @tc.name    WeatherExtension1711
     * @tc.desc    City 3 life slot 1 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life02_01', 0, () => {
      const life: SuitData[] = getLifeData(2);
      expect(life[1].desc).assertEqual('\u4f53\u611f\u6e29\u5ea6');
      expect(life[1].value).assertEqual('27\u00b0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1712
     * @tc.name    WeatherExtension1712
     * @tc.desc    City 3 life slot 2 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life02_02', 0, () => {
      const life: SuitData[] = getLifeData(2);
      expect(life[2].desc).assertEqual('\u98ce\u529b');
      expect(life[2].value).assertEqual('\u5927\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1713
     * @tc.name    WeatherExtension1713
     * @tc.desc    City 3 life slot 3 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life02_03', 0, () => {
      const life: SuitData[] = getLifeData(2);
      expect(life[3].desc).assertEqual('\u98ce\u5411');
      expect(life[3].value).assertEqual('\u4e1c\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1714
     * @tc.name    WeatherExtension1714
     * @tc.desc    City 3 life slot 4 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life02_04', 0, () => {
      const life: SuitData[] = getLifeData(2);
      expect(life[4].desc).assertEqual('\u7a7f\u8863');
      expect(life[4].value).assertEqual('\u957f\u8896');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1715
     * @tc.name    WeatherExtension1715
     * @tc.desc    City 3 life slot 5 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life02_05', 0, () => {
      const life: SuitData[] = getLifeData(2);
      expect(life[5].desc).assertEqual('\u8fd0\u52a8');
      expect(life[5].value).assertEqual('\u5b9c\u5ba4\u5185');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1716
     * @tc.name    WeatherExtension1716
     * @tc.desc    City 3 life slot 6 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life02_06', 0, () => {
      const life: SuitData[] = getLifeData(2);
      expect(life[6].desc).assertEqual('\u611f\u5192');
      expect(life[6].value).assertEqual('\u5bb9\u6613');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1717
     * @tc.name    WeatherExtension1717
     * @tc.desc    City 3 life slot 7 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life02_07', 0, () => {
      const life: SuitData[] = getLifeData(2);
      expect(life[7].desc).assertEqual('\u7d2b\u5916\u7ebf');
      expect(life[7].value).assertEqual('\u5f31');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1718
     * @tc.name    WeatherExtension1718
     * @tc.desc    City 4 life slot 0 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life03_00', 0, () => {
      const life: SuitData[] = getLifeData(3);
      expect(life[0].desc).assertEqual('\u6e7f\u5ea6');
      expect(life[0].value).assertEqual('55%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1719
     * @tc.name    WeatherExtension1719
     * @tc.desc    City 4 life slot 1 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life03_01', 0, () => {
      const life: SuitData[] = getLifeData(3);
      expect(life[1].desc).assertEqual('\u4f53\u611f\u6e29\u5ea6');
      expect(life[1].value).assertEqual('35\u00b0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1720
     * @tc.name    WeatherExtension1720
     * @tc.desc    City 4 life slot 2 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life03_02', 0, () => {
      const life: SuitData[] = getLifeData(3);
      expect(life[2].desc).assertEqual('\u98ce\u529b');
      expect(life[2].value).assertEqual('\u5fae\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1721
     * @tc.name    WeatherExtension1721
     * @tc.desc    City 4 life slot 3 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life03_03', 0, () => {
      const life: SuitData[] = getLifeData(3);
      expect(life[3].desc).assertEqual('\u98ce\u5411');
      expect(life[3].value).assertEqual('\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1722
     * @tc.name    WeatherExtension1722
     * @tc.desc    City 4 life slot 4 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life03_04', 0, () => {
      const life: SuitData[] = getLifeData(3);
      expect(life[4].desc).assertEqual('\u7a7f\u8863');
      expect(life[4].value).assertEqual('\u77ed\u8896');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1723
     * @tc.name    WeatherExtension1723
     * @tc.desc    City 4 life slot 5 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life03_05', 0, () => {
      const life: SuitData[] = getLifeData(3);
      expect(life[5].desc).assertEqual('\u8fd0\u52a8');
      expect(life[5].value).assertEqual('\u5b9c\u5ba4\u5185');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1724
     * @tc.name    WeatherExtension1724
     * @tc.desc    City 4 life slot 6 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life03_06', 0, () => {
      const life: SuitData[] = getLifeData(3);
      expect(life[6].desc).assertEqual('\u611f\u5192');
      expect(life[6].value).assertEqual('\u5bb9\u6613');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1725
     * @tc.name    WeatherExtension1725
     * @tc.desc    City 4 life slot 7 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life03_07', 0, () => {
      const life: SuitData[] = getLifeData(3);
      expect(life[7].desc).assertEqual('\u7d2b\u5916\u7ebf');
      expect(life[7].value).assertEqual('\u5f31');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1726
     * @tc.name    WeatherExtension1726
     * @tc.desc    City 5 life slot 0 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life04_00', 0, () => {
      const life: SuitData[] = getLifeData(4);
      expect(life[0].desc).assertEqual('\u6e7f\u5ea6');
      expect(life[0].value).assertEqual('42%');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1727
     * @tc.name    WeatherExtension1727
     * @tc.desc    City 5 life slot 1 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life04_01', 0, () => {
      const life: SuitData[] = getLifeData(4);
      expect(life[1].desc).assertEqual('\u4f53\u611f\u6e29\u5ea6');
      expect(life[1].value).assertEqual('25\u00b0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1728
     * @tc.name    WeatherExtension1728
     * @tc.desc    City 5 life slot 2 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life04_02', 0, () => {
      const life: SuitData[] = getLifeData(4);
      expect(life[2].desc).assertEqual('\u98ce\u529b');
      expect(life[2].value).assertEqual('\u5fae\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1729
     * @tc.name    WeatherExtension1729
     * @tc.desc    City 5 life slot 3 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life04_03', 0, () => {
      const life: SuitData[] = getLifeData(4);
      expect(life[3].desc).assertEqual('\u98ce\u5411');
      expect(life[3].value).assertEqual('\u897f\u5357\u98ce');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1730
     * @tc.name    WeatherExtension1730
     * @tc.desc    City 5 life slot 4 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life04_04', 0, () => {
      const life: SuitData[] = getLifeData(4);
      expect(life[4].desc).assertEqual('\u7a7f\u8863');
      expect(life[4].value).assertEqual('\u77ed\u8896');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1731
     * @tc.name    WeatherExtension1731
     * @tc.desc    City 5 life slot 5 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life04_05', 0, () => {
      const life: SuitData[] = getLifeData(4);
      expect(life[5].desc).assertEqual('\u8fd0\u52a8');
      expect(life[5].value).assertEqual('\u5b9c\u5ba4\u5916');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1732
     * @tc.name    WeatherExtension1732
     * @tc.desc    City 5 life slot 6 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life04_06', 0, () => {
      const life: SuitData[] = getLifeData(4);
      expect(life[6].desc).assertEqual('\u611f\u5192');
      expect(life[6].value).assertEqual('\u5bb9\u6613');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1733
     * @tc.name    WeatherExtension1733
     * @tc.desc    City 5 life slot 7 keeps the published value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5life04_07', 0, () => {
      const life: SuitData[] = getLifeData(4);
      expect(life[7].desc).assertEqual('\u7d2b\u5916\u7ebf');
      expect(life[7].value).assertEqual('\u5f31');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1734
     * @tc.name    WeatherExtension1734
     * @tc.desc    Header of city 1 keeps its identity and range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5head00', 0, () => {
      const header: HeaderData = getHeaderDate(0);
      expect(header.city).assertEqual('\u5317\u4eac');
      expect(header.weatherType).assertEqual('\u6674');
      expect(header.max).assertEqual('35');
      expect(header.min).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1735
     * @tc.name    WeatherExtension1735
     * @tc.desc    Header of city 2 keeps its identity and range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5head01', 0, () => {
      const header: HeaderData = getHeaderDate(1);
      expect(header.city).assertEqual('\u4e0a\u6d77');
      expect(header.weatherType).assertEqual('\u9634');
      expect(header.max).assertEqual('32');
      expect(header.min).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1736
     * @tc.name    WeatherExtension1736
     * @tc.desc    Header of city 3 keeps its identity and range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5head02', 0, () => {
      const header: HeaderData = getHeaderDate(2);
      expect(header.city).assertEqual('\u5e7f\u5dde');
      expect(header.weatherType).assertEqual('\u5c0f\u96e8');
      expect(header.max).assertEqual('30');
      expect(header.min).assertEqual('22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1737
     * @tc.name    WeatherExtension1737
     * @tc.desc    Header of city 4 keeps its identity and range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5head03', 0, () => {
      const header: HeaderData = getHeaderDate(3);
      expect(header.city).assertEqual('\u5929\u6d25');
      expect(header.weatherType).assertEqual('\u4e2d\u96e8');
      expect(header.max).assertEqual('32');
      expect(header.min).assertEqual('25');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1738
     * @tc.name    WeatherExtension1738
     * @tc.desc    Header of city 5 keeps its identity and range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5head04', 0, () => {
      const header: HeaderData = getHeaderDate(4);
      expect(header.city).assertEqual('\u6b66\u6c49');
      expect(header.weatherType).assertEqual('\u591a\u4e91');
      expect(header.max).assertEqual('29');
      expect(header.min).assertEqual('22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1739
     * @tc.name    WeatherExtension1739
     * @tc.desc    Air quality -10 maps to the excellent band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi00', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(-10)).assertEqual('excellent');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1740
     * @tc.name    WeatherExtension1740
     * @tc.desc    Air quality 0 maps to the excellent band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi02', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(0)).assertEqual('excellent');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1741
     * @tc.name    WeatherExtension1741
     * @tc.desc    Air quality 1 maps to the excellent band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi03', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(1)).assertEqual('excellent');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1742
     * @tc.name    WeatherExtension1742
     * @tc.desc    Air quality 25 maps to the excellent band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi04', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(25)).assertEqual('excellent');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1743
     * @tc.name    WeatherExtension1743
     * @tc.desc    Air quality 49 maps to the excellent band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi05', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(49)).assertEqual('excellent');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1744
     * @tc.name    WeatherExtension1744
     * @tc.desc    Air quality 50 maps to the excellent band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi06', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(50)).assertEqual('excellent');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1745
     * @tc.name    WeatherExtension1745
     * @tc.desc    Air quality 51 maps to the good band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi07', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(51)).assertEqual('good');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1746
     * @tc.name    WeatherExtension1746
     * @tc.desc    Air quality 60 maps to the good band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi08', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(60)).assertEqual('good');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1747
     * @tc.name    WeatherExtension1747
     * @tc.desc    Air quality 75 maps to the good band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi09', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(75)).assertEqual('good');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1748
     * @tc.name    WeatherExtension1748
     * @tc.desc    Air quality 99 maps to the good band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi10', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(99)).assertEqual('good');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1749
     * @tc.name    WeatherExtension1749
     * @tc.desc    Air quality 100 maps to the good band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi11', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(100)).assertEqual('good');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1750
     * @tc.name    WeatherExtension1750
     * @tc.desc    Air quality 101 maps to the light band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi12', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(101)).assertEqual('light');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1751
     * @tc.name    WeatherExtension1751
     * @tc.desc    Air quality 120 maps to the light band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi13', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(120)).assertEqual('light');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1752
     * @tc.name    WeatherExtension1752
     * @tc.desc    Air quality 149 maps to the light band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi14', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(149)).assertEqual('light');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1753
     * @tc.name    WeatherExtension1753
     * @tc.desc    Air quality 150 maps to the light band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi15', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(150)).assertEqual('light');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1754
     * @tc.name    WeatherExtension1754
     * @tc.desc    Air quality 151 maps to the moderate band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi16', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(151)).assertEqual('moderate');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1755
     * @tc.name    WeatherExtension1755
     * @tc.desc    Air quality 200 maps to the moderate band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi17', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(200)).assertEqual('moderate');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1756
     * @tc.name    WeatherExtension1756
     * @tc.desc    Air quality 300 maps to the moderate band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi18', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(300)).assertEqual('moderate');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1757
     * @tc.name    WeatherExtension1757
     * @tc.desc    Air quality 500 maps to the moderate band
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aqi19', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.aqiLevel(500)).assertEqual('moderate');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1758
     * @tc.name    WeatherExtension1758
     * @tc.desc    Humidity -100 validation returns False
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum00', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(-100)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1759
     * @tc.name    WeatherExtension1759
     * @tc.desc    Humidity -1 validation returns False
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum01', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(-1)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1760
     * @tc.name    WeatherExtension1760
     * @tc.desc    Humidity 0 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum02', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(0)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1761
     * @tc.name    WeatherExtension1761
     * @tc.desc    Humidity 1 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum03', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(1)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1762
     * @tc.name    WeatherExtension1762
     * @tc.desc    Humidity 25 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum04', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(25)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1763
     * @tc.name    WeatherExtension1763
     * @tc.desc    Humidity 50 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum05', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(50)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1764
     * @tc.name    WeatherExtension1764
     * @tc.desc    Humidity 75 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum06', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(75)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1765
     * @tc.name    WeatherExtension1765
     * @tc.desc    Humidity 99 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum07', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(99)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1766
     * @tc.name    WeatherExtension1766
     * @tc.desc    Humidity 100 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum08', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(100)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1767
     * @tc.name    WeatherExtension1767
     * @tc.desc    Humidity 101 validation returns False
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum09', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(101)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1768
     * @tc.name    WeatherExtension1768
     * @tc.desc    Humidity 200 validation returns False
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5hum10', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isHumidityValid(200)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1769
     * @tc.name    WeatherExtension1769
     * @tc.desc    Temperature -100 validation returns False
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tv00', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(-100)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1770
     * @tc.name    WeatherExtension1770
     * @tc.desc    Temperature -51 validation returns False
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tv01', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(-51)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1771
     * @tc.name    WeatherExtension1771
     * @tc.desc    Temperature -49 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tv03', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(-49)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1772
     * @tc.name    WeatherExtension1772
     * @tc.desc    Temperature 0 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tv04', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(0)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1773
     * @tc.name    WeatherExtension1773
     * @tc.desc    Temperature 25 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tv05', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(25)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1774
     * @tc.name    WeatherExtension1774
     * @tc.desc    Temperature 59 validation returns True
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tv06', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(59)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1775
     * @tc.name    WeatherExtension1775
     * @tc.desc    Temperature 61 validation returns False
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tv08', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(61)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1776
     * @tc.name    WeatherExtension1776
     * @tc.desc    Temperature 100 validation returns False
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tv09', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.isTempValid(100)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1777
     * @tc.name    WeatherExtension1777
     * @tc.desc    Model lookup resolves city beijing and its temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5getcity0', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const city: WeatherCity | undefined = model.getCity('beijing');
      expect(city !== undefined).assertTrue();
      expect((city as WeatherCity).temp).assertEqual(26);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1778
     * @tc.name    WeatherExtension1778
     * @tc.desc    Model lookup resolves city shanghai and its temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5getcity1', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const city: WeatherCity | undefined = model.getCity('shanghai');
      expect(city !== undefined).assertTrue();
      expect((city as WeatherCity).temp).assertEqual(29);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1779
     * @tc.name    WeatherExtension1779
     * @tc.desc    Model lookup resolves city guangzhou and its temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5getcity2', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const city: WeatherCity | undefined = model.getCity('guangzhou');
      expect(city !== undefined).assertTrue();
      expect((city as WeatherCity).temp).assertEqual(33);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1780
     * @tc.name    WeatherExtension1780
     * @tc.desc    Model lookup resolves city shenzhen and its temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5getcity3', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const city: WeatherCity | undefined = model.getCity('shenzhen');
      expect(city !== undefined).assertTrue();
      expect((city as WeatherCity).temp).assertEqual(32);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1781
     * @tc.name    WeatherExtension1781
     * @tc.desc    Model lookup resolves city hangzhou and its temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5getcity4', 0, () => {
      const model: WeatherModel = new WeatherModel();
      const city: WeatherCity | undefined = model.getCity('hangzhou');
      expect(city !== undefined).assertTrue();
      expect((city as WeatherCity).temp).assertEqual(28);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1782
     * @tc.name    WeatherExtension1782
     * @tc.desc    Model lookup reports undefined for absent city 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5getmiss0', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getCity('beijing ') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1783
     * @tc.name    WeatherExtension1783
     * @tc.desc    Model lookup reports undefined for absent city 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5getmiss1', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getCity('BEIJING') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1784
     * @tc.name    WeatherExtension1784
     * @tc.desc    Model lookup reports undefined for absent city 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5getmiss2', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getCity('') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1785
     * @tc.name    WeatherExtension1785
     * @tc.desc    Model lookup reports undefined for absent city 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5getmiss3', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getCity('xian') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1786
     * @tc.name    WeatherExtension1786
     * @tc.desc    Model lookup reports undefined for absent city 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5getmiss4', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getCity('chengdu') === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1787
     * @tc.name    WeatherExtension1787
     * @tc.desc    Indexed access rejects index -1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5data0', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getData(-1) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1788
     * @tc.name    WeatherExtension1788
     * @tc.desc    Indexed access returns city 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5data1', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect((model.getData(0) as WeatherCity).temp).assertEqual(26);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1789
     * @tc.name    WeatherExtension1789
     * @tc.desc    Indexed access returns city 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5data2', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect((model.getData(1) as WeatherCity).temp).assertEqual(29);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1790
     * @tc.name    WeatherExtension1790
     * @tc.desc    Indexed access returns city 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5data3', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect((model.getData(2) as WeatherCity).temp).assertEqual(33);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1791
     * @tc.name    WeatherExtension1791
     * @tc.desc    Indexed access returns city 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5data4', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect((model.getData(3) as WeatherCity).temp).assertEqual(32);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1792
     * @tc.name    WeatherExtension1792
     * @tc.desc    Indexed access returns city 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5data5', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect((model.getData(4) as WeatherCity).temp).assertEqual(28);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1793
     * @tc.name    WeatherExtension1793
     * @tc.desc    Indexed access rejects index 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5data6', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getData(5) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1794
     * @tc.name    WeatherExtension1794
     * @tc.desc    Seeded aggregates report the hottest, coldest and average temperature
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggBase', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.getCityCount()).assertEqual(WEATHER_CITY_COUNT);
      expect(model.totalCount()).assertEqual(5);
      expect(model.hottestIndex()).assertEqual(2);
      expect(model.coldestIndex()).assertEqual(0);
      expect(model.averageTemp()).assertEqual(29.6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1795
     * @tc.name    WeatherExtension1795
     * @tc.desc    Raising city 1 above thirty three makes it the hottest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggHot0', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[0].temp = 40;
      expect(model.hottestIndex()).assertEqual(0);
      expect(model.averageTemp()).assertEqual(32.4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1796
     * @tc.name    WeatherExtension1796
     * @tc.desc    Raising city 2 above thirty three makes it the hottest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggHot1', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[1].temp = 40;
      expect(model.hottestIndex()).assertEqual(1);
      expect(model.averageTemp()).assertEqual(31.8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1797
     * @tc.name    WeatherExtension1797
     * @tc.desc    Raising city 3 above thirty three makes it the hottest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggHot2', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[2].temp = 40;
      expect(model.hottestIndex()).assertEqual(2);
      expect(model.averageTemp()).assertEqual(31);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1798
     * @tc.name    WeatherExtension1798
     * @tc.desc    Raising city 4 above thirty three makes it the hottest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggHot3', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[3].temp = 40;
      expect(model.hottestIndex()).assertEqual(3);
      expect(model.averageTemp()).assertEqual(31.2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1799
     * @tc.name    WeatherExtension1799
     * @tc.desc    Raising city 5 above thirty three makes it the hottest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggHot4', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[4].temp = 40;
      expect(model.hottestIndex()).assertEqual(4);
      expect(model.averageTemp()).assertEqual(32);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1800
     * @tc.name    WeatherExtension1800
     * @tc.desc    Lowering city 1 below twenty six makes it the coldest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggCold0', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[0].temp = -10;
      expect(model.coldestIndex()).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1801
     * @tc.name    WeatherExtension1801
     * @tc.desc    Lowering city 2 below twenty six makes it the coldest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggCold1', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[1].temp = -10;
      expect(model.coldestIndex()).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1802
     * @tc.name    WeatherExtension1802
     * @tc.desc    Lowering city 3 below twenty six makes it the coldest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggCold2', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[2].temp = -10;
      expect(model.coldestIndex()).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1803
     * @tc.name    WeatherExtension1803
     * @tc.desc    Lowering city 4 below twenty six makes it the coldest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggCold3', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[3].temp = -10;
      expect(model.coldestIndex()).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1804
     * @tc.name    WeatherExtension1804
     * @tc.desc    Lowering city 5 below twenty six makes it the coldest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggCold4', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[4].temp = -10;
      expect(model.coldestIndex()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1805
     * @tc.name    WeatherExtension1805
     * @tc.desc    A later equal temperature does not displace the hottest index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggTie', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[4].temp = 33;
      expect(model.hottestIndex()).assertEqual(2);
      expect(model.coldestIndex()).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1806
     * @tc.name    WeatherExtension1806
     * @tc.desc    A single city is both hottest and coldest
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5aggSingle', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities().splice(1, model.getCityCount() - 1);
      expect(model.hottestIndex()).assertEqual(0);
      expect(model.coldestIndex()).assertEqual(0);
      expect(model.averageTemp()).assertEqual(26);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1807
     * @tc.name    WeatherExtension1807
     * @tc.desc    A reload notification increments only its counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5st_reload', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyReload();
      expect(model.getState().reloads).assertEqual(1);
      expect(model.getState().total).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1808
     * @tc.name    WeatherExtension1808
     * @tc.desc    A add notification increments only its counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5st_add', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyAdd();
      expect(model.getState().adds).assertEqual(1);
      expect(model.getState().total).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1809
     * @tc.name    WeatherExtension1809
     * @tc.desc    A change notification increments only its counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5st_change', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyChange();
      expect(model.getState().changes).assertEqual(1);
      expect(model.getState().total).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1810
     * @tc.name    WeatherExtension1810
     * @tc.desc    A delete notification increments only its counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5st_delete', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyDelete();
      expect(model.getState().deletes).assertEqual(1);
      expect(model.getState().total).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1811
     * @tc.name    WeatherExtension1811
     * @tc.desc    A move notification increments only its counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5st_move', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyMove();
      expect(model.getState().moves).assertEqual(1);
      expect(model.getState().total).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1812
     * @tc.name    WeatherExtension1812
     * @tc.desc    Bursting every notification increments each counter once
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stAll', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.notifyReload();
      model.notifyAdd();
      model.notifyChange();
      model.notifyDelete();
      model.notifyMove();
      expect(model.getState().reloads).assertEqual(1);
      expect(model.getState().adds).assertEqual(1);
      expect(model.getState().changes).assertEqual(1);
      expect(model.getState().deletes).assertEqual(1);
      expect(model.getState().moves).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1813
     * @tc.name    WeatherExtension1813
     * @tc.desc    Repeating one notification accumulates its counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5stRepeat', 0, () => {
      const model: WeatherModel = new WeatherModel();
      for (let i = 0; i < 5; i++) {
        model.notifyReload();
      }
      expect(model.getState().reloads).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1814
     * @tc.name    WeatherExtension1814
     * @tc.desc    Duplicating the name of city 2 breaks uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5uniq1', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[1].name = model.getCities()[0].name;
      expect(model.hasUniqueNames()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1815
     * @tc.name    WeatherExtension1815
     * @tc.desc    Duplicating the name of city 3 breaks uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5uniq2', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[2].name = model.getCities()[0].name;
      expect(model.hasUniqueNames()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1816
     * @tc.name    WeatherExtension1816
     * @tc.desc    Duplicating the name of city 4 breaks uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5uniq3', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[3].name = model.getCities()[0].name;
      expect(model.hasUniqueNames()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1817
     * @tc.name    WeatherExtension1817
     * @tc.desc    Duplicating the name of city 5 breaks uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5uniq4', 0, () => {
      const model: WeatherModel = new WeatherModel();
      model.getCities()[4].name = model.getCities()[0].name;
      expect(model.hasUniqueNames()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1818
     * @tc.name    WeatherExtension1818
     * @tc.desc    The seeded city names stay unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5uniqok', 0, () => {
      const model: WeatherModel = new WeatherModel();
      expect(model.hasUniqueNames()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1819
     * @tc.name    WeatherExtension1819
     * @tc.desc    Style constant CARD_HEIGHT keeps the value 192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleCARD_HEIGHT', 0, () => {
      expect(Style.CARD_HEIGHT).assertEqual(192);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1820
     * @tc.name    WeatherExtension1820
     * @tc.desc    Style constant WEATHER_ITEM_WIDTH keeps the value 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleWEATHER_ITEM_WIDTH', 0, () => {
      expect(Style.WEATHER_ITEM_WIDTH).assertEqual(80);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1821
     * @tc.name    WeatherExtension1821
     * @tc.desc    Style constant NORMAL_PADDING keeps the value 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleNORMAL_PADDING', 0, () => {
      expect(Style.NORMAL_PADDING).assertEqual(14);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1822
     * @tc.name    WeatherExtension1822
     * @tc.desc    Style constant NORMAL_MARGIN keeps the value 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleNORMAL_MARGIN', 0, () => {
      expect(Style.NORMAL_MARGIN).assertEqual(14);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1823
     * @tc.name    WeatherExtension1823
     * @tc.desc    Style constant NORMAL_SPACE keeps the value 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleNORMAL_SPACE', 0, () => {
      expect(Style.NORMAL_SPACE).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1824
     * @tc.name    WeatherExtension1824
     * @tc.desc    Style constant GRID_GUTTER keeps the value 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleGRID_GUTTER', 0, () => {
      expect(Style.GRID_GUTTER).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1825
     * @tc.name    WeatherExtension1825
     * @tc.desc    Style constant NORMAL_RADIUS keeps the value 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleNORMAL_RADIUS', 0, () => {
      expect(Style.NORMAL_RADIUS).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1826
     * @tc.name    WeatherExtension1826
     * @tc.desc    Style constant CITY_TEXT_RADIUS keeps the value 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleCITY_TEXT_RADIUS', 0, () => {
      expect(Style.CITY_TEXT_RADIUS).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1827
     * @tc.name    WeatherExtension1827
     * @tc.desc    Style constant ADD_CITY_BOTTOM keeps the value 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleADD_CITY_BOTTOM', 0, () => {
      expect(Style.ADD_CITY_BOTTOM).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1828
     * @tc.name    WeatherExtension1828
     * @tc.desc    Style constant ADD_CITY_BOTTOM_LG keeps the value 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleADD_CITY_BOTTOM_LG', 0, () => {
      expect(Style.ADD_CITY_BOTTOM_LG).assertEqual(28);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1829
     * @tc.name    WeatherExtension1829
     * @tc.desc    Style constant DIALOG_PADDING_OUT keeps the value 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleDIALOG_PADDING_OUT', 0, () => {
      expect(Style.DIALOG_PADDING_OUT).assertEqual(42);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1830
     * @tc.name    WeatherExtension1830
     * @tc.desc    Style constant DIALOG_PADDING keeps the value 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleDIALOG_PADDING', 0, () => {
      expect(Style.DIALOG_PADDING).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1831
     * @tc.name    WeatherExtension1831
     * @tc.desc    Style constant BIG_FONT_WEIGHT keeps the value 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleBIG_FONT_WEIGHT', 0, () => {
      expect(Style.BIG_FONT_WEIGHT).assertEqual(300);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1832
     * @tc.name    WeatherExtension1832
     * @tc.desc    Style constant TIME_LIST_HEIGHT keeps the value 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleTIME_LIST_HEIGHT', 0, () => {
      expect(Style.TIME_LIST_HEIGHT).assertEqual(48);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1833
     * @tc.name    WeatherExtension1833
     * @tc.desc    Style constant TIME_LIST_MARGIN keeps the value 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleTIME_LIST_MARGIN', 0, () => {
      expect(Style.TIME_LIST_MARGIN).assertEqual(22);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1834
     * @tc.name    WeatherExtension1834
     * @tc.desc    Card background colour keeps its translucent value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleColor', 0, () => {
      expect(Style.CARD_BACKGROUND_COLOR).assertEqual('#24FFFFFF');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1835
     * @tc.name    WeatherExtension1835
     * @tc.desc    Style spacing constants add up consistently
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5styleSum', 0, () => {
      expect(Style.NORMAL_SPACE + Style.GRID_GUTTER).assertEqual(24);
      expect(Style.ADD_CITY_BOTTOM_LG - Style.ADD_CITY_BOTTOM).assertEqual(22);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1836
     * @tc.name    WeatherExtension1836
     * @tc.desc    Page background comparison sunnyVsRain
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bg_sunnyVsRain', 0, () => {
      expect(getBg('\u6674').id === getBg('\u5c0f\u96e8').id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1837
     * @tc.name    WeatherExtension1837
     * @tc.desc    Page background comparison lightVsMid
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bg_lightVsMid', 0, () => {
      expect(getBg('\u5c0f\u96e8').id === getBg('\u4e2d\u96e8').id).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1838
     * @tc.name    WeatherExtension1838
     * @tc.desc    Page background comparison midVsStorm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bg_midVsStorm', 0, () => {
      expect(getBg('\u4e2d\u96e8').id === getBg('\u96f7\u9635\u96e8').id).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1839
     * @tc.name    WeatherExtension1839
     * @tc.desc    Page background comparison cloudyVsOvercast
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bg_cloudyVsOvercast', 0, () => {
      expect(getBg('\u591a\u4e91').id === getBg('\u9634').id).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1840
     * @tc.name    WeatherExtension1840
     * @tc.desc    Page background comparison emptyVsCloudy
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bg_emptyVsCloudy', 0, () => {
      expect(getBg('').id === getBg('\u591a\u4e91').id).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1841
     * @tc.name    WeatherExtension1841
     * @tc.desc    Page background comparison rainVsCloudy
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bg_rainVsCloudy', 0, () => {
      expect(getBg('\u5c0f\u96e8').id === getBg('\u591a\u4e91').id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1842
     * @tc.name    WeatherExtension1842
     * @tc.desc    Side background comparison sunnyVsRain
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sbg_sunnyVsRain', 0, () => {
      expect(getSideBg('\u6674').id === getSideBg('\u5c0f\u96e8').id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1843
     * @tc.name    WeatherExtension1843
     * @tc.desc    Side background comparison lightVsMid
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sbg_lightVsMid', 0, () => {
      expect(getSideBg('\u5c0f\u96e8').id === getSideBg('\u4e2d\u96e8').id).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1844
     * @tc.name    WeatherExtension1844
     * @tc.desc    Side background comparison midVsStorm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sbg_midVsStorm', 0, () => {
      expect(getSideBg('\u4e2d\u96e8').id === getSideBg('\u96f7\u9635\u96e8').id).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1845
     * @tc.name    WeatherExtension1845
     * @tc.desc    Side background comparison cloudyVsOvercast
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sbg_cloudyVsOvercast', 0, () => {
      expect(getSideBg('\u591a\u4e91').id === getSideBg('\u9634').id).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1846
     * @tc.name    WeatherExtension1846
     * @tc.desc    Side background comparison emptyVsCloudy
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sbg_emptyVsCloudy', 0, () => {
      expect(getSideBg('').id === getSideBg('\u591a\u4e91').id).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1847
     * @tc.name    WeatherExtension1847
     * @tc.desc    Side background comparison rainVsCloudy
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sbg_rainVsCloudy', 0, () => {
      expect(getSideBg('\u5c0f\u96e8').id === getSideBg('\u591a\u4e91').id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1848
     * @tc.name    WeatherExtension1848
     * @tc.desc    Page and side backgrounds differ for the sunny label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bgdiff_sunny', 0, () => {
      expect(getBg('\u6674').id === getSideBg('\u6674').id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1849
     * @tc.name    WeatherExtension1849
     * @tc.desc    Page and side backgrounds differ for the rain label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bgdiff_rain', 0, () => {
      expect(getBg('\u5c0f\u96e8').id === getSideBg('\u5c0f\u96e8').id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1850
     * @tc.name    WeatherExtension1850
     * @tc.desc    Page and side backgrounds differ for the cloudy label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bgdiff_cloudy', 0, () => {
      expect(getBg('\u591a\u4e91').id === getSideBg('\u591a\u4e91').id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1851
     * @tc.name    WeatherExtension1851
     * @tc.desc    Menu exposes exactly two entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5menuCount', 0, () => {
      const menu = getMenuInfo();
      expect(menu.length).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1852
     * @tc.name    WeatherExtension1852
     * @tc.desc    The first menu entry keeps its page url
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5menuTitle', 0, () => {
      const menu = getMenuInfo();
      expect(menu[0].url).assertEqual('pages/CityList');
      expect(menu[1].url).assertEqual('');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1853
     * @tc.name    WeatherExtension1853
     * @tc.desc    Update time list exposes seven slots
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5updateLen', 0, () => {
      expect(getUpdateTimes().length).assertEqual(7);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1854
     * @tc.name    WeatherExtension1854
     * @tc.desc    Update time slot 1 keeps its hour prefix
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5update0', 0, () => {
      const times: string[] = getUpdateTimes();
      expect(times[0].indexOf('1') === 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1855
     * @tc.name    WeatherExtension1855
     * @tc.desc    Update time slot 2 keeps its hour prefix
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5update1', 0, () => {
      const times: string[] = getUpdateTimes();
      expect(times[1].indexOf('2') === 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1856
     * @tc.name    WeatherExtension1856
     * @tc.desc    Update time slot 3 keeps its hour prefix
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5update2', 0, () => {
      const times: string[] = getUpdateTimes();
      expect(times[2].indexOf('4') === 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1857
     * @tc.name    WeatherExtension1857
     * @tc.desc    Update time slot 4 keeps its hour prefix
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5update3', 0, () => {
      const times: string[] = getUpdateTimes();
      expect(times[3].indexOf('6') === 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1858
     * @tc.name    WeatherExtension1858
     * @tc.desc    Update time slot 5 keeps its hour prefix
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5update4', 0, () => {
      const times: string[] = getUpdateTimes();
      expect(times[4].indexOf('12') === 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1859
     * @tc.name    WeatherExtension1859
     * @tc.desc    Update time slot 6 keeps its hour prefix
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5update5', 0, () => {
      const times: string[] = getUpdateTimes();
      expect(times[5].indexOf('24') === 0).assertTrue();
    })
  })
}
