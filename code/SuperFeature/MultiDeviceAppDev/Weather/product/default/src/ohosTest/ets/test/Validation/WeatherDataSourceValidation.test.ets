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

export default function weatherDataSourceValidationSuite() {
  describe('WeatherDataSourceValidationSuite', () => {
    let m: WeatherModel = new WeatherModel();

    beforeEach(() => {
      m = new WeatherModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1159
     * @tc.name    WeatherDataSourceValidation1159
     * @tc.desc    Weather temperature validity for 10 probe 1159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 10;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1159') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1160
     * @tc.name    WeatherDataSourceValidation1160
     * @tc.desc    Weather AQI level for 120 probe 1160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 120;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1160') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1161
     * @tc.name    WeatherDataSourceValidation1161
     * @tc.desc    Weather humidity validity for 67 probe 1161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 67;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1161') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1162
     * @tc.name    WeatherDataSourceValidation1162
     * @tc.desc    Weather temperature validity for 13 probe 1162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 13;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1162') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1163
     * @tc.name    WeatherDataSourceValidation1163
     * @tc.desc    Weather AQI level for 171 probe 1163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 171;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1163') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1164
     * @tc.name    WeatherDataSourceValidation1164
     * @tc.desc    Weather humidity validity for 88 probe 1164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 88;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1164') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1165
     * @tc.name    WeatherDataSourceValidation1165
     * @tc.desc    Weather temperature validity for 16 probe 1165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 16;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1165') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1166
     * @tc.name    WeatherDataSourceValidation1166
     * @tc.desc    Weather AQI level for 22 probe 1166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 22;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1166') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1167
     * @tc.name    WeatherDataSourceValidation1167
     * @tc.desc    Weather humidity validity for 109 probe 1167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 109;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1167') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1168
     * @tc.name    WeatherDataSourceValidation1168
     * @tc.desc    Weather temperature validity for 19 probe 1168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 19;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1168') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1169
     * @tc.name    WeatherDataSourceValidation1169
     * @tc.desc    Weather AQI level for 73 probe 1169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 73;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1169') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1170
     * @tc.name    WeatherDataSourceValidation1170
     * @tc.desc    Weather humidity validity for 0 probe 1170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 0;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1170') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1171
     * @tc.name    WeatherDataSourceValidation1171
     * @tc.desc    Weather temperature validity for 22 probe 1171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 22;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1171') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1172
     * @tc.name    WeatherDataSourceValidation1172
     * @tc.desc    Weather AQI level for 124 probe 1172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 124;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1172') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1173
     * @tc.name    WeatherDataSourceValidation1173
     * @tc.desc    Weather humidity validity for 21 probe 1173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 21;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1173') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1174
     * @tc.name    WeatherDataSourceValidation1174
     * @tc.desc    Weather temperature validity for 25 probe 1174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 25;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1174') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1175
     * @tc.name    WeatherDataSourceValidation1175
     * @tc.desc    Weather AQI level for 175 probe 1175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 175;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1175') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1176
     * @tc.name    WeatherDataSourceValidation1176
     * @tc.desc    Weather humidity validity for 42 probe 1176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 42;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1176') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1177
     * @tc.name    WeatherDataSourceValidation1177
     * @tc.desc    Weather temperature validity for 28 probe 1177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 28;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1177') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1178
     * @tc.name    WeatherDataSourceValidation1178
     * @tc.desc    Weather AQI level for 26 probe 1178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 26;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1178') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1179
     * @tc.name    WeatherDataSourceValidation1179
     * @tc.desc    Weather humidity validity for 63 probe 1179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 63;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1179') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1180
     * @tc.name    WeatherDataSourceValidation1180
     * @tc.desc    Weather temperature validity for 31 probe 1180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 31;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1180') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1181
     * @tc.name    WeatherDataSourceValidation1181
     * @tc.desc    Weather AQI level for 77 probe 1181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 77;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1181') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1182
     * @tc.name    WeatherDataSourceValidation1182
     * @tc.desc    Weather humidity validity for 84 probe 1182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 84;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1182') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1183
     * @tc.name    WeatherDataSourceValidation1183
     * @tc.desc    Weather temperature validity for 34 probe 1183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 34;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1183') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1184
     * @tc.name    WeatherDataSourceValidation1184
     * @tc.desc    Weather AQI level for 128 probe 1184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 128;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1184') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1185
     * @tc.name    WeatherDataSourceValidation1185
     * @tc.desc    Weather humidity validity for 105 probe 1185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 105;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1185') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1186
     * @tc.name    WeatherDataSourceValidation1186
     * @tc.desc    Weather temperature validity for 37 probe 1186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 37;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1186') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1187
     * @tc.name    WeatherDataSourceValidation1187
     * @tc.desc    Weather AQI level for 179 probe 1187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 179;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1187') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1188
     * @tc.name    WeatherDataSourceValidation1188
     * @tc.desc    Weather humidity validity for 126 probe 1188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 126;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1188') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1189
     * @tc.name    WeatherDataSourceValidation1189
     * @tc.desc    Weather temperature validity for 40 probe 1189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 40;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1189') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1190
     * @tc.name    WeatherDataSourceValidation1190
     * @tc.desc    Weather AQI level for 30 probe 1190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 30;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1190') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1191
     * @tc.name    WeatherDataSourceValidation1191
     * @tc.desc    Weather humidity validity for 17 probe 1191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 17;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1191') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1192
     * @tc.name    WeatherDataSourceValidation1192
     * @tc.desc    Weather temperature validity for 43 probe 1192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 43;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1192') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1193
     * @tc.name    WeatherDataSourceValidation1193
     * @tc.desc    Weather AQI level for 81 probe 1193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 81;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1193') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1194
     * @tc.name    WeatherDataSourceValidation1194
     * @tc.desc    Weather humidity validity for 38 probe 1194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 38;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1194') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1195
     * @tc.name    WeatherDataSourceValidation1195
     * @tc.desc    Weather temperature validity for 46 probe 1195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 46;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1195') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1196
     * @tc.name    WeatherDataSourceValidation1196
     * @tc.desc    Weather AQI level for 132 probe 1196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 132;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1196') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1197
     * @tc.name    WeatherDataSourceValidation1197
     * @tc.desc    Weather humidity validity for 59 probe 1197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 59;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1197') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1198
     * @tc.name    WeatherDataSourceValidation1198
     * @tc.desc    Weather temperature validity for 49 probe 1198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 49;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1198') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1199
     * @tc.name    WeatherDataSourceValidation1199
     * @tc.desc    Weather AQI level for 183 probe 1199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 183;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1199') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1200
     * @tc.name    WeatherDataSourceValidation1200
     * @tc.desc    Weather humidity validity for 80 probe 1200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 80;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1200') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1201
     * @tc.name    WeatherDataSourceValidation1201
     * @tc.desc    Weather temperature validity for 52 probe 1201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 52;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1201') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1202
     * @tc.name    WeatherDataSourceValidation1202
     * @tc.desc    Weather AQI level for 34 probe 1202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 34;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1202') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1203
     * @tc.name    WeatherDataSourceValidation1203
     * @tc.desc    Weather humidity validity for 101 probe 1203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 101;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1203') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1204
     * @tc.name    WeatherDataSourceValidation1204
     * @tc.desc    Weather temperature validity for 55 probe 1204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 55;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1204') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1205
     * @tc.name    WeatherDataSourceValidation1205
     * @tc.desc    Weather AQI level for 85 probe 1205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 85;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1205') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1206
     * @tc.name    WeatherDataSourceValidation1206
     * @tc.desc    Weather humidity validity for 122 probe 1206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 122;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1206') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1207
     * @tc.name    WeatherDataSourceValidation1207
     * @tc.desc    Weather temperature validity for 58 probe 1207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = 58;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1207') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1208
     * @tc.name    WeatherDataSourceValidation1208
     * @tc.desc    Weather AQI level for 136 probe 1208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 136;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1208') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1209
     * @tc.name    WeatherDataSourceValidation1209
     * @tc.desc    Weather humidity validity for 13 probe 1209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 13;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1209') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1210
     * @tc.name    WeatherDataSourceValidation1210
     * @tc.desc    Weather temperature validity for -60 probe 1210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -60;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1210') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1211
     * @tc.name    WeatherDataSourceValidation1211
     * @tc.desc    Weather AQI level for 187 probe 1211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 187;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1211') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1212
     * @tc.name    WeatherDataSourceValidation1212
     * @tc.desc    Weather humidity validity for 34 probe 1212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 34;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1212') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1213
     * @tc.name    WeatherDataSourceValidation1213
     * @tc.desc    Weather temperature validity for -57 probe 1213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -57;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1213') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1214
     * @tc.name    WeatherDataSourceValidation1214
     * @tc.desc    Weather AQI level for 38 probe 1214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 38;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1214') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1215
     * @tc.name    WeatherDataSourceValidation1215
     * @tc.desc    Weather humidity validity for 55 probe 1215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 55;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1215') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1216
     * @tc.name    WeatherDataSourceValidation1216
     * @tc.desc    Weather temperature validity for -54 probe 1216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -54;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1216') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1217
     * @tc.name    WeatherDataSourceValidation1217
     * @tc.desc    Weather AQI level for 89 probe 1217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 89;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1217') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1218
     * @tc.name    WeatherDataSourceValidation1218
     * @tc.desc    Weather humidity validity for 76 probe 1218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 76;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1218') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1219
     * @tc.name    WeatherDataSourceValidation1219
     * @tc.desc    Weather temperature validity for -51 probe 1219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -51;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1219') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1220
     * @tc.name    WeatherDataSourceValidation1220
     * @tc.desc    Weather AQI level for 140 probe 1220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 140;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1220') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1221
     * @tc.name    WeatherDataSourceValidation1221
     * @tc.desc    Weather humidity validity for 97 probe 1221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 97;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1221') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1222
     * @tc.name    WeatherDataSourceValidation1222
     * @tc.desc    Weather temperature validity for -48 probe 1222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -48;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1222') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1223
     * @tc.name    WeatherDataSourceValidation1223
     * @tc.desc    Weather AQI level for 191 probe 1223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 191;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1223') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1224
     * @tc.name    WeatherDataSourceValidation1224
     * @tc.desc    Weather humidity validity for 118 probe 1224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 118;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1224') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1225
     * @tc.name    WeatherDataSourceValidation1225
     * @tc.desc    Weather temperature validity for -45 probe 1225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -45;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1225') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1226
     * @tc.name    WeatherDataSourceValidation1226
     * @tc.desc    Weather AQI level for 42 probe 1226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 42;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1226') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1227
     * @tc.name    WeatherDataSourceValidation1227
     * @tc.desc    Weather humidity validity for 9 probe 1227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 9;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1227') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1228
     * @tc.name    WeatherDataSourceValidation1228
     * @tc.desc    Weather temperature validity for -42 probe 1228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -42;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1228') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1229
     * @tc.name    WeatherDataSourceValidation1229
     * @tc.desc    Weather AQI level for 93 probe 1229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 93;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1229') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1230
     * @tc.name    WeatherDataSourceValidation1230
     * @tc.desc    Weather humidity validity for 30 probe 1230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 30;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1230') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1231
     * @tc.name    WeatherDataSourceValidation1231
     * @tc.desc    Weather temperature validity for -39 probe 1231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -39;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1231') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1232
     * @tc.name    WeatherDataSourceValidation1232
     * @tc.desc    Weather AQI level for 144 probe 1232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 144;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1232') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1233
     * @tc.name    WeatherDataSourceValidation1233
     * @tc.desc    Weather humidity validity for 51 probe 1233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 51;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1233') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1234
     * @tc.name    WeatherDataSourceValidation1234
     * @tc.desc    Weather temperature validity for -36 probe 1234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -36;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1234') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1235
     * @tc.name    WeatherDataSourceValidation1235
     * @tc.desc    Weather AQI level for 195 probe 1235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 195;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1235') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1236
     * @tc.name    WeatherDataSourceValidation1236
     * @tc.desc    Weather humidity validity for 72 probe 1236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 72;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1236') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1237
     * @tc.name    WeatherDataSourceValidation1237
     * @tc.desc    Weather temperature validity for -33 probe 1237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -33;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1237') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1238
     * @tc.name    WeatherDataSourceValidation1238
     * @tc.desc    Weather AQI level for 46 probe 1238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 46;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1238') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1239
     * @tc.name    WeatherDataSourceValidation1239
     * @tc.desc    Weather humidity validity for 93 probe 1239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 93;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1239') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1240
     * @tc.name    WeatherDataSourceValidation1240
     * @tc.desc    Weather temperature validity for -30 probe 1240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -30;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1240') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1241
     * @tc.name    WeatherDataSourceValidation1241
     * @tc.desc    Weather AQI level for 97 probe 1241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 97;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1241') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1242
     * @tc.name    WeatherDataSourceValidation1242
     * @tc.desc    Weather humidity validity for 114 probe 1242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 114;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1242') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1243
     * @tc.name    WeatherDataSourceValidation1243
     * @tc.desc    Weather temperature validity for -27 probe 1243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -27;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1243') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1244
     * @tc.name    WeatherDataSourceValidation1244
     * @tc.desc    Weather AQI level for 148 probe 1244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 148;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1244') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1245
     * @tc.name    WeatherDataSourceValidation1245
     * @tc.desc    Weather humidity validity for 5 probe 1245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 5;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1245') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1246
     * @tc.name    WeatherDataSourceValidation1246
     * @tc.desc    Weather temperature validity for -24 probe 1246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -24;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1246') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1247
     * @tc.name    WeatherDataSourceValidation1247
     * @tc.desc    Weather AQI level for 199 probe 1247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 199;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1247') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1248
     * @tc.name    WeatherDataSourceValidation1248
     * @tc.desc    Weather humidity validity for 26 probe 1248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 26;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1248') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1249
     * @tc.name    WeatherDataSourceValidation1249
     * @tc.desc    Weather temperature validity for -21 probe 1249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -21;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1249') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1250
     * @tc.name    WeatherDataSourceValidation1250
     * @tc.desc    Weather AQI level for 50 probe 1250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 50;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1250') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1251
     * @tc.name    WeatherDataSourceValidation1251
     * @tc.desc    Weather humidity validity for 47 probe 1251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 47;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1251') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1252
     * @tc.name    WeatherDataSourceValidation1252
     * @tc.desc    Weather temperature validity for -18 probe 1252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -18;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1252') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1253
     * @tc.name    WeatherDataSourceValidation1253
     * @tc.desc    Weather AQI level for 101 probe 1253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 101;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1253') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1254
     * @tc.name    WeatherDataSourceValidation1254
     * @tc.desc    Weather humidity validity for 68 probe 1254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 68;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1254') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1255
     * @tc.name    WeatherDataSourceValidation1255
     * @tc.desc    Weather temperature validity for -15 probe 1255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -15;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1255') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1256
     * @tc.name    WeatherDataSourceValidation1256
     * @tc.desc    Weather AQI level for 152 probe 1256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 152;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1256') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1257
     * @tc.name    WeatherDataSourceValidation1257
     * @tc.desc    Weather humidity validity for 89 probe 1257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 89;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1257') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1258
     * @tc.name    WeatherDataSourceValidation1258
     * @tc.desc    Weather temperature validity for -12 probe 1258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -12;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1258') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1259
     * @tc.name    WeatherDataSourceValidation1259
     * @tc.desc    Weather AQI level for 3 probe 1259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 3;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1259') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1260
     * @tc.name    WeatherDataSourceValidation1260
     * @tc.desc    Weather humidity validity for 110 probe 1260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 110;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1260') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1261
     * @tc.name    WeatherDataSourceValidation1261
     * @tc.desc    Weather temperature validity for -9 probe 1261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -9;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1261') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1262
     * @tc.name    WeatherDataSourceValidation1262
     * @tc.desc    Weather AQI level for 54 probe 1262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 54;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1262') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1263
     * @tc.name    WeatherDataSourceValidation1263
     * @tc.desc    Weather humidity validity for 1 probe 1263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const humidity: number = 1;
      expect(m.isHumidityValid(humidity)).assertEqual(humidity >= 0 && humidity <= 100);
      expect(m.getCity('nohit1263') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1264
     * @tc.name    WeatherDataSourceValidation1264
     * @tc.desc    Weather temperature validity for -6 probe 1264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const temp: number = -6;
      expect(m.isTempValid(temp)).assertEqual(temp >= -50 && temp <= 60);
      expect(m.getCity('nohit1264') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_1265
     * @tc.name    WeatherDataSourceValidation1265
     * @tc.desc    Weather AQI level for 105 probe 1265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherDataSourceValidation1265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const aqi: number = 105;
      let expected: string = "moderate";
      if (aqi <= 50) { expected = "excellent"; }
      else if (aqi <= 100) { expected = "good"; }
      else if (aqi <= 150) { expected = "light"; }
      expect(m.aqiLevel(aqi)).assertEqual(expected);
      expect(m.getCity('nohit1265') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
