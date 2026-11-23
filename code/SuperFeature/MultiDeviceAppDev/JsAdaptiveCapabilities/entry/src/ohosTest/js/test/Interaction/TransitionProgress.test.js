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

function TransitionProgressPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1961
     * @tc.name    JsTransition001
     * @tc.desc    Transition elapsed -47 of 137 reaches 0 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition001', 0, async function () {
      await yieldThread();
      const duration = 137;
      const elapsed = -47;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-47, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1962
     * @tc.name    JsTransition002
     * @tc.desc    Transition elapsed 6 of 174 reaches 3 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition002', 0, async function () {
      await yieldThread();
      const duration = 174;
      const elapsed = 6;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(3);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(6, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1963
     * @tc.name    JsTransition003
     * @tc.desc    Transition elapsed 59 of 211 reaches 27 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition003', 0, async function () {
      await yieldThread();
      const duration = 211;
      const elapsed = 59;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(27);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(59, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1964
     * @tc.name    JsTransition004
     * @tc.desc    Transition elapsed 112 of 248 reaches 45 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition004', 0, async function () {
      await yieldThread();
      const duration = 248;
      const elapsed = 112;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(45);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(112, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition004 done');
    });
}

function TransitionProgressPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1965
     * @tc.name    JsTransition005
     * @tc.desc    Transition elapsed 165 of 285 reaches 57 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition005', 0, async function () {
      await yieldThread();
      const duration = 285;
      const elapsed = 165;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(57);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(165, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1966
     * @tc.name    JsTransition006
     * @tc.desc    Transition elapsed 218 of 322 reaches 67 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition006', 0, async function () {
      await yieldThread();
      const duration = 322;
      const elapsed = 218;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(67);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(218, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1967
     * @tc.name    JsTransition007
     * @tc.desc    Transition elapsed 271 of 359 reaches 75 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition007', 0, async function () {
      await yieldThread();
      const duration = 359;
      const elapsed = 271;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(75);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(271, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1968
     * @tc.name    JsTransition008
     * @tc.desc    Transition elapsed 324 of 396 reaches 81 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition008', 0, async function () {
      await yieldThread();
      const duration = 396;
      const elapsed = 324;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(81);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(324, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition008 done');
    });
}

function TransitionProgressPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1969
     * @tc.name    JsTransition009
     * @tc.desc    Transition elapsed 377 of 433 reaches 87 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition009', 0, async function () {
      await yieldThread();
      const duration = 433;
      const elapsed = 377;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(87);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(377, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1970
     * @tc.name    JsTransition010
     * @tc.desc    Transition elapsed 430 of 470 reaches 91 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition010', 0, async function () {
      await yieldThread();
      const duration = 470;
      const elapsed = 430;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(91);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(430, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1971
     * @tc.name    JsTransition011
     * @tc.desc    Transition elapsed 483 of 507 reaches 95 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition011', 0, async function () {
      await yieldThread();
      const duration = 507;
      const elapsed = 483;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(95);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(483, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1972
     * @tc.name    JsTransition012
     * @tc.desc    Transition elapsed 536 of 544 reaches 98 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition012', 0, async function () {
      await yieldThread();
      const duration = 544;
      const elapsed = 536;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(98);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(536, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition012 done');
    });
}

function TransitionProgressPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1973
     * @tc.name    JsTransition013
     * @tc.desc    Transition elapsed 589 of 581 reaches 100 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition013', 0, async function () {
      await yieldThread();
      const duration = 581;
      const elapsed = 589;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(589, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1974
     * @tc.name    JsTransition014
     * @tc.desc    Transition elapsed 642 of 618 reaches 100 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition014', 0, async function () {
      await yieldThread();
      const duration = 618;
      const elapsed = 642;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(642, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1975
     * @tc.name    JsTransition015
     * @tc.desc    Transition elapsed 695 of 655 reaches 100 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition015', 0, async function () {
      await yieldThread();
      const duration = 655;
      const elapsed = 695;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(695, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition015 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1976
     * @tc.name    JsTransition016
     * @tc.desc    Transition elapsed 748 of 692 reaches 100 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition016', 0, async function () {
      await yieldThread();
      const duration = 692;
      const elapsed = 748;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(748, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition016 done');
    });
}

function TransitionProgressPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1977
     * @tc.name    JsTransition017
     * @tc.desc    Transition elapsed 801 of 729 reaches 100 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition017', 0, async function () {
      await yieldThread();
      const duration = 729;
      const elapsed = 801;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(801, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1978
     * @tc.name    JsTransition018
     * @tc.desc    Transition elapsed 854 of 766 reaches 100 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition018', 0, async function () {
      await yieldThread();
      const duration = 766;
      const elapsed = 854;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(854, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1979
     * @tc.name    JsTransition019
     * @tc.desc    Transition elapsed 907 of 803 reaches 100 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition019', 0, async function () {
      await yieldThread();
      const duration = 803;
      const elapsed = 907;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(907, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1980
     * @tc.name    JsTransition020
     * @tc.desc    Transition elapsed 960 of 840 reaches 100 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition020', 0, async function () {
      await yieldThread();
      const duration = 840;
      const elapsed = 960;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(960, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition020 done');
    });
}

function TransitionProgressPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1981
     * @tc.name    JsTransition021
     * @tc.desc    Transition elapsed 1013 of 877 reaches 100 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition021', 0, async function () {
      await yieldThread();
      const duration = 877;
      const elapsed = 1013;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1013, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1982
     * @tc.name    JsTransition022
     * @tc.desc    Transition elapsed 1066 of 914 reaches 100 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition022', 0, async function () {
      await yieldThread();
      const duration = 914;
      const elapsed = 1066;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1066, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1983
     * @tc.name    JsTransition023
     * @tc.desc    Transition elapsed -81 of 951 reaches 0 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition023', 0, async function () {
      await yieldThread();
      const duration = 951;
      const elapsed = -81;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-81, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1984
     * @tc.name    JsTransition024
     * @tc.desc    Transition elapsed -28 of 988 reaches 0 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition024', 0, async function () {
      await yieldThread();
      const duration = 988;
      const elapsed = -28;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-28, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition024 done');
    });
}

function TransitionProgressPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1985
     * @tc.name    JsTransition025
     * @tc.desc    Transition elapsed 25 of 125 reaches 20 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition025', 0, async function () {
      await yieldThread();
      const duration = 125;
      const elapsed = 25;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(20);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(25, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1986
     * @tc.name    JsTransition026
     * @tc.desc    Transition elapsed 78 of 162 reaches 48 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition026', 0, async function () {
      await yieldThread();
      const duration = 162;
      const elapsed = 78;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(48);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(78, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1987
     * @tc.name    JsTransition027
     * @tc.desc    Transition elapsed 131 of 199 reaches 65 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition027', 0, async function () {
      await yieldThread();
      const duration = 199;
      const elapsed = 131;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(65);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(131, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1988
     * @tc.name    JsTransition028
     * @tc.desc    Transition elapsed 184 of 236 reaches 77 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition028', 0, async function () {
      await yieldThread();
      const duration = 236;
      const elapsed = 184;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(77);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(184, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition028 done');
    });
}

function TransitionProgressPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1989
     * @tc.name    JsTransition029
     * @tc.desc    Transition elapsed 237 of 273 reaches 86 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition029', 0, async function () {
      await yieldThread();
      const duration = 273;
      const elapsed = 237;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(86);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(237, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1990
     * @tc.name    JsTransition030
     * @tc.desc    Transition elapsed 290 of 310 reaches 93 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition030', 0, async function () {
      await yieldThread();
      const duration = 310;
      const elapsed = 290;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(93);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(290, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition030 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1991
     * @tc.name    JsTransition031
     * @tc.desc    Transition elapsed 343 of 347 reaches 98 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition031', 0, async function () {
      await yieldThread();
      const duration = 347;
      const elapsed = 343;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(98);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(343, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1992
     * @tc.name    JsTransition032
     * @tc.desc    Transition elapsed 396 of 384 reaches 100 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition032', 0, async function () {
      await yieldThread();
      const duration = 384;
      const elapsed = 396;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(396, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition032 done');
    });
}

function TransitionProgressPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1993
     * @tc.name    JsTransition033
     * @tc.desc    Transition elapsed 449 of 421 reaches 100 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition033', 0, async function () {
      await yieldThread();
      const duration = 421;
      const elapsed = 449;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(449, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1994
     * @tc.name    JsTransition034
     * @tc.desc    Transition elapsed 502 of 458 reaches 100 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition034', 0, async function () {
      await yieldThread();
      const duration = 458;
      const elapsed = 502;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(502, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1995
     * @tc.name    JsTransition035
     * @tc.desc    Transition elapsed 555 of 495 reaches 100 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition035', 0, async function () {
      await yieldThread();
      const duration = 495;
      const elapsed = 555;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(555, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1996
     * @tc.name    JsTransition036
     * @tc.desc    Transition elapsed 608 of 532 reaches 100 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition036', 0, async function () {
      await yieldThread();
      const duration = 532;
      const elapsed = 608;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(608, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition036 done');
    });
}

function TransitionProgressPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1997
     * @tc.name    JsTransition037
     * @tc.desc    Transition elapsed 661 of 569 reaches 100 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition037', 0, async function () {
      await yieldThread();
      const duration = 569;
      const elapsed = 661;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(661, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1998
     * @tc.name    JsTransition038
     * @tc.desc    Transition elapsed 714 of 606 reaches 100 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition038', 0, async function () {
      await yieldThread();
      const duration = 606;
      const elapsed = 714;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(714, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1999
     * @tc.name    JsTransition039
     * @tc.desc    Transition elapsed 767 of 643 reaches 100 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition039', 0, async function () {
      await yieldThread();
      const duration = 643;
      const elapsed = 767;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(767, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2000
     * @tc.name    JsTransition040
     * @tc.desc    Transition elapsed 820 of 680 reaches 100 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition040', 0, async function () {
      await yieldThread();
      const duration = 680;
      const elapsed = 820;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(820, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition040 done');
    });
}

function TransitionProgressPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2001
     * @tc.name    JsTransition041
     * @tc.desc    Transition elapsed 873 of 717 reaches 100 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition041', 0, async function () {
      await yieldThread();
      const duration = 717;
      const elapsed = 873;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(873, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2002
     * @tc.name    JsTransition042
     * @tc.desc    Transition elapsed 926 of 754 reaches 100 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition042', 0, async function () {
      await yieldThread();
      const duration = 754;
      const elapsed = 926;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(926, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2003
     * @tc.name    JsTransition043
     * @tc.desc    Transition elapsed 979 of 791 reaches 100 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition043', 0, async function () {
      await yieldThread();
      const duration = 791;
      const elapsed = 979;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(979, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2004
     * @tc.name    JsTransition044
     * @tc.desc    Transition elapsed 1032 of 828 reaches 100 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition044', 0, async function () {
      await yieldThread();
      const duration = 828;
      const elapsed = 1032;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1032, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition044 done');
    });
}

function TransitionProgressPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2005
     * @tc.name    JsTransition045
     * @tc.desc    Transition elapsed 1085 of 865 reaches 100 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition045', 0, async function () {
      await yieldThread();
      const duration = 865;
      const elapsed = 1085;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1085, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition045 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2006
     * @tc.name    JsTransition046
     * @tc.desc    Transition elapsed -62 of 902 reaches 0 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition046', 0, async function () {
      await yieldThread();
      const duration = 902;
      const elapsed = -62;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-62, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2007
     * @tc.name    JsTransition047
     * @tc.desc    Transition elapsed -9 of 939 reaches 0 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition047', 0, async function () {
      await yieldThread();
      const duration = 939;
      const elapsed = -9;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-9, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2008
     * @tc.name    JsTransition048
     * @tc.desc    Transition elapsed 44 of 976 reaches 4 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition048', 0, async function () {
      await yieldThread();
      const duration = 976;
      const elapsed = 44;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(4);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(44, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition048 done');
    });
}

function TransitionProgressPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2009
     * @tc.name    JsTransition049
     * @tc.desc    Transition elapsed 97 of 113 reaches 85 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition049', 0, async function () {
      await yieldThread();
      const duration = 113;
      const elapsed = 97;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(85);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(97, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2010
     * @tc.name    JsTransition050
     * @tc.desc    Transition elapsed 150 of 150 reaches 100 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition050', 0, async function () {
      await yieldThread();
      const duration = 150;
      const elapsed = 150;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(150, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2011
     * @tc.name    JsTransition051
     * @tc.desc    Transition elapsed 203 of 187 reaches 100 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition051', 0, async function () {
      await yieldThread();
      const duration = 187;
      const elapsed = 203;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(203, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2012
     * @tc.name    JsTransition052
     * @tc.desc    Transition elapsed 256 of 224 reaches 100 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition052', 0, async function () {
      await yieldThread();
      const duration = 224;
      const elapsed = 256;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(256, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition052 done');
    });
}

function TransitionProgressPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2013
     * @tc.name    JsTransition053
     * @tc.desc    Transition elapsed 309 of 261 reaches 100 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition053', 0, async function () {
      await yieldThread();
      const duration = 261;
      const elapsed = 309;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(309, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2014
     * @tc.name    JsTransition054
     * @tc.desc    Transition elapsed 362 of 298 reaches 100 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition054', 0, async function () {
      await yieldThread();
      const duration = 298;
      const elapsed = 362;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(362, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition054 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2015
     * @tc.name    JsTransition055
     * @tc.desc    Transition elapsed 415 of 335 reaches 100 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition055', 0, async function () {
      await yieldThread();
      const duration = 335;
      const elapsed = 415;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(415, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2016
     * @tc.name    JsTransition056
     * @tc.desc    Transition elapsed 468 of 372 reaches 100 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition056', 0, async function () {
      await yieldThread();
      const duration = 372;
      const elapsed = 468;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(468, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition056 done');
    });
}

function TransitionProgressPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2017
     * @tc.name    JsTransition057
     * @tc.desc    Transition elapsed 521 of 409 reaches 100 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition057', 0, async function () {
      await yieldThread();
      const duration = 409;
      const elapsed = 521;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(521, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2018
     * @tc.name    JsTransition058
     * @tc.desc    Transition elapsed 574 of 446 reaches 100 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition058', 0, async function () {
      await yieldThread();
      const duration = 446;
      const elapsed = 574;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(574, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2019
     * @tc.name    JsTransition059
     * @tc.desc    Transition elapsed 627 of 483 reaches 100 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition059', 0, async function () {
      await yieldThread();
      const duration = 483;
      const elapsed = 627;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(627, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2020
     * @tc.name    JsTransition060
     * @tc.desc    Transition elapsed 680 of 520 reaches 100 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition060', 0, async function () {
      await yieldThread();
      const duration = 520;
      const elapsed = 680;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(680, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition060 done');
    });
}

function TransitionProgressPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2021
     * @tc.name    JsTransition061
     * @tc.desc    Transition elapsed 733 of 557 reaches 100 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition061', 0, async function () {
      await yieldThread();
      const duration = 557;
      const elapsed = 733;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(733, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2022
     * @tc.name    JsTransition062
     * @tc.desc    Transition elapsed 786 of 594 reaches 100 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition062', 0, async function () {
      await yieldThread();
      const duration = 594;
      const elapsed = 786;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(786, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2023
     * @tc.name    JsTransition063
     * @tc.desc    Transition elapsed 839 of 631 reaches 100 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition063', 0, async function () {
      await yieldThread();
      const duration = 631;
      const elapsed = 839;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(839, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2024
     * @tc.name    JsTransition064
     * @tc.desc    Transition elapsed 892 of 668 reaches 100 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition064', 0, async function () {
      await yieldThread();
      const duration = 668;
      const elapsed = 892;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(892, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition064 done');
    });
}

function TransitionProgressPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2025
     * @tc.name    JsTransition065
     * @tc.desc    Transition elapsed 945 of 705 reaches 100 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition065', 0, async function () {
      await yieldThread();
      const duration = 705;
      const elapsed = 945;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(945, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2026
     * @tc.name    JsTransition066
     * @tc.desc    Transition elapsed 998 of 742 reaches 100 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition066', 0, async function () {
      await yieldThread();
      const duration = 742;
      const elapsed = 998;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(998, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition066 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2027
     * @tc.name    JsTransition067
     * @tc.desc    Transition elapsed 1051 of 779 reaches 100 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition067', 0, async function () {
      await yieldThread();
      const duration = 779;
      const elapsed = 1051;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1051, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2028
     * @tc.name    JsTransition068
     * @tc.desc    Transition elapsed -96 of 816 reaches 0 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition068', 0, async function () {
      await yieldThread();
      const duration = 816;
      const elapsed = -96;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-96, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition068 done');
    });
}

function TransitionProgressPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2029
     * @tc.name    JsTransition069
     * @tc.desc    Transition elapsed -43 of 853 reaches 0 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition069', 0, async function () {
      await yieldThread();
      const duration = 853;
      const elapsed = -43;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-43, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2030
     * @tc.name    JsTransition070
     * @tc.desc    Transition elapsed 10 of 890 reaches 1 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition070', 0, async function () {
      await yieldThread();
      const duration = 890;
      const elapsed = 10;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(1);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(10, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2031
     * @tc.name    JsTransition071
     * @tc.desc    Transition elapsed 63 of 927 reaches 6 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition071', 0, async function () {
      await yieldThread();
      const duration = 927;
      const elapsed = 63;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(6);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(63, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2032
     * @tc.name    JsTransition072
     * @tc.desc    Transition elapsed 116 of 964 reaches 12 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition072', 0, async function () {
      await yieldThread();
      const duration = 964;
      const elapsed = 116;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(12);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(116, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition072 done');
    });
}

function TransitionProgressPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2033
     * @tc.name    JsTransition073
     * @tc.desc    Transition elapsed 169 of 101 reaches 100 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition073', 0, async function () {
      await yieldThread();
      const duration = 101;
      const elapsed = 169;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(169, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2034
     * @tc.name    JsTransition074
     * @tc.desc    Transition elapsed 222 of 138 reaches 100 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition074', 0, async function () {
      await yieldThread();
      const duration = 138;
      const elapsed = 222;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(222, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2035
     * @tc.name    JsTransition075
     * @tc.desc    Transition elapsed 275 of 175 reaches 100 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition075', 0, async function () {
      await yieldThread();
      const duration = 175;
      const elapsed = 275;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(275, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition075 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2036
     * @tc.name    JsTransition076
     * @tc.desc    Transition elapsed 328 of 212 reaches 100 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition076', 0, async function () {
      await yieldThread();
      const duration = 212;
      const elapsed = 328;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(328, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition076 done');
    });
}

function TransitionProgressPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2037
     * @tc.name    JsTransition077
     * @tc.desc    Transition elapsed 381 of 249 reaches 100 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition077', 0, async function () {
      await yieldThread();
      const duration = 249;
      const elapsed = 381;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(381, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2038
     * @tc.name    JsTransition078
     * @tc.desc    Transition elapsed 434 of 286 reaches 100 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition078', 0, async function () {
      await yieldThread();
      const duration = 286;
      const elapsed = 434;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(434, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition078 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2039
     * @tc.name    JsTransition079
     * @tc.desc    Transition elapsed 487 of 323 reaches 100 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition079', 0, async function () {
      await yieldThread();
      const duration = 323;
      const elapsed = 487;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(487, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2040
     * @tc.name    JsTransition080
     * @tc.desc    Transition elapsed 540 of 360 reaches 100 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition080', 0, async function () {
      await yieldThread();
      const duration = 360;
      const elapsed = 540;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(540, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition080 done');
    });
}

function TransitionProgressPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2041
     * @tc.name    JsTransition081
     * @tc.desc    Transition elapsed 593 of 397 reaches 100 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition081', 0, async function () {
      await yieldThread();
      const duration = 397;
      const elapsed = 593;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(593, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition081 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2042
     * @tc.name    JsTransition082
     * @tc.desc    Transition elapsed 646 of 434 reaches 100 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition082', 0, async function () {
      await yieldThread();
      const duration = 434;
      const elapsed = 646;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(646, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2043
     * @tc.name    JsTransition083
     * @tc.desc    Transition elapsed 699 of 471 reaches 100 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition083', 0, async function () {
      await yieldThread();
      const duration = 471;
      const elapsed = 699;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(699, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2044
     * @tc.name    JsTransition084
     * @tc.desc    Transition elapsed 752 of 508 reaches 100 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition084', 0, async function () {
      await yieldThread();
      const duration = 508;
      const elapsed = 752;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(752, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition084 done');
    });
}

function TransitionProgressPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2045
     * @tc.name    JsTransition085
     * @tc.desc    Transition elapsed 805 of 545 reaches 100 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition085', 0, async function () {
      await yieldThread();
      const duration = 545;
      const elapsed = 805;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(805, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition085 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2046
     * @tc.name    JsTransition086
     * @tc.desc    Transition elapsed 858 of 582 reaches 100 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition086', 0, async function () {
      await yieldThread();
      const duration = 582;
      const elapsed = 858;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(858, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2047
     * @tc.name    JsTransition087
     * @tc.desc    Transition elapsed 911 of 619 reaches 100 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition087', 0, async function () {
      await yieldThread();
      const duration = 619;
      const elapsed = 911;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(911, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition087 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2048
     * @tc.name    JsTransition088
     * @tc.desc    Transition elapsed 964 of 656 reaches 100 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition088', 0, async function () {
      await yieldThread();
      const duration = 656;
      const elapsed = 964;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(964, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition088 done');
    });
}

function TransitionProgressPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2049
     * @tc.name    JsTransition089
     * @tc.desc    Transition elapsed 1017 of 693 reaches 100 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition089', 0, async function () {
      await yieldThread();
      const duration = 693;
      const elapsed = 1017;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1017, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2050
     * @tc.name    JsTransition090
     * @tc.desc    Transition elapsed 1070 of 730 reaches 100 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition090', 0, async function () {
      await yieldThread();
      const duration = 730;
      const elapsed = 1070;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1070, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition090 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2051
     * @tc.name    JsTransition091
     * @tc.desc    Transition elapsed -77 of 767 reaches 0 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition091', 0, async function () {
      await yieldThread();
      const duration = 767;
      const elapsed = -77;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-77, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2052
     * @tc.name    JsTransition092
     * @tc.desc    Transition elapsed -24 of 804 reaches 0 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition092', 0, async function () {
      await yieldThread();
      const duration = 804;
      const elapsed = -24;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-24, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition092 done');
    });
}

function TransitionProgressPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2053
     * @tc.name    JsTransition093
     * @tc.desc    Transition elapsed 29 of 841 reaches 3 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition093', 0, async function () {
      await yieldThread();
      const duration = 841;
      const elapsed = 29;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(3);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(29, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition093 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2054
     * @tc.name    JsTransition094
     * @tc.desc    Transition elapsed 82 of 878 reaches 9 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition094', 0, async function () {
      await yieldThread();
      const duration = 878;
      const elapsed = 82;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(9);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(82, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2055
     * @tc.name    JsTransition095
     * @tc.desc    Transition elapsed 135 of 915 reaches 14 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition095', 0, async function () {
      await yieldThread();
      const duration = 915;
      const elapsed = 135;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(14);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(135, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition095 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2056
     * @tc.name    JsTransition096
     * @tc.desc    Transition elapsed 188 of 952 reaches 19 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition096', 0, async function () {
      await yieldThread();
      const duration = 952;
      const elapsed = 188;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(19);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(188, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition096 done');
    });
}

function TransitionProgressPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2057
     * @tc.name    JsTransition097
     * @tc.desc    Transition elapsed 241 of 989 reaches 24 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition097', 0, async function () {
      await yieldThread();
      const duration = 989;
      const elapsed = 241;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(24);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(241, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2058
     * @tc.name    JsTransition098
     * @tc.desc    Transition elapsed 294 of 126 reaches 100 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition098', 0, async function () {
      await yieldThread();
      const duration = 126;
      const elapsed = 294;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(294, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2059
     * @tc.name    JsTransition099
     * @tc.desc    Transition elapsed 347 of 163 reaches 100 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition099', 0, async function () {
      await yieldThread();
      const duration = 163;
      const elapsed = 347;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(347, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition099 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2060
     * @tc.name    JsTransition100
     * @tc.desc    Transition elapsed 400 of 200 reaches 100 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition100', 0, async function () {
      await yieldThread();
      const duration = 200;
      const elapsed = 400;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(400, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition100 done');
    });
}

function TransitionProgressPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2061
     * @tc.name    JsTransition101
     * @tc.desc    Transition elapsed 453 of 237 reaches 100 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition101', 0, async function () {
      await yieldThread();
      const duration = 237;
      const elapsed = 453;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(453, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2062
     * @tc.name    JsTransition102
     * @tc.desc    Transition elapsed 506 of 274 reaches 100 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition102', 0, async function () {
      await yieldThread();
      const duration = 274;
      const elapsed = 506;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(506, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition102 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2063
     * @tc.name    JsTransition103
     * @tc.desc    Transition elapsed 559 of 311 reaches 100 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition103', 0, async function () {
      await yieldThread();
      const duration = 311;
      const elapsed = 559;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(559, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2064
     * @tc.name    JsTransition104
     * @tc.desc    Transition elapsed 612 of 348 reaches 100 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition104', 0, async function () {
      await yieldThread();
      const duration = 348;
      const elapsed = 612;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(612, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition104 done');
    });
}

function TransitionProgressPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2065
     * @tc.name    JsTransition105
     * @tc.desc    Transition elapsed 665 of 385 reaches 100 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition105', 0, async function () {
      await yieldThread();
      const duration = 385;
      const elapsed = 665;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(665, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition105 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2066
     * @tc.name    JsTransition106
     * @tc.desc    Transition elapsed 718 of 422 reaches 100 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition106', 0, async function () {
      await yieldThread();
      const duration = 422;
      const elapsed = 718;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(718, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2067
     * @tc.name    JsTransition107
     * @tc.desc    Transition elapsed 771 of 459 reaches 100 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition107', 0, async function () {
      await yieldThread();
      const duration = 459;
      const elapsed = 771;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(771, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2068
     * @tc.name    JsTransition108
     * @tc.desc    Transition elapsed 824 of 496 reaches 100 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition108', 0, async function () {
      await yieldThread();
      const duration = 496;
      const elapsed = 824;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(824, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition108 done');
    });
}

function TransitionProgressPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2069
     * @tc.name    JsTransition109
     * @tc.desc    Transition elapsed 877 of 533 reaches 100 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition109', 0, async function () {
      await yieldThread();
      const duration = 533;
      const elapsed = 877;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(877, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2070
     * @tc.name    JsTransition110
     * @tc.desc    Transition elapsed 930 of 570 reaches 100 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition110', 0, async function () {
      await yieldThread();
      const duration = 570;
      const elapsed = 930;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(930, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition110 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2071
     * @tc.name    JsTransition111
     * @tc.desc    Transition elapsed 983 of 607 reaches 100 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition111', 0, async function () {
      await yieldThread();
      const duration = 607;
      const elapsed = 983;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(983, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition111 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2072
     * @tc.name    JsTransition112
     * @tc.desc    Transition elapsed 1036 of 644 reaches 100 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition112', 0, async function () {
      await yieldThread();
      const duration = 644;
      const elapsed = 1036;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1036, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition112 done');
    });
}

function TransitionProgressPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2073
     * @tc.name    JsTransition113
     * @tc.desc    Transition elapsed 1089 of 681 reaches 100 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition113', 0, async function () {
      await yieldThread();
      const duration = 681;
      const elapsed = 1089;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1089, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2074
     * @tc.name    JsTransition114
     * @tc.desc    Transition elapsed -58 of 718 reaches 0 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition114', 0, async function () {
      await yieldThread();
      const duration = 718;
      const elapsed = -58;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-58, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition114 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2075
     * @tc.name    JsTransition115
     * @tc.desc    Transition elapsed -5 of 755 reaches 0 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition115', 0, async function () {
      await yieldThread();
      const duration = 755;
      const elapsed = -5;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-5, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2076
     * @tc.name    JsTransition116
     * @tc.desc    Transition elapsed 48 of 792 reaches 6 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition116', 0, async function () {
      await yieldThread();
      const duration = 792;
      const elapsed = 48;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(6);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(48, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition116 done');
    });
}

function TransitionProgressPart030() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2077
     * @tc.name    JsTransition117
     * @tc.desc    Transition elapsed 101 of 829 reaches 12 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition117', 0, async function () {
      await yieldThread();
      const duration = 829;
      const elapsed = 101;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(12);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(101, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition117 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2078
     * @tc.name    JsTransition118
     * @tc.desc    Transition elapsed 154 of 866 reaches 17 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition118', 0, async function () {
      await yieldThread();
      const duration = 866;
      const elapsed = 154;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(17);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(154, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2079
     * @tc.name    JsTransition119
     * @tc.desc    Transition elapsed 207 of 903 reaches 22 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition119', 0, async function () {
      await yieldThread();
      const duration = 903;
      const elapsed = 207;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(22);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(207, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2080
     * @tc.name    JsTransition120
     * @tc.desc    Transition elapsed 260 of 940 reaches 27 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition120', 0, async function () {
      await yieldThread();
      const duration = 940;
      const elapsed = 260;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(27);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(260, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition120 done');
    });
}

function TransitionProgressPart031() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2081
     * @tc.name    JsTransition121
     * @tc.desc    Transition elapsed 313 of 977 reaches 32 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition121', 0, async function () {
      await yieldThread();
      const duration = 977;
      const elapsed = 313;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(32);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(313, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2082
     * @tc.name    JsTransition122
     * @tc.desc    Transition elapsed 366 of 114 reaches 100 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition122', 0, async function () {
      await yieldThread();
      const duration = 114;
      const elapsed = 366;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(366, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2083
     * @tc.name    JsTransition123
     * @tc.desc    Transition elapsed 419 of 151 reaches 100 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition123', 0, async function () {
      await yieldThread();
      const duration = 151;
      const elapsed = 419;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(419, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition123 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2084
     * @tc.name    JsTransition124
     * @tc.desc    Transition elapsed 472 of 188 reaches 100 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition124', 0, async function () {
      await yieldThread();
      const duration = 188;
      const elapsed = 472;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(472, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition124 done');
    });
}

function TransitionProgressPart032() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2085
     * @tc.name    JsTransition125
     * @tc.desc    Transition elapsed 525 of 225 reaches 100 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition125', 0, async function () {
      await yieldThread();
      const duration = 225;
      const elapsed = 525;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(525, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2086
     * @tc.name    JsTransition126
     * @tc.desc    Transition elapsed 578 of 262 reaches 100 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition126', 0, async function () {
      await yieldThread();
      const duration = 262;
      const elapsed = 578;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(578, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition126 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2087
     * @tc.name    JsTransition127
     * @tc.desc    Transition elapsed 631 of 299 reaches 100 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition127', 0, async function () {
      await yieldThread();
      const duration = 299;
      const elapsed = 631;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(631, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2088
     * @tc.name    JsTransition128
     * @tc.desc    Transition elapsed 684 of 336 reaches 100 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition128', 0, async function () {
      await yieldThread();
      const duration = 336;
      const elapsed = 684;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(684, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition128 done');
    });
}

function TransitionProgressPart033() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2089
     * @tc.name    JsTransition129
     * @tc.desc    Transition elapsed 737 of 373 reaches 100 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition129', 0, async function () {
      await yieldThread();
      const duration = 373;
      const elapsed = 737;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(737, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition129 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2090
     * @tc.name    JsTransition130
     * @tc.desc    Transition elapsed 790 of 410 reaches 100 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition130', 0, async function () {
      await yieldThread();
      const duration = 410;
      const elapsed = 790;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(790, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition130 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2091
     * @tc.name    JsTransition131
     * @tc.desc    Transition elapsed 843 of 447 reaches 100 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition131', 0, async function () {
      await yieldThread();
      const duration = 447;
      const elapsed = 843;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(843, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2092
     * @tc.name    JsTransition132
     * @tc.desc    Transition elapsed 896 of 484 reaches 100 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition132', 0, async function () {
      await yieldThread();
      const duration = 484;
      const elapsed = 896;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(896, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition132 done');
    });
}

function TransitionProgressPart034() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2093
     * @tc.name    JsTransition133
     * @tc.desc    Transition elapsed 949 of 521 reaches 100 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition133', 0, async function () {
      await yieldThread();
      const duration = 521;
      const elapsed = 949;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(949, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2094
     * @tc.name    JsTransition134
     * @tc.desc    Transition elapsed 1002 of 558 reaches 100 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition134', 0, async function () {
      await yieldThread();
      const duration = 558;
      const elapsed = 1002;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1002, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2095
     * @tc.name    JsTransition135
     * @tc.desc    Transition elapsed 1055 of 595 reaches 100 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition135', 0, async function () {
      await yieldThread();
      const duration = 595;
      const elapsed = 1055;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(100);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(1055, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition135 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2096
     * @tc.name    JsTransition136
     * @tc.desc    Transition elapsed -92 of 632 reaches 0 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition136', 0, async function () {
      await yieldThread();
      const duration = 632;
      const elapsed = -92;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-92, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition136 done');
    });
}

function TransitionProgressPart035() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2097
     * @tc.name    JsTransition137
     * @tc.desc    Transition elapsed -39 of 669 reaches 0 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition137', 0, async function () {
      await yieldThread();
      const duration = 669;
      const elapsed = -39;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(0);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(-39, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2098
     * @tc.name    JsTransition138
     * @tc.desc    Transition elapsed 14 of 706 reaches 1 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition138', 0, async function () {
      await yieldThread();
      const duration = 706;
      const elapsed = 14;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(1);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(14, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition138 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2099
     * @tc.name    JsTransition139
     * @tc.desc    Transition elapsed 67 of 743 reaches 9 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition139', 0, async function () {
      await yieldThread();
      const duration = 743;
      const elapsed = 67;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(9);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(67, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2100
     * @tc.name    JsTransition140
     * @tc.desc    Transition elapsed 120 of 780 reaches 15 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTransition140', 0, async function () {
      await yieldThread();
      const duration = 780;
      const elapsed = 120;
      expect(model.transitionProgress(elapsed, duration)).assertEqual(15);
      expect(model.transitionProgress(0, duration)).assertEqual(0);
      expect(model.transitionProgress(duration, duration)).assertEqual(100);
      expect(model.transitionProgress(120, 0)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTransition140 done');
    });
}

function TransitionProgressGroup001() {
  TransitionProgressPart001();
  TransitionProgressPart002();
  TransitionProgressPart003();
  TransitionProgressPart004();
  TransitionProgressPart005();
  TransitionProgressPart006();
  TransitionProgressPart007();
  TransitionProgressPart008();
  TransitionProgressPart009();
  TransitionProgressPart010();
  TransitionProgressPart011();
  TransitionProgressPart012();
  TransitionProgressPart013();
  TransitionProgressPart014();
  TransitionProgressPart015();
  TransitionProgressPart016();
  TransitionProgressPart017();
  TransitionProgressPart018();
  TransitionProgressPart019();
  TransitionProgressPart020();
  TransitionProgressPart021();
  TransitionProgressPart022();
  TransitionProgressPart023();
  TransitionProgressPart024();
  TransitionProgressPart025();
  TransitionProgressPart026();
  TransitionProgressPart027();
  TransitionProgressPart028();
  TransitionProgressPart029();
  TransitionProgressPart030();
  TransitionProgressPart031();
  TransitionProgressPart032();
  TransitionProgressPart033();
  TransitionProgressPart034();
  TransitionProgressPart035();
}

export default function transitionProgressSuite() {
  describe('TransitionProgressSuite', function () {
    TransitionProgressGroup001();
  });
}
