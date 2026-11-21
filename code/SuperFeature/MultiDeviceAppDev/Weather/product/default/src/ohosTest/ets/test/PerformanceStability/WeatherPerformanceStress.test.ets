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

export default function weatherPerformanceStressSuite() {
  describe('WeatherPerformanceStressSuite', () => {
    let m: WeatherModel = new WeatherModel();

    beforeEach(() => {
      m = new WeatherModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0831
     * @tc.name    WeatherPerformanceStress831
     * @tc.desc    Weather repeated validity sweep 831 probe 831
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress831', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit831') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0832
     * @tc.name    WeatherPerformanceStress832
     * @tc.desc    Weather repeated validity sweep 832 probe 832
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress832', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit832') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0833
     * @tc.name    WeatherPerformanceStress833
     * @tc.desc    Weather repeated validity sweep 833 probe 833
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress833', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit833') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0834
     * @tc.name    WeatherPerformanceStress834
     * @tc.desc    Weather repeated validity sweep 834 probe 834
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress834', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit834') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0835
     * @tc.name    WeatherPerformanceStress835
     * @tc.desc    Weather repeated validity sweep 835 probe 835
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress835', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit835') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0836
     * @tc.name    WeatherPerformanceStress836
     * @tc.desc    Weather repeated validity sweep 836 probe 836
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress836', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit836') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0837
     * @tc.name    WeatherPerformanceStress837
     * @tc.desc    Weather repeated validity sweep 837 probe 837
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress837', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit837') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0838
     * @tc.name    WeatherPerformanceStress838
     * @tc.desc    Weather repeated validity sweep 838 probe 838
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress838', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit838') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0839
     * @tc.name    WeatherPerformanceStress839
     * @tc.desc    Weather repeated validity sweep 839 probe 839
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress839', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit839') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0840
     * @tc.name    WeatherPerformanceStress840
     * @tc.desc    Weather repeated validity sweep 840 probe 840
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress840', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit840') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0841
     * @tc.name    WeatherPerformanceStress841
     * @tc.desc    Weather repeated validity sweep 841 probe 841
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress841', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit841') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0842
     * @tc.name    WeatherPerformanceStress842
     * @tc.desc    Weather repeated validity sweep 842 probe 842
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress842', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit842') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0843
     * @tc.name    WeatherPerformanceStress843
     * @tc.desc    Weather repeated validity sweep 843 probe 843
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress843', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit843') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0844
     * @tc.name    WeatherPerformanceStress844
     * @tc.desc    Weather repeated validity sweep 844 probe 844
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress844', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit844') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0845
     * @tc.name    WeatherPerformanceStress845
     * @tc.desc    Weather repeated validity sweep 845 probe 845
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress845', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit845') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0846
     * @tc.name    WeatherPerformanceStress846
     * @tc.desc    Weather repeated validity sweep 846 probe 846
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress846', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit846') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0847
     * @tc.name    WeatherPerformanceStress847
     * @tc.desc    Weather repeated validity sweep 847 probe 847
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress847', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit847') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0848
     * @tc.name    WeatherPerformanceStress848
     * @tc.desc    Weather repeated validity sweep 848 probe 848
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress848', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit848') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0849
     * @tc.name    WeatherPerformanceStress849
     * @tc.desc    Weather repeated validity sweep 849 probe 849
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress849', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit849') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0850
     * @tc.name    WeatherPerformanceStress850
     * @tc.desc    Weather repeated validity sweep 850 probe 850
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress850', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit850') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0851
     * @tc.name    WeatherPerformanceStress851
     * @tc.desc    Weather repeated validity sweep 851 probe 851
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress851', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit851') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0852
     * @tc.name    WeatherPerformanceStress852
     * @tc.desc    Weather repeated validity sweep 852 probe 852
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress852', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit852') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0853
     * @tc.name    WeatherPerformanceStress853
     * @tc.desc    Weather repeated validity sweep 853 probe 853
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress853', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit853') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0854
     * @tc.name    WeatherPerformanceStress854
     * @tc.desc    Weather repeated validity sweep 854 probe 854
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress854', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit854') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0855
     * @tc.name    WeatherPerformanceStress855
     * @tc.desc    Weather repeated validity sweep 855 probe 855
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress855', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit855') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0856
     * @tc.name    WeatherPerformanceStress856
     * @tc.desc    Weather repeated validity sweep 856 probe 856
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress856', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit856') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0857
     * @tc.name    WeatherPerformanceStress857
     * @tc.desc    Weather repeated validity sweep 857 probe 857
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress857', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit857') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0858
     * @tc.name    WeatherPerformanceStress858
     * @tc.desc    Weather repeated validity sweep 858 probe 858
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress858', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit858') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0859
     * @tc.name    WeatherPerformanceStress859
     * @tc.desc    Weather repeated validity sweep 859 probe 859
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress859', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit859') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0860
     * @tc.name    WeatherPerformanceStress860
     * @tc.desc    Weather repeated validity sweep 860 probe 860
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress860', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit860') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0861
     * @tc.name    WeatherPerformanceStress861
     * @tc.desc    Weather repeated validity sweep 861 probe 861
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress861', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit861') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0862
     * @tc.name    WeatherPerformanceStress862
     * @tc.desc    Weather repeated validity sweep 862 probe 862
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress862', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit862') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0863
     * @tc.name    WeatherPerformanceStress863
     * @tc.desc    Weather repeated validity sweep 863 probe 863
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress863', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit863') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0864
     * @tc.name    WeatherPerformanceStress864
     * @tc.desc    Weather repeated validity sweep 864 probe 864
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress864', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit864') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0865
     * @tc.name    WeatherPerformanceStress865
     * @tc.desc    Weather repeated validity sweep 865 probe 865
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress865', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit865') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0866
     * @tc.name    WeatherPerformanceStress866
     * @tc.desc    Weather repeated validity sweep 866 probe 866
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress866', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit866') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0867
     * @tc.name    WeatherPerformanceStress867
     * @tc.desc    Weather repeated validity sweep 867 probe 867
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress867', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit867') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0868
     * @tc.name    WeatherPerformanceStress868
     * @tc.desc    Weather repeated validity sweep 868 probe 868
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress868', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit868') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0869
     * @tc.name    WeatherPerformanceStress869
     * @tc.desc    Weather repeated validity sweep 869 probe 869
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress869', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit869') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0870
     * @tc.name    WeatherPerformanceStress870
     * @tc.desc    Weather repeated validity sweep 870 probe 870
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress870', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit870') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0871
     * @tc.name    WeatherPerformanceStress871
     * @tc.desc    Weather repeated validity sweep 871 probe 871
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress871', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit871') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0872
     * @tc.name    WeatherPerformanceStress872
     * @tc.desc    Weather repeated validity sweep 872 probe 872
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress872', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit872') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0873
     * @tc.name    WeatherPerformanceStress873
     * @tc.desc    Weather repeated validity sweep 873 probe 873
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress873', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit873') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0874
     * @tc.name    WeatherPerformanceStress874
     * @tc.desc    Weather repeated validity sweep 874 probe 874
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress874', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit874') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0875
     * @tc.name    WeatherPerformanceStress875
     * @tc.desc    Weather repeated validity sweep 875 probe 875
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress875', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit875') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0876
     * @tc.name    WeatherPerformanceStress876
     * @tc.desc    Weather repeated validity sweep 876 probe 876
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress876', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit876') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0877
     * @tc.name    WeatherPerformanceStress877
     * @tc.desc    Weather repeated validity sweep 877 probe 877
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress877', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit877') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0878
     * @tc.name    WeatherPerformanceStress878
     * @tc.desc    Weather repeated validity sweep 878 probe 878
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress878', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit878') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0879
     * @tc.name    WeatherPerformanceStress879
     * @tc.desc    Weather repeated validity sweep 879 probe 879
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress879', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit879') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0880
     * @tc.name    WeatherPerformanceStress880
     * @tc.desc    Weather repeated validity sweep 880 probe 880
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress880', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit880') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0881
     * @tc.name    WeatherPerformanceStress881
     * @tc.desc    Weather repeated validity sweep 881 probe 881
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress881', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit881') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0882
     * @tc.name    WeatherPerformanceStress882
     * @tc.desc    Weather repeated validity sweep 882 probe 882
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress882', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit882') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0883
     * @tc.name    WeatherPerformanceStress883
     * @tc.desc    Weather repeated validity sweep 883 probe 883
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress883', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit883') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0884
     * @tc.name    WeatherPerformanceStress884
     * @tc.desc    Weather repeated validity sweep 884 probe 884
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress884', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit884') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0885
     * @tc.name    WeatherPerformanceStress885
     * @tc.desc    Weather repeated validity sweep 885 probe 885
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress885', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit885') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0886
     * @tc.name    WeatherPerformanceStress886
     * @tc.desc    Weather repeated validity sweep 886 probe 886
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress886', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit886') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0887
     * @tc.name    WeatherPerformanceStress887
     * @tc.desc    Weather repeated validity sweep 887 probe 887
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress887', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit887') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0888
     * @tc.name    WeatherPerformanceStress888
     * @tc.desc    Weather repeated validity sweep 888 probe 888
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress888', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit888') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0889
     * @tc.name    WeatherPerformanceStress889
     * @tc.desc    Weather repeated validity sweep 889 probe 889
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress889', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit889') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0890
     * @tc.name    WeatherPerformanceStress890
     * @tc.desc    Weather repeated validity sweep 890 probe 890
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress890', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit890') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0891
     * @tc.name    WeatherPerformanceStress891
     * @tc.desc    Weather repeated validity sweep 891 probe 891
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress891', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit891') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0892
     * @tc.name    WeatherPerformanceStress892
     * @tc.desc    Weather repeated validity sweep 892 probe 892
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress892', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit892') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0893
     * @tc.name    WeatherPerformanceStress893
     * @tc.desc    Weather repeated validity sweep 893 probe 893
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress893', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit893') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0894
     * @tc.name    WeatherPerformanceStress894
     * @tc.desc    Weather repeated validity sweep 894 probe 894
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress894', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit894') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0895
     * @tc.name    WeatherPerformanceStress895
     * @tc.desc    Weather repeated validity sweep 895 probe 895
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress895', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit895') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0896
     * @tc.name    WeatherPerformanceStress896
     * @tc.desc    Weather repeated validity sweep 896 probe 896
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress896', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit896') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0897
     * @tc.name    WeatherPerformanceStress897
     * @tc.desc    Weather repeated validity sweep 897 probe 897
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress897', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit897') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0898
     * @tc.name    WeatherPerformanceStress898
     * @tc.desc    Weather repeated validity sweep 898 probe 898
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress898', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit898') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0899
     * @tc.name    WeatherPerformanceStress899
     * @tc.desc    Weather repeated validity sweep 899 probe 899
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress899', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit899') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0900
     * @tc.name    WeatherPerformanceStress900
     * @tc.desc    Weather repeated validity sweep 900 probe 900
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress900', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit900') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0901
     * @tc.name    WeatherPerformanceStress901
     * @tc.desc    Weather repeated validity sweep 901 probe 901
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress901', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit901') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0902
     * @tc.name    WeatherPerformanceStress902
     * @tc.desc    Weather repeated validity sweep 902 probe 902
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress902', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit902') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0903
     * @tc.name    WeatherPerformanceStress903
     * @tc.desc    Weather repeated validity sweep 903 probe 903
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress903', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit903') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0904
     * @tc.name    WeatherPerformanceStress904
     * @tc.desc    Weather repeated validity sweep 904 probe 904
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress904', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit904') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0905
     * @tc.name    WeatherPerformanceStress905
     * @tc.desc    Weather repeated validity sweep 905 probe 905
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress905', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit905') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0906
     * @tc.name    WeatherPerformanceStress906
     * @tc.desc    Weather repeated validity sweep 906 probe 906
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress906', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit906') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0907
     * @tc.name    WeatherPerformanceStress907
     * @tc.desc    Weather repeated validity sweep 907 probe 907
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress907', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit907') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0908
     * @tc.name    WeatherPerformanceStress908
     * @tc.desc    Weather repeated validity sweep 908 probe 908
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress908', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit908') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0909
     * @tc.name    WeatherPerformanceStress909
     * @tc.desc    Weather repeated validity sweep 909 probe 909
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress909', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit909') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0910
     * @tc.name    WeatherPerformanceStress910
     * @tc.desc    Weather repeated validity sweep 910 probe 910
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress910', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit910') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0911
     * @tc.name    WeatherPerformanceStress911
     * @tc.desc    Weather repeated validity sweep 911 probe 911
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress911', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit911') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0912
     * @tc.name    WeatherPerformanceStress912
     * @tc.desc    Weather repeated validity sweep 912 probe 912
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress912', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit912') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0913
     * @tc.name    WeatherPerformanceStress913
     * @tc.desc    Weather repeated validity sweep 913 probe 913
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress913', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit913') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0914
     * @tc.name    WeatherPerformanceStress914
     * @tc.desc    Weather repeated validity sweep 914 probe 914
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress914', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit914') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0915
     * @tc.name    WeatherPerformanceStress915
     * @tc.desc    Weather repeated validity sweep 915 probe 915
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress915', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit915') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0916
     * @tc.name    WeatherPerformanceStress916
     * @tc.desc    Weather repeated validity sweep 916 probe 916
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress916', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit916') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0917
     * @tc.name    WeatherPerformanceStress917
     * @tc.desc    Weather repeated validity sweep 917 probe 917
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress917', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit917') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0918
     * @tc.name    WeatherPerformanceStress918
     * @tc.desc    Weather repeated validity sweep 918 probe 918
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress918', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit918') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0919
     * @tc.name    WeatherPerformanceStress919
     * @tc.desc    Weather repeated validity sweep 919 probe 919
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress919', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit919') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0920
     * @tc.name    WeatherPerformanceStress920
     * @tc.desc    Weather repeated validity sweep 920 probe 920
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress920', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit920') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0921
     * @tc.name    WeatherPerformanceStress921
     * @tc.desc    Weather repeated validity sweep 921 probe 921
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress921', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit921') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0922
     * @tc.name    WeatherPerformanceStress922
     * @tc.desc    Weather repeated validity sweep 922 probe 922
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress922', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit922') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0923
     * @tc.name    WeatherPerformanceStress923
     * @tc.desc    Weather repeated validity sweep 923 probe 923
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress923', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit923') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0924
     * @tc.name    WeatherPerformanceStress924
     * @tc.desc    Weather repeated validity sweep 924 probe 924
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress924', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit924') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0925
     * @tc.name    WeatherPerformanceStress925
     * @tc.desc    Weather repeated validity sweep 925 probe 925
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress925', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit925') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0926
     * @tc.name    WeatherPerformanceStress926
     * @tc.desc    Weather repeated validity sweep 926 probe 926
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress926', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit926') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0927
     * @tc.name    WeatherPerformanceStress927
     * @tc.desc    Weather repeated validity sweep 927 probe 927
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress927', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit927') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0928
     * @tc.name    WeatherPerformanceStress928
     * @tc.desc    Weather repeated validity sweep 928 probe 928
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress928', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit928') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0929
     * @tc.name    WeatherPerformanceStress929
     * @tc.desc    Weather repeated validity sweep 929 probe 929
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress929', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 4) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit929') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0930
     * @tc.name    WeatherPerformanceStress930
     * @tc.desc    Weather repeated validity sweep 930 probe 930
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress930', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 0) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit930') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0931
     * @tc.name    WeatherPerformanceStress931
     * @tc.desc    Weather repeated validity sweep 931 probe 931
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress931', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 1) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit931') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0932
     * @tc.name    WeatherPerformanceStress932
     * @tc.desc    Weather repeated validity sweep 932 probe 932
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress932', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 2) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit932') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0933
     * @tc.name    WeatherPerformanceStress933
     * @tc.desc    Weather repeated validity sweep 933 probe 933
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherPerformanceStress933', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getCityCount(); k++) {
        const city = m.getData((k + 3) % m.getCityCount());
        expect(city !== undefined).assertEqual(true);
      }
      expect(m.getCity('nohit933') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
