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

function ResourceQualifierPart020() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0497
     * @tc.name    JsQualifier077
     * @tc.desc    Qualifier fa-IR at 400 dpi page typicalScene seed 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier077', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier077 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0498
     * @tc.name    JsQualifier078
     * @tc.desc    Qualifier de-DE at 440 dpi page diversion seed 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier078', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier078 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0499
     * @tc.name    JsQualifier079
     * @tc.desc    Qualifier ru-RU at 480 dpi page repeat seed 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier079', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier079 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0500
     * @tc.name    JsQualifier080
     * @tc.desc    Qualifier zh-CN at 120 dpi page indentation seed 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier080', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier080 done');
    });
}

function ResourceQualifierPart021() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0501
     * @tc.name    JsQualifier081
     * @tc.desc    Qualifier en-US at 160 dpi page banner seed 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier081', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier081 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0502
     * @tc.name    JsQualifier082
     * @tc.desc    Qualifier ar-EG at 200 dpi page gridRow seed 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier082', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier082 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0503
     * @tc.name    JsQualifier083
     * @tc.desc    Qualifier he-IL at 240 dpi page mediaQuery seed 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier083', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier083 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0504
     * @tc.name    JsQualifier084
     * @tc.desc    Qualifier fr-FR at 280 dpi page index seed 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier084', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier084 done');
    });
}

function ResourceQualifierPart022() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0505
     * @tc.name    JsQualifier085
     * @tc.desc    Qualifier ja-JP at 320 dpi page atomicLayout seed 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier085', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier085 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0506
     * @tc.name    JsQualifier086
     * @tc.desc    Qualifier ur-PK at 360 dpi page equipartition seed 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier086', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier086 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0507
     * @tc.name    JsQualifier087
     * @tc.desc    Qualifier fa-IR at 400 dpi page extension seed 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier087', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier087 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0508
     * @tc.name    JsQualifier088
     * @tc.desc    Qualifier de-DE at 440 dpi page resource seed 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier088', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier088 done');
    });
}

function ResourceQualifierPart023() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0509
     * @tc.name    JsQualifier089
     * @tc.desc    Qualifier ru-RU at 480 dpi page typicalScene seed 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier089', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier089 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0510
     * @tc.name    JsQualifier090
     * @tc.desc    Qualifier zh-CN at 120 dpi page diversion seed 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier090', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier090 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0511
     * @tc.name    JsQualifier091
     * @tc.desc    Qualifier en-US at 160 dpi page repeat seed 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier091', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier091 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0512
     * @tc.name    JsQualifier092
     * @tc.desc    Qualifier ar-EG at 200 dpi page indentation seed 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier092', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier092 done');
    });
}

function ResourceQualifierPart024() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0513
     * @tc.name    JsQualifier093
     * @tc.desc    Qualifier he-IL at 240 dpi page banner seed 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier093', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier093 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0514
     * @tc.name    JsQualifier094
     * @tc.desc    Qualifier fr-FR at 280 dpi page gridRow seed 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier094', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier094 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0515
     * @tc.name    JsQualifier095
     * @tc.desc    Qualifier ja-JP at 320 dpi page mediaQuery seed 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier095', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier095 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0516
     * @tc.name    JsQualifier096
     * @tc.desc    Qualifier ur-PK at 360 dpi page index seed 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier096', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier096 done');
    });
}

function ResourceQualifierPart025() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0517
     * @tc.name    JsQualifier097
     * @tc.desc    Qualifier fa-IR at 400 dpi page atomicLayout seed 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier097', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier097 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0518
     * @tc.name    JsQualifier098
     * @tc.desc    Qualifier de-DE at 440 dpi page equipartition seed 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier098', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier098 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0519
     * @tc.name    JsQualifier099
     * @tc.desc    Qualifier ru-RU at 480 dpi page extension seed 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier099', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier099 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0520
     * @tc.name    JsQualifier100
     * @tc.desc    Qualifier zh-CN at 120 dpi page resource seed 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier100', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier100 done');
    });
}

function ResourceQualifierPart026() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0521
     * @tc.name    JsQualifier101
     * @tc.desc    Qualifier en-US at 160 dpi page typicalScene seed 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier101', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier101 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0522
     * @tc.name    JsQualifier102
     * @tc.desc    Qualifier ar-EG at 200 dpi page diversion seed 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier102', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier102 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0523
     * @tc.name    JsQualifier103
     * @tc.desc    Qualifier he-IL at 240 dpi page repeat seed 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier103', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier103 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0524
     * @tc.name    JsQualifier104
     * @tc.desc    Qualifier fr-FR at 280 dpi page indentation seed 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier104', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier104 done');
    });
}

function ResourceQualifierPart027() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0525
     * @tc.name    JsQualifier105
     * @tc.desc    Qualifier ja-JP at 320 dpi page banner seed 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier105', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier105 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0526
     * @tc.name    JsQualifier106
     * @tc.desc    Qualifier ur-PK at 360 dpi page gridRow seed 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier106', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier106 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0527
     * @tc.name    JsQualifier107
     * @tc.desc    Qualifier fa-IR at 400 dpi page mediaQuery seed 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier107', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier107 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0528
     * @tc.name    JsQualifier108
     * @tc.desc    Qualifier de-DE at 440 dpi page index seed 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier108', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier108 done');
    });
}

function ResourceQualifierPart028() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0529
     * @tc.name    JsQualifier109
     * @tc.desc    Qualifier ru-RU at 480 dpi page atomicLayout seed 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier109', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier109 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0530
     * @tc.name    JsQualifier110
     * @tc.desc    Qualifier zh-CN at 120 dpi page equipartition seed 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier110', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier110 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0531
     * @tc.name    JsQualifier111
     * @tc.desc    Qualifier en-US at 160 dpi page extension seed 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier111', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier111 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0532
     * @tc.name    JsQualifier112
     * @tc.desc    Qualifier ar-EG at 200 dpi page resource seed 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier112', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier112 done');
    });
}

function ResourceQualifierPart029() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0533
     * @tc.name    JsQualifier113
     * @tc.desc    Qualifier he-IL at 240 dpi page typicalScene seed 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier113', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier113 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0534
     * @tc.name    JsQualifier114
     * @tc.desc    Qualifier fr-FR at 280 dpi page diversion seed 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier114', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier114 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0535
     * @tc.name    JsQualifier115
     * @tc.desc    Qualifier ja-JP at 320 dpi page repeat seed 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier115', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier115 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0536
     * @tc.name    JsQualifier116
     * @tc.desc    Qualifier ur-PK at 360 dpi page indentation seed 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier116', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier116 done');
    });
}

function ResourceQualifierPart030() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0537
     * @tc.name    JsQualifier117
     * @tc.desc    Qualifier fa-IR at 400 dpi page banner seed 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier117', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier117 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0538
     * @tc.name    JsQualifier118
     * @tc.desc    Qualifier de-DE at 440 dpi page gridRow seed 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier118', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier118 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0539
     * @tc.name    JsQualifier119
     * @tc.desc    Qualifier ru-RU at 480 dpi page mediaQuery seed 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier119', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier119 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0540
     * @tc.name    JsQualifier120
     * @tc.desc    Qualifier zh-CN at 120 dpi page index seed 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier120', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier120 done');
    });
}

function ResourceQualifierPart031() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0541
     * @tc.name    JsQualifier121
     * @tc.desc    Qualifier en-US at 160 dpi page atomicLayout seed 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier121', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier121 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0542
     * @tc.name    JsQualifier122
     * @tc.desc    Qualifier ar-EG at 200 dpi page equipartition seed 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier122', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier122 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0543
     * @tc.name    JsQualifier123
     * @tc.desc    Qualifier he-IL at 240 dpi page extension seed 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier123', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier123 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0544
     * @tc.name    JsQualifier124
     * @tc.desc    Qualifier fr-FR at 280 dpi page resource seed 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier124', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier124 done');
    });
}

function ResourceQualifierPart032() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0545
     * @tc.name    JsQualifier125
     * @tc.desc    Qualifier ja-JP at 320 dpi page typicalScene seed 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier125', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier125 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0546
     * @tc.name    JsQualifier126
     * @tc.desc    Qualifier ur-PK at 360 dpi page diversion seed 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier126', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier126 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0547
     * @tc.name    JsQualifier127
     * @tc.desc    Qualifier fa-IR at 400 dpi page repeat seed 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier127', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier127 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0548
     * @tc.name    JsQualifier128
     * @tc.desc    Qualifier de-DE at 440 dpi page indentation seed 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier128', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier128 done');
    });
}

function ResourceQualifierPart033() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0549
     * @tc.name    JsQualifier129
     * @tc.desc    Qualifier ru-RU at 480 dpi page banner seed 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier129', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('banner')).assertEqual('app.string.banner');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier129 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0550
     * @tc.name    JsQualifier130
     * @tc.desc    Qualifier zh-CN at 120 dpi page gridRow seed 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier130', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('gridRow')).assertEqual('app.string.gridRow');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier130 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0551
     * @tc.name    JsQualifier131
     * @tc.desc    Qualifier en-US at 160 dpi page mediaQuery seed 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier131', 0, async function () {
      await yieldThread();
      const tag = 'en-US';
      const dpi = 160;
      expect(model.langOf(tag)).assertEqual('en');
      expect(model.isRtl('en')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('mdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('en-mdpi');
      expect(model.routeKeyOf('mediaQuery')).assertEqual('app.string.mediaQuery');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier131 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0552
     * @tc.name    JsQualifier132
     * @tc.desc    Qualifier ar-EG at 200 dpi page index seed 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier132', 0, async function () {
      await yieldThread();
      const tag = 'ar-EG';
      const dpi = 200;
      expect(model.langOf(tag)).assertEqual('ar');
      expect(model.isRtl('ar')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ar-hdpi');
      expect(model.routeKeyOf('index')).assertEqual('app.string.index');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier132 done');
    });
}

function ResourceQualifierPart034() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0553
     * @tc.name    JsQualifier133
     * @tc.desc    Qualifier he-IL at 240 dpi page atomicLayout seed 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier133', 0, async function () {
      await yieldThread();
      const tag = 'he-IL';
      const dpi = 240;
      expect(model.langOf(tag)).assertEqual('he');
      expect(model.isRtl('he')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('hdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('he-hdpi');
      expect(model.routeKeyOf('atomicLayout')).assertEqual('app.string.atomicLayout');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier133 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0554
     * @tc.name    JsQualifier134
     * @tc.desc    Qualifier fr-FR at 280 dpi page equipartition seed 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier134', 0, async function () {
      await yieldThread();
      const tag = 'fr-FR';
      const dpi = 280;
      expect(model.langOf(tag)).assertEqual('fr');
      expect(model.isRtl('fr')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fr-xhdpi');
      expect(model.routeKeyOf('equipartition')).assertEqual('app.string.equipartition');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier134 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0555
     * @tc.name    JsQualifier135
     * @tc.desc    Qualifier ja-JP at 320 dpi page extension seed 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier135', 0, async function () {
      await yieldThread();
      const tag = 'ja-JP';
      const dpi = 320;
      expect(model.langOf(tag)).assertEqual('ja');
      expect(model.isRtl('ja')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ja-xhdpi');
      expect(model.routeKeyOf('extension')).assertEqual('app.string.extension');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier135 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0556
     * @tc.name    JsQualifier136
     * @tc.desc    Qualifier ur-PK at 360 dpi page resource seed 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier136', 0, async function () {
      await yieldThread();
      const tag = 'ur-PK';
      const dpi = 360;
      expect(model.langOf(tag)).assertEqual('ur');
      expect(model.isRtl('ur')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ur-xxhdpi');
      expect(model.routeKeyOf('resource')).assertEqual('app.string.resource');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier136 done');
    });
}

function ResourceQualifierPart035() {
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0557
     * @tc.name    JsQualifier137
     * @tc.desc    Qualifier fa-IR at 400 dpi page typicalScene seed 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier137', 0, async function () {
      await yieldThread();
      const tag = 'fa-IR';
      const dpi = 400;
      expect(model.langOf(tag)).assertEqual('fa');
      expect(model.isRtl('fa')).assertEqual(true);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('fa-xxhdpi');
      expect(model.routeKeyOf('typicalScene')).assertEqual('app.string.typicalScene');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier137 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0558
     * @tc.name    JsQualifier138
     * @tc.desc    Qualifier de-DE at 440 dpi page diversion seed 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier138', 0, async function () {
      await yieldThread();
      const tag = 'de-DE';
      const dpi = 440;
      expect(model.langOf(tag)).assertEqual('de');
      expect(model.isRtl('de')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('de-xxhdpi');
      expect(model.routeKeyOf('diversion')).assertEqual('app.string.diversion');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier138 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0559
     * @tc.name    JsQualifier139
     * @tc.desc    Qualifier ru-RU at 480 dpi page repeat seed 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier139', 0, async function () {
      await yieldThread();
      const tag = 'ru-RU';
      const dpi = 480;
      expect(model.langOf(tag)).assertEqual('ru');
      expect(model.isRtl('ru')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('xxhdpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('ru-xxhdpi');
      expect(model.routeKeyOf('repeat')).assertEqual('app.string.repeat');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier139 done');
    });
    /**
     * @tc.number  SUB_MULTIDEVICE_JSADAPTIVE_0560
     * @tc.name    JsQualifier140
     * @tc.desc    Qualifier zh-CN at 120 dpi page indentation seed 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('JsQualifier140', 0, async function () {
      await yieldThread();
      const tag = 'zh-CN';
      const dpi = 120;
      expect(model.langOf(tag)).assertEqual('zh');
      expect(model.isRtl('zh')).assertEqual(false);
      expect(model.densityBucket(dpi)).assertEqual('ldpi');
      expect(model.qualifierOf(tag, dpi)).assertEqual('zh-ldpi');
      expect(model.routeKeyOf('indentation')).assertEqual('app.string.indentation');
      hilog.info(DOMAIN, TAG, '%{public}s', 'JsQualifier140 done');
    });
}

function ResourceQualifierGroup001() {
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
  ResourceQualifierPart020();
  ResourceQualifierPart021();
  ResourceQualifierPart022();
  ResourceQualifierPart023();
  ResourceQualifierPart024();
  ResourceQualifierPart025();
  ResourceQualifierPart026();
  ResourceQualifierPart027();
  ResourceQualifierPart028();
  ResourceQualifierPart029();
  ResourceQualifierPart030();
  ResourceQualifierPart031();
  ResourceQualifierPart032();
  ResourceQualifierPart033();
  ResourceQualifierPart034();
  ResourceQualifierPart035();
}

export default function resourceQualifierSuite() {
  describe('ResourceQualifierSuite', function () {
    ResourceQualifierGroup001();
  });
}
