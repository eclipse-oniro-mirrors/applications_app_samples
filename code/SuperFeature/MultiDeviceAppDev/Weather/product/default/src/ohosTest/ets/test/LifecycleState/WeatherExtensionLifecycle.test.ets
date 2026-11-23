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

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0739
     * @tc.name    WeatherExtensionLifecycle739
     * @tc.desc    Weather fresh model cities 739 probe 739
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle739', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit739') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0740
     * @tc.name    WeatherExtensionLifecycle740
     * @tc.desc    Weather fresh model cities 740 probe 740
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle740', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit740') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0741
     * @tc.name    WeatherExtensionLifecycle741
     * @tc.desc    Weather fresh model cities 741 probe 741
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle741', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit741') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0742
     * @tc.name    WeatherExtensionLifecycle742
     * @tc.desc    Weather fresh model cities 742 probe 742
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle742', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit742') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0743
     * @tc.name    WeatherExtensionLifecycle743
     * @tc.desc    Weather fresh model cities 743 probe 743
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle743', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit743') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0744
     * @tc.name    WeatherExtensionLifecycle744
     * @tc.desc    Weather fresh model cities 744 probe 744
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle744', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit744') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0745
     * @tc.name    WeatherExtensionLifecycle745
     * @tc.desc    Weather fresh model cities 745 probe 745
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle745', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit745') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0746
     * @tc.name    WeatherExtensionLifecycle746
     * @tc.desc    Weather fresh model cities 746 probe 746
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle746', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit746') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0747
     * @tc.name    WeatherExtensionLifecycle747
     * @tc.desc    Weather fresh model cities 747 probe 747
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle747', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit747') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0748
     * @tc.name    WeatherExtensionLifecycle748
     * @tc.desc    Weather fresh model cities 748 probe 748
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle748', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit748') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0749
     * @tc.name    WeatherExtensionLifecycle749
     * @tc.desc    Weather fresh model cities 749 probe 749
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle749', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit749') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0750
     * @tc.name    WeatherExtensionLifecycle750
     * @tc.desc    Weather fresh model cities 750 probe 750
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle750', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit750') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0751
     * @tc.name    WeatherExtensionLifecycle751
     * @tc.desc    Weather fresh model cities 751 probe 751
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle751', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit751') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0752
     * @tc.name    WeatherExtensionLifecycle752
     * @tc.desc    Weather fresh model cities 752 probe 752
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle752', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit752') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0753
     * @tc.name    WeatherExtensionLifecycle753
     * @tc.desc    Weather fresh model cities 753 probe 753
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle753', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit753') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0754
     * @tc.name    WeatherExtensionLifecycle754
     * @tc.desc    Weather fresh model cities 754 probe 754
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle754', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit754') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0755
     * @tc.name    WeatherExtensionLifecycle755
     * @tc.desc    Weather fresh model cities 755 probe 755
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle755', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit755') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0756
     * @tc.name    WeatherExtensionLifecycle756
     * @tc.desc    Weather fresh model cities 756 probe 756
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle756', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit756') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0757
     * @tc.name    WeatherExtensionLifecycle757
     * @tc.desc    Weather fresh model cities 757 probe 757
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle757', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit757') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0758
     * @tc.name    WeatherExtensionLifecycle758
     * @tc.desc    Weather fresh model cities 758 probe 758
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle758', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit758') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0759
     * @tc.name    WeatherExtensionLifecycle759
     * @tc.desc    Weather fresh model cities 759 probe 759
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle759', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit759') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0760
     * @tc.name    WeatherExtensionLifecycle760
     * @tc.desc    Weather fresh model cities 760 probe 760
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle760', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit760') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0761
     * @tc.name    WeatherExtensionLifecycle761
     * @tc.desc    Weather fresh model cities 761 probe 761
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle761', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit761') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0762
     * @tc.name    WeatherExtensionLifecycle762
     * @tc.desc    Weather fresh model cities 762 probe 762
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle762', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit762') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0763
     * @tc.name    WeatherExtensionLifecycle763
     * @tc.desc    Weather fresh model cities 763 probe 763
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle763', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit763') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0764
     * @tc.name    WeatherExtensionLifecycle764
     * @tc.desc    Weather fresh model cities 764 probe 764
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle764', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit764') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0765
     * @tc.name    WeatherExtensionLifecycle765
     * @tc.desc    Weather fresh model cities 765 probe 765
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle765', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit765') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0766
     * @tc.name    WeatherExtensionLifecycle766
     * @tc.desc    Weather fresh model cities 766 probe 766
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle766', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit766') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0767
     * @tc.name    WeatherExtensionLifecycle767
     * @tc.desc    Weather fresh model cities 767 probe 767
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle767', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit767') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0768
     * @tc.name    WeatherExtensionLifecycle768
     * @tc.desc    Weather fresh model cities 768 probe 768
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle768', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit768') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0769
     * @tc.name    WeatherExtensionLifecycle769
     * @tc.desc    Weather fresh model cities 769 probe 769
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle769', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit769') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0770
     * @tc.name    WeatherExtensionLifecycle770
     * @tc.desc    Weather fresh model cities 770 probe 770
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle770', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit770') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0771
     * @tc.name    WeatherExtensionLifecycle771
     * @tc.desc    Weather fresh model cities 771 probe 771
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle771', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit771') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0772
     * @tc.name    WeatherExtensionLifecycle772
     * @tc.desc    Weather fresh model cities 772 probe 772
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle772', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit772') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0773
     * @tc.name    WeatherExtensionLifecycle773
     * @tc.desc    Weather fresh model cities 773 probe 773
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle773', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit773') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0774
     * @tc.name    WeatherExtensionLifecycle774
     * @tc.desc    Weather fresh model cities 774 probe 774
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle774', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit774') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0775
     * @tc.name    WeatherExtensionLifecycle775
     * @tc.desc    Weather fresh model cities 775 probe 775
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle775', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit775') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0776
     * @tc.name    WeatherExtensionLifecycle776
     * @tc.desc    Weather fresh model cities 776 probe 776
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle776', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit776') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0777
     * @tc.name    WeatherExtensionLifecycle777
     * @tc.desc    Weather fresh model cities 777 probe 777
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle777', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit777') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0778
     * @tc.name    WeatherExtensionLifecycle778
     * @tc.desc    Weather fresh model cities 778 probe 778
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle778', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit778') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0779
     * @tc.name    WeatherExtensionLifecycle779
     * @tc.desc    Weather fresh model cities 779 probe 779
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle779', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit779') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0780
     * @tc.name    WeatherExtensionLifecycle780
     * @tc.desc    Weather fresh model cities 780 probe 780
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle780', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit780') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0781
     * @tc.name    WeatherExtensionLifecycle781
     * @tc.desc    Weather fresh model cities 781 probe 781
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle781', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit781') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0782
     * @tc.name    WeatherExtensionLifecycle782
     * @tc.desc    Weather fresh model cities 782 probe 782
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle782', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit782') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0783
     * @tc.name    WeatherExtensionLifecycle783
     * @tc.desc    Weather fresh model cities 783 probe 783
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle783', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit783') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0784
     * @tc.name    WeatherExtensionLifecycle784
     * @tc.desc    Weather fresh model cities 784 probe 784
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle784', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit784') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0785
     * @tc.name    WeatherExtensionLifecycle785
     * @tc.desc    Weather fresh model cities 785 probe 785
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle785', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit785') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0786
     * @tc.name    WeatherExtensionLifecycle786
     * @tc.desc    Weather fresh model cities 786 probe 786
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle786', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit786') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0787
     * @tc.name    WeatherExtensionLifecycle787
     * @tc.desc    Weather fresh model cities 787 probe 787
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle787', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit787') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0788
     * @tc.name    WeatherExtensionLifecycle788
     * @tc.desc    Weather fresh model cities 788 probe 788
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle788', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit788') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0789
     * @tc.name    WeatherExtensionLifecycle789
     * @tc.desc    Weather fresh model cities 789 probe 789
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle789', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit789') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0790
     * @tc.name    WeatherExtensionLifecycle790
     * @tc.desc    Weather fresh model cities 790 probe 790
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle790', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit790') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0791
     * @tc.name    WeatherExtensionLifecycle791
     * @tc.desc    Weather fresh model cities 791 probe 791
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle791', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit791') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0792
     * @tc.name    WeatherExtensionLifecycle792
     * @tc.desc    Weather fresh model cities 792 probe 792
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle792', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit792') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0793
     * @tc.name    WeatherExtensionLifecycle793
     * @tc.desc    Weather fresh model cities 793 probe 793
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle793', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit793') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0794
     * @tc.name    WeatherExtensionLifecycle794
     * @tc.desc    Weather fresh model cities 794 probe 794
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle794', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit794') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0795
     * @tc.name    WeatherExtensionLifecycle795
     * @tc.desc    Weather fresh model cities 795 probe 795
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle795', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit795') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0796
     * @tc.name    WeatherExtensionLifecycle796
     * @tc.desc    Weather fresh model cities 796 probe 796
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle796', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit796') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0797
     * @tc.name    WeatherExtensionLifecycle797
     * @tc.desc    Weather fresh model cities 797 probe 797
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle797', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit797') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0798
     * @tc.name    WeatherExtensionLifecycle798
     * @tc.desc    Weather fresh model cities 798 probe 798
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle798', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit798') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0799
     * @tc.name    WeatherExtensionLifecycle799
     * @tc.desc    Weather fresh model cities 799 probe 799
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle799', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit799') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0800
     * @tc.name    WeatherExtensionLifecycle800
     * @tc.desc    Weather fresh model cities 800 probe 800
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle800', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit800') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0801
     * @tc.name    WeatherExtensionLifecycle801
     * @tc.desc    Weather fresh model cities 801 probe 801
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle801', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit801') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0802
     * @tc.name    WeatherExtensionLifecycle802
     * @tc.desc    Weather fresh model cities 802 probe 802
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle802', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit802') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0803
     * @tc.name    WeatherExtensionLifecycle803
     * @tc.desc    Weather fresh model cities 803 probe 803
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle803', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit803') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0804
     * @tc.name    WeatherExtensionLifecycle804
     * @tc.desc    Weather fresh model cities 804 probe 804
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle804', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit804') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0805
     * @tc.name    WeatherExtensionLifecycle805
     * @tc.desc    Weather fresh model cities 805 probe 805
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle805', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit805') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0806
     * @tc.name    WeatherExtensionLifecycle806
     * @tc.desc    Weather fresh model cities 806 probe 806
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle806', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit806') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0807
     * @tc.name    WeatherExtensionLifecycle807
     * @tc.desc    Weather fresh model cities 807 probe 807
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle807', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit807') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0808
     * @tc.name    WeatherExtensionLifecycle808
     * @tc.desc    Weather fresh model cities 808 probe 808
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle808', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit808') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0809
     * @tc.name    WeatherExtensionLifecycle809
     * @tc.desc    Weather fresh model cities 809 probe 809
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle809', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit809') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0810
     * @tc.name    WeatherExtensionLifecycle810
     * @tc.desc    Weather fresh model cities 810 probe 810
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle810', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit810') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0811
     * @tc.name    WeatherExtensionLifecycle811
     * @tc.desc    Weather fresh model cities 811 probe 811
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle811', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit811') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0812
     * @tc.name    WeatherExtensionLifecycle812
     * @tc.desc    Weather fresh model cities 812 probe 812
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle812', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit812') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0813
     * @tc.name    WeatherExtensionLifecycle813
     * @tc.desc    Weather fresh model cities 813 probe 813
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle813', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit813') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0814
     * @tc.name    WeatherExtensionLifecycle814
     * @tc.desc    Weather fresh model cities 814 probe 814
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle814', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit814') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0815
     * @tc.name    WeatherExtensionLifecycle815
     * @tc.desc    Weather fresh model cities 815 probe 815
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle815', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit815') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0816
     * @tc.name    WeatherExtensionLifecycle816
     * @tc.desc    Weather fresh model cities 816 probe 816
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle816', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit816') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0817
     * @tc.name    WeatherExtensionLifecycle817
     * @tc.desc    Weather fresh model cities 817 probe 817
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle817', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit817') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0818
     * @tc.name    WeatherExtensionLifecycle818
     * @tc.desc    Weather fresh model cities 818 probe 818
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle818', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit818') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0819
     * @tc.name    WeatherExtensionLifecycle819
     * @tc.desc    Weather fresh model cities 819 probe 819
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle819', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit819') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0820
     * @tc.name    WeatherExtensionLifecycle820
     * @tc.desc    Weather fresh model cities 820 probe 820
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle820', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit820') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0821
     * @tc.name    WeatherExtensionLifecycle821
     * @tc.desc    Weather fresh model cities 821 probe 821
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle821', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit821') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0822
     * @tc.name    WeatherExtensionLifecycle822
     * @tc.desc    Weather fresh model cities 822 probe 822
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle822', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit822') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0823
     * @tc.name    WeatherExtensionLifecycle823
     * @tc.desc    Weather fresh model cities 823 probe 823
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle823', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit823') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0824
     * @tc.name    WeatherExtensionLifecycle824
     * @tc.desc    Weather fresh model cities 824 probe 824
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle824', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit824') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0825
     * @tc.name    WeatherExtensionLifecycle825
     * @tc.desc    Weather fresh model cities 825 probe 825
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle825', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit825') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0826
     * @tc.name    WeatherExtensionLifecycle826
     * @tc.desc    Weather fresh model cities 826 probe 826
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle826', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(1)?.name).assertEqual(m.getData(1)?.name);
      expect(m.getCity('nohit826') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0827
     * @tc.name    WeatherExtensionLifecycle827
     * @tc.desc    Weather fresh model cities 827 probe 827
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle827', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(2)?.name).assertEqual(m.getData(2)?.name);
      expect(m.getCity('nohit827') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0828
     * @tc.name    WeatherExtensionLifecycle828
     * @tc.desc    Weather fresh model cities 828 probe 828
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle828', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(3)?.name).assertEqual(m.getData(3)?.name);
      expect(m.getCity('nohit828') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0829
     * @tc.name    WeatherExtensionLifecycle829
     * @tc.desc    Weather fresh model cities 829 probe 829
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle829', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(4)?.name).assertEqual(m.getData(4)?.name);
      expect(m.getCity('nohit829') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_WEATHER_0830
     * @tc.name    WeatherExtensionLifecycle830
     * @tc.desc    Weather fresh model cities 830 probe 830
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('WeatherExtensionLifecycle830', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: WeatherModel = new WeatherModel();
      expect(local.getCityCount()).assertEqual(m.getCityCount());
      expect(local.totalCount()).assertEqual(m.totalCount());
      expect(local.getData(0)?.name).assertEqual(m.getData(0)?.name);
      expect(m.getCity('nohit830') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

