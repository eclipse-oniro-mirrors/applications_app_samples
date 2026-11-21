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

export default function weatherExtensionLifecycleSuite() {
  describe('WeatherExtensionLifecycleSuite', () => {
    let m: WeatherModel = new WeatherModel();

    beforeEach(() => {
      m = new WeatherModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0636
     * @tc.name    WeatherExtensionLifecycle636
     * @tc.desc    Weather fresh model cities 636 probe 636
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle636', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit636') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0637
     * @tc.name    WeatherExtensionLifecycle637
     * @tc.desc    Weather fresh model cities 637 probe 637
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle637', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit637') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0638
     * @tc.name    WeatherExtensionLifecycle638
     * @tc.desc    Weather fresh model cities 638 probe 638
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle638', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit638') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0639
     * @tc.name    WeatherExtensionLifecycle639
     * @tc.desc    Weather fresh model cities 639 probe 639
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle639', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit639') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0640
     * @tc.name    WeatherExtensionLifecycle640
     * @tc.desc    Weather fresh model cities 640 probe 640
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle640', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit640') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0641
     * @tc.name    WeatherExtensionLifecycle641
     * @tc.desc    Weather fresh model cities 641 probe 641
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle641', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit641') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0642
     * @tc.name    WeatherExtensionLifecycle642
     * @tc.desc    Weather fresh model cities 642 probe 642
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle642', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit642') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0643
     * @tc.name    WeatherExtensionLifecycle643
     * @tc.desc    Weather fresh model cities 643 probe 643
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle643', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit643') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0644
     * @tc.name    WeatherExtensionLifecycle644
     * @tc.desc    Weather fresh model cities 644 probe 644
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle644', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit644') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0645
     * @tc.name    WeatherExtensionLifecycle645
     * @tc.desc    Weather fresh model cities 645 probe 645
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle645', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit645') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0646
     * @tc.name    WeatherExtensionLifecycle646
     * @tc.desc    Weather fresh model cities 646 probe 646
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle646', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit646') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0647
     * @tc.name    WeatherExtensionLifecycle647
     * @tc.desc    Weather fresh model cities 647 probe 647
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle647', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit647') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0648
     * @tc.name    WeatherExtensionLifecycle648
     * @tc.desc    Weather fresh model cities 648 probe 648
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle648', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit648') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0649
     * @tc.name    WeatherExtensionLifecycle649
     * @tc.desc    Weather fresh model cities 649 probe 649
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle649', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit649') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0650
     * @tc.name    WeatherExtensionLifecycle650
     * @tc.desc    Weather fresh model cities 650 probe 650
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle650', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit650') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0651
     * @tc.name    WeatherExtensionLifecycle651
     * @tc.desc    Weather fresh model cities 651 probe 651
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle651', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit651') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0652
     * @tc.name    WeatherExtensionLifecycle652
     * @tc.desc    Weather fresh model cities 652 probe 652
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle652', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit652') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0653
     * @tc.name    WeatherExtensionLifecycle653
     * @tc.desc    Weather fresh model cities 653 probe 653
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle653', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit653') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0654
     * @tc.name    WeatherExtensionLifecycle654
     * @tc.desc    Weather fresh model cities 654 probe 654
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle654', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit654') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0655
     * @tc.name    WeatherExtensionLifecycle655
     * @tc.desc    Weather fresh model cities 655 probe 655
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle655', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit655') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0656
     * @tc.name    WeatherExtensionLifecycle656
     * @tc.desc    Weather fresh model cities 656 probe 656
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle656', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit656') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0657
     * @tc.name    WeatherExtensionLifecycle657
     * @tc.desc    Weather fresh model cities 657 probe 657
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle657', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit657') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0658
     * @tc.name    WeatherExtensionLifecycle658
     * @tc.desc    Weather fresh model cities 658 probe 658
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle658', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit658') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0659
     * @tc.name    WeatherExtensionLifecycle659
     * @tc.desc    Weather fresh model cities 659 probe 659
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle659', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit659') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0660
     * @tc.name    WeatherExtensionLifecycle660
     * @tc.desc    Weather fresh model cities 660 probe 660
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle660', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit660') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0661
     * @tc.name    WeatherExtensionLifecycle661
     * @tc.desc    Weather fresh model cities 661 probe 661
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle661', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit661') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0662
     * @tc.name    WeatherExtensionLifecycle662
     * @tc.desc    Weather fresh model cities 662 probe 662
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle662', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit662') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0663
     * @tc.name    WeatherExtensionLifecycle663
     * @tc.desc    Weather fresh model cities 663 probe 663
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle663', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit663') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0664
     * @tc.name    WeatherExtensionLifecycle664
     * @tc.desc    Weather fresh model cities 664 probe 664
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle664', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit664') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0665
     * @tc.name    WeatherExtensionLifecycle665
     * @tc.desc    Weather fresh model cities 665 probe 665
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle665', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit665') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0666
     * @tc.name    WeatherExtensionLifecycle666
     * @tc.desc    Weather fresh model cities 666 probe 666
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle666', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit666') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0667
     * @tc.name    WeatherExtensionLifecycle667
     * @tc.desc    Weather fresh model cities 667 probe 667
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle667', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit667') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0668
     * @tc.name    WeatherExtensionLifecycle668
     * @tc.desc    Weather fresh model cities 668 probe 668
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle668', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit668') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0669
     * @tc.name    WeatherExtensionLifecycle669
     * @tc.desc    Weather fresh model cities 669 probe 669
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle669', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit669') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0670
     * @tc.name    WeatherExtensionLifecycle670
     * @tc.desc    Weather fresh model cities 670 probe 670
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle670', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit670') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0671
     * @tc.name    WeatherExtensionLifecycle671
     * @tc.desc    Weather fresh model cities 671 probe 671
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle671', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit671') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0672
     * @tc.name    WeatherExtensionLifecycle672
     * @tc.desc    Weather fresh model cities 672 probe 672
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle672', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit672') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0673
     * @tc.name    WeatherExtensionLifecycle673
     * @tc.desc    Weather fresh model cities 673 probe 673
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle673', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit673') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0674
     * @tc.name    WeatherExtensionLifecycle674
     * @tc.desc    Weather fresh model cities 674 probe 674
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle674', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit674') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0675
     * @tc.name    WeatherExtensionLifecycle675
     * @tc.desc    Weather fresh model cities 675 probe 675
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle675', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit675') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0676
     * @tc.name    WeatherExtensionLifecycle676
     * @tc.desc    Weather fresh model cities 676 probe 676
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle676', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit676') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0677
     * @tc.name    WeatherExtensionLifecycle677
     * @tc.desc    Weather fresh model cities 677 probe 677
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle677', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit677') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0678
     * @tc.name    WeatherExtensionLifecycle678
     * @tc.desc    Weather fresh model cities 678 probe 678
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle678', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit678') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0679
     * @tc.name    WeatherExtensionLifecycle679
     * @tc.desc    Weather fresh model cities 679 probe 679
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle679', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit679') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0680
     * @tc.name    WeatherExtensionLifecycle680
     * @tc.desc    Weather fresh model cities 680 probe 680
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle680', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit680') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0681
     * @tc.name    WeatherExtensionLifecycle681
     * @tc.desc    Weather fresh model cities 681 probe 681
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle681', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit681') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0682
     * @tc.name    WeatherExtensionLifecycle682
     * @tc.desc    Weather fresh model cities 682 probe 682
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle682', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit682') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0683
     * @tc.name    WeatherExtensionLifecycle683
     * @tc.desc    Weather fresh model cities 683 probe 683
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle683', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit683') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0684
     * @tc.name    WeatherExtensionLifecycle684
     * @tc.desc    Weather fresh model cities 684 probe 684
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle684', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit684') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0685
     * @tc.name    WeatherExtensionLifecycle685
     * @tc.desc    Weather fresh model cities 685 probe 685
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle685', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit685') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0686
     * @tc.name    WeatherExtensionLifecycle686
     * @tc.desc    Weather fresh model cities 686 probe 686
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle686', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit686') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0687
     * @tc.name    WeatherExtensionLifecycle687
     * @tc.desc    Weather fresh model cities 687 probe 687
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle687', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit687') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0688
     * @tc.name    WeatherExtensionLifecycle688
     * @tc.desc    Weather fresh model cities 688 probe 688
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle688', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit688') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0689
     * @tc.name    WeatherExtensionLifecycle689
     * @tc.desc    Weather fresh model cities 689 probe 689
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle689', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit689') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0690
     * @tc.name    WeatherExtensionLifecycle690
     * @tc.desc    Weather fresh model cities 690 probe 690
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle690', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit690') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0691
     * @tc.name    WeatherExtensionLifecycle691
     * @tc.desc    Weather fresh model cities 691 probe 691
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle691', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit691') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0692
     * @tc.name    WeatherExtensionLifecycle692
     * @tc.desc    Weather fresh model cities 692 probe 692
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle692', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit692') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0693
     * @tc.name    WeatherExtensionLifecycle693
     * @tc.desc    Weather fresh model cities 693 probe 693
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle693', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit693') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0694
     * @tc.name    WeatherExtensionLifecycle694
     * @tc.desc    Weather fresh model cities 694 probe 694
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle694', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit694') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0695
     * @tc.name    WeatherExtensionLifecycle695
     * @tc.desc    Weather fresh model cities 695 probe 695
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle695', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit695') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0696
     * @tc.name    WeatherExtensionLifecycle696
     * @tc.desc    Weather fresh model cities 696 probe 696
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle696', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit696') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0697
     * @tc.name    WeatherExtensionLifecycle697
     * @tc.desc    Weather fresh model cities 697 probe 697
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle697', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit697') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0698
     * @tc.name    WeatherExtensionLifecycle698
     * @tc.desc    Weather fresh model cities 698 probe 698
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle698', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit698') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0699
     * @tc.name    WeatherExtensionLifecycle699
     * @tc.desc    Weather fresh model cities 699 probe 699
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle699', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit699') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0700
     * @tc.name    WeatherExtensionLifecycle700
     * @tc.desc    Weather fresh model cities 700 probe 700
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle700', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit700') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0701
     * @tc.name    WeatherExtensionLifecycle701
     * @tc.desc    Weather fresh model cities 701 probe 701
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle701', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit701') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0702
     * @tc.name    WeatherExtensionLifecycle702
     * @tc.desc    Weather fresh model cities 702 probe 702
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle702', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit702') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0703
     * @tc.name    WeatherExtensionLifecycle703
     * @tc.desc    Weather fresh model cities 703 probe 703
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle703', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit703') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0704
     * @tc.name    WeatherExtensionLifecycle704
     * @tc.desc    Weather fresh model cities 704 probe 704
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle704', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit704') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0705
     * @tc.name    WeatherExtensionLifecycle705
     * @tc.desc    Weather fresh model cities 705 probe 705
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle705', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit705') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0706
     * @tc.name    WeatherExtensionLifecycle706
     * @tc.desc    Weather fresh model cities 706 probe 706
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle706', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit706') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0707
     * @tc.name    WeatherExtensionLifecycle707
     * @tc.desc    Weather fresh model cities 707 probe 707
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle707', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit707') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0708
     * @tc.name    WeatherExtensionLifecycle708
     * @tc.desc    Weather fresh model cities 708 probe 708
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle708', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit708') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0709
     * @tc.name    WeatherExtensionLifecycle709
     * @tc.desc    Weather fresh model cities 709 probe 709
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle709', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit709') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0710
     * @tc.name    WeatherExtensionLifecycle710
     * @tc.desc    Weather fresh model cities 710 probe 710
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle710', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit710') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0711
     * @tc.name    WeatherExtensionLifecycle711
     * @tc.desc    Weather fresh model cities 711 probe 711
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle711', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit711') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0712
     * @tc.name    WeatherExtensionLifecycle712
     * @tc.desc    Weather fresh model cities 712 probe 712
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle712', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit712') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0713
     * @tc.name    WeatherExtensionLifecycle713
     * @tc.desc    Weather fresh model cities 713 probe 713
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle713', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit713') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0714
     * @tc.name    WeatherExtensionLifecycle714
     * @tc.desc    Weather fresh model cities 714 probe 714
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle714', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit714') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0715
     * @tc.name    WeatherExtensionLifecycle715
     * @tc.desc    Weather fresh model cities 715 probe 715
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle715', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit715') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0716
     * @tc.name    WeatherExtensionLifecycle716
     * @tc.desc    Weather fresh model cities 716 probe 716
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle716', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit716') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0717
     * @tc.name    WeatherExtensionLifecycle717
     * @tc.desc    Weather fresh model cities 717 probe 717
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle717', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit717') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0718
     * @tc.name    WeatherExtensionLifecycle718
     * @tc.desc    Weather fresh model cities 718 probe 718
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle718', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit718') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0719
     * @tc.name    WeatherExtensionLifecycle719
     * @tc.desc    Weather fresh model cities 719 probe 719
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle719', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit719') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0720
     * @tc.name    WeatherExtensionLifecycle720
     * @tc.desc    Weather fresh model cities 720 probe 720
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle720', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit720') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0721
     * @tc.name    WeatherExtensionLifecycle721
     * @tc.desc    Weather fresh model cities 721 probe 721
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle721', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit721') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0722
     * @tc.name    WeatherExtensionLifecycle722
     * @tc.desc    Weather fresh model cities 722 probe 722
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle722', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit722') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0723
     * @tc.name    WeatherExtensionLifecycle723
     * @tc.desc    Weather fresh model cities 723 probe 723
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle723', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit723') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0724
     * @tc.name    WeatherExtensionLifecycle724
     * @tc.desc    Weather fresh model cities 724 probe 724
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle724', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit724') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0725
     * @tc.name    WeatherExtensionLifecycle725
     * @tc.desc    Weather fresh model cities 725 probe 725
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle725', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit725') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0726
     * @tc.name    WeatherExtensionLifecycle726
     * @tc.desc    Weather fresh model cities 726 probe 726
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle726', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit726') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0727
     * @tc.name    WeatherExtensionLifecycle727
     * @tc.desc    Weather fresh model cities 727 probe 727
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle727', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit727') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0728
     * @tc.name    WeatherExtensionLifecycle728
     * @tc.desc    Weather fresh model cities 728 probe 728
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle728', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit728') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0729
     * @tc.name    WeatherExtensionLifecycle729
     * @tc.desc    Weather fresh model cities 729 probe 729
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle729', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit729') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0730
     * @tc.name    WeatherExtensionLifecycle730
     * @tc.desc    Weather fresh model cities 730 probe 730
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle730', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit730') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0731
     * @tc.name    WeatherExtensionLifecycle731
     * @tc.desc    Weather fresh model cities 731 probe 731
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle731', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit731') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0732
     * @tc.name    WeatherExtensionLifecycle732
     * @tc.desc    Weather fresh model cities 732 probe 732
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle732', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit732') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0733
     * @tc.name    WeatherExtensionLifecycle733
     * @tc.desc    Weather fresh model cities 733 probe 733
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle733', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit733') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0734
     * @tc.name    WeatherExtensionLifecycle734
     * @tc.desc    Weather fresh model cities 734 probe 734
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle734', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit734') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0735
     * @tc.name    WeatherExtensionLifecycle735
     * @tc.desc    Weather fresh model cities 735 probe 735
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle735', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit735') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0736
     * @tc.name    WeatherExtensionLifecycle736
     * @tc.desc    Weather fresh model cities 736 probe 736
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle736', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit736') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0737
     * @tc.name    WeatherExtensionLifecycle737
     * @tc.desc    Weather fresh model cities 737 probe 737
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle737', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit737') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0738
     * @tc.name    WeatherExtensionLifecycle738
     * @tc.desc    Weather fresh model cities 738 probe 738
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle738', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit738') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
