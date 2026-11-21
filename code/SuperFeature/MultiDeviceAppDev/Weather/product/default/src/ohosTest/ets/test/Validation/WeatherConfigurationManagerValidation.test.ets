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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { WeatherModel } from '../Shared/WeatherModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[WeatherTests]';

export default function weatherConfigurationManagerValidationSuite() {
  describe('WeatherConfigurationManagerValidationSuite', () => {
    let m: WeatherModel = new WeatherModel();

    beforeEach(() => {
      m = new WeatherModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0997
     * @tc.name    WeatherConfigurationManagerValidation997
     * @tc.desc    Weather temperature validity for -31 probe 997
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation997', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -31;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit997') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0998
     * @tc.name    WeatherConfigurationManagerValidation998
     * @tc.desc    Weather AQI level for 166 probe 998
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation998', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 166;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit998') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0999
     * @tc.name    WeatherConfigurationManagerValidation999
     * @tc.desc    Weather humidity validity for 103 probe 999
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation999', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 103;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit999') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1000
     * @tc.name    WeatherConfigurationManagerValidation1000
     * @tc.desc    Weather temperature validity for -28 probe 1000
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1000', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -28;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1000') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1001
     * @tc.name    WeatherConfigurationManagerValidation1001
     * @tc.desc    Weather AQI level for 17 probe 1001
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 17;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1001') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1002
     * @tc.name    WeatherConfigurationManagerValidation1002
     * @tc.desc    Weather humidity validity for 124 probe 1002
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 124;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1002') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1003
     * @tc.name    WeatherConfigurationManagerValidation1003
     * @tc.desc    Weather temperature validity for -25 probe 1003
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -25;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1003') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1004
     * @tc.name    WeatherConfigurationManagerValidation1004
     * @tc.desc    Weather AQI level for 68 probe 1004
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 68;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1004') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1005
     * @tc.name    WeatherConfigurationManagerValidation1005
     * @tc.desc    Weather humidity validity for 15 probe 1005
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 15;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1005') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1006
     * @tc.name    WeatherConfigurationManagerValidation1006
     * @tc.desc    Weather temperature validity for -22 probe 1006
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -22;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1006') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1007
     * @tc.name    WeatherConfigurationManagerValidation1007
     * @tc.desc    Weather AQI level for 119 probe 1007
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 119;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1007') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1008
     * @tc.name    WeatherConfigurationManagerValidation1008
     * @tc.desc    Weather humidity validity for 36 probe 1008
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 36;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1008') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1009
     * @tc.name    WeatherConfigurationManagerValidation1009
     * @tc.desc    Weather temperature validity for -19 probe 1009
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -19;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1009') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1010
     * @tc.name    WeatherConfigurationManagerValidation1010
     * @tc.desc    Weather AQI level for 170 probe 1010
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 170;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1010') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1011
     * @tc.name    WeatherConfigurationManagerValidation1011
     * @tc.desc    Weather humidity validity for 57 probe 1011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 57;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1011') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1012
     * @tc.name    WeatherConfigurationManagerValidation1012
     * @tc.desc    Weather temperature validity for -16 probe 1012
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -16;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1012') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1013
     * @tc.name    WeatherConfigurationManagerValidation1013
     * @tc.desc    Weather AQI level for 21 probe 1013
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 21;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1013') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1014
     * @tc.name    WeatherConfigurationManagerValidation1014
     * @tc.desc    Weather humidity validity for 78 probe 1014
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 78;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1014') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1015
     * @tc.name    WeatherConfigurationManagerValidation1015
     * @tc.desc    Weather temperature validity for -13 probe 1015
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -13;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1015') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1016
     * @tc.name    WeatherConfigurationManagerValidation1016
     * @tc.desc    Weather AQI level for 72 probe 1016
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 72;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1016') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1017
     * @tc.name    WeatherConfigurationManagerValidation1017
     * @tc.desc    Weather humidity validity for 99 probe 1017
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 99;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1017') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1018
     * @tc.name    WeatherConfigurationManagerValidation1018
     * @tc.desc    Weather temperature validity for -10 probe 1018
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -10;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1018') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1019
     * @tc.name    WeatherConfigurationManagerValidation1019
     * @tc.desc    Weather AQI level for 123 probe 1019
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 123;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1019') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1020
     * @tc.name    WeatherConfigurationManagerValidation1020
     * @tc.desc    Weather humidity validity for 120 probe 1020
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 120;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1020') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1021
     * @tc.name    WeatherConfigurationManagerValidation1021
     * @tc.desc    Weather temperature validity for -7 probe 1021
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -7;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1021') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1022
     * @tc.name    WeatherConfigurationManagerValidation1022
     * @tc.desc    Weather AQI level for 174 probe 1022
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 174;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1022') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1023
     * @tc.name    WeatherConfigurationManagerValidation1023
     * @tc.desc    Weather humidity validity for 11 probe 1023
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 11;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1023') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1024
     * @tc.name    WeatherConfigurationManagerValidation1024
     * @tc.desc    Weather temperature validity for -4 probe 1024
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -4;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1024') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1025
     * @tc.name    WeatherConfigurationManagerValidation1025
     * @tc.desc    Weather AQI level for 25 probe 1025
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 25;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1025') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1026
     * @tc.name    WeatherConfigurationManagerValidation1026
     * @tc.desc    Weather humidity validity for 32 probe 1026
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 32;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1026') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1027
     * @tc.name    WeatherConfigurationManagerValidation1027
     * @tc.desc    Weather temperature validity for -1 probe 1027
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -1;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1027') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1028
     * @tc.name    WeatherConfigurationManagerValidation1028
     * @tc.desc    Weather AQI level for 76 probe 1028
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 76;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1028') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1029
     * @tc.name    WeatherConfigurationManagerValidation1029
     * @tc.desc    Weather humidity validity for 53 probe 1029
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 53;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1029') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1030
     * @tc.name    WeatherConfigurationManagerValidation1030
     * @tc.desc    Weather temperature validity for 2 probe 1030
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 2;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1030') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1031
     * @tc.name    WeatherConfigurationManagerValidation1031
     * @tc.desc    Weather AQI level for 127 probe 1031
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 127;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1031') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1032
     * @tc.name    WeatherConfigurationManagerValidation1032
     * @tc.desc    Weather humidity validity for 74 probe 1032
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 74;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1032') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1033
     * @tc.name    WeatherConfigurationManagerValidation1033
     * @tc.desc    Weather temperature validity for 5 probe 1033
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 5;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1033') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1034
     * @tc.name    WeatherConfigurationManagerValidation1034
     * @tc.desc    Weather AQI level for 178 probe 1034
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 178;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1034') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1035
     * @tc.name    WeatherConfigurationManagerValidation1035
     * @tc.desc    Weather humidity validity for 95 probe 1035
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 95;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1035') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1036
     * @tc.name    WeatherConfigurationManagerValidation1036
     * @tc.desc    Weather temperature validity for 8 probe 1036
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 8;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1036') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1037
     * @tc.name    WeatherConfigurationManagerValidation1037
     * @tc.desc    Weather AQI level for 29 probe 1037
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 29;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1037') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1038
     * @tc.name    WeatherConfigurationManagerValidation1038
     * @tc.desc    Weather humidity validity for 116 probe 1038
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 116;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1038') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1039
     * @tc.name    WeatherConfigurationManagerValidation1039
     * @tc.desc    Weather temperature validity for 11 probe 1039
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 11;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1039') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1040
     * @tc.name    WeatherConfigurationManagerValidation1040
     * @tc.desc    Weather AQI level for 80 probe 1040
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 80;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1040') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1041
     * @tc.name    WeatherConfigurationManagerValidation1041
     * @tc.desc    Weather humidity validity for 7 probe 1041
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 7;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1041') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1042
     * @tc.name    WeatherConfigurationManagerValidation1042
     * @tc.desc    Weather temperature validity for 14 probe 1042
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 14;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1042') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1043
     * @tc.name    WeatherConfigurationManagerValidation1043
     * @tc.desc    Weather AQI level for 131 probe 1043
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 131;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1043') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1044
     * @tc.name    WeatherConfigurationManagerValidation1044
     * @tc.desc    Weather humidity validity for 28 probe 1044
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 28;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1044') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1045
     * @tc.name    WeatherConfigurationManagerValidation1045
     * @tc.desc    Weather temperature validity for 17 probe 1045
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 17;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1045') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1046
     * @tc.name    WeatherConfigurationManagerValidation1046
     * @tc.desc    Weather AQI level for 182 probe 1046
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 182;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1046') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1047
     * @tc.name    WeatherConfigurationManagerValidation1047
     * @tc.desc    Weather humidity validity for 49 probe 1047
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 49;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1047') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1048
     * @tc.name    WeatherConfigurationManagerValidation1048
     * @tc.desc    Weather temperature validity for 20 probe 1048
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 20;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1048') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1049
     * @tc.name    WeatherConfigurationManagerValidation1049
     * @tc.desc    Weather AQI level for 33 probe 1049
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 33;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1049') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1050
     * @tc.name    WeatherConfigurationManagerValidation1050
     * @tc.desc    Weather humidity validity for 70 probe 1050
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 70;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1050') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1051
     * @tc.name    WeatherConfigurationManagerValidation1051
     * @tc.desc    Weather temperature validity for 23 probe 1051
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 23;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1051') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1052
     * @tc.name    WeatherConfigurationManagerValidation1052
     * @tc.desc    Weather AQI level for 84 probe 1052
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 84;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1052') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1053
     * @tc.name    WeatherConfigurationManagerValidation1053
     * @tc.desc    Weather humidity validity for 91 probe 1053
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 91;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1053') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1054
     * @tc.name    WeatherConfigurationManagerValidation1054
     * @tc.desc    Weather temperature validity for 26 probe 1054
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 26;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1054') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1055
     * @tc.name    WeatherConfigurationManagerValidation1055
     * @tc.desc    Weather AQI level for 135 probe 1055
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 135;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1055') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1056
     * @tc.name    WeatherConfigurationManagerValidation1056
     * @tc.desc    Weather humidity validity for 112 probe 1056
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 112;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1056') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1057
     * @tc.name    WeatherConfigurationManagerValidation1057
     * @tc.desc    Weather temperature validity for 29 probe 1057
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 29;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1057') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1058
     * @tc.name    WeatherConfigurationManagerValidation1058
     * @tc.desc    Weather AQI level for 186 probe 1058
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 186;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1058') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1059
     * @tc.name    WeatherConfigurationManagerValidation1059
     * @tc.desc    Weather humidity validity for 3 probe 1059
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 3;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1059') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1060
     * @tc.name    WeatherConfigurationManagerValidation1060
     * @tc.desc    Weather temperature validity for 32 probe 1060
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 32;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1060') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1061
     * @tc.name    WeatherConfigurationManagerValidation1061
     * @tc.desc    Weather AQI level for 37 probe 1061
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 37;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1061') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1062
     * @tc.name    WeatherConfigurationManagerValidation1062
     * @tc.desc    Weather humidity validity for 24 probe 1062
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 24;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1062') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1063
     * @tc.name    WeatherConfigurationManagerValidation1063
     * @tc.desc    Weather temperature validity for 35 probe 1063
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 35;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1063') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1064
     * @tc.name    WeatherConfigurationManagerValidation1064
     * @tc.desc    Weather AQI level for 88 probe 1064
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 88;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1064') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1065
     * @tc.name    WeatherConfigurationManagerValidation1065
     * @tc.desc    Weather humidity validity for 45 probe 1065
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 45;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1065') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1066
     * @tc.name    WeatherConfigurationManagerValidation1066
     * @tc.desc    Weather temperature validity for 38 probe 1066
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 38;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1066') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1067
     * @tc.name    WeatherConfigurationManagerValidation1067
     * @tc.desc    Weather AQI level for 139 probe 1067
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 139;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1067') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1068
     * @tc.name    WeatherConfigurationManagerValidation1068
     * @tc.desc    Weather humidity validity for 66 probe 1068
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 66;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1068') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1069
     * @tc.name    WeatherConfigurationManagerValidation1069
     * @tc.desc    Weather temperature validity for 41 probe 1069
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 41;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1069') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1070
     * @tc.name    WeatherConfigurationManagerValidation1070
     * @tc.desc    Weather AQI level for 190 probe 1070
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 190;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1070') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1071
     * @tc.name    WeatherConfigurationManagerValidation1071
     * @tc.desc    Weather humidity validity for 87 probe 1071
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 87;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1071') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1072
     * @tc.name    WeatherConfigurationManagerValidation1072
     * @tc.desc    Weather temperature validity for 44 probe 1072
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 44;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1072') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1073
     * @tc.name    WeatherConfigurationManagerValidation1073
     * @tc.desc    Weather AQI level for 41 probe 1073
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 41;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1073') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1074
     * @tc.name    WeatherConfigurationManagerValidation1074
     * @tc.desc    Weather humidity validity for 108 probe 1074
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 108;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1074') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1075
     * @tc.name    WeatherConfigurationManagerValidation1075
     * @tc.desc    Weather temperature validity for 47 probe 1075
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 47;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1075') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1076
     * @tc.name    WeatherConfigurationManagerValidation1076
     * @tc.desc    Weather AQI level for 92 probe 1076
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 92;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1076') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1077
     * @tc.name    WeatherConfigurationManagerValidation1077
     * @tc.desc    Weather humidity validity for 129 probe 1077
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 129;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1077') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1078
     * @tc.name    WeatherConfigurationManagerValidation1078
     * @tc.desc    Weather temperature validity for 50 probe 1078
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 50;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1078') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1079
     * @tc.name    WeatherConfigurationManagerValidation1079
     * @tc.desc    Weather AQI level for 143 probe 1079
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 143;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1079') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1080
     * @tc.name    WeatherConfigurationManagerValidation1080
     * @tc.desc    Weather humidity validity for 20 probe 1080
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 20;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1080') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1081
     * @tc.name    WeatherConfigurationManagerValidation1081
     * @tc.desc    Weather temperature validity for 53 probe 1081
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 53;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1081') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1082
     * @tc.name    WeatherConfigurationManagerValidation1082
     * @tc.desc    Weather AQI level for 194 probe 1082
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 194;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1082') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1083
     * @tc.name    WeatherConfigurationManagerValidation1083
     * @tc.desc    Weather humidity validity for 41 probe 1083
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 41;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1083') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1084
     * @tc.name    WeatherConfigurationManagerValidation1084
     * @tc.desc    Weather temperature validity for 56 probe 1084
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 56;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1084') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1085
     * @tc.name    WeatherConfigurationManagerValidation1085
     * @tc.desc    Weather AQI level for 45 probe 1085
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 45;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1085') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1086
     * @tc.name    WeatherConfigurationManagerValidation1086
     * @tc.desc    Weather humidity validity for 62 probe 1086
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 62;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1086') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1087
     * @tc.name    WeatherConfigurationManagerValidation1087
     * @tc.desc    Weather temperature validity for 59 probe 1087
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 59;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1087') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1088
     * @tc.name    WeatherConfigurationManagerValidation1088
     * @tc.desc    Weather AQI level for 96 probe 1088
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 96;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1088') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1089
     * @tc.name    WeatherConfigurationManagerValidation1089
     * @tc.desc    Weather humidity validity for 83 probe 1089
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 83;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1089') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1090
     * @tc.name    WeatherConfigurationManagerValidation1090
     * @tc.desc    Weather temperature validity for -59 probe 1090
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -59;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1090') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1091
     * @tc.name    WeatherConfigurationManagerValidation1091
     * @tc.desc    Weather AQI level for 147 probe 1091
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 147;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1091') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1092
     * @tc.name    WeatherConfigurationManagerValidation1092
     * @tc.desc    Weather humidity validity for 104 probe 1092
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 104;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1092') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1093
     * @tc.name    WeatherConfigurationManagerValidation1093
     * @tc.desc    Weather temperature validity for -56 probe 1093
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -56;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1093') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1094
     * @tc.name    WeatherConfigurationManagerValidation1094
     * @tc.desc    Weather AQI level for 198 probe 1094
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 198;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1094') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1095
     * @tc.name    WeatherConfigurationManagerValidation1095
     * @tc.desc    Weather humidity validity for 125 probe 1095
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 125;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1095') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1096
     * @tc.name    WeatherConfigurationManagerValidation1096
     * @tc.desc    Weather temperature validity for -53 probe 1096
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -53;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1096') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1097
     * @tc.name    WeatherConfigurationManagerValidation1097
     * @tc.desc    Weather AQI level for 49 probe 1097
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 49;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1097') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1098
     * @tc.name    WeatherConfigurationManagerValidation1098
     * @tc.desc    Weather humidity validity for 16 probe 1098
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 16;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1098') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1099
     * @tc.name    WeatherConfigurationManagerValidation1099
     * @tc.desc    Weather temperature validity for -50 probe 1099
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -50;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1099') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1100
     * @tc.name    WeatherConfigurationManagerValidation1100
     * @tc.desc    Weather AQI level for 100 probe 1100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 100;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1100') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1101
     * @tc.name    WeatherConfigurationManagerValidation1101
     * @tc.desc    Weather humidity validity for 37 probe 1101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 37;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1101') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1102
     * @tc.name    WeatherConfigurationManagerValidation1102
     * @tc.desc    Weather temperature validity for -47 probe 1102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -47;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1102') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1103
     * @tc.name    WeatherConfigurationManagerValidation1103
     * @tc.desc    Weather AQI level for 151 probe 1103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherConfigurationManagerValidation1103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 151;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1103') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
