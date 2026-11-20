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

function ThemeMappingPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2101
     * @tc.name    JsTheme001
     * @tc.desc    Theme index 13 maps to theme_3 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme001', 0, async function () {
      await yieldThread();
      const index = 13;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 1)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2102
     * @tc.name    JsTheme002
     * @tc.desc    Theme index 26 maps to theme_1 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme002', 0, async function () {
      await yieldThread();
      const index = 26;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 2)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2103
     * @tc.name    JsTheme003
     * @tc.desc    Theme index 2 maps to theme_2 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme003', 0, async function () {
      await yieldThread();
      const index = 2;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 3)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2104
     * @tc.name    JsTheme004
     * @tc.desc    Theme index 15 maps to theme_0 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme004', 0, async function () {
      await yieldThread();
      const index = 15;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 4)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme004 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2105
     * @tc.name    JsTheme005
     * @tc.desc    Theme index 28 maps to theme_3 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme005', 0, async function () {
      await yieldThread();
      const index = 28;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 5)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2106
     * @tc.name    JsTheme006
     * @tc.desc    Theme index 4 maps to theme_4 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme006', 0, async function () {
      await yieldThread();
      const index = 4;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 6)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme006 done');
    });
}

function ThemeMappingPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2107
     * @tc.name    JsTheme007
     * @tc.desc    Theme index 17 maps to theme_2 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme007', 0, async function () {
      await yieldThread();
      const index = 17;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 7)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2108
     * @tc.name    JsTheme008
     * @tc.desc    Theme index 30 maps to theme_0 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme008', 0, async function () {
      await yieldThread();
      const index = 30;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 8)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme008 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2109
     * @tc.name    JsTheme009
     * @tc.desc    Theme index 6 maps to theme_1 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme009', 0, async function () {
      await yieldThread();
      const index = 6;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 9)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2110
     * @tc.name    JsTheme010
     * @tc.desc    Theme index 19 maps to theme_4 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme010', 0, async function () {
      await yieldThread();
      const index = 19;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 10)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2111
     * @tc.name    JsTheme011
     * @tc.desc    Theme index 32 maps to theme_2 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme011', 0, async function () {
      await yieldThread();
      const index = 32;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 11)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2112
     * @tc.name    JsTheme012
     * @tc.desc    Theme index 8 maps to theme_3 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme012', 0, async function () {
      await yieldThread();
      const index = 8;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 12)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme012 done');
    });
}

function ThemeMappingPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2113
     * @tc.name    JsTheme013
     * @tc.desc    Theme index 21 maps to theme_1 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme013', 0, async function () {
      await yieldThread();
      const index = 21;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 13)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2114
     * @tc.name    JsTheme014
     * @tc.desc    Theme index 34 maps to theme_4 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme014', 0, async function () {
      await yieldThread();
      const index = 34;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 14)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2115
     * @tc.name    JsTheme015
     * @tc.desc    Theme index 10 maps to theme_0 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme015', 0, async function () {
      await yieldThread();
      const index = 10;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 15)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme015 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2116
     * @tc.name    JsTheme016
     * @tc.desc    Theme index 23 maps to theme_3 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme016', 0, async function () {
      await yieldThread();
      const index = 23;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 16)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme016 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2117
     * @tc.name    JsTheme017
     * @tc.desc    Theme index 36 maps to theme_1 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme017', 0, async function () {
      await yieldThread();
      const index = 36;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 17)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2118
     * @tc.name    JsTheme018
     * @tc.desc    Theme index 12 maps to theme_2 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme018', 0, async function () {
      await yieldThread();
      const index = 12;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 18)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme018 done');
    });
}

function ThemeMappingPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2119
     * @tc.name    JsTheme019
     * @tc.desc    Theme index 25 maps to theme_0 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme019', 0, async function () {
      await yieldThread();
      const index = 25;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 19)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2120
     * @tc.name    JsTheme020
     * @tc.desc    Theme index 1 maps to theme_1 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme020', 0, async function () {
      await yieldThread();
      const index = 1;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 20)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme020 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2121
     * @tc.name    JsTheme021
     * @tc.desc    Theme index 14 maps to theme_4 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme021', 0, async function () {
      await yieldThread();
      const index = 14;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 21)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2122
     * @tc.name    JsTheme022
     * @tc.desc    Theme index 27 maps to theme_2 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme022', 0, async function () {
      await yieldThread();
      const index = 27;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 22)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2123
     * @tc.name    JsTheme023
     * @tc.desc    Theme index 3 maps to theme_3 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme023', 0, async function () {
      await yieldThread();
      const index = 3;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 23)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2124
     * @tc.name    JsTheme024
     * @tc.desc    Theme index 16 maps to theme_1 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme024', 0, async function () {
      await yieldThread();
      const index = 16;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 24)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme024 done');
    });
}

function ThemeMappingPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2125
     * @tc.name    JsTheme025
     * @tc.desc    Theme index 29 maps to theme_4 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme025', 0, async function () {
      await yieldThread();
      const index = 29;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 25)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2126
     * @tc.name    JsTheme026
     * @tc.desc    Theme index 5 maps to theme_0 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme026', 0, async function () {
      await yieldThread();
      const index = 5;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 26)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2127
     * @tc.name    JsTheme027
     * @tc.desc    Theme index 18 maps to theme_3 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme027', 0, async function () {
      await yieldThread();
      const index = 18;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 27)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2128
     * @tc.name    JsTheme028
     * @tc.desc    Theme index 31 maps to theme_1 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme028', 0, async function () {
      await yieldThread();
      const index = 31;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 28)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme028 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2129
     * @tc.name    JsTheme029
     * @tc.desc    Theme index 7 maps to theme_2 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme029', 0, async function () {
      await yieldThread();
      const index = 7;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 29)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2130
     * @tc.name    JsTheme030
     * @tc.desc    Theme index 20 maps to theme_0 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme030', 0, async function () {
      await yieldThread();
      const index = 20;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 30)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme030 done');
    });
}

function ThemeMappingPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2131
     * @tc.name    JsTheme031
     * @tc.desc    Theme index 33 maps to theme_3 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme031', 0, async function () {
      await yieldThread();
      const index = 33;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 31)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2132
     * @tc.name    JsTheme032
     * @tc.desc    Theme index 9 maps to theme_4 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme032', 0, async function () {
      await yieldThread();
      const index = 9;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 32)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme032 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2133
     * @tc.name    JsTheme033
     * @tc.desc    Theme index 22 maps to theme_2 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme033', 0, async function () {
      await yieldThread();
      const index = 22;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 33)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2134
     * @tc.name    JsTheme034
     * @tc.desc    Theme index 35 maps to theme_0 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme034', 0, async function () {
      await yieldThread();
      const index = 35;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 34)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2135
     * @tc.name    JsTheme035
     * @tc.desc    Theme index 11 maps to theme_1 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme035', 0, async function () {
      await yieldThread();
      const index = 11;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 35)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2136
     * @tc.name    JsTheme036
     * @tc.desc    Theme index 24 maps to theme_4 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme036', 0, async function () {
      await yieldThread();
      const index = 24;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 36)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme036 done');
    });
}

function ThemeMappingPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2137
     * @tc.name    JsTheme037
     * @tc.desc    Theme index 0 maps to theme_0 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme037', 0, async function () {
      await yieldThread();
      const index = 0;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 37)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2138
     * @tc.name    JsTheme038
     * @tc.desc    Theme index 13 maps to theme_3 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme038', 0, async function () {
      await yieldThread();
      const index = 13;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 38)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2139
     * @tc.name    JsTheme039
     * @tc.desc    Theme index 26 maps to theme_1 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme039', 0, async function () {
      await yieldThread();
      const index = 26;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 39)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2140
     * @tc.name    JsTheme040
     * @tc.desc    Theme index 2 maps to theme_2 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme040', 0, async function () {
      await yieldThread();
      const index = 2;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 40)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme040 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2141
     * @tc.name    JsTheme041
     * @tc.desc    Theme index 15 maps to theme_0 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme041', 0, async function () {
      await yieldThread();
      const index = 15;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 41)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2142
     * @tc.name    JsTheme042
     * @tc.desc    Theme index 28 maps to theme_3 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme042', 0, async function () {
      await yieldThread();
      const index = 28;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 42)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme042 done');
    });
}

function ThemeMappingPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2143
     * @tc.name    JsTheme043
     * @tc.desc    Theme index 4 maps to theme_4 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme043', 0, async function () {
      await yieldThread();
      const index = 4;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 43)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2144
     * @tc.name    JsTheme044
     * @tc.desc    Theme index 17 maps to theme_2 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme044', 0, async function () {
      await yieldThread();
      const index = 17;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 44)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme044 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2145
     * @tc.name    JsTheme045
     * @tc.desc    Theme index 30 maps to theme_0 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme045', 0, async function () {
      await yieldThread();
      const index = 30;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 45)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme045 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2146
     * @tc.name    JsTheme046
     * @tc.desc    Theme index 6 maps to theme_1 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme046', 0, async function () {
      await yieldThread();
      const index = 6;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 46)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2147
     * @tc.name    JsTheme047
     * @tc.desc    Theme index 19 maps to theme_4 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme047', 0, async function () {
      await yieldThread();
      const index = 19;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 47)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2148
     * @tc.name    JsTheme048
     * @tc.desc    Theme index 32 maps to theme_2 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme048', 0, async function () {
      await yieldThread();
      const index = 32;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 48)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme048 done');
    });
}

function ThemeMappingPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2149
     * @tc.name    JsTheme049
     * @tc.desc    Theme index 8 maps to theme_3 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme049', 0, async function () {
      await yieldThread();
      const index = 8;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 49)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2150
     * @tc.name    JsTheme050
     * @tc.desc    Theme index 21 maps to theme_1 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme050', 0, async function () {
      await yieldThread();
      const index = 21;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 50)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2151
     * @tc.name    JsTheme051
     * @tc.desc    Theme index 34 maps to theme_4 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme051', 0, async function () {
      await yieldThread();
      const index = 34;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 51)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2152
     * @tc.name    JsTheme052
     * @tc.desc    Theme index 10 maps to theme_0 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme052', 0, async function () {
      await yieldThread();
      const index = 10;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 52)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme052 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2153
     * @tc.name    JsTheme053
     * @tc.desc    Theme index 23 maps to theme_3 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme053', 0, async function () {
      await yieldThread();
      const index = 23;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 53)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2154
     * @tc.name    JsTheme054
     * @tc.desc    Theme index 36 maps to theme_1 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme054', 0, async function () {
      await yieldThread();
      const index = 36;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 54)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme054 done');
    });
}

function ThemeMappingPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2155
     * @tc.name    JsTheme055
     * @tc.desc    Theme index 12 maps to theme_2 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme055', 0, async function () {
      await yieldThread();
      const index = 12;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 55)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2156
     * @tc.name    JsTheme056
     * @tc.desc    Theme index 25 maps to theme_0 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme056', 0, async function () {
      await yieldThread();
      const index = 25;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 56)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme056 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2157
     * @tc.name    JsTheme057
     * @tc.desc    Theme index 1 maps to theme_1 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme057', 0, async function () {
      await yieldThread();
      const index = 1;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 57)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2158
     * @tc.name    JsTheme058
     * @tc.desc    Theme index 14 maps to theme_4 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme058', 0, async function () {
      await yieldThread();
      const index = 14;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 58)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2159
     * @tc.name    JsTheme059
     * @tc.desc    Theme index 27 maps to theme_2 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme059', 0, async function () {
      await yieldThread();
      const index = 27;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 59)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2160
     * @tc.name    JsTheme060
     * @tc.desc    Theme index 3 maps to theme_3 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme060', 0, async function () {
      await yieldThread();
      const index = 3;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 60)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme060 done');
    });
}

function ThemeMappingPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2161
     * @tc.name    JsTheme061
     * @tc.desc    Theme index 16 maps to theme_1 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme061', 0, async function () {
      await yieldThread();
      const index = 16;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 61)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2162
     * @tc.name    JsTheme062
     * @tc.desc    Theme index 29 maps to theme_4 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme062', 0, async function () {
      await yieldThread();
      const index = 29;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 62)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2163
     * @tc.name    JsTheme063
     * @tc.desc    Theme index 5 maps to theme_0 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme063', 0, async function () {
      await yieldThread();
      const index = 5;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 63)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2164
     * @tc.name    JsTheme064
     * @tc.desc    Theme index 18 maps to theme_3 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme064', 0, async function () {
      await yieldThread();
      const index = 18;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 64)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme064 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2165
     * @tc.name    JsTheme065
     * @tc.desc    Theme index 31 maps to theme_1 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme065', 0, async function () {
      await yieldThread();
      const index = 31;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 65)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2166
     * @tc.name    JsTheme066
     * @tc.desc    Theme index 7 maps to theme_2 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme066', 0, async function () {
      await yieldThread();
      const index = 7;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 66)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme066 done');
    });
}

function ThemeMappingPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2167
     * @tc.name    JsTheme067
     * @tc.desc    Theme index 20 maps to theme_0 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme067', 0, async function () {
      await yieldThread();
      const index = 20;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 67)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2168
     * @tc.name    JsTheme068
     * @tc.desc    Theme index 33 maps to theme_3 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme068', 0, async function () {
      await yieldThread();
      const index = 33;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 68)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme068 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2169
     * @tc.name    JsTheme069
     * @tc.desc    Theme index 9 maps to theme_4 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme069', 0, async function () {
      await yieldThread();
      const index = 9;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 69)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2170
     * @tc.name    JsTheme070
     * @tc.desc    Theme index 22 maps to theme_2 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme070', 0, async function () {
      await yieldThread();
      const index = 22;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 70)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2171
     * @tc.name    JsTheme071
     * @tc.desc    Theme index 35 maps to theme_0 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme071', 0, async function () {
      await yieldThread();
      const index = 35;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 71)).assertEqual('theme_1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2172
     * @tc.name    JsTheme072
     * @tc.desc    Theme index 11 maps to theme_1 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme072', 0, async function () {
      await yieldThread();
      const index = 11;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 72)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme072 done');
    });
}

function ThemeMappingPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2173
     * @tc.name    JsTheme073
     * @tc.desc    Theme index 24 maps to theme_4 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme073', 0, async function () {
      await yieldThread();
      const index = 24;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 73)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2174
     * @tc.name    JsTheme074
     * @tc.desc    Theme index 0 maps to theme_0 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme074', 0, async function () {
      await yieldThread();
      const index = 0;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 74)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2175
     * @tc.name    JsTheme075
     * @tc.desc    Theme index 13 maps to theme_3 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme075', 0, async function () {
      await yieldThread();
      const index = 13;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 75)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme075 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2176
     * @tc.name    JsTheme076
     * @tc.desc    Theme index 26 maps to theme_1 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme076', 0, async function () {
      await yieldThread();
      const index = 26;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 76)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme076 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2177
     * @tc.name    JsTheme077
     * @tc.desc    Theme index 2 maps to theme_2 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme077', 0, async function () {
      await yieldThread();
      const index = 2;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 77)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2178
     * @tc.name    JsTheme078
     * @tc.desc    Theme index 15 maps to theme_0 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme078', 0, async function () {
      await yieldThread();
      const index = 15;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 78)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme078 done');
    });
}

function ThemeMappingPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2179
     * @tc.name    JsTheme079
     * @tc.desc    Theme index 28 maps to theme_3 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme079', 0, async function () {
      await yieldThread();
      const index = 28;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 79)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2180
     * @tc.name    JsTheme080
     * @tc.desc    Theme index 4 maps to theme_4 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme080', 0, async function () {
      await yieldThread();
      const index = 4;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 80)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme080 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2181
     * @tc.name    JsTheme081
     * @tc.desc    Theme index 17 maps to theme_2 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme081', 0, async function () {
      await yieldThread();
      const index = 17;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 81)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme081 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2182
     * @tc.name    JsTheme082
     * @tc.desc    Theme index 30 maps to theme_0 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme082', 0, async function () {
      await yieldThread();
      const index = 30;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 82)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2183
     * @tc.name    JsTheme083
     * @tc.desc    Theme index 6 maps to theme_1 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme083', 0, async function () {
      await yieldThread();
      const index = 6;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 83)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2184
     * @tc.name    JsTheme084
     * @tc.desc    Theme index 19 maps to theme_4 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme084', 0, async function () {
      await yieldThread();
      const index = 19;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 84)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme084 done');
    });
}

function ThemeMappingPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2185
     * @tc.name    JsTheme085
     * @tc.desc    Theme index 32 maps to theme_2 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme085', 0, async function () {
      await yieldThread();
      const index = 32;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 85)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme085 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2186
     * @tc.name    JsTheme086
     * @tc.desc    Theme index 8 maps to theme_3 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme086', 0, async function () {
      await yieldThread();
      const index = 8;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 86)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2187
     * @tc.name    JsTheme087
     * @tc.desc    Theme index 21 maps to theme_1 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme087', 0, async function () {
      await yieldThread();
      const index = 21;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 87)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme087 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2188
     * @tc.name    JsTheme088
     * @tc.desc    Theme index 34 maps to theme_4 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme088', 0, async function () {
      await yieldThread();
      const index = 34;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 88)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme088 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2189
     * @tc.name    JsTheme089
     * @tc.desc    Theme index 10 maps to theme_0 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme089', 0, async function () {
      await yieldThread();
      const index = 10;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 89)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2190
     * @tc.name    JsTheme090
     * @tc.desc    Theme index 23 maps to theme_3 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme090', 0, async function () {
      await yieldThread();
      const index = 23;
      expect(model.themeKeyOf(index)).assertEqual('theme_3');
      expect(model.themeKeyOf(index + 90)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme090 done');
    });
}

function ThemeMappingPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2191
     * @tc.name    JsTheme091
     * @tc.desc    Theme index 36 maps to theme_1 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme091', 0, async function () {
      await yieldThread();
      const index = 36;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 91)).assertEqual('theme_2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2192
     * @tc.name    JsTheme092
     * @tc.desc    Theme index 12 maps to theme_2 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme092', 0, async function () {
      await yieldThread();
      const index = 12;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 92)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme092 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2193
     * @tc.name    JsTheme093
     * @tc.desc    Theme index 25 maps to theme_0 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme093', 0, async function () {
      await yieldThread();
      const index = 25;
      expect(model.themeKeyOf(index)).assertEqual('theme_0');
      expect(model.themeKeyOf(index + 93)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme093 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2194
     * @tc.name    JsTheme094
     * @tc.desc    Theme index 1 maps to theme_1 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme094', 0, async function () {
      await yieldThread();
      const index = 1;
      expect(model.themeKeyOf(index)).assertEqual('theme_1');
      expect(model.themeKeyOf(index + 94)).assertEqual('theme_0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2195
     * @tc.name    JsTheme095
     * @tc.desc    Theme index 14 maps to theme_4 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme095', 0, async function () {
      await yieldThread();
      const index = 14;
      expect(model.themeKeyOf(index)).assertEqual('theme_4');
      expect(model.themeKeyOf(index + 95)).assertEqual('theme_4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme095 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_2196
     * @tc.name    JsTheme096
     * @tc.desc    Theme index 27 maps to theme_2 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsTheme096', 0, async function () {
      await yieldThread();
      const index = 27;
      expect(model.themeKeyOf(index)).assertEqual('theme_2');
      expect(model.themeKeyOf(index + 96)).assertEqual('theme_3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsTheme096 done');
    });
}

export default function themeMappingSuite() {
  describe('ThemeMappingSuite', function () {
    ThemeMappingPart001();
    ThemeMappingPart002();
    ThemeMappingPart003();
    ThemeMappingPart004();
    ThemeMappingPart005();
    ThemeMappingPart006();
    ThemeMappingPart007();
    ThemeMappingPart008();
    ThemeMappingPart009();
    ThemeMappingPart010();
    ThemeMappingPart011();
    ThemeMappingPart012();
    ThemeMappingPart013();
    ThemeMappingPart014();
    ThemeMappingPart015();
    ThemeMappingPart016();
  });
}
