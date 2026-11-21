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

export default function weatherButtonInteractionSuite() {
  describe('WeatherButtonInteractionSuite', () => {
    let m: WeatherModel = new WeatherModel();

    beforeEach(() => {
      m = new WeatherModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0293
     * @tc.name    WeatherButtonInteraction293
     * @tc.desc    Weather notify add count 293 probe 293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit293') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0294
     * @tc.name    WeatherButtonInteraction294
     * @tc.desc    Weather notify add count 294 probe 294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit294') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0295
     * @tc.name    WeatherButtonInteraction295
     * @tc.desc    Weather notify add count 295 probe 295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit295') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0296
     * @tc.name    WeatherButtonInteraction296
     * @tc.desc    Weather notify add count 296 probe 296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit296') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0297
     * @tc.name    WeatherButtonInteraction297
     * @tc.desc    Weather notify add count 297 probe 297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit297') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0298
     * @tc.name    WeatherButtonInteraction298
     * @tc.desc    Weather notify add count 298 probe 298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit298') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0299
     * @tc.name    WeatherButtonInteraction299
     * @tc.desc    Weather notify add count 299 probe 299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit299') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0300
     * @tc.name    WeatherButtonInteraction300
     * @tc.desc    Weather notify add count 300 probe 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit300') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0301
     * @tc.name    WeatherButtonInteraction301
     * @tc.desc    Weather notify add count 301 probe 301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit301') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0302
     * @tc.name    WeatherButtonInteraction302
     * @tc.desc    Weather notify add count 302 probe 302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit302') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0303
     * @tc.name    WeatherButtonInteraction303
     * @tc.desc    Weather notify add count 303 probe 303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit303') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0304
     * @tc.name    WeatherButtonInteraction304
     * @tc.desc    Weather notify add count 304 probe 304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit304') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0305
     * @tc.name    WeatherButtonInteraction305
     * @tc.desc    Weather notify add count 305 probe 305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit305') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0306
     * @tc.name    WeatherButtonInteraction306
     * @tc.desc    Weather notify add count 306 probe 306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit306') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0307
     * @tc.name    WeatherButtonInteraction307
     * @tc.desc    Weather notify add count 307 probe 307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit307') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0308
     * @tc.name    WeatherButtonInteraction308
     * @tc.desc    Weather notify add count 308 probe 308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit308') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0309
     * @tc.name    WeatherButtonInteraction309
     * @tc.desc    Weather notify add count 309 probe 309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit309') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0310
     * @tc.name    WeatherButtonInteraction310
     * @tc.desc    Weather notify add count 310 probe 310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit310') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0311
     * @tc.name    WeatherButtonInteraction311
     * @tc.desc    Weather notify add count 311 probe 311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit311') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0312
     * @tc.name    WeatherButtonInteraction312
     * @tc.desc    Weather notify add count 312 probe 312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit312') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0313
     * @tc.name    WeatherButtonInteraction313
     * @tc.desc    Weather notify add count 313 probe 313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit313') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0314
     * @tc.name    WeatherButtonInteraction314
     * @tc.desc    Weather notify add count 314 probe 314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit314') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0315
     * @tc.name    WeatherButtonInteraction315
     * @tc.desc    Weather notify add count 315 probe 315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction315', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit315') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0316
     * @tc.name    WeatherButtonInteraction316
     * @tc.desc    Weather notify add count 316 probe 316
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction316', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit316') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0317
     * @tc.name    WeatherButtonInteraction317
     * @tc.desc    Weather notify add count 317 probe 317
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction317', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit317') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0318
     * @tc.name    WeatherButtonInteraction318
     * @tc.desc    Weather notify add count 318 probe 318
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction318', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit318') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0319
     * @tc.name    WeatherButtonInteraction319
     * @tc.desc    Weather notify add count 319 probe 319
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction319', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit319') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0320
     * @tc.name    WeatherButtonInteraction320
     * @tc.desc    Weather notify add count 320 probe 320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction320', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit320') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0321
     * @tc.name    WeatherButtonInteraction321
     * @tc.desc    Weather notify add count 321 probe 321
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction321', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit321') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0322
     * @tc.name    WeatherButtonInteraction322
     * @tc.desc    Weather notify add count 322 probe 322
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction322', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit322') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0323
     * @tc.name    WeatherButtonInteraction323
     * @tc.desc    Weather notify add count 323 probe 323
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction323', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit323') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0324
     * @tc.name    WeatherButtonInteraction324
     * @tc.desc    Weather notify add count 324 probe 324
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction324', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit324') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0325
     * @tc.name    WeatherButtonInteraction325
     * @tc.desc    Weather notify add count 325 probe 325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction325', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit325') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0326
     * @tc.name    WeatherButtonInteraction326
     * @tc.desc    Weather notify add count 326 probe 326
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction326', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit326') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0327
     * @tc.name    WeatherButtonInteraction327
     * @tc.desc    Weather notify add count 327 probe 327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction327', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit327') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0328
     * @tc.name    WeatherButtonInteraction328
     * @tc.desc    Weather notify add count 328 probe 328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction328', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit328') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0329
     * @tc.name    WeatherButtonInteraction329
     * @tc.desc    Weather notify add count 329 probe 329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction329', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit329') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0330
     * @tc.name    WeatherButtonInteraction330
     * @tc.desc    Weather notify add count 330 probe 330
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction330', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit330') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0331
     * @tc.name    WeatherButtonInteraction331
     * @tc.desc    Weather notify add count 331 probe 331
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction331', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit331') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0332
     * @tc.name    WeatherButtonInteraction332
     * @tc.desc    Weather notify add count 332 probe 332
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction332', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit332') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0333
     * @tc.name    WeatherButtonInteraction333
     * @tc.desc    Weather notify add count 333 probe 333
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction333', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit333') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0334
     * @tc.name    WeatherButtonInteraction334
     * @tc.desc    Weather notify add count 334 probe 334
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction334', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit334') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0335
     * @tc.name    WeatherButtonInteraction335
     * @tc.desc    Weather notify add count 335 probe 335
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction335', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit335') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0336
     * @tc.name    WeatherButtonInteraction336
     * @tc.desc    Weather notify add count 336 probe 336
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction336', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit336') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0337
     * @tc.name    WeatherButtonInteraction337
     * @tc.desc    Weather notify add count 337 probe 337
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction337', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit337') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0338
     * @tc.name    WeatherButtonInteraction338
     * @tc.desc    Weather notify add count 338 probe 338
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction338', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit338') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0339
     * @tc.name    WeatherButtonInteraction339
     * @tc.desc    Weather notify add count 339 probe 339
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction339', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit339') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0340
     * @tc.name    WeatherButtonInteraction340
     * @tc.desc    Weather notify add count 340 probe 340
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction340', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit340') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0341
     * @tc.name    WeatherButtonInteraction341
     * @tc.desc    Weather notify add count 341 probe 341
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction341', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit341') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0342
     * @tc.name    WeatherButtonInteraction342
     * @tc.desc    Weather notify add count 342 probe 342
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction342', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit342') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0343
     * @tc.name    WeatherButtonInteraction343
     * @tc.desc    Weather notify add count 343 probe 343
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction343', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit343') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0344
     * @tc.name    WeatherButtonInteraction344
     * @tc.desc    Weather notify add count 344 probe 344
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction344', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit344') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0345
     * @tc.name    WeatherButtonInteraction345
     * @tc.desc    Weather notify add count 345 probe 345
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction345', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit345') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0346
     * @tc.name    WeatherButtonInteraction346
     * @tc.desc    Weather notify add count 346 probe 346
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction346', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit346') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0347
     * @tc.name    WeatherButtonInteraction347
     * @tc.desc    Weather notify add count 347 probe 347
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction347', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit347') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0348
     * @tc.name    WeatherButtonInteraction348
     * @tc.desc    Weather notify add count 348 probe 348
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction348', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit348') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0349
     * @tc.name    WeatherButtonInteraction349
     * @tc.desc    Weather notify add count 349 probe 349
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction349', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit349') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0350
     * @tc.name    WeatherButtonInteraction350
     * @tc.desc    Weather notify add count 350 probe 350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction350', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit350') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0351
     * @tc.name    WeatherButtonInteraction351
     * @tc.desc    Weather notify add count 351 probe 351
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction351', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit351') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0352
     * @tc.name    WeatherButtonInteraction352
     * @tc.desc    Weather notify add count 352 probe 352
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction352', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit352') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0353
     * @tc.name    WeatherButtonInteraction353
     * @tc.desc    Weather notify add count 353 probe 353
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction353', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit353') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0354
     * @tc.name    WeatherButtonInteraction354
     * @tc.desc    Weather notify add count 354 probe 354
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction354', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit354') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0355
     * @tc.name    WeatherButtonInteraction355
     * @tc.desc    Weather notify add count 355 probe 355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction355', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit355') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0356
     * @tc.name    WeatherButtonInteraction356
     * @tc.desc    Weather notify add count 356 probe 356
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction356', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit356') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0357
     * @tc.name    WeatherButtonInteraction357
     * @tc.desc    Weather notify add count 357 probe 357
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction357', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit357') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0358
     * @tc.name    WeatherButtonInteraction358
     * @tc.desc    Weather notify add count 358 probe 358
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction358', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit358') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0359
     * @tc.name    WeatherButtonInteraction359
     * @tc.desc    Weather notify add count 359 probe 359
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction359', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit359') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0360
     * @tc.name    WeatherButtonInteraction360
     * @tc.desc    Weather notify add count 360 probe 360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction360', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit360') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0361
     * @tc.name    WeatherButtonInteraction361
     * @tc.desc    Weather notify add count 361 probe 361
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction361', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit361') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0362
     * @tc.name    WeatherButtonInteraction362
     * @tc.desc    Weather notify add count 362 probe 362
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction362', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit362') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0363
     * @tc.name    WeatherButtonInteraction363
     * @tc.desc    Weather notify add count 363 probe 363
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction363', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit363') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0364
     * @tc.name    WeatherButtonInteraction364
     * @tc.desc    Weather notify add count 364 probe 364
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction364', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit364') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0365
     * @tc.name    WeatherButtonInteraction365
     * @tc.desc    Weather notify add count 365 probe 365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction365', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit365') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0366
     * @tc.name    WeatherButtonInteraction366
     * @tc.desc    Weather notify add count 366 probe 366
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction366', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit366') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0367
     * @tc.name    WeatherButtonInteraction367
     * @tc.desc    Weather notify add count 367 probe 367
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction367', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit367') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0368
     * @tc.name    WeatherButtonInteraction368
     * @tc.desc    Weather notify add count 368 probe 368
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction368', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit368') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0369
     * @tc.name    WeatherButtonInteraction369
     * @tc.desc    Weather notify add count 369 probe 369
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction369', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit369') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0370
     * @tc.name    WeatherButtonInteraction370
     * @tc.desc    Weather notify add count 370 probe 370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction370', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit370') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0371
     * @tc.name    WeatherButtonInteraction371
     * @tc.desc    Weather notify add count 371 probe 371
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction371', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit371') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0372
     * @tc.name    WeatherButtonInteraction372
     * @tc.desc    Weather notify add count 372 probe 372
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction372', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit372') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0373
     * @tc.name    WeatherButtonInteraction373
     * @tc.desc    Weather notify add count 373 probe 373
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction373', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit373') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0374
     * @tc.name    WeatherButtonInteraction374
     * @tc.desc    Weather notify add count 374 probe 374
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction374', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit374') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0375
     * @tc.name    WeatherButtonInteraction375
     * @tc.desc    Weather notify add count 375 probe 375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction375', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit375') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0376
     * @tc.name    WeatherButtonInteraction376
     * @tc.desc    Weather notify add count 376 probe 376
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction376', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit376') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0377
     * @tc.name    WeatherButtonInteraction377
     * @tc.desc    Weather notify add count 377 probe 377
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction377', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit377') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0378
     * @tc.name    WeatherButtonInteraction378
     * @tc.desc    Weather notify add count 378 probe 378
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction378', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit378') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0379
     * @tc.name    WeatherButtonInteraction379
     * @tc.desc    Weather notify add count 379 probe 379
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction379', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit379') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0380
     * @tc.name    WeatherButtonInteraction380
     * @tc.desc    Weather notify add count 380 probe 380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction380', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit380') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0381
     * @tc.name    WeatherButtonInteraction381
     * @tc.desc    Weather notify add count 381 probe 381
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction381', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit381') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0382
     * @tc.name    WeatherButtonInteraction382
     * @tc.desc    Weather notify add count 382 probe 382
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction382', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit382') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0383
     * @tc.name    WeatherButtonInteraction383
     * @tc.desc    Weather notify add count 383 probe 383
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction383', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit383') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0384
     * @tc.name    WeatherButtonInteraction384
     * @tc.desc    Weather notify add count 384 probe 384
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction384', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit384') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0385
     * @tc.name    WeatherButtonInteraction385
     * @tc.desc    Weather notify add count 385 probe 385
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction385', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit385') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0386
     * @tc.name    WeatherButtonInteraction386
     * @tc.desc    Weather notify add count 386 probe 386
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction386', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit386') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0387
     * @tc.name    WeatherButtonInteraction387
     * @tc.desc    Weather notify add count 387 probe 387
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction387', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit387') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0388
     * @tc.name    WeatherButtonInteraction388
     * @tc.desc    Weather notify add count 388 probe 388
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction388', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit388') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0389
     * @tc.name    WeatherButtonInteraction389
     * @tc.desc    Weather notify add count 389 probe 389
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction389', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit389') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0390
     * @tc.name    WeatherButtonInteraction390
     * @tc.desc    Weather notify add count 390 probe 390
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction390', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit390') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0391
     * @tc.name    WeatherButtonInteraction391
     * @tc.desc    Weather notify add count 391 probe 391
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction391', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit391') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0392
     * @tc.name    WeatherButtonInteraction392
     * @tc.desc    Weather notify add count 392 probe 392
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction392', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit392') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0393
     * @tc.name    WeatherButtonInteraction393
     * @tc.desc    Weather notify add count 393 probe 393
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction393', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit393') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0394
     * @tc.name    WeatherButtonInteraction394
     * @tc.desc    Weather notify add count 394 probe 394
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction394', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit394') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0395
     * @tc.name    WeatherButtonInteraction395
     * @tc.desc    Weather notify add count 395 probe 395
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction395', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit395') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0396
     * @tc.name    WeatherButtonInteraction396
     * @tc.desc    Weather notify add count 396 probe 396
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction396', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit396') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0397
     * @tc.name    WeatherButtonInteraction397
     * @tc.desc    Weather notify add count 397 probe 397
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction397', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit397') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0398
     * @tc.name    WeatherButtonInteraction398
     * @tc.desc    Weather notify add count 398 probe 398
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction398', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit398') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0399
     * @tc.name    WeatherButtonInteraction399
     * @tc.desc    Weather notify add count 399 probe 399
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction399', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit399') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0400
     * @tc.name    WeatherButtonInteraction400
     * @tc.desc    Weather notify add count 400 probe 400
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction400', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit400') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0401
     * @tc.name    WeatherButtonInteraction401
     * @tc.desc    Weather notify add count 401 probe 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction401', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit401') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0402
     * @tc.name    WeatherButtonInteraction402
     * @tc.desc    Weather notify add count 402 probe 402
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction402', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit402') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0403
     * @tc.name    WeatherButtonInteraction403
     * @tc.desc    Weather notify add count 403 probe 403
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction403', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit403') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0404
     * @tc.name    WeatherButtonInteraction404
     * @tc.desc    Weather notify add count 404 probe 404
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction404', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit404') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0405
     * @tc.name    WeatherButtonInteraction405
     * @tc.desc    Weather notify add count 405 probe 405
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction405', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit405') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0406
     * @tc.name    WeatherButtonInteraction406
     * @tc.desc    Weather notify add count 406 probe 406
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction406', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit406') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0407
     * @tc.name    WeatherButtonInteraction407
     * @tc.desc    Weather notify add count 407 probe 407
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction407', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit407') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0408
     * @tc.name    WeatherButtonInteraction408
     * @tc.desc    Weather notify add count 408 probe 408
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction408', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit408') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0409
     * @tc.name    WeatherButtonInteraction409
     * @tc.desc    Weather notify add count 409 probe 409
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction409', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit409') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0410
     * @tc.name    WeatherButtonInteraction410
     * @tc.desc    Weather notify add count 410 probe 410
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction410', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit410') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0411
     * @tc.name    WeatherButtonInteraction411
     * @tc.desc    Weather notify add count 411 probe 411
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction411', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit411') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0412
     * @tc.name    WeatherButtonInteraction412
     * @tc.desc    Weather notify add count 412 probe 412
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction412', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit412') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0413
     * @tc.name    WeatherButtonInteraction413
     * @tc.desc    Weather notify add count 413 probe 413
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction413', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit413') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0414
     * @tc.name    WeatherButtonInteraction414
     * @tc.desc    Weather notify add count 414 probe 414
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction414', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit414') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0415
     * @tc.name    WeatherButtonInteraction415
     * @tc.desc    Weather notify add count 415 probe 415
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction415', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit415') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0416
     * @tc.name    WeatherButtonInteraction416
     * @tc.desc    Weather notify add count 416 probe 416
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction416', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit416') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0417
     * @tc.name    WeatherButtonInteraction417
     * @tc.desc    Weather notify add count 417 probe 417
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction417', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit417') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0418
     * @tc.name    WeatherButtonInteraction418
     * @tc.desc    Weather notify add count 418 probe 418
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction418', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit418') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0419
     * @tc.name    WeatherButtonInteraction419
     * @tc.desc    Weather notify add count 419 probe 419
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction419', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit419') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0420
     * @tc.name    WeatherButtonInteraction420
     * @tc.desc    Weather notify add count 420 probe 420
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction420', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit420') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0421
     * @tc.name    WeatherButtonInteraction421
     * @tc.desc    Weather notify add count 421 probe 421
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction421', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit421') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0422
     * @tc.name    WeatherButtonInteraction422
     * @tc.desc    Weather notify add count 422 probe 422
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction422', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit422') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0423
     * @tc.name    WeatherButtonInteraction423
     * @tc.desc    Weather notify add count 423 probe 423
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction423', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit423') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0424
     * @tc.name    WeatherButtonInteraction424
     * @tc.desc    Weather notify add count 424 probe 424
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction424', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit424') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0425
     * @tc.name    WeatherButtonInteraction425
     * @tc.desc    Weather notify add count 425 probe 425
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction425', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit425') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0426
     * @tc.name    WeatherButtonInteraction426
     * @tc.desc    Weather notify add count 426 probe 426
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction426', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit426') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0427
     * @tc.name    WeatherButtonInteraction427
     * @tc.desc    Weather notify add count 427 probe 427
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction427', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit427') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0428
     * @tc.name    WeatherButtonInteraction428
     * @tc.desc    Weather notify add count 428 probe 428
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction428', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit428') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0429
     * @tc.name    WeatherButtonInteraction429
     * @tc.desc    Weather notify add count 429 probe 429
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction429', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit429') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0430
     * @tc.name    WeatherButtonInteraction430
     * @tc.desc    Weather notify add count 430 probe 430
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction430', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit430') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0431
     * @tc.name    WeatherButtonInteraction431
     * @tc.desc    Weather notify add count 431 probe 431
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction431', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit431') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0432
     * @tc.name    WeatherButtonInteraction432
     * @tc.desc    Weather notify add count 432 probe 432
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction432', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit432') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0433
     * @tc.name    WeatherButtonInteraction433
     * @tc.desc    Weather notify add count 433 probe 433
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction433', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit433') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0434
     * @tc.name    WeatherButtonInteraction434
     * @tc.desc    Weather notify add count 434 probe 434
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction434', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit434') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0435
     * @tc.name    WeatherButtonInteraction435
     * @tc.desc    Weather notify add count 435 probe 435
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction435', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit435') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0436
     * @tc.name    WeatherButtonInteraction436
     * @tc.desc    Weather notify add count 436 probe 436
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction436', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit436') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0437
     * @tc.name    WeatherButtonInteraction437
     * @tc.desc    Weather notify add count 437 probe 437
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction437', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit437') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0438
     * @tc.name    WeatherButtonInteraction438
     * @tc.desc    Weather notify add count 438 probe 438
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction438', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit438') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0439
     * @tc.name    WeatherButtonInteraction439
     * @tc.desc    Weather notify add count 439 probe 439
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction439', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit439') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0440
     * @tc.name    WeatherButtonInteraction440
     * @tc.desc    Weather notify add count 440 probe 440
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction440', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit440') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0441
     * @tc.name    WeatherButtonInteraction441
     * @tc.desc    Weather notify add count 441 probe 441
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction441', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit441') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0442
     * @tc.name    WeatherButtonInteraction442
     * @tc.desc    Weather notify add count 442 probe 442
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction442', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit442') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0443
     * @tc.name    WeatherButtonInteraction443
     * @tc.desc    Weather notify add count 443 probe 443
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction443', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit443') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0444
     * @tc.name    WeatherButtonInteraction444
     * @tc.desc    Weather notify add count 444 probe 444
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction444', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit444') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0445
     * @tc.name    WeatherButtonInteraction445
     * @tc.desc    Weather notify add count 445 probe 445
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction445', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit445') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0446
     * @tc.name    WeatherButtonInteraction446
     * @tc.desc    Weather notify add count 446 probe 446
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction446', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit446') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0447
     * @tc.name    WeatherButtonInteraction447
     * @tc.desc    Weather notify add count 447 probe 447
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction447', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit447') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0448
     * @tc.name    WeatherButtonInteraction448
     * @tc.desc    Weather notify add count 448 probe 448
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction448', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit448') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0449
     * @tc.name    WeatherButtonInteraction449
     * @tc.desc    Weather notify add count 449 probe 449
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction449', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit449') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0450
     * @tc.name    WeatherButtonInteraction450
     * @tc.desc    Weather notify add count 450 probe 450
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction450', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit450') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0451
     * @tc.name    WeatherButtonInteraction451
     * @tc.desc    Weather notify add count 451 probe 451
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction451', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit451') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0452
     * @tc.name    WeatherButtonInteraction452
     * @tc.desc    Weather notify add count 452 probe 452
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction452', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit452') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0453
     * @tc.name    WeatherButtonInteraction453
     * @tc.desc    Weather notify add count 453 probe 453
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction453', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit453') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0454
     * @tc.name    WeatherButtonInteraction454
     * @tc.desc    Weather notify add count 454 probe 454
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction454', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit454') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0455
     * @tc.name    WeatherButtonInteraction455
     * @tc.desc    Weather notify add count 455 probe 455
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction455', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit455') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0456
     * @tc.name    WeatherButtonInteraction456
     * @tc.desc    Weather notify add count 456 probe 456
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction456', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit456') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0457
     * @tc.name    WeatherButtonInteraction457
     * @tc.desc    Weather notify add count 457 probe 457
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction457', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit457') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0458
     * @tc.name    WeatherButtonInteraction458
     * @tc.desc    Weather notify add count 458 probe 458
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction458', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit458') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0459
     * @tc.name    WeatherButtonInteraction459
     * @tc.desc    Weather notify add count 459 probe 459
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction459', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit459') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0460
     * @tc.name    WeatherButtonInteraction460
     * @tc.desc    Weather notify add count 460 probe 460
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction460', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit460') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0461
     * @tc.name    WeatherButtonInteraction461
     * @tc.desc    Weather notify add count 461 probe 461
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction461', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit461') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0462
     * @tc.name    WeatherButtonInteraction462
     * @tc.desc    Weather notify add count 462 probe 462
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction462', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit462') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0463
     * @tc.name    WeatherButtonInteraction463
     * @tc.desc    Weather notify add count 463 probe 463
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction463', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit463') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0464
     * @tc.name    WeatherButtonInteraction464
     * @tc.desc    Weather notify add count 464 probe 464
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction464', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit464') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0465
     * @tc.name    WeatherButtonInteraction465
     * @tc.desc    Weather notify add count 465 probe 465
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction465', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit465') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0466
     * @tc.name    WeatherButtonInteraction466
     * @tc.desc    Weather notify add count 466 probe 466
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction466', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit466') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0467
     * @tc.name    WeatherButtonInteraction467
     * @tc.desc    Weather notify add count 467 probe 467
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction467', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit467') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0468
     * @tc.name    WeatherButtonInteraction468
     * @tc.desc    Weather notify add count 468 probe 468
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction468', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit468') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0469
     * @tc.name    WeatherButtonInteraction469
     * @tc.desc    Weather notify add count 469 probe 469
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction469', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit469') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0470
     * @tc.name    WeatherButtonInteraction470
     * @tc.desc    Weather notify add count 470 probe 470
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction470', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit470') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0471
     * @tc.name    WeatherButtonInteraction471
     * @tc.desc    Weather notify add count 471 probe 471
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction471', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit471') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0472
     * @tc.name    WeatherButtonInteraction472
     * @tc.desc    Weather notify add count 472 probe 472
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction472', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit472') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0473
     * @tc.name    WeatherButtonInteraction473
     * @tc.desc    Weather notify add count 473 probe 473
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction473', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit473') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0474
     * @tc.name    WeatherButtonInteraction474
     * @tc.desc    Weather notify add count 474 probe 474
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction474', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit474') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0475
     * @tc.name    WeatherButtonInteraction475
     * @tc.desc    Weather notify add count 475 probe 475
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction475', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit475') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0476
     * @tc.name    WeatherButtonInteraction476
     * @tc.desc    Weather notify add count 476 probe 476
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction476', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit476') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0477
     * @tc.name    WeatherButtonInteraction477
     * @tc.desc    Weather notify add count 477 probe 477
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction477', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit477') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0478
     * @tc.name    WeatherButtonInteraction478
     * @tc.desc    Weather notify add count 478 probe 478
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction478', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit478') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0479
     * @tc.name    WeatherButtonInteraction479
     * @tc.desc    Weather notify add count 479 probe 479
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction479', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit479') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0480
     * @tc.name    WeatherButtonInteraction480
     * @tc.desc    Weather notify add count 480 probe 480
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction480', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit480') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0481
     * @tc.name    WeatherButtonInteraction481
     * @tc.desc    Weather notify add count 481 probe 481
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction481', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit481') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0482
     * @tc.name    WeatherButtonInteraction482
     * @tc.desc    Weather notify add count 482 probe 482
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction482', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit482') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0483
     * @tc.name    WeatherButtonInteraction483
     * @tc.desc    Weather notify add count 483 probe 483
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction483', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit483') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0484
     * @tc.name    WeatherButtonInteraction484
     * @tc.desc    Weather notify add count 484 probe 484
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction484', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit484') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0485
     * @tc.name    WeatherButtonInteraction485
     * @tc.desc    Weather notify add count 485 probe 485
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction485', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit485') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0486
     * @tc.name    WeatherButtonInteraction486
     * @tc.desc    Weather notify add count 486 probe 486
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction486', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit486') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0487
     * @tc.name    WeatherButtonInteraction487
     * @tc.desc    Weather notify add count 487 probe 487
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction487', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit487') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0488
     * @tc.name    WeatherButtonInteraction488
     * @tc.desc    Weather notify add count 488 probe 488
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction488', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit488') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0489
     * @tc.name    WeatherButtonInteraction489
     * @tc.desc    Weather notify add count 489 probe 489
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction489', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit489') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0490
     * @tc.name    WeatherButtonInteraction490
     * @tc.desc    Weather notify add count 490 probe 490
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction490', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit490') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0491
     * @tc.name    WeatherButtonInteraction491
     * @tc.desc    Weather notify add count 491 probe 491
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction491', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit491') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0492
     * @tc.name    WeatherButtonInteraction492
     * @tc.desc    Weather notify add count 492 probe 492
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction492', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit492') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0493
     * @tc.name    WeatherButtonInteraction493
     * @tc.desc    Weather notify add count 493 probe 493
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction493', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit493') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0494
     * @tc.name    WeatherButtonInteraction494
     * @tc.desc    Weather notify add count 494 probe 494
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction494', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit494') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0495
     * @tc.name    WeatherButtonInteraction495
     * @tc.desc    Weather notify add count 495 probe 495
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction495', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit495') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0496
     * @tc.name    WeatherButtonInteraction496
     * @tc.desc    Weather notify add count 496 probe 496
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction496', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit496') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0497
     * @tc.name    WeatherButtonInteraction497
     * @tc.desc    Weather notify add count 497 probe 497
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction497', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit497') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0498
     * @tc.name    WeatherButtonInteraction498
     * @tc.desc    Weather notify add count 498 probe 498
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction498', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit498') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0499
     * @tc.name    WeatherButtonInteraction499
     * @tc.desc    Weather notify add count 499 probe 499
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction499', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit499') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0500
     * @tc.name    WeatherButtonInteraction500
     * @tc.desc    Weather notify add count 500 probe 500
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction500', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit500') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0501
     * @tc.name    WeatherButtonInteraction501
     * @tc.desc    Weather notify add count 501 probe 501
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction501', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit501') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0502
     * @tc.name    WeatherButtonInteraction502
     * @tc.desc    Weather notify add count 502 probe 502
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction502', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit502') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0503
     * @tc.name    WeatherButtonInteraction503
     * @tc.desc    Weather notify add count 503 probe 503
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction503', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit503') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0504
     * @tc.name    WeatherButtonInteraction504
     * @tc.desc    Weather notify add count 504 probe 504
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction504', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit504') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0505
     * @tc.name    WeatherButtonInteraction505
     * @tc.desc    Weather notify add count 505 probe 505
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction505', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit505') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0506
     * @tc.name    WeatherButtonInteraction506
     * @tc.desc    Weather notify add count 506 probe 506
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction506', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit506') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0507
     * @tc.name    WeatherButtonInteraction507
     * @tc.desc    Weather notify add count 507 probe 507
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction507', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit507') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0508
     * @tc.name    WeatherButtonInteraction508
     * @tc.desc    Weather notify add count 508 probe 508
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction508', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit508') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0509
     * @tc.name    WeatherButtonInteraction509
     * @tc.desc    Weather notify add count 509 probe 509
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction509', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit509') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0510
     * @tc.name    WeatherButtonInteraction510
     * @tc.desc    Weather notify add count 510 probe 510
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction510', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit510') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0511
     * @tc.name    WeatherButtonInteraction511
     * @tc.desc    Weather notify add count 511 probe 511
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction511', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit511') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0512
     * @tc.name    WeatherButtonInteraction512
     * @tc.desc    Weather notify add count 512 probe 512
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherButtonInteraction512', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit512') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
