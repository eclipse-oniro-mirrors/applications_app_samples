/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, it, expect } from '@ohos/hypium';
import model from '../Shared/AdaptiveModel';

const DOMAIN = 0xF811;
const TAG = '[Sample_jsAdaptiveCapabilities]';
const YIELD_MS = 10;

function yieldThread() {
  return new Promise(function (resolve) {
    setTimeout(function () {
      resolve();
    }, YIELD_MS);
  });
}

function GestureThresholdPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1821
     * @tc.name    JsGesture001
     * @tc.desc    Gesture distance 31 velocity 17 thresholds 30/200 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture001', 0, async function () {
      await yieldThread();
      const distance = 31;
      const velocity = 17;
      expect(model.gestureAccepted(distance, velocity, 30, 200)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 30, 200)).assertEqual(true);
      expect(model.gestureAccepted(29, 199, 30, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1822
     * @tc.name    JsGesture002
     * @tc.desc    Gesture distance 62 velocity 34 thresholds 40/300 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture002', 0, async function () {
      await yieldThread();
      const distance = 62;
      const velocity = 34;
      expect(model.gestureAccepted(distance, velocity, 40, 300)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 40, 300)).assertEqual(true);
      expect(model.gestureAccepted(39, 299, 40, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1823
     * @tc.name    JsGesture003
     * @tc.desc    Gesture distance 93 velocity 51 thresholds 50/400 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture003', 0, async function () {
      await yieldThread();
      const distance = 93;
      const velocity = 51;
      expect(model.gestureAccepted(distance, velocity, 50, 400)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 50, 400)).assertEqual(true);
      expect(model.gestureAccepted(49, 399, 50, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1824
     * @tc.name    JsGesture004
     * @tc.desc    Gesture distance 124 velocity 68 thresholds 60/500 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture004', 0, async function () {
      await yieldThread();
      const distance = 124;
      const velocity = 68;
      expect(model.gestureAccepted(distance, velocity, 60, 500)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 60, 500)).assertEqual(true);
      expect(model.gestureAccepted(59, 499, 60, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture004 done');
    });
}

function GestureThresholdPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1825
     * @tc.name    JsGesture005
     * @tc.desc    Gesture distance 155 velocity 85 thresholds 20/600 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture005', 0, async function () {
      await yieldThread();
      const distance = 155;
      const velocity = 85;
      expect(model.gestureAccepted(distance, velocity, 20, 600)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 20, 600)).assertEqual(true);
      expect(model.gestureAccepted(19, 599, 20, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1826
     * @tc.name    JsGesture006
     * @tc.desc    Gesture distance 186 velocity 102 thresholds 30/700 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture006', 0, async function () {
      await yieldThread();
      const distance = 186;
      const velocity = 102;
      expect(model.gestureAccepted(distance, velocity, 30, 700)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 30, 700)).assertEqual(true);
      expect(model.gestureAccepted(29, 699, 30, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1827
     * @tc.name    JsGesture007
     * @tc.desc    Gesture distance 17 velocity 119 thresholds 40/100 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture007', 0, async function () {
      await yieldThread();
      const distance = 17;
      const velocity = 119;
      expect(model.gestureAccepted(distance, velocity, 40, 100)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 40, 100)).assertEqual(true);
      expect(model.gestureAccepted(39, 99, 40, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1828
     * @tc.name    JsGesture008
     * @tc.desc    Gesture distance 48 velocity 136 thresholds 50/200 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture008', 0, async function () {
      await yieldThread();
      const distance = 48;
      const velocity = 136;
      expect(model.gestureAccepted(distance, velocity, 50, 200)).assertEqual(false);
      expect(model.gestureAccepted(50, 0, 50, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 50, 200)).assertEqual(true);
      expect(model.gestureAccepted(49, 199, 50, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture008 done');
    });
}

function GestureThresholdPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1829
     * @tc.name    JsGesture009
     * @tc.desc    Gesture distance 79 velocity 153 thresholds 60/300 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture009', 0, async function () {
      await yieldThread();
      const distance = 79;
      const velocity = 153;
      expect(model.gestureAccepted(distance, velocity, 60, 300)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 60, 300)).assertEqual(true);
      expect(model.gestureAccepted(59, 299, 60, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1830
     * @tc.name    JsGesture010
     * @tc.desc    Gesture distance 110 velocity 170 thresholds 20/400 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture010', 0, async function () {
      await yieldThread();
      const distance = 110;
      const velocity = 170;
      expect(model.gestureAccepted(distance, velocity, 20, 400)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 20, 400)).assertEqual(true);
      expect(model.gestureAccepted(19, 399, 20, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1831
     * @tc.name    JsGesture011
     * @tc.desc    Gesture distance 141 velocity 187 thresholds 30/500 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture011', 0, async function () {
      await yieldThread();
      const distance = 141;
      const velocity = 187;
      expect(model.gestureAccepted(distance, velocity, 30, 500)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 30, 500)).assertEqual(true);
      expect(model.gestureAccepted(29, 499, 30, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1832
     * @tc.name    JsGesture012
     * @tc.desc    Gesture distance 172 velocity 204 thresholds 40/600 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture012', 0, async function () {
      await yieldThread();
      const distance = 172;
      const velocity = 204;
      expect(model.gestureAccepted(distance, velocity, 40, 600)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 40, 600)).assertEqual(true);
      expect(model.gestureAccepted(39, 599, 40, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture012 done');
    });
}

function GestureThresholdPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1833
     * @tc.name    JsGesture013
     * @tc.desc    Gesture distance 3 velocity 221 thresholds 50/700 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture013', 0, async function () {
      await yieldThread();
      const distance = 3;
      const velocity = 221;
      expect(model.gestureAccepted(distance, velocity, 50, 700)).assertEqual(false);
      expect(model.gestureAccepted(50, 0, 50, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 50, 700)).assertEqual(true);
      expect(model.gestureAccepted(49, 699, 50, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1834
     * @tc.name    JsGesture014
     * @tc.desc    Gesture distance 34 velocity 238 thresholds 60/100 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture014', 0, async function () {
      await yieldThread();
      const distance = 34;
      const velocity = 238;
      expect(model.gestureAccepted(distance, velocity, 60, 100)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 60, 100)).assertEqual(true);
      expect(model.gestureAccepted(59, 99, 60, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1835
     * @tc.name    JsGesture015
     * @tc.desc    Gesture distance 65 velocity 255 thresholds 20/200 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture015', 0, async function () {
      await yieldThread();
      const distance = 65;
      const velocity = 255;
      expect(model.gestureAccepted(distance, velocity, 20, 200)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 20, 200)).assertEqual(true);
      expect(model.gestureAccepted(19, 199, 20, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture015 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1836
     * @tc.name    JsGesture016
     * @tc.desc    Gesture distance 96 velocity 272 thresholds 30/300 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture016', 0, async function () {
      await yieldThread();
      const distance = 96;
      const velocity = 272;
      expect(model.gestureAccepted(distance, velocity, 30, 300)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 30, 300)).assertEqual(true);
      expect(model.gestureAccepted(29, 299, 30, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture016 done');
    });
}

function GestureThresholdPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1837
     * @tc.name    JsGesture017
     * @tc.desc    Gesture distance 127 velocity 289 thresholds 40/400 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture017', 0, async function () {
      await yieldThread();
      const distance = 127;
      const velocity = 289;
      expect(model.gestureAccepted(distance, velocity, 40, 400)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 40, 400)).assertEqual(true);
      expect(model.gestureAccepted(39, 399, 40, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1838
     * @tc.name    JsGesture018
     * @tc.desc    Gesture distance 158 velocity 306 thresholds 50/500 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture018', 0, async function () {
      await yieldThread();
      const distance = 158;
      const velocity = 306;
      expect(model.gestureAccepted(distance, velocity, 50, 500)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 50, 500)).assertEqual(true);
      expect(model.gestureAccepted(49, 499, 50, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1839
     * @tc.name    JsGesture019
     * @tc.desc    Gesture distance 189 velocity 323 thresholds 60/600 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture019', 0, async function () {
      await yieldThread();
      const distance = 189;
      const velocity = 323;
      expect(model.gestureAccepted(distance, velocity, 60, 600)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 60, 600)).assertEqual(true);
      expect(model.gestureAccepted(59, 599, 60, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1840
     * @tc.name    JsGesture020
     * @tc.desc    Gesture distance 20 velocity 340 thresholds 20/700 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture020', 0, async function () {
      await yieldThread();
      const distance = 20;
      const velocity = 340;
      expect(model.gestureAccepted(distance, velocity, 20, 700)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 20, 700)).assertEqual(true);
      expect(model.gestureAccepted(19, 699, 20, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture020 done');
    });
}

function GestureThresholdPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1841
     * @tc.name    JsGesture021
     * @tc.desc    Gesture distance 51 velocity 357 thresholds 30/100 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture021', 0, async function () {
      await yieldThread();
      const distance = 51;
      const velocity = 357;
      expect(model.gestureAccepted(distance, velocity, 30, 100)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 30, 100)).assertEqual(true);
      expect(model.gestureAccepted(29, 99, 30, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1842
     * @tc.name    JsGesture022
     * @tc.desc    Gesture distance 82 velocity 374 thresholds 40/200 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture022', 0, async function () {
      await yieldThread();
      const distance = 82;
      const velocity = 374;
      expect(model.gestureAccepted(distance, velocity, 40, 200)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 40, 200)).assertEqual(true);
      expect(model.gestureAccepted(39, 199, 40, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1843
     * @tc.name    JsGesture023
     * @tc.desc    Gesture distance 113 velocity 391 thresholds 50/300 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture023', 0, async function () {
      await yieldThread();
      const distance = 113;
      const velocity = 391;
      expect(model.gestureAccepted(distance, velocity, 50, 300)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 50, 300)).assertEqual(true);
      expect(model.gestureAccepted(49, 299, 50, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1844
     * @tc.name    JsGesture024
     * @tc.desc    Gesture distance 144 velocity 408 thresholds 60/400 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture024', 0, async function () {
      await yieldThread();
      const distance = 144;
      const velocity = 408;
      expect(model.gestureAccepted(distance, velocity, 60, 400)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 60, 400)).assertEqual(true);
      expect(model.gestureAccepted(59, 399, 60, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture024 done');
    });
}

function GestureThresholdPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1845
     * @tc.name    JsGesture025
     * @tc.desc    Gesture distance 175 velocity 425 thresholds 20/500 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture025', 0, async function () {
      await yieldThread();
      const distance = 175;
      const velocity = 425;
      expect(model.gestureAccepted(distance, velocity, 20, 500)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 20, 500)).assertEqual(true);
      expect(model.gestureAccepted(19, 499, 20, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1846
     * @tc.name    JsGesture026
     * @tc.desc    Gesture distance 6 velocity 442 thresholds 30/600 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture026', 0, async function () {
      await yieldThread();
      const distance = 6;
      const velocity = 442;
      expect(model.gestureAccepted(distance, velocity, 30, 600)).assertEqual(false);
      expect(model.gestureAccepted(30, 0, 30, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 30, 600)).assertEqual(true);
      expect(model.gestureAccepted(29, 599, 30, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1847
     * @tc.name    JsGesture027
     * @tc.desc    Gesture distance 37 velocity 459 thresholds 40/700 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture027', 0, async function () {
      await yieldThread();
      const distance = 37;
      const velocity = 459;
      expect(model.gestureAccepted(distance, velocity, 40, 700)).assertEqual(false);
      expect(model.gestureAccepted(40, 0, 40, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 40, 700)).assertEqual(true);
      expect(model.gestureAccepted(39, 699, 40, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1848
     * @tc.name    JsGesture028
     * @tc.desc    Gesture distance 68 velocity 476 thresholds 50/100 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture028', 0, async function () {
      await yieldThread();
      const distance = 68;
      const velocity = 476;
      expect(model.gestureAccepted(distance, velocity, 50, 100)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 50, 100)).assertEqual(true);
      expect(model.gestureAccepted(49, 99, 50, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture028 done');
    });
}

function GestureThresholdPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1849
     * @tc.name    JsGesture029
     * @tc.desc    Gesture distance 99 velocity 493 thresholds 60/200 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture029', 0, async function () {
      await yieldThread();
      const distance = 99;
      const velocity = 493;
      expect(model.gestureAccepted(distance, velocity, 60, 200)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 60, 200)).assertEqual(true);
      expect(model.gestureAccepted(59, 199, 60, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1850
     * @tc.name    JsGesture030
     * @tc.desc    Gesture distance 130 velocity 510 thresholds 20/300 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture030', 0, async function () {
      await yieldThread();
      const distance = 130;
      const velocity = 510;
      expect(model.gestureAccepted(distance, velocity, 20, 300)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 20, 300)).assertEqual(true);
      expect(model.gestureAccepted(19, 299, 20, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture030 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1851
     * @tc.name    JsGesture031
     * @tc.desc    Gesture distance 161 velocity 527 thresholds 30/400 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture031', 0, async function () {
      await yieldThread();
      const distance = 161;
      const velocity = 527;
      expect(model.gestureAccepted(distance, velocity, 30, 400)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 30, 400)).assertEqual(true);
      expect(model.gestureAccepted(29, 399, 30, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1852
     * @tc.name    JsGesture032
     * @tc.desc    Gesture distance 192 velocity 544 thresholds 40/500 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture032', 0, async function () {
      await yieldThread();
      const distance = 192;
      const velocity = 544;
      expect(model.gestureAccepted(distance, velocity, 40, 500)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 40, 500)).assertEqual(true);
      expect(model.gestureAccepted(39, 499, 40, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture032 done');
    });
}

function GestureThresholdPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1853
     * @tc.name    JsGesture033
     * @tc.desc    Gesture distance 23 velocity 561 thresholds 50/600 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture033', 0, async function () {
      await yieldThread();
      const distance = 23;
      const velocity = 561;
      expect(model.gestureAccepted(distance, velocity, 50, 600)).assertEqual(false);
      expect(model.gestureAccepted(50, 0, 50, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 50, 600)).assertEqual(true);
      expect(model.gestureAccepted(49, 599, 50, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1854
     * @tc.name    JsGesture034
     * @tc.desc    Gesture distance 54 velocity 578 thresholds 60/700 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture034', 0, async function () {
      await yieldThread();
      const distance = 54;
      const velocity = 578;
      expect(model.gestureAccepted(distance, velocity, 60, 700)).assertEqual(false);
      expect(model.gestureAccepted(60, 0, 60, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 60, 700)).assertEqual(true);
      expect(model.gestureAccepted(59, 699, 60, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1855
     * @tc.name    JsGesture035
     * @tc.desc    Gesture distance 85 velocity 595 thresholds 20/100 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture035', 0, async function () {
      await yieldThread();
      const distance = 85;
      const velocity = 595;
      expect(model.gestureAccepted(distance, velocity, 20, 100)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 20, 100)).assertEqual(true);
      expect(model.gestureAccepted(19, 99, 20, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1856
     * @tc.name    JsGesture036
     * @tc.desc    Gesture distance 116 velocity 612 thresholds 30/200 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture036', 0, async function () {
      await yieldThread();
      const distance = 116;
      const velocity = 612;
      expect(model.gestureAccepted(distance, velocity, 30, 200)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 30, 200)).assertEqual(true);
      expect(model.gestureAccepted(29, 199, 30, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture036 done');
    });
}

function GestureThresholdPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1857
     * @tc.name    JsGesture037
     * @tc.desc    Gesture distance 147 velocity 629 thresholds 40/300 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture037', 0, async function () {
      await yieldThread();
      const distance = 147;
      const velocity = 629;
      expect(model.gestureAccepted(distance, velocity, 40, 300)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 40, 300)).assertEqual(true);
      expect(model.gestureAccepted(39, 299, 40, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1858
     * @tc.name    JsGesture038
     * @tc.desc    Gesture distance 178 velocity 646 thresholds 50/400 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture038', 0, async function () {
      await yieldThread();
      const distance = 178;
      const velocity = 646;
      expect(model.gestureAccepted(distance, velocity, 50, 400)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 50, 400)).assertEqual(true);
      expect(model.gestureAccepted(49, 399, 50, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1859
     * @tc.name    JsGesture039
     * @tc.desc    Gesture distance 9 velocity 663 thresholds 60/500 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture039', 0, async function () {
      await yieldThread();
      const distance = 9;
      const velocity = 663;
      expect(model.gestureAccepted(distance, velocity, 60, 500)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 60, 500)).assertEqual(true);
      expect(model.gestureAccepted(59, 499, 60, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1860
     * @tc.name    JsGesture040
     * @tc.desc    Gesture distance 40 velocity 680 thresholds 20/600 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture040', 0, async function () {
      await yieldThread();
      const distance = 40;
      const velocity = 680;
      expect(model.gestureAccepted(distance, velocity, 20, 600)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 20, 600)).assertEqual(true);
      expect(model.gestureAccepted(19, 599, 20, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture040 done');
    });
}

function GestureThresholdPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1861
     * @tc.name    JsGesture041
     * @tc.desc    Gesture distance 71 velocity 697 thresholds 30/700 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture041', 0, async function () {
      await yieldThread();
      const distance = 71;
      const velocity = 697;
      expect(model.gestureAccepted(distance, velocity, 30, 700)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 30, 700)).assertEqual(true);
      expect(model.gestureAccepted(29, 699, 30, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1862
     * @tc.name    JsGesture042
     * @tc.desc    Gesture distance 102 velocity 714 thresholds 40/100 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture042', 0, async function () {
      await yieldThread();
      const distance = 102;
      const velocity = 714;
      expect(model.gestureAccepted(distance, velocity, 40, 100)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 40, 100)).assertEqual(true);
      expect(model.gestureAccepted(39, 99, 40, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1863
     * @tc.name    JsGesture043
     * @tc.desc    Gesture distance 133 velocity 731 thresholds 50/200 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture043', 0, async function () {
      await yieldThread();
      const distance = 133;
      const velocity = 731;
      expect(model.gestureAccepted(distance, velocity, 50, 200)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 50, 200)).assertEqual(true);
      expect(model.gestureAccepted(49, 199, 50, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1864
     * @tc.name    JsGesture044
     * @tc.desc    Gesture distance 164 velocity 748 thresholds 60/300 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture044', 0, async function () {
      await yieldThread();
      const distance = 164;
      const velocity = 748;
      expect(model.gestureAccepted(distance, velocity, 60, 300)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 60, 300)).assertEqual(true);
      expect(model.gestureAccepted(59, 299, 60, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture044 done');
    });
}

function GestureThresholdPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1865
     * @tc.name    JsGesture045
     * @tc.desc    Gesture distance 195 velocity 765 thresholds 20/400 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture045', 0, async function () {
      await yieldThread();
      const distance = 195;
      const velocity = 765;
      expect(model.gestureAccepted(distance, velocity, 20, 400)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 20, 400)).assertEqual(true);
      expect(model.gestureAccepted(19, 399, 20, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture045 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1866
     * @tc.name    JsGesture046
     * @tc.desc    Gesture distance 26 velocity 782 thresholds 30/500 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture046', 0, async function () {
      await yieldThread();
      const distance = 26;
      const velocity = 782;
      expect(model.gestureAccepted(distance, velocity, 30, 500)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 30, 500)).assertEqual(true);
      expect(model.gestureAccepted(29, 499, 30, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1867
     * @tc.name    JsGesture047
     * @tc.desc    Gesture distance 57 velocity 799 thresholds 40/600 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture047', 0, async function () {
      await yieldThread();
      const distance = 57;
      const velocity = 799;
      expect(model.gestureAccepted(distance, velocity, 40, 600)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 40, 600)).assertEqual(true);
      expect(model.gestureAccepted(39, 599, 40, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1868
     * @tc.name    JsGesture048
     * @tc.desc    Gesture distance 88 velocity 816 thresholds 50/700 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture048', 0, async function () {
      await yieldThread();
      const distance = 88;
      const velocity = 816;
      expect(model.gestureAccepted(distance, velocity, 50, 700)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 50, 700)).assertEqual(true);
      expect(model.gestureAccepted(49, 699, 50, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture048 done');
    });
}

function GestureThresholdPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1869
     * @tc.name    JsGesture049
     * @tc.desc    Gesture distance 119 velocity 833 thresholds 60/100 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture049', 0, async function () {
      await yieldThread();
      const distance = 119;
      const velocity = 833;
      expect(model.gestureAccepted(distance, velocity, 60, 100)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 60, 100)).assertEqual(true);
      expect(model.gestureAccepted(59, 99, 60, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1870
     * @tc.name    JsGesture050
     * @tc.desc    Gesture distance 150 velocity 850 thresholds 20/200 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture050', 0, async function () {
      await yieldThread();
      const distance = 150;
      const velocity = 850;
      expect(model.gestureAccepted(distance, velocity, 20, 200)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 20, 200)).assertEqual(true);
      expect(model.gestureAccepted(19, 199, 20, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1871
     * @tc.name    JsGesture051
     * @tc.desc    Gesture distance 181 velocity 867 thresholds 30/300 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture051', 0, async function () {
      await yieldThread();
      const distance = 181;
      const velocity = 867;
      expect(model.gestureAccepted(distance, velocity, 30, 300)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 30, 300)).assertEqual(true);
      expect(model.gestureAccepted(29, 299, 30, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1872
     * @tc.name    JsGesture052
     * @tc.desc    Gesture distance 12 velocity 884 thresholds 40/400 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture052', 0, async function () {
      await yieldThread();
      const distance = 12;
      const velocity = 884;
      expect(model.gestureAccepted(distance, velocity, 40, 400)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 40, 400)).assertEqual(true);
      expect(model.gestureAccepted(39, 399, 40, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture052 done');
    });
}

function GestureThresholdPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1873
     * @tc.name    JsGesture053
     * @tc.desc    Gesture distance 43 velocity 901 thresholds 50/500 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture053', 0, async function () {
      await yieldThread();
      const distance = 43;
      const velocity = 901;
      expect(model.gestureAccepted(distance, velocity, 50, 500)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 50, 500)).assertEqual(true);
      expect(model.gestureAccepted(49, 499, 50, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1874
     * @tc.name    JsGesture054
     * @tc.desc    Gesture distance 74 velocity 918 thresholds 60/600 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture054', 0, async function () {
      await yieldThread();
      const distance = 74;
      const velocity = 918;
      expect(model.gestureAccepted(distance, velocity, 60, 600)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 60, 600)).assertEqual(true);
      expect(model.gestureAccepted(59, 599, 60, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture054 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1875
     * @tc.name    JsGesture055
     * @tc.desc    Gesture distance 105 velocity 935 thresholds 20/700 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture055', 0, async function () {
      await yieldThread();
      const distance = 105;
      const velocity = 935;
      expect(model.gestureAccepted(distance, velocity, 20, 700)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 20, 700)).assertEqual(true);
      expect(model.gestureAccepted(19, 699, 20, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1876
     * @tc.name    JsGesture056
     * @tc.desc    Gesture distance 136 velocity 952 thresholds 30/100 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture056', 0, async function () {
      await yieldThread();
      const distance = 136;
      const velocity = 952;
      expect(model.gestureAccepted(distance, velocity, 30, 100)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 30, 100)).assertEqual(true);
      expect(model.gestureAccepted(29, 99, 30, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture056 done');
    });
}

function GestureThresholdPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1877
     * @tc.name    JsGesture057
     * @tc.desc    Gesture distance 167 velocity 969 thresholds 40/200 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture057', 0, async function () {
      await yieldThread();
      const distance = 167;
      const velocity = 969;
      expect(model.gestureAccepted(distance, velocity, 40, 200)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 40, 200)).assertEqual(true);
      expect(model.gestureAccepted(39, 199, 40, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1878
     * @tc.name    JsGesture058
     * @tc.desc    Gesture distance 198 velocity 986 thresholds 50/300 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture058', 0, async function () {
      await yieldThread();
      const distance = 198;
      const velocity = 986;
      expect(model.gestureAccepted(distance, velocity, 50, 300)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 50, 300)).assertEqual(true);
      expect(model.gestureAccepted(49, 299, 50, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1879
     * @tc.name    JsGesture059
     * @tc.desc    Gesture distance 29 velocity 1003 thresholds 60/400 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture059', 0, async function () {
      await yieldThread();
      const distance = 29;
      const velocity = 1003;
      expect(model.gestureAccepted(distance, velocity, 60, 400)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 60, 400)).assertEqual(true);
      expect(model.gestureAccepted(59, 399, 60, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1880
     * @tc.name    JsGesture060
     * @tc.desc    Gesture distance 60 velocity 1020 thresholds 20/500 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture060', 0, async function () {
      await yieldThread();
      const distance = 60;
      const velocity = 1020;
      expect(model.gestureAccepted(distance, velocity, 20, 500)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 20, 500)).assertEqual(true);
      expect(model.gestureAccepted(19, 499, 20, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture060 done');
    });
}

function GestureThresholdPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1881
     * @tc.name    JsGesture061
     * @tc.desc    Gesture distance 91 velocity 1037 thresholds 30/600 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture061', 0, async function () {
      await yieldThread();
      const distance = 91;
      const velocity = 1037;
      expect(model.gestureAccepted(distance, velocity, 30, 600)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 30, 600)).assertEqual(true);
      expect(model.gestureAccepted(29, 599, 30, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1882
     * @tc.name    JsGesture062
     * @tc.desc    Gesture distance 122 velocity 1054 thresholds 40/700 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture062', 0, async function () {
      await yieldThread();
      const distance = 122;
      const velocity = 1054;
      expect(model.gestureAccepted(distance, velocity, 40, 700)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 40, 700)).assertEqual(true);
      expect(model.gestureAccepted(39, 699, 40, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1883
     * @tc.name    JsGesture063
     * @tc.desc    Gesture distance 153 velocity 1071 thresholds 50/100 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture063', 0, async function () {
      await yieldThread();
      const distance = 153;
      const velocity = 1071;
      expect(model.gestureAccepted(distance, velocity, 50, 100)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 50, 100)).assertEqual(true);
      expect(model.gestureAccepted(49, 99, 50, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1884
     * @tc.name    JsGesture064
     * @tc.desc    Gesture distance 184 velocity 1088 thresholds 60/200 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture064', 0, async function () {
      await yieldThread();
      const distance = 184;
      const velocity = 1088;
      expect(model.gestureAccepted(distance, velocity, 60, 200)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 60, 200)).assertEqual(true);
      expect(model.gestureAccepted(59, 199, 60, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture064 done');
    });
}

function GestureThresholdPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1885
     * @tc.name    JsGesture065
     * @tc.desc    Gesture distance 15 velocity 1105 thresholds 20/300 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture065', 0, async function () {
      await yieldThread();
      const distance = 15;
      const velocity = 1105;
      expect(model.gestureAccepted(distance, velocity, 20, 300)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 20, 300)).assertEqual(true);
      expect(model.gestureAccepted(19, 299, 20, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1886
     * @tc.name    JsGesture066
     * @tc.desc    Gesture distance 46 velocity 1122 thresholds 30/400 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture066', 0, async function () {
      await yieldThread();
      const distance = 46;
      const velocity = 1122;
      expect(model.gestureAccepted(distance, velocity, 30, 400)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 30, 400)).assertEqual(true);
      expect(model.gestureAccepted(29, 399, 30, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture066 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1887
     * @tc.name    JsGesture067
     * @tc.desc    Gesture distance 77 velocity 1139 thresholds 40/500 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture067', 0, async function () {
      await yieldThread();
      const distance = 77;
      const velocity = 1139;
      expect(model.gestureAccepted(distance, velocity, 40, 500)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 40, 500)).assertEqual(true);
      expect(model.gestureAccepted(39, 499, 40, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1888
     * @tc.name    JsGesture068
     * @tc.desc    Gesture distance 108 velocity 1156 thresholds 50/600 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture068', 0, async function () {
      await yieldThread();
      const distance = 108;
      const velocity = 1156;
      expect(model.gestureAccepted(distance, velocity, 50, 600)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 50, 600)).assertEqual(true);
      expect(model.gestureAccepted(49, 599, 50, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture068 done');
    });
}

function GestureThresholdPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1889
     * @tc.name    JsGesture069
     * @tc.desc    Gesture distance 139 velocity 1173 thresholds 60/700 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture069', 0, async function () {
      await yieldThread();
      const distance = 139;
      const velocity = 1173;
      expect(model.gestureAccepted(distance, velocity, 60, 700)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 60, 700)).assertEqual(true);
      expect(model.gestureAccepted(59, 699, 60, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1890
     * @tc.name    JsGesture070
     * @tc.desc    Gesture distance 170 velocity 1190 thresholds 20/100 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture070', 0, async function () {
      await yieldThread();
      const distance = 170;
      const velocity = 1190;
      expect(model.gestureAccepted(distance, velocity, 20, 100)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 20, 100)).assertEqual(true);
      expect(model.gestureAccepted(19, 99, 20, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1891
     * @tc.name    JsGesture071
     * @tc.desc    Gesture distance 1 velocity 1207 thresholds 30/200 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture071', 0, async function () {
      await yieldThread();
      const distance = 1;
      const velocity = 1207;
      expect(model.gestureAccepted(distance, velocity, 30, 200)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 30, 200)).assertEqual(true);
      expect(model.gestureAccepted(29, 199, 30, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1892
     * @tc.name    JsGesture072
     * @tc.desc    Gesture distance 32 velocity 1224 thresholds 40/300 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture072', 0, async function () {
      await yieldThread();
      const distance = 32;
      const velocity = 1224;
      expect(model.gestureAccepted(distance, velocity, 40, 300)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 40, 300)).assertEqual(true);
      expect(model.gestureAccepted(39, 299, 40, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture072 done');
    });
}

function GestureThresholdPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1893
     * @tc.name    JsGesture073
     * @tc.desc    Gesture distance 63 velocity 1241 thresholds 50/400 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture073', 0, async function () {
      await yieldThread();
      const distance = 63;
      const velocity = 1241;
      expect(model.gestureAccepted(distance, velocity, 50, 400)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 50, 400)).assertEqual(true);
      expect(model.gestureAccepted(49, 399, 50, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1894
     * @tc.name    JsGesture074
     * @tc.desc    Gesture distance 94 velocity 1258 thresholds 60/500 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture074', 0, async function () {
      await yieldThread();
      const distance = 94;
      const velocity = 1258;
      expect(model.gestureAccepted(distance, velocity, 60, 500)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 500)).assertEqual(true);
      expect(model.gestureAccepted(0, 500, 60, 500)).assertEqual(true);
      expect(model.gestureAccepted(59, 499, 60, 500)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1895
     * @tc.name    JsGesture075
     * @tc.desc    Gesture distance 125 velocity 1275 thresholds 20/600 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture075', 0, async function () {
      await yieldThread();
      const distance = 125;
      const velocity = 1275;
      expect(model.gestureAccepted(distance, velocity, 20, 600)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 600)).assertEqual(true);
      expect(model.gestureAccepted(0, 600, 20, 600)).assertEqual(true);
      expect(model.gestureAccepted(19, 599, 20, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture075 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1896
     * @tc.name    JsGesture076
     * @tc.desc    Gesture distance 156 velocity 1292 thresholds 30/700 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture076', 0, async function () {
      await yieldThread();
      const distance = 156;
      const velocity = 1292;
      expect(model.gestureAccepted(distance, velocity, 30, 700)).assertEqual(true);
      expect(model.gestureAccepted(30, 0, 30, 700)).assertEqual(true);
      expect(model.gestureAccepted(0, 700, 30, 700)).assertEqual(true);
      expect(model.gestureAccepted(29, 699, 30, 700)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture076 done');
    });
}

function GestureThresholdPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1897
     * @tc.name    JsGesture077
     * @tc.desc    Gesture distance 187 velocity 1309 thresholds 40/100 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture077', 0, async function () {
      await yieldThread();
      const distance = 187;
      const velocity = 1309;
      expect(model.gestureAccepted(distance, velocity, 40, 100)).assertEqual(true);
      expect(model.gestureAccepted(40, 0, 40, 100)).assertEqual(true);
      expect(model.gestureAccepted(0, 100, 40, 100)).assertEqual(true);
      expect(model.gestureAccepted(39, 99, 40, 100)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1898
     * @tc.name    JsGesture078
     * @tc.desc    Gesture distance 18 velocity 1326 thresholds 50/200 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture078', 0, async function () {
      await yieldThread();
      const distance = 18;
      const velocity = 1326;
      expect(model.gestureAccepted(distance, velocity, 50, 200)).assertEqual(true);
      expect(model.gestureAccepted(50, 0, 50, 200)).assertEqual(true);
      expect(model.gestureAccepted(0, 200, 50, 200)).assertEqual(true);
      expect(model.gestureAccepted(49, 199, 50, 200)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture078 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1899
     * @tc.name    JsGesture079
     * @tc.desc    Gesture distance 49 velocity 1343 thresholds 60/300 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture079', 0, async function () {
      await yieldThread();
      const distance = 49;
      const velocity = 1343;
      expect(model.gestureAccepted(distance, velocity, 60, 300)).assertEqual(true);
      expect(model.gestureAccepted(60, 0, 60, 300)).assertEqual(true);
      expect(model.gestureAccepted(0, 300, 60, 300)).assertEqual(true);
      expect(model.gestureAccepted(59, 299, 60, 300)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1900
     * @tc.name    JsGesture080
     * @tc.desc    Gesture distance 80 velocity 1360 thresholds 20/400 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsGesture080', 0, async function () {
      await yieldThread();
      const distance = 80;
      const velocity = 1360;
      expect(model.gestureAccepted(distance, velocity, 20, 400)).assertEqual(true);
      expect(model.gestureAccepted(20, 0, 20, 400)).assertEqual(true);
      expect(model.gestureAccepted(0, 400, 20, 400)).assertEqual(true);
      expect(model.gestureAccepted(19, 399, 20, 400)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsGesture080 done');
    });
}

export default function gestureThresholdSuite() {
  describe('GestureThresholdSuite', function () {
    GestureThresholdPart001();
    GestureThresholdPart002();
    GestureThresholdPart003();
    GestureThresholdPart004();
    GestureThresholdPart005();
    GestureThresholdPart006();
    GestureThresholdPart007();
    GestureThresholdPart008();
    GestureThresholdPart009();
    GestureThresholdPart010();
    GestureThresholdPart011();
    GestureThresholdPart012();
    GestureThresholdPart013();
    GestureThresholdPart014();
    GestureThresholdPart015();
    GestureThresholdPart016();
    GestureThresholdPart017();
    GestureThresholdPart018();
    GestureThresholdPart019();
    GestureThresholdPart020();
  });
}
