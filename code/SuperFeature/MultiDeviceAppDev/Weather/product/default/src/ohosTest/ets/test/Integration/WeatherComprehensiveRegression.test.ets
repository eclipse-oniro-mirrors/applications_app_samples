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

export default function weatherComprehensiveRegressionSuite() {
  describe('WeatherComprehensiveRegressionSuite', () => {
    let m: WeatherModel = new WeatherModel();

    beforeEach(() => {
      m = new WeatherModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0168
     * @tc.name    WeatherComprehensiveRegression168
     * @tc.desc    Weather hottest and coldest bounds 168 probe 168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-22)).assertEqual(-22 >= -50 && -22 <= 60);
      expect(m.getCity('nohit168') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0169
     * @tc.name    WeatherComprehensiveRegression169
     * @tc.desc    Weather hottest and coldest bounds 169 probe 169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-21)).assertEqual(-21 >= -50 && -21 <= 60);
      expect(m.getCity('nohit169') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0170
     * @tc.name    WeatherComprehensiveRegression170
     * @tc.desc    Weather hottest and coldest bounds 170 probe 170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-20)).assertEqual(-20 >= -50 && -20 <= 60);
      expect(m.getCity('nohit170') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0171
     * @tc.name    WeatherComprehensiveRegression171
     * @tc.desc    Weather hottest and coldest bounds 171 probe 171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-19)).assertEqual(-19 >= -50 && -19 <= 60);
      expect(m.getCity('nohit171') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0172
     * @tc.name    WeatherComprehensiveRegression172
     * @tc.desc    Weather hottest and coldest bounds 172 probe 172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-18)).assertEqual(-18 >= -50 && -18 <= 60);
      expect(m.getCity('nohit172') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0173
     * @tc.name    WeatherComprehensiveRegression173
     * @tc.desc    Weather hottest and coldest bounds 173 probe 173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-17)).assertEqual(-17 >= -50 && -17 <= 60);
      expect(m.getCity('nohit173') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0174
     * @tc.name    WeatherComprehensiveRegression174
     * @tc.desc    Weather hottest and coldest bounds 174 probe 174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-16)).assertEqual(-16 >= -50 && -16 <= 60);
      expect(m.getCity('nohit174') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0175
     * @tc.name    WeatherComprehensiveRegression175
     * @tc.desc    Weather hottest and coldest bounds 175 probe 175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-15)).assertEqual(-15 >= -50 && -15 <= 60);
      expect(m.getCity('nohit175') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0176
     * @tc.name    WeatherComprehensiveRegression176
     * @tc.desc    Weather hottest and coldest bounds 176 probe 176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-14)).assertEqual(-14 >= -50 && -14 <= 60);
      expect(m.getCity('nohit176') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0177
     * @tc.name    WeatherComprehensiveRegression177
     * @tc.desc    Weather hottest and coldest bounds 177 probe 177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-13)).assertEqual(-13 >= -50 && -13 <= 60);
      expect(m.getCity('nohit177') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0178
     * @tc.name    WeatherComprehensiveRegression178
     * @tc.desc    Weather hottest and coldest bounds 178 probe 178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-12)).assertEqual(-12 >= -50 && -12 <= 60);
      expect(m.getCity('nohit178') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0179
     * @tc.name    WeatherComprehensiveRegression179
     * @tc.desc    Weather hottest and coldest bounds 179 probe 179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-11)).assertEqual(-11 >= -50 && -11 <= 60);
      expect(m.getCity('nohit179') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0180
     * @tc.name    WeatherComprehensiveRegression180
     * @tc.desc    Weather hottest and coldest bounds 180 probe 180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-10)).assertEqual(-10 >= -50 && -10 <= 60);
      expect(m.getCity('nohit180') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0181
     * @tc.name    WeatherComprehensiveRegression181
     * @tc.desc    Weather hottest and coldest bounds 181 probe 181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-9)).assertEqual(-9 >= -50 && -9 <= 60);
      expect(m.getCity('nohit181') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0182
     * @tc.name    WeatherComprehensiveRegression182
     * @tc.desc    Weather hottest and coldest bounds 182 probe 182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-8)).assertEqual(-8 >= -50 && -8 <= 60);
      expect(m.getCity('nohit182') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0183
     * @tc.name    WeatherComprehensiveRegression183
     * @tc.desc    Weather hottest and coldest bounds 183 probe 183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-7)).assertEqual(-7 >= -50 && -7 <= 60);
      expect(m.getCity('nohit183') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0184
     * @tc.name    WeatherComprehensiveRegression184
     * @tc.desc    Weather hottest and coldest bounds 184 probe 184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-6)).assertEqual(-6 >= -50 && -6 <= 60);
      expect(m.getCity('nohit184') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0185
     * @tc.name    WeatherComprehensiveRegression185
     * @tc.desc    Weather hottest and coldest bounds 185 probe 185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-5)).assertEqual(-5 >= -50 && -5 <= 60);
      expect(m.getCity('nohit185') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0186
     * @tc.name    WeatherComprehensiveRegression186
     * @tc.desc    Weather hottest and coldest bounds 186 probe 186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-4)).assertEqual(-4 >= -50 && -4 <= 60);
      expect(m.getCity('nohit186') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0187
     * @tc.name    WeatherComprehensiveRegression187
     * @tc.desc    Weather hottest and coldest bounds 187 probe 187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-3)).assertEqual(-3 >= -50 && -3 <= 60);
      expect(m.getCity('nohit187') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0188
     * @tc.name    WeatherComprehensiveRegression188
     * @tc.desc    Weather hottest and coldest bounds 188 probe 188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-2)).assertEqual(-2 >= -50 && -2 <= 60);
      expect(m.getCity('nohit188') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0189
     * @tc.name    WeatherComprehensiveRegression189
     * @tc.desc    Weather hottest and coldest bounds 189 probe 189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-1)).assertEqual(-1 >= -50 && -1 <= 60);
      expect(m.getCity('nohit189') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0190
     * @tc.name    WeatherComprehensiveRegression190
     * @tc.desc    Weather hottest and coldest bounds 190 probe 190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(0)).assertEqual(0 >= -50 && 0 <= 60);
      expect(m.getCity('nohit190') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0191
     * @tc.name    WeatherComprehensiveRegression191
     * @tc.desc    Weather hottest and coldest bounds 191 probe 191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(1)).assertEqual(1 >= -50 && 1 <= 60);
      expect(m.getCity('nohit191') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0192
     * @tc.name    WeatherComprehensiveRegression192
     * @tc.desc    Weather hottest and coldest bounds 192 probe 192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(2)).assertEqual(2 >= -50 && 2 <= 60);
      expect(m.getCity('nohit192') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0193
     * @tc.name    WeatherComprehensiveRegression193
     * @tc.desc    Weather hottest and coldest bounds 193 probe 193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(3)).assertEqual(3 >= -50 && 3 <= 60);
      expect(m.getCity('nohit193') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0194
     * @tc.name    WeatherComprehensiveRegression194
     * @tc.desc    Weather hottest and coldest bounds 194 probe 194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(4)).assertEqual(4 >= -50 && 4 <= 60);
      expect(m.getCity('nohit194') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0195
     * @tc.name    WeatherComprehensiveRegression195
     * @tc.desc    Weather hottest and coldest bounds 195 probe 195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(5)).assertEqual(5 >= -50 && 5 <= 60);
      expect(m.getCity('nohit195') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0196
     * @tc.name    WeatherComprehensiveRegression196
     * @tc.desc    Weather hottest and coldest bounds 196 probe 196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(6)).assertEqual(6 >= -50 && 6 <= 60);
      expect(m.getCity('nohit196') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0197
     * @tc.name    WeatherComprehensiveRegression197
     * @tc.desc    Weather hottest and coldest bounds 197 probe 197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(7)).assertEqual(7 >= -50 && 7 <= 60);
      expect(m.getCity('nohit197') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0198
     * @tc.name    WeatherComprehensiveRegression198
     * @tc.desc    Weather hottest and coldest bounds 198 probe 198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(8)).assertEqual(8 >= -50 && 8 <= 60);
      expect(m.getCity('nohit198') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0199
     * @tc.name    WeatherComprehensiveRegression199
     * @tc.desc    Weather hottest and coldest bounds 199 probe 199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(9)).assertEqual(9 >= -50 && 9 <= 60);
      expect(m.getCity('nohit199') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0200
     * @tc.name    WeatherComprehensiveRegression200
     * @tc.desc    Weather hottest and coldest bounds 200 probe 200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(10)).assertEqual(10 >= -50 && 10 <= 60);
      expect(m.getCity('nohit200') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0201
     * @tc.name    WeatherComprehensiveRegression201
     * @tc.desc    Weather hottest and coldest bounds 201 probe 201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(11)).assertEqual(11 >= -50 && 11 <= 60);
      expect(m.getCity('nohit201') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0202
     * @tc.name    WeatherComprehensiveRegression202
     * @tc.desc    Weather hottest and coldest bounds 202 probe 202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(12)).assertEqual(12 >= -50 && 12 <= 60);
      expect(m.getCity('nohit202') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0203
     * @tc.name    WeatherComprehensiveRegression203
     * @tc.desc    Weather hottest and coldest bounds 203 probe 203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(13)).assertEqual(13 >= -50 && 13 <= 60);
      expect(m.getCity('nohit203') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0204
     * @tc.name    WeatherComprehensiveRegression204
     * @tc.desc    Weather hottest and coldest bounds 204 probe 204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(14)).assertEqual(14 >= -50 && 14 <= 60);
      expect(m.getCity('nohit204') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0205
     * @tc.name    WeatherComprehensiveRegression205
     * @tc.desc    Weather hottest and coldest bounds 205 probe 205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(15)).assertEqual(15 >= -50 && 15 <= 60);
      expect(m.getCity('nohit205') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0206
     * @tc.name    WeatherComprehensiveRegression206
     * @tc.desc    Weather hottest and coldest bounds 206 probe 206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(16)).assertEqual(16 >= -50 && 16 <= 60);
      expect(m.getCity('nohit206') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0207
     * @tc.name    WeatherComprehensiveRegression207
     * @tc.desc    Weather hottest and coldest bounds 207 probe 207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(17)).assertEqual(17 >= -50 && 17 <= 60);
      expect(m.getCity('nohit207') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0208
     * @tc.name    WeatherComprehensiveRegression208
     * @tc.desc    Weather hottest and coldest bounds 208 probe 208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(18)).assertEqual(18 >= -50 && 18 <= 60);
      expect(m.getCity('nohit208') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0209
     * @tc.name    WeatherComprehensiveRegression209
     * @tc.desc    Weather hottest and coldest bounds 209 probe 209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(19)).assertEqual(19 >= -50 && 19 <= 60);
      expect(m.getCity('nohit209') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0210
     * @tc.name    WeatherComprehensiveRegression210
     * @tc.desc    Weather hottest and coldest bounds 210 probe 210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(20)).assertEqual(20 >= -50 && 20 <= 60);
      expect(m.getCity('nohit210') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0211
     * @tc.name    WeatherComprehensiveRegression211
     * @tc.desc    Weather hottest and coldest bounds 211 probe 211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(21)).assertEqual(21 >= -50 && 21 <= 60);
      expect(m.getCity('nohit211') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0212
     * @tc.name    WeatherComprehensiveRegression212
     * @tc.desc    Weather hottest and coldest bounds 212 probe 212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(22)).assertEqual(22 >= -50 && 22 <= 60);
      expect(m.getCity('nohit212') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0213
     * @tc.name    WeatherComprehensiveRegression213
     * @tc.desc    Weather hottest and coldest bounds 213 probe 213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(23)).assertEqual(23 >= -50 && 23 <= 60);
      expect(m.getCity('nohit213') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0214
     * @tc.name    WeatherComprehensiveRegression214
     * @tc.desc    Weather hottest and coldest bounds 214 probe 214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(24)).assertEqual(24 >= -50 && 24 <= 60);
      expect(m.getCity('nohit214') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0215
     * @tc.name    WeatherComprehensiveRegression215
     * @tc.desc    Weather hottest and coldest bounds 215 probe 215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(25)).assertEqual(25 >= -50 && 25 <= 60);
      expect(m.getCity('nohit215') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0216
     * @tc.name    WeatherComprehensiveRegression216
     * @tc.desc    Weather hottest and coldest bounds 216 probe 216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(26)).assertEqual(26 >= -50 && 26 <= 60);
      expect(m.getCity('nohit216') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0217
     * @tc.name    WeatherComprehensiveRegression217
     * @tc.desc    Weather hottest and coldest bounds 217 probe 217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(27)).assertEqual(27 >= -50 && 27 <= 60);
      expect(m.getCity('nohit217') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0218
     * @tc.name    WeatherComprehensiveRegression218
     * @tc.desc    Weather hottest and coldest bounds 218 probe 218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(28)).assertEqual(28 >= -50 && 28 <= 60);
      expect(m.getCity('nohit218') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0219
     * @tc.name    WeatherComprehensiveRegression219
     * @tc.desc    Weather hottest and coldest bounds 219 probe 219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(29)).assertEqual(29 >= -50 && 29 <= 60);
      expect(m.getCity('nohit219') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0220
     * @tc.name    WeatherComprehensiveRegression220
     * @tc.desc    Weather hottest and coldest bounds 220 probe 220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(30)).assertEqual(30 >= -50 && 30 <= 60);
      expect(m.getCity('nohit220') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0221
     * @tc.name    WeatherComprehensiveRegression221
     * @tc.desc    Weather hottest and coldest bounds 221 probe 221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(31)).assertEqual(31 >= -50 && 31 <= 60);
      expect(m.getCity('nohit221') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0222
     * @tc.name    WeatherComprehensiveRegression222
     * @tc.desc    Weather hottest and coldest bounds 222 probe 222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(32)).assertEqual(32 >= -50 && 32 <= 60);
      expect(m.getCity('nohit222') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0223
     * @tc.name    WeatherComprehensiveRegression223
     * @tc.desc    Weather hottest and coldest bounds 223 probe 223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(33)).assertEqual(33 >= -50 && 33 <= 60);
      expect(m.getCity('nohit223') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0224
     * @tc.name    WeatherComprehensiveRegression224
     * @tc.desc    Weather hottest and coldest bounds 224 probe 224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(34)).assertEqual(34 >= -50 && 34 <= 60);
      expect(m.getCity('nohit224') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0225
     * @tc.name    WeatherComprehensiveRegression225
     * @tc.desc    Weather hottest and coldest bounds 225 probe 225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(35)).assertEqual(35 >= -50 && 35 <= 60);
      expect(m.getCity('nohit225') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0226
     * @tc.name    WeatherComprehensiveRegression226
     * @tc.desc    Weather hottest and coldest bounds 226 probe 226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(36)).assertEqual(36 >= -50 && 36 <= 60);
      expect(m.getCity('nohit226') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0227
     * @tc.name    WeatherComprehensiveRegression227
     * @tc.desc    Weather hottest and coldest bounds 227 probe 227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(37)).assertEqual(37 >= -50 && 37 <= 60);
      expect(m.getCity('nohit227') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0228
     * @tc.name    WeatherComprehensiveRegression228
     * @tc.desc    Weather hottest and coldest bounds 228 probe 228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(38)).assertEqual(38 >= -50 && 38 <= 60);
      expect(m.getCity('nohit228') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0229
     * @tc.name    WeatherComprehensiveRegression229
     * @tc.desc    Weather hottest and coldest bounds 229 probe 229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(39)).assertEqual(39 >= -50 && 39 <= 60);
      expect(m.getCity('nohit229') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0230
     * @tc.name    WeatherComprehensiveRegression230
     * @tc.desc    Weather hottest and coldest bounds 230 probe 230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(40)).assertEqual(40 >= -50 && 40 <= 60);
      expect(m.getCity('nohit230') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0231
     * @tc.name    WeatherComprehensiveRegression231
     * @tc.desc    Weather hottest and coldest bounds 231 probe 231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(41)).assertEqual(41 >= -50 && 41 <= 60);
      expect(m.getCity('nohit231') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0232
     * @tc.name    WeatherComprehensiveRegression232
     * @tc.desc    Weather hottest and coldest bounds 232 probe 232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(42)).assertEqual(42 >= -50 && 42 <= 60);
      expect(m.getCity('nohit232') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0233
     * @tc.name    WeatherComprehensiveRegression233
     * @tc.desc    Weather hottest and coldest bounds 233 probe 233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(43)).assertEqual(43 >= -50 && 43 <= 60);
      expect(m.getCity('nohit233') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0234
     * @tc.name    WeatherComprehensiveRegression234
     * @tc.desc    Weather hottest and coldest bounds 234 probe 234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(44)).assertEqual(44 >= -50 && 44 <= 60);
      expect(m.getCity('nohit234') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0235
     * @tc.name    WeatherComprehensiveRegression235
     * @tc.desc    Weather hottest and coldest bounds 235 probe 235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(45)).assertEqual(45 >= -50 && 45 <= 60);
      expect(m.getCity('nohit235') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0236
     * @tc.name    WeatherComprehensiveRegression236
     * @tc.desc    Weather hottest and coldest bounds 236 probe 236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(46)).assertEqual(46 >= -50 && 46 <= 60);
      expect(m.getCity('nohit236') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0237
     * @tc.name    WeatherComprehensiveRegression237
     * @tc.desc    Weather hottest and coldest bounds 237 probe 237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(47)).assertEqual(47 >= -50 && 47 <= 60);
      expect(m.getCity('nohit237') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0238
     * @tc.name    WeatherComprehensiveRegression238
     * @tc.desc    Weather hottest and coldest bounds 238 probe 238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(48)).assertEqual(48 >= -50 && 48 <= 60);
      expect(m.getCity('nohit238') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0239
     * @tc.name    WeatherComprehensiveRegression239
     * @tc.desc    Weather hottest and coldest bounds 239 probe 239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(49)).assertEqual(49 >= -50 && 49 <= 60);
      expect(m.getCity('nohit239') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0240
     * @tc.name    WeatherComprehensiveRegression240
     * @tc.desc    Weather hottest and coldest bounds 240 probe 240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(50)).assertEqual(50 >= -50 && 50 <= 60);
      expect(m.getCity('nohit240') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0241
     * @tc.name    WeatherComprehensiveRegression241
     * @tc.desc    Weather hottest and coldest bounds 241 probe 241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(51)).assertEqual(51 >= -50 && 51 <= 60);
      expect(m.getCity('nohit241') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0242
     * @tc.name    WeatherComprehensiveRegression242
     * @tc.desc    Weather hottest and coldest bounds 242 probe 242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(52)).assertEqual(52 >= -50 && 52 <= 60);
      expect(m.getCity('nohit242') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0243
     * @tc.name    WeatherComprehensiveRegression243
     * @tc.desc    Weather hottest and coldest bounds 243 probe 243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(53)).assertEqual(53 >= -50 && 53 <= 60);
      expect(m.getCity('nohit243') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0244
     * @tc.name    WeatherComprehensiveRegression244
     * @tc.desc    Weather hottest and coldest bounds 244 probe 244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(54)).assertEqual(54 >= -50 && 54 <= 60);
      expect(m.getCity('nohit244') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0245
     * @tc.name    WeatherComprehensiveRegression245
     * @tc.desc    Weather hottest and coldest bounds 245 probe 245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(55)).assertEqual(55 >= -50 && 55 <= 60);
      expect(m.getCity('nohit245') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0246
     * @tc.name    WeatherComprehensiveRegression246
     * @tc.desc    Weather hottest and coldest bounds 246 probe 246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(56)).assertEqual(56 >= -50 && 56 <= 60);
      expect(m.getCity('nohit246') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0247
     * @tc.name    WeatherComprehensiveRegression247
     * @tc.desc    Weather hottest and coldest bounds 247 probe 247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(57)).assertEqual(57 >= -50 && 57 <= 60);
      expect(m.getCity('nohit247') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0248
     * @tc.name    WeatherComprehensiveRegression248
     * @tc.desc    Weather hottest and coldest bounds 248 probe 248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(58)).assertEqual(58 >= -50 && 58 <= 60);
      expect(m.getCity('nohit248') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0249
     * @tc.name    WeatherComprehensiveRegression249
     * @tc.desc    Weather hottest and coldest bounds 249 probe 249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(59)).assertEqual(59 >= -50 && 59 <= 60);
      expect(m.getCity('nohit249') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0250
     * @tc.name    WeatherComprehensiveRegression250
     * @tc.desc    Weather hottest and coldest bounds 250 probe 250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(60)).assertEqual(60 >= -50 && 60 <= 60);
      expect(m.getCity('nohit250') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0251
     * @tc.name    WeatherComprehensiveRegression251
     * @tc.desc    Weather hottest and coldest bounds 251 probe 251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(61)).assertEqual(61 >= -50 && 61 <= 60);
      expect(m.getCity('nohit251') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0252
     * @tc.name    WeatherComprehensiveRegression252
     * @tc.desc    Weather hottest and coldest bounds 252 probe 252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(62)).assertEqual(62 >= -50 && 62 <= 60);
      expect(m.getCity('nohit252') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0253
     * @tc.name    WeatherComprehensiveRegression253
     * @tc.desc    Weather hottest and coldest bounds 253 probe 253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(63)).assertEqual(63 >= -50 && 63 <= 60);
      expect(m.getCity('nohit253') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0254
     * @tc.name    WeatherComprehensiveRegression254
     * @tc.desc    Weather hottest and coldest bounds 254 probe 254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(64)).assertEqual(64 >= -50 && 64 <= 60);
      expect(m.getCity('nohit254') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0255
     * @tc.name    WeatherComprehensiveRegression255
     * @tc.desc    Weather hottest and coldest bounds 255 probe 255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(65)).assertEqual(65 >= -50 && 65 <= 60);
      expect(m.getCity('nohit255') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0256
     * @tc.name    WeatherComprehensiveRegression256
     * @tc.desc    Weather hottest and coldest bounds 256 probe 256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(66)).assertEqual(66 >= -50 && 66 <= 60);
      expect(m.getCity('nohit256') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0257
     * @tc.name    WeatherComprehensiveRegression257
     * @tc.desc    Weather hottest and coldest bounds 257 probe 257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(67)).assertEqual(67 >= -50 && 67 <= 60);
      expect(m.getCity('nohit257') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0258
     * @tc.name    WeatherComprehensiveRegression258
     * @tc.desc    Weather hottest and coldest bounds 258 probe 258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(68)).assertEqual(68 >= -50 && 68 <= 60);
      expect(m.getCity('nohit258') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0259
     * @tc.name    WeatherComprehensiveRegression259
     * @tc.desc    Weather hottest and coldest bounds 259 probe 259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(69)).assertEqual(69 >= -50 && 69 <= 60);
      expect(m.getCity('nohit259') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0260
     * @tc.name    WeatherComprehensiveRegression260
     * @tc.desc    Weather hottest and coldest bounds 260 probe 260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherComprehensiveRegression260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hot = m.hottestIndex();
      const cold = m.coldestIndex();
      expect(hot >= 0 && hot < m.getCityCount()).assertEqual(true);
      expect(cold >= 0 && cold < m.getCityCount()).assertEqual(true);
      expect(m.averageTemp() >= -50).assertEqual(true);
      expect(m.isTempValid(-60)).assertEqual(-60 >= -50 && -60 <= 60);
      expect(m.getCity('nohit260') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
