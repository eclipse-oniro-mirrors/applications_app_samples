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

function RouteSanitizationPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1121
     * @tc.name    JsRoute001
     * @tc.desc    Sanitize route seed 1 length 10 seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute001', 0, async function () {
      await yieldThread();
      const raw = 'n4 *{,agn4 *{,agn4 *';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('n4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1122
     * @tc.name    JsRoute002
     * @tc.desc    Sanitize route seed 2 length 6 seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute002', 0, async function () {
      await yieldThread();
      const raw = '!%)|<9se!%)|<9se!%)|';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1123
     * @tc.name    JsRoute003
     * @tc.desc    Sanitize route seed 3 length 6 seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute003', 0, async function () {
      await yieldThread();
      const raw = '&]:?aI_#&]:?aI_#&]:?';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1124
     * @tc.name    JsRoute004
     * @tc.desc    Sanitize route seed 4 length 10 seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute004', 0, async function () {
      await yieldThread();
      const raw = '}.Zed2$(}.Zed2$(}.Ze';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Ze');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute004 done');
    });
}

function RouteSanitizationPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1125
     * @tc.name    JsRoute005
     * @tc.desc    Sanitize route seed 5 length 9 seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute005', 0, async function () {
      await yieldThread();
      const raw = '>p/x@^[;>p/x@^[;>p/x';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1126
     * @tc.name    JsRoute006
     * @tc.desc    Sanitize route seed 6 length 11 seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute006', 0, async function () {
      await yieldThread();
      const raw = 'gn4 *{,agn4 *{,agn4 ';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('gn4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1127
     * @tc.name    JsRoute007
     * @tc.desc    Sanitize route seed 7 length 7 seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute007', 0, async function () {
      await yieldThread();
      const raw = 'e!%)|<9se!%)|<9se!%)';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('e9se9se');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1128
     * @tc.name    JsRoute008
     * @tc.desc    Sanitize route seed 8 length 6 seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute008', 0, async function () {
      await yieldThread();
      const raw = '#&]:?aI_#&]:?aI_#&]:';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute008 done');
    });
}

function RouteSanitizationPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1129
     * @tc.name    JsRoute009
     * @tc.desc    Sanitize route seed 9 length 9 seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute009', 0, async function () {
      await yieldThread();
      const raw = '(}.Zed2$(}.Zed2$(}.Z';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Z');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1130
     * @tc.name    JsRoute010
     * @tc.desc    Sanitize route seed 10 length 8 seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute010', 0, async function () {
      await yieldThread();
      const raw = ';>p/x@^[;>p/x@^[;>p/';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1131
     * @tc.name    JsRoute011
     * @tc.desc    Sanitize route seed 11 length 12 seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute011', 0, async function () {
      await yieldThread();
      const raw = 'agn4 *{,agn4 *{,agn4';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1132
     * @tc.name    JsRoute012
     * @tc.desc    Sanitize route seed 12 length 8 seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute012', 0, async function () {
      await yieldThread();
      const raw = 'se!%)|<9se!%)|<9se!%';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute012 done');
    });
}

function RouteSanitizationPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1133
     * @tc.name    JsRoute013
     * @tc.desc    Sanitize route seed 13 length 7 seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute013', 0, async function () {
      await yieldThread();
      const raw = '_#&]:?aI_#&]:?aI_#&]';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1134
     * @tc.name    JsRoute014
     * @tc.desc    Sanitize route seed 14 length 8 seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute014', 0, async function () {
      await yieldThread();
      const raw = '$(}.Zed2$(}.Zed2$(}.';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1135
     * @tc.name    JsRoute015
     * @tc.desc    Sanitize route seed 15 length 7 seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute015', 0, async function () {
      await yieldThread();
      const raw = '[;>p/x@^[;>p/x@^[;>p';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute015 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1136
     * @tc.name    JsRoute016
     * @tc.desc    Sanitize route seed 16 length 11 seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute016', 0, async function () {
      await yieldThread();
      const raw = ',agn4 *{,agn4 *{,agn';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4agn');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute016 done');
    });
}

function RouteSanitizationPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1137
     * @tc.name    JsRoute017
     * @tc.desc    Sanitize route seed 17 length 9 seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute017', 0, async function () {
      await yieldThread();
      const raw = '9se!%)|<9se!%)|<9se!';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1138
     * @tc.name    JsRoute018
     * @tc.desc    Sanitize route seed 18 length 8 seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute018', 0, async function () {
      await yieldThread();
      const raw = 'I_#&]:?aI_#&]:?aI_#&';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('I_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1139
     * @tc.name    JsRoute019
     * @tc.desc    Sanitize route seed 19 length 9 seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute019', 0, async function () {
      await yieldThread();
      const raw = '2$(}.Zed2$(}.Zed2$(}';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1140
     * @tc.name    JsRoute020
     * @tc.desc    Sanitize route seed 20 length 6 seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute020', 0, async function () {
      await yieldThread();
      const raw = '^[;>p/x@^[;>p/x@^[;>';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute020 done');
    });
}

function RouteSanitizationPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1141
     * @tc.name    JsRoute021
     * @tc.desc    Sanitize route seed 21 length 10 seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute021', 0, async function () {
      await yieldThread();
      const raw = '{,agn4 *{,agn4 *{,ag';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4ag');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1142
     * @tc.name    JsRoute022
     * @tc.desc    Sanitize route seed 22 length 9 seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute022', 0, async function () {
      await yieldThread();
      const raw = '<9se!%)|<9se!%)|<9se';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1143
     * @tc.name    JsRoute023
     * @tc.desc    Sanitize route seed 23 length 9 seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute023', 0, async function () {
      await yieldThread();
      const raw = 'aI_#&]:?aI_#&]:?aI_#';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1144
     * @tc.name    JsRoute024
     * @tc.desc    Sanitize route seed 24 length 10 seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute024', 0, async function () {
      await yieldThread();
      const raw = 'd2$(}.Zed2$(}.Zed2$(';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('d2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute024 done');
    });
}

function RouteSanitizationPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1145
     * @tc.name    JsRoute025
     * @tc.desc    Sanitize route seed 25 length 6 seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute025', 0, async function () {
      await yieldThread();
      const raw = '@^[;>p/x@^[;>p/x@^[;';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1146
     * @tc.name    JsRoute026
     * @tc.desc    Sanitize route seed 26 length 9 seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute026', 0, async function () {
      await yieldThread();
      const raw = '*{,agn4 *{,agn4 *{,a';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4a');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1147
     * @tc.name    JsRoute027
     * @tc.desc    Sanitize route seed 27 length 8 seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute027', 0, async function () {
      await yieldThread();
      const raw = '|<9se!%)|<9se!%)|<9s';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9s');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1148
     * @tc.name    JsRoute028
     * @tc.desc    Sanitize route seed 28 length 9 seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute028', 0, async function () {
      await yieldThread();
      const raw = '?aI_#&]:?aI_#&]:?aI_';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute028 done');
    });
}

function RouteSanitizationPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1149
     * @tc.name    JsRoute029
     * @tc.desc    Sanitize route seed 29 length 11 seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute029', 0, async function () {
      await yieldThread();
      const raw = 'ed2$(}.Zed2$(}.Zed2$';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('ed2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1150
     * @tc.name    JsRoute030
     * @tc.desc    Sanitize route seed 30 length 7 seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute030', 0, async function () {
      await yieldThread();
      const raw = 'x@^[;>p/x@^[;>p/x@^[';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute030 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1151
     * @tc.name    JsRoute031
     * @tc.desc    Sanitize route seed 31 length 8 seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute031', 0, async function () {
      await yieldThread();
      const raw = ' *{,agn4 *{,agn4 *{,';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1152
     * @tc.name    JsRoute032
     * @tc.desc    Sanitize route seed 32 length 7 seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute032', 0, async function () {
      await yieldThread();
      const raw = ')|<9se!%)|<9se!%)|<9';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute032 done');
    });
}

function RouteSanitizationPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1153
     * @tc.name    JsRoute033
     * @tc.desc    Sanitize route seed 33 length 8 seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute033', 0, async function () {
      await yieldThread();
      const raw = ':?aI_#&]:?aI_#&]:?aI';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_aI');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1154
     * @tc.name    JsRoute034
     * @tc.desc    Sanitize route seed 34 length 12 seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute034', 0, async function () {
      await yieldThread();
      const raw = 'Zed2$(}.Zed2$(}.Zed2';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1155
     * @tc.name    JsRoute035
     * @tc.desc    Sanitize route seed 35 length 8 seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute035', 0, async function () {
      await yieldThread();
      const raw = '/x@^[;>p/x@^[;>p/x@^';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('/xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1156
     * @tc.name    JsRoute036
     * @tc.desc    Sanitize route seed 36 length 9 seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute036', 0, async function () {
      await yieldThread();
      const raw = '4 *{,agn4 *{,agn4 *{';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute036 done');
    });
}

function RouteSanitizationPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1157
     * @tc.name    JsRoute037
     * @tc.desc    Sanitize route seed 37 length 6 seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute037', 0, async function () {
      await yieldThread();
      const raw = '%)|<9se!%)|<9se!%)|<';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1158
     * @tc.name    JsRoute038
     * @tc.desc    Sanitize route seed 38 length 7 seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute038', 0, async function () {
      await yieldThread();
      const raw = ']:?aI_#&]:?aI_#&]:?a';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_a');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1159
     * @tc.name    JsRoute039
     * @tc.desc    Sanitize route seed 39 length 11 seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute039', 0, async function () {
      await yieldThread();
      const raw = '.Zed2$(}.Zed2$(}.Zed';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Zed');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1160
     * @tc.name    JsRoute040
     * @tc.desc    Sanitize route seed 40 length 9 seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute040', 0, async function () {
      await yieldThread();
      const raw = 'p/x@^[;>p/x@^[;>p/x@';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute040 done');
    });
}

function RouteSanitizationPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1161
     * @tc.name    JsRoute041
     * @tc.desc    Sanitize route seed 41 length 10 seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute041', 0, async function () {
      await yieldThread();
      const raw = 'n4 *{,agn4 *{,agn4 *';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('n4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1162
     * @tc.name    JsRoute042
     * @tc.desc    Sanitize route seed 42 length 6 seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute042', 0, async function () {
      await yieldThread();
      const raw = '!%)|<9se!%)|<9se!%)|';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1163
     * @tc.name    JsRoute043
     * @tc.desc    Sanitize route seed 43 length 6 seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute043', 0, async function () {
      await yieldThread();
      const raw = '&]:?aI_#&]:?aI_#&]:?';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1164
     * @tc.name    JsRoute044
     * @tc.desc    Sanitize route seed 44 length 10 seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute044', 0, async function () {
      await yieldThread();
      const raw = '}.Zed2$(}.Zed2$(}.Ze';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Ze');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute044 done');
    });
}

function RouteSanitizationPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1165
     * @tc.name    JsRoute045
     * @tc.desc    Sanitize route seed 45 length 9 seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute045', 0, async function () {
      await yieldThread();
      const raw = '>p/x@^[;>p/x@^[;>p/x';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute045 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1166
     * @tc.name    JsRoute046
     * @tc.desc    Sanitize route seed 46 length 11 seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute046', 0, async function () {
      await yieldThread();
      const raw = 'gn4 *{,agn4 *{,agn4 ';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('gn4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1167
     * @tc.name    JsRoute047
     * @tc.desc    Sanitize route seed 47 length 7 seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute047', 0, async function () {
      await yieldThread();
      const raw = 'e!%)|<9se!%)|<9se!%)';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('e9se9se');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1168
     * @tc.name    JsRoute048
     * @tc.desc    Sanitize route seed 48 length 6 seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute048', 0, async function () {
      await yieldThread();
      const raw = '#&]:?aI_#&]:?aI_#&]:';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute048 done');
    });
}

function RouteSanitizationPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1169
     * @tc.name    JsRoute049
     * @tc.desc    Sanitize route seed 49 length 9 seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute049', 0, async function () {
      await yieldThread();
      const raw = '(}.Zed2$(}.Zed2$(}.Z';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Z');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1170
     * @tc.name    JsRoute050
     * @tc.desc    Sanitize route seed 50 length 8 seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute050', 0, async function () {
      await yieldThread();
      const raw = ';>p/x@^[;>p/x@^[;>p/';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1171
     * @tc.name    JsRoute051
     * @tc.desc    Sanitize route seed 51 length 12 seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute051', 0, async function () {
      await yieldThread();
      const raw = 'agn4 *{,agn4 *{,agn4';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1172
     * @tc.name    JsRoute052
     * @tc.desc    Sanitize route seed 52 length 8 seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute052', 0, async function () {
      await yieldThread();
      const raw = 'se!%)|<9se!%)|<9se!%';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute052 done');
    });
}

function RouteSanitizationPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1173
     * @tc.name    JsRoute053
     * @tc.desc    Sanitize route seed 53 length 7 seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute053', 0, async function () {
      await yieldThread();
      const raw = '_#&]:?aI_#&]:?aI_#&]';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1174
     * @tc.name    JsRoute054
     * @tc.desc    Sanitize route seed 54 length 8 seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute054', 0, async function () {
      await yieldThread();
      const raw = '$(}.Zed2$(}.Zed2$(}.';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute054 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1175
     * @tc.name    JsRoute055
     * @tc.desc    Sanitize route seed 55 length 7 seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute055', 0, async function () {
      await yieldThread();
      const raw = '[;>p/x@^[;>p/x@^[;>p';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1176
     * @tc.name    JsRoute056
     * @tc.desc    Sanitize route seed 56 length 11 seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute056', 0, async function () {
      await yieldThread();
      const raw = ',agn4 *{,agn4 *{,agn';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4agn');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute056 done');
    });
}

function RouteSanitizationPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1177
     * @tc.name    JsRoute057
     * @tc.desc    Sanitize route seed 57 length 9 seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute057', 0, async function () {
      await yieldThread();
      const raw = '9se!%)|<9se!%)|<9se!';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1178
     * @tc.name    JsRoute058
     * @tc.desc    Sanitize route seed 58 length 8 seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute058', 0, async function () {
      await yieldThread();
      const raw = 'I_#&]:?aI_#&]:?aI_#&';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('I_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1179
     * @tc.name    JsRoute059
     * @tc.desc    Sanitize route seed 59 length 9 seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute059', 0, async function () {
      await yieldThread();
      const raw = '2$(}.Zed2$(}.Zed2$(}';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1180
     * @tc.name    JsRoute060
     * @tc.desc    Sanitize route seed 60 length 6 seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute060', 0, async function () {
      await yieldThread();
      const raw = '^[;>p/x@^[;>p/x@^[;>';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute060 done');
    });
}

function RouteSanitizationPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1181
     * @tc.name    JsRoute061
     * @tc.desc    Sanitize route seed 61 length 10 seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute061', 0, async function () {
      await yieldThread();
      const raw = '{,agn4 *{,agn4 *{,ag';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4ag');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1182
     * @tc.name    JsRoute062
     * @tc.desc    Sanitize route seed 62 length 9 seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute062', 0, async function () {
      await yieldThread();
      const raw = '<9se!%)|<9se!%)|<9se';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1183
     * @tc.name    JsRoute063
     * @tc.desc    Sanitize route seed 63 length 9 seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute063', 0, async function () {
      await yieldThread();
      const raw = 'aI_#&]:?aI_#&]:?aI_#';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1184
     * @tc.name    JsRoute064
     * @tc.desc    Sanitize route seed 64 length 10 seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute064', 0, async function () {
      await yieldThread();
      const raw = 'd2$(}.Zed2$(}.Zed2$(';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('d2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute064 done');
    });
}

function RouteSanitizationPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1185
     * @tc.name    JsRoute065
     * @tc.desc    Sanitize route seed 65 length 6 seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute065', 0, async function () {
      await yieldThread();
      const raw = '@^[;>p/x@^[;>p/x@^[;';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1186
     * @tc.name    JsRoute066
     * @tc.desc    Sanitize route seed 66 length 9 seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute066', 0, async function () {
      await yieldThread();
      const raw = '*{,agn4 *{,agn4 *{,a';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4a');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute066 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1187
     * @tc.name    JsRoute067
     * @tc.desc    Sanitize route seed 67 length 8 seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute067', 0, async function () {
      await yieldThread();
      const raw = '|<9se!%)|<9se!%)|<9s';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9s');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1188
     * @tc.name    JsRoute068
     * @tc.desc    Sanitize route seed 68 length 9 seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute068', 0, async function () {
      await yieldThread();
      const raw = '?aI_#&]:?aI_#&]:?aI_';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute068 done');
    });
}

function RouteSanitizationPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1189
     * @tc.name    JsRoute069
     * @tc.desc    Sanitize route seed 69 length 11 seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute069', 0, async function () {
      await yieldThread();
      const raw = 'ed2$(}.Zed2$(}.Zed2$';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('ed2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1190
     * @tc.name    JsRoute070
     * @tc.desc    Sanitize route seed 70 length 7 seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute070', 0, async function () {
      await yieldThread();
      const raw = 'x@^[;>p/x@^[;>p/x@^[';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1191
     * @tc.name    JsRoute071
     * @tc.desc    Sanitize route seed 71 length 8 seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute071', 0, async function () {
      await yieldThread();
      const raw = ' *{,agn4 *{,agn4 *{,';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1192
     * @tc.name    JsRoute072
     * @tc.desc    Sanitize route seed 72 length 7 seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute072', 0, async function () {
      await yieldThread();
      const raw = ')|<9se!%)|<9se!%)|<9';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute072 done');
    });
}

function RouteSanitizationPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1193
     * @tc.name    JsRoute073
     * @tc.desc    Sanitize route seed 73 length 8 seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute073', 0, async function () {
      await yieldThread();
      const raw = ':?aI_#&]:?aI_#&]:?aI';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_aI');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1194
     * @tc.name    JsRoute074
     * @tc.desc    Sanitize route seed 74 length 12 seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute074', 0, async function () {
      await yieldThread();
      const raw = 'Zed2$(}.Zed2$(}.Zed2';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1195
     * @tc.name    JsRoute075
     * @tc.desc    Sanitize route seed 75 length 8 seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute075', 0, async function () {
      await yieldThread();
      const raw = '/x@^[;>p/x@^[;>p/x@^';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('/xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute075 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1196
     * @tc.name    JsRoute076
     * @tc.desc    Sanitize route seed 76 length 9 seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute076', 0, async function () {
      await yieldThread();
      const raw = '4 *{,agn4 *{,agn4 *{';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute076 done');
    });
}

function RouteSanitizationPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1197
     * @tc.name    JsRoute077
     * @tc.desc    Sanitize route seed 77 length 6 seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute077', 0, async function () {
      await yieldThread();
      const raw = '%)|<9se!%)|<9se!%)|<';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1198
     * @tc.name    JsRoute078
     * @tc.desc    Sanitize route seed 78 length 7 seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute078', 0, async function () {
      await yieldThread();
      const raw = ']:?aI_#&]:?aI_#&]:?a';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_a');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute078 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1199
     * @tc.name    JsRoute079
     * @tc.desc    Sanitize route seed 79 length 11 seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute079', 0, async function () {
      await yieldThread();
      const raw = '.Zed2$(}.Zed2$(}.Zed';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Zed');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1200
     * @tc.name    JsRoute080
     * @tc.desc    Sanitize route seed 80 length 9 seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute080', 0, async function () {
      await yieldThread();
      const raw = 'p/x@^[;>p/x@^[;>p/x@';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute080 done');
    });
}

function RouteSanitizationPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1201
     * @tc.name    JsRoute081
     * @tc.desc    Sanitize route seed 81 length 10 seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute081', 0, async function () {
      await yieldThread();
      const raw = 'n4 *{,agn4 *{,agn4 *';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('n4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute081 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1202
     * @tc.name    JsRoute082
     * @tc.desc    Sanitize route seed 82 length 6 seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute082', 0, async function () {
      await yieldThread();
      const raw = '!%)|<9se!%)|<9se!%)|';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1203
     * @tc.name    JsRoute083
     * @tc.desc    Sanitize route seed 83 length 6 seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute083', 0, async function () {
      await yieldThread();
      const raw = '&]:?aI_#&]:?aI_#&]:?';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1204
     * @tc.name    JsRoute084
     * @tc.desc    Sanitize route seed 84 length 10 seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute084', 0, async function () {
      await yieldThread();
      const raw = '}.Zed2$(}.Zed2$(}.Ze';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Ze');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute084 done');
    });
}

function RouteSanitizationPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1205
     * @tc.name    JsRoute085
     * @tc.desc    Sanitize route seed 85 length 9 seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute085', 0, async function () {
      await yieldThread();
      const raw = '>p/x@^[;>p/x@^[;>p/x';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute085 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1206
     * @tc.name    JsRoute086
     * @tc.desc    Sanitize route seed 86 length 11 seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute086', 0, async function () {
      await yieldThread();
      const raw = 'gn4 *{,agn4 *{,agn4 ';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('gn4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1207
     * @tc.name    JsRoute087
     * @tc.desc    Sanitize route seed 87 length 7 seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute087', 0, async function () {
      await yieldThread();
      const raw = 'e!%)|<9se!%)|<9se!%)';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('e9se9se');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute087 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1208
     * @tc.name    JsRoute088
     * @tc.desc    Sanitize route seed 88 length 6 seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute088', 0, async function () {
      await yieldThread();
      const raw = '#&]:?aI_#&]:?aI_#&]:';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute088 done');
    });
}

function RouteSanitizationPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1209
     * @tc.name    JsRoute089
     * @tc.desc    Sanitize route seed 89 length 9 seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute089', 0, async function () {
      await yieldThread();
      const raw = '(}.Zed2$(}.Zed2$(}.Z';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Z');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1210
     * @tc.name    JsRoute090
     * @tc.desc    Sanitize route seed 90 length 8 seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute090', 0, async function () {
      await yieldThread();
      const raw = ';>p/x@^[;>p/x@^[;>p/';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute090 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1211
     * @tc.name    JsRoute091
     * @tc.desc    Sanitize route seed 91 length 12 seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute091', 0, async function () {
      await yieldThread();
      const raw = 'agn4 *{,agn4 *{,agn4';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1212
     * @tc.name    JsRoute092
     * @tc.desc    Sanitize route seed 92 length 8 seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute092', 0, async function () {
      await yieldThread();
      const raw = 'se!%)|<9se!%)|<9se!%';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute092 done');
    });
}

function RouteSanitizationPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1213
     * @tc.name    JsRoute093
     * @tc.desc    Sanitize route seed 93 length 7 seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute093', 0, async function () {
      await yieldThread();
      const raw = '_#&]:?aI_#&]:?aI_#&]';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute093 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1214
     * @tc.name    JsRoute094
     * @tc.desc    Sanitize route seed 94 length 8 seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute094', 0, async function () {
      await yieldThread();
      const raw = '$(}.Zed2$(}.Zed2$(}.';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1215
     * @tc.name    JsRoute095
     * @tc.desc    Sanitize route seed 95 length 7 seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute095', 0, async function () {
      await yieldThread();
      const raw = '[;>p/x@^[;>p/x@^[;>p';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute095 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1216
     * @tc.name    JsRoute096
     * @tc.desc    Sanitize route seed 96 length 11 seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute096', 0, async function () {
      await yieldThread();
      const raw = ',agn4 *{,agn4 *{,agn';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4agn');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute096 done');
    });
}

function RouteSanitizationPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1217
     * @tc.name    JsRoute097
     * @tc.desc    Sanitize route seed 97 length 9 seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute097', 0, async function () {
      await yieldThread();
      const raw = '9se!%)|<9se!%)|<9se!';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1218
     * @tc.name    JsRoute098
     * @tc.desc    Sanitize route seed 98 length 8 seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute098', 0, async function () {
      await yieldThread();
      const raw = 'I_#&]:?aI_#&]:?aI_#&';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('I_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1219
     * @tc.name    JsRoute099
     * @tc.desc    Sanitize route seed 99 length 9 seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute099', 0, async function () {
      await yieldThread();
      const raw = '2$(}.Zed2$(}.Zed2$(}';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute099 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1220
     * @tc.name    JsRoute100
     * @tc.desc    Sanitize route seed 100 length 6 seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute100', 0, async function () {
      await yieldThread();
      const raw = '^[;>p/x@^[;>p/x@^[;>';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute100 done');
    });
}

function RouteSanitizationPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1221
     * @tc.name    JsRoute101
     * @tc.desc    Sanitize route seed 101 length 10 seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute101', 0, async function () {
      await yieldThread();
      const raw = '{,agn4 *{,agn4 *{,ag';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4ag');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1222
     * @tc.name    JsRoute102
     * @tc.desc    Sanitize route seed 102 length 9 seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute102', 0, async function () {
      await yieldThread();
      const raw = '<9se!%)|<9se!%)|<9se';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute102 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1223
     * @tc.name    JsRoute103
     * @tc.desc    Sanitize route seed 103 length 9 seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute103', 0, async function () {
      await yieldThread();
      const raw = 'aI_#&]:?aI_#&]:?aI_#';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1224
     * @tc.name    JsRoute104
     * @tc.desc    Sanitize route seed 104 length 10 seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute104', 0, async function () {
      await yieldThread();
      const raw = 'd2$(}.Zed2$(}.Zed2$(';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('d2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute104 done');
    });
}

function RouteSanitizationPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1225
     * @tc.name    JsRoute105
     * @tc.desc    Sanitize route seed 105 length 6 seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute105', 0, async function () {
      await yieldThread();
      const raw = '@^[;>p/x@^[;>p/x@^[;';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute105 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1226
     * @tc.name    JsRoute106
     * @tc.desc    Sanitize route seed 106 length 9 seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute106', 0, async function () {
      await yieldThread();
      const raw = '*{,agn4 *{,agn4 *{,a';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4a');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1227
     * @tc.name    JsRoute107
     * @tc.desc    Sanitize route seed 107 length 8 seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute107', 0, async function () {
      await yieldThread();
      const raw = '|<9se!%)|<9se!%)|<9s';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9s');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1228
     * @tc.name    JsRoute108
     * @tc.desc    Sanitize route seed 108 length 9 seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute108', 0, async function () {
      await yieldThread();
      const raw = '?aI_#&]:?aI_#&]:?aI_';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute108 done');
    });
}

function RouteSanitizationPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1229
     * @tc.name    JsRoute109
     * @tc.desc    Sanitize route seed 109 length 11 seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute109', 0, async function () {
      await yieldThread();
      const raw = 'ed2$(}.Zed2$(}.Zed2$';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('ed2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1230
     * @tc.name    JsRoute110
     * @tc.desc    Sanitize route seed 110 length 7 seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute110', 0, async function () {
      await yieldThread();
      const raw = 'x@^[;>p/x@^[;>p/x@^[';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute110 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1231
     * @tc.name    JsRoute111
     * @tc.desc    Sanitize route seed 111 length 8 seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute111', 0, async function () {
      await yieldThread();
      const raw = ' *{,agn4 *{,agn4 *{,';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute111 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1232
     * @tc.name    JsRoute112
     * @tc.desc    Sanitize route seed 112 length 7 seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute112', 0, async function () {
      await yieldThread();
      const raw = ')|<9se!%)|<9se!%)|<9';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute112 done');
    });
}

function RouteSanitizationPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1233
     * @tc.name    JsRoute113
     * @tc.desc    Sanitize route seed 113 length 8 seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute113', 0, async function () {
      await yieldThread();
      const raw = ':?aI_#&]:?aI_#&]:?aI';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_aI');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1234
     * @tc.name    JsRoute114
     * @tc.desc    Sanitize route seed 114 length 12 seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute114', 0, async function () {
      await yieldThread();
      const raw = 'Zed2$(}.Zed2$(}.Zed2';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute114 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1235
     * @tc.name    JsRoute115
     * @tc.desc    Sanitize route seed 115 length 8 seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute115', 0, async function () {
      await yieldThread();
      const raw = '/x@^[;>p/x@^[;>p/x@^';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('/xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1236
     * @tc.name    JsRoute116
     * @tc.desc    Sanitize route seed 116 length 9 seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute116', 0, async function () {
      await yieldThread();
      const raw = '4 *{,agn4 *{,agn4 *{';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute116 done');
    });
}

function RouteSanitizationPart030() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1237
     * @tc.name    JsRoute117
     * @tc.desc    Sanitize route seed 117 length 6 seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute117', 0, async function () {
      await yieldThread();
      const raw = '%)|<9se!%)|<9se!%)|<';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute117 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1238
     * @tc.name    JsRoute118
     * @tc.desc    Sanitize route seed 118 length 7 seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute118', 0, async function () {
      await yieldThread();
      const raw = ']:?aI_#&]:?aI_#&]:?a';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_a');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1239
     * @tc.name    JsRoute119
     * @tc.desc    Sanitize route seed 119 length 11 seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute119', 0, async function () {
      await yieldThread();
      const raw = '.Zed2$(}.Zed2$(}.Zed';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Zed');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1240
     * @tc.name    JsRoute120
     * @tc.desc    Sanitize route seed 120 length 9 seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute120', 0, async function () {
      await yieldThread();
      const raw = 'p/x@^[;>p/x@^[;>p/x@';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute120 done');
    });
}

function RouteSanitizationPart031() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1241
     * @tc.name    JsRoute121
     * @tc.desc    Sanitize route seed 121 length 10 seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute121', 0, async function () {
      await yieldThread();
      const raw = 'n4 *{,agn4 *{,agn4 *';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('n4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1242
     * @tc.name    JsRoute122
     * @tc.desc    Sanitize route seed 122 length 6 seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute122', 0, async function () {
      await yieldThread();
      const raw = '!%)|<9se!%)|<9se!%)|';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1243
     * @tc.name    JsRoute123
     * @tc.desc    Sanitize route seed 123 length 6 seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute123', 0, async function () {
      await yieldThread();
      const raw = '&]:?aI_#&]:?aI_#&]:?';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute123 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1244
     * @tc.name    JsRoute124
     * @tc.desc    Sanitize route seed 124 length 10 seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute124', 0, async function () {
      await yieldThread();
      const raw = '}.Zed2$(}.Zed2$(}.Ze';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Ze');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute124 done');
    });
}

function RouteSanitizationPart032() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1245
     * @tc.name    JsRoute125
     * @tc.desc    Sanitize route seed 125 length 9 seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute125', 0, async function () {
      await yieldThread();
      const raw = '>p/x@^[;>p/x@^[;>p/x';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1246
     * @tc.name    JsRoute126
     * @tc.desc    Sanitize route seed 126 length 11 seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute126', 0, async function () {
      await yieldThread();
      const raw = 'gn4 *{,agn4 *{,agn4 ';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('gn4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute126 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1247
     * @tc.name    JsRoute127
     * @tc.desc    Sanitize route seed 127 length 7 seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute127', 0, async function () {
      await yieldThread();
      const raw = 'e!%)|<9se!%)|<9se!%)';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('e9se9se');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1248
     * @tc.name    JsRoute128
     * @tc.desc    Sanitize route seed 128 length 6 seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute128', 0, async function () {
      await yieldThread();
      const raw = '#&]:?aI_#&]:?aI_#&]:';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute128 done');
    });
}

function RouteSanitizationPart033() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1249
     * @tc.name    JsRoute129
     * @tc.desc    Sanitize route seed 129 length 9 seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute129', 0, async function () {
      await yieldThread();
      const raw = '(}.Zed2$(}.Zed2$(}.Z';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2Z');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute129 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1250
     * @tc.name    JsRoute130
     * @tc.desc    Sanitize route seed 130 length 8 seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute130', 0, async function () {
      await yieldThread();
      const raw = ';>p/x@^[;>p/x@^[;>p/';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp/');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute130 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1251
     * @tc.name    JsRoute131
     * @tc.desc    Sanitize route seed 131 length 12 seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute131', 0, async function () {
      await yieldThread();
      const raw = 'agn4 *{,agn4 *{,agn4';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4agn4');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1252
     * @tc.name    JsRoute132
     * @tc.desc    Sanitize route seed 132 length 8 seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute132', 0, async function () {
      await yieldThread();
      const raw = 'se!%)|<9se!%)|<9se!%';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute132 done');
    });
}

function RouteSanitizationPart034() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1253
     * @tc.name    JsRoute133
     * @tc.desc    Sanitize route seed 133 length 7 seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute133', 0, async function () {
      await yieldThread();
      const raw = '_#&]:?aI_#&]:?aI_#&]';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1254
     * @tc.name    JsRoute134
     * @tc.desc    Sanitize route seed 134 length 8 seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute134', 0, async function () {
      await yieldThread();
      const raw = '$(}.Zed2$(}.Zed2$(}.';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1255
     * @tc.name    JsRoute135
     * @tc.desc    Sanitize route seed 135 length 7 seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute135', 0, async function () {
      await yieldThread();
      const raw = '[;>p/x@^[;>p/x@^[;>p';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/xp');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute135 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1256
     * @tc.name    JsRoute136
     * @tc.desc    Sanitize route seed 136 length 11 seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute136', 0, async function () {
      await yieldThread();
      const raw = ',agn4 *{,agn4 *{,agn';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('agn4agn4agn');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute136 done');
    });
}

function RouteSanitizationPart035() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1257
     * @tc.name    JsRoute137
     * @tc.desc    Sanitize route seed 137 length 9 seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute137', 0, async function () {
      await yieldThread();
      const raw = '9se!%)|<9se!%)|<9se!';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('9se9se9se');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1258
     * @tc.name    JsRoute138
     * @tc.desc    Sanitize route seed 138 length 8 seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute138', 0, async function () {
      await yieldThread();
      const raw = 'I_#&]:?aI_#&]:?aI_#&';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('I_aI_aI_');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute138 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1259
     * @tc.name    JsRoute139
     * @tc.desc    Sanitize route seed 139 length 9 seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute139', 0, async function () {
      await yieldThread();
      const raw = '2$(}.Zed2$(}.Zed2$(}';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('2Zed2Zed2');
      expect(model.isValidRoute(clean)).assertEqual(false);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_1260
     * @tc.name    JsRoute140
     * @tc.desc    Sanitize route seed 140 length 6 seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsRoute140', 0, async function () {
      await yieldThread();
      const raw = '^[;>p/x@^[;>p/x@^[;>';
      const clean = model.sanitizeRoute(raw);
      expect(clean).assertEqual('p/xp/x');
      expect(model.isValidRoute(clean)).assertEqual(true);
      expect(model.sanitizeRoute(clean)).assertEqual(clean);
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsRoute140 done');
    });
}

function RouteSanitizationGroup001() {
  RouteSanitizationPart001();
  RouteSanitizationPart002();
  RouteSanitizationPart003();
  RouteSanitizationPart004();
  RouteSanitizationPart005();
  RouteSanitizationPart006();
  RouteSanitizationPart007();
  RouteSanitizationPart008();
  RouteSanitizationPart009();
  RouteSanitizationPart010();
  RouteSanitizationPart011();
  RouteSanitizationPart012();
  RouteSanitizationPart013();
  RouteSanitizationPart014();
  RouteSanitizationPart015();
  RouteSanitizationPart016();
  RouteSanitizationPart017();
  RouteSanitizationPart018();
  RouteSanitizationPart019();
  RouteSanitizationPart020();
  RouteSanitizationPart021();
  RouteSanitizationPart022();
  RouteSanitizationPart023();
  RouteSanitizationPart024();
  RouteSanitizationPart025();
  RouteSanitizationPart026();
  RouteSanitizationPart027();
  RouteSanitizationPart028();
  RouteSanitizationPart029();
  RouteSanitizationPart030();
  RouteSanitizationPart031();
  RouteSanitizationPart032();
  RouteSanitizationPart033();
  RouteSanitizationPart034();
  RouteSanitizationPart035();
}

export default function routeSanitizationSuite() {
  describe('RouteSanitizationSuite', function () {
    RouteSanitizationGroup001();
  });
}
