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

export default function weatherThemeVariationSuite() {
  describe('WeatherThemeVariationSuite', () => {
    let m: WeatherModel = new WeatherModel();

    beforeEach(() => {
      m = new WeatherModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0549
     * @tc.name    WeatherThemeVariation549
     * @tc.desc    Weather notify add count 549 probe 549
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation549', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit549') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0550
     * @tc.name    WeatherThemeVariation550
     * @tc.desc    Weather notify add count 550 probe 550
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation550', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit550') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0551
     * @tc.name    WeatherThemeVariation551
     * @tc.desc    Weather notify add count 551 probe 551
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation551', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit551') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0552
     * @tc.name    WeatherThemeVariation552
     * @tc.desc    Weather notify add count 552 probe 552
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation552', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit552') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0553
     * @tc.name    WeatherThemeVariation553
     * @tc.desc    Weather notify add count 553 probe 553
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation553', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit553') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0554
     * @tc.name    WeatherThemeVariation554
     * @tc.desc    Weather notify add count 554 probe 554
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation554', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit554') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0555
     * @tc.name    WeatherThemeVariation555
     * @tc.desc    Weather notify add count 555 probe 555
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation555', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit555') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0556
     * @tc.name    WeatherThemeVariation556
     * @tc.desc    Weather notify add count 556 probe 556
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation556', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit556') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0557
     * @tc.name    WeatherThemeVariation557
     * @tc.desc    Weather notify add count 557 probe 557
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation557', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit557') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0558
     * @tc.name    WeatherThemeVariation558
     * @tc.desc    Weather notify add count 558 probe 558
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation558', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit558') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0559
     * @tc.name    WeatherThemeVariation559
     * @tc.desc    Weather notify add count 559 probe 559
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation559', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit559') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0560
     * @tc.name    WeatherThemeVariation560
     * @tc.desc    Weather notify add count 560 probe 560
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation560', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit560') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0561
     * @tc.name    WeatherThemeVariation561
     * @tc.desc    Weather notify add count 561 probe 561
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation561', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit561') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0562
     * @tc.name    WeatherThemeVariation562
     * @tc.desc    Weather notify add count 562 probe 562
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation562', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit562') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0563
     * @tc.name    WeatherThemeVariation563
     * @tc.desc    Weather notify add count 563 probe 563
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation563', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit563') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0564
     * @tc.name    WeatherThemeVariation564
     * @tc.desc    Weather notify add count 564 probe 564
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation564', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit564') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0565
     * @tc.name    WeatherThemeVariation565
     * @tc.desc    Weather notify add count 565 probe 565
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation565', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit565') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0566
     * @tc.name    WeatherThemeVariation566
     * @tc.desc    Weather notify add count 566 probe 566
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation566', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit566') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0567
     * @tc.name    WeatherThemeVariation567
     * @tc.desc    Weather notify add count 567 probe 567
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation567', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit567') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0568
     * @tc.name    WeatherThemeVariation568
     * @tc.desc    Weather notify add count 568 probe 568
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation568', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit568') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0569
     * @tc.name    WeatherThemeVariation569
     * @tc.desc    Weather notify add count 569 probe 569
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation569', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit569') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0570
     * @tc.name    WeatherThemeVariation570
     * @tc.desc    Weather notify add count 570 probe 570
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation570', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit570') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0571
     * @tc.name    WeatherThemeVariation571
     * @tc.desc    Weather notify add count 571 probe 571
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation571', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit571') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0572
     * @tc.name    WeatherThemeVariation572
     * @tc.desc    Weather notify add count 572 probe 572
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation572', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit572') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0573
     * @tc.name    WeatherThemeVariation573
     * @tc.desc    Weather notify add count 573 probe 573
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation573', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit573') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0574
     * @tc.name    WeatherThemeVariation574
     * @tc.desc    Weather notify add count 574 probe 574
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation574', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit574') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0575
     * @tc.name    WeatherThemeVariation575
     * @tc.desc    Weather notify add count 575 probe 575
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation575', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit575') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0576
     * @tc.name    WeatherThemeVariation576
     * @tc.desc    Weather notify add count 576 probe 576
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation576', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit576') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0577
     * @tc.name    WeatherThemeVariation577
     * @tc.desc    Weather notify add count 577 probe 577
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation577', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit577') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0578
     * @tc.name    WeatherThemeVariation578
     * @tc.desc    Weather notify add count 578 probe 578
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation578', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit578') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0579
     * @tc.name    WeatherThemeVariation579
     * @tc.desc    Weather notify add count 579 probe 579
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation579', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit579') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0580
     * @tc.name    WeatherThemeVariation580
     * @tc.desc    Weather notify add count 580 probe 580
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation580', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit580') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0581
     * @tc.name    WeatherThemeVariation581
     * @tc.desc    Weather notify add count 581 probe 581
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation581', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit581') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0582
     * @tc.name    WeatherThemeVariation582
     * @tc.desc    Weather notify add count 582 probe 582
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation582', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit582') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0583
     * @tc.name    WeatherThemeVariation583
     * @tc.desc    Weather notify add count 583 probe 583
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation583', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit583') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0584
     * @tc.name    WeatherThemeVariation584
     * @tc.desc    Weather notify add count 584 probe 584
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation584', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit584') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0585
     * @tc.name    WeatherThemeVariation585
     * @tc.desc    Weather notify add count 585 probe 585
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation585', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit585') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0586
     * @tc.name    WeatherThemeVariation586
     * @tc.desc    Weather notify add count 586 probe 586
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation586', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit586') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0587
     * @tc.name    WeatherThemeVariation587
     * @tc.desc    Weather notify add count 587 probe 587
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation587', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit587') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0588
     * @tc.name    WeatherThemeVariation588
     * @tc.desc    Weather notify add count 588 probe 588
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation588', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit588') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0589
     * @tc.name    WeatherThemeVariation589
     * @tc.desc    Weather notify add count 589 probe 589
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation589', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit589') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0590
     * @tc.name    WeatherThemeVariation590
     * @tc.desc    Weather notify add count 590 probe 590
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation590', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit590') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0591
     * @tc.name    WeatherThemeVariation591
     * @tc.desc    Weather notify add count 591 probe 591
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation591', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit591') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0592
     * @tc.name    WeatherThemeVariation592
     * @tc.desc    Weather notify add count 592 probe 592
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation592', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit592') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0593
     * @tc.name    WeatherThemeVariation593
     * @tc.desc    Weather notify add count 593 probe 593
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation593', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit593') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0594
     * @tc.name    WeatherThemeVariation594
     * @tc.desc    Weather notify add count 594 probe 594
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation594', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit594') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0595
     * @tc.name    WeatherThemeVariation595
     * @tc.desc    Weather notify add count 595 probe 595
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation595', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit595') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0596
     * @tc.name    WeatherThemeVariation596
     * @tc.desc    Weather notify add count 596 probe 596
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation596', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit596') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0597
     * @tc.name    WeatherThemeVariation597
     * @tc.desc    Weather notify add count 597 probe 597
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation597', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit597') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0598
     * @tc.name    WeatherThemeVariation598
     * @tc.desc    Weather notify add count 598 probe 598
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation598', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit598') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0599
     * @tc.name    WeatherThemeVariation599
     * @tc.desc    Weather notify add count 599 probe 599
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation599', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit599') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0600
     * @tc.name    WeatherThemeVariation600
     * @tc.desc    Weather notify add count 600 probe 600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation600', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit600') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0601
     * @tc.name    WeatherThemeVariation601
     * @tc.desc    Weather notify add count 601 probe 601
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation601', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit601') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0602
     * @tc.name    WeatherThemeVariation602
     * @tc.desc    Weather notify add count 602 probe 602
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation602', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit602') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0603
     * @tc.name    WeatherThemeVariation603
     * @tc.desc    Weather notify add count 603 probe 603
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation603', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit603') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0604
     * @tc.name    WeatherThemeVariation604
     * @tc.desc    Weather notify add count 604 probe 604
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation604', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit604') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0605
     * @tc.name    WeatherThemeVariation605
     * @tc.desc    Weather notify add count 605 probe 605
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation605', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit605') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0606
     * @tc.name    WeatherThemeVariation606
     * @tc.desc    Weather notify add count 606 probe 606
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation606', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit606') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0607
     * @tc.name    WeatherThemeVariation607
     * @tc.desc    Weather notify add count 607 probe 607
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation607', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit607') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0608
     * @tc.name    WeatherThemeVariation608
     * @tc.desc    Weather notify add count 608 probe 608
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation608', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit608') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0609
     * @tc.name    WeatherThemeVariation609
     * @tc.desc    Weather notify add count 609 probe 609
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation609', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit609') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0610
     * @tc.name    WeatherThemeVariation610
     * @tc.desc    Weather notify add count 610 probe 610
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation610', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit610') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0611
     * @tc.name    WeatherThemeVariation611
     * @tc.desc    Weather notify add count 611 probe 611
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation611', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit611') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0612
     * @tc.name    WeatherThemeVariation612
     * @tc.desc    Weather notify add count 612 probe 612
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation612', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit612') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0613
     * @tc.name    WeatherThemeVariation613
     * @tc.desc    Weather notify add count 613 probe 613
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation613', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit613') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0614
     * @tc.name    WeatherThemeVariation614
     * @tc.desc    Weather notify add count 614 probe 614
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation614', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit614') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0615
     * @tc.name    WeatherThemeVariation615
     * @tc.desc    Weather notify add count 615 probe 615
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation615', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit615') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0616
     * @tc.name    WeatherThemeVariation616
     * @tc.desc    Weather notify add count 616 probe 616
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation616', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit616') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0617
     * @tc.name    WeatherThemeVariation617
     * @tc.desc    Weather notify add count 617 probe 617
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation617', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit617') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0618
     * @tc.name    WeatherThemeVariation618
     * @tc.desc    Weather notify add count 618 probe 618
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation618', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit618') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0619
     * @tc.name    WeatherThemeVariation619
     * @tc.desc    Weather notify add count 619 probe 619
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation619', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit619') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0620
     * @tc.name    WeatherThemeVariation620
     * @tc.desc    Weather notify add count 620 probe 620
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation620', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit620') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0621
     * @tc.name    WeatherThemeVariation621
     * @tc.desc    Weather notify add count 621 probe 621
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation621', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit621') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0622
     * @tc.name    WeatherThemeVariation622
     * @tc.desc    Weather notify add count 622 probe 622
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation622', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit622') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0623
     * @tc.name    WeatherThemeVariation623
     * @tc.desc    Weather notify add count 623 probe 623
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation623', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit623') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0624
     * @tc.name    WeatherThemeVariation624
     * @tc.desc    Weather notify add count 624 probe 624
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation624', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit624') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0625
     * @tc.name    WeatherThemeVariation625
     * @tc.desc    Weather notify add count 625 probe 625
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation625', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit625') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0626
     * @tc.name    WeatherThemeVariation626
     * @tc.desc    Weather notify add count 626 probe 626
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation626', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit626') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0627
     * @tc.name    WeatherThemeVariation627
     * @tc.desc    Weather notify add count 627 probe 627
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation627', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit627') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0628
     * @tc.name    WeatherThemeVariation628
     * @tc.desc    Weather notify add count 628 probe 628
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation628', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit628') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0629
     * @tc.name    WeatherThemeVariation629
     * @tc.desc    Weather notify add count 629 probe 629
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation629', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit629') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0630
     * @tc.name    WeatherThemeVariation630
     * @tc.desc    Weather notify add count 630 probe 630
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation630', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit630') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0631
     * @tc.name    WeatherThemeVariation631
     * @tc.desc    Weather notify add count 631 probe 631
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation631', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit631') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0632
     * @tc.name    WeatherThemeVariation632
     * @tc.desc    Weather notify add count 632 probe 632
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation632', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit632') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0633
     * @tc.name    WeatherThemeVariation633
     * @tc.desc    Weather notify add count 633 probe 633
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation633', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit633') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0634
     * @tc.name    WeatherThemeVariation634
     * @tc.desc    Weather notify add count 634 probe 634
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation634', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit634') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0635
     * @tc.name    WeatherThemeVariation635
     * @tc.desc    Weather notify add count 635 probe 635
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherThemeVariation635', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getState().adds;
      m.notifyAdd();
      expect(m.getState().adds).assertEqual(before + 1);
      expect(m.getCity('nohit635') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

