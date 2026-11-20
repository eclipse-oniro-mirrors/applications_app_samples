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

export default function transitionProgressSuite() {
  describe('TransitionProgressSuite', function () {
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
  });
}
