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

function ResourceQualifierPart001() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0421
     * @tc.name    JsQualifier001
     * @tc.desc    Qualifier en-US at 160 dpi page atomicLayout seed 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier001', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier001 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0422
     * @tc.name    JsQualifier002
     * @tc.desc    Qualifier ar-EG at 200 dpi page equipartition seed 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier002', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier002 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0423
     * @tc.name    JsQualifier003
     * @tc.desc    Qualifier he-IL at 240 dpi page extension seed 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier003', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier003 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0424
     * @tc.name    JsQualifier004
     * @tc.desc    Qualifier fr-FR at 280 dpi page resource seed 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier004', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier004 done');
    });
}

function ResourceQualifierPart002() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0425
     * @tc.name    JsQualifier005
     * @tc.desc    Qualifier ja-JP at 320 dpi page typicalScene seed 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier005', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier005 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0426
     * @tc.name    JsQualifier006
     * @tc.desc    Qualifier ur-PK at 360 dpi page diversion seed 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier006', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier006 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0427
     * @tc.name    JsQualifier007
     * @tc.desc    Qualifier fa-IR at 400 dpi page repeat seed 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier007', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier007 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0428
     * @tc.name    JsQualifier008
     * @tc.desc    Qualifier de-DE at 440 dpi page indentation seed 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier008', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier008 done');
    });
}

function ResourceQualifierPart003() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0429
     * @tc.name    JsQualifier009
     * @tc.desc    Qualifier ru-RU at 480 dpi page banner seed 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier009', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier009 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0430
     * @tc.name    JsQualifier010
     * @tc.desc    Qualifier zh-CN at 120 dpi page gridRow seed 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier010', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier010 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0431
     * @tc.name    JsQualifier011
     * @tc.desc    Qualifier en-US at 160 dpi page mediaQuery seed 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier011', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier011 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0432
     * @tc.name    JsQualifier012
     * @tc.desc    Qualifier ar-EG at 200 dpi page index seed 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier012', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier012 done');
    });
}

function ResourceQualifierPart004() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0433
     * @tc.name    JsQualifier013
     * @tc.desc    Qualifier he-IL at 240 dpi page atomicLayout seed 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier013', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier013 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0434
     * @tc.name    JsQualifier014
     * @tc.desc    Qualifier fr-FR at 280 dpi page equipartition seed 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier014', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier014 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0435
     * @tc.name    JsQualifier015
     * @tc.desc    Qualifier ja-JP at 320 dpi page extension seed 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier015', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier015 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0436
     * @tc.name    JsQualifier016
     * @tc.desc    Qualifier ur-PK at 360 dpi page resource seed 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier016', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier016 done');
    });
}

function ResourceQualifierPart005() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0437
     * @tc.name    JsQualifier017
     * @tc.desc    Qualifier fa-IR at 400 dpi page typicalScene seed 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier017', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier017 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0438
     * @tc.name    JsQualifier018
     * @tc.desc    Qualifier de-DE at 440 dpi page diversion seed 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier018', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier018 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0439
     * @tc.name    JsQualifier019
     * @tc.desc    Qualifier ru-RU at 480 dpi page repeat seed 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier019', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier019 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0440
     * @tc.name    JsQualifier020
     * @tc.desc    Qualifier zh-CN at 120 dpi page indentation seed 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier020', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier020 done');
    });
}

function ResourceQualifierPart006() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0441
     * @tc.name    JsQualifier021
     * @tc.desc    Qualifier en-US at 160 dpi page banner seed 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier021', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier021 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0442
     * @tc.name    JsQualifier022
     * @tc.desc    Qualifier ar-EG at 200 dpi page gridRow seed 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier022', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier022 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0443
     * @tc.name    JsQualifier023
     * @tc.desc    Qualifier he-IL at 240 dpi page mediaQuery seed 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier023', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier023 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0444
     * @tc.name    JsQualifier024
     * @tc.desc    Qualifier fr-FR at 280 dpi page index seed 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier024', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier024 done');
    });
}

function ResourceQualifierPart007() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0445
     * @tc.name    JsQualifier025
     * @tc.desc    Qualifier ja-JP at 320 dpi page atomicLayout seed 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier025', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier025 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0446
     * @tc.name    JsQualifier026
     * @tc.desc    Qualifier ur-PK at 360 dpi page equipartition seed 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier026', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier026 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0447
     * @tc.name    JsQualifier027
     * @tc.desc    Qualifier fa-IR at 400 dpi page extension seed 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier027', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier027 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0448
     * @tc.name    JsQualifier028
     * @tc.desc    Qualifier de-DE at 440 dpi page resource seed 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier028', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier028 done');
    });
}

function ResourceQualifierPart008() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0449
     * @tc.name    JsQualifier029
     * @tc.desc    Qualifier ru-RU at 480 dpi page typicalScene seed 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier029', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier029 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0450
     * @tc.name    JsQualifier030
     * @tc.desc    Qualifier zh-CN at 120 dpi page diversion seed 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier030', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier030 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0451
     * @tc.name    JsQualifier031
     * @tc.desc    Qualifier en-US at 160 dpi page repeat seed 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier031', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier031 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0452
     * @tc.name    JsQualifier032
     * @tc.desc    Qualifier ar-EG at 200 dpi page indentation seed 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier032', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier032 done');
    });
}

function ResourceQualifierPart009() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0453
     * @tc.name    JsQualifier033
     * @tc.desc    Qualifier he-IL at 240 dpi page banner seed 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier033', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier033 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0454
     * @tc.name    JsQualifier034
     * @tc.desc    Qualifier fr-FR at 280 dpi page gridRow seed 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier034', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier034 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0455
     * @tc.name    JsQualifier035
     * @tc.desc    Qualifier ja-JP at 320 dpi page mediaQuery seed 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier035', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier035 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0456
     * @tc.name    JsQualifier036
     * @tc.desc    Qualifier ur-PK at 360 dpi page index seed 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier036', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier036 done');
    });
}

function ResourceQualifierPart010() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0457
     * @tc.name    JsQualifier037
     * @tc.desc    Qualifier fa-IR at 400 dpi page atomicLayout seed 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier037', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier037 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0458
     * @tc.name    JsQualifier038
     * @tc.desc    Qualifier de-DE at 440 dpi page equipartition seed 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier038', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier038 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0459
     * @tc.name    JsQualifier039
     * @tc.desc    Qualifier ru-RU at 480 dpi page extension seed 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier039', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier039 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0460
     * @tc.name    JsQualifier040
     * @tc.desc    Qualifier zh-CN at 120 dpi page resource seed 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier040', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier040 done');
    });
}

function ResourceQualifierPart011() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0461
     * @tc.name    JsQualifier041
     * @tc.desc    Qualifier en-US at 160 dpi page typicalScene seed 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier041', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier041 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0462
     * @tc.name    JsQualifier042
     * @tc.desc    Qualifier ar-EG at 200 dpi page diversion seed 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier042', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier042 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0463
     * @tc.name    JsQualifier043
     * @tc.desc    Qualifier he-IL at 240 dpi page repeat seed 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier043', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier043 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0464
     * @tc.name    JsQualifier044
     * @tc.desc    Qualifier fr-FR at 280 dpi page indentation seed 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier044', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier044 done');
    });
}

function ResourceQualifierPart012() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0465
     * @tc.name    JsQualifier045
     * @tc.desc    Qualifier ja-JP at 320 dpi page banner seed 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier045', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier045 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0466
     * @tc.name    JsQualifier046
     * @tc.desc    Qualifier ur-PK at 360 dpi page gridRow seed 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier046', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier046 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0467
     * @tc.name    JsQualifier047
     * @tc.desc    Qualifier fa-IR at 400 dpi page mediaQuery seed 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier047', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier047 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0468
     * @tc.name    JsQualifier048
     * @tc.desc    Qualifier de-DE at 440 dpi page index seed 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier048', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier048 done');
    });
}

function ResourceQualifierPart013() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0469
     * @tc.name    JsQualifier049
     * @tc.desc    Qualifier ru-RU at 480 dpi page atomicLayout seed 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier049', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier049 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0470
     * @tc.name    JsQualifier050
     * @tc.desc    Qualifier zh-CN at 120 dpi page equipartition seed 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier050', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier050 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0471
     * @tc.name    JsQualifier051
     * @tc.desc    Qualifier en-US at 160 dpi page extension seed 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier051', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier051 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0472
     * @tc.name    JsQualifier052
     * @tc.desc    Qualifier ar-EG at 200 dpi page resource seed 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier052', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier052 done');
    });
}

function ResourceQualifierPart014() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0473
     * @tc.name    JsQualifier053
     * @tc.desc    Qualifier he-IL at 240 dpi page typicalScene seed 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier053', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier053 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0474
     * @tc.name    JsQualifier054
     * @tc.desc    Qualifier fr-FR at 280 dpi page diversion seed 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier054', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier054 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0475
     * @tc.name    JsQualifier055
     * @tc.desc    Qualifier ja-JP at 320 dpi page repeat seed 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier055', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier055 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0476
     * @tc.name    JsQualifier056
     * @tc.desc    Qualifier ur-PK at 360 dpi page indentation seed 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier056', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier056 done');
    });
}

function ResourceQualifierPart015() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0477
     * @tc.name    JsQualifier057
     * @tc.desc    Qualifier fa-IR at 400 dpi page banner seed 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier057', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier057 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0478
     * @tc.name    JsQualifier058
     * @tc.desc    Qualifier de-DE at 440 dpi page gridRow seed 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier058', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier058 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0479
     * @tc.name    JsQualifier059
     * @tc.desc    Qualifier ru-RU at 480 dpi page mediaQuery seed 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier059', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier059 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0480
     * @tc.name    JsQualifier060
     * @tc.desc    Qualifier zh-CN at 120 dpi page index seed 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier060', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier060 done');
    });
}

function ResourceQualifierPart016() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0481
     * @tc.name    JsQualifier061
     * @tc.desc    Qualifier en-US at 160 dpi page atomicLayout seed 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier061', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier061 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0482
     * @tc.name    JsQualifier062
     * @tc.desc    Qualifier ar-EG at 200 dpi page equipartition seed 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier062', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier062 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0483
     * @tc.name    JsQualifier063
     * @tc.desc    Qualifier he-IL at 240 dpi page extension seed 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier063', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier063 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0484
     * @tc.name    JsQualifier064
     * @tc.desc    Qualifier fr-FR at 280 dpi page resource seed 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier064', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier064 done');
    });
}

function ResourceQualifierPart017() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0485
     * @tc.name    JsQualifier065
     * @tc.desc    Qualifier ja-JP at 320 dpi page typicalScene seed 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier065', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier065 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0486
     * @tc.name    JsQualifier066
     * @tc.desc    Qualifier ur-PK at 360 dpi page diversion seed 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier066', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier066 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0487
     * @tc.name    JsQualifier067
     * @tc.desc    Qualifier fa-IR at 400 dpi page repeat seed 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier067', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier067 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0488
     * @tc.name    JsQualifier068
     * @tc.desc    Qualifier de-DE at 440 dpi page indentation seed 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier068', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier068 done');
    });
}

function ResourceQualifierPart018() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0489
     * @tc.name    JsQualifier069
     * @tc.desc    Qualifier ru-RU at 480 dpi page banner seed 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier069', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier069 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0490
     * @tc.name    JsQualifier070
     * @tc.desc    Qualifier zh-CN at 120 dpi page gridRow seed 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier070', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier070 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0491
     * @tc.name    JsQualifier071
     * @tc.desc    Qualifier en-US at 160 dpi page mediaQuery seed 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier071', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier071 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0492
     * @tc.name    JsQualifier072
     * @tc.desc    Qualifier ar-EG at 200 dpi page index seed 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier072', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier072 done');
    });
}

function ResourceQualifierPart019() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0493
     * @tc.name    JsQualifier073
     * @tc.desc    Qualifier he-IL at 240 dpi page atomicLayout seed 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier073', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier073 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0494
     * @tc.name    JsQualifier074
     * @tc.desc    Qualifier fr-FR at 280 dpi page equipartition seed 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier074', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier074 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0495
     * @tc.name    JsQualifier075
     * @tc.desc    Qualifier ja-JP at 320 dpi page extension seed 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier075', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier075 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0496
     * @tc.name    JsQualifier076
     * @tc.desc    Qualifier ur-PK at 360 dpi page resource seed 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier076', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier076 done');
    });
}

export default function resourceQualifierSuite() {
  describe('ResourceQualifierSuite', function () {
    ResourceQualifierPart001();
    ResourceQualifierPart002();
    ResourceQualifierPart003();
    ResourceQualifierPart004();
    ResourceQualifierPart005();
    ResourceQualifierPart006();
    ResourceQualifierPart007();
    ResourceQualifierPart008();
    ResourceQualifierPart009();
    ResourceQualifierPart010();
    ResourceQualifierPart011();
    ResourceQualifierPart012();
    ResourceQualifierPart013();
    ResourceQualifierPart014();
    ResourceQualifierPart015();
    ResourceQualifierPart016();
    ResourceQualifierPart017();
    ResourceQualifierPart018();
    ResourceQualifierPart019();
  });
}
