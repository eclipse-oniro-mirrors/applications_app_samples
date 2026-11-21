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

export default function weatherInputInteractionSuite() {
  describe('WeatherInputInteractionSuite', () => {
    let m: WeatherModel = new WeatherModel();

    beforeEach(() => {
      m = new WeatherModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0001
     * @tc.name    WeatherInputInteraction001
     * @tc.desc    Weather city lookup 1 probe 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit1') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0002
     * @tc.name    WeatherInputInteraction002
     * @tc.desc    Weather city lookup 2 probe 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit2') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0003
     * @tc.name    WeatherInputInteraction003
     * @tc.desc    Weather city lookup 3 probe 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit3') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0004
     * @tc.name    WeatherInputInteraction004
     * @tc.desc    Weather city lookup 4 probe 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit4') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0005
     * @tc.name    WeatherInputInteraction005
     * @tc.desc    Weather city lookup 0 probe 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit5') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0006
     * @tc.name    WeatherInputInteraction006
     * @tc.desc    Weather city lookup 1 probe 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit6') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0007
     * @tc.name    WeatherInputInteraction007
     * @tc.desc    Weather city lookup 2 probe 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit7') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0008
     * @tc.name    WeatherInputInteraction008
     * @tc.desc    Weather city lookup 3 probe 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit8') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0009
     * @tc.name    WeatherInputInteraction009
     * @tc.desc    Weather city lookup 4 probe 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit9') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0010
     * @tc.name    WeatherInputInteraction010
     * @tc.desc    Weather city lookup 0 probe 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit10') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0011
     * @tc.name    WeatherInputInteraction011
     * @tc.desc    Weather city lookup 1 probe 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit11') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0012
     * @tc.name    WeatherInputInteraction012
     * @tc.desc    Weather city lookup 2 probe 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit12') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0013
     * @tc.name    WeatherInputInteraction013
     * @tc.desc    Weather city lookup 3 probe 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit13') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0014
     * @tc.name    WeatherInputInteraction014
     * @tc.desc    Weather city lookup 4 probe 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit14') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0015
     * @tc.name    WeatherInputInteraction015
     * @tc.desc    Weather city lookup 0 probe 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit15') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0016
     * @tc.name    WeatherInputInteraction016
     * @tc.desc    Weather city lookup 1 probe 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit16') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0017
     * @tc.name    WeatherInputInteraction017
     * @tc.desc    Weather city lookup 2 probe 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit17') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0018
     * @tc.name    WeatherInputInteraction018
     * @tc.desc    Weather city lookup 3 probe 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit18') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0019
     * @tc.name    WeatherInputInteraction019
     * @tc.desc    Weather city lookup 4 probe 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit19') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0020
     * @tc.name    WeatherInputInteraction020
     * @tc.desc    Weather city lookup 0 probe 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit20') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0021
     * @tc.name    WeatherInputInteraction021
     * @tc.desc    Weather city lookup 1 probe 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit21') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0022
     * @tc.name    WeatherInputInteraction022
     * @tc.desc    Weather city lookup 2 probe 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit22') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0023
     * @tc.name    WeatherInputInteraction023
     * @tc.desc    Weather city lookup 3 probe 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit23') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0024
     * @tc.name    WeatherInputInteraction024
     * @tc.desc    Weather city lookup 4 probe 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit24') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0025
     * @tc.name    WeatherInputInteraction025
     * @tc.desc    Weather city lookup 0 probe 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit25') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0026
     * @tc.name    WeatherInputInteraction026
     * @tc.desc    Weather city lookup 1 probe 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit26') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0027
     * @tc.name    WeatherInputInteraction027
     * @tc.desc    Weather city lookup 2 probe 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit27') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0028
     * @tc.name    WeatherInputInteraction028
     * @tc.desc    Weather city lookup 3 probe 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit28') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0029
     * @tc.name    WeatherInputInteraction029
     * @tc.desc    Weather city lookup 4 probe 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit29') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0030
     * @tc.name    WeatherInputInteraction030
     * @tc.desc    Weather city lookup 0 probe 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit30') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0031
     * @tc.name    WeatherInputInteraction031
     * @tc.desc    Weather city lookup 1 probe 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit31') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0032
     * @tc.name    WeatherInputInteraction032
     * @tc.desc    Weather city lookup 2 probe 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit32') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0033
     * @tc.name    WeatherInputInteraction033
     * @tc.desc    Weather city lookup 3 probe 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit33') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0034
     * @tc.name    WeatherInputInteraction034
     * @tc.desc    Weather city lookup 4 probe 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit34') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0035
     * @tc.name    WeatherInputInteraction035
     * @tc.desc    Weather city lookup 0 probe 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit35') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0036
     * @tc.name    WeatherInputInteraction036
     * @tc.desc    Weather city lookup 1 probe 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit36') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0037
     * @tc.name    WeatherInputInteraction037
     * @tc.desc    Weather city lookup 2 probe 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit37') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0038
     * @tc.name    WeatherInputInteraction038
     * @tc.desc    Weather city lookup 3 probe 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit38') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0039
     * @tc.name    WeatherInputInteraction039
     * @tc.desc    Weather city lookup 4 probe 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit39') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0040
     * @tc.name    WeatherInputInteraction040
     * @tc.desc    Weather city lookup 0 probe 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit40') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0041
     * @tc.name    WeatherInputInteraction041
     * @tc.desc    Weather city lookup 1 probe 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit41') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0042
     * @tc.name    WeatherInputInteraction042
     * @tc.desc    Weather city lookup 2 probe 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit42') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0043
     * @tc.name    WeatherInputInteraction043
     * @tc.desc    Weather city lookup 3 probe 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit43') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0044
     * @tc.name    WeatherInputInteraction044
     * @tc.desc    Weather city lookup 4 probe 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit44') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0045
     * @tc.name    WeatherInputInteraction045
     * @tc.desc    Weather city lookup 0 probe 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit45') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0046
     * @tc.name    WeatherInputInteraction046
     * @tc.desc    Weather city lookup 1 probe 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit46') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0047
     * @tc.name    WeatherInputInteraction047
     * @tc.desc    Weather city lookup 2 probe 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit47') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0048
     * @tc.name    WeatherInputInteraction048
     * @tc.desc    Weather city lookup 3 probe 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit48') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0049
     * @tc.name    WeatherInputInteraction049
     * @tc.desc    Weather city lookup 4 probe 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit49') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0050
     * @tc.name    WeatherInputInteraction050
     * @tc.desc    Weather city lookup 0 probe 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit50') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0051
     * @tc.name    WeatherInputInteraction051
     * @tc.desc    Weather city lookup 1 probe 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit51') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0052
     * @tc.name    WeatherInputInteraction052
     * @tc.desc    Weather city lookup 2 probe 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit52') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0053
     * @tc.name    WeatherInputInteraction053
     * @tc.desc    Weather city lookup 3 probe 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit53') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0054
     * @tc.name    WeatherInputInteraction054
     * @tc.desc    Weather city lookup 4 probe 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit54') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0055
     * @tc.name    WeatherInputInteraction055
     * @tc.desc    Weather city lookup 0 probe 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit55') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0056
     * @tc.name    WeatherInputInteraction056
     * @tc.desc    Weather city lookup 1 probe 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit56') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0057
     * @tc.name    WeatherInputInteraction057
     * @tc.desc    Weather city lookup 2 probe 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit57') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0058
     * @tc.name    WeatherInputInteraction058
     * @tc.desc    Weather city lookup 3 probe 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit58') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0059
     * @tc.name    WeatherInputInteraction059
     * @tc.desc    Weather city lookup 4 probe 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit59') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0060
     * @tc.name    WeatherInputInteraction060
     * @tc.desc    Weather city lookup 0 probe 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit60') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0061
     * @tc.name    WeatherInputInteraction061
     * @tc.desc    Weather city lookup 1 probe 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit61') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0062
     * @tc.name    WeatherInputInteraction062
     * @tc.desc    Weather city lookup 2 probe 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit62') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0063
     * @tc.name    WeatherInputInteraction063
     * @tc.desc    Weather city lookup 3 probe 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit63') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0064
     * @tc.name    WeatherInputInteraction064
     * @tc.desc    Weather city lookup 4 probe 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit64') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0065
     * @tc.name    WeatherInputInteraction065
     * @tc.desc    Weather city lookup 0 probe 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit65') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0066
     * @tc.name    WeatherInputInteraction066
     * @tc.desc    Weather city lookup 1 probe 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit66') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0067
     * @tc.name    WeatherInputInteraction067
     * @tc.desc    Weather city lookup 2 probe 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit67') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0068
     * @tc.name    WeatherInputInteraction068
     * @tc.desc    Weather city lookup 3 probe 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit68') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0069
     * @tc.name    WeatherInputInteraction069
     * @tc.desc    Weather city lookup 4 probe 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit69') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0070
     * @tc.name    WeatherInputInteraction070
     * @tc.desc    Weather city lookup 0 probe 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit70') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0071
     * @tc.name    WeatherInputInteraction071
     * @tc.desc    Weather city lookup 1 probe 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit71') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0072
     * @tc.name    WeatherInputInteraction072
     * @tc.desc    Weather city lookup 2 probe 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit72') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0073
     * @tc.name    WeatherInputInteraction073
     * @tc.desc    Weather city lookup 3 probe 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit73') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0074
     * @tc.name    WeatherInputInteraction074
     * @tc.desc    Weather city lookup 4 probe 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit74') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0075
     * @tc.name    WeatherInputInteraction075
     * @tc.desc    Weather city lookup 0 probe 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit75') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0076
     * @tc.name    WeatherInputInteraction076
     * @tc.desc    Weather city lookup 1 probe 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit76') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0077
     * @tc.name    WeatherInputInteraction077
     * @tc.desc    Weather city lookup 2 probe 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit77') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0078
     * @tc.name    WeatherInputInteraction078
     * @tc.desc    Weather city lookup 3 probe 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit78') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0079
     * @tc.name    WeatherInputInteraction079
     * @tc.desc    Weather city lookup 4 probe 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit79') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0080
     * @tc.name    WeatherInputInteraction080
     * @tc.desc    Weather city lookup 0 probe 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit80') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0081
     * @tc.name    WeatherInputInteraction081
     * @tc.desc    Weather city lookup 1 probe 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit81') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0082
     * @tc.name    WeatherInputInteraction082
     * @tc.desc    Weather city lookup 2 probe 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit82') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0083
     * @tc.name    WeatherInputInteraction083
     * @tc.desc    Weather city lookup 3 probe 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit83') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0084
     * @tc.name    WeatherInputInteraction084
     * @tc.desc    Weather city lookup 4 probe 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit84') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0085
     * @tc.name    WeatherInputInteraction085
     * @tc.desc    Weather city lookup 0 probe 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit85') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0086
     * @tc.name    WeatherInputInteraction086
     * @tc.desc    Weather city lookup 1 probe 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit86') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0087
     * @tc.name    WeatherInputInteraction087
     * @tc.desc    Weather city lookup 2 probe 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit87') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0088
     * @tc.name    WeatherInputInteraction088
     * @tc.desc    Weather city lookup 3 probe 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit88') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0089
     * @tc.name    WeatherInputInteraction089
     * @tc.desc    Weather city lookup 4 probe 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit89') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0090
     * @tc.name    WeatherInputInteraction090
     * @tc.desc    Weather city lookup 0 probe 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit90') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0091
     * @tc.name    WeatherInputInteraction091
     * @tc.desc    Weather city lookup 1 probe 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit91') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0092
     * @tc.name    WeatherInputInteraction092
     * @tc.desc    Weather city lookup 2 probe 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit92') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0093
     * @tc.name    WeatherInputInteraction093
     * @tc.desc    Weather city lookup 3 probe 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit93') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0094
     * @tc.name    WeatherInputInteraction094
     * @tc.desc    Weather city lookup 4 probe 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit94') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0095
     * @tc.name    WeatherInputInteraction095
     * @tc.desc    Weather city lookup 0 probe 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit95') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0096
     * @tc.name    WeatherInputInteraction096
     * @tc.desc    Weather city lookup 1 probe 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit96') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0097
     * @tc.name    WeatherInputInteraction097
     * @tc.desc    Weather city lookup 2 probe 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit97') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0098
     * @tc.name    WeatherInputInteraction098
     * @tc.desc    Weather city lookup 3 probe 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit98') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0099
     * @tc.name    WeatherInputInteraction099
     * @tc.desc    Weather city lookup 4 probe 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit99') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0100
     * @tc.name    WeatherInputInteraction100
     * @tc.desc    Weather city lookup 0 probe 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit100') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0101
     * @tc.name    WeatherInputInteraction101
     * @tc.desc    Weather city lookup 1 probe 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit101') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0102
     * @tc.name    WeatherInputInteraction102
     * @tc.desc    Weather city lookup 2 probe 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit102') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0103
     * @tc.name    WeatherInputInteraction103
     * @tc.desc    Weather city lookup 3 probe 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit103') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0104
     * @tc.name    WeatherInputInteraction104
     * @tc.desc    Weather city lookup 4 probe 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit104') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0105
     * @tc.name    WeatherInputInteraction105
     * @tc.desc    Weather city lookup 0 probe 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit105') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0106
     * @tc.name    WeatherInputInteraction106
     * @tc.desc    Weather city lookup 1 probe 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit106') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0107
     * @tc.name    WeatherInputInteraction107
     * @tc.desc    Weather city lookup 2 probe 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit107') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0108
     * @tc.name    WeatherInputInteraction108
     * @tc.desc    Weather city lookup 3 probe 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit108') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0109
     * @tc.name    WeatherInputInteraction109
     * @tc.desc    Weather city lookup 4 probe 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit109') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0110
     * @tc.name    WeatherInputInteraction110
     * @tc.desc    Weather city lookup 0 probe 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit110') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0111
     * @tc.name    WeatherInputInteraction111
     * @tc.desc    Weather city lookup 1 probe 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit111') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0112
     * @tc.name    WeatherInputInteraction112
     * @tc.desc    Weather city lookup 2 probe 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit112') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0113
     * @tc.name    WeatherInputInteraction113
     * @tc.desc    Weather city lookup 3 probe 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit113') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0114
     * @tc.name    WeatherInputInteraction114
     * @tc.desc    Weather city lookup 4 probe 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit114') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0115
     * @tc.name    WeatherInputInteraction115
     * @tc.desc    Weather city lookup 0 probe 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit115') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0116
     * @tc.name    WeatherInputInteraction116
     * @tc.desc    Weather city lookup 1 probe 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit116') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0117
     * @tc.name    WeatherInputInteraction117
     * @tc.desc    Weather city lookup 2 probe 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit117') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0118
     * @tc.name    WeatherInputInteraction118
     * @tc.desc    Weather city lookup 3 probe 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit118') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0119
     * @tc.name    WeatherInputInteraction119
     * @tc.desc    Weather city lookup 4 probe 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit119') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0120
     * @tc.name    WeatherInputInteraction120
     * @tc.desc    Weather city lookup 0 probe 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit120') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0121
     * @tc.name    WeatherInputInteraction121
     * @tc.desc    Weather city lookup 1 probe 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit121') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0122
     * @tc.name    WeatherInputInteraction122
     * @tc.desc    Weather city lookup 2 probe 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit122') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0123
     * @tc.name    WeatherInputInteraction123
     * @tc.desc    Weather city lookup 3 probe 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit123') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0124
     * @tc.name    WeatherInputInteraction124
     * @tc.desc    Weather city lookup 4 probe 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit124') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0125
     * @tc.name    WeatherInputInteraction125
     * @tc.desc    Weather city lookup 0 probe 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit125') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0126
     * @tc.name    WeatherInputInteraction126
     * @tc.desc    Weather city lookup 1 probe 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit126') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0127
     * @tc.name    WeatherInputInteraction127
     * @tc.desc    Weather city lookup 2 probe 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit127') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0128
     * @tc.name    WeatherInputInteraction128
     * @tc.desc    Weather city lookup 3 probe 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit128') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0129
     * @tc.name    WeatherInputInteraction129
     * @tc.desc    Weather city lookup 4 probe 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit129') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0130
     * @tc.name    WeatherInputInteraction130
     * @tc.desc    Weather city lookup 0 probe 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit130') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0131
     * @tc.name    WeatherInputInteraction131
     * @tc.desc    Weather city lookup 1 probe 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit131') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0132
     * @tc.name    WeatherInputInteraction132
     * @tc.desc    Weather city lookup 2 probe 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit132') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0133
     * @tc.name    WeatherInputInteraction133
     * @tc.desc    Weather city lookup 3 probe 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit133') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0134
     * @tc.name    WeatherInputInteraction134
     * @tc.desc    Weather city lookup 4 probe 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit134') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0135
     * @tc.name    WeatherInputInteraction135
     * @tc.desc    Weather city lookup 0 probe 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit135') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0136
     * @tc.name    WeatherInputInteraction136
     * @tc.desc    Weather city lookup 1 probe 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit136') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0137
     * @tc.name    WeatherInputInteraction137
     * @tc.desc    Weather city lookup 2 probe 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit137') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0138
     * @tc.name    WeatherInputInteraction138
     * @tc.desc    Weather city lookup 3 probe 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit138') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0139
     * @tc.name    WeatherInputInteraction139
     * @tc.desc    Weather city lookup 4 probe 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit139') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0140
     * @tc.name    WeatherInputInteraction140
     * @tc.desc    Weather city lookup 0 probe 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit140') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0141
     * @tc.name    WeatherInputInteraction141
     * @tc.desc    Weather city lookup 1 probe 141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit141') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0142
     * @tc.name    WeatherInputInteraction142
     * @tc.desc    Weather city lookup 2 probe 142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit142') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0143
     * @tc.name    WeatherInputInteraction143
     * @tc.desc    Weather city lookup 3 probe 143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit143') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0144
     * @tc.name    WeatherInputInteraction144
     * @tc.desc    Weather city lookup 4 probe 144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit144') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0145
     * @tc.name    WeatherInputInteraction145
     * @tc.desc    Weather city lookup 0 probe 145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit145') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0146
     * @tc.name    WeatherInputInteraction146
     * @tc.desc    Weather city lookup 1 probe 146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit146') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0147
     * @tc.name    WeatherInputInteraction147
     * @tc.desc    Weather city lookup 2 probe 147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit147') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0148
     * @tc.name    WeatherInputInteraction148
     * @tc.desc    Weather city lookup 3 probe 148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit148') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0149
     * @tc.name    WeatherInputInteraction149
     * @tc.desc    Weather city lookup 4 probe 149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit149') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0150
     * @tc.name    WeatherInputInteraction150
     * @tc.desc    Weather city lookup 0 probe 150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit150') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0151
     * @tc.name    WeatherInputInteraction151
     * @tc.desc    Weather city lookup 1 probe 151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit151') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0152
     * @tc.name    WeatherInputInteraction152
     * @tc.desc    Weather city lookup 2 probe 152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit152') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0153
     * @tc.name    WeatherInputInteraction153
     * @tc.desc    Weather city lookup 3 probe 153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit153') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0154
     * @tc.name    WeatherInputInteraction154
     * @tc.desc    Weather city lookup 4 probe 154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit154') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0155
     * @tc.name    WeatherInputInteraction155
     * @tc.desc    Weather city lookup 0 probe 155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit155') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0156
     * @tc.name    WeatherInputInteraction156
     * @tc.desc    Weather city lookup 1 probe 156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit156') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0157
     * @tc.name    WeatherInputInteraction157
     * @tc.desc    Weather city lookup 2 probe 157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit157') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0158
     * @tc.name    WeatherInputInteraction158
     * @tc.desc    Weather city lookup 3 probe 158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit158') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0159
     * @tc.name    WeatherInputInteraction159
     * @tc.desc    Weather city lookup 4 probe 159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit159') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0160
     * @tc.name    WeatherInputInteraction160
     * @tc.desc    Weather city lookup 0 probe 160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit160') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0161
     * @tc.name    WeatherInputInteraction161
     * @tc.desc    Weather city lookup 1 probe 161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit161') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0162
     * @tc.name    WeatherInputInteraction162
     * @tc.desc    Weather city lookup 2 probe 162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit162') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0163
     * @tc.name    WeatherInputInteraction163
     * @tc.desc    Weather city lookup 3 probe 163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit163') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0164
     * @tc.name    WeatherInputInteraction164
     * @tc.desc    Weather city lookup 4 probe 164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit164') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0165
     * @tc.name    WeatherInputInteraction165
     * @tc.desc    Weather city lookup 0 probe 165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit165') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0166
     * @tc.name    WeatherInputInteraction166
     * @tc.desc    Weather city lookup 1 probe 166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit166') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0167
     * @tc.name    WeatherInputInteraction167
     * @tc.desc    Weather city lookup 2 probe 167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherInputInteraction167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const cities = m.getCities();
      const city = cities[idx];
      expect(m.getCity(city.name) !== undefined).assertEqual(true);
      expect(m.getData(idx)?.name).assertEqual(city.name);
      expect(m.getCity('nohit167') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

